import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/controllers/location_controller.dart';
import 'package:weatherscape/utils/widget_util.dart';

class SearchBoxV2 extends ConsumerStatefulWidget with PreferredSizeWidget {
  const SearchBoxV2({Key? key}) : super(key: key);
  @override
  ConsumerState<SearchBoxV2> createState() => _SearchRowState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _SearchRowState extends ConsumerState<SearchBoxV2> {
  final cityEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ref.watch(cityNameLocationController).when(
      data: (cityName) {
        cityEditController.text = ref.watch(cityProvider);
        return _buildSearchBoxAppBar();
      },
      error: (e, s) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          WidgetTool.showSnackBar(
              context, "Error while fetching city name's weather data.");
        });
        return _buildSearchBoxAppBar();
      },
      loading: () {
        return _buildSearchBoxAppBar();
      },
    );
  }

  _buildSearchBox() {
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
              icon: const Icon(Icons.search),
              onPressed: () {
                ref.read(cityProvider.notifier).state = cityEditController.text;
              },
            ),
            const SizedBox(width: 10),
            Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                    controller: cityEditController,
                    decoration:
                        const InputDecoration.collapsed(hintText: "Enter City"),
                    onSubmitted: (String city) => ref
                        .read(cityProvider.notifier)
                        .state = cityEditController.text,
                      )
                      ),
          ],
        ));
  }

  _buildSearchBoxAppBar() {
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
                child: TextField(
              style: const TextStyle(color: Colors.black),
              controller: cityEditController,
              decoration:
                  const InputDecoration.collapsed(hintText: "Enter City"),
              onSubmitted: (String city) => ref
                  .read(cityProvider.notifier)
                  .state = cityEditController.text,
            )),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                ref.read(cityProvider.notifier).state = cityEditController.text;
              },
            ),
          ],
        ));
  }
}
