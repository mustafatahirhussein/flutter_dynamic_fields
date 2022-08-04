import 'package:flutter/material.dart';

class DynamicFields extends StatefulWidget {
  const DynamicFields({Key? key}) : super(key: key);

  @override
  State<DynamicFields> createState() => _DynamicFieldsState();
}

class _DynamicFieldsState extends State<DynamicFields> {
  List<Widget> list = [];
  int fieldCount = 0;

  List<Map<String, dynamic>> items = [];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic TextFormFields"),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.data_thresholding_rounded),
            ),
            onTap: () => itinerariesDialog(context),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            fieldCount == 0
                ? const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No Itineraries added!",
                        style:
                            TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Column(
                  children: [
                    ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (_, i) => buildField(i),
                      ),
                    const SizedBox(height: 12),
                    ElevatedButton(onPressed: () {
                      if(!_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fields missing")));
                      }
                    }, child: const Text("Validate")),
                  ],
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("ADD\nNEW"),
        onPressed: () {
          setState(() {
            fieldCount++;
            list.add(buildField(fieldCount));
          });
        },
      ),
    );
  }

  itinerariesDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Stored Itineraries"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children:
                    items.map((e) => Text(e["itinerary"].trim())).toList(),
              ),
            ),
          );
        });
  }

  Widget buildField(int i) {
    return ListTile(
      leading: CircleAvatar(
        child: Text((i + 1).toString()),
      ),
      title: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          labelText: "Itinerary ${i + 1}",
        ),
        onChanged: (data) => storeValue(i + 1, data),
        validator: (val) => val!.isEmpty ? "Required" : null,
      ),
      trailing: InkWell(
        child: const Icon(Icons.delete_outlined, color: Colors.red),
        onTap: () {
          setState(() {
            fieldCount--;
            list.removeAt(i);

            items.removeAt(i);
          });
        },
      ),
    );
  }

  dynamic storeValue(int i, String v) {
    bool valueFound = false;

    for (int j = 0; j < items.length; j++) {
      if (items[j].containsKey("field_id")) {
        if (items[j]["field_id"] == i) {
          valueFound = !valueFound;
          break;
        }
      }
    }

    /// If value is found
    if (valueFound) {
      items.removeWhere((e) => e["field_id"] == i);
    }
    items.add({
      "field_id": i,
      "itinerary": v,
    });
  }
}
