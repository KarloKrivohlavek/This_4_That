import 'package:flutter/material.dart';

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
