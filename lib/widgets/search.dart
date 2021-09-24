import 'package:flutter/material.dart';

class SearchClients extends SearchDelegate<dynamic> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

class Searcher extends StatefulWidget {
  Searcher({Key? key}) : super(key: key);

  @override
  _SearcherState createState() => _SearcherState();
}

class _SearcherState extends State<Searcher> {
  var _search = new TextEditingController();

  bool firstSearch = true;
  String _query = '';

  List<String> list = [];
  List<String> filter = [];
  @override
  void initState() {
    
    super.initState();
  }


  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
