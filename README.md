# iOSOpenDevHookTemplate

* Update: `20241206`

## Repo

https://github.com/crifan/iOSOpenDevHookTemplate.git

## Funcion

Use as a startup template of [Xcode](https://book.crifan.org/books/xcode_dev_debug_summary/website/)+[iOSOpenDev](https://book.crifan.org/books/ios_re_iosopendev_tweak/website/) to hook some iOS app/exectuable/dylib/...

## Usage

* Init
  * change `Xcode`->`Targets`->`Build Settings`->`User-Defined`->`iOSOpenDevDevice` to your iPhone WiFi IP
    * and make sure **ssh login without password**
      * [ssh免密登录 · iOS逆向开发：iOSOpenDev开发插件](https://book.crifan.org/books/ios_re_iosopendev_tweak/website/normal_tweak_process/ssh_no_pwd_login.html)
  * if error `An empty identity is not valid when signing a binary for the product type 'Dynamic Library'`
    * please refer: [An empty identity is not valid · iOS逆向开发：iOSOpenDev开发插件](https://book.crifan.org/books/ios_re_iosopendev_tweak/website/common_issue/empty_identity_not_valid.html)
      * to change `Code Signing Identity`'s value to **Apple Development**
* Normal Development
  * Clean
    * `Xcode`->`Product`->`Clean Build Folder`
  * Build & Install
    * `Xcode`->`Product`->`Build For`->`Profiling`
      * will auto build and install compiled `tweak`=`plugin`=`iOSOpenDevHookTemplate.deb` into connected iPhone

## Effect

* Mac
  * Xcode Build
    * ![xcode_build_for_profiling](./assets/img/xcode_build_for_profiling.png)
* iPhone8
  * Sileo installed tweak
    * ![iphone8_sileo_installed_tweak](./assets/img/iphone8_sileo_installed_tweak.jpg)
* Mac
  * Console.app can see hook log -> tweak worked
    * ![ios_hook_effect_callstack](./assets/img/ios_hook_effect_callstack.png)
