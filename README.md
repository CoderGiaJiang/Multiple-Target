# Project Creat Multiple Target


**解决 “维护大量逻辑相似但是又有细微不同的应用” 的需求**

### 现状	
多个相似 App 的开发，很多地方只是修改了 UI，代码逻辑没变。在后续版本迭代的时候需要同步所有项目的代码，重复步骤，浪费很多时间。

###  解决方法
采用多Target编译方案

#### [Apple 对 Target 的定义](https://developer.apple.com/library/content/featuredarticles/XcodeConcepts/Concept-Targets.html)
```
A target specifies a product to build and contains the instructions for building the product from a set of files in a project or workspace. A target defines a single product; it organizes the inputs into the build system—the source files and instructions for processing those source files—required to build that product. Projects can contain one or more targets, each of which produces one product.
```
**大致意思**：**Target** 代表一个产品，一个项目可以有一个或者多个 **Target**。

#### 创建 Target 步骤 
1. 创建一个应用（**TargetDemo**）选中项目 **Target** 右键 **Duplicate**。执行完后就拷贝了这个 **Target**（自动命名为 **TargetDemo copy**）, 和原有 **Target** 共享之前的所有代码。默认生成一个拷贝的 **info.plist**（自动命名为 **TargetDemo copy-info.plist**）

![enter image description here](https://raw.githubusercontent.com/CoderGiaJiang/Multiple-Target/master/TargetDemo/Resource/1.png)

2. 修改 **Target** 名称
	- 点击 **Xcode** 左上角 **Run**、**Stop** 右边的工程名称，下拉框中选择 **Manage Schemes**，在弹出框中，点击 **TargetDemo copy** 那行， 点击一次，再点击一次，并修改名字。
	- 选中项目，在 **Target** 列表上面点击 **TargetDemo copy**， 点击一次，再点击一次，并修改名字
	- 修改 **info.plist** 的命名。
3. 将 **info.plist** 添加到 **Target** 中
	在项目中新建 **Group** 并创建文件夹，删除 **TargetDemo copy-info.plist** 索引，然后拷贝文件到指定目录中，然后更名为 **TargetDemoCopy-info.plist**，再添加到 **Target** 中。
![Alt text](https://raw.githubusercontent.com/CoderGiaJiang/Multiple-Target/master/TargetDemo/Resource/2.png)		

   选中 **Target**，在 **General** 中添加 **plist** 文件。
![Alt text](https://raw.githubusercontent.com/CoderGiaJiang/Multiple-Target/master/TargetDemo/Resource/3.png)
4. 修改证书、Bundle id、Display name 等项目配置。
6. 预编译宏（**SDK Key**、**BaseURL**、主题颜色等小型改动）
	**Target** -> **Build Setting** 搜索 **Preprocessor Macros** 设置 **Debug** 和 **Release** 里的预编译宏内容 
7. 多个 Target 中不同文件的处理（图标、较大 UI 界面改动）
	**Target** -> **Build Phases** 各个 **Target** 编译所包含的内容
	- **Compile Sources** 需要编译的代码文件
	- **Link Binary With Libraries** 编译所依赖的库
	- **Copy Bundle Resources** 编译需要的资源
	
每个 **Target** 可以根据具体需要增减里面的内容，选择对应的文件。适用于一些图标的改变，好处是代码逻辑可以不用动，名称都统一，只是添加了不同的文件。
  8. 最后，选择不同的 **Target** 运行程序就可以看到不同的效果。
	
> 新加入了文件或者资源，一定要选择对应的 **Target**，不要选错！！！

