# ActsAceEtsModuleDialogNoWearApi19StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/actionSheetTest/actionSheetBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/actionSheetTest/actionSheetBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/calendarPickerDialogTest/calendarPickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/calendarPickerDialogTest/calendarPickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/datePickerDialogTest/datePickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/datePickerDialogTest/datePickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/textPickerDialogTest/textPickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/textPickerDialogTest/textPickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/timePickerDialogTest/timePickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/timePickerDialogTest/timePickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showActionSheetBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showActionSheetBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showDatePickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showDatePickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showTextPickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showTextPickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showTimePickerDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/UIContextTest/showTimePickerDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  ```
- **修改后**：
  ```typescript
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
- **修改前**：
  ```typescript
  let isAbilityStarted: boolean = false;
  ...
  beforeAll(async (): Promise<void> => {
    console.info("xxxTest beforeEach start");
    await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api19.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```

#### 清理的未使用 import（每个文件）
- `import hilog from '@ohos.hilog'`
- `import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'`
- `import UIAbility from '@ohos.app.ability.UIAbility'`
- `import common from '@ohos.app.ability.common'`
- `import { BusinessError } from '@ohos.base'`
- `import { UtilsTest } from '../Util.test'`
- `import CommonFunc from '../../../ets/MainAbility/common/Common'`

#### 清理的未使用模块级变量（部分文件）
- `let domain: int = 0x0000;`
- `let tag: string = 'testTag';`

#### hypium import 修正
- **修改前**：`import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';`
- **修改后**：`import { describe, beforeEach, it, expect, Level, Size, TestType } from '../../../../hypium/index';`

#### await 包裹 try-catch
- 共 327 个独立的 `await` 调用被包裹在 `try...catch` 中（符合 XTS.CHECK.ASYNC_TESTCASE.02 规范）
- 已存在于 try-catch 块中的 await 未重复包裹（如 calendarPickerDialogBackgroundEffect.test.ets 的 beforeEach 中已有 try-catch）

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_nowear_api19_static | ace_ets_module_dialog_nowear_api19 | 是 |

### 已对齐
| static 文件 | 非 static 文件 | 说明 |
|---|---|---|
| 13 个 .test.ets 文件（所有 sleep 值完全匹配） | 对应非 static 文件 | sleep 时长已一致，无需修改 |

**已对齐文件列表**（13 个文件，所有 sleep 值完全一致）：
- actionSheetBlurStyleOptions.test.ets
- showActionSheetBackgroundEffect.test.ets
- showActionSheetBlurStyleOptions.test.ets
- showDatePickerDialogBackgroundEffect.test.ets
- showDatePickerDialogBlurStyleOptions.test.ets
- showTextPickerDialogBackgroundEffect.test.ets
- showTextPickerDialogBlurStyleOptions.test.ets
- showTimePickerDialogBackgroundEffect.test.ets
- showTimePickerDialogBlurStyleOptions.test.ets
- textPickerDialogBackgroundEffect.test.ets
- textPickerDialogBlurStyleOptions.test.ets
- timePickerDialogBackgroundEffect.test.ets
- timePickerDialogBlurStyleOptions.test.ets

### 差异过大（未修改）
| static 文件 | 非 static 文件 | 差异位置 | static(ms) | 非 static(ms) | 差异(ms) | 说明 |
|---|---|---|---|---|---|---|
| actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffect.test.ets | it0100 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffect.test.ets | it0200 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffect.test.ets | it0300 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffect.test.ets | it0100 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffect.test.ets | it0200 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffect.test.ets | it0300 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions.test.ets | it0100 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions.test.ets | it0200 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions.test.ets | it0300 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffect.test.ets | it0200 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffect.test.ets | it0300 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions.test.ets | it0100 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |
| datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions.test.ets | it0200 getInspectorTree 后 | 0（缺失） | 2000 | 2000 | static 缺少 getInspectorTree 后的 sleep(2000) |

**说明**：以上 5 个文件的 static 版本在部分 it 用例的 `getInspectorTree()` 调用后缺少 `await Utils.sleep(2000)` 语句。非 static 版本在每个 it 用例的 `getInspectorTree()` 后都有此 sleep。差异均为 2000ms（> 1000ms），属于结构性差异（缺失 sleep 调用），不修改，仅记录。

## 三、it 用例对齐

### 统计
| 指标 | 数量 |
|---|---|
| static it 用例总数 | 54 |
| 非 static it 用例总数 | 65 |
| 已匹配 | 54 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 11 |

### 仅 static 存在的用例（非 static 中无对应）
无。

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| PopupTest/Maxwidth.test.ets | popup_maxWidth_0101 |
| PopupTest/Maxwidth.test.ets | popup_maxWidth_0102 |
| PopupTest/Maxwidth.test.ets | popup_maxWidth_0103 |
| promptActionTest/openMenuAnchorPosition.test.ets | openMenuAnchorPositionTest_0100 |
| promptActionTest/openMenuAnchorPosition.test.ets | openMenuAnchorPositionTest_0200 |
| promptActionTest/openMenuAnchorPosition.test.ets | openMenuAnchorPositionTest_0300 |
| promptActionTest/subwindowDialog.test.ets | subwindowDialog_0100 |
| promptActionTest/subwindowDialog.test.ets | subwindowDialog_0200 |
| promptActionTest/updateMenuAnchorPosition.test.ets | updateMenuAnchorPositionTest_0100 |
| promptActionTest/updateMenuAnchorPosition.test.ets | updateMenuAnchorPositionTest_0200 |
| promptActionTest/updateMenuAnchorPosition.test.ets | updateMenuAnchorPositionTest_0300 |

**说明**：以上 11 个用例来自 4 个测试文件（PopupTest/Maxwidth.test.ets、promptActionTest/openMenuAnchorPosition.test.ets、promptActionTest/subwindowDialog.test.ets、promptActionTest/updateMenuAnchorPosition.test.ets），这些文件在 static 测试套中不存在。

### 已匹配的用例（54 个，全部通过去除 _static 后缀匹配）

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffectTest_static_0100 | actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffectTest_0100 | 去除 _static |
| actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffectTest_static_0200 | actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffectTest_0200 | 去除 _static |
| actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffectTest_static_0300 | actionSheetBackgroundEffect.test.ets | actionSheetBackgroundEffectTest_0300 | 去除 _static |
| actionSheetBlurStyleOptions.test.ets | actionSheetBlurStyleOptionsTest_static_0100 | actionSheetBlurStyleOptions.test.ets | actionSheetBlurStyleOptionsTest_0100 | 去除 _static |
| actionSheetBlurStyleOptions.test.ets | actionSheetBlurStyleOptionsTest_static_0200 | actionSheetBlurStyleOptions.test.ets | actionSheetBlurStyleOptionsTest_0200 | 去除 _static |
| actionSheetBlurStyleOptions.test.ets | actionSheetBlurStyleOptionsTest_static_0300 | actionSheetBlurStyleOptions.test.ets | actionSheetBlurStyleOptionsTest_0300 | 去除 _static |
| calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffectTest_static_0100 | calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffectTest_0100 | 去除 _static |
| calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffectTest_static_0200 | calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffectTest_0200 | 去除 _static |
| calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffectTest_static_0300 | calendarPickerDialogBackgroundEffect.test.ets | calendarPickerDialogBackgroundEffectTest_0300 | 去除 _static |
| calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions_static_0100 | calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions_0100 | 去除 _static |
| calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions_static_0200 | calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions_0200 | 去除 _static |
| calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions_static_0300 | calendarPickerDialogBlurStyleOptions.test.ets | calendarPickerDialogBlurStyleOptions_0300 | 去除 _static |
| datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffectTest_static_0100 | datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffectTest_0100 | 去除 _static |
| datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffectTest_static_0200 | datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffectTest_0200 | 去除 _static |
| datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffectTest_static_0300 | datePickerDialogBackgroundEffect.test.ets | datePickerDialogBackgroundEffectTest_0300 | 去除 _static |
| datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions_static_0100 | datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions_0100 | 去除 _static |
| datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions_static_0200 | datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions_0200 | 去除 _static |
| datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions_static_0300 | datePickerDialogBlurStyleOptions.test.ets | datePickerDialogBlurStyleOptions_0300 | 去除 _static |
| textPickerDialogBackgroundEffect.test.ets | textPickerDialogBackgroundEffectTest_static_0100 | textPickerDialogBackgroundEffect.test.ets | textPickerDialogBackgroundEffectTest_0100 | 去除 _static |
| textPickerDialogBackgroundEffect.test.ets | textPickerDialogBackgroundEffectTest_static_0200 | textPickerDialogBackgroundEffect.test.ets | textPickerDialogBackgroundEffectTest_0200 | 去除 _static |
| textPickerDialogBackgroundEffect.test.ets | textPickerDialogBackgroundEffectTest_static_0300 | textPickerDialogBackgroundEffect.test.ets | textPickerDialogBackgroundEffectTest_0300 | 去除 _static |
| textPickerDialogBlurStyleOptions.test.ets | textPickerDialogBlurStyleOptions_static_0100 | textPickerDialogBlurStyleOptions.test.ets | textPickerDialogBlurStyleOptions_0100 | 去除 _static |
| textPickerDialogBlurStyleOptions.test.ets | textPickerDialogBlurStyleOptions_static_0200 | textPickerDialogBlurStyleOptions.test.ets | textPickerDialogBlurStyleOptions_0200 | 去除 _static |
| textPickerDialogBlurStyleOptions.test.ets | textPickerDialogBlurStyleOptions_static_0300 | textPickerDialogBlurStyleOptions.test.ets | textPickerDialogBlurStyleOptions_0300 | 去除 _static |
| timePickerDialogBackgroundEffect.test.ets | timePickerDialogBackgroundEffectTest_static_0100 | timePickerDialogBackgroundEffect.test.ets | timePickerDialogBackgroundEffectTest_0100 | 去除 _static |
| timePickerDialogBackgroundEffect.test.ets | timePickerDialogBackgroundEffectTest_static_0200 | timePickerDialogBackgroundEffect.test.ets | timePickerDialogBackgroundEffectTest_0200 | 去除 _static |
| timePickerDialogBackgroundEffect.test.ets | timePickerDialogBackgroundEffectTest_static_0300 | timePickerDialogBackgroundEffect.test.ets | timePickerDialogBackgroundEffectTest_0300 | 去除 _static |
| timePickerDialogBlurStyleOptions.test.ets | timePickerDialogBlurStyleOptions_static_0100 | timePickerDialogBlurStyleOptions.test.ets | timePickerDialogBlurStyleOptions_0100 | 去除 _static |
| timePickerDialogBlurStyleOptions.test.ets | timePickerDialogBlurStyleOptions_static_0200 | timePickerDialogBlurStyleOptions.test.ets | timePickerDialogBlurStyleOptions_0200 | 去除 _static |
| timePickerDialogBlurStyleOptions.test.ets | timePickerDialogBlurStyleOptions_static_0300 | timePickerDialogBlurStyleOptions.test.ets | timePickerDialogBlurStyleOptions_0300 | 去除 _static |
| showActionSheetBackgroundEffect.test.ets | showActionSheetBackgroundEffectTest_static_0100 | showActionSheetBackgroundEffect.test.ets | showActionSheetBackgroundEffectTest_0100 | 去除 _static |
| showActionSheetBackgroundEffect.test.ets | showActionSheetBackgroundEffectTest_static_0200 | showActionSheetBackgroundEffect.test.ets | showActionSheetBackgroundEffectTest_0200 | 去除 _static |
| showActionSheetBackgroundEffect.test.ets | showActionSheetBackgroundEffectTest_static_0300 | showActionSheetBackgroundEffect.test.ets | showActionSheetBackgroundEffectTest_0300 | 去除 _static |
| showActionSheetBlurStyleOptions.test.ets | showActionSheetBlurStyleOptionsTest_static_0100 | showActionSheetBlurStyleOptions.test.ets | showActionSheetBlurStyleOptionsTest_0100 | 去除 _static |
| showActionSheetBlurStyleOptions.test.ets | showActionSheetBlurStyleOptionsTest_static_0200 | showActionSheetBlurStyleOptions.test.ets | showActionSheetBlurStyleOptionsTest_0200 | 去除 _static |
| showActionSheetBlurStyleOptions.test.ets | showActionSheetBlurStyleOptionsTest_static_0300 | showActionSheetBlurStyleOptions.test.ets | showActionSheetBlurStyleOptionsTest_0300 | 去除 _static |
| showDatePickerDialogBackgroundEffect.test.ets | showDatePickerDialogBackgroundEffectTest_static_0100 | showDatePickerDialogBackgroundEffect.test.ets | showDatePickerDialogBackgroundEffectTest_0100 | 去除 _static |
| showDatePickerDialogBackgroundEffect.test.ets | showDatePickerDialogBackgroundEffectTest_static_0200 | showDatePickerDialogBackgroundEffect.test.ets | showDatePickerDialogBackgroundEffectTest_0200 | 去除 _static |
| showDatePickerDialogBackgroundEffect.test.ets | showDatePickerDialogBackgroundEffectTest_static_0300 | showDatePickerDialogBackgroundEffect.test.ets | showDatePickerDialogBackgroundEffectTest_0300 | 去除 _static |
| showDatePickerDialogBlurStyleOptions.test.ets | showDatePickerDialogBlurStyleOptions_static_0100 | showDatePickerDialogBlurStyleOptions.test.ets | showDatePickerDialogBlurStyleOptions_0100 | 去除 _static |
| showDatePickerDialogBlurStyleOptions.test.ets | showDatePickerDialogBlurStyleOptions_static_0200 | showDatePickerDialogBlurStyleOptions.test.ets | showDatePickerDialogBlurStyleOptions_0200 | 去除 _static |
| showDatePickerDialogBlurStyleOptions.test.ets | showDatePickerDialogBlurStyleOptions_static_0300 | showDatePickerDialogBlurStyleOptions.test.ets | showDatePickerDialogBlurStyleOptions_0300 | 去除 _static |
| showTextPickerDialogBackgroundEffect.test.ets | showTextPickerDialogBackgroundEffectTest_static_0100 | showTextPickerDialogBackgroundEffect.test.ets | showTextPickerDialogBackgroundEffectTest_0100 | 去除 _static |
| showTextPickerDialogBackgroundEffect.test.ets | showTextPickerDialogBackgroundEffectTest_static_0200 | showTextPickerDialogBackgroundEffect.test.ets | showTextPickerDialogBackgroundEffectTest_0200 | 去除 _static |
| showTextPickerDialogBackgroundEffect.test.ets | showTextPickerDialogBackgroundEffectTest_static_0300 | showTextPickerDialogBackgroundEffect.test.ets | showTextPickerDialogBackgroundEffectTest_0300 | 去除 _static |
| showTextPickerDialogBlurStyleOptions.test.ets | showTextPickerDialogBlurStyleOptions_static_0100 | showTextPickerDialogBlurStyleOptions.test.ets | showTextPickerDialogBlurStyleOptions_0100 | 去除 _static |
| showTextPickerDialogBlurStyleOptions.test.ets | showTextPickerDialogBlurStyleOptions_static_0200 | showTextPickerDialogBlurStyleOptions.test.ets | showTextPickerDialogBlurStyleOptions_0200 | 去除 _static |
| showTextPickerDialogBlurStyleOptions.test.ets | showTextPickerDialogBlurStyleOptions_static_0300 | showTextPickerDialogBlurStyleOptions.test.ets | showTextPickerDialogBlurStyleOptions_0300 | 去除 _static |
| showTimePickerDialogBackgroundEffect.test.ets | showTimePickerDialogBackgroundEffectTest_static_0100 | showTimePickerDialogBackgroundEffect.test.ets | showTimePickerDialogBackgroundEffectTest_0100 | 去除 _static |
| showTimePickerDialogBackgroundEffect.test.ets | showTimePickerDialogBackgroundEffectTest_static_0200 | showTimePickerDialogBackgroundEffect.test.ets | showTimePickerDialogBackgroundEffectTest_0200 | 去除 _static |
| showTimePickerDialogBackgroundEffect.test.ets | showTimePickerDialogBackgroundEffectTest_static_0300 | showTimePickerDialogBackgroundEffect.test.ets | showTimePickerDialogBackgroundEffectTest_0300 | 去除 _static |
| showTimePickerDialogBlurStyleOptions.test.ets | showTimePickerDialogBlurStyleOptions_static_0100 | showTimePickerDialogBlurStyleOptions.test.ets | showTimePickerDialogBlurStyleOptions_0100 | 去除 _static |
| showTimePickerDialogBlurStyleOptions.test.ets | showTimePickerDialogBlurStyleOptions_static_0200 | showTimePickerDialogBlurStyleOptions.test.ets | showTimePickerDialogBlurStyleOptions_0200 | 去除 _static |
| showTimePickerDialogBlurStyleOptions.test.ets | showTimePickerDialogBlurStyleOptions_static_0300 | showTimePickerDialogBlurStyleOptions.test.ets | showTimePickerDialogBlurStyleOptions_0300 | 去除 _static |
