import 'package:pheasant_assets/pheasant_build.dart';
import 'package:pheasant_meta/pheasant_meta.dart';

import '../tools/input.dart';

/// Function used in rendering the input from a pheasant file.
/// 
/// The function parses [phsData], which represents the string representation of the pheasant data, and then separates it into it's constituent segments.
/// 
/// Returns a [PheasantComposedInput], which encapsulates each item involved in the parsing of the pheasant file.
@Change(
  "function doesn't take order into account, and does not allow for optional components",
)
PheasantComposedInput renderInput({String phsData = '<script></script><template></template><style></style>'}) {
  List<String> initSplit = phsData.split('</script>');
  List<String> newSplit = initSplit.last.split('</template>'); 
  newSplit.insert(0, initSplit.first);
  newSplit[0] = newSplit[0].replaceFirst('<script>', '');
  newSplit[1] = newSplit[1].replaceFirst('<template>', '');
  PheasantStyle pheasantStyle = getStyleInput(newSplit[2]);
  newSplit[2] = newSplit[2].replaceFirst(PheasantStyle.styleRegex, '').replaceFirst('</style>', '');

  newSplit[1] = newSplit[1].replaceFirst('\n\n', '');
  newSplit[2] = newSplit[2].replaceFirst('\n\n', '');

  return PheasantComposedInput(
    input: PheasantInput(script: newSplit[0], template: newSplit[1], styles: newSplit[2]), 
    style: pheasantStyle
  );
}