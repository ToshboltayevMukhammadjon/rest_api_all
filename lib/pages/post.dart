import 'package:flutter/material.dart';
import 'package:rest_api_all/request/post_request.dart';
import 'package:rest_api_all/service/masked_textinput_formatter.dart';
import 'package:rest_api_all/service/post_service.dart';


class PostPage extends StatefulWidget {
  static final String id = "PostPage";
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text("Iltimos mavjud bo'lmagan id kiriting!!! ")),
                Spacer(),
                TextField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Id',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
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
                    PostService _login = PostService();
                    final result = await _login.login(PostRequest(
                      id: int.parse(idController.text),
                      firstName: firstNameController.text.toString(),
                      lastName: lastNameController.text.toString(),
                      username: usernameController.text.toString(),
                      phone: '+998' +
                          phoneController.text.toString().replaceAll(' ', ''),
                      carId: 0,
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
                  child: Text("Log in"),
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
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
