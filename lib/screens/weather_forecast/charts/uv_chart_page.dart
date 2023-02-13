import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherscape/utils/charts/linechart.dart';

class UVChart extends ConsumerWidget {
  const UVChart({super.key, required this.uvData});

  final List<double> uvData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('UV Chart'),
        IconButton(
          icon: const Icon(Icons.warning),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text('UV page'), centerTitle: true),
                  body: Padding(
                    padding: const EdgeInsets.all(8),
                    child: PageView(
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          color: const Color(0xff020227),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: LineChartWidget(
                              data: const [1, 2, 5, 13, 4, 3],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
