import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClinicItem extends StatelessWidget {
  final Color? color;
  final String? name;
  final String? img;
  final double? size;
  final double? imgPadd;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final bool? noText;
  final bool? badge;
  const ClinicItem({super.key, this.color, this.name, this.img, this.badge, this.size, this.noText, this.imgPadd, this.borderRadius,  this.margin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: size != null? (size! + 10) : (60+10),
            child: Stack(
              children: [
                Container(
                  width:size ?? 60,
                  height:size ?? 60,
                  decoration: BoxDecoration(
                    // image: DecorationImage(image: AssetImage(img ?? '')),
                    color: color ?? const Color.fromARGB(255, 228, 233, 240),
                    borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), 
                        spreadRadius: 5, 
                        blurRadius: 7, 
                        offset:const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all( imgPadd ?? 15.0),
                    child: SvgPicture.asset(
                      img ?? "",
                      width:size != null? (size): 50,
                      height:size != null? (size) : 50,
                    ),
                  ),
                ),
               badge == true?  Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin:const EdgeInsets.only(bottom: 10.0),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      // image: DecorationImage(image: AssetImage(img ?? '')),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).canvasColor),
                        ),
                      ),
                    ),
                  ),
                ) : const SizedBox(),
              ],
            ),
          ),
         noText != true? const SizedBox(
            height: 8.0,
          ): const SizedBox(),
         noText != true? Text(
            name ?? "label",
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
          ): const SizedBox(),
        ],
      ),
    );
  }
}
