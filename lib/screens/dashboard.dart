// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_ui/constants/appConstants.dart';
import 'package:pos_ui/screens/pos.dart';
import 'package:pos_ui/utils/drawer.dart';
import 'package:pos_ui/utils/invoiceWidget.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //////////////////////////////////////////
  bool daily = true;
  bool? weekly = false;
  bool? monthly = false;
  Color colorDaily = Color(0xFF0A9F86);
  Color colorWeekly = Colors.white;
  Color colorMonthly = Colors.white;
  Color textDaily = Colors.white;
  Color textWeekly = Colors.black;
  Color textMonthly = Colors.black;
  //////////////////////////////////////////
  SfCartesianChart _buildSplineAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          interval: 1,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<_SplineAreaData>? chartData;

  void chartDetails() {
    if (daily == true && weekly == false && monthly == false) {
      chartData = <_SplineAreaData>[
        _SplineAreaData(10, 10.53, 3.3),
        _SplineAreaData(11, 9.5, 5.4),
        _SplineAreaData(12, 10, 2.65),
        _SplineAreaData(13, 9.4, 2.62),
        _SplineAreaData(14, 5.8, 1.99),
        _SplineAreaData(15, 4.9, 1.44),
        _SplineAreaData(16, 4.5, 2),
        _SplineAreaData(17, 3.6, 1.56),
        _SplineAreaData(18, 3.43, 2.1),
      ];
    }
    if (daily == false && weekly == true && monthly == false) {
      chartData = <_SplineAreaData>[
        _SplineAreaData(20, 10.53, 3.3),
        _SplineAreaData(21, 10.5, 5.4),
        _SplineAreaData(22, 12, 2.40),
        _SplineAreaData(23, 10.8, 2.62),
        _SplineAreaData(24, 8.4, 1.99),
        _SplineAreaData(25, 7.3, 1.44),
        _SplineAreaData(26, 9.2, 2),
        _SplineAreaData(27, 10.2, 2.16),
        _SplineAreaData(28, 5.32, 2.1),
      ];
    }
    if (daily == false && weekly == false && monthly == true) {
      chartData = <_SplineAreaData>[
        _SplineAreaData(11, 20.53, 4.3),
        _SplineAreaData(21, 10.5, 6.4),
        _SplineAreaData(22, 10, 2.65),
        _SplineAreaData(23, 9.4, 2.62),
        _SplineAreaData(24, 5.8, 1.99),
        _SplineAreaData(25, 4.9, 1.44),
        _SplineAreaData(26, 4.5, 2),
        _SplineAreaData(27, 3.6, 1.56),
        _SplineAreaData(28, 3.43, 2.1),
      ];
    }
  }

  @override
  void initState() {
    chartDetails();
    super.initState();
  }

  /// Returns the list of chart series
  /// which need to render on the spline area chart.
  List<ChartSeries<_SplineAreaData, double>> _getSplieAreaSeries() {
    return <ChartSeries<_SplineAreaData, double>>[
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData!,
        color: tealAppColorLight,
        borderColor: tealAppColor,
        borderWidth: 2,
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y1,
      ),
      SplineAreaSeries<_SplineAreaData, double>(
        dataSource: chartData!,
        borderColor: blueAppColor,
        color: blueAppColorLight,
        borderWidth: 2,
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.y2,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }

  List<DashboardInfoWidget> listOfWidgets = [
    DashboardInfoWidget(
      bgColor: blueAppColorLight,
      iconBgColor: blueAppColorBg,
    ),
    DashboardInfoWidget(
      bgColor: tealAppColorLight,
      iconBgColor: tealAppColorBg,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.15,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: listOfWidgets,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 350,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(20, 0, 0, 0),
                    spreadRadius: 3,
                    blurRadius: 15)
              ],
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                              const Color.fromARGB(73, 130, 199, 255),
                          child: SvgPicture.asset(
                            'assets/cc.svg',
                            color: blueAppColor,
                            height: 22,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Your Income Report',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showMyBottomSheet(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: blueAppColor),
                        ),
                        child: Text(
                          'Invoices',
                          style: TextStyle(color: blueAppColor),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                          ////////////////////////////////////////
                          child: InkWell(
                        onTap: () {
                          setState(() {
                            colorDaily = Color(0xFF0A9F86);
                            colorMonthly = Colors.white;
                            colorWeekly = Colors.white;
                            daily = true;
                            weekly = false;
                            monthly = false;
                            chartDetails();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 12,
                                    spreadRadius: 2)
                              ],
                              color: colorDaily,
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          child: Center(
                              child: Text(
                            'Daily',
                            style: TextStyle(color: textDaily),
                          )),
                        ),
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: InkWell(
                        ////////////////////////////////////////
                        onTap: () {
                          setState(() {
                            colorDaily = Colors.white;
                            colorMonthly = Colors.white;
                            colorWeekly = Color(0xFF0A9F86);
                            textDaily = Colors.black;
                            textWeekly = Colors.white;
                            textMonthly = Colors.black;
                            daily = false;
                            weekly = true;
                            monthly = false;
                            chartDetails();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 12,
                                  spreadRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: colorWeekly,
                          ),
                          height: 40,
                          child: Center(
                              child: Text(
                            'Weekly',
                            style: TextStyle(color: textWeekly),
                          )),
                        ),
                      )),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: InkWell(
                        ////////////////////////////////////////
                        onTap: () {
                          setState(() {
                            colorDaily = Colors.white;
                            colorMonthly = Color(0xFF0A9F86);
                            colorWeekly = Colors.white;
                            textDaily = Colors.black;
                            textWeekly = Colors.black;
                            textMonthly = Colors.white;
                            daily = false;
                            weekly = false;
                            monthly = true;
                            chartDetails();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 12,
                                    spreadRadius: 2)
                              ],
                              color: colorMonthly,
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          child: Center(
                            child: Text(
                              'Monthly',
                              style: TextStyle(color: textMonthly),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 200, child: _buildSplineAreaChart()),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // Recent Activities
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color.fromARGB(73, 130, 199, 255),
                  child: SvgPicture.asset(
                    'assets/transactions.svg',
                    color: blueAppColor,
                    height: 22,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            // padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromARGB(108, 149, 250, 153),
                  child: Icon(
                    Icons.arrow_upward,
                    size: 20,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Received',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'December 23, 2022',
                      style: TextStyle(
                          color: Color.fromARGB(87, 0, 0, 0), fontSize: 12),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '+ S/23,000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                    Text(
                      'S/1234,32400',
                      style: TextStyle(
                          color: Color.fromARGB(87, 0, 0, 0), fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.all(12),
            // padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromARGB(108, 250, 149, 149),
                  child: Icon(
                    Icons.arrow_downward,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Sent',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'December 29, 2022',
                      style: TextStyle(
                          color: Color.fromARGB(87, 0, 0, 0), fontSize: 12),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '- S/23,000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                    Text(
                      'S/1234,32400',
                      style: TextStyle(
                          color: Color.fromARGB(87, 0, 0, 0), fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

class _SplineAreaData {
  _SplineAreaData(this.year, this.y1, this.y2);
  final double year;
  final double y1;
  final double y2;
}

// F6D78B
class DashboardInfoWidget extends StatelessWidget {
  final Color bgColor;
  final Color iconBgColor;
  const DashboardInfoWidget({
    required this.bgColor,
    required this.iconBgColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: iconBgColor,
                    child: SvgPicture.asset(
                      'assets/money.svg',
                      height: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Total Profit With Invoices',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: iconBgColor,
                ),
                child: const Center(
                    child: Text(
                  '+ 23%',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          Expanded(
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'S/13,693.98',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                    child: SvgPicture.asset(
                  'assets/stats.svg',
                  height: 100,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showMyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(30),
    )),
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.8,
        minChildSize: 0.15,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            height: 300.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Invoice List",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(5, (index) {
                      return const InvoiceWidget();
                    }),
                  ),
                ],
              ),
            ),
          );
        }),
  );
}
