# ActsAceEtsModuleCommonAttrsDialogApi14StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| entry/src/main/src/test/AlertDialog/alertDialogHoverMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/ActiveSheet/actionSheetHoverMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/CustomDialog/customDialogHoverMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/bindSheetTest/bindSheetHoverMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/bindSheetTest/bindSheetShowClose.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/bindSheetTest/bindSheetType.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/dialog/popoverDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/PopupTest/followTransformOfTargetCustomPopup.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/PopupTest/followTransformOfTargetPopup.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/promptActionTest/showDialogHoverMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/promptActionTest/showToastHoverMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |
| entry/src/main/src/test/UIContext/FocusController/activeTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：onRun 中直接调用 Hypium.hypiumTest，Ability 未启动
- **修改后**：onRun 中通过 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability，setTimeout(4000) 后再执行 Hypium.hypiumTest

#### 各 .test.ets 文件
- **修改前**：每个文件 beforeAll 中调用 `await UtilsTest.startAbility(...)`
- **修改后**：beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
- 删除的 import：UIAbility、BusinessError、hilog、abilityDelegatorRegistry、common、UtilsTest
- 删除的变量：domain、tag、testAbilityContext
- 从 hypium import 中移除 beforeAll
- 所有 it/afterEach 中的 await 调用包裹 try...catch（done() 放在 try-catch 外确保执行）

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | 结论 |
|---|---|---|
| alertDialogHoverMode.test.ets | alertDialogHoverMode.test.ets | 所有 sleep 时长一致，无需修改 |
| actionSheetHoverMode.test.ets | actionSheetHoverMode.test.ets | 所有 sleep 时长一致，无需修改 |
| customDialogHoverMode.test.ets | customDialogHoverMode.test.ets | 所有 sleep 时长一致，无需修改 |
| bindSheetHoverMode.test.ets | bindSheetHoverMode.test.ets | 所有 sleep 时长一致，无需修改 |
| bindSheetShowClose.test.ets | bindSheetShowClose.test.ets | 所有 sleep 时长一致，无需修改 |
| bindSheetType.test.ets | bindSheetType.test.ets | 所有 sleep 时长一致，无需修改 |
| popoverDialogTest.test.ets | popoverDialogTest.test.ets | 所有 sleep 时长一致，无需修改 |
| followTransformOfTargetCustomPopup.test.ets | followTransformOfTargetCustomPopup.test.ets | 所有 sleep 时长一致，无需修改 |
| followTransformOfTargetPopup.test.ets | followTransformOfTargetPopup.test.ets | 所有 sleep 时长一致，无需修改 |
| showDialogHoverMode.test.ets | showDialogHoverMode.test.ets | 所有 sleep 时长一致，无需修改 |
| showToastHoverMode.test.ets | showToastHoverMode.test.ets | 所有 sleep 时长一致，无需修改 |
| activeTest.test.ets | activeTest.test.ets | 所有 sleep 时长一致，无需修改 |

### 差异过大（未修改）
无

### 单边 sleep 记录
无

## 三、it 用例对齐

### 匹配统计
- static 用例总数：33
- 非 static 用例总数：33
- 已匹配：33
- 仅 static 存在：0
- 仅非 static 存在：0

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| AlertDialog/alertDialogHoverMode.test.ets | alertDialogHoverMode_static_0100 | AlertDialog/alertDialogHoverMode.test.ets | alertDialogHoverMode_0100 | 去除_static后缀 |
| AlertDialog/alertDialogHoverMode.test.ets | alertDialogHoverMode_static_0200 | AlertDialog/alertDialogHoverMode.test.ets | alertDialogHoverMode_0200 | 去除_static后缀 |
| ActionSheet/actionSheetHoverMode.test.ets | actionSheetHoverMode_static_0100 | ActionSheet/actionSheetHoverMode.test.ets | actionSheetHoverMode_0100 | 去除_static后缀 |
| ActionSheet/actionSheetHoverMode.test.ets | actionSheetHoverMode_static_0200 | ActionSheet/actionSheetHoverMode.test.ets | actionSheetHoverMode_0200 | 去除_static后缀 |
| CustomDialog/customDialogHoverMode.test.ets | customDialogHoverMode_static_0100 | CustomDialog/customDialogHoverMode.test.ets | customDialogHoverMode_0100 | 去除_static后缀 |
| CustomDialog/customDialogHoverMode.test.ets | customDialogHoverMode_static_0200 | CustomDialog/customDialogHoverMode.test.ets | customDialogHoverMode_0200 | 去除_static后缀 |
| bindSheetTest/bindSheetHoverMode.test.ets | bindSheetHoverMode_static_0100 | bindSheetTest/bindSheetHoverMode.test.ets | bindSheetHoverMode_0100 | 去除_static后缀 |
| bindSheetTest/bindSheetHoverMode.test.ets | bindSheetHoverMode_static_0200 | bindSheetTest/bindSheetHoverMode.test.ets | bindSheetHoverMode_0200 | 去除_static后缀 |
| bindSheetTest/bindSheetShowClose.test.ets | bindSheetShowClose_static_0100 | bindSheetTest/bindSheetShowClose.test.ets | bindSheetShowClose_0100 | 去除_static后缀 |
| bindSheetTest/bindSheetType.test.ets | bindSheetType_static_0100 | bindSheetTest/bindSheetType.test.ets | bindSheetType_0100 | 去除_static后缀 |
| dialog/popoverDialogTest.test.ets | popoverDialogTest_static_0100 | dialog/popoverDialogTest.test.ets | popoverDialogTest_0100 | 去除_static后缀 |
| PopupTest/followTransformOfTargetCustomPopup.test.ets | followTransformOfTargetCustomPopup_static0010 | PopupTest/followTransformOfTargetCustomPopup.test.ets | followTransformOfTargetCustomPopup_0010 | 去除_static后缀 |
| PopupTest/followTransformOfTargetCustomPopup.test.ets | followTransformOfTargetCustomPopup_static0020 | PopupTest/followTransformOfTargetCustomPopup.test.ets | followTransformOfTargetCustomPopup_0020 | 去除_static后缀 |
| PopupTest/followTransformOfTargetPopup.test.ets | followTransformOfTargetPopup_static_0010 | PopupTest/followTransformOfTargetPopup.test.ets | followTransformOfTargetPopup_0010 | 去除_static后缀 |
| PopupTest/followTransformOfTargetPopup.test.ets | followTransformOfTargetPopup_static_0020 | PopupTest/followTransformOfTargetPopup.test.ets | followTransformOfTargetPopup_0020 | 去除_static后缀 |
| promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0100 | promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0100 | 完全匹配 |
| promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0200 | promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0200 | 完全匹配 |
| promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0300 | promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0300 | 完全匹配 |
| promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0400 | promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0400 | 完全匹配 |
| promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0500 | promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0500 | 完全匹配 |
| promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0600 | promptActionTest/showDialogHoverMode.test.ets | showDialogHoverMode_0600 | 完全匹配 |
| promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_static_0100 | promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_0100 | 去除_static后缀 |
| promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_static_0200 | promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_0200 | 去除_static后缀 |
| promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_static_0300 | promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_0300 | 去除_static后缀 |
| promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_static_0400 | promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_0400 | 去除_static后缀 |
| promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_static_0500 | promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_0500 | 去除_static后缀 |
| promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_static_0600 | promptActionTest/showToastHoverMode.test.ets | showToastHoverMode_0600 | 去除_static后缀 |
| UIContext/FocusController/activeTest.test.ets | activeTest_static_0010 | UIContext/FocusController/activeTest.test.ets | activeTest_0010 | 去除_static后缀 |
| UIContext/FocusController/activeTest.test.ets | activeTest_static_0020 | UIContext/FocusController/activeTest.test.ets | activeTest_0020 | 去除_static后缀 |
| UIContext/FocusController/activeTest.test.ets | activeTest_static_0030 | UIContext/FocusController/activeTest.test.ets | activeTest_0030 | 去除_static后缀 |
| UIContext/FocusController/activeTest.test.ets | activeTest_static_0040 | UIContext/FocusController/activeTest.test.ets | activeTest_0040 | 去除_static后缀 |
| UIContext/FocusController/activeTest.test.ets | activeTest_static_0050 | UIContext/FocusController/activeTest.test.ets | activeTest_0050 | 去除_static后缀 |
| UIContext/FocusController/activeTest.test.ets | activeTest_static_0060 | UIContext/FocusController/activeTest.test.ets | activeTest_0060 | 去除_static后缀 |

### 仅 static 存在的用例（非 static 中无对应）
无

### 仅非 static 存在的用例（static 中无对应）
无
