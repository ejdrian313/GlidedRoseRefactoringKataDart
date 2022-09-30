import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final good = GoodCategory.build(item.name);
      good.update();
      item.quality = good.quality;
      item.sellIn = good.sellIn;
      if (isSulfuras(item)) {
      } else if (isGeneric(item)) {
        handleGeneric(item);
      } else if (isBackstagePass(item)) {
        handleBackstagePass(item);
      } else if (isAgedBrie(item)) {
        handleAgedBrie(item);
      }
    }
  }

  void handleAgedBrie(Item item) {
    if (item.quality < 50) {
      increaseQuality(item);
    }
    item.sellIn = item.sellIn - 1;

    if (item.sellIn < 0) {
      if (item.quality < 50) {
        increaseQuality(item);
      }
    }
  }

  void handleBackstagePass(Item item) {
    if (item.quality < 50) {
      increaseQuality(item);

      if (item.sellIn < 11) {
        if (item.quality < 50) {
          increaseQuality(item);
        }
      }

      if (item.sellIn < 6) {
        if (item.quality < 50) {
          increaseQuality(item);
        }
      }
    }
    item.sellIn = item.sellIn - 1;
    if (item.sellIn < 0) {
      item.quality = item.quality - item.quality;
    }
  }

  void handleGeneric(Item item) {
    if (item.quality > 0) {
      decreaseQuality(item);
    }
    item.sellIn = item.sellIn - 1;
    if (item.sellIn < 0) {
      if (item.quality > 0) {
        decreaseQuality(item);
      }
    }
  }

  int decreaseQuality(Item item) => item.quality--;

  int increaseQuality(Item item) => item.quality++;

  bool isSulfuras(Item item) => item.name == "Sulfuras, Hand of Ragnaros";

  bool isAgedBrie(Item item) => item.name == "Aged Brie";

  bool isBackstagePass(Item item) =>
      item.name == "Backstage passes to a TAFKAL80ETC concert";

  bool isGeneric(Item item) =>
      !(isAgedBrie(item) || isBackstagePass(item) || isSulfuras(item));
}
