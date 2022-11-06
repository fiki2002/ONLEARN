import 'dart:math' as math;

void main() {
  var show = Circle.first();
  print(show.getArea);
  show.getCircumference();
  show.getColor();

}

class Circle {
  double? radius;
  String? color;

  Circle.first({
    this.radius = 1,
    this.color = 'red',
  });

  Circle.second(double radius) : color = 'red';

  Circle.third(double radius, String color);

  double getArea() {
    print(math.pi);
    return math.pi * math.pow(radius!, 2);
  }

  double getCircumference() {
    const int getValue = 2;
    return getValue * math.pi * radius!;
  }

  String getDescription() {
    return '$radius and $color';
  }

  String getColor() {
    return '$color';
  }
}
