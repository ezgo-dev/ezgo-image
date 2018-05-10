# ezgo Image Creator(respin Ubuntu ISO)

重建 Ubuntu ISO 並加入以下 ezgo 相關修改

- ...
- ...

### 建立 ezgo ISO

建立 ezgo ISO 有兩種方法
1. 第一種是直接[在本地機器上重建 ISO](#1-在本機上重建-iso)。會需要安裝所需要使用到的 package 到本地機器上，並且當需要 root 權限時，會停下來等待輸入。
1. 第二種方法是[使用 docker 建立 ISO](#2-使用-docker-建立-iso)。將在 docker 中產生所需要的環境，並在 docker 中重建 ISO，過程中不會停下來詢問密碼。

## 1. 在本機上重建 ISO

```
./local-respin.sh <iso-file-name>
```
或
```
./local-respin.sh <iso-file-name> -k <kernelversion>
```

例如:
```
./local-respin.sh origin/kubuntu-18.04-desktop-amd64.iso
```
Or:
```
./local-respin.sh origin/kubuntu-18.04-desktop-amd64.iso -k v4.16-rc6
```

你可以使用 -k 來指定要使用的 mainline kernel 版本。版本號碼可以從 http://kernel.ubuntu.com/~kernel-ppa/mainline 這邊找到，並將目錄名稱當成 -k 的參數。

重建 ISO 依照網路及機器好壞，會花大約 60 到 100 分鐘，並將產生出來的 ISO 存放到 ```destination/``` 目錄裡。

## 2. 使用 docker 建立 ISO
![Docker](https://github.com/ezgo-dev/ezgo-image/raw/master/Docker.png)

### 2.1 建立 docker 環境

Clone 本 ezgo-image project 然後執行

```
./docker-build-image.sh
```

docker image 建立完成之後，就可以使用 docker 來產生新 ISO。若是有修改過任何檔案，本步驟需要重新執行。

### 2.1. 重建 ISO

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
./docker-respin.sh origin/kubuntu-18.04-desktop-amd64.iso
```
Or:
```
./docker-respin.sh origin/kubuntu-18.04-desktop-amd64.iso -k v4.17-rc4
```

你可以使用 -k 來指定要使用的 mainline kernel 版本。版本號碼可以從 http://kernel.ubuntu.com/~kernel-ppa/mainline 這邊找到，並將目錄名稱當成 -k 的參數。

重建 ISO 依照網路及機器好壞，會花大約 60 到 100 分鐘，並將產生出來的 ISO 存放到 ```destination/``` 目錄裡。

## 3. 如何新增 packages

已經在官方 repo 的 package，可以直接寫在 build.sh 裡的 installpackages+="" 變數中。

需要另外安裝 PPA 的可以在 build.sh 最下方的 isorespin.sh 之後使用 -r 參數來增加。

## 4. 其他修改

關於 ezgo 的修改 scripts 都放在 ezgo 目錄底下。ezgo ppa 及 ezgo 直接相關的修改放在 add-ezgo.sh 裡。
