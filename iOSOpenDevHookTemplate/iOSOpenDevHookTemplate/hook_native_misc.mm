#line 1 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_native_misc.xm"






static NSString* LastUpdate = @"20241123_1634";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"

const int OPEN_OK = 0;
const int OPEN_FAILED = -1;





int stat(const char *pathname, struct stat *buf);


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




#line 22 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_native_misc.xm"
__unused static int (*_logos_orig$_ungrouped$stat)(const char *pathname, struct stat *buf); __unused static int _logos_function$_ungrouped$stat(const char *pathname, struct stat *buf){
    int statRet = _logos_orig$_ungrouped$stat(pathname, buf);
    iosLogInfo("pathname=%{public}s -> statRet=%d", pathname, statRet);
    return statRet;
}

















int MaxSupportArgNum_open = 2;
int open(const char *path, int oflag, ...);

__unused static int (*_logos_orig$_ungrouped$open)(const char *path, int oflag, ...); __unused static int _logos_function$_ungrouped$open(const char *path, int oflag, ...){


    
    mode_t curPara, paraList[MaxSupportArgNum_open];
    va_list argList;
    int curParaNum = 0;

    va_start(argList, oflag);







    curPara = (mode_t) va_arg(argList, unsigned int);
    
    if (0 != (int)curPara) {
        paraList[curParaNum] = curPara;
        curParaNum += 1;
        iosLogDebug("[%d] para=%d", curParaNum, curPara);
    }
    va_end(argList);

    iosLogDebug("curParaNum=%d, argList=%{public}s", curParaNum, argList);


    int openRetValue = OPEN_FAILED;
    if (0 == curParaNum){
        openRetValue = _logos_orig$_ungrouped$open(path, oflag);
        iosLogInfo("path=%{public}s, oflag=0x%x -> openRetValue=%d", path, oflag, openRetValue);
    } else if (1 == curParaNum){
        mode_t mode = paraList[0];
        openRetValue = _logos_orig$_ungrouped$open(path, oflag, mode);
        iosLogInfo("path=%{public}s, oflag=0x%x, mode=0x%x -> openRetValue=%d", path, oflag, mode, openRetValue);
    }

    return openRetValue;
}






FILE* fopen(const char *filename, const char *mode);

__unused static int (*_logos_orig$_ungrouped$fopen)(const char *filename, const char *mode); __unused static int _logos_function$_ungrouped$fopen(const char *filename, const char *mode){
    int retValue = _logos_orig$_ungrouped$fopen(filename, mode);
    iosLogInfo("filename=%{public}s, mode=%{public}s -> retValue=%d", filename, mode, retValue);
    return retValue;
}





Class NSClassFromString(NSString *aClassName);

__unused static Class (*_logos_orig$_ungrouped$NSClassFromString)(NSString *aClassName); __unused static Class _logos_function$_ungrouped$NSClassFromString(NSString *aClassName){
    id origRet = _logos_orig$_ungrouped$NSClassFromString(aClassName);
    iosLogInfo("aClassName=%{public}@ -> origRet=%{public}@", aClassName, origRet);
    return origRet;
}





static __attribute__((constructor)) void _logosLocalCtor_343017e8(int __unused argc, char __unused **argv, char __unused **envp) {
    iosLogInfo("%@: %s", LastUpdate, "hook_native_misc ctor");
}
static __attribute__((constructor)) void _logosLocalInit() {
{void * _logos_symbol$_ungrouped$stat = (void *)stat; MSHookFunction((void *)_logos_symbol$_ungrouped$stat, (void *)&_logos_function$_ungrouped$stat, (void **)&_logos_orig$_ungrouped$stat);void * _logos_symbol$_ungrouped$open = (void *)open; MSHookFunction((void *)_logos_symbol$_ungrouped$open, (void *)&_logos_function$_ungrouped$open, (void **)&_logos_orig$_ungrouped$open);void * _logos_symbol$_ungrouped$fopen = (void *)fopen; MSHookFunction((void *)_logos_symbol$_ungrouped$fopen, (void *)&_logos_function$_ungrouped$fopen, (void **)&_logos_orig$_ungrouped$fopen);void * _logos_symbol$_ungrouped$NSClassFromString = (void *)NSClassFromString; MSHookFunction((void *)_logos_symbol$_ungrouped$NSClassFromString, (void *)&_logos_function$_ungrouped$NSClassFromString, (void **)&_logos_orig$_ungrouped$NSClassFromString);} }
#line 120 "/Users/crifan/dev/dev_root/crifan/github/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/iOSOpenDevHookTemplate/hook_native_misc.xm"
