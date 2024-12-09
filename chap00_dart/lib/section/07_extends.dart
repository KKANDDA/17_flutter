
void extendsTest(){
Dog hyeoJuNi = new Dog("혀주니", 4);

print(hyeoJuNi._name);
print(hyeoJuNi.age);
hyeoJuNi.eat();
}

// 부모 클래스
class Animal {
  String _name;

  Animal(this._name);

  void eat(){
    print("$_name 이(가) 밥을 먹읍니다.");
  }

}

// 자식 클래스
class Dog extends Animal {
  late int _age; // late는 나중에 초기화 하겠다는 뜻.. 사용은 초기화를 해야 가능..

  Dog(String name, int age) : super(name) { // 초기화 리스트..
    this.age = age;
  }

  int get age => _age;

  set age(int value) {
    if(value <= 0){
      throw ArgumentError("나이 입력을 확인해 주세요~");
    }
    _age = value;
  }
}