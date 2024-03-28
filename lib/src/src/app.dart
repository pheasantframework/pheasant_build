import 'package:pheasant_build/src/src/render.dart';
import 'package:pheasant_temp/pheasant_build.dart';

// TODO: Document

/// A base Pheasant Application. This can be used instead of the [createApp] function to extend your application and its functionality, like by adding routers.
/// 
/// This base class shouldn't be used directly by the user, but can be used via the plugins API for adding functionality to your application either via extending this class or by adding extensions.
/// 
/// Every Pheasant Application has a [build] method, which builds the application and then renders it into the DOM.
abstract class PheasantBaseApp {
  /// The Application as a [PheasantTemplate] (i.e as the `App` getter or your Application Component)
  PheasantTemplate app;

  /// The state of the application as [AppState]
  AppState state;

  PheasantBaseApp(this.app, {AppState? appState}): state = appState ?? AppState(
    component: app,
    watchers: List.empty(growable: true)
  );

  /// Builds the pheasant application and renders it into the dom. 
  /// Specify [selector] to choose to render to a specific component like one with an `id` of `"out"` (`"#out"`). Defaults to `"#output"`.
  void build([String selector = '#output']) {
    createApp(app, appState: state, selector: selector);
  }
}

/// The Standard Pheasant Application used in creating and rendering applications in a Pheasant Web App.
/// 
/// This is the MVP Application object used for basic, and plugin-less rendering of pheasant applications.
class PheasantApp extends PheasantBaseApp {
  /// Used to set the router for the pheasant application.
  set router(Router newRouter) {
    Router.globalRoutes = newRouter.mappedRoutes;
    setpopState();
    initPage(newRouter.initialRoute);
  }

  PheasantApp(PheasantTemplate app, {AppState? appState}): super(app, appState: appState);

  /// Constructor used to initialise a Pheasant Application, as well as with a router.
  PheasantApp.router(PheasantTemplate app, {required Router router, AppState? appState}): super(app, appState: appState) {
    this.router = router;
  }
}