# ActsAceEtsModuleCommonAttrsDialogApi12StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 全局只启动一次 |
| test/bindSheetTest/DetentsChange.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch | ~4s |
| test/bindSheetTest/SheetMode.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch | ~4s |
| test/bindSheetTest/SheetTransition.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch | ~4s |
| test/bindSheetTest/springBack.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch | ~4s |
| test/slider/sliderInteractionModeTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch | ~4s |
| test/menuControlTest/symbolIcon.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import/变量、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/aboutToAppearFalse.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/aboutToDisappearFalse.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/CloseContextMenu.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/CloseEsc.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/CloseFalse.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/CloseMask.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/CloseMenu.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/IsShowFalse.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |
| test/menuControlTest/bindContextMenuTest/preview.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import、await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  ```
- **修改后**：
  ```typescript
  let cmd = 'aa start -d 0 -a EntryAbility' + ' -b ' + abilityDelegatorArguments.bundleName
  let debug = abilityDelegatorArguments.parameters['-D']
  if (debug == 'true') { cmd += ' -D' }
  let user = abilityDelegatorArguments.parameters['-u'];
  if (user !== undefined) { cmd += ' -u ' + user; }
  abilityDelegator.executeShellCommand(cmd)
  setTimeout(() => {
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }, 4000)
  ```

#### 各 .test.ets 文件
- **修改前**：
  ```typescript
  let domain: number = 0x0000;
  let tag: string = 'testTag';
  let testAbilityContext: common.UIAbilityContext;
  import { UtilsTest } from '../Util.test'
  import UIAbility from '@ohos.app.ability.UIAbility'
  import { BusinessError } from '@ohos.base'
  import hilog from '@ohos.hilog'
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import common from '@ohos.app.ability.common';
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api12.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // 未使用的 import 和模块级变量已删除
  // beforeAll 从 hypium import 中移除
  // 所有 standalone await 调用已包裹 try-catch
  ```

**说明**：
- `SheetMode.test.ets` 和 `IsShowFalse.test.ets` 保留了 `common` import（因为 it 用例中使用了 `common.BaseContext`）
- 其余文件删除了 `common` import（仅 `testAbilityContext` 使用，删除变量后无引用）
- `springBack.test.ets` 原始文件无 `hilog` 和 `abilityDelegatorRegistry` import，无需删除

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_commonAttrsDialog_api12_static | ace_ets_module_commonAttrsDialog_api12 | 存在 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

> 无需对齐的 sleep：大部分 sleep 时长 static 与非 static 完全一致（1000ms / 2000ms）。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| SheetMode.test.ets | SheetMode.test.ets | it 用例起始 sleep | 5000 | 1000 | 4000 |
| SheetTransition.test.ets | SheetTransition.test.ets | it 用例起始 sleep | 5000 | 1000 | 4000 |
| springBack.test.ets | springBack.test.ets | it 用例起始 sleep | 5000 | 1000 | 4000 |
| aboutToAppearFalse.test.ets | aboutToAppearFalse.test.ets | click 后 sleep | 4000 | 1000 | 3000 |

### 单边 sleep（仅 static 存在）
| static 文件 | sleep 位置 | static(ms) | 说明 |
|---|---|---|---|
| aboutToAppearFalse.test.ets | findComponent 后、click 前 | 2000 | 非 static 无此 sleep |
| aboutToAppearFalse.test.ets | getInspector 后、expect 前 | 1000 | 非 static 无此 sleep |
| SheetTransition.test.ets | getInspector 后、parse 前 | 2000 | 非 static 无此 sleep |
| preview.test.ets | findComponent(MyPreview) 后、click 前 | 1000 | 非 static 无此 sleep |

## 三、it 用例对齐

### 统计
| 类别 | 数量 |
|---|---|
| static it 用例总数 | 19 |
| 非 static it 用例总数 | 19 |
| 已匹配 | 19 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 0 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

> 无仅 static 存在的用例。

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

> 无仅非 static 存在的用例。

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| DetentsChange.test.ets | DetentsChange_static_0100 | DetentsChange.test.ets | DetentsChange_0100 | 去除 _static 后缀 |
| SheetMode.test.ets | SheetMode_static_0100 | SheetMode.test.ets | SheetMode_0100 | 去除 _static 后缀 |
| SheetTransition.test.ets | SheetTransition_static_0100 | SheetTransition.test.ets | SheetTransition_0100 | 去除 _static 后缀 |
| springBack.test.ets | springBack_static_0100 | springBack.test.ets | springBack_0100 | 去除 _static 后缀 |
| sliderInteractionModeTest.test.ets | sliderInteractionModeTest_static_0100 | sliderInteractionModeTest.test.ets | sliderInteractionModeTest_0100 | 去除 _static 后缀 |
| sliderInteractionModeTest.test.ets | sliderInteractionModeTest_static_0200 | sliderInteractionModeTest.test.ets | sliderInteractionModeTest_0200 | 去除 _static 后缀 |
| sliderInteractionModeTest.test.ets | sliderInteractionModeTest_static_0300 | sliderInteractionModeTest.test.ets | sliderInteractionModeTest_0300 | 去除 _static 后缀 |
| symbolIcon.test.ets | symbolIcon_static_0100 | symbolIcon.test.ets | symbolIcon_0100 | 去除 _static 后缀 |
| aboutToAppearFalse.test.ets | aboutToAppearFalse_static_0100 | aboutToAppearFalse.test.ets | aboutToAppearFalse_0100 | 去除 _static 后缀 |
| aboutToDisappearFalse.test.ets | aboutToDisappearFalse_static_0100 | aboutToDisappearFalse.test.ets | aboutToDisappearFalse_0100 | 去除 _static 后缀 |
| CloseContextMenu.test.ets | CloseContextMenu_static_0100 | CloseContextMenu.test.ets | CloseContextMenu_0100 | 去除 _static 后缀 |
| CloseEsc.test.ets | CloseEsc_static_0100 | CloseEsc.test.ets | CloseEsc_0100 | 去除 _static 后缀 |
| CloseFalse.test.ets | CloseFalse_static_0100 | CloseFalse.test.ets | CloseFalse_0100 | 去除 _static 后缀 |
| CloseMask.test.ets | CloseMask_static_0100 | CloseMask.test.ets | CloseMask_0100 | 去除 _static 后缀 |
| CloseMenu.test.ets | CloseMenu_static_0100 | CloseMenu.test.ets | CloseMenu_0100 | 去除 _static 后缀 |
| IsShowFalse.test.ets | IsShowFalse_static_0100 | IsShowFalse.test.ets | IsShowFalse_0100 | 去除 _static 后缀 |
| IsShowFalse.test.ets | IsShowFalse_0200 | IsShowFalse.test.ets | IsShowFalse_0200 | 完全匹配 |
| IsShowFalse.test.ets | IsShowFalse_0300 | IsShowFalse.test.ets | IsShowFalse_0300 | 完全匹配 |
| preview.test.ets | preview_static_0100 | preview.test.ets | preview_0100 | 去除 _static 后缀 |
