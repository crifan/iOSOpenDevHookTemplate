/*
    File: hook_iOSCommonClass.xm
    Function: hook iOS common class related functions
    Author: Crifan Li
*/

static NSString* LastUpdate = @"20241123_1158";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"


/*------------------------------------------------------------------------------
 Const
------------------------------------------------------------------------------*/

NSString* Str_apple = @"apple";
NSString* Str_Preferences = @"Preferences";

/*------------------------------------------------------------------------------
 Common Functions
------------------------------------------------------------------------------*/

/*---------- function prototype = declaration ----------*/
BOOL isRelated(NSString *curStr);
void hookNSString_commonLogic(NSString* curStr);

/*---------- functions ----------*/

BOOL isRelated(NSString *curStr){
    BOOL isRelated = FALSE;
    if (curStr){
        // - isEqualToString:
        // - hasPrefix:
        // - hasSuffix:
        // - containsString:

        BOOL isApple = [curStr hasPrefix: Str_apple];
        BOOL isPreferences = [curStr isEqualToString: Str_Preferences];

        isRelated = isPreferences || isApple;
    }
    return isRelated;
}

void hookNSString_commonLogic(NSString* curStr){
    if (isRelated(curStr)){
        iosLogInfo("curStr=%{public}@", curStr);

        NSArray *btArr = [CrifanLibiOS printCallStack];
        iosLogInfo("btArr=%{public}@", btArr);
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

    iosLogInfo("cnt=%lu -> retNewDict=%{public}@", cnt, retNewDict);
//    NSUInteger keyIdx = 0;
//    for(id curKey in objects){
    for (NSInteger i = 0; i < cnt; i++) {
        id curKey = keys[i];
        id curValObj = objects[i];
        iosLogInfo("  [%lu] %{public}@=%{public}@", i, curKey, curValObj);
    }
    return retNewDict;
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

/*==============================================================================
 ctor
==============================================================================*/

%ctor {
    iosLogInfo("%@: %s", LastUpdate, "hook_iOSCommonClass ctor");
}
