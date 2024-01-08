import 'dart:html';

import 'package:pheasant_temp/pheasant_build.dart';

void renderElement(Element elementApp) {
  document.body?.children.add(elementApp);
  querySelector('#output')?.children.add(elementApp);
}

// TODO: Create Support for JS files and scripts
void createApp(PheasantTemplate pheasantTemplate) {
  renderElement(pheasantTemplate.render(pheasantTemplate.template!));
}

//  void renderScripts(List<String> scripts, {String htmlPath = 'web/index.html'}) {
//    document.head?.children.addAll(
//      List.generate(scripts.length, (index) {
//        return ScriptElement()
//        ..src = normalisePath(scripts[index], htmlPath: htmlPath); 
//      })
//    );
//  }
// 
//  String normalisePath(String script, {String appPath = 'lib/app.phs', String htmlPath = 'web/index.html'}) {
//    // Normalise Path
//    Uri scriptpath = Uri.file(script);
//    Uri htmlpath = Uri.file(htmlPath);
//    Uri apppath = Uri.file(appPath);
// 
//    return script;
//  }