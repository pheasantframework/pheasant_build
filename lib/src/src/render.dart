import 'dart:html' show Element, querySelector;

import 'package:pheasant_temp/pheasant_build.dart' show PheasantTemplate, AppState;

// TODO: Include description and implement new functions for State Management

/// Function used to encapsulate the injection of the processed [PheasantTemplate] into the DOM
/// 
/// With time, the functions here will be developed on further.
void renderElement(PheasantTemplate app, {AppState? appState}) {
  AppState state = AppState(component: app);
  PheasantTemplate appObj = app;
  Element elementApp = appObj.render(appObj.template!, state);
  querySelector('#output')?.children.add(elementApp);

  state.stateStream.listen((event) {
    elementApp = appObj.render(appObj.template!, state);
    querySelector('#output')?.children.first = elementApp;
  },);
}

/// Function used to create a Pheasant Application
/// 
/// The function accepts a pheasant file object - [PheasantTemplate] - and then processes the application.
/// Once it is done, then it is injected into the DOM.
void createApp(PheasantTemplate pheasantTemplate) {
  renderElement(pheasantTemplate);
}