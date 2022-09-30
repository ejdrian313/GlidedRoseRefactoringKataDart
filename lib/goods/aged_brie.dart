import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class AgedBrie implements UpdatingInvetory {
  int _sellIn;

  AgedBrie(this._sellIn);

  @override
  void update(Quality quality) {
    quality.increaseQuality();

    if (_sellIn < 0) {
      quality.increaseQuality();
    }
  }
}
