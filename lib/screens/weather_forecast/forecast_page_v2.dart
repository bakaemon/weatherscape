import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/constraints/app_colors.dart';
import 'package:weatherscape/constraints/style.dart';
import 'package:weatherscape/screens/weather_forecast/current_weather.dart';
import 'package:weatherscape/screens/weather_forecast/search_box_v2.dart';
import 'package:weatherscape/utils/gradient_container.dart';
import 'daily_weather.dart';

class ForecastPageV2 extends ConsumerStatefulWidget {
  const ForecastPageV2({super.key});

  @override
  ConsumerState<ForecastPageV2> createState() => _ForecastPageV2State();
}

class _ForecastPageV2State extends ConsumerState<ForecastPageV2> {
  //Variables needed to adapt FlexibleSpaceBar text color (title)
  late ScrollController _scrollController;
  bool lastStatus = true;
  double height = 400;
  double collapsingHeight = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    // return _scrollController.hasClients &&
    //     _scrollController.offset > (height - kToolbarHeight);
    return _scrollController.hasClients &&
        _scrollController.offset > (height - collapsingHeight);
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = ref.watch(backgroundProvider);
    height = MediaQuery.of(context).size.height * 55 / 100;
    collapsingHeight = height * 25 / 100;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: GradientContainer(
      color: ref.watch(backgroundProvider),
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 100,
              floating: true,
              pinned: true,
              backgroundColor: !_isShrink ? Colors.transparent : backgroundColor[800],
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: false,
                background: SearchBoxV2(),
              ),
            ),
            SliverAppBar.large(
              automaticallyImplyLeading: false,
                collapsedHeight: collapsingHeight * 100 / 100,
                expandedHeight: height,
                floating: true,
                pinned: true,
                backgroundColor: !_isShrink? Colors.transparent : backgroundColor[800],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: _isShrink
                      ? Column(
                          children: [
                            const SizedBox(height: 20),
                            CurrentWeather(
                              isExpanded: false,
                            ),
                          ],
                        )
                      : Column(children: [
                          const SizedBox(height: 20),
                          CurrentWeather(
                            isExpanded: true,
                          ),
                        ]),
                )),
          ];
        },
        body: Column(
          children: const [
            SizedBox(height: 50),
            DailyWeather(),
          ],
        ),
      ),
    ));
  }
}
