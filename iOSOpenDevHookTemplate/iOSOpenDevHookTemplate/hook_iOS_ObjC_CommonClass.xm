/*
    File: hook_iOS_ObjC_CommonClass.xm
    Function: hook iOS ObjC common class related functions
    Author: Crifan Li
*/

static NSString* LastUpdate = @"20241206_1746";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"

/*------------------------------------------------------------------------------
 Const
------------------------------------------------------------------------------*/

NSString* Str_apple = @"apple";
NSString* Str_Preferences = @"Preferences";


/*
 for omit these hook log:

 默认	17:37:30.604506+0800	SpringBoard	hook_iOS_ObjC_CommonClass.xm NSDictionary$dictionaryWithObjects$forKeys$count$:   [0] NSFont=<UICTFont: 0x1018970f0> font-family: ".SFUIText-Semibold"; font-weight: bold; font-style: normal; font-size: 17.00pt

 默认    17:37:30.104465+0800    SpringBoard    hook_iOS_ObjC_CommonClass.xm NSDictionary$dictionaryWithObjects$forKeys$count$:   [0] FBApplicationStoreRepositoryChangeKey=PendingNotificationRecords
 默认    17:37:30.104679+0800    SpringBoard    hook_iOS_ObjC_CommonClass.xm NSDictionary$dictionaryWithObjects$forKeys$count$:   [1] FBApplicationStoreRepositoryChangeApp=com.apple.CoreAuthUI
 默认    17:37:30.104948+0800    SpringBoard    hook_iOS_ObjC_CommonClass.xm NSDictionary$dictionaryWithObjects$forKeys$count$:   [2] FBApplicationStoreRepositoryChangeValue=<null>
 */
NSString* Str_topItem = @"topItem";
NSString* Str_NSFont = @"NSFont";
NSString* Str_NSColor = @"NSColor";
NSString* Str_FBApplicationStoreRepository = @"FBApplicationStoreRepository";

//Class Class_NSString = NSClassFromString(@"NSString");
Class Class_NSString = objc_getClass("NSString");

/*------------------------------------------------------------------------------
 Common Functions
------------------------------------------------------------------------------*/

/*---------- function prototype = declaration ----------*/
BOOL isOmittedStr(NSString *curStr);
BOOL isOmitted(id curId);
BOOL isRelatedStr(NSString *curStr);
void hookNSString_commonLogic(NSString* curStr);

/*---------- functions ----------*/

BOOL isOmittedStr(NSString *curStr){
    BOOL isOmittedStr = FALSE;
    if (curStr){
        // - isEqualToString:
        // - hasPrefix:
        // - hasSuffix:
        // - containsString:

        BOOL isTopItem = [curStr isEqualToString: Str_topItem];
        BOOL isNSFont = [curStr hasPrefix: Str_NSFont];
        BOOL isNSColor = [curStr hasPrefix: Str_NSColor];
        BOOL isFBApplicationStoreRepository = [curStr containsString: Str_FBApplicationStoreRepository];

        isOmittedStr = isTopItem || isNSFont || isNSColor || isFBApplicationStoreRepository;
    }
    return isOmittedStr;
}

BOOL isOmitted(id curId){
    BOOL isOmitted = FALSE;
    BOOL isNsstr = [curId isKindOfClass: Class_NSString];
//    iosLogInfo("isNsstr=%s", boolToStr(isNsstr));
    if (isNsstr){
        isOmitted = isOmittedStr((NSString*)curId);
//        iosLogInfo("isNsstr=%s -> isOmitted=%s", boolToStr(isNsstr), boolToStr(isOmitted));
    }
    return isOmitted;
}


BOOL isRelatedStr(NSString *curStr){
    BOOL isRelatedStr = FALSE;
    if (curStr){
        // - isEqualToString:
        // - hasPrefix:
        // - hasSuffix:
        // - containsString:

        BOOL isApple = [curStr hasPrefix: Str_apple];
        BOOL isPreferences = [curStr isEqualToString: Str_Preferences];

        isRelatedStr = isPreferences || isApple;
    }
    return isRelatedStr;
}

void hookNSString_commonLogic(NSString* curStr){
    if (isRelatedStr(curStr)){
        iosLogInfo("curStr=%{public}@", curStr);

        NSArray *callStackArr = [CrifanLibiOS printCallStack];
        iosLogInfo("callStackArr=%{public}@", callStackArr);
    }
}

/*------------------------------------------------------------------------------
 NSString
------------------------------------------------------------------------------*/

%hook NSString

- (id)initWithBytes:(const void *)bytes length:(NSUInteger)len encoding:(int)encoding{
    id newStr = %orig;
    
    hookNSString_commonLogic(newStr);

    return newStr;
}

- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(int)encoding freeWhenDone:(BOOL)freeBuffer{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

- (id)initWithCharacters:(const unsigned short *)characters length:(NSUInteger)length{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

- (id)initWithCharactersNoCopy:(unsigned short *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

- (id)initWithCString:(const char *)cString encoding:(int)encoding{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

- (id)initWithUTF8String:(const char *)cString{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

- (id)initWithData:(NSData *)data encoding:(int)encoding{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

+ (id)stringWithCharacters:(const unsigned short *)characters length:(NSUInteger)length{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

+ (id)stringWithCString:(const char *)cString encoding:(int)enc{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

+ (id)stringWithUTF8String:(const char *)nullTerminatedCString{
    id newStr = %orig;

    hookNSString_commonLogic(newStr);

    return newStr;
}

%end

/*------------------------------------------------------------------------------
 NSMutableDictionary
------------------------------------------------------------------------------*/

%hook NSMutableDictionary

//- (void)setObject:(ObjectType)obj forKeyedSubscript:(id<NSCopying>)key{
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    iosLogInfo("obj=%{public}@, key=%{public}@", obj, key);
    %orig;
}

//- (void)setObject:(ObjectType)anObject forKey:(id<NSCopying>)aKey{
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    iosLogInfo("anObject=%{public}@, aKey=%{public}@", anObject, aKey);
    %orig;
}

%end

/*------------------------------------------------------------------------------
 NSDictionary
------------------------------------------------------------------------------*/

%hook NSDictionary

//+ (instancetype)dictionaryWithObjects:(ObjectType  _Nonnull const *)objects forKeys:(id<NSCopying>  _Nonnull const *)keys count:(NSUInteger)cnt;
+ (instancetype)dictionaryWithObjects:(id const *)objects forKeys:(id<NSCopying> const *)keys count:(NSUInteger)cnt{
//+ (instancetype)dictionaryWithObjects:(id const)objects forKeys:(id<NSCopying> const)keys count:(NSUInteger)cnt{
    id retNewDict = %orig;
//    iosLogInfo("cnt=%lu, keys=%{public}@, objects=%{public}@ -> retNewDict=%{public}@", cnt, *keys, *objects, retNewDict);
//    iosLogInfo("cnt=%lu, keys=%{public}@, objects=%{public}@ -> retNewDict=%{public}@", cnt, keys, objects, retNewDict);
    
//    if ((7 == cnt) || (1 == cnt)) {
        iosLogInfo("cnt=%lu -> retNewDict=%{public}@", cnt, retNewDict);
        for (NSInteger i = 0; i < cnt; i++) {
            id curKey = keys[i];
            id curValObj = objects[i];
            if (!isOmitted(curKey)){
                iosLogInfo("  [%lu] %{public}@=%{public}@", i, curKey, curValObj);
            }
        }
//    }

    return retNewDict;
}

//+ (NSDictionary<NSString *,ObjectType> *)dictionaryWithContentsOfURL:(NSURL *)url error:(NSError * _Nullable *)error{
//    NSDictionary<NSString *,ObjectType>* origDict = %orig;
+ (NSDictionary<NSString *, id> *)dictionaryWithContentsOfURL:(NSURL *)url error:(NSError * _Nullable *)error{
    NSDictionary<NSString *, id>* origDict = %orig;
    iosLogInfo("url=%{public}@ -> origDict=%{public}@", url, origDict);
    return origDict;
}

%end

/*------------------------------------------------------------------------------
 NSURL
------------------------------------------------------------------------------*/

%hook NSURL

+ (instancetype)URLWithString:(NSString *)URLString{
    id newUrl_uws = %orig;
    iosLogInfo("URLString=%{public}@ -> newUrl_uws=%{public}@", URLString, newUrl_uws);
    return newUrl_uws;
}

- (instancetype)initWithString:(NSString *)URLString{
    id newUrl_iws = %orig;
    iosLogInfo("URLString=%{public}@ -> newUrl_iws=%{public}@", URLString, newUrl_iws);
    return newUrl_iws;
}

%end

/*------------------------------------------------------------------------------
 NSURLRequest
------------------------------------------------------------------------------*/

%hook NSURLRequest

+(instancetype)requestWithURL:(NSURL *)URL{
    iosLogInfo("URL=%{public}@", URL);
    gNoUse = 1;
    return %orig;
}

+(instancetype)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    iosLogInfo("URL=%{public}@, cachePolicy=%lu, timeoutInterval=%f", URL, (unsigned long)cachePolicy, timeoutInterval);

    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    gNoUse = 1;
    return %orig;
}

- (NSURLRequest*)initWithURL:(NSURL *)URL{
    NSURLRequest* iwu =  %orig;
    iosLogInfo("URL=%{public}@", URL);
    return iwu;
}

- (NSURLRequest*)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    iosLogInfo("URL=%{public}@, cachePolicy=%lu, timeoutInterval=%f", URL, (unsigned long)cachePolicy, timeoutInterval);
    NSURLRequest* iwu_uct =  %orig;
    return iwu_uct;
}

%end

/*------------------------------------------------------------------------------
 NSMutableURLRequest
------------------------------------------------------------------------------*/

%hook NSMutableURLRequest

- (void)setHTTPBody: (NSData*)newHttpBodyData {
    NSURL *reqUrl = [self URL];
    iosLogInfo("reqUrl=%{public}@", reqUrl);
    
    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    %orig;
}

- (void)setURL: (NSURL*)newURL {
    iosLogInfo("newURL=%{public}@", newURL);

    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    %orig;
}

%end

/*==============================================================================
 NSHTTPURLResponse
==============================================================================*/

%hook NSHTTPURLResponse

-(NSHTTPURLResponse*)initWithURL:(NSURL *)url statusCode:(NSInteger)statusCode HTTPVersion:(NSString *)HTTPVersion headerFields:(NSDictionary<NSString *,NSString *> *)headerFields{
    NSHTTPURLResponse* newUrlResp =  %orig;
    iosLogInfo("url=%{public}@,statusCode=%ld,HTTPVersion=%{public}@,headerFields=%{public}@ -> newUrlResp=%{public}@", url, statusCode, HTTPVersion, headerFields, newUrlResp);
    return newUrlResp;
}

-(NSDictionary *)allHeaderFields{
    NSURL* curUrl = [self URL];
    NSDictionary* allHeader = %orig;

//    iosLogInfo("curUrl=%@ : allHeader=%@", curUrl, allHeader);
    NSString* respUrlHeaderStr = [NSString stringWithFormat:@"NSHTTPURLResponse:allHeaderFields curUrl=%@ : allHeader=%@", curUrl, allHeader];
    logPossibleLargeStr(respUrlHeaderStr);

    return allHeader;
}

-(NSInteger)statusCode{
    NSURL* curUrl = [self URL];
    NSInteger respStatusCode = %orig;
    iosLogInfo("respStatusCode=%ld : curUrl=%{public}@", respStatusCode, curUrl);
    
    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    return respStatusCode;
}

%end


/*------------------------------------------------------------------------------
 NSPropertyListSerialization
------------------------------------------------------------------------------*/

%hook NSPropertyListSerialization
+ (NSData *)dataWithPropertyList:(id)plist format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError **)error{
    iosLogInfo("plist=%{public}@, format=%lu, opt=%lu, error=%p", plist, format, opt, error);

    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    NSData* respData = %orig;
    iosLogInfo("respData=%{public}@", respData);
    return respData;
}

%end

/*------------------------------------------------------------------------------
 NSError
------------------------------------------------------------------------------*/

%hook NSError

+ (instancetype)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary<NSErrorUserInfoKey, id> *)dict{
    id newErr_ewd = %orig;
    iosLogInfo("domain=%{public}@, code=%ld, dict=%{public}@ -> newErr_ewd=%{public}@", domain, code, dict, newErr_ewd);
    return newErr_ewd;
}

- (instancetype)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary<NSErrorUserInfoKey, id> *)dict{
    id newErr_iwd = %orig;
    iosLogInfo("domain=%{public}@, code=%ld, dict=%{public}@ -> newErr_iwd=%{public}@", domain, code, dict, newErr_iwd);
    return newErr_iwd;
}

%end

/*------------------------------------------------------------------------------
 UIDevice
------------------------------------------------------------------------------*/

%hook UIDevice

- (NSString *)name
{
    NSString* origName = %orig;
    iosLogInfo("origName=%{public}@", origName);
    return origName;
}

- (NSString *)systemName
{
    NSString* origSystemNameName = %orig;
    iosLogInfo("origSystemNameName=%{public}@", origSystemNameName);
    return origSystemNameName;
}

- (NSString *)systemVersion
{
    NSString* origSystemVersion = %orig;
    iosLogInfo("origSystemVersion=%{public}@", origSystemVersion);
    return origSystemVersion;
}

- (NSString *)model
{
    NSString* origModel = %orig;
    iosLogInfo("origModel=%{public}@", origModel);
    return origModel;
}

- (NSUUID *)identifierForVendor
{
    NSUUID* origIdfv = %orig;
    iosLogInfo("origIdfv=%{public}@", origIdfv);
    return origIdfv;
}

%end


/*------------------------------------------------------------------------------
 CTCarrier
------------------------------------------------------------------------------*/

%hook CTCarrier

- (BOOL)allowsVOIP
{
    BOOL origAllowsVOIP = %orig;
    iosLogInfo("origAllowsVOIP=%s", boolToStr(origAllowsVOIP));
    return origAllowsVOIP;
}

- (NSString *)carrierName
{
    NSString* origCarrierName = %orig;
    iosLogInfo("origCarrierName=%{public}@", origCarrierName);
    return origCarrierName;
}

- (NSString *)isoCountryCode
{
    NSString* origIsoCountryCode = %orig;
    iosLogInfo("origIsoCountryCode=%{public}@", origIsoCountryCode);
    return origIsoCountryCode;
}

- (NSString *)mobileCountryCode
{
    NSString* origMCC = %orig;
    iosLogInfo("origMCC=%{public}@", origMCC);
    return origMCC;
}

- (NSString *)mobileNetworkCode
{
    NSString* origMNC = %orig;
    iosLogInfo("origMNC=%{public}@", origMNC);
    return origMNC;
}

%end

/*==============================================================================
 ctor
==============================================================================*/

%ctor {
    iosLogInfo("%@: %s", LastUpdate, "hook_iOS_ObjC_CommonClass ctor");
}
