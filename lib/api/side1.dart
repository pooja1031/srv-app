
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:srv_app/widgets/imagetext.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> dashboardData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = 'https://asapapi.srvinfotech.com/staff/api/dashboard/batch/card';
    final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU1NjIyYjhhOTExMjcxMGZkZGE5ZjYiLCJpYXQiOjE3MTM4NDUyODUsImV4cCI6MTcxNTU3MzI4NX0.9Je7bJl4tnR18tc0k7pT7kQ38jB1PZDsIZHoI6ltv2I';
    final response = await http.get(
      Uri.parse(url),
      headers: {'x-access-token': token},
    );
    
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
            print(jsonData); 

      setState(() {
        dashboardData = List<Map<String, dynamic>>.from(jsonData['data']);
      });
    } else {
      print('Failed to load dashboard data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: dashboardData.length,
              itemBuilder: (context, index) {
                final batch = dashboardData[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Images/cardbckg.png'), 
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListTile(
                      title: Text(batch['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${batch['name']}'),
                          Text('Course Name: ${batch['course']['name']}'),
                          Text('Start Date: ${batch['startDate']}'),
                          Text('End Date: ${batch['endDate']}'),
                          Text('Branch Name: ${batch['branch']['name']}'),
                          Text('Unique ID: ${batch['uniqueId']}'),

                          Image.asset(
                  'assets/Images/Line 214.png',
                  width: 744,
                  height: 14,
                ),


              Column(
          children: <Widget>[
            ImageTextRow(
              imagePaths: [
                                'assets/Images/Group 2192.png',

                'assets/Images/Group 2190.png',
                'assets/Images/Group 2191.png',
                'assets/Images/Group 2193.png',
              ],
              texts: ['Attendance ', 'QF Work ', 'Students View', 'Assessment '],
            ),
            SizedBox(height: 20),
            
          ],
                          )    ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}