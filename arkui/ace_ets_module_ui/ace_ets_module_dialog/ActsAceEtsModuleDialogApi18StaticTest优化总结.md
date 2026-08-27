# ActsAceEtsModuleDialogApi18StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 全局仅启动一次 |
| entry/src/main/src/test/bindMenuTest/bindMenuHapticFeedbackMode.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/bindContextMenuTest/previewBorderRadius.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/buttonType/buttonTypeApi.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/bindTipsTest/bindTipsTest1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/bindTipsTest/bindTipsTest2.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/alertDialogLevelOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/closeDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/customDialogLevelOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/getDialogControllerTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/openCustomDialogLevelOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/openCustomDialogWithConOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/presentCustomDialogOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/dialog/showDialogLevelOrder.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/overlayManager/overlayManagerTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/popup/isVisible.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/promptActionTest/DialogOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |
| entry/src/main/src/test/promptActionTest/closeToastTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量 | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets

- **修改前**：
  ```typescript
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  ```

- **修改后**：
  ```typescript
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

  let cmd = 'aa start -d 0 -a EntryAbility' + ' -b ' + abilityDelegatorArguments.bundleName
  let debug = abilityDelegatorArguments.parameters['-D']
  if (debug == 'true') {
    cmd += ' -D'
  }
  let user = abilityDelegatorArguments.parameters['-u'];
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  hilog.info(domain, tag, 'cmd : %{public}s', cmd);
  abilityDelegator.executeShellCommand(cmd)
  hilog.info(domain, tag, '%{public}s', 'wait for ability ready...');
  setTimeout(() => {
    hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }, 4000)
  ```

#### 各 .test.ets 文件

每个文件的修改内容：

1. **删除 beforeAll 块**：删除包含 `await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")` 的 beforeAll 块
2. **清理 hypium import**：从 `import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size }` 中移除 `beforeAll`
3. **删除未使用的 import**：移除 `hilog`、`abilityDelegatorRegistry`、`UIAbility`、`common`、`deviceInfo`、`BusinessError`
4. **清理 Util.test import**：移除 `startAbility`、`stopApplication`，仅保留 `UtilsTest`（如仍使用），或移除整个 import（如 UtilsTest 不再使用）
5. **删除未使用的模块级变量**：移除 `let emitKey`、`let domain`、`let tag`、`let testAbilityContext`
6. **afterEach 的 await 包裹 try-catch**：将 afterEach 中的 `await CommonFunc.sleep(1000)` 包裹在 `try { ... } catch (err) { ... }` 中
7. **保持 `'use static'` 指令不变**

### 涉及 afterEach try-catch 包裹的文件（10个）

| 文件 | afterEach 修改 |
|---|---|
| closeToastTest.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| closeDialogTest.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| presentCustomDialogOrder.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| openCustomDialogWithConOrder.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| openCustomDialogLevelOrder.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| overlayManagerTest.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| customDialogLevelOrder.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| isVisible.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| showDialogLevelOrder.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |
| alertDialogLevelOrder.test.ets | `await CommonFunc.sleep(1000)` → try-catch 包裹 |

---

## 二、Sleep 时长对齐

对应非 static 测试套：`ace_ets_module_dialog_api18`（同级目录，去掉 `_static` 后缀）

### 已对齐

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| dialog/alertDialogLevelOrder.test.ets | dialog/alertDialogLevelOrder.test.ets | it 块内（4个用例 x 4处） | 500 | 1000 |
| dialog/customDialogLevelOrder.test.ets | dialog/customDialogLevelOrder.test.ets | it 块内（4个用例 x 4处） | 500 | 1000 |
| dialog/presentCustomDialogOrder.test.ets | dialog/presentCustomDialogOrder.test.ets | it 块内（4个用例 x 4处） | 500 | 1000 |

共修改 48 处 sleep 调用（3个文件 x 16处/文件）

### 差异过大（未修改）

无。所有 sleep 差异均在 1000ms 以内。

### 无需对齐的文件（sleep 时长已一致）

| static 文件 | 非 static 文件 | 说明 |
|---|---|---|
| dialog/showDialogLevelOrder.test.ets | dialog/showDialogLevelOrder.test.ets | sleep 时长完全一致 |
| dialog/openCustomDialogLevelOrder.test.ets | dialog/openCustomDialogLevelOrder.test.ets | sleep 时长完全一致 |
| dialog/openCustomDialogWithConOrder.test.ets | dialog/openCustomDialogWithConOrder.test.ets | sleep 时长完全一致 |
| dialog/closeDialogTest.test.ets | dialog/closeDialogTest.test.ets | sleep 时长完全一致 |
| dialog/getDialogControllerTest.test.ets | dialog/getDialogControllerTest.test.ets | sleep 时长完全一致 |
| overlayManager/overlayManagerTest.test.ets | overlayManager/overlayManagerTest.test.ets | sleep 时长完全一致 |
| popup/isVisible.test.ets | popup/isVisible.test.ets | sleep 时长完全一致 |
| promptActionTest/DialogOptions.test.ets | promptActionTest/DialogOptions.test.ets | sleep 时长完全一致 |
| promptActionTest/closeToastTest.test.ets | promptActionTest/closeToastTest.test.ets | 匹配用例 sleep 时长一致 |
| bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuTest/bindMenuHapticFeedbackMode.test.ets | static 用 UtilsTest.msSleep(1000)，非 static 用 Utils.sleep(1000)，时长一致 |
| bindContextMenuTest/previewBorderRadius.test.ets | bindContextMenuTest/previewBorderRadius.test.ets | 同上，时长一致 |
| bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | 同上，时长一致 |
| bindTipsTest/bindTipsTest1.test.ets | bindTipsTest/bindTipsTest1.test.ets | UtilsTest.msSleep vs Utils.sleep，时长一致 |
| bindTipsTest/bindTipsTest2.test.ets | bindTipsTest/bindTipsTest2.test.ets | 同上，时长一致 |
| buttonType/buttonTypeApi.test.ets | buttonType/buttonTypeApi.test.ets | 无 sleep 调用（使用 setTimeout） |

---

## 三、it 用例对齐

### 统计

| 类别 | 数量 |
|---|---|
| static it 用例总数 | 58 |
| 非 static it 用例总数 | 99 |
| 已匹配 | 58 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 41 |

### 匹配方式

所有 58 个 static it 用例均通过**去除 `_static` 后缀**的方式与非 static 用例精确匹配。

### 已匹配的用例

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| buttonType/buttonTypeApi.test.ets | buttonType_static_0200 | buttonType/buttonTypeApi.test.ets | buttonType_0200 | 去除 _static |
| promptActionTest/closeToastTest.test.ets | closeToastTest_static_0100 | promptActionTest/closeToastTest.test.ets | closeToastTest_0100 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0100 | promptActionTest/DialogOptions.test.ets | DialogOptions_0100 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0200 | promptActionTest/DialogOptions.test.ets | DialogOptions_0200 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0300 | promptActionTest/DialogOptions.test.ets | DialogOptions_0300 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0400 | promptActionTest/DialogOptions.test.ets | DialogOptions_0400 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0500 | promptActionTest/DialogOptions.test.ets | DialogOptions_0500 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0600 | promptActionTest/DialogOptions.test.ets | DialogOptions_0600 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0700 | promptActionTest/DialogOptions.test.ets | DialogOptions_0700 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0800 | promptActionTest/DialogOptions.test.ets | DialogOptions_0800 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_0900 | promptActionTest/DialogOptions.test.ets | DialogOptions_0900 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_1000 | promptActionTest/DialogOptions.test.ets | DialogOptions_1000 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_1100 | promptActionTest/DialogOptions.test.ets | DialogOptions_1100 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_1200 | promptActionTest/DialogOptions.test.ets | DialogOptions_1200 | 去除 _static |
| promptActionTest/DialogOptions.test.ets | DialogOptions_static_1300 | promptActionTest/DialogOptions.test.ets | DialogOptions_1300 | 去除 _static |
| overlayManager/overlayManagerTest.test.ets | overlayManagerTest_static_0100 | overlayManager/overlayManagerTest.test.ets | overlayManagerTest_0100 | 去除 _static |
| popup/isVisible.test.ets | isVisible_static_0100 | popup/isVisible.test.ets | isVisible_0100 | 去除 _static |
| bindTipsTest/bindTipsTest2.test.ets | bindTips2_static_0100 | bindTipsTest/bindTipsTest2.test.ets | bindTips2_0100 | 去除 _static |
| bindTipsTest/bindTipsTest1.test.ets | bindTips1_static_0100 | bindTipsTest/bindTipsTest1.test.ets | bindTips1_0100 | 去除 _static |
| dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_static_0100 | dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_0100 | 去除 _static |
| dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_static_0200 | dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_0200 | 去除 _static |
| dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_static_0300 | dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_0300 | 去除 _static |
| dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_static_0400 | dialog/alertDialogLevelOrder.test.ets | alertDialogLevelOrder_0400 | 去除 _static |
| dialog/closeDialogTest.test.ets | closeDialogTest_static_0100 | dialog/closeDialogTest.test.ets | closeDialogTest_0100 | 去除 _static |
| dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_static_0100 | dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_0100 | 去除 _static |
| dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_static_0200 | dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_0200 | 去除 _static |
| dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_static_0300 | dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_0300 | 去除 _static |
| dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_static_0400 | dialog/customDialogLevelOrder.test.ets | customDialogLevelOrder_0400 | 去除 _static |
| bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_static_0100 | bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_0100 | 去除 _static |
| bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_static_0200 | bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_0200 | 去除 _static |
| bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_static_0300 | bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_0300 | 去除 _static |
| bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_static_0400 | bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_0400 | 去除 _static |
| bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_static_0500 | bindMenuTest/bindMenuHapticFeedbackMode.test.ets | bindMenuHapticFeedbackModeTest_0500 | 去除 _static |
| dialog/getDialogControllerTest.test.ets | getDialogControllerTest_static_0100 | dialog/getDialogControllerTest.test.ets | getDialogControllerTest_0100 | 去除 _static |
| dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_static_0100 | dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_0100 | 去除 _static |
| dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_static_0200 | dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_0200 | 去除 _static |
| dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_static_0300 | dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_0300 | 去除 _static |
| dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_static_0400 | dialog/openCustomDialogLevelOrder.test.ets | openCustomDialogLevelOrder_0400 | 去除 _static |
| dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_static_0100 | dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_0100 | 去除 _static |
| dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_static_0200 | dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_0200 | 去除 _static |
| dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_static_0300 | dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_0300 | 去除 _static |
| dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_static_0400 | dialog/openCustomDialogWithConOrder.test.ets | openCustomDialogWithConOrder_0400 | 去除 _static |
| dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_static_0100 | dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_0100 | 去除 _static |
| dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_static_0200 | dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_0200 | 去除 _static |
| dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_static_0300 | dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_0300 | 去除 _static |
| dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_static_0400 | dialog/showDialogLevelOrder.test.ets | showDialogLevelOrder_0400 | 去除 _static |
| bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_static_0100 | bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_0100 | 去除 _static |
| bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_static_0200 | bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_0200 | 去除 _static |
| bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_static_0300 | bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_0300 | 去除 _static |
| bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_static_0400 | bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_0400 | 去除 _static |
| bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_static_0500 | bindContextMenuTest/bindContextMenuHapticFeedback.test.ets | bindContextMenuHapticFeedbackModeTest_0500 | 去除 _static |
| dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_static_0100 | dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_0100 | 去除 _static |
| dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_static_0200 | dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_0200 | 去除 _static |
| dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_static_0300 | dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_0300 | 去除 _static |
| dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_static_0400 | dialog/presentCustomDialogOrder.test.ets | presentCustomDialogOrder_0400 | 去除 _static |
| bindContextMenuTest/previewBorderRadius.test.ets | BindContextMenu_previewBorderRadius_static_001 | bindContextMenuTest/previewBorderRadius.test.ets | BindContextMenu_previewBorderRadius_001 | 去除 _static |
| bindContextMenuTest/previewBorderRadius.test.ets | BindContextMenu_previewBorderRadius_static_002 | bindContextMenuTest/previewBorderRadius.test.ets | BindContextMenu_previewBorderRadius_002 | 去除 _static |
| bindContextMenuTest/previewBorderRadius.test.ets | BindContextMenu_previewBorderRadius_static_003 | bindContextMenuTest/previewBorderRadius.test.ets | BindContextMenu_previewBorderRadius_003 | 去除 _static |

### 仅 static 存在的用例（非 static 中无对应）

无。所有 static 用例均在非 static 中找到对应项。

### 仅非 static 存在的用例（static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| UIContextTest/updateBindSheetNullTest.test.ets | updateBindSheet_SheetTargetNull_001 |
| UIContextTest/updateBindSheetNullTest.test.ets | updateBindSheet_SheetTargetUndefined_002 |
| UIContextTest/updateBindSheetNullTest.test.ets | updateBindSheet_OptionsNull_003 |
| UIContextTest/updateBindSheetNullTest.test.ets | updateBindSheet_OptionsUndefined_004 |
| UIContextTest/updateBindSheetNullTest.test.ets | updateBindSheet_CallbackNull_005 |
| UIContextTest/updateBindSheetNullTest.test.ets | updateBindSheet_CallbackUndefined_006 |
| UIContextTest/closeBindSheetNullTest.test.ets | closeBindSheet_SheetTargetNull_001 |
| UIContextTest/closeBindSheetNullTest.test.ets | closeBindSheet_SheetTargetUndefined_002 |
| UIContextTest/showActionSheetNullTest.test.ets | showActionSheet_OptionsNull_001 |
| UIContextTest/showActionSheetNullTest.test.ets | showActionSheet_OptionsUndefined_002 |
| UIContextTest/openBindSheetNullTest.test.ets | openBindSheet_ContentNodeNull_001 |
| UIContextTest/openBindSheetNullTest.test.ets | openBindSheet_ContentNodeUndefined_002 |
| UIContextTest/openBindSheetNullTest.test.ets | openBindSheet_OptionsNull_003 |
| UIContextTest/openBindSheetNullTest.test.ets | openBindSheet_OptionsUndefined_004 |
| UIContextTest/openBindSheetNullTest.test.ets | openBindSheet_CallbackNull_005 |
| UIContextTest/openBindSheetNullTest.test.ets | openBindSheet_CallbackUndefined_006 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0100 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0200 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0300 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0400 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0500 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0600 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0700 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0100 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0200 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0300 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0400 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0500 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0600 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0700 |
| overlayManager/removeComponentContentNullTest.test.ets | removeComponentContent_ComponentContentNull_001 |
| overlayManager/removeComponentContentNullTest.test.ets | removeComponentContent_ComponentContentUndefined_002 |
| overlayManager/addComponentContentWithOrderNullTest.test.ets | addComponentContentWithOrder_ComponentContentNull_001 |
| overlayManager/addComponentContentWithOrderNullTest.test.ets | addComponentContentWithOrder_ComponentContentUndefined_002 |
| overlayManager/addComponentContentWithOrderNullTest.test.ets | addComponentContentWithOrder_OrderNull_003 |
| overlayManager/addComponentContentWithOrderNullTest.test.ets | addComponentContentWithOrder_OrderUndefined_004 |
| overlayManager/hideComponentContentNullTest.test.ets | hideComponentContent_ComponentContentNull_001 |
| overlayManager/hideComponentContentNullTest.test.ets | hideComponentContent_ComponentContentUndefined_002 |
| promptActionTest/openToastTest.test.ets | openToastTest_0100 |
| promptActionTest/ToastExample.test.ets | ToastExample_0100 |
| promptActionTest/closeToastTest.test.ets | closeToastTest_0200 |

---

## 四、总结

| 优化项 | 修改文件数 | 说明 |
|---|---|---|
| 启动方式优化 | 19 | 1 个 runner + 18 个 .test.ets，Ability 启动移至 OpenHarmonyTestRunner.onRun |
| Sleep 时长对齐 | 3 | alertDialogLevelOrder、customDialogLevelOrder、presentCustomDialogOrder 共 48 处 sleep(500)→sleep(1000) |
| afterEach try-catch 包裹 | 10 | 10 个文件的 afterEach 中 await CommonFunc.sleep 包裹 try-catch |
| it 用例对齐 | - | 58 个 static 用例全部匹配，0 个仅 static，41 个仅非 static |
