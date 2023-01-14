enum ProjectDurationEnum { shoppingCard }

extension ProjectDurationEnumExtension on ProjectDurationEnum {
  Duration duration() {
    switch (this) {
      case ProjectDurationEnum.shoppingCard:
        return const Duration(milliseconds: 700);
    }
  }
}
