import 'package:gilded_rose/goods/good_category.dart';
import 'package:gilded_rose/goods/quality.dart';

class Generic implements UpdatingInvetory {
  int _sellIn;

  Generic(this._sellIn);

  @override
  void update(Quality quality) {
    quality.degradeQuality();

    if (_sellIn < 0) {
      quality.degradeQuality();
    }
  }
}
