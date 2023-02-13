import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static var fontsize = 9.0;
  static var reside = 20.0;
  static getTitleData() => FlTitlesData(
        show: true,
        rightTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTextStyles: (context, axisValue) => TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: fontsize * 80 / 100,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'LOW';
              case 3:
                return 'MODERATE';
              case 6:
                return 'HIGH';
              case 9:
                return 'VERY HIGH';
              case 11:
                return 'EXTREME';
            }
            return '';
          },
          margin: 8,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: reside,
          getTextStyles: (context, axisValue) => TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: fontsize,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0h';
              case 4:
                return '4H';
              case 8:
                return '8H';
              case 12:
                return '12H';
              case 16:
                return '16H';
              case 20:
                return '20';
              case 23:
                return '23H';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, axisValue) => TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: fontsize,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0.0';
              case 1:
                return '1.0';
              case 3:
                return '3.0';
              case 5:
                return '5.0';
              case 7:
                return '7.0';
              case 9:
                return '9.0';
              case 11:
                return '11.0';
              case 12:
                return '11+';
            }
            return '';
          },
          reservedSize: reside,
          margin: 12,
        ),
      );
}