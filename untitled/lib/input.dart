import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'data_i.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Box<DateTime> scheduleBox;
  var cntrl=TextEditingController();
  DateTime date=DateTime.now();
  Info data=Info();

  @override
  void initState(){
    super.initState();
    scheduleBox = Hive.box<DateTime>("Data");
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Event"),
        backgroundColor: Colors.orange[600],
      ),
      backgroundColor: Colors.orange[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(controller: cntrl,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Date:", style: TextStyle(fontSize: 28, fontStyle: FontStyle.italic),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${date.day}-${date.month}-${date.year}",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async{

                        DateTime? newdate=await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(date.year),
                            lastDate: DateTime(2100)
                        );
                        if (newdate==null) return ;
                        setState(() {
                          date=newdate;
                        });


                    },
                    child: Icon(Icons.edit_calendar)
                ),
              ),
            ],
          ),

          TextButton(
              onPressed: (){
                setState(() {
                  data.dt=date;
                  data.evnt=cntrl.text;
                  scheduleBox.put(data.evnt, data.dt);
                  Navigator.pushReplacementNamed(context, '/',arguments: {
                    data.dt,data.evnt
                  });


                });
              },
              child: const Text("Confirm")
          )

        ],
      ),
    );
  }
}
