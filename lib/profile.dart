import 'package:flutter/material.dart';
import 'package:5_B_GYM/utilities/constant.dart';

class ShowProfile extends StatelessWidget {
  const ShowProfile({super.key});

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
        backgroundColor: kColor,
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
                          Text('Stewart S', style: kTextSytle4),
                          Text('220711816', style: kTextStyle5),
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
                    Container(
                      child: Column(
                        children: [
                          Text('4', style: kTextStyle3),
                          Text('Posts', style: kTextStyle3),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('3', style: kTextStyle3),
                          Text('Followers', style: kTextStyle3),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('10', style: kTextStyle3),
                          Text('Following', style: kTextStyle3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kSizeBox,
              IsiShowProfile()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text('kembali'),
          icon: const Icon(Icons.arrow_back),
          backgroundColor: Colors.teal,
        )),
    );
  }
}