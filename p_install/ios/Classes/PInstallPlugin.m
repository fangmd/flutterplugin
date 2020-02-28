#import "PInstallPlugin.h"
#if __has_include(<p_install/p_install-Swift.h>)
#import <p_install/p_install-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "p_install-Swift.h"
#endif

@implementation PInstallPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPInstallPlugin registerWithRegistrar:registrar];
}
@end
