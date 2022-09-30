import 'package:gilded_rose/goods/aged_brie.dart';
import 'package:gilded_rose/goods/backstage_pass.dart';
import 'package:gilded_rose/goods/generic.dart';
import 'package:gilded_rose/goods/sulfuras.dart';

const sulfuras = 'Sulfuras, Hand of Ragnaros';
const backstagePass = 'Backstage passes to a TAFKAL80ETC concert';
const agedBrie = 'Aged Brie';

class GoodCategory {
  static UpdatingInvetory build(String name, int sellIn, int quality) {
    switch (name) {
      case sulfuras:
        return Sulfuras(quality, sellIn);
      case backstagePass:
        return BackstagePass(quality, sellIn);
      case agedBrie:
        return AgedBrie(quality, sellIn);
      default:
        return Generic(quality, sellIn);
    }
  }
}

abstract class UpdatingInvetory {
  int get quality;

  int get sellIn;

  void update();
}
