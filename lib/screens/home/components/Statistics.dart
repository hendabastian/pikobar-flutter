import 'package:flutter/material.dart';
import 'package:pikobar_flutter/constants/Colors.dart';
import 'package:pikobar_flutter/constants/Dictionary.dart';
import 'package:pikobar_flutter/constants/Dimens.dart';
import 'package:pikobar_flutter/constants/FontsFamily.dart';
import 'package:pikobar_flutter/environment/Environment.dart';

class Statistics extends StatefulWidget {
  String odpCount = '';
  String pdpCount = '';
  String positifCount = '';

  Statistics({this.odpCount, this.pdpCount, this.positifCount});

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Container _buildContent() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Dictionary.statistics,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: FontsFamily.productSans,
                fontSize: 16.0),
          ),
          SizedBox(height: Dimens.padding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildContainer(
                  '${Environment.iconAssets}stethoscope.png', Dictionary.odp,
                  Dictionary.opdDesc, widget.odpCount),
              _buildContainer(
                  '${Environment.iconAssets}doctor.png', Dictionary.pdp,
                  Dictionary.pdpDesc, widget.pdpCount),
              _buildContainer(
                  '${Environment.iconAssets}infected.png', Dictionary.positif,
                  Dictionary.infected, widget.positifCount),
            ],
          )
        ],
      ),
    );
  }

  Container _buildContainer(String icon, String title, String description,
      String count) {
    return Container(
      width: (MediaQuery
          .of(context)
          .size
          .width / 3) - 21.4,
      padding: EdgeInsets.all(Dimens.padding),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: <Widget>[
          Image.asset(icon,
              width: 32.0, height: 32.0),

          Container(
            margin: EdgeInsets.only(top: Dimens.padding, bottom: 5.0),
            child: Text(title,
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontsFamily.productSans)),
          ),

          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey[600],
                  fontFamily: FontsFamily.productSans)),

          Container(
            margin: EdgeInsets.only(top: Dimens.padding),
            child: Text(count,
                style: TextStyle(
                    fontSize: 24.0,
                    color: ColorBase.green,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontsFamily.productSans)),
          ),
        ],
      ),
    );
  }
}
