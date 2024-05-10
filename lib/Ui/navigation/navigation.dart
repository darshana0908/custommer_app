import 'dart:developer';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:customer_app/Ui/home/delivery_form/drag_location.dart';
import 'package:customer_app/Ui/home/home3.dart';
import 'package:customer_app/class/class.dart';
import 'package:customer_app/const/app_details.dart';
import 'package:customer_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../home/notification/notification.dart';
import '../home/profile/account/account.dart';
import '../home/voiceCall/voice_call.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List imglist = [
  'assets/j1.jpg',
  'assets/j2.jpg',
  'assets/j3.jpg',
  'assets/j4.jpg',
  'assets/j.jpg',
];

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Home3(),
    NotificationScreen(),
    // Cart(),
    DragLocation(),
    Account(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      log(_selectedIndex.toString());
    });
  }

  @override
  void initState() {
    onUserLogin();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onUserLogin() async {
    String userId = '10';
    print(userId);

    // / 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    // / when app's user is logged in or re-logged in
    // / We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
      uiConfig: ZegoCallInvitationUIConfig(),
      invitationEvents: ZegoUIKitPrebuiltCallInvitationEvents(
        onError: (p0) {
          print(
              'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaaaa');
        },
        onInvitationUserStateChanged: (value) {
          print("$value xxxxxxxxxxxxxxxxxxxxxxxxxaaaaaaaaaaaaaaaa");
          if (value[0].state ==
              ZegoSignalingPluginInvitationUserState.rejected) {
            Navigator.pop(context);
            notification().warning(context, 'rejected');
          }
          if (value[0].state ==
              ZegoSignalingPluginInvitationUserState.cancelled) {
            // notification().warning(context, 'cancelled');
          }
          if (value[0].state ==
              ZegoSignalingPluginInvitationUserState.offline) {
            notification().warning(context, 'offline');
          }
          if (value[0].state ==
              ZegoSignalingPluginInvitationUserState.timeout) {
            notification().warning(context, 'timeout');
          }
          if (value[0].state == ZegoSignalingPluginInvitationUserState.quited) {
            notification().warning(context, 'quited');
          }
          print(
              'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaaaa');
        },
        onOutgoingCallTimeout: (callID, callees, isVideoCall) {
          Navigator.pop(context);
        },

        // onIncomingCallAcceptButtonPressed: () {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => VoiceCall(),
        //       ));
        // },
        // onIncomingCallCanceled: (callID, caller, customData) {
        //   Navigator.pop(context);
        // },
        // onIncomingCallDeclineButtonPressed: () {
        //   Navigator.pop(context);
        // },

        onOutgoingCallCancelButtonPressed: () {
          Navigator.pop(context);
        },
        onOutgoingCallDeclined: (callID, callee, customData) async {
          Navigator.pop(context);
        },
        onOutgoingCallRejectedCauseBusy: (callID, callee, customData) {
          Navigator.pop(context);
          print(
              '------------sssssssssssssss--------------------------------------------------------------------');
        },
      ),
      events: ZegoUIKitPrebuiltCallEvents(room: ZegoCallRoomEvents(
        onStateChanged: (p0) {
          print(p0);
        },
      )),
      notificationConfig: ZegoCallInvitationNotificationConfig(
          androidNotificationConfig: ZegoCallAndroidNotificationConfig(
              channelID: "ZegoUIKit",
              channelName: "Call Notifications",
              sound: "notification",
              icon: "appicon",
              showFullScreen: true)),
      appID: appId /*input your AppID*/,
      appSign: signId /*input your AppSign*/,
      userID: userId.toString(),
      userName: userId.toString(),
      plugins: [ZegoUIKitSignalingPlugin()],
      requireConfig: (ZegoCallInvitationData data) {
        var config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
                : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

        // Modify your custom configurations here.
        config
          ..turnOnCameraWhenJoining = false
          ..turnOnMicrophoneWhenJoining = false
          ..useSpeakerWhenJoining = true;
        config.topMenuBar.isVisible = true;
        ZegoUIKitPrebuiltCallInvitationService()
          ..innerText.incomingCallPageAcceptButton = "Accept"
          ..innerText.incomingCallPageDeclineButton = "Decline";

        return config;
      },
    );
  }

  back2(String text) async {
    Navigator.pop(context, true);
  }

  back() {
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {},
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Text("This is my message."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevent back
      onPopInvoked: (pop) async {},
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child: Scaffold(
            floatingActionButton: FloatingActionButton.small(
              child: Icon(Icons.call),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VoiceCall(),
                    ));
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              useLegacyColorScheme: true,
              selectedItemColor: appButtonColorLite,
              enableFeedback: true,
              currentIndex: _selectedIndex,
              unselectedLabelStyle: TextStyle(color: black3),
              unselectedItemColor: black3,
              onTap: (index) {
                _onItemTapped(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important),
                  label: 'Notification',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.send_time_extension_rounded),
                    label: 'Send',
                    backgroundColor: white),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Account',
                ),
              ],
            ),
            body: Center(child: _pages.elementAt(_selectedIndex))),
      ),
    );
  }
}
