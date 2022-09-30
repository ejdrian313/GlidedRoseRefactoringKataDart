import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class ConjuredFactory {
  static Conjured build(int sellIn) {
    if (sellIn < 0) return ConjuredExpired();
    return Conjured();
  }
}

class Conjured implements UpdatingInvetory {
  @override
  void update(Quality quality) => quality
    ..degradeQuality()
    ..degradeQuality();
}

class ConjuredExpired extends Conjured {
  @override
  void update(Quality quality) => quality
    ..degradeQuality()
    ..degradeQuality()
    ..degradeQuality()
    ..degradeQuality();
}
