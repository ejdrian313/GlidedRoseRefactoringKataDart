import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final good = GoodCategory.build(item.name, item.sellIn, item.quality);
      good.update();

      item.quality = good.quality;
      item.sellIn = good.sellIn;
    }
  }

  bool isSulfuras(Item item) => item.name == "Sulfuras, Hand of Ragnaros";

  bool isAgedBrie(Item item) => item.name == "Aged Brie";

  bool isBackstagePass(Item item) =>
      item.name == "Backstage passes to a TAFKAL80ETC concert";

  bool isGeneric(Item item) =>
      !(isAgedBrie(item) || isBackstagePass(item) || isSulfuras(item));
}
