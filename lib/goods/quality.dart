class Quality {
  int amount;

  Quality(this.amount);

  void increaseQuality() {
    if (amount < 50) {
      amount++;
    }
  }

  void degradeQuality() {
    if (amount > 0) {
      amount--;
    }
  }

  void dropsToZero() => amount = 0;
}
