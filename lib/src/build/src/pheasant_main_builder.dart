import 'dart:async';
import 'package:build/build.dart';
import 'package:pheasant_temp/pheasant_temp.dart';


class PheasantMainBuilder extends Builder {
  String fileExtension;
  String appName;
  String mainEntry;
  String? entrypoint;

  PheasantMainBuilder({
    this.fileExtension = '.phs.dart', 
    this.appName = 'AppComponent',
    this.mainEntry = 'App.phs',
    this.entrypoint
  });

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package, entrypoint ?? 'lib/main$fileExtension'),
      '''
// File generated with info - $mainEntry

${renderMain(appName: appName, fileExtension: fileExtension, mainEntry: mainEntry)}'''
    );
  }

  @override
  Map<String, List<String>> get buildExtensions => {
    r'$package$':[entrypoint ?? 'lib/main$fileExtension']
  };
}