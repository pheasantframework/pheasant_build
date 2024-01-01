import 'dart:async';
import 'package:build/build.dart';
import '../../src/base.dart';
import '../../tools/input.dart';
import 'package:pheasant_temp/pheasant_temp.dart';

class PheasantFileBuilder extends Builder {
  String fileExtension;

  PheasantFileBuilder({this.fileExtension = '.phs.dart'});
  
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inpId = buildStep.inputId;
    var data = await buildStep.readAsString(inpId);
    var outId = inpId.changeExtension(fileExtension);
    PheasantFile myIn = renderInput(phsData: data);
    final dartCode = renderFunc(script: myIn.script, template: myIn.template);
    await buildStep.writeAsString(outId, dartCode);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
    '.phs': [fileExtension]
  };
}