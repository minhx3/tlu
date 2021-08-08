class SubjectFilter {
  // SubjectFilter(
  //     {this.day = const [],
  //     this.time = const [],
  //     this.type = "",
  //     this.title = ""});
  String type = "";
  String title = "";
  List<int> day = []; // lọc theo thứ
  List<int> time = []; // lọc theo ca sáng/chiều/tối 0/1/2
}
