import 'package:flutter/material.dart';
import 'package:rest_api_all/request/update_request.dart';
import 'package:rest_api_all/service/masked_textinput_formatter.dart';
import 'package:rest_api_all/service/update_service.dart';

class UpdatePage extends StatefulWidget {
  static final String id = "UpdatePage";
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text("Iltimos mavjud id kiriting!!! ")),
              Spacer(),
              TextField(
                keyboardType: TextInputType.number,
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'Id',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  MaskedTextInputFormatter(mask: '## ### ## ##', separator: ' '),
                ],
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  prefixText: '+998 ',
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  UpdateService _login = UpdateService();
                  final result = await _login.login(Update(
                    id: int.parse(idController.text),
                    firstName: firstNameController.text.toString(),
                    lastName: lastNameController.text.toString(),
                    username: usernameController.text.toString(),
                    phone: '+998' +
                        phoneController.text.toString().replaceAll(' ', ''),
                    carID: int.parse(idController.text),
                  ),
                    int.parse(idController.text),

                  );
                  if (result) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 50,
                            color: Colors.green,
                            child: Center(child: Text("Success")),
                          ),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 50,
                            color: Colors.red,
                            child: Center(child: Text("Error")),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text("Update"),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    idController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

