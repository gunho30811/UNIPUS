import 'package:chur/src/ui/setting/setting_home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/catbox_grade_provider.dart';

class CatBoxHome extends StatefulWidget {
  const CatBoxHome({Key? key}) : super(key: key);

  @override
  _CatBoxHomeState createState() => _CatBoxHomeState();
}

class _CatBoxHomeState extends State<CatBoxHome> {
  int pageCount = 1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenSize = MediaQuery.of(context).size;

    final PageController _pageController = PageController();
    bool canAddContainer = false; //고양이 추가할 수 있는가

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '사용자 닉네임',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, size: 30),
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingHome()),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: screenHeight * 0.35,
                    child: PageView.builder(
                      itemCount: pageCount + 1,
                      controller: _pageController,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < pageCount) {
                          return Container(
                            width: screenSize.width * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Center(child: Text('Page 1')),
                          );
                        } else {
                          return Container(
                            width: screenSize.width * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.add, size: 40),
                                onPressed: () {
                                  if (canAddContainer) {
                                    setState(() {
                                      pageCount += 1;
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("알림"),
                                          content: Text("조건에 해당하지 않습니다."),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("확인"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Color(0xffFFF9EA),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('아이템1'),
                                  content: Text('Content'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/images/snack_1.png',
                                width: 70,
                                height: 70,
                              ),
                              Text(
                                'x4',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('아이템2'),
                                  content: Text('Content'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/images/snack_2.png',
                                width: 70,
                                height: 70,
                              ),
                              Text(
                                'x4',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('아이템3'),
                                  content: Text('Content'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/images/snack_3.png',
                                width: 70,
                                height: 70,
                              ),
                              Text(
                                'x4',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        '닉네임',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '의 카테고리',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleChartView(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CircleChartView extends StatefulWidget {
  @override
  _CircleChartViewState createState() => _CircleChartViewState();
}

class _CircleChartViewState extends State<CircleChartView> {
  final PageController _pageController =
      PageController(viewportFraction: 0.6, initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(() {
      setState(() {});
    });
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final items = itemProvider.itemsByMonth(DateTime.now().month);

    // Calculate the grade counts
    int excellentCount =
        items.where((item) => item.grade == 'excellent').length;
    int goodCount = items.where((item) => item.grade == 'good').length;
    int badCount = items.where((item) => item.grade == 'bad').length;
    int totalCount = items.length;

    // Calculate the grade percentages
    double excellentPercentage =
        totalCount > 0 ? (excellentCount / totalCount) * 100 : 0;
    double goodPercentage = totalCount > 0 ? (goodCount / totalCount) * 100 : 0;
    double badPercentage = totalCount > 0 ? (badCount / totalCount) * 100 : 0;
    return Center(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            double scale = 1.0;
            double opacity = 0.6;
            if (_pageController.position.haveDimensions) {
              double diff = (index - _pageController.page!).abs();
              scale = 1 - (0.2 * diff);
              opacity = diff <= 0.3 ? 1 - (0.5 * diff) : 0.5;
            }

            return Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: index == 0
                        ? PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  value: excellentPercentage,
                                  color: Color(0xffB6E8FD),
                                  title: 'Excellent',
                                ),
                                PieChartSectionData(
                                  value: goodPercentage,
                                  color: Color(0xffBCF391),
                                  title: 'Good',
                                ),
                                PieChartSectionData(
                                  value: badPercentage,
                                  color: Color(0xffFFC0C0),
                                  title: 'Bad',
                                ),
                              ],
                            ),
                          )
                        : index == 1
                            ? Text(
                                'Page 2: Another Chart',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )
                            : Text(
                                'Page 3: Different Chart',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                  ),
                ),
              ),
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
