enum ClassType { register, detail }

class ClassArgument {
  final ClassType type;
  dynamic data;

  ClassArgument(this.type, {this.data});
}
