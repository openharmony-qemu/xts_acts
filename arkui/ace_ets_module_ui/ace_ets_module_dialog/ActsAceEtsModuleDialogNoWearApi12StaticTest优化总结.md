# ActsAceEtsModuleDialogNoWearApi12StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/AlertDialogTest/Primary01.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量、afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/CalendarPickerDialogTest/CalendarPickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/CalendarPickerDialogTest/CalendarDialogCallback.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import | ~4s |
| entry/src/main/src/test/CalendarPickerDialogTest/ButtonStyle.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(domain/tag/testAbilityContext)、afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/DatePickerDialogTest/DatePickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/DatePickerDialogTest/DatePickerDialogCallback.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import | ~4s |
| entry/src/main/src/test/DatePickerDialogTest/DateButtonStyle.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(domain/tag/testAbilityContext)、afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/PopupTest/DismissReason.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(domain/tag/testAbilityContext)、it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/PopupTest/PopupApiTest/PopupApiTest.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TextPickerDialogTest/TextPickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TextPickerDialogTest/TextPickerDialogCallback.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import | ~4s |
| entry/src/main/src/test/TextPickerDialogTest/ButtonStyleTest/TextPickerDialogCancelTest.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(tag)、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TextPickerDialogTest/ButtonStyleTest/TextPickerDialogAcceptTest.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(tag)、afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TimePickerDialogTest/TimePickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TimePickerDialogTest/TimePickerDialogCallback.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import | ~4s |
| entry/src/main/src/test/TimePickerDialogTest/DateTimeOptions.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(tag)、it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TimePickerDialogTest/ButtonStyleTest/TimePickerDialogCancelTest.test.ets | 删除 beforeAll 中的 startAbility 调用(beforeAll 在 describe 外部)、清理未使用 import、afterEach await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TimePickerDialogTest/ButtonStyleTest/TimePickerDialogAcceptTest.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import 和变量(tag)、afterEach/it 中 await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
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
  let isAbilityStarted: boolean = false;
  import hilog from '@ohos.hilog'
  import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
  import UIAbility from '@ohos.app.ability.UIAbility';
  import common from '@ohos.app.ability.common';
  import { BusinessError } from '@ohos.base';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api12.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // 未使用的 import（hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest）已删除
  // 未使用的模块级变量（domain/tag/testAbilityContext）已删除
  // beforeAll 已从 hypium import 中移除
  // afterEach 和 it 中独立的 await 调用已包裹 try-catch
  ```

### 清理详情

每个 .test.ets 文件统一执行以下清理：
1. **删除 beforeAll 块**：包含 `UtilsTest.startAbility` 调用的整个 beforeAll 块
2. **删除未使用 import**：`hilog`、`abilityDelegatorRegistry`、`UIAbility`、`common`、`BusinessError`、`UtilsTest`（所有 .test.ets 中均无其他引用）
3. **删除未使用模块级变量**：
   - `let domain: int = 0x0000;`（DismissReason、DateButtonStyle、Calendar ButtonStyle 3个文件）
   - `let tag: string = 'testTag';`（DateTimeOptions、TextPickerDialogCancelTest、TextPickerDialogAcceptTest、TimePickerDialogAcceptTest 4个文件 + 上述3个文件）
   - `let testAbilityContext:common.UIAbilityContext;`（DismissReason、DateButtonStyle、Calendar ButtonStyle 3个文件）
4. **从 hypium import 移除 beforeAll**
5. **await 包裹 try-catch**：
   - 11个文件的 afterEach 中 `await CommonFunc.sleep(1000)` 包裹 try-catch
   - 6个文件的 it 块中独立 await 调用整体包裹 try-catch（DateTimeOptions、TimePickerDialogAcceptTest、Calendar ButtonStyle、TextPickerDialogAcceptTest、DateButtonStyle、DismissReason）

## 二、Sleep 时长对齐

### 对应非 static 测试套
- 非 static 目录：`ace_ets_module_dialog_nowear_api12`（同父目录下去掉 `_static` 后缀）
- 非 static 文件路径前缀：`entry/src/main/ets/test/`
- static 文件路径前缀：`entry/src/main/src/test/`

### 已对齐
| static 文件 | 非 static 文件 | 说明 |
|---|---|---|
| Primary01.test.ets | primary.test.ets | 所有对应 sleep 值一致 |
| TimePickerDialogCallback.test.ets | TimePickerDialogCallback.test.ets | 所有 sleep 值一致 |
| DateTimeOptions.test.ets | DateTimeOptions.test.ets | 所有 sleep 值一致 |
| TimePickerDialogCancelTest.test.ets | TimePickerDialog_Cancel_Test.test.ets | 所有 sleep 值一致 |
| TimePickerDialogAcceptTest.test.ets | TimePickerDialog_Accept_Test.test.ets | 所有 sleep 值一致 |
| CalendarDialogCallback.test.ets | CalendarDialogCallback.test.ets | 所有 sleep 值一致 |
| ButtonStyle.test.ets (Calendar) | ButtonStyle.test.ets (Calendar) | 所有 sleep 值一致 |
| TextPickerDialogCallback.test.ets | TextPickerDialogCallback.test.ets | 所有 sleep 值一致 |
| TextPickerDialogCancelTest.test.ets | TextPickerDialog_Cancel_Test.test.ets | 所有 sleep 值一致 |
| TextPickerDialogAcceptTest.test.ets | TextPickerDialog_Accept_Test.test.ets | 所有 sleep 值一致 |
| DatePickerDialogCallback.test.ets | DatePickerDialogCallback.test.ets | 所有 sleep 值一致 |
| DateButtonStyle.test.ets | DateButtonStyle.test.ets | 所有 sleep 值一致 |
| DismissReason.test.ets | DismissReason.test.ets | 所有 sleep 值一致 |
| PopupApiTest.test.ets | PopupApiTest.test.ets | 所有 sleep 值一致 |

**说明**：以上 14 个文件对中，static 与非 static 的 sleep 时长完全一致（包括 beforeEach 中的 2000ms、afterEach 中的 1000ms、it 块中的 500/1000/1500/3000ms），无需修改。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| Primary01.test.ets (it: primary_static_0200) | primary.test.ets (it: primary_0200) | it 块第4个 sleep（console.info 后 expect 前） | 2000 | 无对应 sleep | 2000 |

**说明**：static 版 Primary01.test.ets 的 `primary_static_0200` 用例中，在 `console.info('primary_static_0200 button1')` 和 `expect(button1 != null).assertTrue()` 之间有一个额外的 `await CommonFunc.sleep(2000)` 调用，非 static 版本中无此 sleep。差异 2000ms > 1000ms，不自动修改。

### 对应非 static 测试套不存在的文件
| static 文件 | 推导的非 static 文件名 | 是否存在 |
|---|---|---|
| TimePickerDialogTest/TimePickerDialog.test.ets | TimePickerDialog.test.ets | 否 |
| CalendarPickerDialogTest/CalendarPickerDialog.test.ets | CalendarPickerDialog.test.ets | 否 |
| TextPickerDialogTest/TextPickerDialog.test.ets | TextPickerDialog.test.ets | 否 |
| DatePickerDialogTest/DatePickerDialog.test.ets | DatePickerDialog.test.ets | 否 |

**说明**：以上 4 个 static 测试文件在非 static 测试套中无对应文件，无法进行 sleep 时长对齐。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| Primary01.test.ets | primary_static_0100 | primary.test.ets | primary_0100 | 去除 _static 后缀 |
| Primary01.test.ets | primary_static_0200 | primary.test.ets | primary_0200 | 去除 _static 后缀 |
| CalendarDialogCallback.test.ets | CalendarPickerDialogCallback_static_0100 | CalendarDialogCallback.test.ets | CalendarPickerDialogCallback_0100 | 去除 _static 后缀 |
| CalendarPickerDialogTest/ButtonStyle.test.ets | ButtonStyle_static_001 | CalendarPickerDialogTest/ButtonStyle.test.ets | ButtonStyle_001 | 去除 _static 后缀 |
| DateTimeOptions.test.ets | DateTimeOptions_static_0100 | DateTimeOptions.test.ets | DateTimeOptions_0100 | 去除 _static 后缀 |
| TimePickerDialogCallback.test.ets | TimePickerDialogCallback_static_0100 | TimePickerDialogCallback.test.ets | TimePickerDialogCallback_0100 | 去除 _static 后缀 |
| TimePickerDialogCancelTest.test.ets | TimePickerDialog_Cancel_Test_static_001 | TimePickerDialog_Cancel_Test.test.ets | TimePickerDialog_Cancel_Test_001 | 去除 _static 后缀 |
| TimePickerDialogAcceptTest.test.ets | TimePickerDialog_Accept_Test_static_001 | TimePickerDialog_Accept_Test.test.ets | TimePickerDialog_Accept_Test_001 | 去除 _static 后缀 |
| TextPickerDialogCallback.test.ets | TextPickerDialogCallback_static_0100 | TextPickerDialogCallback.test.ets | TextPickerDialogCallback_0100 | 去除 _static 后缀 |
| TextPickerDialogCancelTest.test.ets | TextPickerDialog_Cancel_Test_static_001 | TextPickerDialog_Cancel_Test.test.ets | TextPickerDialog_Cancel_Test_001 | 去除 _static 后缀 |
| TextPickerDialogAcceptTest.test.ets | TextPickerDialog_Accept_Test_static_001 | TextPickerDialog_Accept_Test.test.ets | TextPickerDialog_Accept_Test_001 | 去除 _static 后缀 |
| DatePickerDialogCallback.test.ets | DatePickerDialogCallback_static_0100 | DatePickerDialogCallback.test.ets | DatePickerDialogCallback_0100 | 去除 _static 后缀 |
| DateButtonStyle.test.ets | DateButtonStyle_static_001 | DateButtonStyle.test.ets | DateButtonStyle_001 | 去除 _static 后缀 |
| DismissReason.test.ets | DismissReasonTest_static_0010 | DismissReason.test.ets | DismissReasonTest_0010 | 去除 _static 后缀 |
| PopupApiTest.test.ets | PopupOptionsTest_static_001 | PopupApiTest.test.ets | PopupOptionsTest_001 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 | 原因 |
|---|---|---|
| CalendarPickerDialogTest/CalendarPickerDialog.test.ets | CalendarPickerDialog_static_001 | 非 static 中无 CalendarPickerDialog.test.ets 文件 |
| TimePickerDialogTest/TimePickerDialog.test.ets | TimePickerDialog_static_001 | 非 static 中无 TimePickerDialog.test.ets 文件 |
| TextPickerDialogTest/TextPickerDialog.test.ets | TextPickerDialog_static_001 | 非 static 中无 TextPickerDialog.test.ets 文件 |
| DatePickerDialogTest/DatePickerDialog.test.ets | DatePickerDialog_static_001 | 非 static 中无 DatePickerDialog.test.ets 文件 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| （无） | |

### 统计汇总
| 指标 | 数量 |
|---|---|
| static it 用例总数 | 19 |
| 非 static it 用例总数 | 15 |
| 已匹配 | 15 |
| 仅 static 存在 | 4 |
| 仅非 static 存在 | 0 |
| 匹配方式 | 全部为去除 `_static` 后缀精确匹配 |
