import 'package:path/path.dart' as path;

class PheasantAppConfig {
  String mainEntryPoint;
  String appEntryPoint;
  String extension;
  String? appName;
  bool sass;

  PheasantAppConfig({
    this.mainEntryPoint = 'web/main.dart',
    this.appEntryPoint = 'lib/App.phs',
    this.extension = '.phs',
    this.sass = false
  });

  factory PheasantAppConfig.fromYamlMap(Map<String, dynamic> map) {
    return PheasantAppConfig(
      appEntryPoint: map['entry'] as String? ?? 'lib/App.phs',
      sass: map['sass'] as bool? ?? false
    );
  }

  String get mainEntry {
    return relativeFilePath(appEntryPoint, 'lib');
  }
}

typedef Config = PheasantAppConfig;

String relativeFilePath(String filePath, String baseDirectory) {
  // Normalize the paths to handle platform-specific differences
  filePath = path.normalize(filePath);
  baseDirectory = path.normalize(baseDirectory);

  // Calculate the relative path
  String relativePath = path.relative(filePath, from: baseDirectory);

  // If the file is in the base directory, the relative path might be empty,
  // so we append './' to represent the current directory.
  return relativePath.isEmpty ? '.' : relativePath;
}