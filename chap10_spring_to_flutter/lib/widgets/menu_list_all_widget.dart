import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuListAllWidget extends StatefulWidget {
  const MenuListAllWidget({super.key});

  @override
  State<MenuListAllWidget> createState() => _MenuListAllWidgetState();
}

class _MenuListAllWidgetState extends State<MenuListAllWidget> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  // 메뉴 목록을 불러 오는 함수
  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  //  선택된 메뉴 상세 정보를 보여주는 함수
  void _onTapped() async{

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _menus.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(_menus[i]["menuName"]),
                  subtitle: Text(_menus[i]["menuPrice"].toString()),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>DetailPage(
                              menuName: _menus[i]["menuName"],
                              menuPrice: _menus[i]["menuPrice"],
                              categoryCode: _menus[i]["categoryCode"],
                              orderableStatus: _menus[i]["orderableStatus"],
                            )
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final dynamic menuName;
  final dynamic menuPrice;
  final dynamic categoryCode;
  final dynamic orderableStatus;

  const DetailPage({
    super.key,
    required this.menuName,
    required this.menuPrice,
    required this.categoryCode,
    required this.orderableStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$menuName"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("메뉴 이름: $menuName", style: TextStyle(fontSize: 20),),
          Text("메뉴 가격: $menuPrice",style: TextStyle(fontSize: 20),),
          Text("카테고리 코드: $categoryCode",),
          Text("주문 가능 상태: $orderableStatus",),
        ],
      ),
    );


  }
}

