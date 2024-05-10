import 'package:customer_app/const/app_details.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../class/class.dart';

class VoiceCall extends StatefulWidget {
  const VoiceCall({
    super.key,
  });

  @override
  State<VoiceCall> createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  String userCallId = '';
  @override
  void initState() {
    print(
        'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz92fqSx7HDYcdh4wbXA5JyuRl1PNOp8WZsCBkLVvUrnIieaQmFE');
    onUserLogin();
    // TODO: implement initState

    ;
    super.initState();
  }

  void onUserLogin() async {
    setState(() {
      userCallId = '10';
    });
    ;
    ZegoUIKitPrebuiltCallInvitationService().send(
      callID: '',
      resourceID: 'zego_call',
      notificationMessage: 'helo koombiyo app calling you',
      notificationTitle: 'sssssssssssssssssssssss',
      customData: 'xxxxxxxxxxxxxxxxxx',
      invitees: [ZegoCallUser('1', '1')],
      isVideoCall: false,
      timeoutSeconds: 60,
    );

    ZegoSendCallInvitationButton(
      isVideoCall: false,
      invitees: [ZegoUIKitUser(id: '2', name: '2')],
      // 'resourceID' needs to be the same as the 'resourceID' configured in your console.
      resourceID: 'zego_call',
      // ...
    );

    // ZegoUIKitPrebuiltCallInvitationService().init(
    //   plugins: [ZegoUIKitSignalingPlugin()],
    //   appID: appId /*input your AppID*/,
    //   appSign: signId /*input your AppSign*/,
    //   userID: '1',
    //   userName: '1',
    //   uiConfig: ZegoCallInvitationUIConfig(),
    //   invitationEvents: ZegoUIKitPrebuiltCallInvitationEvents(
    //     onInvitationUserStateChanged: (p0) {
    //       print(p0);
    //       print(
    //           '88888888888888888888888888888888888888888888888888888888888888888');
    //     },
    //     onIncomingCallCanceled: (callID, caller, customData) {
    //       print(
    //           '--------------------------------------------------------------------------------');
    //       back('call canceled');
    //     },
    //     onIncomingCallDeclineButtonPressed: () {
    //       back('Call Declined');
    //     },
    //     onOutgoingCallCancelButtonPressed: () {
    //       back('Call call canceled');
    //     },
    //     onOutgoingCallDeclined: (callID, callee, customData) async {
    //       // ZegoUIKitPrebuiltCallInvitationService().cancel(callees: [callee]);
    //       // await notification().info(context, 'call canceled');
    //       // await ZegoCallEndEvent(
    //       //     callID: callID,
    //       //     reason: ZegoCallEndReason.kickOut,
    //       //     isFromMinimizing: true);
    //       back('Call Declined');
    //     },
    //     onOutgoingCallRejectedCauseBusy: (callID, callee, customData) {
    //       back('Call Rejected CauseBusy');
    //       print(
    //           '------------sssssssssssssss--------------------------------------------------------------------');
    //     },
    //   ),
    //   events: ZegoUIKitPrebuiltCallEvents(room: ZegoCallRoomEvents(
    //     onStateChanged: (p0) {
    //       print(p0);
    //     },
    //   )),
    // );
  }

  back(String text) async {
    Navigator.pop(context);
    print(
        'wwwww wwwww wwmwwwww wwwwwww wwwwwww wwwwwww www  wwwww   wwwwww wwww wwwwwwwwwwwwwwwwwwwwwwwwwwww');
  }

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          signId, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userCallId,
      userName: userCallId,
      callID: '12',
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );

    // return ZegoUIKitPrebuiltCall(
    //   events: ZegoUIKitPrebuiltCallEvents(
    //     onError: (p0) {
    //       print(p0);
    //     },
    //   ),
    //   plugins: [ZegoUIKitSignalingPlugin()],
    //   appID:
    //       appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
    //   appSign:
    //       signId, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
    //   userID: widget.usrId,
    //   userName: widget.usrId,
    //   callID: '100',
    //   // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
    //   config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
    //     ..avatarBuilder = (BuildContext context, Size size, ZegoUIKitUser? user,
    //         Map extraInfo) {
    //       return user != null
    //           ? Container(
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 image: DecorationImage(
    //                   image: NetworkImage(
    //                     'https://media.gettyimages.com/id/665146638/vector/social-media-communication.jpg?s=1024x1024&w=gi&k=20&c=UFmJAlfRmPeDbIWAWfEeveI5NENaVtq6mJDU4W8jm2k=',
    //                   ),
    //                 ),
    //               ),
    //             )
    //           : const SizedBox();
    //     },
    // );
  }
}

// ZegoSendCallInvitationButton(
//    isVideoCall: true,
//    //You need to use the resourceID that you created in the subsequent steps.
//    //Please continue reading this document.
//    resourceID: "zegouikit_call",
//    invitees: [
//       ZegoUIKitUser(
//          id: targetUserID,
//          name: targetUserName,
//       ),
//       ...
//       ZegoUIKitUser(
//          id: targetUserID,
//          name: targetUserName,
//       )
//    ],
// )

class CallInvite extends StatelessWidget {
  const CallInvite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
