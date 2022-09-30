import 'package:gilded_rose/goods/good_category.dart';

class Generic implements UpdatingInvetory {
  int _quality;
  int _sellIn;

  Generic(this._quality, this._sellIn);

  @override
  void update() {
    if (_quality > 0) {
      _quality--;
    }
    _sellIn = _sellIn - 1;
    if (_sellIn < 0) {
      if (_quality > 0) {
        _quality--;
      }
    }
  }

  @override
  int get quality => _quality;

  @override
  int get sellIn => _sellIn;
}
