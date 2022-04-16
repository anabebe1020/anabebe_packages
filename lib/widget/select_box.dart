import 'package:flutter/material.dart';

class SelectBox extends StatefulWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final List<String> items;
  final String? currentItem;
  final Function(String) onChanged;
  final bool disable;

  const SelectBox({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    required this.items,
    required this.currentItem,
    required this.onChanged,
    this.disable = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectBoxState();
}

class SelectBoxState extends State<SelectBox> {
  String _selectedValue = '';
  final _textStyle = const TextStyle(fontSize: 16, height: 24 / 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(color: widget.borderColor ?? Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: widget.currentItem != null
          ? DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: widget.currentItem,
                  isDense: true,
                  borderRadius: BorderRadius.circular(5.0),
                  iconEnabledColor: widget.foregroundColor,
                  onChanged: widget.disable
                      ? null
                      : (String? newValue) {
                          setState(() {
                            _selectedValue = newValue ?? widget.currentItem!;
                          });
                          widget.onChanged(_selectedValue);
                        },
                  selectedItemBuilder: (context) {
                    return widget.items.map((String item) {
                      return Text(
                        item,
                        style: _textStyle.copyWith(
                          color: widget.foregroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                  items: widget.items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:
                            _textStyle.copyWith(color: widget.foregroundColor),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          : Container(),
      padding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
