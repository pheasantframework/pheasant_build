class PheasantFile {
  String script;
  String template;
  String styles;

  PheasantFile({required this.script, required this.template, required this.styles});
}

class PheasantInput extends PheasantFile {
  PheasantInput({required super.script, required super.template, required super.styles});
}