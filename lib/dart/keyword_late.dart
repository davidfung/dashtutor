// Require Dart 2.12+

void main() {
  Parent p = Parent();
  p.sayHello();
  p.child.sayHello();
  p.child.askParent();
}

class Parent {
  // final Child child; <- this line won't compile
  late final Child child;
  Parent() {
    child = Child(this);
  }
  void sayHello() {
    print('Parent says hello');
  }
}

class Child {
  final Parent parent;
  Child(this.parent);
  void sayHello() => print("Child says hello");
  void askParent() {
    print("From Child: ");
    parent.sayHello();
  }
}
