part of 'widgets.dart';

class TextFormFrave extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget prefixIcon;

  const TextFormFrave({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 20),
      cursorColor: ColorsFrave.secundaryColorFrave,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white70
              : const Color(0xFF2A2B2E),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Color(0xffF5F5F5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(color: Theme.of(context).brightness == Brightness.light
                  ? const Color.fromARGB(70, 0, 0, 0)
                  : const Color.fromARGB(70, 255, 255, 255))),
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black26
                  : Colors.grey)),
      validator: validator,
    );
  }
}
