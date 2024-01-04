import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InformsTab extends StatelessWidget {
  static const String routrName = "InformsTab";
  static const List<String> langDropdownValues = ["500", "600", "700", "800"];
  final List<ChartData> chartDataCbc = [
    ChartData(2010, 0),
    ChartData(2011, 10),
    ChartData(2012, 20),
    ChartData(2013, 30),
    ChartData(2014, 40)
  ];
  final List<ChartData> chartDataHemo = [
    ChartData(1, 35),
    ChartData(2, 23),
    ChartData(3, 34),
    ChartData(4, 25),
    ChartData(5, 40)
  ];

  InformsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .30,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/back_info.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Background Image
                Positioned(
                  top: 50,
                  left: 10,
                  child: Text(
                    "Ahmed Khaled",
                    style: GoogleFonts.openSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .35,
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.lightBlueAccent,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: const Text('Enter'),
                            items: langDropdownValues
                                .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (_) {},
                            isExpanded: true,
                            value: '500',
                          ),
                        ),
                      ),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image:
                                NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CBC",
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/area_chart.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SfCartesianChart(
                        primaryYAxis: const CategoryAxis(
                          isVisible: false,
                        ),
                        series: <CartesianSeries>[
                          SplineSeries<ChartData, int>(
                              dataSource: chartDataCbc,
                              // Type of spline
                              splineType: SplineType.cardinal,
                              cardinalSplineTension: 0.9,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hemoglobin",
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white70),
                    child: SfCartesianChart(
                        series: <CartesianSeries<ChartData, int>>[
                          // Renders column chart
                          ColumnSeries<ChartData, int>(
                              dataSource: chartDataHemo,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double? y;
}
