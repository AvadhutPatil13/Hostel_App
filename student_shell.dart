import 'package:flutter/material.dart';

import 'pages/student_dashboard_page.dart';
import 'pages/student_my_room_page.dart';
import 'pages/student_complaints_page.dart';
import 'pages/student_submit_complaint_page.dart';

class StudentShell extends StatefulWidget {
  const StudentShell({super.key});

  @override
  State<StudentShell> createState() => _StudentShellState();
}

class _StudentShellState extends State<StudentShell> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final destinations = const <NavigationRailDestination>[
      NavigationRailDestination(
        icon: Icon(Icons.dashboard_outlined),
        selectedIcon: Icon(Icons.dashboard),
        label: Text('Dashboard'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.meeting_room_outlined),
        selectedIcon: Icon(Icons.meeting_room),
        label: Text('My room'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.report_outlined),
        selectedIcon: Icon(Icons.report),
        label: Text('Complaints'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.add_comment_outlined),
        selectedIcon: Icon(Icons.add_comment),
        label: Text('New complaint'),
      ),
    ];

    final pages = const <Widget>[
      StudentDashboardPage(),
      StudentMyRoomPage(),
      StudentComplaintsPage(),
      StudentSubmitComplaintPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Panel'),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _index,
            onDestinationSelected: (v) => setState(() => _index = v),
            labelType: NavigationRailLabelType.all,
            destinations: destinations,
          ),
          const VerticalDivider(width: 1),
          Expanded(child: pages[_index]),
        ],
      ),
    );
  }
}

