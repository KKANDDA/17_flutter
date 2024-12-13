
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

// 여기서부터 코딩~!!!@!!
class _ContactPageState extends State<ContactPage> {

  // 연락처를 저장할 리스트
  List<Contact> _contacts = [];

  // 위젯이 호출되고 제이 먼저 실행될 메소드
  @override
  void initState() {
    super.initState(); // 상위 클래스의 이닛스테이트를 실행시키는 것은 고정..
    _checkPermissionAndFetchContacts();
  }

  // 권한 체크 및 연락처를 가져오는 메소드
  Future<void> _checkPermissionAndFetchContacts() async{ // 비동기 함수를 쓸 땐 퓨쳐로 타입을 맞춰 줘야한다.

    // 연락처 접근 권한 요청
    PermissionStatus permission = await Permission.contacts.request();

    // 권한 허용여부 체크
    if(permission.isGranted){
      _getContacts();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("연락처 권한이 필요합니다.")));
    }
  }

  // 연락처를 실제로 가져오는 메소드
  Future<void> _getContacts() async{
    try{
      /*
      * 연락처 가져오기
      * var contacts = await FlutterContacts.getContacts();
      * - 그런데 연락처에 저장된 썸네일 이미지나 다른 정보들까지 다 가져오면
      *   너무 느리기 때문에 이름과 전화번호 같은 properties만 가져오게 설정했다. */
      final contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: false
      );

      setState(() {
        _contacts = contacts; // 가져온 연락처 데이터를 저장함..
      });
    }catch(e){
      print("연락처를 가져오는 중 오뮤 발생: $e");
    }
  }

  // 연락처 추가를 위한 다이얼로그 메소드
  void _showAddContactDialog(){
    String name = '';
    String phoneNumber = '';

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("새 연락처 추가"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "이름"),
                  onChanged: (value){
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "전화번호"),
                  keyboardType: TextInputType.phone, // 전화번호 입력 모드
                  onChanged: (value){
                    phoneNumber = value;
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("취소")
              ),
              TextButton(
                  onPressed: (){
                    if(name.isNotEmpty && phoneNumber.isNotEmpty){
                      _addContact(name, phoneNumber);
                      Navigator.pop(context);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("이름과 전화번호를 모두 입력해 주세요")));
                    }
                  },
                  child: Text("등록")
              ),
            ],
          );
        }
    );
  }

  Future<void> _addContact(String name, String phoneNumber) async{

    // 연락처 저장 권한 확인
    if(await FlutterContacts.requestPermission()){ // 연락처에 저장할 권한
      final newContact = Contact()
        ..name.first = name // 캐스케이드 연산자
        ..phones = [Phone(phoneNumber)]; // 폰즈가 요구하는 대로 리스트로 만들었다. 하나라도 리스트로 요구하면 맞춰줘야 한다.
      await newContact.insert();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("새 연락처가 저장되었습니다"),
      ));
      _getContacts(); // 겟 안에 setState가 들어있다. 그러니 추가할 필요가 없다.
    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("저장권한이 필요합니다"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 연락처 목록 표시 영역
        Expanded(
          child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, i){
                var contact = _contacts[i];
                return ListTile(
                  title: Text(contact.displayName), // first name + last name 한 것이 displayName!
                  subtitle: Text(
                      contact.phones.isNotEmpty? contact.phones.first.number : "전화번호 없음"
                  ),

                );
              },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
              onPressed: (){
                _showAddContactDialog();
              },
              child: Text("연락처 추가")),
        )
      ],
    );
  }
}
