import 'package:chap12_notification/notification/show_noti.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// chap01
/*class NotiTestScreen extends StatefulWidget {
  const NotiTestScreen({super.key});

  @override
  State<NotiTestScreen> createState() => _NotiTestScreenState();
}

class _NotiTestScreenState extends State<NotiTestScreen> {

  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
  }

  Future<void> requestNotificationPermission() async{
    // 안드로이드는 별도의 권한 요청 필요
    if(await Permission.notification.isDenied){
      await Permission.notification.request();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("알림 테스트"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            showNotification();
          },
          child: Text("알림 보내기"),),
      ),
    );
  }

}*/

// chap02
class NotiTestScreen extends StatefulWidget {
  const NotiTestScreen({super.key});

  @override
  State<NotiTestScreen> createState() => _NotiTestScreenState();
}

class _NotiTestScreenState extends State<NotiTestScreen> {

  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
  }

  Future<void> requestNotificationPermission() async{
    // 안드로이드는 별도의 권한 요청 필요
    if(await Permission.notification.isDenied){
      await Permission.notification.request();
    }
  }
  List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("알림 테스트"),
      ),
     
    );
  }

}
