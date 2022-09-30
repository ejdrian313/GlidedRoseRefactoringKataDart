import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class GenericFactory {
  static Generic build(int sellIn) {
    if (sellIn < 0) return GenericExpired();
    return Generic();
  }
}

class Generic implements UpdatingInvetory {
  @override
  void update(Quality quality) => quality.degradeQuality();
}

class GenericExpired extends Generic {
  @override
  void update(Quality quality) => quality
    ..degradeQuality()
    ..degradeQuality();
}
