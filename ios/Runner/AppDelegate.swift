import Flutter
import UIKit
import intelligence

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    IntelligencePlugin.storage.attachListener {
      AppShortcuts.updateAppShortcutParameters()
    }
    if #available(iOS 18.0, *) {
        IntelligencePlugin.spotlightCore.attachEntityMapper() { item in
          return WorkoutEntity(
            id: item.id,
            representation: item.representation
          )
        }
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
