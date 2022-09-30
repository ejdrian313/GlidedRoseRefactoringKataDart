import 'package:gilded_rose/goods/good_category.dart';

class Sulfuras implements UpdatingInvetory {
  int _quality;
  int _sellIn;

  Sulfuras(this._quality, this._sellIn);

  @override
  void update() {}

  @override
  int get quality => _quality;

  @override
  int get sellIn => _sellIn;
}
