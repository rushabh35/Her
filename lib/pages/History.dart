import 'package:flutter/material.dart';  
  
void main() {runApp(History());}  
  
class History extends StatefulWidget {  
  @override  
  _DataTableExample createState() => _DataTableExample();  
}  
  
class _DataTableExample extends State<History> {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor: Color(0xFF333A47),
        // drawerScrimColor: Colors.white,
          body: ListView(
            children: <Widget>[
            Center(  
                child: Text(  
                  'History', 

                  style: TextStyle(fontSize: 25,color: Colors.white),  
                )),  
                SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: DataTable(
                  // dataRowColor: Colors.purple[400],
                  // headingRowColor: Colors.cyan,

                  columns: const [
                    DataColumn(label: Text(
                        'Cycle Start',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                    )),
                    DataColumn(label: Text
                    (
                        'Period Length',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                        // style: TextStyle(fontSize: 18,)
                    ),
                    ),
                    DataColumn(label: Text(
                        'Cycle Length',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                        // style: TextStyle(fontSize: 18,)
                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Apr 1,2022',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                      DataCell(Text('3',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                      DataCell(Text('-',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Apr 14,2022',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                      DataCell(Text('5',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                      DataCell(Text('13',
                        style: TextStyle(fontSize: 18,color: Colors.white)
                      )),
                    ]),
                  ],
                ),
              ),
            ),
          ])  
      ),  
    );  
  }

  row() {}  
  
}  



