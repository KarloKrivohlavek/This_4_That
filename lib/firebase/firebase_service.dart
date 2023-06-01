import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:this_4_that/services/logger_service.dart';
import 'package:this_4_that/services/storage_service.dart';

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
    }
  }
}
