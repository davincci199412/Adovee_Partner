import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 10, 9), 5),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 20),
      new TimeSeriesSales(new DateTime(2017, 10, 11), 10),
      new TimeSeriesSales(new DateTime(2017, 10, 12), 46),
      new TimeSeriesSales(new DateTime(2017, 10, 13), 64),
      new TimeSeriesSales(new DateTime(2017, 10, 14), 33),
      
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}


class ChartPage extends StatefulWidget {
  ChartPage({Key key, this.width, this.height}) : super(key: key);

  final double width;
  final double height;


  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.cyanAccent,
        child: SimpleTimeSeriesChart.withSampleData(),
      ), 
    );
  }
}