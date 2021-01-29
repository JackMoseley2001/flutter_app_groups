import Flutter
import UIKit

public class SwiftAppGroupsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dev.jackmoseley.app_groups", binaryMessenger: registrar.messenger())
    let instance = SwiftAppGroupsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getSharedDirectory") {
      guard let group = call.arguments as? String else { return result(FlutterError(code: "-1", message: "Invalid group ID", details: nil)) }
      let containerUrl = getContainerURL(group: group)
      result(containerUrl)
    }
    result(FlutterMethodNotImplemented)
  }

  private func getContainerURL(group: String) -> String? {
    let fileManager = FileManager()
    if let url = fileManager.containerURL(forSecurityApplicationGroupIdentifier: group) {
      return url.absoluteString
    } else {
      return nil
    }
  }

}
