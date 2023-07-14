import 'package:flutter/material.dart';
import 'package:flutter_provider_overview/res/components/colors_components.dart';
class CustomButton extends StatelessWidget{
final String title;
final VoidCallback onTap;
final bool loading;
const CustomButton({super.key, required this.title,required this.onTap,this.loading=false});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child:loading?const  CircularProgressIndicator(): Text(title,style:const  TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 20),),

      ),
    );
  }

}