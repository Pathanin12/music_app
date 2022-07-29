class Check{
  static   String? checkText(String? text) {
    String? sumText;
    if (text!.length >= 25) {
      sumText = '${text.substring(0, 24)}...';
    } else {
      sumText = text;
    }
    return sumText;
  }


}
