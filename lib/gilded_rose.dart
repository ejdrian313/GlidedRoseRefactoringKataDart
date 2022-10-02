import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';
import 'package:gilded_rose/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (final item in items) {
      if (isSulfuras(item)) continue;
      final quality = Quality(item.quality);
      item.sellIn--;
      final good = GoodCategory.build(item.name, item.sellIn);
      good.update(quality);

      item.quality = quality.amount;
    }
  }

  bool isSulfuras(Item item) => item.name == "Sulfuras, Hand of Ragnaros";
}
