import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shadow_overlay/shadow_overlay.dart';
import 'package:this_4_that/chat_page.dart';
import 'package:this_4_that/add_item_page.dart';
import 'package:this_4_that/profile_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomePage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgList = [
    'images/novcanik1.jpg',
    'images/novcanik2.jpg',
    'images/novcanik3.jpg',
    'images/novcanik4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: Icon(MdiIcons.close),
          ),
          SizedBox(
            width: 60,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            child: Icon(MdiIcons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: ItemPicker(),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Icon(Icons.settings),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Container(
                            height: 300,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Image.asset(
                                  imgList[index],
                                  fit: BoxFit.fill,
                                );
                              },
                              itemCount: imgList.length,
                              viewportFraction: 0.8,
                              scale: 0.9,
                              pagination: SwiperPagination(
                                alignment: Alignment.topCenter,
                              ),
                              control: SwiperControl(),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Muski Novcanik',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin),
                                      Text(
                                        'Zagreb',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.cake),
                                      Text(
                                        '3 godine',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.search),
                                      Text(
                                        'Rabljeno s tragovima koristenja',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'O predmetu',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: Text(
                                          'Kupi sam nedavno novi pa mi ovaj samo stoji u sobi nekoristen. Par ogrebotina ali nista poseobno',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Tko mijenja?',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('images/covjek.jpg'),
                                  )),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Ivica',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPicker extends StatelessWidget {
  const ItemPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Wrap(
                spacing: 40,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(10),
                        child: Image.asset('images/mouse.jpg'),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        width: 50,
                        height: 100,
                        margin: EdgeInsets.all(10),
                        child: Image.asset('images/lamp.jpg'),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Text('Primjeni')),
                          // width: MediaQuery.of(context).size.width *
                          //     0.8,
                        ),
                      ),
                    ],
                  )
                ],
              );
            });
      },
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              'images/mouse.jpg',
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Logitech Mis',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class ItemPreviewImage extends StatelessWidget {
  const ItemPreviewImage({required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ShadowOverlay(
        shadowWidth: MediaQuery.of(context).size.width,
        shadowHeight: MediaQuery.of(context).size.height * 0.1,
        child: Image.asset(imagePath),
      ),
    );
  }
}
