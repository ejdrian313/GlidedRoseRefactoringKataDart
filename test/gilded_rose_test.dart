import 'package:gilded_rose/item.dart';
import 'package:test/test.dart';
import 'package:gilded_rose/gilded_rose.dart';

main() {
  test('report test', () {
    final items = [
      new Item("+5 Dexterity Vest", 10, 20),
      new Item("Aged Brie", 2, 0),
      new Item("Elixir of the Mongoose", 5, 7),
      new Item("Sulfuras, Hand of Ragnaros", 0, 80),
      new Item("Sulfuras, Hand of Ragnaros", -1, 80),
      new Item("Backstage passes to a TAFKAL80ETC concert", 15, 20),
      new Item("Backstage passes to a TAFKAL80ETC concert", 10, 49),
      new Item("Backstage passes to a TAFKAL80ETC concert", 5, 49),
      // this conjured item does not work properly yet
      // new Item("Conjured Mana Cake", 3, 6)
    ];
    GildedRose app = new GildedRose(items);

    var reporetedText = "OMGHAI!\n";

    final days = 2;
    for (var i = 0; i < days; i++) {
      reporetedText += "-------- day $i --------\n";
      reporetedText += "name, sellIn, quality\n";
      for (var item in items) {
        reporetedText += "$item\n";
      }
      reporetedText += "\n";
      app.updateQuality();
    }

    expect(reporetedText, result);
  });

  void testBackstagePass(
      {int? excpected, required int sellIn, required int quality}) {
    final item =
        Item('Backstage passes to a TAFKAL80ETC concert', sellIn, quality);
    final app = GildedRose([item]);
    app.updateQuality();
    expect(item.quality, excpected);
  }

  void testAgedBrie(
      {int? excpected, required int sellIn, required int quality}) {
    final item = Item('Aged Brie', sellIn, quality);
    final app = GildedRose([item]);
    app.updateQuality();
    expect(item.quality, excpected);
  }

  test('Backstage pass increase twice', () {
    testBackstagePass(excpected: 12, sellIn: 7, quality: 10);
  });

  test('Backstage pass sellIn less than 5', () {
    testBackstagePass(excpected: 13, sellIn: 4, quality: 10);
  });

  test('Backstage pass sellIn zero', () {
    testBackstagePass(excpected: 0, sellIn: 0, quality: 10);
  });

  test('AgedBrie sellIn zero', () {
    testAgedBrie(excpected: 12, sellIn: 0, quality: 10);
  });

  void testGeneric(
      {int? excpected, required int sellIn, required int quality}) {
    final item = Item('foo', sellIn, quality);
    final app = GildedRose([item]);
    app.updateQuality();
    expect(item.quality, excpected);
  }

  test('generic', () {
    testGeneric(excpected: 1, sellIn: -1, quality: 3);
  });

  test('generic quality zero', () {
    testGeneric(excpected: 0, sellIn: -1, quality: 0);
  });

  test('generic quality one drops to zero', () {
    testGeneric(excpected: 0, sellIn: 5, quality: 1);
  });

  test('backstage pass quality max', () {
    testBackstagePass(excpected: 50, sellIn: 10, quality: 50);
  });

  test('backstage sellin 10', () {
    testBackstagePass(excpected: 7, sellIn: 10, quality: 5);
  });
  test('backstage sell in 11', () {
    testBackstagePass(excpected: 6, sellIn: 11, quality: 5);
  });

  test('backstage sell in 6', () {
    testBackstagePass(excpected: 7, sellIn: 6, quality: 5);
  });

  test('backstage sell in 5', () {
    testBackstagePass(excpected: 8, sellIn: 5, quality: 5);
  });

  test('backstage sell in 8 quality 48 reach max', () {
    testBackstagePass(excpected: 50, sellIn: 8, quality: 48);
  });

  test('backstage sell in 5 quality 47 reach max', () {
    testBackstagePass(excpected: 50, sellIn: 5, quality: 47);
  });

  test('backstage sell in 1 quality 47 reach max', () {
    testBackstagePass(excpected: 50, sellIn: 1, quality: 47);
  });

  test('backstage sell in 0 quality drops to zero', () {
    testBackstagePass(excpected: 0, sellIn: 0, quality: 47);
  });

  test('generic sell in -1 quality two drops to zero', () {
    testGeneric(excpected: 0, sellIn: -1, quality: 2);
  });

  test('AgedBrie sell in -1 quality 48 reach max', () {
    testAgedBrie(excpected: 50, sellIn: -1, quality: 48);
  });

  test('AgedBrie sell in -1 quality 49 reach max', () {
    testAgedBrie(excpected: 50, sellIn: -1, quality: 49);
  });
}

final result = """OMGHAI!
-------- day 0 --------
name, sellIn, quality
+5 Dexterity Vest, 10, 20
Aged Brie, 2, 0
Elixir of the Mongoose, 5, 7
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 15, 20
Backstage passes to a TAFKAL80ETC concert, 10, 49
Backstage passes to a TAFKAL80ETC concert, 5, 49

-------- day 1 --------
name, sellIn, quality
+5 Dexterity Vest, 9, 19
Aged Brie, 1, 1
Elixir of the Mongoose, 4, 6
Sulfuras, Hand of Ragnaros, 0, 80
Sulfuras, Hand of Ragnaros, -1, 80
Backstage passes to a TAFKAL80ETC concert, 14, 21
Backstage passes to a TAFKAL80ETC concert, 9, 50
Backstage passes to a TAFKAL80ETC concert, 4, 50

""";
