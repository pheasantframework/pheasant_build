import 'dart:async';

import 'package:build/build.dart';
import 'package:path/path.dart';
import 'package:pheasant_temp/pheasant_temp.dart';

import '../../src/base.dart';
import '../../tools/input.dart';

/// Builder Class used in building, processing and creating the dart-type Pheasant Files.
/// 
/// This class is used in compiling Pheasant Files to dart-html component files to inject into the DOM, through the use of [renderFunc].
class PheasantFileBuilder extends Builder {
  String fileExtension;

  PheasantFileBuilder({this.fileExtension = '.phs.dart'});
  
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inpId = buildStep.inputId;
    var filename = basenameWithoutExtension(inpId.path);

    var data = await buildStep.readAsString(inpId);

    final String pathAtLib = dirname(inpId.path);
    var outId = inpId.changeExtension(fileExtension);

    PheasantComposedInput composedInput = renderInput(phsData: data);
    PheasantFile myIn = composedInput.input;
    
    final dartCode = renderFunc(
      script: myIn.script,
      template: myIn.template,
      componentName: "${filename}Component",
      pheasantStyle: composedInput.style,
      appDirPath: pathAtLib
    );

    await buildStep.writeAsString(outId, dartCode);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
    '.phs': [fileExtension]
  };
}

