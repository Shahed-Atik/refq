import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:refq_mongo/shared/utils/constant.dart';

class SharedDropDown extends StatefulWidget {
  final String hintText;
  final String formControlName;
  final Color? backgroundColor;
  final Map<String, String> Function(FormControl)? validationMessages;
  final List<String> items;
  const SharedDropDown({
    Key? key,
    required this.hintText,
    required this.validationMessages,
    required this.formControlName,
    required this.items,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _SharedDropDownState createState() => _SharedDropDownState();
}

class _SharedDropDownState extends State<SharedDropDown> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ReactiveDropdownSearch<String, String>(
      formControlName: widget.formControlName,
      decoration: InputDecoration(
          errorStyle: themeData.textTheme.caption!
              .copyWith(color: themeData.errorColor),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
          border: OutlineInputBorder(borderRadius: borderRadiusCircular),
          prefixIconConstraints: BoxConstraints(minWidth: 40.w)),
      mode: Mode.MENU,
      validationMessages: widget.validationMessages,
      showSelectedItems: true,
      items: widget.items,
      label: widget.hintText,
      showClearButton: false,
      // popupItemDisabled: (s) {
      //   return s.startsWith('I');
      // },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
