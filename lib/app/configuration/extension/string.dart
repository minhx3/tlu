import 'package:intl/intl.dart';

extension StringFactor on String {
  String nonAccent() {
    String str = this.toLowerCase();
    str = str.replaceAll(RegExp('/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g'), "a");
    str = str.replaceAll(RegExp('/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g'), "e");
    str = str.replaceAll(RegExp('/ì|í|ị|ỉ|ĩ/g'), "i");
    str = str.replaceAll(RegExp('/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g'), "o");
    str = str.replaceAll(RegExp('/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g'), "u");
    str = str.replaceAll(RegExp('/ỳ|ý|ỵ|ỷ|ỹ/g'), "y");
    str = str.replaceAll(RegExp('/đ/g'), "d");
    str = str.replaceAll(RegExp('/\u0300|\u0301|\u0303|\u0309|\u0323/g'),
        ""); // Huyền sắc hỏi ngã nặng
    str =
        str.replaceAll(RegExp('/\u02C6|\u0306|\u031B/g'), ""); // Â, Ê, Ă, Ơ, Ư
    return str;
  }

  String dateFormat(
      {String outputFormat = "dd-MM-yyyy", String inputFormat = "yyyy-MM-dd"}) {
    if (this.isEmpty || this == null) return null;
    DateFormat _format = DateFormat(outputFormat);
    DateTime input = new DateFormat(inputFormat).parse(this);
    return _format.format(input).toString();
  }
}
