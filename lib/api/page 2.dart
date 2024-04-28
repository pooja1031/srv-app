
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State
   {
  final String apiUrl = "https://asapapi.srvinfotech.com/staff/api/auth/sidebar";
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU1NjIyYjhhOTExMjcxMGZkZGE5ZjYiLCJpYXQiOjE3MTM4NDUyODUsImV4cCI6MTcxNTU3MzI4NX0.9Je7bJl4tnR18tc0k7pT7kQ38jB1PZDsIZHoI6ltv2I";
  List<Map<String, dynamic>> sidebarData = [];
  String firstName = '';
  String lastName = '';
  int tappedReportIndex = -1; 

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {"x-access-token": token},
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['code'] == 200) {
          setState(() {
            if (responseData['data'] is List) {
              sidebarData = List<Map<String, dynamic>>.from(responseData['data']);
            }
            firstName = responseData['user']['firstName'];
            lastName = responseData['user']['lastName'];
          });
        }
      } else {
        print("Error fetching data: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Color(0xFFFF7A2F),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, ),
              child: Text(
                "Hi,",
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: [
                  Text(" $firstName",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 23),),
                  Text(" $lastName",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 23),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), 
                    color: Color.fromARGB(255, 252, 250, 250), 
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        SizedBox(height: 20), 
                        Icon(Icons.document_scanner_outlined),
                        SizedBox(height: 20), 
                        Icon(Icons.report),
                        SizedBox(height: 20), 
                        Icon(Icons.event_seat_outlined),
                        SizedBox(height: 20), 
                        Icon(Icons.join_full_outlined),
                        SizedBox(height: 20), 
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sidebarData.map((data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              tappedReportIndex = sidebarData.indexOf(data) == tappedReportIndex ? -1 : sidebarData.indexOf(data);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(
                              '${data['english_name']}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: tappedReportIndex == sidebarData.indexOf(data) && data['sub_menu'] != null,
                          child: Column(
                            children: List.generate(
                              data['sub_menu'].length,
                              (subIndex) => Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${data['sub_menu'][subIndex]['english_name']}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ).toList(),
                          ),
                        ),
                        SizedBox(height: 14),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
SizedBox(height: 30,),
            Row(
              children: [
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), 
                    color: Color.fromARGB(255, 252, 250, 250), 
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        SizedBox(height: 20), 
                        Icon(Icons.document_scanner_outlined),
                        SizedBox(height: 20),
                        Icon(Icons.report),
                        SizedBox(height: 20), 
                        Icon(Icons.event_seat_outlined),
                        SizedBox(height: 20), 
                        Icon(Icons.join_full_outlined),
                        SizedBox(height: 20), 
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sidebarData.map((data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              tappedReportIndex = sidebarData.indexOf(data) == tappedReportIndex ? -1 : sidebarData.indexOf(data);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 1.0),
                            child: Text(
                              '${data['english_name']}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: tappedReportIndex == sidebarData.indexOf(data) && data['sub_menu'] != null,
                          child: Column(
                            children: List.generate(
                              data['sub_menu'].length,
                              (subIndex) => Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  '${data['sub_menu'][subIndex]['english_name']}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ).toList(),
                          ),
                        ),
                        SizedBox(height: 14),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
