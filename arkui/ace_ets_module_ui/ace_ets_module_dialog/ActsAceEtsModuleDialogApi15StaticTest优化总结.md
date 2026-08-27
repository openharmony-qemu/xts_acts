# ActsAceEtsModuleDialogApi15StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| customDialog/customDialogKeyboardAvoidDistance.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| actionSheet/actionSheetMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| actionSheet/showActionSheetMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| bindSheet/bindSheetRadius.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| buttonType/buttonTypeTest.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| dialog/showAlertDialogMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| dialog/showDialogMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| prompt/openCustomDialogMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| prompt/promptActionKeyboardAvoidDistance.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| prompt/showActionMenuMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| UIContextTest/openCustomDialogWithCtrMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| UIContextTest/overlayManager.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| UIContextTest/presentCustomDialogMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |
| UIContextTest/uiOpenCustomDialogMode.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、await 包裹 try-catch | ~4s |

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
    if (debug == 'true') { cmd += ' -D' }
    let user = abilityDelegatorArguments.parameters['-u'];
    if (user !== undefined) { cmd += ' -u ' + user; }
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
- **修改前**：
  ```typescript
  import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../hypium/index';
  import hilog from '@ohos.hilog';
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import common from '@ohos.app.ability.common';
  import { BusinessError } from '@ohos.base';
  import { UtilsTest, startAbility, stopApplication } from '../Util.test';
  let domain: number = 0x0000;
  let tag: string = 'testTag';
  let testAbilityContext:common.UIAbilityContext;

  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
  })
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../hypium/index';
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // 未使用的 import 和变量已删除
  ```

#### await 包裹 try-catch
- **修改前**：
  ```typescript
  await CommonFunc.sleep(1000);
  ```
- **修改后**：
  ```typescript
  try {
    await CommonFunc.sleep(1000);
  } catch (err) {
    console.info('xxxTest await err: ' + JSON.stringify(err));
  }
  ```

### 统计
- 修改文件数：**15**（1 个 OpenHarmonyTestRunner + 14 个 .test.ets）
- 删除 beforeAll 块：**14** 个
- 删除未使用 import：**84** 行（每文件 6 行 × 14）
- 删除未使用变量：**42** 行（每文件 3 行 × 14）
- 包裹 try-catch 的 await 数量：**867** 个
- 保留 `'use static'` 指令：是

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_api15_static | ace_ets_module_dialog_api15 | 是 |

### 已对齐
无需修改。所有 14 个文件的 it() 块内 sleep 时长与非 static 完全一致。

| static 文件 | 非 static 文件 | it 块 sleep 数量 | 对齐结果 |
|---|---|---|---|
| customDialog/customDialogKeyboardAvoidDistance.test.ets | customDialog/customDialogKeyboardAvoidDistance.test.ets | 8 | 全部匹配 |
| actionSheet/actionSheetMode.test.ets | actionSheet/actionSheetMode.test.ets | 46 | 全部匹配 |
| actionSheet/showActionSheetMode.test.ets | actionSheet/showActionSheetMode.test.ets | 46 | 全部匹配 |
| bindSheet/bindSheetRadius.test.ets | bindSheet/bindSheetRadius.test.ets | 28 | 全部匹配 |
| buttonType/buttonTypeTest.test.ets | buttonType/buttonTypeTest.test.ets | 1 | 全部匹配 |
| dialog/showAlertDialogMode.test.ets | dialog/showAlertDialogMode.test.ets | 46 | 全部匹配 |
| dialog/showDialogMode.test.ets | dialog/showDialogMode.test.ets | 46 | 全部匹配 |
| prompt/openCustomDialogMode.test.ets | prompt/openCustomDialogMode.test.ets | 46 | 全部匹配 |
| prompt/promptActionKeyboardAvoidDistance.test.ets | prompt/promptActionKeyboardAvoidDistance.test.ets | 12 | 全部匹配 |
| prompt/showActionMenuMode.test.ets | prompt/showActionMenuMode.test.ets | 36 | 全部匹配 |
| UIContextTest/openCustomDialogWithCtrMode.test.ets | UIContextTest/openCustomDialogWithCtrMode.test.ets | 60 | 全部匹配 |
| UIContextTest/overlayManager.test.ets | UIContextTest/overlayManager.test.ets | 7 | 全部匹配 |
| UIContextTest/presentCustomDialogMode.test.ets | UIContextTest/presentCustomDialogMode.test.ets | 60 | 全部匹配 |
| UIContextTest/uiOpenCustomDialogMode.test.ets | UIContextTest/uiOpenCustomDialogMode.test.ets | 60 | 全部匹配 |

### 差异过大（未修改）
无。

### 结构性差异说明
static 测试套的 beforeEach 中存在额外的 `await CommonFunc.sleep(1000)`（在 `Driver.create()` 之后），非 static 测试套的 beforeEach 中不存在此 sleep。此差异属于 beforeEach 结构差异，非 it() 块 sleep 时长差异，不影响测试用例对齐。

## 三、it 用例对齐

### 统计
- static it 用例数：**85**
- 非 static it 用例数：**85**
- 已匹配：**85**（100%）
- 仅 static 存在：**0**
- 仅非 static 存在：**0**

### 匹配方式分布
| 匹配方式 | 数量 |
|---|---|
| 去除 `_static` 后精确匹配 | 69 |
| 模糊匹配（Levenshtein ≤ 3，仅大小写差异） | 16 |

### 模糊匹配详情（大小写差异）

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 差异 |
|---|---|---|---|---|
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0100 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0100 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0200 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0200 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0300 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0300 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0400 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0400 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0500 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0500 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0600 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0600 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0700 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0700 | `a` vs `A` |
| actionSheet/showActionSheetMode.test.ets | showactionSheetMode_static_0800 | actionSheet/showActionSheetMode.test.ets | showActionSheetMode_0800 | `a` vs `A` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0100 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0100 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0200 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0200 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0300 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0300 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0400 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0400 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0500 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0500 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0600 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0600 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0700 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0700 | `o` vs `O` |
| UIContextTest/uiOpenCustomDialogMode.test.ets | uiopenCustomDialogMode_static_0800 | UIContextTest/uiOpenCustomDialogMode.test.ets | uiOpenCustomDialogMode_0800 | `o` vs `O` |

### 仅 static 存在的用例（非 static 中无对应）
无。

### 仅非 static 存在的用例（static 中无对应）
无。
