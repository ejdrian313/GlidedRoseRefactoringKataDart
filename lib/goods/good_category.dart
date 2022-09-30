import 'package:gilded_rose/goods/aged_brie.dart';
import 'package:gilded_rose/goods/backstage_pass.dart';
import 'package:gilded_rose/goods/generic.dart';
import 'package:gilded_rose/goods/quality.dart';

const backstagePass = 'Backstage passes to a TAFKAL80ETC concert';
const agedBrie = 'Aged Brie';

class GoodCategory {
  static UpdatingInvetory build(String name, int sellIn) {
    switch (name) {
      case backstagePass:
        return BackstagePass(sellIn);
      case agedBrie:
        return AgedBrie(sellIn);
      default:
        return Generic(sellIn);
    }
  }
}

abstract class UpdatingInvetory {
  void update(Quality update);
}
