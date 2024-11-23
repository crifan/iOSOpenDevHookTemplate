/*
    File: hook_iOS_ObjC_specific.xm
    Function: hook iOS specific / misc item
    Author: Crifan Li
*/

static NSString* LastUpdate = @"20241123_1634";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"

/*==============================================================================
 Hook: Charles cert -> bypass https capture for Aweme/TikTok
==============================================================================*/

// to fix Charles capture https show Unknown issue
// https://bbs.pediy.com/thread-270700.htm
// https://iosre.com/t/topic/20202/46

#define CHARLES_CERT_FILE @"/Library/PreferenceLoader/Preferences/charles/charles-ssl-proxying-certificate.cer"

%hook TTNetworkManagerChromium

- (NSArray *)ServerCertificate {
    iosLogDebug("%s", "");
    NSArray* serverCertList = %orig();
    iosLogDebug("serverCertList=%{public}@", serverCertList);

    ////    NSString *serverCertListStr = [NSArray nsStrListToStr:serverCertList isSortList:FALSE isAddIndexPrefix:TRUE];
//    NSString *serverCertListStr = [CrifanLibHookiOS nsStrListToStr:serverCertList isSortList:FALSE isAddIndexPrefix:TRUE];
//    iosLogInfo("serverCertListStr=%{public}@", serverCertListStr);
//
////    return nil;
//    return serverCertList;

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

%end



/*==============================================================================
 ctor
==============================================================================*/

%ctor {
    iosLogInfo("%@: %s", LastUpdate, "hook_iOS_ObjC_specific ctor");
}
