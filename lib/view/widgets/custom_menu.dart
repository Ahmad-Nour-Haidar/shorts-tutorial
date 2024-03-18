import 'package:flutter/material.dart';

const color = Color(0xffFF6F02);

@immutable
class PopupMenuItemModel {
  final String title, value;

  const PopupMenuItemModel({
    required this.title,
    required this.value,
  });
}

class CustomMenu extends StatefulWidget {
  const CustomMenu({
    super.key,
    required this.title,
    required this.items,
    required this.onChange,
  });

  final List<PopupMenuItemModel> items;
  final String title;
  final void Function(String? value) onChange;

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            width: MediaQuery.sizeOf(context).width - 60,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Row(
              children: [
                // const SizedBox(width: 20),
                Expanded(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerTheme: const DividerThemeData(
                        color: Colors.black,
                        endIndent: 20,
                        indent: 20,
                        thickness: 2,
                      ),
                    ),
                    child: PopupMenuButton<String>(
                      color: Colors.white,
                      offset: const Offset(-20, 0.0),
                      initialValue: _value,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      tooltip: '',
                      constraints: BoxConstraints(
                        maxHeight: 200,
                        maxWidth: MediaQuery.sizeOf(context).width - 80,
                        minWidth: MediaQuery.sizeOf(context).width - 80,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(
                          (widget.items.length * 2 - 1),
                          (index) {
                            if (index % 2 == 0) {
                              final i = index ~/ 2;
                              return PopupMenuItem(
                                value: widget.items[i].value,
                                child: Text(
                                  widget.items[i].title,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              );
                            } else {
                              return const PopupMenuDivider();
                            }
                          },
                        );
                      },
                      onSelected: (newValue) {
                        setState(() {
                          _value = newValue;
                          widget.onChange(newValue);
                        });
                      },
                      child: Text(
                        _value ?? widget.title,
                        style: TextStyle(
                          color: _value == null ? Colors.grey : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: _value != null
              ? const Icon(
                  Icons.check,
                  color: color,
                  size: 28,
                )
              : null,
        ),
      ],
    );
  }
}
