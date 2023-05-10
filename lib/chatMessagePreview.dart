import 'package:flutter/material.dart';

class MessagePreview extends StatelessWidget {
  const MessagePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // margin: EdgeInsets.only(right: 60),
                  width: 120,
                  height: 130,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/mouse.jpg'),
                            ),
                          ),
                          width: 48,
                          height: 48,
                        ),
                      ),
                      Positioned(
                        left: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/wallet.jpg'),
                            ),
                          ),
                          width: 64,
                          height: 64,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: Container(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'images/logo.png',
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          width: 24,
                          height: 24,
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // margin: EdgeInsets.only(left: 110, top: 15),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Stolna Lampa',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('Username'),
                          Text(
                            'Nova Poruka',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('12:30'),
                      Container(
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
          )
        ],
      ),
    );
  }
}
