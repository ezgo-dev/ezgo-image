# ezgo Image Creator(respin Ubuntu ISO)

# 總攬

重建 Ubuntu ISO 並加入以下 ezgo 相關修改

- ...
- ...
- ...

### 建立 ezgo ISO

![Docker](https://github.com/ezgo-dev/ezgo-image/raw/master/Docker.png)

使用 docker 來簡化所需要安裝的眾多套件。

## 1. 建立 docker image 環境

Clone 本 ezgo-image project 然後執行

```
./docker-build-image.sh
```

docker image 建立完成之後，可以選擇以下方式重建新的 ezgo ISO

## 2. 重建 ISO

要重建 ISO 首先要把原始的 ISO 放在 ```origin/``` 目錄裡，並執行：
  
```
./docker-respin.sh <iso-file-name>
```
或
```
./docker-respin.sh <iso-file-name> -k <kernelversion>
```

例如:
```
./docker-respin.sh origin/bionic-desktop-amd64.iso
```
Or:
```
./docker-respin.sh origin/bionic-desktop-amd64.iso -k v4.16-rc6
```

你可以使用 -k 來指定要使用的 mainline kernel 版本。版本號碼可以從 http://kernel.ubuntu.com/~kernel-ppa/mainline 這邊找到，並將目錄名稱當成 -k 的參數。

重建 ISO 依照網路及機器好壞，會花大約 10 到 30 分鐘，並將產生出來的 ISO 存放到 ```destination/``` 目錄裡。
