//@dart=2.9
import 'package:doctor_patient/view/my__bottom_nav_bar.dart';
import 'package:doctor_patient/widgets/app_default.dart';
import 'package:doctor_patient/widgets/home_screen_widgets.dart';
import 'package:fab_action_menu/fab_action_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: ROROAppBar(),
      body: WillPopScope(
          onWillPop: () async {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RichAlertDialog(
                    alertTitle: richTitle("Exit the App"),
                    alertSubtitle: richSubtitle('Are you Sure '),
                    alertType: RichAlertType.WARNING,
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text("Yes"),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: height * 0.1,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.purple,
                            child: CardButton(
                              height: height * 0.2,
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.userDoctor,
                              size: width * (25 / 100),
                              color: Colors.purple[200],
                              borderColor: Colors.purple.withOpacity(0.75),
                            ),
                            onTap: () {
                              ///Todo add  navigation to  AppoinmentReminder.routeName
                            }
                            //   Navigator.pushNamed(
                            //       context, AppoinmentReminder.routeName);
                            // },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Appointment Reminder'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.yellowAccent,
                            child: CardButton(
                              height: height * (20 / 100),
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.capsules,
                              size: width * 0.2,
                              color: Colors.yellowAccent[700],
                              borderColor:
                              Colors.yellowAccent.withOpacity(0.75),
                            ),
                            onTap: () {
                              ///Todo add navigation to MedicineReminder
                              // Navigator.pushNamed(
                              //     context, MedicineReminder.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Medicine Intake Reminder'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                /*Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.green,
                            child: CardButton(
                              height: height * (20 / 100),
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.child,
                              size: width * (25 / 100),
                              color: Colors.green[200],
                              borderColor: Colors.green.withOpacity(0.75),
                            ),
                            onTap: () async {
                              Navigator.pushNamed(context, InitialSetupScreen.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Contact JagaMe',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.brown,
                            child: CardButton(
                              height: height * (20 / 100),
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.fileLines,
                              size: width * 0.2,
                              color: Colors.brown[200],
                              borderColor: Colors.brown.withOpacity(0.75),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, ViewDocuments.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Save Documents'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),*/
//               Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Column(
                //                       children: <Widget>[
//                          InkWell(
//                            splashColor: Colors.redAccent,
//                            child: CardButton(
//                              height: screenHeight * 0.2,
//                              width: screenWidth * (35 / 100),
//                              icon: FontAwesomeIcons.heartbeat,
//                              size: screenWidth * (25 / 100),
//                              color: Color(0xffD83B36),
//                              borderColor: Color(0xffD83B36).withOpacity(0.75),
//                            ),
//                            onTap: () {
//                              if (heartRateSensor) {
//                                Navigator.pushNamed(
//                                    context, HeartRateScreen.id);
//                              } else {
//                                print('Heart Rate Sensor not available');
//                                showDialog(
//                                    context: context,
//                                    builder: (BuildContext context) {
//                                      return RichAlertDialog(
//                                        alertTitle:
//                                            richTitle("Function not available"),
//                                        alertSubtitle: richSubtitle(
//                                            'Sensor not available in device '),
//                                        alertType: RichAlertType.WARNING,
//                                        actions: <Widget>[
//                                          FlatButton(
//                                              child: Text("Ok"),
//                                              onPressed: () {
//                                                Navigator.pop(context);
//                                              }),
//                                        ],
//                                      );
//                                    });
//                              }
//                            },
//                          ),
//                          Padding(
//                            padding: EdgeInsets.only(top: 8.0),
//                            child: Text('Check your Heart rate'),
//                          ),
                /*InkWell(
                            splashColor: Colors.redAccent,
                            child: CardButton(
                              height: height * 0.2,
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.userInjured,
                              size: width * (25 / 100),
                              color: Color(0xffD83B36),
                              borderColor: Color(0xffD83B36).withOpacity(0.75),
                            ),
                            onTap: () async {
                              bool granted = await checkRequiredPermission();
                              if (granted) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return VideoCall(
                                        userID: loggedInUser.uid,
                                      );
                                    }));
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Urgent Video Call'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.brown,
                            child: CardButton(
                              height: height * (20 / 100),
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.fileLines,
                              size: width * 0.2,
                              color: Colors.brown[100],
                              borderColor: Colors.brown.withOpacity(0.75),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, ViewDocuments.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Save Documents'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.06,
                ),*/
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.teal,
                            child: CardButton(
                              height: height * 0.2,
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.noteSticky,
                              size: width * (25 / 100),
                              color: Colors.teal[200],
                              borderColor: Colors.teal.withOpacity(0.75),
                            ),
                            onTap: () {
                              ///Todo add nav to NotePage
                              // Navigator.pushNamed(context, NotePage.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Notes'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.blue,
                            child: CardButton(
                              height: height * (20 / 100),
                              width: width * (35 / 100),
                              icon: FontAwesomeIcons.notesMedical,
                              size: width * 0.2,
                              color: Colors.blue[200],
                              borderColor: Colors.blue.withOpacity(0.75),
                            ),
                            onTap: () {
                              ///Todo add nav to TrackerHome
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) {
                              //       return TrackerHome();
                              //     }
                              //     ));
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Health Tracker'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * (5 / 100),
                ),
                SizedBox(
                  height: 30,
                ),
                // Expanded(
                //   child: Column(
                //     children: <Widget>[
                //       InkWell(
                //         splashColor: Colors.purple,
                //         child: CardButton(
                //           height: height * 0.2,
                //           width: width * (35 / 100),
                //           icon: FontAwesomeIcons.userDoctor,
                //           size: width * (25 / 100),
                //           color: Colors.purple[200],
                //           borderColor: Colors.purple.withOpacity(0.75),
                //         ),
                //         onTap: () {
                //           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToReminder()));
                //         },
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(top: 8.0),
                //         child: Text('Appointment Reminder'),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }


}


class RichAlertDialog extends StatefulWidget {
  /// The title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Usually has a bigger fontSize than the [alertSubtitle].
  final Text alertTitle;

  /// The subtitle of the dialog is displayed in a medium-sized font beneath
  /// the title of the dialog.
  ///
  /// Usually has a smaller fontSize than the [alertTitle]
  final Text alertSubtitle;

  /// The type of dialog, whether warning, success or error.
  final int alertType;

  /// The (optional) actions to be performed in the dialog is displayed
  /// the subtitle of the dialog. If no values are provided, a default
  /// [Button] widget is rendered.
  ///
  /// Typically a [List<Widget>] widget.
  final List<Widget> actions;

  /// Specifies how blur the screen overlay effect should be.
  /// Higher values mean more blurred overlays.
  final double blurValue;

  // Specifies the opacity of the screen overlay
  final double backgroundOpacity;

  /// (Optional) User defined icon for the dialog. Advisable to use the
  /// default icon matching the dialog type.
  final Icon dialogIcon;

  RichAlertDialog({
    Key key,
    @required this.alertTitle,
    @required this.alertSubtitle,
    @required this.alertType,
    this.actions,
    this.blurValue,
    this.backgroundOpacity,
    this.dialogIcon,
  }) : super(key: key);

  createState() => _RichAlertDialogState();
}

class _RichAlertDialogState extends State<RichAlertDialog> {
  Map<int, AssetImage> _typeAsset = {
    RichAlertType.ERROR: AssetImage("packages/rich_alert/assets/error.png"),
    RichAlertType.SUCCESS: AssetImage("packages/rich_alert/assets/success.png"),
    RichAlertType.WARNING: AssetImage("packages/rich_alert/assets/warning.png"),
  };

  Map<int, Color> _typeColor = {
    RichAlertType.ERROR: Colors.red,
    RichAlertType.SUCCESS: Colors.green,
    RichAlertType.WARNING: Colors.blue,
  };

  double deviceWidth;
  double deviceHeight;
  double dialogHeight;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;
    deviceHeight = orientation == Orientation.portrait
        ? screenSize.height
        : screenSize.width;
    dialogHeight = deviceHeight * (2 / 5);

    return MediaQuery(
      data: MediaQueryData(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurValue != null ? widget.blurValue : 3.0,
          sigmaY: widget.blurValue != null ? widget.blurValue : 3.0,
        ),
        child: Container(
          height: deviceHeight,
          color: Colors.white.withOpacity(widget.backgroundOpacity != null
              ? widget.backgroundOpacity
              : 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        height: dialogHeight,
                        width: deviceWidth * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: dialogHeight / 4),
                              widget.alertTitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.alertSubtitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.actions != null &&
                                  widget.actions.isNotEmpty
                                  ? _buildActions()
                                  : _defaultAction(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: dialogHeight - 50,
                      child: widget.dialogIcon != null
                          ? widget.dialogIcon
                          : _defaultIcon(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildActions() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions,
      ),
    );
  }

  Image _defaultIcon() {
    return Image(
      image: _typeAsset[widget.alertType],
      width: deviceHeight / 7,
      height: deviceHeight / 7,
    );
  }

  Container _defaultAction(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        elevation: 2.0,
        color: _typeColor[widget.alertType],
        child: Text(
          "GOT IT",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Text richTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 24.0),
  );
}

Text richSubtitle(String subtitle) {
  return Text(
    subtitle,
    style: TextStyle(
      color: Colors.grey,
    ),
  );
}

class RichAlertType {
  /// Indicates an error dialog by providing an error icon.
  static const int ERROR = 0;

  /// Indicates a success dialog by providing a success icon.
  static const int SUCCESS = 1;

  /// Indicates a warning dialog by providing a warning icon.
  static const int WARNING = 2;
}







