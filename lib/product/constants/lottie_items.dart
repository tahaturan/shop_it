enum LottieItems { loading, imageLoading }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.loading:
        return 'loading';
      case LottieItems.imageLoading:
        return 'loading_image';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
