import 'add_item_model.dart';

class InvoiceData {
  final String _invoiceNo;
  final String _invoiceDate;
  final String _clientData;
  final List<AddItemDetails> _items;
  final String _subTotal;
  final String _discount;
  final String _tax;
  final String _grandTotal;

  InvoiceData(
    this._invoiceNo,
    this._invoiceDate,
    this._clientData,
    this._items,
    this._subTotal,
    this._discount,
    this._tax,
    this._grandTotal,
  );

  String getInvoiceNo() {
    return _invoiceNo;
  }

  String getInvoiceDate() {
    return _invoiceDate;
  }

  String getClientData() {
    return _clientData;
  }

  List<AddItemDetails> getItemsList() {
    return _items;
  }

  String getSubTotal() {
    return _subTotal;
  }

  String getDiscount() {
    return _discount;
  }

  String getTax() {
    return _tax;
  }

  String getGrandTotal() {
    return _grandTotal;
  }
}
