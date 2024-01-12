import 'package:build/build.dart';
import 'package:pheasant_build/src/tools/config.dart';
import 'src/pheasant_main_builder.dart';
import 'src/pheasant_file_builder.dart';

Builder pheasantFileBuilder(BuilderOptions builderOptions) => PheasantFileBuilder();

Builder pheasantMainBuilder(BuilderOptions builderOptions) {
  Config config = PheasantAppConfig.fromYamlMap(builderOptions.config);
  return PheasantMainBuilder(
    mainEntry: config.mainEntry,
    fileExtension: '${config.extension}.dart',
  );
}