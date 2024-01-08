import 'package:pheasant_meta/pheasant_meta.dart';

import '../tools/input.dart';

@Change(
  "function doesn't take order into account",
  suggestedFunc: 'renderInputArr'
)
PheasantInput renderInput({String phsData = '<script></script><template></template><style></style>'}) {
  List<String> initSplit = phsData.split('</script>');
  List<String> newSplit = initSplit.last.split('</template>'); 
  newSplit.insert(0, initSplit.first);
  newSplit[0] = newSplit[0].replaceFirst('<script>', '');
  newSplit[1] = newSplit[1].replaceFirst('<template>', '');
  newSplit[2] = newSplit[2].replaceFirst('<style>', '').replaceFirst('</style>', '');

  newSplit[1] = newSplit[1].replaceFirst('\n\n', '');
  newSplit[2] = newSplit[2].replaceFirst('\n\n', '');

  return PheasantInput(script: newSplit[0], template: newSplit[1], styles: newSplit[2]);
}

// external PheasantInput renderInputArr({String phsData = '<script></script><template></template><style></style>'});