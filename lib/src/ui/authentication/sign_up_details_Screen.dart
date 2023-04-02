import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class SignUpDetailsScreen extends StatefulWidget {
  final String email;
  final String password;

  SignUpDetailsScreen({required this.email, required this.password});

  @override
  _SignUpDetailsScreenState createState() => _SignUpDetailsScreenState();
}

class _SignUpDetailsScreenState extends State<SignUpDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String? _gender;
  String _birthDate = '';
  final _phoneController = MaskedTextController(mask: '000-0000-0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 추가 정보'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: '이름'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이름을 입력해주세요.';
                }
                return null;
              },
              onSaved: (value) => _name = value!,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: '성별'),
              value: _gender,
              items: [
                DropdownMenuItem(child: Text('남성'), value: '남성'),
                DropdownMenuItem(child: Text('여성'), value: '여성'),
              ],
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '생년월일 (YYYY-MM-DD)'),
              readOnly: true,
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _birthDate = '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                  });
                }
              },
              controller: TextEditingController(text: _birthDate),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '생년월일을 선택해주세요.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: '전화번호 (예: 010-1234-5678)'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '전화번호를 입력해주세요.';
                }
                return null;
              },
              onSaved: (value) => _phoneController.text = value!,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('회원가입 완료'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // 이곳에서 회원가입 완료 API를 호출하고 결과를 처리하세요.
      // 사용자가 입력한 정보를 서버에 전송하고 회원가입 프로세스를 완료하도록 구현

      Navigator.of(context).popUntil((route) => route.isFirst);
      }
      }
}
