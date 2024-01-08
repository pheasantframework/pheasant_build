import 'package:pheasant_assets/pheasant_build.dart';
import 'package:pheasant_meta/pheasant_meta.dart';

import '../tools/input.dart';

@Change(
  "function doesn't take order into account",
  suggestedFunc: 'renderInputArr'
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

// external PheasantInput renderInputArr({String phsData = '<script></script><template></template><style></style>'});