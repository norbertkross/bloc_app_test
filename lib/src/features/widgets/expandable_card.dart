import 'package:bloc_app_test/src/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'clinic_item.dart';

class ExpandableCard extends StatefulWidget {
  final String? img;
  final int? upcomingame;
  final String? details;
  final String? name;
  final String? color;
 const ExpandableCard({this.img, this.upcomingame, this.details, this.name,this.color});
  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      elevation: 2.0,
      shadowColor: Colors.black.withOpacity(.2),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            leading: Container(
              // color: Colors.amber,
              height: 45,
              width: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClinicItem(
                    margin: EdgeInsets.all(0),
                    imgPadd: 10.0,
                    size: 40,
                    borderRadius: 8.0,
                    noText: true,
                    color: Utilities.colorFromHex(widget.color??"")
                     //AppConstants.GREYCYAN
                     ,
                    img: widget.img ?? 'assets/visits.svg',
                  ),
                ],
              ),
            ),
            title: Text(widget.name ?? 'Card Title'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Utilities.colorFromHex(widget.color??""),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "${widget.upcomingame ?? 0}",
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),
                isExpanded == true
                    ? const RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.chevron_left),
                      )
                    : const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(Icons.chevron_left),
                      )
              ],
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          if (isExpanded)
             Padding(
              padding:const EdgeInsets.all(16.0),
              child: Text(
              widget.details ??  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has",
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
        ],
      ),
    );
  }
}
