import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NameEdit extends StatelessWidget {
  const NameEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      // 컨텐츠 패딩 조절
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('내 이름 수정하기'),
          IconButton(
            splashRadius: 1,
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: ConstrainedBox(
        // ConstrainedBox 추가
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.75, // 최소 가로 길이 설정
          maxWidth: MediaQuery.of(context).size.width * 0.9, // 최대 가로 길이 설정
        ),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Icon(Icons.pending_actions),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('확인'),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('취소'),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ],
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final Color color;
  final String categoryName;

  const CategoryListTile({
    required this.color,
    required this.categoryName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(categoryName),
        ],
      ),
      trailing: GestureDetector(
        child: const Icon(Icons.edit),
        onTap: () {
          Navigator.of(context).pop(); // 이전 팝업 닫기
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CategoryEditPopup(categoryName: categoryName);
            },
          );
        },
      ),
    );
  }
}

class CategoryListPopup extends StatelessWidget {
  const CategoryListPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '카테고리 설정',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CategoryListTile(
              color: Color(0xffE66F51),
              categoryName: '카테고리 1',
            ),
            CategoryListTile(
              color: Color(0xffED94A6),
              categoryName: '카테고리 2',
            ),
            CategoryListTile(
              color: Color(0xffFDE36A),
              categoryName: '카테고리 3',
            ),
            CategoryListTile(
              color: Color(0xffFAAD5D),
              categoryName: '카테고리 4',
            ),
            CategoryListTile(
              color: Color(0xffF1D7CA),
              categoryName: '카테고리 5',
            ),
            CategoryListTile(
              color: Color(0xffD3BD9D),
              categoryName: '카테고리 6',
            ),
            CategoryListTile(
              color: Color(0xffD9D9D9),
              categoryName: '카테고리 7',
            ),
            CategoryListTile(
              color: Color(0xff6B6D6A),
              categoryName: '카테고리 8',
            ),
            CategoryListTile(
              color: Color(0xffB5CCDC),
              categoryName: '카테고리 9',
            ),
            CategoryListTile(
              color: Color(0xff806050),
              categoryName: '카테고리 10',
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryEditPopup extends StatefulWidget {
  final String categoryName;

  const CategoryEditPopup({required this.categoryName, Key? key}) : super(key: key);

  @override
  _CategoryEditPopupState createState() => _CategoryEditPopupState();
}

class _CategoryEditPopupState extends State<CategoryEditPopup> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.categoryName);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text(
        '카테고리 이름 수정',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: '새로운 카테고리 이름을 입력하세요',
          border: const UnderlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('취소'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('저장'),
          onPressed: () {
            // TODO: 카테고리 이름을 저장하는 로직 구현
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class VersionSelectPopup extends StatefulWidget {
  final List<String> categories;
  final String selectedCategory;

  const VersionSelectPopup({
    required this.categories,
    required this.selectedCategory,
    Key? key,
  }) : super(key: key);

  @override
  _VersionSelectPopupState createState() => _VersionSelectPopupState();
}

class _VersionSelectPopupState extends State<VersionSelectPopup> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.all(20),
      title: const Text('변경하기'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.categories
              .map(
                (category) => RadioListTile(
              title: Text(category),
              value: category,
              groupValue: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value as String;
                });
              },
            ),
          )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('취소'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('확인'),
          onPressed: () {
            // TODO: 선택한 카테고리를 저장하는 로직 구현
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
class TimePickerButton extends StatefulWidget {
  const TimePickerButton({Key? key}) : super(key: key);

  @override
  _TimePickerButtonState createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends State<TimePickerButton> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).copyWith().size.height / 4,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          _selectedTime = TimeOfDay.fromDateTime(newDateTime);
                        });
                      },
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),
                  CupertinoButton(
                    child: Text('설정'),
                    onPressed: () {
                      Navigator.pop(context, _selectedTime);
                    },
                  ),
                ],
              ),
            );
          },
        ).then((value) {
          if (value != null) {
            setState(() {
              _selectedTime = value;
            });
          }
        });
      },
      child: Text(
        '시작 시간 ${_selectedTime.format(context)}',
        style: const TextStyle(fontSize: 15, color: Color(0xffA8A8B0)),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }
}
class TimePickerButton1 extends StatefulWidget {
  const TimePickerButton1({Key? key}) : super(key: key);

  @override
  _TimePickerButtonState1 createState() => _TimePickerButtonState1();
}

class _TimePickerButtonState1 extends State<TimePickerButton1> {
  late TimeOfDay _selectedTime1;

  @override
  void initState() {
    super.initState();
    _selectedTime1 = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).copyWith().size.height / 4,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          _selectedTime1 = TimeOfDay.fromDateTime(newDateTime);
                        });
                      },
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),
                  CupertinoButton(
                    child: Text('설정'),
                    onPressed: () {
                      Navigator.pop(context, _selectedTime1);
                    },
                  ),
                ],
              ),
            );
          },
        ).then((value) {
          if (value != null) {
            setState(() {
              _selectedTime1 = value;
            });
          }
        });
      },
      child: Text(
        '종료 시간 ${_selectedTime1.format(context)}',
        style: const TextStyle(fontSize: 15, color: Color(0xffA8A8B0)),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }
}
