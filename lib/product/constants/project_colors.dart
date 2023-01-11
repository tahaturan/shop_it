import 'package:flutter/material.dart';

enum ProjectColors { buttonColor }

extension ProjectColorsExtension on ProjectColors {
  Color color() {
    switch (this) {
      case ProjectColors.buttonColor:
        return Colors.green;
    }
  }
}
