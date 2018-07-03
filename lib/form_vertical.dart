import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerticalForm extends StatefulWidget {
  @override
  _VerticalFormState createState() => new _VerticalFormState();
}

class _VerticalFormState extends State<VerticalForm> {

  FocusNode focusNode1;
  FocusNode focusNode2;
  FocusNode focusNode3;
  FocusNode focusNode4;
  FocusNode focusNode5;

  @override
  void initState() {
    super.initState();
    focusNode1 = new FocusNode();
    focusNode2 = new FocusNode();
    focusNode3 = new FocusNode();
    focusNode4 = new FocusNode();
    focusNode5 = new FocusNode();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    super.dispose();
  }

  Widget _buildTextFormField({
    Key key,
    String hintText,
    TextInputAction keyboardAction = TextInputAction.done,
    Function(String) onSubmitted,
    FocusNode focusNode,
  }) {
    return new FormField(
      builder: (FormFieldState fieldState) {
        return new TextField(
          key: key,
          decoration: new InputDecoration(
            hintText: hintText,
          ),
          textInputAction: keyboardAction,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          child: new Column(
            children: <Widget>[
              _buildTextFormField(
                hintText: 'None',
//                keyboardAction: TextInputAction.next,
                keyboardAction: TextInputAction.none,
                focusNode: focusNode1,
//                onSubmitted: (String value) {
//                  FocusScope.of(context).requestFocus(focusNode2);
//                },
              ),
              _buildTextFormField(
                hintText: 'Unspecified',
//                keyboardAction: TextInputAction.next,
                keyboardAction: TextInputAction.unspecified,
                focusNode: focusNode2,
//                onSubmitted: (String value) {
//                  FocusScope.of(context).requestFocus(focusNode3);
//                },
              ),
              _buildTextFormField(
                hintText: 'Done',
//                keyboardAction: TextInputAction.next,
                keyboardAction: TextInputAction.done,
                focusNode: focusNode3,
                onSubmitted: (String value) {
                  print('Handling first name submission');
                  FocusScope.of(context).requestFocus(focusNode4);
                },
              ),
              _buildTextFormField(
                hintText: 'Go',
                keyboardAction: TextInputAction.go,
                focusNode: focusNode4,
                onSubmitted: (String value) {
                  print('Handling last name submission');
                  FocusScope.of(context).requestFocus(focusNode5);
                },
              ),
              _buildTextFormField(
                hintText: 'Search',
                keyboardAction: TextInputAction.search,
                focusNode: focusNode5,
              ),
              _buildTextFormField(
                hintText: 'Send',
                keyboardAction: TextInputAction.send,
              ),
              _buildTextFormField(
                hintText: 'Next',
                keyboardAction: TextInputAction.next,
              ),
              _buildTextFormField(
                hintText: 'Previous',
                keyboardAction: TextInputAction.previous,
              ),
              _buildTextFormField(
                hintText: 'New Line',
                keyboardAction: TextInputAction.newline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
