import 'package:flutter/material.dart';
import 'package:travel_app/widgets/custom_widgets.dart';
class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,),
        child: Row(
          children: [
            Icon(btnIcon, size: 50,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: myStyle(17,Colors.black,FontWeight.bold),),
                Text(subtitle, style: myStyle(16),),
              ],
            )
          ],
        ),
      ),
    );
  }
}