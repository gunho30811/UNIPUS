import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationsEnabled = true;
  TimeOfDay _startTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 18, minute: 0);

  void _toggleNotifications(bool value) {
    setState(() {
      _isNotificationsEnabled = value;
    });
  }

  void _selectStartTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (newTime != null) {
      setState(() {
        _startTime = newTime;
      });
    }
  }

  void _selectEndTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (newTime != null) {
      setState(() {
        _endTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Name'),
            subtitle: Text('Edit'),
            onTap: () {
              // show name editing popup
            },
          ),
          SwitchListTile(
            title: Text('Notifications'),
            value: _isNotificationsEnabled,
            onChanged: _toggleNotifications,
          ),
          ListTile(
            title: Text('Category'),
            subtitle: Text('Settings'),
            onTap: () {
              // show category settings popup
            },
          ),
          ListTile(
            title: Text('Weekly Timetable'),
            subtitle: Text('Time Setting'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // show weekly timetable popup
            },
          ),
          ListTile(
            title: Text('Start Time'),
            subtitle: Text('${_startTime.format(context)}'),
            onTap: () {
              _selectStartTime(context);
            },
          ),
          ListTile(
            title: Text('End Time'),
            subtitle: Text('${_endTime.format(context)}'),
            onTap: () {
              _selectEndTime(context);
            },
          ),
          ListTile(
            title: Text('User Code'),
            subtitle: Text('User Code Information'),
            onTap: () {
              // show user code information popup
            },
          ),
          ListTile(
            title: Text('Change Version'),
            subtitle: Text('Settings'),
            onTap: () {
              // show version change popup
            },
          ),
          ListTile(
            title: Text('Change Mentee'),
            subtitle: Text('Settings'),
            onTap: () {
              // show mentee change popup
            },
          ),
        ],
      ),
    );
  }
}