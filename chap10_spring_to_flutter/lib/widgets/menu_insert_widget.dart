import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuInsertWidget extends StatefulWidget {
  const MenuInsertWidget({super.key});

  @override
  State<MenuInsertWidget> createState() => _MenuInsertState();
}

class _MenuInsertState extends State<MenuInsertWidget> {
  MenuModel _menuModel = MenuModel();
  TextEditingController _menuNameCtrl = TextEditingController();
  TextEditingController _menuPriceCtrl = TextEditingController();
  TextEditingController _categoryCodeCtrl = TextEditingController();
  TextEditingController _orderableStatusCtrl = TextEditingController();

  void _insertMenu() async {
    Map<String, dynamic> menuData = {
      "menuName": _menuNameCtrl.text,
      "menuPrice": int.parse(_menuPriceCtrl.text),
      "categoryCode": int.parse(_categoryCodeCtrl.text),
      "orderableStatus": _orderableStatusCtrl.text,
    };

    try {
      String result = await _menuModel.insertMenu(menuData);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(result)),
      // );
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("등록 여부 확인 창"),
              content: Text(result),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, "/home");

                  },
                  child: Text("확인"),
                )
              ],
            );
          }
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                TextField(
                  controller: _menuNameCtrl,
                  decoration: InputDecoration(
                    labelText: "메뉴 이름",
                  ),
                ),
                TextField(
                  controller: _menuPriceCtrl,
                  decoration: InputDecoration(
                    labelText: "메뉴 가격",
                  ),
                ),
                TextField(
                  controller: _categoryCodeCtrl,
                  decoration: InputDecoration(
                    labelText: "카테고리 코드",
                  ),
                ),
                TextField(
                  controller: _orderableStatusCtrl,
                  decoration: InputDecoration(
                    labelText: "판매 여부",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _insertMenu,
                  child: Text("메뉴 등록하기"),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
