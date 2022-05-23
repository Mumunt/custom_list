#import "TableNewPlugin.h"
#if __has_include(<table_new/table_new-Swift.h>)
#import <table_new/table_new-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "table_new-Swift.h"
#endif

@implementation TableNewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTableNewPlugin registerWithRegistrar:registrar];
}
@end
