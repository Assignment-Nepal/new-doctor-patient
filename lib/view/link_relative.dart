//@dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_patient/models/jagaMe.dart';
import 'package:doctor_patient/widgets/app_default.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'my__bottom_nav_bar.dart';



class LinkRelative extends StatefulWidget {
  @override
  _LinkRelativeState createState() => _LinkRelativeState();
}

class _LinkRelativeState extends State<LinkRelative> {

  bool relativesFound = true;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: ROROAppBar(),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance
      //         .collection('profile')
      //         .doc(userId)
      //         .collection('relatives')
      //         .snapshots(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         List<Widget> relativeCards = [];
      //         var data = snapshot.data.docs;
      //         if (data != null) {
      //           if (data.length > 0) relativesFound = true;
      //           userProfile.getAllRelatives(data);
      //           for (var relative in userProfile.relatives) {
      //             relativeCards.add(LinkCard(
      //               relative: relative,
      //               userID: userId,
      //               documentID: relative.documentID,
      //               data: relative.toMap(),
      //               recipients: [relative.phoneNumber],
      //             ));
      //           }
      //           return ListView(
      //             children: <Widget>[
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Text(
      //                   'Link Relatives',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(fontSize: 25),
      //                 ),
      //               ),
      //               Column(
      //                 children: relativeCards,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Text(
      //                     'Showing linked here does not mean that your accounts are linked . Please make sure that relative account is linked using the code sent . '),
      //               )
      //             ],
      //           );
      //         } else {
      //           relativesFound = false;
      //           return Center(
      //             child: Text('No relative Added.'),
      //           );
      //         }
      //       } else
      //         return CircularProgressIndicator();
      //     }),
      body: Container(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class LinkCard extends StatelessWidget {
  const LinkCard({
    Key key,
    @required this.relative,
    this.userID,
    this.documentID,
    this.data,
    this.recipients,
  }) : super(key: key);

  final Relative relative;
  final String userID, documentID;
  final Map<String, dynamic> data;

  final List<String> recipients;

  @override
  Widget build(BuildContext context) {
    String buttonText = 'Link';
    Color buttonColor = Colors.orangeAccent;
    bool linked = false;
    if (relative.uid == '' || relative.uid.isEmpty || relative.uid == null) {
      linked = false;
    } else {
      linked = true;
      buttonColor = Colors.blueGrey;
      buttonText = 'Linked';
    }
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(8),
        child: ListTile(
            title: Text(relative.name),
            subtitle: Text(relative.phoneNumber),
            trailing: ElevatedButton.icon(
                onPressed: !linked
                    ? () async {
                  data['uid'] = userID;

                  recipients.add(relative.phoneNumber);
                  await _sendSMS(
                      'Message from RORO : Please copy the below code to link your account.\n'
                          'Code : ' +
                          userID,
                      recipients);
                  await FirebaseFirestore.instance
                      .collection('profile')
                      .doc(userID)
                      .collection('relatives')
                      .doc(documentID)
                      .update(data);
                }
                    : () async {
                  data['uid'] = '';
                  await FirebaseFirestore.instance
                      .collection('profile')
                      .doc(userID)
                      .collection('relatives')
                      .doc(documentID)
                      .update(data);
                },
                style: TextButton.styleFrom(
                  primary: Color(0xffff9987),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )))
    );
  }

  _sendSMS(String message, List<String> recipients) async {
    String _result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });

    print(_result);
  }
}
