import 'package:gilded_rose/goods/aged_brie.dart';
import 'package:gilded_rose/goods/backstage_pass.dart';
import 'package:gilded_rose/goods/conjured.dart';
import 'package:gilded_rose/goods/generic.dart';
import 'package:gilded_rose/goods/quality.dart';

const backstagePass = 'Backstage passes to a TAFKAL80ETC concert';
const agedBrie = 'Aged Brie';
const conjured = 'Conjured Mana Cake';

class GoodCategory {
  static UpdatingInvetory build(String name, int sellIn) {
    switch (name) {
      case backstagePass:
        return BackstagePassFactory.build(sellIn);
      case agedBrie:
        return AgedBrieFactory.build(sellIn);
      case conjured:
        return ConjuredFactory.build(sellIn);
      default:
        return GenericFactory.build(sellIn);
    }
  }
}

abstract class UpdatingInvetory {
  void update(Quality update);
}
