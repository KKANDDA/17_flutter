

void functionTest(){
  test1("서현준");

  // 클로저 - 내부 함수
  void innerFun(){
    print("hello");
  }

  innerFun();

  print("--------- 매개변수와 반환타입 -----------");
  print(add(1,2));

  print("-------- optional 매개변수 -------------");
  print(add2(1,2,3));
  print(add2(1,2));


}

void test1(String name){
  print("hello ${name}");
}

String add(int a, int b) {
  return "Sum: ${a+b}";
}

String add2(int a, int b, [int c = 0]) { // 기본값은 없었다. 가변인자는 있었다. 오버로딩 대신 존재..
  int sum = a+b+c;
  return "Sum2: ${sum}";
}