import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 248, 99, 114),
          title: Text("Donate"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: ExactAssetImage("images/o.jpg"),
                        radius: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Choose your Blood Type",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GroupButton(
                        selectedColor: Color.fromARGB(255, 248, 99, 114),
                        direction: Axis.horizontal,
                        buttonWidth: 70,
                        buttonHeight: 40,
                        borderRadius: BorderRadius.circular(10),

                        spacing: 10,
                        runSpacing: 15,
                        mainGroupAlignment: MainGroupAlignment.center,
                        crossGroupAlignment: CrossGroupAlignment.center,
                        groupRunAlignment: GroupRunAlignment.spaceEvenly,

                        buttons: [
                          "A+",
                          "A-",
                          "B+",
                          "B-",
                          "AB+",
                          "AB-",
                          "O+",
                          "O-"
                        ],
                        isRadio: true,
                        onSelected: (index, isSelected) => print(
                            "$index button is ${isSelected ? 'selected,' : 'un selected'}"),
                        //  onSelected: (index, isSelected) => print("$index button is ${isselected ? 'selected': 'un selected'}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _date,
                              decoration: InputDecoration(
                                  // icon: Icon(Icons.ac_unit_sharp),
                                  suffixIcon: Icon(Icons.calendar_view_day),
                                  labelText: "Last Date of Donation"),
                              onTap: () async {
                                DateTime pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickeddate != null) {
                                  setState(() {
                                    _date.text = DateFormat("yyyy-mm-dd")
                                        .format(pickeddate);
                                  });
                                }
                              },
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  suffixIcon:
                                      Icon(Icons.directions_car_outlined),
                                  labelText: "Any Medical issues"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              minWidth: double.infinity,
                              color: Color.fromARGB(255, 248, 99, 114),
                              onPressed: () {
                                // Navigator.push(context,
                                //  MaterialPageRoute(builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                "JOIN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
