
// Импорт модулей
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  var size, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;

    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Theme.of(context).hintColor);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
        margin: EdgeInsets.only(top: 50),
        height: 52,
        width: width/1.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: windowsCust,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: style.color),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                child: Icon(Icons.close, color: style.color),
                onTap: () {
                  controller.clear();
                  widget.onChanged('');
                  FocusScope.of(context).requestFocus(FocusNode());
                }
            )
                : null,
            hintText: widget.hintText,
            hintStyle: style,
            border: InputBorder.none,
          ),
          style: style,
          onChanged: widget.onChanged,
        )
    );
  }
}
