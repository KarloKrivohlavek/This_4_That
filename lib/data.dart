import 'package:this_4_that/swappable_item.dart';
import 'package:this_4_that/swappablePage.dart';
import 'package:this_4_that/user.dart';

int globalCurrentIndex = 0;

List<SwapItem> currentUserItems = [
  SwapItem(
    title: 'Title 1',
    subtitle: 'Subtitle 1',
    description:
        'Računalni miš je uređaj koji se koristi za upravljanje kursorom na računalnom zaslonu. On se sastoji od tijela koje se drži u ruci, gumba za lijevi i desni klik, te kotačića za pomicanje po stranicama.',
    location: 'Zagreb',
    age: '3',
    condition: 'Skoro novo',
    userName: 'Dragoje3',
    userProfilePicture: 'images/covjek.jpg',
    image: 'images/mouse.jpg',
    rating: 4.0,
    imagesURLs: ['images/mouse.jpg'],
    userID: 'mojuserID',
    itemID: 'mojItemID',
    isArchived: true,
  ),
  SwapItem(
    title: 'Novacnik',
    subtitle: 'Subtitle 1',
    description: 'Kozni novcanik koji svi vole',
    location: 'Osijek',
    age: '5',
    condition: 'Skoro novo',
    userName: 'Dragoje3',
    userProfilePicture: 'images/covjek.jpg',
    image: 'images/mouse.jpg',
    rating: 4.0,
    imagesURLs: ['images/wallet.jpg'],
    userID: 'mojuserID',
    itemID: 'mojItemID',
  ),
];

final List<SwappablePage> cardsElements = [
  SwappablePage(
    item: SwapItem(
      title: 'Racunalni mis',
      subtitle: 'Subtitle 1',
      description:
          'Računalni miš je uređaj koji se koristi za upravljanje kursorom na računalnom zaslonu. On se sastoji od tijela koje se drži u ruci, gumba za lijevi i desni klik, te kotačića za pomicanje po stranicama.',
      location: 'Zagreb',
      age: '3',
      condition: 'Skoro novo',
      userName: 'Dragoje3',
      userProfilePicture: 'images/covjek.jpg',
      image: 'images/mouse.jpg',
      rating: 4.0,
      imagesURLs: ['images/mouse.jpg'],
      userID: 'KOrisniMario',
      itemID: 'kofeajfp9394jfwgwo',
    ),
  ),
  SwappablePage(
    item: SwapItem(
      title: 'Novcanik',
      subtitle: 'Subtitle 2',
      description:
          'Kozni novcanik kupljen prije par mjeseci ne svida mi se pa ga mijenjam',
      location: 'Zagreb',
      age: '3',
      condition: 'Neotvoreno',
      userName: 'BeroHrvat',
      userProfilePicture: 'images/covjek.jpg',
      image: 'images/wallet.jpg',
      rating: 2.0,
      imagesURLs: ['images/watch.jpg', 'images/wallet.jpg'],
      userID: 'PeroPeric222',
      itemID: 'jifjaeoig032432jf',
    ),
  ),
  SwappablePage(
    item: SwapItem(
      title: 'Smedi novcanik nov,',
      subtitle: 'Subtitle 3',
      description: ' nikada koristen ima tri crtice na sebi',
      location: 'Beli Dol',
      age: '4',
      condition: 'Jako koristeno',
      userName: 'Dragi iz Belog Dola',
      userProfilePicture: 'images/covjek.jpg',
      image: 'images/watch.jpg',
      rating: 5.0,
      imagesURLs: [
        'images/novcanik1.jpg',
        'images/novcanik2.jpg',
        'images/novcanik3.jpg'
      ],
      userID: 'Bebinjo123',
      itemID: '23ojpjioidvs0909',
    ),
  )
];

User currentUser = User(
    imagePath: 'images/covjek.jpg',
    name: 'Korisnik 1',
    email: 'korisnik@mail.com',
    about: 'Ovo je moj profil',
    isDarkMode: false);
