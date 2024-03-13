class GlobalFunctions {
  static String getImageAssetFromWeatherCode(double c) {
    int code = c.toInt();
    print('code: $code');
    switch(code){
      case 1000:
        return 'assets/images/1000.png';
      case 1001:
        return 'assets/images/1001.png';
      case 1100:
        return 'assets/images/1100.png';
      case 1101:
        return 'assets/images/1101.png';
      case 1102:
        return 'assets/images/1102.png';
      case 1103:
        return 'assets/images/1103.png';
      case 2000:
        return 'assets/images/2000.png';
      case 2100:
        return 'assets/images/2100.png';
      case 2101:
        return 'assets/images/2101.png';
      case 2102:
        return 'assets/images/2102.png';
      case 2103:
        return 'assets/images/2103.png';
      case 2106:
        return 'assets/images/2106.png';
      case 2107:
        return 'assets/images/2107.png';
      case 4000:
        return 'assets/images/4000.png';
      case 5000:
        return 'assets/images/5000.png';
      case 6000:
        return 'assets/images/6000.png';
      case 7000:
        return 'assets/images/7000.png';
      case 8000:
        return 'assets/images/8000.png';
      default:
        return 'assets/images/1000.png';
    }
  }
}