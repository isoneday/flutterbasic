import 'package:flutter/material.dart';
import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/model_client.dart';

class InsertUpdateDBScreen extends StatefulWidget {
  bool edit;
  Client? client;

  InsertUpdateDBScreen({Key? key, this.client, this.edit = true})
      : super(key: key);

  @override
  _InsertUpdateDBScreenState createState() => _InsertUpdateDBScreenState();
}

class _InsertUpdateDBScreenState extends State<InsertUpdateDBScreen> {
  TextEditingController nameEdtController = TextEditingController();
  TextEditingController phoneEdtController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.edit == true) {
      nameEdtController.text = widget.client?.name ?? "-";
      phoneEdtController.text = widget.client?.phone ?? "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.edit ? "Edit Data" : "Insert Data"),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FlutterLogo(
                  size: 150,
                ),
                textForm(
                    nameEdtController, "name", "Inputkan Name", Icons.person),
                SizedBox(
                  height: 10,
                ),
                textForm(
                    phoneEdtController, "phone", "Inputkan Phone", Icons.phone),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Processing data")));
                    } else if (widget.edit == true) {
                      await ClientDatabaseProvider.db.updateClient(Client(
                          name: nameEdtController.text,
                          phone: phoneEdtController.text,
                          id: widget.client?.id));
                      Navigator.pop(context);
                    } else {
                      await ClientDatabaseProvider.db
                          .addClientToDatabase(Client(
                        name: nameEdtController.text,
                        phone: phoneEdtController.text,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    widget.edit ? "Update" : "Insert",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                )
              ],
            ),
          )),
    );
  }

  textForm(TextEditingController editingController, String label, String hint,
      IconData icon) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "${label} tidak boleh kosong";
        }
      },
      controller: editingController,
      decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
