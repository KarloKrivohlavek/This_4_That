import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:this_4_that/authentification_screens/authentification_screen_2_name_surname.dart';
import 'package:this_4_that/constants/colors.dart';
import 'package:this_4_that/models/item/item.dart';
import 'package:this_4_that/models/match/match.dart';
import 'package:this_4_that/models/matchedChatData/matched_chat_data.dart';
import 'package:this_4_that/models/message/message.dart';
import 'package:this_4_that/pages.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/services/storage_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/user/user.dart';

class FirebaseService extends GetxService {
// instance potrebnih servisa:
  static final instance = Get.find<FirebaseService>();

  final logger = Get.find<LoggerService>();
  final storageService = Get.find<StorageService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

// firebaseAuth - služi za dohvaćanje svih metoda  i varijabli vezanih uz autentifikaciju:

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// firebaseFirestore - služi za dohvaćanje svih metoda vezanih uz stavljanje i slanje podataka na bazu

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// firebaseStorage - služi za dohvaćanje svih metoda vezanih uz stavljanje i slanje slika u storage
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

// collections
  String users = 'users';
  String items = 'items';
  String matches = 'matches';
  String chats = 'chats';
  String messages = 'messages';

  ///  FUNCTION: get Google credential
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow

    try {
// ovo je metoda koja se poziva iz google_sign_in paketa
      final googleUser = await GoogleSignIn().signIn();

      // ovdje možeš vidjeti kako izgledaju googleUser podaci i što sve                         možeš dobiti preko njih
      logger.w('Google user : ------------------ $googleUser');

      // ako su vraćeni podaci null, nije uspio sign in pa se automatski izlazi iz funkcije
      if (googleUser == null) {
        return;
      }

      // ako povratni podaci nisu null, dohvaćamo podatke vezane uz autentifikaciju (među njima su i potrebni tokeni)

      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;
      Get.dialog(const SpinKitChasingDots(
        color: MyColors.orange,
      ));

// preko ove funkcije šaljemo tokene za google i povratno dobivamo user credentials

      // Create a new credential
      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // ispis svih dobivenih credentialsa

      logger.w('googleAuthCredential: $googleAuthCredential');

// ako su tokeni null nije uspio sign in (nešto nije u redu s credentialsima), vrati se iz funkcije

      if (googleAuthCredential.idToken == null ||
          googleAuthCredential.accessToken == null) {
        // MySnackbars.showErrorSnackbar(
        //     message: 'Something went wrong with social signIn');
        Get.snackbar(
            'Error', 'Nešto je pošlo po krivu pri autentifikaciji korisnika');
// ovo je custom snackbar, defaultni možeš napraviti s Get.snackbar
        return;
      }
      // sad se preko Firebase funkcije user spaja na danu bazu, njegov google mail se registrira na firebase auth

      final userCredential =
          await firebaseAuth.signInWithCredential(googleAuthCredential);

// u storage od uređaja spremamo podatke kao key - value:
//           {isLoggedIn : true; socialPlatform : ‘google’
//           ;}

// isLoggedIn služi za usmjeravanje usera prilikom otvaranja aplikacije, ako je user već logged in onda ga pošalji na HomeScreen, inače na signUp screen

// social platform da se zna preko koje se platforme user prijavio i s koje platforme ga treba sign outati prilikom sign out

      await storageService.insertValue(key: 'isLoggedIn', value: true);
      await storageService.insertValue(key: 'socialPlatform', value: 'google');

// ova funkcija provjerava postoji li ovaj user u bazi, ako ne postoji onda stvara novog usera

      await checkIfNewUser(userCredential);
    }
// ovaj dio hvata exceptionse, ako se dogodio neki onda pokaži snackbar i koji se error dogodio

    on PlatformException catch (e) {
      logger.e('signInWithGoogle error: $e');
      Future.delayed(const Duration(milliseconds: 500), () {
        // MySnackbars.showErrorSnackbar(
        //
        // message: 'Google SignIn failed! Error: ${e.code}');
        Get.snackbar('Greška', 'Google Sign In nije uspio ${e.code}');
      });
    } catch (e) {
// svaki error koji nije vezan uz google
      logger.wtf('signInWithGoogle error: $e');
    }
  }

  /// If this is new user, create new document in 'users' collection
  Future<void> checkIfNewUser(UserCredential userCredential) async {
    try {
      if (await firebaseFirestore
          .collection(users)
          .doc(userCredential.user?.uid)
          .get()
          .then((snapshot) => !snapshot.exists)) {
        await firebaseFirestore
            .collection(users)
            .doc(userCredential.user?.uid)
            .set({
          'user_ID': userCredential.user?.uid,
        });
        Get.off(() => AuthentificationScreen2NameSurname());
      } else {
        Get.offAllNamed(MyRoutes.mainPageScreen);
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar('Eroooorr', 'Salje provjeru checkIfnewUser');
    }
  }

  Future<void> sendNewUserData(UserData user) async {
    try {
      await firebaseFirestore
          .collection(users)
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(user.toJson());
    } catch (e) {
      logger.e(e);
      Get.snackbar('Error', 'Dogodila se greska priliko slanja NewUserDate');
    }
  }

  Future<String> sendNewItemData(Item item) async {
    String itemID = '';
    unawaited(Get.dialog(const SpinKitChasingDots(
      color: MyColors.orange,
    )));
    try {
      await firebaseFirestore
          .collection(items)
          .add(item.toJson())
          .then((itemRef) {
        firebaseFirestore.collection(items).doc(itemRef.id).update({
          'item_ID': itemRef.id,
        });
        itemID = itemRef.id;
      });
      Get.back();
    } catch (e) {
      logger.e(e);
      Get.snackbar(
          'Error', 'Dogodila se greska prilikom slanja nove Item Datae');
      Get.back();
    }

    return itemID;
  }

  Future<void> sendNewMessage(Message newMessage, String chatID) async {
    try {
      await FirebaseService.instance.firebaseFirestore
          .collection('chats')
          .doc(chatID)
          .collection('messages')
          .add(newMessage.toJson());
    } catch (e) {
      logger.e(e);
      Get.snackbar('Error', 'Dogodila se greska prilikom slanja nove poruke');
    }
  }

  Future<String?> sendNewMatchData(MatchedItems match) async {
    String matchID = '';
    try {
      await firebaseFirestore
          .collection(matches)
          .add(match.toJson())
          .then((matchRef) {
        firebaseFirestore.collection(matches).doc(matchRef.id).update({
          'match_ID': matchRef.id,
        });
        matchID = matchRef.id;
      });
      return matchID;
    } catch (e) {
      logger.e(e);
      Get.snackbar(
          'Error', 'Dogodila se greska prilikom slanja nove match date');
    }
    return null;
  }

  Future<String> createNewChat(MatchedChatData match) async {
    String chatID = '';
    try {
      //kreaira novi chat i dodaje mu chatID
      await firebaseFirestore
          .collection(chats)
          .add(match.toJson())
          .then((matchRef) {
        firebaseFirestore.collection(chats).doc(matchRef.id).update({
          'chat_ID': matchRef.id,
        });
        chatID = matchRef.id;
      });
      //kreiranje default poruke
      final defaultMessage = Message(
          senderID: 'default',
          text: 'Započni s razmjenom!',
          createdAt: DateTime.now().millisecondsSinceEpoch);
      //kreairamo kolekciju messages unutar kolekcija chats
      firebaseFirestore
          .collection(chats)
          .doc(chatID)
          .collection(messages)
          .add(defaultMessage.toJson());
    } catch (e) {
      logger.e(e);
    }
    return chatID;
  }

  Future<String> uploadItemPictures(File file, String itemId) async {
    var imageUrl = '';
    final name = file.path.split('/').last;
    final timeStamp = DateTime.now().toUtc().millisecondsSinceEpoch;
    final userID = FirebaseAuth.instance.currentUser?.uid ?? 'default';

    try {
// Upload to Firebase Storage
      await firebaseStorage
          .ref('items/$userID/$itemId/${timeStamp}_$name')
          .putFile(file)
          .then((image) async {
        final pictureUrl = await image.ref.getDownloadURL();

        imageUrl = pictureUrl;
      });
    } on FirebaseAuthException {
      imageUrl = '';
    }
    return imageUrl;
  }

  Future<String> uploadProfilePicture(File file) async {
    var imageUrl = '';
    final name = file.path.split('/').last;
    final timeStamp = DateTime.now().toUtc().millisecondsSinceEpoch;
    final userID = FirebaseAuth.instance.currentUser?.uid ?? 'default';

    try {
// Upload to Firebase Storage
      await firebaseStorage
          .ref('users/$userID/${timeStamp}_$name')
          .putFile(file)
          .then((image) async {
        final pictureUrl = await image.ref.getDownloadURL();

        imageUrl = pictureUrl;
      });
    } on FirebaseAuthException {
      imageUrl = '';
    }
    return imageUrl;
  }

  Future<void> updateItemData(Map<String, Object?> data, String itemId) async {
    try {
      await firebaseFirestore.collection(items).doc(itemId).update(data);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> updateUserData(Map<String, Object?> data) async {
    try {
      await firebaseFirestore
          .collection(users)
          .doc(firebaseAuth.currentUser?.uid)
          .update(data);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> updateUserDataMatchedList(String data) async {
    try {
      await firebaseFirestore
          .collection(users)
          .doc(firebaseAuth.currentUser?.uid)
          .update({
        'matched_item_list_IDs': FieldValue.arrayUnion([data])
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<bool> doesUserDataHaveAName() async {
    bool userHasAName = false;
    await firebaseFirestore
        .collection('users')
        .where('user_ID', isEqualTo: firebaseAuth.currentUser?.uid)
        .get()
        .then((value) =>
            userHasAName = value.docs.first.data().containsKey('full_name'));
    return userHasAName;
  }

  /// FUNCTION: get all Items from Firebase
  Future<List<Item>?> getAllItems() async {
    try {
      List<Item> itemList = <Item>[];

      itemList = await FirebaseFirestore.instance
          .collection('items')
          .get()
          .then((value) =>
              value.docs.map((e) => Item.fromJson(e.data())).toList());
      logger.wtf(itemList);
      return itemList.toSet().toList();
    }
// remove duplicates before sending a list (two litters can have the same therapy)

    catch (e) {
      const SnackBar(content: Text('Error with getting all items'));
    }
    return null;
  }

  Future<void> deleteMatchedItemsFromDifferentUsers(String itemID) async {
    try {
      List<UserData> matchedUsersList = <UserData>[];

      matchedUsersList = await firebaseFirestore
          .collection('users')
          .where('matched_item_list_IDs', arrayContains: itemID)
          .get()
          .then((value) =>
              value.docs.map((e) => UserData.fromJson(e.data())).toList());
      for (final user in matchedUsersList) {
        firebaseFirestore.collection('users').doc(user.userID).update({
          'matched_item_list_IDs': FieldValue.arrayRemove([itemID])
        });
      }
      logger.wtf(matchedUsersList);
    }
// remove duplicates before sending a list (two litters can have the same therapy)

    catch (e) {
      const SnackBar(content: Text('Error with getting all items'));
    }
  }

  Future<void> deleteItemImagesFromStorage(String URL) async {
    if (URL.isNotEmpty) {
      try {
        await firebaseStorage.refFromURL(URL).delete();
      } catch (e) {
        print(e);
      }
    }
  }

  Future<UserData> getDifferentUserData(String userID) async {
    final differentUserData = await firebaseFirestore
        .collection('users')
        .where('user_ID', isEqualTo: userID)
        .get()
        .then((value) => UserData.fromJson(value.docs.first.data()));
    return differentUserData;
  }

  Future<List<MatchedItems>> getUsersMatches() async {
    final userMatch = await firebaseFirestore
        .collection('matches')
        .where(Filter.or(
            Filter('user1_ID', isEqualTo: firebaseAuth.currentUser?.uid),
            Filter('user2_ID', isEqualTo: firebaseAuth.currentUser?.uid)))
        .get()
        .then((value) =>
            value.docs.map((e) => MatchedItems.fromJson(e.data())).toList());
    List<MatchedItems> userMatchList = [];

    for (final matchedItem in userMatch) {
      bool firstItem = await doesItemExist(matchedItem.item1ID);
      bool secondItem = await doesItemExist(matchedItem.item2ID);
      bool isFirstUser = firebaseAuth.currentUser!.uid == matchedItem.user1ID;
      // provjeravamo jesmo li mi prvi ili drugi user i ako smo prvi user matchedItem se ne dodaje ali ako smo drugi user matchedItem se dodaje u listu
      if (isFirstUser == true && firstItem == true) {
        userMatchList.add(matchedItem);
      } else if (isFirstUser == false && secondItem == true) {
        userMatchList.add(matchedItem);
      } else if (firstItem == true && secondItem == true) {
        userMatchList.add(matchedItem);
      }
    }
    return userMatchList;
  }

  Future<void> logOut() async {
    await signOutFromGoogle();

    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      logger.e(e);
    }
  }

  Future<void> signOutFromGoogle() async {
    final socialPlatform = storageService.getString(key: 'socialPlatform');
    if (socialPlatform == 'google') {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.disconnect();
    }

    await storageService.deleteValue(key: 'socialPlatform');
    await storageService.deleteValue(key: 'isLoggedIn');
  }

  Future<UserData> getCurrentUserData() async {
    final currentUserData = await firebaseFirestore
        .collection('users')
        .where('user_ID', isEqualTo: firebaseAuth.currentUser?.uid)
        .get()
        .then((value) => UserData.fromJson(value.docs.first.data()));
    return currentUserData;
  }

  Future<Item> getItemData(String itemID) async {
    final itemData = await firebaseFirestore
        .collection('items')
        .doc(itemID)
        .get()
        .then((value) => Item.fromJson(value.data()!));
    return itemData;
  }

  Future<bool> doesItemExist(String itemID) async {
    final itemDocument =
        await firebaseFirestore.collection('items').doc(itemID).get();
    bool documentExists = itemDocument.exists;
    return documentExists;
  }

  Future<bool> doesMatchExist(String matchID) async {
    final matchDocument =
        await firebaseFirestore.collection('matches').doc(matchID).get();
    bool matchDocumentExists = matchDocument.exists;
    return matchDocumentExists;
  }

  Future<List<Item>> getCurrentUserItems() async {
    final currentUserItems = await firebaseFirestore
        .collection('items')
        .where('user_ID', isEqualTo: firebaseAuth.currentUser?.uid)
        .get()
        .then(
            (value) => value.docs.map((e) => Item.fromJson(e.data())).toList());
    return currentUserItems;
  }

  Future<List<Item>> getCurrentUserItemsActive() async {
    final currentUserItemsActive = await firebaseFirestore
        .collection('items')
        .where('user_ID', isEqualTo: firebaseAuth.currentUser?.uid)
        .where('item_state', isEqualTo: 'active')
        .get()
        .then(
            (value) => value.docs.map((e) => Item.fromJson(e.data())).toList());
    return currentUserItemsActive;
  }

  Future<void> deleteCurrentUserItems(String itemId) async {
    try {
      await firebaseFirestore.collection(items).doc(itemId).delete();
    } catch (e) {
      logger.e(e);
      Get.snackbar(
          'errooor', 'Nastala je greska priliko brisanja currentUserItemsa');
    }
  }

  Future<void> deleteMatchById(String matchID) async {
    try {
      await firebaseFirestore.collection(matches).doc(matchID).delete();
    } catch (e) {
      logger.e(e);
      Get.snackbar('errooor', 'Nastala je greska priliko brisanja ');
    }
  }

  Future<void> deleteAllMatchesWithItemID(String itemID) async {
    try {
      List<MatchedItems> matchesList = await firebaseFirestore
          .collection('matches')
          .get()
          .then((value) =>
              value.docs.map((e) => MatchedItems.fromJson(e.data())).toList());

      logger.e(matchesList);
      for (final match in matchesList) {
        logger.w(match);
        logger.e(itemID);
        if (match.item1ID == itemID || match.item2ID == itemID) {
          await deleteChatById(match.chatID);
          await deleteMatchById(match.matchID);
        }
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar('errooor', 'Nastala je greska priliko brisanja matcha');
    }
  }

  Future<void> deleteAllUserItems() async {
    try {
      List<Item> itemList = await firebaseFirestore
          .collection('items')
          .where('user_ID', isEqualTo: firebaseAuth.currentUser?.uid)
          .get()
          .then((value) =>
              value.docs.map((e) => Item.fromJson(e.data())).toList());

      for (final item in itemList) {
        if (item.itemPictureList != null) {
          for (final image in item.itemPictureList!) {
            await deleteItemImagesFromStorage(image);
          }
        }
        await deleteCurrentUserItems(item.itemID);
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar(
          'errooor', 'Nastala je greska priliko brisanja svih userovih itema');
    }
  }

  Future<void> deleteCurrentUserProfilePictureFromStorage() async {
    try {
      final userData = await getCurrentUserData();
      final profilePicture = userData.profilePicture;
      if (profilePicture != null) {
        if (profilePicture.isNotEmpty) {
          await firebaseStorage.refFromURL(profilePicture).delete();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUser() async {
    try {
      final userID = firebaseAuth.currentUser?.uid;

      await firebaseFirestore.collection(users).doc(userID).delete();
    } catch (e) {
      logger.e(e);
      Get.snackbar('errooor', 'Nastala je greska priliko brisanja Usera ');
    }
  }

  Future<void> deleteChatById(String chatID) async {
    try {
      final chatDocuments = await firebaseFirestore
          .collection(chats)
          .doc(chatID)
          .collection(messages)
          .get();
      final documents = chatDocuments.docs;
      for (final document in documents) {
        final chatReference = firebaseFirestore
            .collection(chats)
            .doc(chatID)
            .collection(messages)
            .doc(document.id);
        await firebaseFirestore.runTransaction(
            (transaction) async => transaction.delete(chatReference));
      }
      await firebaseFirestore.collection(chats).doc(chatID).delete();
    } catch (e) {
      logger.e(e);
      Get.snackbar('errooor', 'Nastala je greska priliko brisanja ');
    }
  }

  // Future<void> updateItemData(Map<String, Object?> data, String itemId) async {
  //   try {
  //     await firebaseFirestore.collection(items).doc(itemId).update(data);
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }

  Future<List<Item>> getDifferentUserItems() async {
    List<Item> currentUserItems = [];
    try {
      currentUserItems = await firebaseFirestore
          .collection('items')
          .where('user_ID', isNotEqualTo: firebaseAuth.currentUser?.uid)
          .where('item_state', isEqualTo: 'active')
          .get()
          .then((value) =>
              value.docs.map((e) => Item.fromJson(e.data())).toList());
    } catch (e) {
      logger.w(e);
      Get.snackbar('Eroor', 'Greska prilikom dohvacanja DifferentUserItema');
    }
    return currentUserItems;
  }

  Future<List<Item>> getFilteredItems(FilterItemsRequest request) async {
    List<Item> currentUserItems = [];
    try {
      currentUserItems = await firebaseFirestore
          .collection('items')
          .where(Filter.and(
            Filter("item_state", isEqualTo: "active"),
            Filter("price_range", arrayContainsAny: request.price_range),
            Filter("condition", arrayContainsAny: request.condition),
            Filter("category_list", arrayContainsAny: request.categories),
          ))
          .snapshots()
          .first
          .then((value) =>
              value.docs.map((e) => Item.fromJson(e.data())).toList());
    } catch (e) {
      logger.w(e);
      Get.snackbar('Eroor', 'Greska prilikom dohvacanja DifferentUserItema');
    }
    return currentUserItems;
  }
}

class FilterItemsRequest {
  final List<String> price_range;
  final List<String> condition;
  final List<String> categories;

  const FilterItemsRequest({
    required this.price_range,
    required this.condition,
    required this.categories,
  });
}
