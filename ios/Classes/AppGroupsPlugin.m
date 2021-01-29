#import "AppGroupsPlugin.h"
#if __has_include(<app_groups/app_groups-Swift.h>)
#import <app_groups/app_groups-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_groups-Swift.h"
#endif

@implementation AppGroupsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppGroupsPlugin registerWithRegistrar:registrar];
}
@end
