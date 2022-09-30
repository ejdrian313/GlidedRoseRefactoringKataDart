import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class AgedBrieFactory {
  static AgedBrie build(int sellIn) {
    if (sellIn < 0) return AgedBrieExpired();
    return AgedBrie();
  }
}

class AgedBrie implements UpdatingInvetory {
  @override
  void update(Quality quality) => quality.increaseQuality();
}

class AgedBrieExpired extends AgedBrie implements UpdatingInvetory {
  AgedBrieExpired();

  @override
  void update(Quality quality) => quality
    ..increaseQuality()
    ..increaseQuality();
}
