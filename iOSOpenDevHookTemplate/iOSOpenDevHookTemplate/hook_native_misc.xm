/*
    File: hook_native_misc.xm
    Function: hook iOS native misc item
    Author: Crifan Li
*/

static NSString* LastUpdate = @"20241123_1634";

#import "HookLogiOS.h"
#import "CrifanLib.h"
#import "CrifanLibiOS.h"

const int OPEN_OK = 0;
const int OPEN_FAILED = -1;

/*==============================================================================
 Hook: stat()
==============================================================================*/

int stat(const char *pathname, struct stat *buf);

%hookf(int, stat, const char *pathname, struct stat *buf){
    int statRet = %orig;
    iosLogInfo("pathname=%{public}s -> statRet=%d", pathname, statRet);
    return statRet;
}

/*==============================================================================
 Hook: open()
==============================================================================*/

/*
 TODO: maybe need support more version:
        int creat(const char *pathname, mode_t mode);
        int openat(int dirfd, const char *pathname, int flags);
        int openat(int dirfd, const char *pathname, int flags, mode_t mode);
        int openat2(int dirfd, const char *pathname, const struct open_how *how, size_t size);
 refer:
    https://man7.org/linux/man-pages/man2/open.2.html
 */

// https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man2/open.2.html
// normally max number of open parameter is 1
int MaxSupportArgNum_open = 2;
int open(const char *path, int oflag, ...);

%hookf(int, open, const char *path, int oflag, ...){
//    iosLogDebug("path=%{public}s, oflag=%d", path, oflag);

    // Setting up some variables to get all the parameters from open
    mode_t curPara, paraList[MaxSupportArgNum_open];
    va_list argList;
    int curParaNum = 0;

    va_start(argList, oflag);
//    while ((curPara = (mode_t) va_arg(argList, mode_t))) {
//        paraList[curParaNum] = curPara;
//        curParaNum += 1;
//        os_log(OS_LOG_DEFAULT, "hook_open: [%d] curPara=%d", curParaNum, curPara);
//    }
//    unsigned int firstArg = va_arg(argList, mode_t)
//    curPara = (mode_t) va_arg(argList, mode_t);
    curPara = (mode_t) va_arg(argList, unsigned int);
    // maxium is only extra 1 para, so no need while
    if (0 != (int)curPara) {
        paraList[curParaNum] = curPara;
        curParaNum += 1;
        iosLogDebug("[%d] para=%d", curParaNum, curPara);
    }
    va_end(argList);

    iosLogDebug("curParaNum=%d, argList=%{public}s", curParaNum, argList);

//    return %orig;
    int openRetValue = OPEN_FAILED;
    if (0 == curParaNum){
        openRetValue = %orig(path, oflag);
        iosLogInfo("path=%{public}s, oflag=0x%x -> openRetValue=%d", path, oflag, openRetValue);
    } else if (1 == curParaNum){
        mode_t mode = paraList[0];
        openRetValue = %orig(path, oflag, mode);
        iosLogInfo("path=%{public}s, oflag=0x%x, mode=0x%x -> openRetValue=%d", path, oflag, mode, openRetValue);
    }

    return openRetValue;
}

/*==============================================================================
 Hook: fopen()
==============================================================================*/

// https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/fopen.3.html
FILE* fopen(const char *filename, const char *mode);

%hookf(int, fopen, const char *filename, const char *mode){
    int retValue = %orig;
    iosLogInfo("filename=%{public}s, mode=%{public}s -> retValue=%d", filename, mode, retValue);
    return retValue;
}

/*==============================================================================
 Hook: NSClassFromString
==============================================================================*/

Class NSClassFromString(NSString *aClassName);

%hookf(Class, NSClassFromString, NSString *aClassName){
    id origRet = %orig;
    iosLogInfo("aClassName=%{public}@ -> origRet=%{public}@", aClassName, origRet);
    return origRet;
}

/*==============================================================================
 ctor
==============================================================================*/

%ctor {
    iosLogInfo("%@: %s", LastUpdate, "hook_native_misc ctor");
}
