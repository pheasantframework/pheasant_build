import 'package:pheasant_assets/pheasant_build.dart';

class PheasantFile {
  String script;
  String template;
  String styles;

  PheasantFile({required this.script, required this.template, required this.styles});
}

class PheasantInput extends PheasantFile {
  PheasantInput({required super.script, required super.template, required super.styles});
}

class PheasantComposedInput {
  final PheasantInput input;
  final PheasantStyle style;

  PheasantComposedInput({required this.input, required this.style});
}