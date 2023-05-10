import 'package:flutter/material.dart';

Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.orange,
    body: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.all(10),
                                    child: Image.asset('images/mouse.jpg'),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 100,
                                    margin: EdgeInsets.all(10),
                                    child: Image.asset('images/lamp.jpg'),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                              // Expanded(
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         child: Container(
                              //           width: 50,
                              //           height: 100,
                              //           margin: EdgeInsets.all(10),
                              //           child:
                              //               Image.asset('images/mouse.jpg'),
                              //           decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(20)),
                              //         ),
                              //       ),
                              //       Expanded(
                              //         child: Container(
                              //           width: 50,
                              //           height: 100,
                              //           margin: EdgeInsets.all(10),
                              //           child: Image.asset('images/lamp.jpg'),
                              //           decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(20)),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
                ),
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
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset('images/wallet.jpg')),
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
                            height: 30,
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
                              SizedBox(
                                height: 30,
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
                              SizedBox(
                                height: 30,
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
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          color: Colors.green,
                          child: Icon(Icons.check),
                        ),
                        Container(
                          width: 50,
                          color: Colors.green,
                          child: Icon(Icons.crop),
                        ),
                        // FloatingActionButton(
                        //   onPressed: () {},
                        //   backgroundColor: Colors.red,
                        //   child: Icon(Icons.delete),
                        // ),
                        // FloatingActionButton(
                        //   onPressed: () {},
                        //   backgroundColor: Colors.green,
                        //   child: Icon(Icons.check),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
