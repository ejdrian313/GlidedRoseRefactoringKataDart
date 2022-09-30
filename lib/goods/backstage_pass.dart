import 'package:gilded_rose/goods/good_category.dart';

class BackstagePass implements UpdatingInvetory {
  int _quality;
  int _sellIn;

  BackstagePass(this._quality, this._sellIn);

  @override
  void update() {
    if (_quality < 50) {
      _quality++;

      if (_sellIn < 11) {
        if (_quality < 50) {
          _quality++;
        }
      }

      if (_sellIn < 6) {
        if (_quality < 50) {
          _quality++;
        }
      }
    }
    _sellIn = _sellIn - 1;
    if (_sellIn < 0) {
      _quality = _quality - _quality;
    }
  }

  @override
  int get quality => _quality;

  @override
  int get sellIn => _sellIn;
}
