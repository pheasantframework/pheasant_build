import 'package:build/build.dart';
import 'src/pheasant_main_builder.dart';
import 'src/pheasant_file_builder.dart';

Builder pheasantFileBuilder(BuilderOptions builderOptions) => PheasantFileBuilder();

Builder pheasantMainBuilder(BuilderOptions builderOptions) => PheasantMainBuilder();