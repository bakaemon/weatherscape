import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weatherscape/utils/country_util.dart';

class SearchBoxAutoComplete extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  bool isExpanded = false;

  Future<List<List<String>>> suggestionDelegate;

  SearchBoxAutoComplete(
      {super.key,
      required this.controller,
      required this.suggestionDelegate,
      required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 50),
        padding: const EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
              bottomLeft: Radius.circular(3),
              bottomRight: Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
            const SizedBox(width: 10),
            Expanded(
                child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                style: const TextStyle(color: Colors.black),
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
              ),
              suggestionsCallback: (pattern) async {
                return await suggestionDelegate.then((value) => pattern.isEmpty
                    ? []
                    : value
                        .where((element) => element[0]
                            .toLowerCase()
                            .contains(pattern.toLowerCase()))
                        .toList());
              },
              suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                constraints: BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 150,
                ),
              ),
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion[0],
                      style: const TextStyle(color: Colors.black)),
                  subtitle: Text(CountryUtil.countries[suggestion[1]] ?? 'Unknown Country',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 111, 111, 111))),
                );
              },
              onSuggestionSelected: (suggestion) {
                controller.text = suggestion[0];
                onSubmitted(controller.text);
              },
            )),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                onSubmitted(controller.text);
              },
            ),
          ],
        ));
  }
}
