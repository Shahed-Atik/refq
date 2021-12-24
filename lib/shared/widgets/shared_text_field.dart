// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class SharedTextField extends StatefulWidget {
//   final String hintText;
//   final String formControlName;
//   final IconData? prefix;
//   final TextInputType? keyboardType;
//   final FocusNode? focus;
//   final TextInputAction? textInputAction;
//   final Function()? onTap;
//   final Color? backgroundColor;
//   final Color? contentColor;
//   final TextEditingController? controller;
//   final int? maxLines;
//   final bool? obscureText;
//   final Map<String, String> Function(FormControl)? validationMessages;
//   const SharedTextField(
//       {Key? key,
//       required this.hintText,
//       required this.validationMessages,
//       this.prefix,
//       this.keyboardType,
//       this.focus,
//       this.textInputAction,
//       required this.formControlName,
//       this.onTap,
//       this.backgroundColor,
//       this.contentColor,
//       this.controller,
//       this.maxLines,
//       this.obscureText})
//       : super(key: key);
//
//   @override
//   _SharedTextFieldState createState() => _SharedTextFieldState();
// }
//
// class _SharedTextFieldState extends State<SharedTextField> {
//   bool? _obscureText;
//
//   @override
//   void initState() {
//     _obscureText = widget.obscureText;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeData = Theme.of(context);
//     return ReactiveTextField(
//       formControlName: widget.formControlName,
//       obscureText: _obscureText ?? false,
//       focusNode: widget.focus,
//       textAlign: TextAlign.start,
//       maxLines: widget.maxLines,
//       onTap: widget.onTap,
//       validationMessages: widget.validationMessages,
//       textInputAction: widget.textInputAction ?? TextInputAction.next,
//       keyboardType: widget.keyboardType ?? TextInputType.text,
//       decoration: InputDecoration(
//           errorStyle: themeData.textTheme.caption!
//               .copyWith(color: themeData.errorColor),
//           contentPadding:
//               EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
//           label: Text(widget.hintText),
//           border: OutlineInputBorder(borderRadius: borderRadiusCircular),
//           suffixIcon: _obscureText != null
//               ? IconButton(
//                   onPressed: _onTapEye,
//                   icon: AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 250),
//                     transitionBuilder: (child, animation) => FadeTransition(
//                       opacity: animation,
//                       child: SizeTransition(
//                         sizeFactor: animation,
//                         child: child,
//                       ),
//                     ),
//                     child: Icon(
//                       _obscureText! ? Icons.visibility_off : Icons.visibility,
//                       key: Key(
//                         _obscureText.toString(),
//                       ),
//                     ),
//                   ),
//                 )
//               : null,
//           prefixIcon: widget.prefix != null
//               ? Icon(
//                   widget.prefix,
//                   size: 20.sp,
//                   //fit: BoxFit.contain,
//                 )
//               : null,
//           prefixIconConstraints: BoxConstraints(minWidth: 40.w)),
//     );
//   }
//
//   void _onTapEye() => setState(() => _obscureText = !_obscureText!);
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
