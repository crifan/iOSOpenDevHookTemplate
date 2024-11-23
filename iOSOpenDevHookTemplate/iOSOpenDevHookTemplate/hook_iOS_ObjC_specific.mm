#line 1 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_iOS_ObjC_specific.xm"






static NSString* LastUpdate = @"20241123_1634";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"









#define CHARLES_CERT_FILE @"/Library/PreferenceLoader/Preferences/charles/charles-ssl-proxying-certificate.cer"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__asm__(".linker_option \"-framework\", \"CydiaSubstrate\"");

@class TTNetworkManagerChromium; 
static NSArray * (*_logos_orig$_ungrouped$TTNetworkManagerChromium$ServerCertificate)(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST, SEL); static NSArray * _logos_method$_ungrouped$TTNetworkManagerChromium$ServerCertificate(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST, SEL); 

#line 23 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_iOS_ObjC_specific.xm"


static NSArray * _logos_method$_ungrouped$TTNetworkManagerChromium$ServerCertificate(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    iosLogDebug("%s", "");
    NSArray* serverCertList = _logos_orig$_ungrouped$TTNetworkManagerChromium$ServerCertificate(self, _cmd);
    iosLogDebug("serverCertList=%{public}@", serverCertList);

    






    NSMutableArray* newCertList = [NSMutableArray arrayWithArray: serverCertList];
    iosLogDebug("newCertList=%{public}@, newCertList.count=%{public}lu", newCertList, [newCertList count]);

    NSString *certResourcePath = CHARLES_CERT_FILE;
    iosLogDebug("certResourcePath=%{public}@", certResourcePath);

    NSFileManager *defaultManager = [NSFileManager defaultManager];
    BOOL isExistedCert = [defaultManager fileExistsAtPath: certResourcePath];
    iosLogInfo("isExistedCert=%s", boolToStr(isExistedCert));
    if (isExistedCert) {
        NSData *certP12Data = [NSData dataWithContentsOfFile: certResourcePath];
        iosLogDebug("certP12Data=%{public}@", certP12Data);
        [newCertList addObject: certP12Data];
        iosLogDebug("newCertList=%{public}@, newCertList.count=%{public}lu", newCertList, [newCertList count]);
    }

    NSMutableArray* retNewCertList = [newCertList copy];
    iosLogDebug("retNewCertList=%{public}@", retNewCertList);
    return retNewCertList;
}









static __attribute__((constructor)) void _logosLocalCtor_b80a3c95(int __unused argc, char __unused **argv, char __unused **envp) {
    iosLogInfo("%@: %s", LastUpdate, "hook_iOS_ObjC_specific ctor");
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$TTNetworkManagerChromium = objc_getClass("TTNetworkManagerChromium"); { MSHookMessageEx(_logos_class$_ungrouped$TTNetworkManagerChromium, @selector(ServerCertificate), (IMP)&_logos_method$_ungrouped$TTNetworkManagerChromium$ServerCertificate, (IMP*)&_logos_orig$_ungrouped$TTNetworkManagerChromium$ServerCertificate);}} }
#line 69 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_iOS_ObjC_specific.xm"
