# ActsAceEtsModuleDialogSelectStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | Ability 统一启动一次 |
| entry/src/main/src/test/SelectTest/SelectMenuBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 UtilsTest import、移除 beforeAll from hypium import、beforeEach/afterEach/it 包裹 try-catch | ~4s |
| entry/src/main/src/test/SelectTest/SelectMenuBackgroundBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 UtilsTest import、移除 beforeAll from hypium import、beforeEach/afterEach/it 包裹 try-catch | ~4s |
| entry/src/main/src/test/SelectTest/Select.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 UtilsTest import、移除 beforeAll from hypium import、afterEach 包裹 try-catch | ~4s |

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
  import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '...';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.dialog.select.static', 'EntryAbility');
  });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, afterEach, Level, beforeEach } from '...';
  // UtilsTest import 已删除
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // beforeEach/afterEach 中的 await 调用已包裹 try-catch
  // it 块体已包裹 try-catch（符合 XTS.CHECK.ASYNC_TESTCASE.02 规范）
  ```

### 包名
- `com.arkui.ace.dialog.select.static`（从 abilityDelegatorArguments.bundleName 自动获取）

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套目录 | 推导的非 static 目录 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_Select_static | ace_ets_module_dialog_Select | 存在 |

### 文件匹配情况
| static 文件 | 非 static 对应文件 | 匹配结果 |
|---|---|---|
| SelectMenuBackgroundEffect.test.ets | 无同名/相似文件 | 不匹配 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | 无同名/相似文件 | 不匹配 |
| Select.test.ets | 无同名/相似文件 | 不匹配 |

**说明**：static 与非 static 测试套的测试文件完全不同。static 测试套包含 `SelectMenuBackgroundEffect`、`SelectMenuBackgroundBlurStyleOptions`、`Select` 三个测试文件，而非 static 测试套包含 `TriggerSelectNullUndefinedExample`、`SelectStatus`、`selectDividerTest` 三个测试文件。两者测试的功能场景完全不同，无法进行文件级别的 sleep 时长对齐。

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| 无 | 无 | 无 | 无 | 无 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| 无 | 无 | 无 | 无 | 无 | 无 |

## 三、it 用例对齐

### Static 测试套 it 用例列表（共 11 个）

| 文件 | it 用例名称 |
|---|---|
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0001 |
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0002 |
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0003 |
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0004 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | SelectMenuBackgroundBlurStyleOptions_0001 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | SelectMenuBackgroundBlurStyleOptions_0002 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | SelectMenuBackgroundBlurStyleOptions_0003 |
| Select.test.ets | selectShowInSubWindow |
| Select.test.ets | selectShowDefaultSelectedIcon |
| Select.test.ets | selectKeyboardAvoidMode |
| Select.test.ets | selectMinKeyboardAvoidDistance |

### 非 static 测试套 it 用例列表（共 10 个）

| 文件 | it 用例名称 |
|---|---|
| TriggerSelectNullUndefinedExample.test.ets | triggerSelectNullUndefinedTest_001 |
| TriggerSelectNullUndefinedExample.test.ets | triggerSelectNullUndefinedTest_002 |
| TriggerSelectNullUndefinedExample.test.ets | triggerSelectNullUndefinedTest_003 |
| SelectStatus.test.ets | SelectStatusTest_0100 |
| SelectStatus.test.ets | SelectStatusTest_0200 |
| SelectStatus.test.ets | SelectStatusTest_0300 |
| SelectStatus.test.ets | MenuPreviewMode_0400 |
| SelectStatus.test.ets | SliderStyle_0500 |
| selectDividerTest.test.ets | selectDividerTest_001 |
| selectDividerTest.test.ets | selectDividerTest_002 |

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| 无 | 无 | 无 | 无 | 无 |

**说明**：经完全匹配、去除 `_static` 后缀匹配、模糊匹配（Levenshtein 距离 <= 3）三种方式检查，static 与非 static 测试套的 it 用例名称均无法匹配。static 测试套测试的是 Select 组件的 `menuBackgroundEffect`、`menuBackgroundBlurStyleOptions`、`showInSubWindow`、`showDefaultSelectedIcon`、`keyboardAvoidMode`、`minKeyboardAvoidDistance` 等属性，而非 static 测试套测试的是 `triggerSelect`、`SelectStatus`、`selectDivider` 等不同功能。两者为完全不同的测试场景。

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0001 |
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0002 |
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0003 |
| SelectMenuBackgroundEffect.test.ets | SelectMenuBackgroundEffect_0004 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | SelectMenuBackgroundBlurStyleOptions_0001 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | SelectMenuBackgroundBlurStyleOptions_0002 |
| SelectMenuBackgroundBlurStyleOptions.test.ets | SelectMenuBackgroundBlurStyleOptions_0003 |
| Select.test.ets | selectShowInSubWindow |
| Select.test.ets | selectShowDefaultSelectedIcon |
| Select.test.ets | selectKeyboardAvoidMode |
| Select.test.ets | selectMinKeyboardAvoidDistance |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| TriggerSelectNullUndefinedExample.test.ets | triggerSelectNullUndefinedTest_001 |
| TriggerSelectNullUndefinedExample.test.ets | triggerSelectNullUndefinedTest_002 |
| TriggerSelectNullUndefinedExample.test.ets | triggerSelectNullUndefinedTest_003 |
| SelectStatus.test.ets | SelectStatusTest_0100 |
| SelectStatus.test.ets | SelectStatusTest_0200 |
| SelectStatus.test.ets | SelectStatusTest_0300 |
| SelectStatus.test.ets | MenuPreviewMode_0400 |
| SelectStatus.test.ets | SliderStyle_0500 |
| selectDividerTest.test.ets | selectDividerTest_001 |
| selectDividerTest.test.ets | selectDividerTest_002 |
