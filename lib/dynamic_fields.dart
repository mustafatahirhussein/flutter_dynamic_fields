import 'package:flutter/material.dart';

class DynamicFields extends StatefulWidget {
  const DynamicFields({Key? key}) : super(key: key);

  @override
  State<DynamicFields> createState() => _DynamicFieldsState();
}

class _DynamicFieldsState extends State<DynamicFields> {

  List<Widget> list = [];
 // List<String> items = [];
  int counter = 0;

 // String text  = "No value";

List<Map<String, dynamic>> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        shrinkWrap: true,
        children: [

          ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (_, i) {
              return buildField(i);
            },
          ),


        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Text("+"),
            onPressed: () {
              setState(() {
                counter++;
                list.add(buildField(counter));
              });
            },
          ),
          FloatingActionButton(
            child: Text("dialog"),
            onPressed: () {
              dialog(context);
            },
          ),
        ],
      ),
    );
  }

  dialog(BuildContext context) {
    showDialog(barrierDismissible: true,context: context, builder: (context) {
      return AlertDialog(
        title: Text("data"),
        content: Container(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: items.map((e) => Text(e.toString())).toList(),
          ),
        ),
      );
    });
  }

  Widget buildField(int i) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("ID $i"),
        SizedBox(height: 20),
        Expanded(child: TextFormField(
          onChanged: (val) {
           // items.sort();
            saveValues(i,val);
          },
        )),
        FloatingActionButton(
          child: Text("-"),
          onPressed: () {
            setState(() {
              counter--;
              list.removeAt(i);

              items.removeAt(i);
            });
          },
        ),
      ],
    );
  }

  dynamic saveValues(int i,String v) {
       int foundKey = -1;
    //   if(items[i] == v){
    //     foundKey = i;
    //   }
    //
    //   if(foundKey != -1){
    //     items.removeWhere((e) => e == v);
    //   }
    //   items.add(v);
    // }

    for(var data in items){
      if(data.containsKey("id")){
        if(data["id"] == i){
          foundKey = i;
          break;
        }
      }
    }
    if(foundKey != -1){
      items.removeWhere((e) {
        return e["id"] == i;
      });
    }
    items.add({
      "id":i,
      "val":v,
    });
  }

}
