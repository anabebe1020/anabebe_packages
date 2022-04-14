import 'package:flutter/material.dart';

class SelectBox extends StatefulWidget {
  final double? height;
  final double? width;
  final List<String> items;
  final String? currentItem;
  final bool isAlert;
  final Function(String) onChanged;
  final bool disable;

  const SelectBox({
    Key? key,
    this.height,
    this.width,
    required this.items,
    required this.currentItem,
    this.isAlert = false,
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
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
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
                        style: widget.isAlert
                            ? _textStyle.copyWith(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              )
                            : _textStyle.copyWith(fontWeight: FontWeight.bold),
                      );
                    }).toList();
                  },
                  items: widget.items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: _textStyle,
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
