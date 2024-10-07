import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/constant.dart';

class profileView extends StatelessWidget {
  const profileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          leading: (
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            )
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    kSizeBox2,
                    CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/download.jpeg')),
                    kSizeBox2,
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User', style: kTextSytle4),
                          Text('@user92u38128y', style: kTextStyle5),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text('4', style: kTextStyle3),
                      SizedBox(width: 4), // Add spacing between text
                      Text('Posts', style: kTextStyle3),
                    ],
                  ),
                  Row(
                    children: [
                      Text('3', style: kTextStyle3),
                      SizedBox(width: 4), // Add spacing between text
                      Text('Followers', style: kTextStyle3),
                    ],
                  ),
                  Row(
                    children: [
                      Text('10', style: kTextStyle3),
                      SizedBox(width: 4), // Add spacing between text
                      Text('Following', style: kTextStyle3),
                    ],
                  ),
                ],
              ),
            ),
              kSizeBox,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text('kembali'),
          icon: const Icon(Icons.arrow_back),
          backgroundColor: const Color.fromARGB(255, 85, 0, 159),
        )),
    );
  }
}
