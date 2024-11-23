#line 1 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_iOSCommonClass.xm"






static NSString* LastUpdate = @"20241123_1158";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"






NSString* Str_apple = @"apple";
NSString* Str_Preferences = @"Preferences";






BOOL isRelated(NSString *curStr);
void hookNSString_commonLogic(NSString* curStr);



BOOL isRelated(NSString *curStr){
    BOOL isRelated = FALSE;
    if (curStr){
        
        
        
        

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

@class NSError; @class NSString; @class NSURLRequest; @class NSMutableURLRequest; @class NSDictionary; @class NSMutableDictionary; @class NSURL; @class NSHTTPURLResponse; @class NSPropertyListSerialization; 
static NSString* (*_logos_orig$_ungrouped$NSString$initWithBytes$length$encoding$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const void *, NSUInteger, int) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithBytes$length$encoding$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const void *, NSUInteger, int) _LOGOS_RETURN_RETAINED; static NSString* (*_logos_orig$_ungrouped$NSString$initWithBytesNoCopy$length$encoding$freeWhenDone$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, void *, NSUInteger, int, BOOL) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithBytesNoCopy$length$encoding$freeWhenDone$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, void *, NSUInteger, int, BOOL) _LOGOS_RETURN_RETAINED; static NSString* (*_logos_orig$_ungrouped$NSString$initWithCharacters$length$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const unsigned short *, NSUInteger) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithCharacters$length$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const unsigned short *, NSUInteger) _LOGOS_RETURN_RETAINED; static NSString* (*_logos_orig$_ungrouped$NSString$initWithCharactersNoCopy$length$freeWhenDone$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, unsigned short *, NSUInteger, BOOL) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithCharactersNoCopy$length$freeWhenDone$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, unsigned short *, NSUInteger, BOOL) _LOGOS_RETURN_RETAINED; static NSString* (*_logos_orig$_ungrouped$NSString$initWithCString$encoding$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const char *, int) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithCString$encoding$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const char *, int) _LOGOS_RETURN_RETAINED; static NSString* (*_logos_orig$_ungrouped$NSString$initWithUTF8String$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const char *) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithUTF8String$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, const char *) _LOGOS_RETURN_RETAINED; static NSString* (*_logos_orig$_ungrouped$NSString$initWithData$encoding$)(_LOGOS_SELF_TYPE_INIT NSString*, SEL, NSData *, int) _LOGOS_RETURN_RETAINED; static NSString* _logos_method$_ungrouped$NSString$initWithData$encoding$(_LOGOS_SELF_TYPE_INIT NSString*, SEL, NSData *, int) _LOGOS_RETURN_RETAINED; static id (*_logos_meta_orig$_ungrouped$NSString$stringWithCharacters$length$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, const unsigned short *, NSUInteger); static id _logos_meta_method$_ungrouped$NSString$stringWithCharacters$length$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, const unsigned short *, NSUInteger); static id (*_logos_meta_orig$_ungrouped$NSString$stringWithCString$encoding$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, const char *, int); static id _logos_meta_method$_ungrouped$NSString$stringWithCString$encoding$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, const char *, int); static id (*_logos_meta_orig$_ungrouped$NSString$stringWithUTF8String$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, const char *); static id _logos_meta_method$_ungrouped$NSString$stringWithUTF8String$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, const char *); static void (*_logos_orig$_ungrouped$NSMutableDictionary$setObject$forKeyedSubscript$)(_LOGOS_SELF_TYPE_NORMAL NSMutableDictionary* _LOGOS_SELF_CONST, SEL, id, id<NSCopying>); static void _logos_method$_ungrouped$NSMutableDictionary$setObject$forKeyedSubscript$(_LOGOS_SELF_TYPE_NORMAL NSMutableDictionary* _LOGOS_SELF_CONST, SEL, id, id<NSCopying>); static void (*_logos_orig$_ungrouped$NSMutableDictionary$setObject$forKey$)(_LOGOS_SELF_TYPE_NORMAL NSMutableDictionary* _LOGOS_SELF_CONST, SEL, id, id<NSCopying>); static void _logos_method$_ungrouped$NSMutableDictionary$setObject$forKey$(_LOGOS_SELF_TYPE_NORMAL NSMutableDictionary* _LOGOS_SELF_CONST, SEL, id, id<NSCopying>); static NSDictionary* (*_logos_meta_orig$_ungrouped$NSDictionary$dictionaryWithObjects$forKeys$count$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id const *, id<NSCopying> const *, NSUInteger); static NSDictionary* _logos_meta_method$_ungrouped$NSDictionary$dictionaryWithObjects$forKeys$count$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id const *, id<NSCopying> const *, NSUInteger); static NSURL* (*_logos_meta_orig$_ungrouped$NSURL$URLWithString$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *); static NSURL* _logos_meta_method$_ungrouped$NSURL$URLWithString$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *); static NSURL* (*_logos_orig$_ungrouped$NSURL$initWithString$)(_LOGOS_SELF_TYPE_INIT NSURL*, SEL, NSString *) _LOGOS_RETURN_RETAINED; static NSURL* _logos_method$_ungrouped$NSURL$initWithString$(_LOGOS_SELF_TYPE_INIT NSURL*, SEL, NSString *) _LOGOS_RETURN_RETAINED; static NSURLRequest* (*_logos_meta_orig$_ungrouped$NSURLRequest$requestWithURL$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSURL *); static NSURLRequest* _logos_meta_method$_ungrouped$NSURLRequest$requestWithURL$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSURL *); static NSURLRequest* (*_logos_meta_orig$_ungrouped$NSURLRequest$requestWithURL$cachePolicy$timeoutInterval$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSURL *, NSURLRequestCachePolicy, NSTimeInterval); static NSURLRequest* _logos_meta_method$_ungrouped$NSURLRequest$requestWithURL$cachePolicy$timeoutInterval$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSURL *, NSURLRequestCachePolicy, NSTimeInterval); static NSURLRequest* (*_logos_orig$_ungrouped$NSURLRequest$initWithURL$)(_LOGOS_SELF_TYPE_NORMAL NSURLRequest* _LOGOS_SELF_CONST, SEL, NSURL *); static NSURLRequest* _logos_method$_ungrouped$NSURLRequest$initWithURL$(_LOGOS_SELF_TYPE_NORMAL NSURLRequest* _LOGOS_SELF_CONST, SEL, NSURL *); static NSURLRequest* (*_logos_orig$_ungrouped$NSURLRequest$initWithURL$cachePolicy$timeoutInterval$)(_LOGOS_SELF_TYPE_NORMAL NSURLRequest* _LOGOS_SELF_CONST, SEL, NSURL *, NSURLRequestCachePolicy, NSTimeInterval); static NSURLRequest* _logos_method$_ungrouped$NSURLRequest$initWithURL$cachePolicy$timeoutInterval$(_LOGOS_SELF_TYPE_NORMAL NSURLRequest* _LOGOS_SELF_CONST, SEL, NSURL *, NSURLRequestCachePolicy, NSTimeInterval); static void (*_logos_orig$_ungrouped$NSMutableURLRequest$setHTTPBody$)(_LOGOS_SELF_TYPE_NORMAL NSMutableURLRequest* _LOGOS_SELF_CONST, SEL, NSData*); static void _logos_method$_ungrouped$NSMutableURLRequest$setHTTPBody$(_LOGOS_SELF_TYPE_NORMAL NSMutableURLRequest* _LOGOS_SELF_CONST, SEL, NSData*); static void (*_logos_orig$_ungrouped$NSMutableURLRequest$setURL$)(_LOGOS_SELF_TYPE_NORMAL NSMutableURLRequest* _LOGOS_SELF_CONST, SEL, NSURL*); static void _logos_method$_ungrouped$NSMutableURLRequest$setURL$(_LOGOS_SELF_TYPE_NORMAL NSMutableURLRequest* _LOGOS_SELF_CONST, SEL, NSURL*); static NSHTTPURLResponse* (*_logos_orig$_ungrouped$NSHTTPURLResponse$initWithURL$statusCode$HTTPVersion$headerFields$)(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST, SEL, NSURL *, NSInteger, NSString *, NSDictionary<NSString *,NSString *> *); static NSHTTPURLResponse* _logos_method$_ungrouped$NSHTTPURLResponse$initWithURL$statusCode$HTTPVersion$headerFields$(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST, SEL, NSURL *, NSInteger, NSString *, NSDictionary<NSString *,NSString *> *); static NSDictionary * (*_logos_orig$_ungrouped$NSHTTPURLResponse$allHeaderFields)(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST, SEL); static NSDictionary * _logos_method$_ungrouped$NSHTTPURLResponse$allHeaderFields(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST, SEL); static NSInteger (*_logos_orig$_ungrouped$NSHTTPURLResponse$statusCode)(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$_ungrouped$NSHTTPURLResponse$statusCode(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST, SEL); static NSData * (*_logos_meta_orig$_ungrouped$NSPropertyListSerialization$dataWithPropertyList$format$options$error$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, NSPropertyListFormat, NSPropertyListWriteOptions, NSError **); static NSData * _logos_meta_method$_ungrouped$NSPropertyListSerialization$dataWithPropertyList$format$options$error$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, NSPropertyListFormat, NSPropertyListWriteOptions, NSError **); static NSError* (*_logos_meta_orig$_ungrouped$NSError$errorWithDomain$code$userInfo$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSErrorDomain, NSInteger, NSDictionary<NSErrorUserInfoKey, id> *); static NSError* _logos_meta_method$_ungrouped$NSError$errorWithDomain$code$userInfo$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSErrorDomain, NSInteger, NSDictionary<NSErrorUserInfoKey, id> *); static NSError* (*_logos_orig$_ungrouped$NSError$initWithDomain$code$userInfo$)(_LOGOS_SELF_TYPE_INIT NSError*, SEL, NSErrorDomain, NSInteger, NSDictionary<NSErrorUserInfoKey, id> *) _LOGOS_RETURN_RETAINED; static NSError* _logos_method$_ungrouped$NSError$initWithDomain$code$userInfo$(_LOGOS_SELF_TYPE_INIT NSError*, SEL, NSErrorDomain, NSInteger, NSDictionary<NSErrorUserInfoKey, id> *) _LOGOS_RETURN_RETAINED; 

#line 60 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_iOSCommonClass.xm"


static NSString* _logos_method$_ungrouped$NSString$initWithBytes$length$encoding$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, const void * bytes, NSUInteger len, int encoding) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithBytes$length$encoding$(self, _cmd, bytes, len, encoding);
    
    hookNSString_commonLogic(newStr);

    return newStr;
}

static NSString* _logos_method$_ungrouped$NSString$initWithBytesNoCopy$length$encoding$freeWhenDone$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, void * bytes, NSUInteger len, int encoding, BOOL freeBuffer) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithBytesNoCopy$length$encoding$freeWhenDone$(self, _cmd, bytes, len, encoding, freeBuffer);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static NSString* _logos_method$_ungrouped$NSString$initWithCharacters$length$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, const unsigned short * characters, NSUInteger length) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithCharacters$length$(self, _cmd, characters, length);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static NSString* _logos_method$_ungrouped$NSString$initWithCharactersNoCopy$length$freeWhenDone$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, unsigned short * characters, NSUInteger length, BOOL freeBuffer) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithCharactersNoCopy$length$freeWhenDone$(self, _cmd, characters, length, freeBuffer);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static NSString* _logos_method$_ungrouped$NSString$initWithCString$encoding$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, const char * cString, int encoding) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithCString$encoding$(self, _cmd, cString, encoding);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static NSString* _logos_method$_ungrouped$NSString$initWithUTF8String$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, const char * cString) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithUTF8String$(self, _cmd, cString);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static NSString* _logos_method$_ungrouped$NSString$initWithData$encoding$(_LOGOS_SELF_TYPE_INIT NSString* __unused self, SEL __unused _cmd, NSData * data, int encoding) _LOGOS_RETURN_RETAINED{
    id newStr = _logos_orig$_ungrouped$NSString$initWithData$encoding$(self, _cmd, data, encoding);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static id _logos_meta_method$_ungrouped$NSString$stringWithCharacters$length$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, const unsigned short * characters, NSUInteger length){
    id newStr = _logos_meta_orig$_ungrouped$NSString$stringWithCharacters$length$(self, _cmd, characters, length);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static id _logos_meta_method$_ungrouped$NSString$stringWithCString$encoding$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, const char * cString, int enc){
    id newStr = _logos_meta_orig$_ungrouped$NSString$stringWithCString$encoding$(self, _cmd, cString, enc);

    hookNSString_commonLogic(newStr);

    return newStr;
}

static id _logos_meta_method$_ungrouped$NSString$stringWithUTF8String$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, const char * nullTerminatedCString){
    id newStr = _logos_meta_orig$_ungrouped$NSString$stringWithUTF8String$(self, _cmd, nullTerminatedCString);

    hookNSString_commonLogic(newStr);

    return newStr;
}










static void _logos_method$_ungrouped$NSMutableDictionary$setObject$forKeyedSubscript$(_LOGOS_SELF_TYPE_NORMAL NSMutableDictionary* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id obj, id<NSCopying> key){
    iosLogInfo("obj=%{public}@, key=%{public}@", obj, key);
    _logos_orig$_ungrouped$NSMutableDictionary$setObject$forKeyedSubscript$(self, _cmd, obj, key);
}


static void _logos_method$_ungrouped$NSMutableDictionary$setObject$forKey$(_LOGOS_SELF_TYPE_NORMAL NSMutableDictionary* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id anObject, id<NSCopying> aKey){
    iosLogInfo("anObject=%{public}@, aKey=%{public}@", anObject, aKey);
    _logos_orig$_ungrouped$NSMutableDictionary$setObject$forKey$(self, _cmd, anObject, aKey);
}











static NSDictionary* _logos_meta_method$_ungrouped$NSDictionary$dictionaryWithObjects$forKeys$count$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id const * objects, id<NSCopying> const * keys, NSUInteger cnt){

    id retNewDict = _logos_meta_orig$_ungrouped$NSDictionary$dictionaryWithObjects$forKeys$count$(self, _cmd, objects, keys, cnt);



    iosLogInfo("cnt=%lu -> retNewDict=%{public}@", cnt, retNewDict);


    for (NSInteger i = 0; i < cnt; i++) {
        id curKey = keys[i];
        id curValObj = objects[i];
        iosLogInfo("  [%lu] %{public}@=%{public}@", i, curKey, curValObj);
    }
    return retNewDict;
}









static NSURL* _logos_meta_method$_ungrouped$NSURL$URLWithString$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * URLString){
    id newUrl_uws = _logos_meta_orig$_ungrouped$NSURL$URLWithString$(self, _cmd, URLString);
    iosLogInfo("URLString=%{public}@ -> newUrl_uws=%{public}@", URLString, newUrl_uws);
    return newUrl_uws;
}

static NSURL* _logos_method$_ungrouped$NSURL$initWithString$(_LOGOS_SELF_TYPE_INIT NSURL* __unused self, SEL __unused _cmd, NSString * URLString) _LOGOS_RETURN_RETAINED{
    id newUrl_iws = _logos_orig$_ungrouped$NSURL$initWithString$(self, _cmd, URLString);
    iosLogInfo("URLString=%{public}@ -> newUrl_iws=%{public}@", URLString, newUrl_iws);
    return newUrl_iws;
}









static NSURLRequest* _logos_meta_method$_ungrouped$NSURLRequest$requestWithURL$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * URL){
    iosLogInfo("URL=%{public}@", URL);
    gNoUse = 1;
    return _logos_meta_orig$_ungrouped$NSURLRequest$requestWithURL$(self, _cmd, URL);
}

static NSURLRequest* _logos_meta_method$_ungrouped$NSURLRequest$requestWithURL$cachePolicy$timeoutInterval$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * URL, NSURLRequestCachePolicy cachePolicy, NSTimeInterval timeoutInterval){
    iosLogInfo("URL=%{public}@, cachePolicy=%lu, timeoutInterval=%f", URL, (unsigned long)cachePolicy, timeoutInterval);

    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    gNoUse = 1;
    return _logos_meta_orig$_ungrouped$NSURLRequest$requestWithURL$cachePolicy$timeoutInterval$(self, _cmd, URL, cachePolicy, timeoutInterval);
}

static NSURLRequest* _logos_method$_ungrouped$NSURLRequest$initWithURL$(_LOGOS_SELF_TYPE_NORMAL NSURLRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * URL){
    NSURLRequest* iwu =  _logos_orig$_ungrouped$NSURLRequest$initWithURL$(self, _cmd, URL);
    iosLogInfo("URL=%{public}@", URL);
    return iwu;
}

static NSURLRequest* _logos_method$_ungrouped$NSURLRequest$initWithURL$cachePolicy$timeoutInterval$(_LOGOS_SELF_TYPE_NORMAL NSURLRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * URL, NSURLRequestCachePolicy cachePolicy, NSTimeInterval timeoutInterval){
    iosLogInfo("URL=%{public}@, cachePolicy=%lu, timeoutInterval=%f", URL, (unsigned long)cachePolicy, timeoutInterval);
    NSURLRequest* iwu_uct =  _logos_orig$_ungrouped$NSURLRequest$initWithURL$cachePolicy$timeoutInterval$(self, _cmd, URL, cachePolicy, timeoutInterval);
    return iwu_uct;
}









static void _logos_method$_ungrouped$NSMutableURLRequest$setHTTPBody$(_LOGOS_SELF_TYPE_NORMAL NSMutableURLRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSData* newHttpBodyData) {
    NSURL *reqUrl = [self URL];
    iosLogInfo("reqUrl=%{public}@", reqUrl);
    
    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    _logos_orig$_ungrouped$NSMutableURLRequest$setHTTPBody$(self, _cmd, newHttpBodyData);
}

static void _logos_method$_ungrouped$NSMutableURLRequest$setURL$(_LOGOS_SELF_TYPE_NORMAL NSMutableURLRequest* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL* newURL) {
    iosLogInfo("newURL=%{public}@", newURL);

    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    _logos_orig$_ungrouped$NSMutableURLRequest$setURL$(self, _cmd, newURL);
}









static NSHTTPURLResponse* _logos_method$_ungrouped$NSHTTPURLResponse$initWithURL$statusCode$HTTPVersion$headerFields$(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSURL * url, NSInteger statusCode, NSString * HTTPVersion, NSDictionary<NSString *,NSString *> * headerFields){
    NSHTTPURLResponse* newUrlResp =  _logos_orig$_ungrouped$NSHTTPURLResponse$initWithURL$statusCode$HTTPVersion$headerFields$(self, _cmd, url, statusCode, HTTPVersion, headerFields);
    iosLogInfo("url=%{public}@,statusCode=%ld,HTTPVersion=%{public}@,headerFields=%{public}@ -> newUrlResp=%{public}@", url, statusCode, HTTPVersion, headerFields, newUrlResp);
    return newUrlResp;
}

static NSDictionary * _logos_method$_ungrouped$NSHTTPURLResponse$allHeaderFields(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    NSURL* curUrl = [self URL];
    NSDictionary* allHeader = _logos_orig$_ungrouped$NSHTTPURLResponse$allHeaderFields(self, _cmd);


    NSString* respUrlHeaderStr = [NSString stringWithFormat:@"NSHTTPURLResponse:allHeaderFields curUrl=%@ : allHeader=%@", curUrl, allHeader];
    logPossibleLargeStr(respUrlHeaderStr);

    return allHeader;
}

static NSInteger _logos_method$_ungrouped$NSHTTPURLResponse$statusCode(_LOGOS_SELF_TYPE_NORMAL NSHTTPURLResponse* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    NSURL* curUrl = [self URL];
    NSInteger respStatusCode = _logos_orig$_ungrouped$NSHTTPURLResponse$statusCode(self, _cmd);
    iosLogInfo("respStatusCode=%ld : curUrl=%{public}@", respStatusCode, curUrl);
    
    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    return respStatusCode;
}









static NSData * _logos_meta_method$_ungrouped$NSPropertyListSerialization$dataWithPropertyList$format$options$error$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id plist, NSPropertyListFormat format, NSPropertyListWriteOptions opt, NSError ** error){
    iosLogInfo("plist=%{public}@, format=%lu, opt=%lu, error=%p", plist, format, opt, error);

    NSArray *btArr = [CrifanLibiOS printCallStack];
    iosLogInfo("btArr=%{public}@", btArr);

    NSData* respData = _logos_meta_orig$_ungrouped$NSPropertyListSerialization$dataWithPropertyList$format$options$error$(self, _cmd, plist, format, opt, error);
    iosLogInfo("respData=%{public}@", respData);
    return respData;
}









static NSError* _logos_meta_method$_ungrouped$NSError$errorWithDomain$code$userInfo$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSErrorDomain domain, NSInteger code, NSDictionary<NSErrorUserInfoKey, id> * dict){
    id newErr_ewd = _logos_meta_orig$_ungrouped$NSError$errorWithDomain$code$userInfo$(self, _cmd, domain, code, dict);
    iosLogInfo("domain=%{public}@, code=%ld, dict=%{public}@ -> newErr_ewd=%{public}@", domain, code, dict, newErr_ewd);
    return newErr_ewd;
}

static NSError* _logos_method$_ungrouped$NSError$initWithDomain$code$userInfo$(_LOGOS_SELF_TYPE_INIT NSError* __unused self, SEL __unused _cmd, NSErrorDomain domain, NSInteger code, NSDictionary<NSErrorUserInfoKey, id> * dict) _LOGOS_RETURN_RETAINED{
    id newErr_iwd = _logos_orig$_ungrouped$NSError$initWithDomain$code$userInfo$(self, _cmd, domain, code, dict);
    iosLogInfo("domain=%{public}@, code=%ld, dict=%{public}@ -> newErr_iwd=%{public}@", domain, code, dict, newErr_iwd);
    return newErr_iwd;
}







static __attribute__((constructor)) void _logosLocalCtor_f15d1557(int __unused argc, char __unused **argv, char __unused **envp) {
    iosLogInfo("%@: %s", LastUpdate, "hook_iOSCommonClass ctor");
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NSString = objc_getClass("NSString"); Class _logos_metaclass$_ungrouped$NSString = object_getClass(_logos_class$_ungrouped$NSString); { MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithBytes:length:encoding:), (IMP)&_logos_method$_ungrouped$NSString$initWithBytes$length$encoding$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithBytes$length$encoding$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithBytesNoCopy:length:encoding:freeWhenDone:), (IMP)&_logos_method$_ungrouped$NSString$initWithBytesNoCopy$length$encoding$freeWhenDone$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithBytesNoCopy$length$encoding$freeWhenDone$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithCharacters:length:), (IMP)&_logos_method$_ungrouped$NSString$initWithCharacters$length$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithCharacters$length$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithCharactersNoCopy:length:freeWhenDone:), (IMP)&_logos_method$_ungrouped$NSString$initWithCharactersNoCopy$length$freeWhenDone$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithCharactersNoCopy$length$freeWhenDone$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithCString:encoding:), (IMP)&_logos_method$_ungrouped$NSString$initWithCString$encoding$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithCString$encoding$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithUTF8String:), (IMP)&_logos_method$_ungrouped$NSString$initWithUTF8String$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithUTF8String$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSString, @selector(initWithData:encoding:), (IMP)&_logos_method$_ungrouped$NSString$initWithData$encoding$, (IMP*)&_logos_orig$_ungrouped$NSString$initWithData$encoding$);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$NSString, @selector(stringWithCharacters:length:), (IMP)&_logos_meta_method$_ungrouped$NSString$stringWithCharacters$length$, (IMP*)&_logos_meta_orig$_ungrouped$NSString$stringWithCharacters$length$);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$NSString, @selector(stringWithCString:encoding:), (IMP)&_logos_meta_method$_ungrouped$NSString$stringWithCString$encoding$, (IMP*)&_logos_meta_orig$_ungrouped$NSString$stringWithCString$encoding$);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$NSString, @selector(stringWithUTF8String:), (IMP)&_logos_meta_method$_ungrouped$NSString$stringWithUTF8String$, (IMP*)&_logos_meta_orig$_ungrouped$NSString$stringWithUTF8String$);}Class _logos_class$_ungrouped$NSMutableDictionary = objc_getClass("NSMutableDictionary"); { MSHookMessageEx(_logos_class$_ungrouped$NSMutableDictionary, @selector(setObject:forKeyedSubscript:), (IMP)&_logos_method$_ungrouped$NSMutableDictionary$setObject$forKeyedSubscript$, (IMP*)&_logos_orig$_ungrouped$NSMutableDictionary$setObject$forKeyedSubscript$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSMutableDictionary, @selector(setObject:forKey:), (IMP)&_logos_method$_ungrouped$NSMutableDictionary$setObject$forKey$, (IMP*)&_logos_orig$_ungrouped$NSMutableDictionary$setObject$forKey$);}Class _logos_class$_ungrouped$NSDictionary = objc_getClass("NSDictionary"); Class _logos_metaclass$_ungrouped$NSDictionary = object_getClass(_logos_class$_ungrouped$NSDictionary); { MSHookMessageEx(_logos_metaclass$_ungrouped$NSDictionary, @selector(dictionaryWithObjects:forKeys:count:), (IMP)&_logos_meta_method$_ungrouped$NSDictionary$dictionaryWithObjects$forKeys$count$, (IMP*)&_logos_meta_orig$_ungrouped$NSDictionary$dictionaryWithObjects$forKeys$count$);}Class _logos_class$_ungrouped$NSURL = objc_getClass("NSURL"); Class _logos_metaclass$_ungrouped$NSURL = object_getClass(_logos_class$_ungrouped$NSURL); { MSHookMessageEx(_logos_metaclass$_ungrouped$NSURL, @selector(URLWithString:), (IMP)&_logos_meta_method$_ungrouped$NSURL$URLWithString$, (IMP*)&_logos_meta_orig$_ungrouped$NSURL$URLWithString$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSURL, @selector(initWithString:), (IMP)&_logos_method$_ungrouped$NSURL$initWithString$, (IMP*)&_logos_orig$_ungrouped$NSURL$initWithString$);}Class _logos_class$_ungrouped$NSURLRequest = objc_getClass("NSURLRequest"); Class _logos_metaclass$_ungrouped$NSURLRequest = object_getClass(_logos_class$_ungrouped$NSURLRequest); { MSHookMessageEx(_logos_metaclass$_ungrouped$NSURLRequest, @selector(requestWithURL:), (IMP)&_logos_meta_method$_ungrouped$NSURLRequest$requestWithURL$, (IMP*)&_logos_meta_orig$_ungrouped$NSURLRequest$requestWithURL$);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$NSURLRequest, @selector(requestWithURL:cachePolicy:timeoutInterval:), (IMP)&_logos_meta_method$_ungrouped$NSURLRequest$requestWithURL$cachePolicy$timeoutInterval$, (IMP*)&_logos_meta_orig$_ungrouped$NSURLRequest$requestWithURL$cachePolicy$timeoutInterval$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSURLRequest, @selector(initWithURL:), (IMP)&_logos_method$_ungrouped$NSURLRequest$initWithURL$, (IMP*)&_logos_orig$_ungrouped$NSURLRequest$initWithURL$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSURLRequest, @selector(initWithURL:cachePolicy:timeoutInterval:), (IMP)&_logos_method$_ungrouped$NSURLRequest$initWithURL$cachePolicy$timeoutInterval$, (IMP*)&_logos_orig$_ungrouped$NSURLRequest$initWithURL$cachePolicy$timeoutInterval$);}Class _logos_class$_ungrouped$NSMutableURLRequest = objc_getClass("NSMutableURLRequest"); { MSHookMessageEx(_logos_class$_ungrouped$NSMutableURLRequest, @selector(setHTTPBody:), (IMP)&_logos_method$_ungrouped$NSMutableURLRequest$setHTTPBody$, (IMP*)&_logos_orig$_ungrouped$NSMutableURLRequest$setHTTPBody$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSMutableURLRequest, @selector(setURL:), (IMP)&_logos_method$_ungrouped$NSMutableURLRequest$setURL$, (IMP*)&_logos_orig$_ungrouped$NSMutableURLRequest$setURL$);}Class _logos_class$_ungrouped$NSHTTPURLResponse = objc_getClass("NSHTTPURLResponse"); { MSHookMessageEx(_logos_class$_ungrouped$NSHTTPURLResponse, @selector(initWithURL:statusCode:HTTPVersion:headerFields:), (IMP)&_logos_method$_ungrouped$NSHTTPURLResponse$initWithURL$statusCode$HTTPVersion$headerFields$, (IMP*)&_logos_orig$_ungrouped$NSHTTPURLResponse$initWithURL$statusCode$HTTPVersion$headerFields$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSHTTPURLResponse, @selector(allHeaderFields), (IMP)&_logos_method$_ungrouped$NSHTTPURLResponse$allHeaderFields, (IMP*)&_logos_orig$_ungrouped$NSHTTPURLResponse$allHeaderFields);}{ MSHookMessageEx(_logos_class$_ungrouped$NSHTTPURLResponse, @selector(statusCode), (IMP)&_logos_method$_ungrouped$NSHTTPURLResponse$statusCode, (IMP*)&_logos_orig$_ungrouped$NSHTTPURLResponse$statusCode);}Class _logos_class$_ungrouped$NSPropertyListSerialization = objc_getClass("NSPropertyListSerialization"); Class _logos_metaclass$_ungrouped$NSPropertyListSerialization = object_getClass(_logos_class$_ungrouped$NSPropertyListSerialization); { MSHookMessageEx(_logos_metaclass$_ungrouped$NSPropertyListSerialization, @selector(dataWithPropertyList:format:options:error:), (IMP)&_logos_meta_method$_ungrouped$NSPropertyListSerialization$dataWithPropertyList$format$options$error$, (IMP*)&_logos_meta_orig$_ungrouped$NSPropertyListSerialization$dataWithPropertyList$format$options$error$);}Class _logos_class$_ungrouped$NSError = objc_getClass("NSError"); Class _logos_metaclass$_ungrouped$NSError = object_getClass(_logos_class$_ungrouped$NSError); { MSHookMessageEx(_logos_metaclass$_ungrouped$NSError, @selector(errorWithDomain:code:userInfo:), (IMP)&_logos_meta_method$_ungrouped$NSError$errorWithDomain$code$userInfo$, (IMP*)&_logos_meta_orig$_ungrouped$NSError$errorWithDomain$code$userInfo$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSError, @selector(initWithDomain:code:userInfo:), (IMP)&_logos_method$_ungrouped$NSError$initWithDomain$code$userInfo$, (IMP*)&_logos_orig$_ungrouped$NSError$initWithDomain$code$userInfo$);}} }
#line 356 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_iOSCommonClass.xm"
