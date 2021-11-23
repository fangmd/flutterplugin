# p_install

不成熟的 app 更新插件

Android 直接安装 apk

iOS 跳转应用商店

## Getting Started

## Android

1. 安装的 apk 文件不在 app 安全目录下时，需要自己获取 sdcard 读写权限

**注意：** apk 文件存储到应用内部缓存文件夹下会导致包解析错误，建议存储在外部缓存文件夹下: `/storage/emulated/0/Android/data/[app package]/cache/`

## IOS

打开 App Store


## Usage

```
PInstall.install(iosUrl: url);

PInstall.install(filePath: androidApkFilePath);
```