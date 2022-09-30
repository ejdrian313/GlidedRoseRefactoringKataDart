import 'package:gilded_rose/goods/good_category.dart';

class AgedBrie implements UpdatingInvetory {
  int _quality;
  int _sellIn;

  AgedBrie(this._quality, this._sellIn);

  @override
  void update() {
    if (_quality < 50) {
      _quality++;
    }
    _sellIn--;

    if (_sellIn < 0) {
      if (_quality < 50) {
        _quality++;
      }
    }
  }

  @override
  int get quality => _quality;

  @override
  int get sellIn => _sellIn;
}
