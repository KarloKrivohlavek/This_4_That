import 'package:this_4_that/swappable_item.dart';
import 'package:this_4_that/swappablePage.dart';
import 'package:this_4_that/user.dart';

final List<SwappablePage> cardsElements = [
  SwappablePage(
    item: SwapItem(
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
    ),
  ),
  SwappablePage(
    item: SwapItem(
      title: 'Title 2',
      subtitle: 'Subtitle 2',
      description: 'Description 2',
      location: 'Karlovac',
      age: '3',
      condition: 'Neotvoreno',
      userName: 'BeroHrvat',
      userProfilePicture: 'images/covjek.jpg',
      image: 'images/wallet.jpg',
      rating: 2.0,
      imagesURLs: ['images/watch.jpg', 'images/wallet.jpg'],
    ),
  ),
  SwappablePage(
    item: SwapItem(
      title: 'Title 3',
      subtitle: 'Subtitle 3',
      description: 'Description 3',
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
    ),
  )
];

User currentUser = User(
    imagePath: 'images/covjek.jpg',
    name: 'Korisnik 1',
    email: 'korisnik@mail.com',
    about: 'Ovo je moj profil',
    isDarkMode: false);
