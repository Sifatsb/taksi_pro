// mport 'package:flutter/material.dart';
// import 'package:swoop_news/NecessaryComponent/screen_hight_width.dart';
// import 'package:swoop_news/url_index/url_index.dart';
//
// class CustomTextEditingFieldV2 extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final TextInputType? keyboardType;
//   final bool obscure;
//   final String? Function(String?)? validator;
//   final int maxLine;
//   final Widget? prefixIcon;
//   final bool separatePrefixIcon;
//   final TextInputAction? textInputAction;
//   final bool showBorder;
//   final bool isBorderColor;
//   final bool isErrorTextColor;
//   final bool isControllerTextColor;
//   final bool isFocusBorderColor;
//   final String? prefixImageLink;
//   final int? maxLength;
//   final String? hintText;
//   final String stackLabelText;
//   final Color? cursorColor;
//   final double? prefixWidth;
//   final double? prefixIconHeight;
//   final Color? prefixIconColor;
//   final Color? errorTextColor;
//   final Color? controllerTextColor;
//   final Color? borderColor;
//   final Color? focusBorderColor;
//   final Color? stackLabelTextColor;
//   final bool? obscurePadding;
//   final double? hintFontSize;
//   final FontWeight? hintFontWeight;
//   final Color? hintColor;
//   final int? hintMaxLine;
//   final bool readOnly;
//   final bool signInVisibilityColor;
//
//   const CustomTextEditingFieldV2({
//     Key? key,
//     required this.textEditingController,
//     required this.stackLabelText,
//     this.stackLabelTextColor,
//     this.keyboardType,
//     this.errorTextColor,
//     this.controllerTextColor,
//     this.borderColor,
//     this.focusBorderColor,
//     this.validator,
//     this.maxLine = 1,
//     this.prefixIcon,
//     this.separatePrefixIcon = false,
//     this.isErrorTextColor = false,
//     this.isControllerTextColor = false,
//     this.textInputAction,
//     this.showBorder = false,
//     this.isBorderColor = false,
//     this.isFocusBorderColor = false,
//     this.prefixImageLink,
//     this.maxLength,
//     this.hintText,
//     this.obscure = false,
//     this.cursorColor,
//     this.prefixWidth,
//     this.prefixIconColor,
//     this.prefixIconHeight,
//     this.obscurePadding,
//     this.hintFontSize,
//     this.hintFontWeight,
//     this.hintColor,
//     this.hintMaxLine,
//     this.readOnly = false,
//     this.signInVisibilityColor = false,
//   }) : super(key: key);
//
//   @override
//   State<CustomTextEditingFieldV2> createState() =>
//       _CustomTextEditingFieldV2State();
// }
//
// class _CustomTextEditingFieldV2State extends State<CustomTextEditingFieldV2> {
//   bool obscure = false;
//
//
//   @override
//   void initState() {
//     obscure = widget.obscure;
//     super.initState();
//   }
//
//   double borderRadius = 5;
//
//   @override
//   Widget build(BuildContext context) {
//     final width = ScreenSize(context).width;
//
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//           child: TextFormField(
//
//             maxLines: widget.maxLine,
//             obscuringCharacter: '•',
//             obscureText: obscure,
//             style:  TextStyle(color: widget.isControllerTextColor? widget.controllerTextColor : blackColor),
//             validator: widget.validator,
//             controller: widget.textEditingController,
//             onChanged: (val) {
//               setState(() {
//                 val = widget.textEditingController.text;
//               });
//             },
//             decoration: InputDecoration(
//
//               errorStyle: TextStyle(
//                 color:widget.isErrorTextColor? widget.errorTextColor:redColor,
//                 fontSize: 8,
//               ),
//               filled: true,
//               fillColor: widget.textEditingController.text.isNotEmpty &&
//                   widget.showBorder
//                   ? Colors.white
//                   : Colors.transparent,
//               hintText: widget.hintText,
//               hintStyle: TextStyle(color: Color(0xffDE4E98)),
//               contentPadding: const EdgeInsets.fromLTRB(12, 20, 0, 20),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: widget.isFocusBorderColor
//                     ? BorderSide(color: widget.focusBorderColor!)
//                     : BorderSide(color: Colors.white),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.redAccent),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.redAccent),
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: widget.isBorderColor
//                     ? BorderSide(width: 1, color: widget.borderColor!)
//                     : BorderSide(width: 1, color: Colors.white),
//                 //<-- SEE HERE
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               suffixIcon: widget.obscure
//                   ? obscure
//                   ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       obscure = !obscure;
//                     });
//                   },
//                   icon: widget.obscure
//                       ? widget.obscurePadding!
//                       ? Icon(Icons.remove_red_eye,
//                       color: widget.signInVisibilityColor
//                           ? whiteColor
//                           : purpleColor)
//                       : Icon(Icons.remove_red_eye,
//                       color: widget.signInVisibilityColor
//                           ? whiteColor
//                           : purpleColor)
//                       : Icon(Icons.remove_red_eye,
//                       color: widget.signInVisibilityColor
//                           ? whiteColor
//                           : purpleColor))
//                   : IconButton(
//                   onPressed: () {
//                     setState(() {
//                       obscure = !obscure;
//                     });
//                   },
//                   icon: widget.obscure
//                       ? widget.obscurePadding!
//                       ? Icon(Icons.visibility_off,
//                       color: widget.signInVisibilityColor
//                           ? whiteColor
//                           : purpleColor)
//                       : Icon(Icons.visibility_off,
//                       color: widget.signInVisibilityColor
//                           ? whiteColor
//                           : purpleColor)
//                       : Icon(Icons.visibility_off,
//                       color: widget.signInVisibilityColor
//                           ? whiteColor
//                           : purpleColor))
//                   : null,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 3,
//           bottom: -6,
//           left: 12,
//           child: Text(
//             widget.stackLabelText.toString(),
//             style: widget.textEditingController.text.isNotEmpty &&
//                 widget.showBorder
//                 ? TextStyle(color: Colors.black, fontSize: 12)
//                 : TextStyle(color: widget.stackLabelTextColor, fontSize: 12),
//           ),
//         ),
//       ],
//     );
//   }
// }