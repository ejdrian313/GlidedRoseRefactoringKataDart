import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class BackstagePassFactory {
  static BackstagePass build(int sellIn) {
    if (sellIn < 0) {
      return BackStagePassExpired();
    } else if (sellIn < 5) {
      return BackStagePassLessThan5Days();
    } else if (sellIn < 10) {
      return BackStagePassLessThan10Days();
    }
    return BackstagePass();
  }
}

class BackstagePass implements UpdatingInvetory {
  BackstagePass();

  @override
  void update(Quality quality) => quality.increaseQuality();
}

class BackStagePassExpired extends BackstagePass {
  @override
  void update(Quality quality) => quality.dropsToZero();
}

class BackStagePassLessThan5Days extends BackstagePass {
  @override
  void update(Quality quality) => quality
    ..increaseQuality()
    ..increaseQuality()
    ..increaseQuality();
}

class BackStagePassLessThan10Days extends BackstagePass {
  @override
  void update(Quality quality) => quality
    ..increaseQuality()
    ..increaseQuality();
}
