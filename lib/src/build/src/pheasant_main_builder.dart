import 'dart:async';
import 'package:build/build.dart';
import 'package:pheasant_temp/pheasant_temp.dart';


class PheasantMainBuilder extends Builder {
  String fileExtension;
  String appName;
  String mainEntry;

  PheasantMainBuilder({
    this.fileExtension = '.phs.dart', 
    this.appName = 'AppComponent',
    this.mainEntry = 'App.phs'
  });

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package, 'lib/main$fileExtension'),
      renderMain()
    );
  }

  @override
  Map<String, List<String>> get buildExtensions => {
    r'$package$':['lib/main$fileExtension']
  };
}