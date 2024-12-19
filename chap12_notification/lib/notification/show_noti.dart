

// 알림 설정
import 'package:chap12_notification/notification/init_noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

showNotification() async{
  // 안드로이드 알림 설정
  // 특정 알림 채널에 등록을 해둬야 한다.
  var androidDetails = AndroidNotificationDetails(
      "test_id",
      "테스트 체널",
    priority: Priority.max, // 동일한 알림들의 우선 순위
    color: Colors.black,
  );
  // ios
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true, // 알림이 표시될 때 팝업을 보여 줄지 여부
    presentBadge: true, // 아이콘 표시 여부
    presentSound: true,
  );

  notifications.show(
      1,
      "전자문서 안내",
      " KB국민은행 대출 좀 해줘라 좀!!!!",
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload: "test_payload"
  ); //id, title, body, notificationDetails

}