library my_prj.globals;
import 'package:flutter/material.dart';


Widget chipDesign(String label, Color color,{required Color textColor}) => Container(
  child: Chip(
    label: Text(
      label,
      style: TextStyle(
          color: textColor),
    ),
    backgroundColor: color,
    elevation: 4,
    shadowColor: Colors.grey[50],
    padding: const EdgeInsets.all(4),
  ),
  margin: const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),

);
