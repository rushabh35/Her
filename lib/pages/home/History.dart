import 'package:flutter/material.dart';
import 'package:her2/services/database.dart';
import 'package:her2/services/datetimeServices.dart';
import 'package:her2/widgets/errorWidget.dart';

import '../../models/period.dart';
import '../../models/user.dart';
import '../../widgets/loadingWidget.dart';
  
void main() {runApp(History());}  
  
class History extends StatefulWidget {

  User? currentUser;
  History({this.currentUser});

  @override  
  _DataTableExample createState() => _DataTableExample();  
}  
  
class _DataTableExample extends State<History> {

  List<Period>? periodList;

  DatabaseServices _databaseServices = DatabaseServices();

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(
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
              child: FutureBuilder(
                future: _databaseServices.getPeriodData(currentUser: widget.currentUser!),
                builder: (context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    periodList = snapshot.data;
                    return Container(
                      child: DataTable(
                        // dataRowColor: Colors.purple[400],
                        // headingRowColor: Colors.cyan,

                        columns: const [
                          DataColumn(label: Text('')),
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
                        rows: getDataRows()
                      ),
                    );
                  }
                  else if(snapshot.hasError){
                    debugPrint("history error: ${snapshot.error}");
                    return CustomErrorWidget();
                  }
                  else{
                    return LoadingWidget();
                  }
                }
              ),
            ),
          ])  
      );
  }

  List<DataRow> getDataRows(){
    List<DataRow> rows = [];
    for(int i=0;i<periodList!.length;i++){
      debugPrint("pl val $i : ${periodList![i].startDate}");
      rows.add(
          DataRow(cells: [
            DataCell(
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.edit),
                color: Color.fromARGB(255, 3, 233, 250),)
            ),
            DataCell(Text(getFormattedDate(periodList![i].startDate).toString(),
                style: TextStyle(fontSize: 18,color: Colors.white)
            )),
            DataCell(Text(daysBetween(periodList![i].startDate, periodList![i].endDate).toString(),
                style: TextStyle(fontSize: 18,color: Colors.white)
            )),
            DataCell(Text(i==(periodList!.length)-1 ? "-" : daysBetween(periodList![i+1].endDate, periodList![i].startDate).abs().toString(),
                style: TextStyle(fontSize: 18,color: Colors.white)
            )),
          ])
      );
    }
    return rows;
  }
  
}  



