import 'dart:html';

import 'package:pheasant_temp/pheasant_build.dart';

/// Function used to encapsulate the injection of the processed [PheasantTemplate] into the DOM
/// 
/// With time, the functions here will be developed on further.
void renderElement(Element elementApp) {
  querySelector('#output')?.children.add(elementApp);
}

/// Function used to create a Pheasant Application
/// 
/// The function accepts a pheasant file object - [PheasantTemplate] - and then processes the application.
/// Once it is done, then it is injected into the DOM.
void createApp(PheasantTemplate pheasantTemplate) {
  renderElement(pheasantTemplate.render(pheasantTemplate.template!));
}