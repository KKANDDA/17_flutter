import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuDeleteWidget extends StatefulWidget {
  const MenuDeleteWidget({super.key});

  @override
  State<MenuDeleteWidget> createState() => _MenuDeleteWidgetState();
}

class _MenuDeleteWidgetState extends State<MenuDeleteWidget> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];
  dynamic _selectedMenu;

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  void _onMenuSelected(dynamic menu) {
    setState(() {
      _selectedMenu = menu;
    });
  }

  void _deleteSelectedMenu(menuCode) async {
    try {
      String result = await _menuModel.deleteMenu(menuCode);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton(
          value: _selectedMenu,
          hint: Text("메뉴 선택"),
          onChanged: (dynamic newValue) {
            _onMenuSelected(newValue);
          },
          items: _menus.map((dynamic menu) {
            return DropdownMenuItem(
              value: menu,
              child: Text(menu["menuName"]),
            );
          }).toList(),
        ),
        ElevatedButton(
          onPressed: () {
            _deleteSelectedMenu(_selectedMenu["menuCode"]);
          },
          child: Text("선택된 메뉴 삭제"),
        ),
      ],
    ));
  }
}
