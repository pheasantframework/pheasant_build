import 'package:build/build.dart';
import 'package:pheasant_build/src/tools/config.dart';
import 'src/pheasant_main_builder.dart';
import 'src/pheasant_file_builder.dart';

/// The Pheasant File Builder used to render Pheasant Files during build.
Builder pheasantFileBuilder(BuilderOptions builderOptions) => PheasantFileBuilder();

/// The Pheasant Builder used to render the `main.phs.dart` file during build.
Builder pheasantMainBuilder(BuilderOptions builderOptions) {
  Config config = PheasantAppConfig.fromYamlMap(builderOptions.config);
  return PheasantMainBuilder(
    mainEntry: config.mainEntry,
    fileExtension: '${config.extension}.dart',
  );
}