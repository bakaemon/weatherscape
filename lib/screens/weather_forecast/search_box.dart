import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/controllers/location_controller.dart';
import 'package:weatherscape/utils/location_util.dart';
import 'package:weatherscape/utils/widget_util.dart';

import '../../constraints/constraints.dart';

class SearchBox extends ConsumerStatefulWidget {
  const SearchBox({Key? key}) : super(key: key);
  @override
  ConsumerState<SearchBox> createState() => _SearchRowState();
}

class _SearchRowState extends ConsumerState<SearchBox> {
  static const _radius = 30.0;

  late final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.text = ref.read(cityProvider);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // circular radius
  @override
  Widget build(BuildContext context) {
    return ref.watch(cityNameLocationController).when(
      data: (cityName) {
        _searchController.text = ref.read(cityProvider);
        return _buildSearchBox();
      },
      error: (e, s) {
        setState(() {
          WidgetTool.showSnackBar(context, e.toString());
        });
        return _buildSearchBox();
      },
      loading: () {
        _searchController.text = 'Loading...';
        return _buildSearchBox();
      },
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_radius),
                        bottomLeft: Radius.circular(_radius)),
                  ),
                ),
                onSubmitted: (value) =>
                    ref.read(cityProvider.notifier).state = value,
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                  bottomRight: Radius.circular(_radius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('search',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(cityProvider.notifier).state = _searchController.text;
            },
          )
        ],
      ),
    );
  }
}
