import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();

}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        initialValue: '',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              obscureText: _obscureText,
              onChanged: (text) {
                if (widget.validator != null) {
                  // ignore: invalid_use_of_protected_member
                  state.setValue(text);
                  state.validate();
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(text);
                }
              },

              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: CupertinoButton(
                    child: Icon(_obscureText
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      _obscureText = !_obscureText;
                      setState(() {});
                    }),
                icon: const Icon(
                  Icons.lock,
                  color: Color(0xff2779a7),
                ),
                hintText: "password",
                hintStyle: const TextStyle(color: Color(0xff29467a)),
                labelText: "Password",
                labelStyle: const TextStyle(color: Color(0xff2779a7)),
              ),
            ),
          );
        });
  }
}
