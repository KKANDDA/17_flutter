import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraTool extends StatefulWidget {
  const CameraTool({super.key});

  @override
  State<CameraTool> createState() => _CameraToolState();
}

/*
CircularProgressIndicator()

Column(children: _images.map((image){
  return DestureDetector(
  onTap
  child: 이미지 넣기, width, height 지정 가능
)
}).toList()

* */

// 여기서부터 코딩..
class _CameraToolState extends State<CameraTool> {

  File? _image;
  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _byAlbumFindToPhoto() async{
    setState(() {
      _isLoading = true;
    });
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      setState(() {
      _image = File(pickedFile.path);
      _images.add(_image!);
      _isLoading = false;
      });
    }else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _newPhoto() async{
    setState(() {
      _isLoading = true;
    });
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if(pickedFile != null){
      setState(() {
        _image = File(pickedFile.path);
        _images.add(_image!);
        _isLoading = false;
      });
    }else{
      setState(() {
        _isLoading = true;
      });
    }
  }

/*  void _showAddPhotoDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("등록 방식 선택"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: (){}, child: Text("앨범에서 선택"),)
              ],
            ),
          );
        },
    );
  }*/


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          _isLoading? CircularProgressIndicator() :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children:

              _images.map((image){
                return GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("미리보기"),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.file(image),
                                ElevatedButton(
                                  onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (context){
                                          return AlertDialog(
                                            title: Text("이미지 삭제"),
                                            content: Text("정말로 이미지를 삭제하시겠습니까?"),
                                            actions: [
                                              TextButton(
                                                onPressed: (){
                                                  setState(() {
                                                    _images.remove(image);
                                                    // backToFirstScreen = true;
                                                  });
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                child: Text("삭제"),
                                              ),
                                              TextButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Text("취소"),
                                              ),
                                            ],
                                          );
                                        }
                                    );
                                  },
                                  child: Text("이미지 삭제"),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  },
                  child: Image.file(image, width: 50, height: 60,),
                );
              }).toList(),
          ),
          // _image == null? Text("사진을 선택하세요") :Image.file(_image!),

          // 사진 등록 하기 (앨범 속 사진 || new 사진 - 사진기능 활용)
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: _byAlbumFindToPhoto,
              child: Text("기존 사진을 등록하기"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _newPhoto,
            child: Text("새 사진을 등록하기"),
          ),
        ],
      ),
    );
  }
}


