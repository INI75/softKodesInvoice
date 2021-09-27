class AddItemDetails {
  final String _discription;
  final String _quantity;
  final String _rate;
  final String _percentage;
  final String _tax;
  final String _total;
  final String _no;

  AddItemDetails(
    this._discription,
    this._quantity,
    this._rate,
    this._percentage,
    this._tax,
    this._total,
    this._no,
  );

  String getDiscription() {
    return _discription;
  }

  String getQuantity() {
    return _quantity;
  }

  String getRate() {
    return _rate;
  }

  String getPercentage() {
    return _percentage;
  }

  String getTax() {
    return _tax;
  }

  String getTotal() {
    return _total;
  }

  String getNo() {
    return _no;
  }
}
