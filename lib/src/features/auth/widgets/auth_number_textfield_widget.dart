

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberTextFieldWidget extends StatefulWidget {
  const NumberTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputType keyboardType;

  @override
  State<NumberTextFieldWidget> createState() => _NumberTextFieldWidgetState();
}

class _NumberTextFieldWidgetState extends State<NumberTextFieldWidget> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            maxLength: 10,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {
                    showCountryPicker(
                      context: context,
                      exclude: <String>['KN', 'MF'],
                      favorite: <String>['SE'],
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          text = '+${country.phoneCode}';
                        });
                      },
                      moveAlongWithKeyboard: false,
                      countryListTheme: CountryListThemeData(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r),
                        ),
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                        searchTextStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  icon:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text.isEmpty ? '+1' : "$text ", // Default to +1 if text is empty
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const  Icon(Icons.keyboard_arrow_down_outlined),
                      const Text("|", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}




