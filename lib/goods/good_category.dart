const sulfuras = 'Sulfuras, Hand of Ragnaros';
const backstagePass = 'Backstage passes to a TAFKAL80ETC concert';
const agedBrie = 'Aged Brie';

class GoodCategory {
  static UpdatingInvetory build(String name) {
    switch (name) {
      case sulfuras:
        return Sulfuras();
      case backstagePass:
        return BackstagePass();
      case agedBrie:
        return AgedBrie();
      default:
        return Generic();
    }
  }
}

class AgedBrie implements UpdatingInvetory {
  @override
  void update() {}

  @override
  int get quality => throw UnimplementedError();

  @override
  int get sellIn => throw UnimplementedError();
}

class BackstagePass implements UpdatingInvetory {
  @override
  void update() {}

  @override
  int get quality => throw UnimplementedError();

  @override
  int get sellIn => throw UnimplementedError();
}

class Sulfuras implements UpdatingInvetory {
  @override
  void update() {}

  @override
  int get quality => throw UnimplementedError();

  @override
  int get sellIn => throw UnimplementedError();
}

class Generic implements UpdatingInvetory {
  @override
  void update() {}

  @override
  int get quality => throw UnimplementedError();

  @override
  int get sellIn => throw UnimplementedError();
}

abstract class UpdatingInvetory {
  int get quality;

  int get sellIn;

  void update();
}
