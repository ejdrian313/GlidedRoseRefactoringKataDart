import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class BackstagePass implements UpdatingInvetory {
  int _sellIn;

  BackstagePass(this._sellIn);

  @override
  void update(Quality quality) {
    if (quality.amount < 50) {
      quality.increaseQuality();

      if (_sellIn < 10) {
        quality.increaseQuality();
      }

      if (_sellIn < 5) {
        quality.increaseQuality();
      }
    }
    if (_sellIn < 0) {
      quality.dropsToZero();
    }
  }
}
