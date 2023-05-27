import 'package:chur/src/ui/catbox/catbox_album.dart';
import 'package:chur/src/ui/common/vesion_select.dart';
import 'package:chur/src/ui/setting/setting_home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/catbox_grade_provider.dart';
import '../../provider/character_provider.dart';

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

    final PageController _pageController = PageController();
    bool canAddContainer = false; //고양이 추가할 수 있는가

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: SingleChildScrollView(
          child: Center(
            child: Consumer<CharacterProvider>(
                builder: (context, characterProvider, child) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
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
                                child: Center(
                                    child: Container(
                                  width: screenWidth * 0.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xffFFF0CB)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.6,
                                        child: Image.asset(characterProvider
                                            .character.currentImage),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 7,
                                        width: screenWidth * 0.7,
                                        child: LinearProgressIndicator(
                                          value: characterProvider
                                              .getExpBarValue(),
                                          backgroundColor: Colors.grey,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color.fromARGB(
                                                      255, 250, 107, 41)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )));
                          } else {
                            return Container(
                              width: screenSize.width * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                              ),
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
                            onTap: () => characterProvider.useItem(0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/snack_1.png',
                                  width: 70,
                                  height: 70,
                                ),
                                Text(
                                  'x ${characterProvider.character.itemCounts[0]}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => characterProvider.useItem(1),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/snack_2.png',
                                  width: 70,
                                  height: 70,
                                ),
                                Text(
                                  'x ${characterProvider.character.itemCounts[1]}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => characterProvider.useItem(2),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(
                                  'assets/images/snack_3.png',
                                  width: 70,
                                  height: 70,
                                ),
                                Text(
                                  'x ${characterProvider.character.itemCounts[2]}',
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '이달의 성적',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectVersion()),
                                    );
                                  },
                                  child: Text('앨범 >',
                                      style: TextStyle(
                                        color: Color(0xffAEAEBA),
                                        fontSize: 18,
                                      )))
                            ],
                          ),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color(0xffECF0FA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 40,
                                width: excellentPercentage * 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffB6E8FD),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Excellent',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color(0xffECF0FA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 40,
                                width: goodPercentage * 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffBCF391),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Good',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Color(0xffECF0FA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                height: 40,
                                width: badPercentage * 3.5,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFC0C0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Bad',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
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
              );
            }),
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
    final categories = ['Category 1', 'Category 2', 'Category 3', 'Category 4'];

    return Center(
      child: SizedBox(
        height: 250,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            final items = itemProvider.itemsByCategory(categories[index]);

            // Calculate the grade counts
            int excellentCount =
                items.where((item) => item.grade == 'excellent').length;
            int goodCount = items.where((item) => item.grade == 'good').length;
            int badCount = items.where((item) => item.grade == 'bad').length;
            int totalCount = items.length;

            // Calculate the grade percentages
            double excellentPercentage =
                totalCount > 0 ? (excellentCount / totalCount) * 100 : 0;
            double goodPercentage =
                totalCount > 0 ? (goodCount / totalCount) * 100 : 0;
            double badPercentage =
                totalCount > 0 ? (badCount / totalCount) * 100 : 0;

            double scale = 1.0;
            double opacity = 0.8;
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
                    child: Column(
                      children: [
                        Text(
                          categories[index],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 170,
                          child: PieChart(
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
                                // add your additional categories and corresponding colors here
                              ],
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
          itemCount: categories.length,
        ),
      ),
    );
  }
}
