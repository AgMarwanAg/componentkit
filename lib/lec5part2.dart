import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lec5part2 extends StatelessWidget {
  static const String path = '/lec5-part2';
  const Lec5part2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginController(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Consumer<LoginController>(
              builder: (context, controller, child) {
                return Form(
                  key: controller.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          width: controller.width,
                          height: controller.height,
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              'Hello',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            controller.changeSize();
                          },
                          child: const Text('Change Size'),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.userCTR,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'e.g., Marwan',
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  icon: const Icon(Icons.close)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.passwordCTR,
                          obscureText: controller.obSecurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                                icon: Icon(controller.obSecurePassword ? Icons.visibility_off : Icons.visibility)),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('User Name: ${controller.userCTR.text}'),
                        Text('Password: ${controller.passwordCTR.text}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Remember me"),
                            Checkbox(
                                value: controller.checkboxValue,
                                onChanged: (val) {
                                  controller.updateCheckbox(val);
                                }),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.login();
                            },
                            child: const Text('Login'))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}

class LoginController extends ChangeNotifier {
  double width = 100.0;
  double height = 100.0;
  bool obSecurePassword = true;
  bool checkboxValue = false;

  final TextEditingController userCTR = TextEditingController();
  final TextEditingController passwordCTR = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeSize() {
    width = 200;
    height = 200.0;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    obSecurePassword = !obSecurePassword;
    notifyListeners();
  }

  void updateCheckbox(bool? val) {
    if (val != null) {
      checkboxValue = val;
      notifyListeners();
    }
  }

  void login() {
    if (formKey.currentState!.validate()) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    userCTR.dispose();
    passwordCTR.dispose();
    super.dispose();
  }
}
