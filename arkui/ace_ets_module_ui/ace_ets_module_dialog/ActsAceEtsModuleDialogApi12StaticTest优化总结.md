# ActsAceEtsModuleDialogApi12StaticTest Static 优化总结报告

## 一、启动方式优化

### 总览

将 Ability 启动从各 `.test.ets` 的 `beforeAll` 租房到 `OpenHarmonyTestRunner.onRun` 中，整个测试套只启动一次。共修改 **50 个文件**（1 个 Runner + 49 个 .test.ets）。

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间 |
|---|---|---|
| `entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets` | `onRun` 中添加 `executeShellCommand` 启动 Ability + `setTimeout(4000)` 延迟执行测试 | 重复启动消除 |
| `entry/src/main/src/test/OnHeightDidChangeTest.test.ets` | 删除 `beforeAll` 中的 `startAbility` 调用及守卫，清理未使用 import/变量 | ~4s |
| `entry/src/main/src/test/ActionSheetTest/ActionSheet1.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/ActionSheetTest/ActionSheet2.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/ActionSheetTest/ActionSheet3.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/AlertDialogTest/AlertDialog1.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/AlertDialogTest/AlertDialog2.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/AlertDialogTest/AlertDialog3.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/bindSheet/sheetBorderWidth.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/button/buttonMaxFontSize.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/CustomDialog1.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/CustomDialog2.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/CustomDialog3.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/CustomDialogBorderColor.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/CustomDialogRouter.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/dialogTransitionTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/KeyboardAvoidMode/PromptActionTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/UIContextTest/CloseCustomDialog.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/UIContextTest/OpenCustomDialog.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Dialog/dialogApi.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Dialog/dialogButtonStyle.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Dialog/InterstitialDialogAction.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Menu/MenuApi1.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Menu/menuItemDivider.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Menu/menuItemGroupDivider.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Menu/menuTransition.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/Menu/subMenuExpandingMode.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/MenuTest/MenuApiTest/IconApiTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test.ets` | 同上（含嵌套在 beforeEach 中的 beforeAll） | ~8s |
| `entry/src/main/src/test/MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/MenuTest/MenuApiTest/subMenuExpandingModeTest_STACK_EXPAND.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/openCustomDialogTest/openCustomDialog1.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/openCustomDialogTest/openCustomDialog2.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/openCustomDialogTest/openCustomDialog3.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/popup/arrowOffset.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/promptActionTest/closeCustomDialog.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/promptActionTest/openCustomDialog.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/promptActionTest/showDialogTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/promptActionTest/showDialogTest_01.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/promptActionTest/showToast.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/promptActionTest/updateCustomDialog.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/UIContextTest/closeBindSheetTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/UIContextTest/openBindSheetTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/UIContextTest/uiCloseCustomDialogTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/UIContextTest/uiOpenCustomDialogTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/UIContextTest/uiUpdateCustomDialogTest.test.ets` | 同上 | ~4s |
| `entry/src/main/src/test/UIContextTest/updateBindSheetTest.test.ets` | 同上 | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets

- **修改前**：
  ```typescript
  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
  ```
- **修改后**：
  ```typescript
  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
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
  }
  ```

#### 各 .test.ets 文件

- **修改前**（以 ActionSheet1.test.ets 为例）：
  ```typescript
  import { describe, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
  import hilog from '@ohos.hilog'
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import common from '@ohos.app.ability.common';
  import { BusinessError } from '@ohos.base';
  import { UtilsTest } from '../Util.test';
  let domain: number = 0x0000;
  let tag: string = 'testTag';
  let testAbilityContext:common.UIAbilityContext;

  describe('ActionSheet1', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ActionSheet1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    });
    beforeEach(...)
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, it, expect, Level } from '../../../../hypium/index';
  import common from '@ohos.app.ability.common';
  // beforeAll 整块删除；hilog/UIAbility/BusinessError/abilityDelegatorRegistry/UtilsTest/domain/tag/testAbilityContext 已清理

  describe('ActionSheet1', () => {
    beforeEach(...)
  ```

**每个 .test.ets 的处理步骤**：
1. 删除包含 `startAbility` 的 `beforeAll` 整块（含嵌套在 `beforeEach` 中的 `beforeAll`，如 SubMenuExpandingModeTest_EMBEDDED.test.ets）
2. 从 hypium import 中移除 `beforeAll`
3. 删除不再使用的 import：`UtilsTest`（仅在 beforeAll 使用时删除）、`UIAbility`、`BusinessError`、`abilityDelegatorRegistry`、`hilog`（无 `hilog.` 调用时删除）、`common`（无 `common.` 调用时删除）
4. 删除不再使用的模块级变量：`domain`、`tag`、`testAbilityContext`
5. 保留 `'use static'` 指令、`window` import、`CommonFunc` import、`inspector` import 等仍在使用的引用
6. `beforeEach` 中已有的 `try...catch` 包裹保持不变

> **注**：部分文件的 `beforeAll` 嵌套在 `beforeEach` 内部（如 `SubMenuExpandingModeTest_EMBEDDED.test.ets`），通过花括号匹配精确删除内层 `beforeAll` 块，保留外层 `beforeEach` 主体。

---

## 二、Sleep 时长对齐

### 对应非 static 测试套

| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_api12_static | ace_ets_module_dialog_api12 | 是（同级目录） |

### 已对齐

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| 无 | - | - | - | - |

**对齐数：0**

### 差异分析说明

对 static 与非 static 测试套中所有匹配的 `.test.ets` 文件逐文件对比 `sleep(ms)` / `msSleep(ms)` 调用。初始基于位置（position-by-position）的对比发现 6 个文件存在差异，但经逐文件人工核验（读取完整源码、按逻辑上下文重新对齐），确认**所有差异均为误报**，根因如下：

**static 文件的 `beforeEach` 中存在一处非 static 没有的额外 `sleep(1000)` 调用**（位于 `Driver.create()` 之后），导致后续所有 sleep 位置偏移 1，基于索引的对比产生假阳性。

经上下文对齐后核验，static 与非 static 的**所有对应 sleep 时长完全一致**，无需对齐。

涉及额外 beforeEach sleep 的文件（static 独有，非时长差异，不修改）：

| static 文件 | 额外 sleep 位置 | 说明 |
|---|---|---|
| CustomDialogTest/dialogTransitionTest.test.ets | beforeEach `Driver.create()` 后 `sleep(1000)` | static 独有，afterEach/it 内 sleep 时长与非 static 一致 |
| CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test.ets | beforeEach `Driver.create()` 后 `sleep(1000)` | 同上 |
| CustomDialogTest/CustomDialogBorderColor.test.ets | beforeEach `Driver.create()` 后 `sleep(1000)` | 同上 |
| CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets | beforeEach `Driver.create()` 后 `sleep(1000)` | 同上 |
| Dialog/dialogButtonStyle.test.ets | beforeEach `Driver.create()` 后 `sleep(1000)` | 同上 |
| Menu/MenuApi1.test.ets | beforeEach `Driver.create()` 后 `sleep(1000)` | 同上 |

### 差异过大（未修改）

| static 文件 | 非 static 文件 | 说明 |
|---|---|---|
| 无真实时长差异 | - | 初始对比的 1000↔3000、1000↔2000 差异均为位置偏移误报 |

### 无对应非 static 文件

| static 文件 | 说明 |
|---|---|
| promptActionTest/showDialogTest_01.test.ets | static 将 showDialogTest 拆分为两个文件（showDialogTest + showDialogTest_01），非 static 仅有一个 showDialogTest.test.ets；其 it 用例名（_0800~_1400）已在第三步与非 static 的 showDialogTest.test.ets 中的对应用例匹配 |

---

## 三、it 用例对齐

### 匹配统计

| 指标 | 数量 |
|---|---|
| static it 用例总数 | 88 |
| 非 static it 用例总数 | 88 |
| 已匹配 | 88 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 0 |

### 匹配方式分布

| 匹配方式 | 数量 |
|---|---|
| remove _static（去除 `_static_` 后缀后完全匹配） | 88 |
| exact（完全匹配） | 0 |
| fuzzy（Levenshtein <= 3） | 0 |

### 已匹配的用例

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| OnHeightDidChangeTest.test.ets | onHeightDidChange_static_0100 | onHeightDidChange.test.ets | onHeightDidChange_0100 | remove _static |
| ActionSheetTest/ActionSheet1.test.ets | ActionSheet1_static_0100 | ActionSheetTest/ActionSheet1.test.ets | ActionSheet1_0100 | remove _static |
| ActionSheetTest/ActionSheet1.test.ets | ActionSheet1_static_0200 | ActionSheetTest/ActionSheet1.test.ets | ActionSheet1_0200 | remove _static |
| ActionSheetTest/ActionSheet2.test.ets | ActionSheet2_static_0100 | ActionSheetTest/ActionSheet2.test.ets | ActionSheet2_0100 | remove _static |
| ActionSheetTest/ActionSheet2.test.ets | ActionSheet2_static_0200 | ActionSheetTest/ActionSheet2.test.ets | ActionSheet2_0200 | remove _static |
| ActionSheetTest/ActionSheet3.test.ets | ActionSheet3_static_0100 | ActionSheetTest/ActionSheet3.test.ets | ActionSheet3_0100 | remove _static |
| ActionSheetTest/ActionSheet3.test.ets | ActionSheet3_static_0200 | ActionSheetTest/ActionSheet3.test.ets | ActionSheet3_0200 | remove _static |
| AlertDialogTest/AlertDialog1.test.ets | AlertDialog1_static_0100 | AlertDialogTest/AlertDialog1.test.ets | AlertDialog1_0100 | remove _static |
| AlertDialogTest/AlertDialog1.test.ets | AlertDialog1_static_0200 | AlertDialogTest/AlertDialog1.test.ets | AlertDialog1_0200 | remove _static |
| AlertDialogTest/AlertDialog2.test.ets | AlertDialog2_static_0100 | AlertDialogTest/AlertDialog2.test.ets | AlertDialog2_0100 | remove _static |
| AlertDialogTest/AlertDialog3.test.ets | AlertDialog3_static_0100 | AlertDialogTest/AlertDialog3.test.ets | AlertDialog3_0100 | remove _static |
| AlertDialogTest/AlertDialog3.test.ets | AlertDialog3_static_0200 | AlertDialogTest/AlertDialog3.test.ets | AlertDialog3_0200 | remove _static |
| bindSheet/sheetBorderWidth.test.ets | sheetBorderWidth_static_0100 | bindSheet/sheetBorderWidth.test.ets | sheetBorderWidth_0100 | remove _static |
| bindSheet/sheetBorderWidth.test.ets | sheetBorderWidth_static_0200 | bindSheet/sheetBorderWidth.test.ets | sheetBorderWidth_0200 | remove _static |
| bindSheet/sheetBorderWidth.test.ets | sheetBorderWidth_static_0300 | bindSheet/sheetBorderWidth.test.ets | sheetBorderWidth_0300 | remove _static |
| button/buttonMaxFontSize.test.ets | buttonMaxFontSize_static_0100 | button/buttonMaxFontSize.test.ets | buttonMaxFontSize_0100 | remove _static |
| button/buttonMaxFontSize.test.ets | buttonMaxFontSize_static_0200 | button/buttonMaxFontSize.test.ets | buttonMaxFontSize_0200 | remove _static |
| button/buttonMaxFontSize.test.ets | buttonMaxFontSize_static_0300 | button/buttonMaxFontSize.test.ets | buttonMaxFontSize_0300 | remove _static |
| CustomDialogTest/CustomDialog1.test.ets | CustomDialog1_static_0100 | CustomDialogTest/CustomDialog1.test.ets | CustomDialog1_0100 | remove _static |
| CustomDialogTest/CustomDialog1.test.ets | CustomDialog1_static_0200 | CustomDialogTest/CustomDialog1.test.ets | CustomDialog1_0200 | remove _static |
| CustomDialogTest/CustomDialog2.test.ets | CustomDialog2_static_0100 | CustomDialogTest/CustomDialog2.test.ets | CustomDialog2_0100 | remove _static |
| CustomDialogTest/CustomDialog3.test.ets | CustomDialog3_static_0100 | CustomDialogTest/CustomDialog3.test.ets | CustomDialog3_0100 | remove _static |
| CustomDialogTest/CustomDialog3.test.ets | CustomDialog3_static_0200 | CustomDialogTest/CustomDialog3.test.ets | CustomDialog3_0200 | remove _static |
| CustomDialogTest/CustomDialogBorderColor.test.ets | CustomDialogBorderColor_static_0100 | CustomDialogTest/CustomDialogBorderColor.test.ets | CustomDialogBorderColor_0100 | remove _static |
| CustomDialogTest/CustomDialogBorderColor.test.ets | CustomDialogBorderColor_static_0200 | CustomDialogTest/CustomDialogBorderColor.test.ets | CustomDialogBorderColor_0200 | remove _static |
| CustomDialogTest/CustomDialogRouter.test.ets | CustomDialogRouter_static_0100 | CustomDialogTest/CustomDialogRouter.test.ets | CustomDialogRouter_0100 | remove _static |
| CustomDialogTest/dialogTransitionTest.test.ets | dialogTransitionTest_static_0100 | CustomDialogTest/dialogTransitionTest.test.ets | dialogTransitionTest_0100 | remove _static |
| CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test.ets | BaseDialogTest_static_0100 | CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test.ets | BaseDialogTest_0100 | remove _static |
| CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test.ets | BaseDialogTest_static_0200 | CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test.ets | BaseDialogTest_0200 | remove _static |
| CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test.ets | CustomDialogTest_static_0100 | CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test.ets | CustomDialogTest_0100 | remove _static |
| CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test.ets | CustomDialogTest_static_0200 | CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test.ets | CustomDialogTest_0200 | remove _static |
| CustomDialogTest/KeyboardAvoidMode/PromptActionTest.test.ets | PromptActionTest_static_0100 | CustomDialogTest/KeyboardAvoidMode/PromptActionTest.test.ets | PromptActionTest_0100 | remove _static |
| CustomDialogTest/KeyboardAvoidMode/PromptActionTest.test.ets | PromptActionTest_static_0200 | CustomDialogTest/KeyboardAvoidMode/PromptActionTest.test.ets | PromptActionTest_0200 | remove _static |
| CustomDialogTest/UIContextTest/CloseCustomDialog.test.ets | CloseCustomDialogTest_static_001 | CustomDialogTest/UIContextTest/CloseCustomDialog.test.ets | CloseCustomDialogTest_001 | remove _static |
| CustomDialogTest/UIContextTest/OpenCustomDialog.test.ets | openCustomDialogTest_static_001 | CustomDialogTest/UIContextTest/OpenCustomDialog.test.ets | openCustomDialogTest_001 | remove _static |
| CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets | UpdateCustomDialogTest_static_001 | CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets | UpdateCustomDialogTest_001 | remove _static |
| Dialog/dialogApi.test.ets | dialogApi_static_0100 | Dialog/dialogApi.test.ets | dialogApi_0100 | remove _static |
| Dialog/dialogButtonStyle.test.ets | dialogButtonStyle_static_0100 | Dialog/dialogButtonStyle.test.ets | dialogButtonStyle_0100 | remove _static |
| Dialog/InterstitialDialogAction.test.ets | interstitialDialogActionTest_static_0010 | Dialog/InterstitialDialogAction.test.ets | interstitialDialogActionTest_0010 | remove _static |
| Dialog/InterstitialDialogAction.test.ets | interstitialDialogActionTest_static_0020 | Dialog/InterstitialDialogAction.test.ets | interstitialDialogActionTest_0020 | remove _static |
| Menu/MenuApi1.test.ets | MenuApi1_static_0100 | Menu/MenuApi1.test.ets | MenuApi1_0100 | remove _static |
| Menu/menuItemDivider.test.ets | menuItemDivider_static_0100 | Menu/menuItemDivider.test.ets | menuItemDivider_0100 | remove _static |
| Menu/menuItemDivider.test.ets | menuItemDivider_static_0200 | Menu/menuItemDivider.test.ets | menuItemDivider_0200 | remove _static |
| Menu/menuItemDivider.test.ets | menuItemDivider_static_0300 | Menu/menuItemDivider.test.ets | menuItemDivider_0300 | remove _static |
| Menu/menuItemDivider.test.ets | menuItemDivider_static_0400 | Menu/menuItemDivider.test.ets | menuItemDivider_0400 | remove _static |
| Menu/menuItemGroupDivider.test.ets | menuItemGroupDivider_static_001 | Menu/menuItemGroupDivider.test.ets | menuItemGroupDivider_001 | remove _static |
| Menu/menuItemGroupDivider.test.ets | menuItemGroupDivider_static_002 | Menu/menuItemGroupDivider.test.ets | menuItemGroupDivider_002 | remove _static |
| Menu/menuTransition.test.ets | menuTransition_static_0100 | Menu/menuTransition.test.ets | menuTransition_0100 | remove _static |
| Menu/subMenuExpandingMode.test.ets | subMenuExpandingMode_static_0100 | Menu/subMenuExpandingMode.test.ets | subMenuExpandingMode_0100 | remove _static |
| MenuTest/MenuApiTest/IconApiTest.test.ets | IconApiTest_static_001 | MenuTest/MenuApiTest/IconApiTest.test.ets | IconApiTest_001 | remove _static |
| MenuTest/MenuApiTest/IconApiTest.test.ets | IconApiTest_static_002 | MenuTest/MenuApiTest/IconApiTest.test.ets | IconApiTest_002 | remove _static |
| MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test.ets | SubMenuExpandingModeTest_EMBEDDED_static_001 | MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test.ets | SubMenuExpandingModeTest_EMBEDDED_001 | remove _static |
| MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test.ets | SubMenuExpandingModeTest_SIDE_static_001 | MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test.ets | SubMenuExpandingModeTest_SIDE_001 | remove _static |
| MenuTest/MenuApiTest/subMenuExpandingModeTest_STACK_EXPAND.test.ets | subMenuExpandingModeTest_static_0100 | MenuTest/MenuApiTest/subMenuExpandingModeTest_STACK_EXPAND.test.ets | subMenuExpandingModeTest_0100 | remove _static |
| openCustomDialogTest/openCustomDialog1.test.ets | openCustomDialog1_static_0100 | openCustomDialogTest/openCustomDialog1.test.ets | openCustomDialog1_0100 | remove _static |
| openCustomDialogTest/openCustomDialog1.test.ets | openCustomDialog1_static_0200 | openCustomDialogTest/openCustomDialog1.test.ets | openCustomDialog1_0200 | remove _static |
| openCustomDialogTest/openCustomDialog2.test.ets | openCustomDialog2_static_0100 | openCustomDialogTest/openCustomDialog2.test.ets | openCustomDialog2_0100 | remove _static |
| openCustomDialogTest/openCustomDialog3.test.ets | openCustomDialog3_static_0100 | openCustomDialogTest/openCustomDialog3.test.ets | openCustomDialog3_0100 | remove _static |
| openCustomDialogTest/openCustomDialog3.test.ets | openCustomDialog3_static_0200 | openCustomDialogTest/openCustomDialog3.test.ets | openCustomDialog3_0200 | remove _static |
| popup/arrowOffset.test.ets | arrowOffset_static_0100 | popup/arrowOffset.test.ets | arrowOffset_0100 | remove _static |
| popup/arrowOffset.test.ets | arrowOffset_static_0200 | popup/arrowOffset.test.ets | arrowOffset_0200 | remove _static |
| promptActionTest/closeCustomDialog.test.ets | closeCustomDialog_static_0100 | promptActionTest/closeCustomDialog.test.ets | closeCustomDialog_0100 | remove _static |
| promptActionTest/openCustomDialog.test.ets | openCustomDialog_static_0100 | promptActionTest/openCustomDialog.test.ets | openCustomDialog_0100 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0100 | promptActionTest/showDialogTest.test.ets | showDialogTest_0100 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0200 | promptActionTest/showDialogTest.test.ets | showDialogTest_0200 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0300 | promptActionTest/showDialogTest.test.ets | showDialogTest_0300 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0400 | promptActionTest/showDialogTest.test.ets | showDialogTest_0400 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0500 | promptActionTest/showDialogTest.test.ets | showDialogTest_0500 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0600 | promptActionTest/showDialogTest.test.ets | showDialogTest_0600 | remove _static |
| promptActionTest/showDialogTest.test.ets | showDialogTest_static_0700 | promptActionTest/showDialogTest.test.ets | showDialogTest_0700 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_0800 | promptActionTest/showDialogTest.test.ets | showDialogTest_0800 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_0900 | promptActionTest/showDialogTest.test.ets | showDialogTest_0900 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_1000 | promptActionTest/showDialogTest.test.ets | showDialogTest_1000 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_1100 | promptActionTest/showDialogTest.test.ets | showDialogTest_1100 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_1200 | promptActionTest/showDialogTest.test.ets | showDialogTest_1200 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_1300 | promptActionTest/showDialogTest.test.ets | showDialogTest_1300 | remove _static |
| promptActionTest/showDialogTest_01.test.ets | showDialogTest_static_1400 | promptActionTest/showDialogTest.test.ets | showDialogTest_1400 | remove _static |
| promptActionTest/showToast.test.ets | showToast_static_0100 | promptActionTest/showToast.test.ets | showToast_0100 | remove _static |
| promptActionTest/showToast.test.ets | showToast_static_0200 | promptActionTest/showToast.test.ets | showToast_0200 | remove _static |
| promptActionTest/showToast.test.ets | showToast_static_0300 | promptActionTest/showToast.test.ets | showToast_0300 | remove _static |
| promptActionTest/showToast.test.ets | showToast_static_0400 | promptActionTest/showToast.test.ets | showToast_0400 | remove _static |
| promptActionTest/updateCustomDialog.test.ets | updateCustomDialog_static_0100 | promptActionTest/updateCustomDialog.test.ets | updateCustomDialog_0100 | remove _static |
| UIContextTest/closeBindSheetTest.test.ets | closeBindSheetTest_static_0100 | UIContextTest/closeBindSheetTest.test.ets | closeBindSheetTest_0100 | remove _static |
| UIContextTest/openBindSheetTest.test.ets | openBindSheetTest_static_0100 | UIContextTest/openBindSheetTest.test.ets | openBindSheetTest_0100 | remove _static |
| UIContextTest/uiCloseCustomDialogTest.test.ets | uiCloseCustomDialogTest_static_0100 | UIContextTest/uiCloseCustomDialogTest.test.ets | uiCloseCustomDialogTest_0100 | remove _static |
| UIContextTest/uiOpenCustomDialogTest.test.ets | uiOpenCustomDialogTest_static_0100 | UIContextTest/uiOpenCustomDialogTest.test.ets | uiOpenCustomDialogTest_0100 | remove _static |
| UIContextTest/uiUpdateCustomDialogTest.test.ets | uiUpdateCustomDialogTest_static_0100 | UIContextTest/uiUpdateCustomDialogTest.test.ets | uiUpdateCustomDialogTest_0100 | remove _static |
| UIContextTest/updateBindSheetTest.test.ets | updateBindSheetTest_static_0100 | UIContextTest/updateBindSheetTest.test.ets | updateBindSheetTest_0100 | remove _static |

### 仅 static 存在的用例（非 static 中无对应）

无。

### 仅非 static 存在的用例（static 中无对应）

无。

---

## 总结

| 优化项 | 结果 |
|---|---|
| 启动方式优化 | 修改 50 个文件（1 个 OpenHarmonyTestRunner + 49 个 .test.ets），Ability 启动统一至 Runner，消除每个文件 beforeAll 中的重复启动 |
| Sleep 时长对齐 | 0 处需对齐；static 与非 static 的所有对应 sleep 时长已一致（6 个文件有 static 独有的 beforeEach 额外 sleep，属数量差异非时长差异） |
| it 用例对齐 | 88/88 全部匹配（去除 `_static_` 后缀），0 个仅 static、0 个仅非 static |
