import 'package:chur/src/ui/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.black,
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 16),
                Text('설정하기', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: displayWidth(context) * 0.9,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name'),
                        TextButton(
                          onPressed: () {
                            // show name edit popup
                          },
                          child: Text('Edit'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.notifications),
                        Text('Notification Settings'),
                        CupertinoSwitch(
                          value: true,
                          onChanged: (value) {
                            // toggle notifications on/off
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.palette),
                        Text('Category'),
                        TextButton(
                          onPressed: () {
                            // show category setting popup
                          },
                          child: Text('Setting'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.access_time),
                        Text('Set Start Time for Weekly Timetable'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Start Time'),
                        SizedBox(width: 8),
                        CupertinoButton(
                          onPressed: () {
                            // show start time picker
                          },
                          child: Text('12:00AM'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('End Time'),
                        SizedBox(width: 8),
                        CupertinoButton(
                          onPressed: () {
                            // show end time picker
                          },
                          child: Text('6:00PM'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person),
                        Text('User Code'),
                        TextButton(
                          onPressed: () {
                            // show user code information
                          },
                          child: Text('123456A'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.compare_arrows),
                        Text('Change Version'),
                        TextButton(
                          onPressed: () {
                            // show version change popup
                          },
                          child: Text('Mento'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.compare_arrows),
                        Text('Change Mentee'),
                        TextButton(
                          onPressed: () {
                            // show mentee change popup
                          },
                          child: Text('123456A Kim mentee'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
