//@dart=2.9




import 'package:doctor_patient/main.dart';
import 'package:doctor_patient/view/home_page.dart';
import 'package:doctor_patient/view/link_relative.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
      child:
      ListView(
          children: <Widget>[
            Container(
              height: 50.0,
              color: Color(0xffe3f1f4),
            ),
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage("https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png/150",)),
            Text(
             'Hello there!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Mulish"),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(''),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ListTile(
                    leading: Icon(
                      Icons.favorite_outline_sharp,
                    ),
                    title: const Text('Invite JagaMe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "Mulish")),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LinkRelative()),
                        )),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                  ),
                  title: const Text('Sign Out',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Mulish")),
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RichAlertDialog(
                            alertTitle: richTitle("Log out from the App"),
                            alertSubtitle: richSubtitle('Are you sure? '),
                            alertType: RichAlertType.WARNING,
                            actions: <Widget>[
                              TextButton(
                                child: Text("Yes"),
                                onPressed: () async {
                                  ///To do add signOut
                                  // await authClass.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (builder) => MyApp()),
                                          (route) => false);
                                },
                              ),
                              TextButton(
                                child: Text("No"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            )
          ],
        )));
      }}


class ListButtons extends StatelessWidget {
  final String text;
  final icon;
  final onTap;

  ListButtons({this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
      child: InkWell(
        splashColor: Color(0xffBA6ABC3),
        onTap: onTap,
        focusColor: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            leading: Icon(
              icon,
              size: 25,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

class FormItem extends StatelessWidget {
  final String hintText;
  final String helperText;
  final Function onChanged;
  final bool isNumber;
  final IconData icon;
  final controller;

  FormItem(
      {this.hintText,
      this.helperText,
      this.onChanged,
      this.icon,
      this.isNumber: false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.redAccent[100], style: BorderStyle.solid)),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.redAccent[100], style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Colors.redAccent[100], style: BorderStyle.solid)),
        ),
        onChanged: (String value) {
          onChanged(value);
        },
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}

class ROROAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 56;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "RORO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                ///Todo add nav to ProfileScreen
                // Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: IconButton(
                  icon: Icon(
                    Icons.perm_identity,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
