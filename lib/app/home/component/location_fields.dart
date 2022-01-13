import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:refq_mongo/app/home/store/home_store.dart';
import 'package:refq_mongo/shared/widgets/shared_double_text_field.dart';

class LocationFields extends StatelessWidget {
  const LocationFields({Key? key, required this.store}) : super(key: key);
  final HomeStore store;
  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: store.form,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SharedDoubleTextField(
              readOnly: true,
              hintText: "latitude",
              validationMessages: (control) => {
                ValidationMessage.required: "Enter latitude",
              },
              formControlName: 'lat',
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: SharedDoubleTextField(
              readOnly: true,
              hintText: "longitude",
              validationMessages: (control) => {
                ValidationMessage.required: "Enter longitude",
              },
              formControlName: 'lag',
            ),
          ),
        ],
      ),
    );
  }
}
