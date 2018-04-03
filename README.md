# ezgo Image Creator(respin Ubuntu ISO)

重建 Ubuntu ISO 並加入以下 ezgo 相關修改

- 使用 hime 輸入框架
- ...
- ...

### 建立 ezgo ISO

![Docker](https://github.com/ezgo-dev/ezgo-image/raw/master/Docker.png)

## 1. 直接重建 ISO (需安裝重建所需的 packages 在本機上)

```
./local-respin.sh <iso-file-name>
```
或
```
./local-respin.sh <iso-file-name> -k <kernelversion>
```

例如:
```
./local-respin.sh origin/bionic-desktop-amd64.iso
```
Or:
```
./local-respin.sh origin/bionic-desktop-amd64.iso -k v4.16-rc6
```

你可以使用 -k 來指定要使用的 mainline kernel 版本。版本號碼可以從 http://kernel.ubuntu.com/~kernel-ppa/mainline 這邊找到，並將目錄名稱當成 -k 的參數。

重建 ISO 依照網路及機器好壞，會花大約 60 到 100 分鐘，並將產生出來的 ISO 存放到 ```destination/``` 目錄裡。

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

重建 ISO 依照網路及機器好壞，會花大約 60 到 100 分鐘，並將產生出來的 ISO 存放到 ```destination/``` 目錄裡。

## 3. 如何新增 packages

已經在官方 repo 的 package，可以直接寫在 build.sh 裡的 installpackages+="" 變數中。

需要另外安裝 PPA 的可以在 build.sh 最下方的 isorespin.sh 之後使用 -r 參數來增加。

## 4. 其他修改

關於 ezgo 的修改 scripts 都放在 ezgo 目錄底下。ezgo ppa 及 ezgo 直接相關的修改放在 add-ezgo.sh 裡。
