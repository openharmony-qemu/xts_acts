# ActsAceEtsModuleDialogNoWearApi15StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/bindSheet/detentSelection.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，移除 beforeAll 从 hypium import，包裹 standalone await sleep 于 try-catch | ~4s |

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

#### detentSelection.test.ets
- **修改前**：
  ```typescript
  import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    console.info("detentSelection beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api15.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
  // UtilsTest import 已删除（beforeAll 移除后无引用）
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **额外修改**：6 处 standalone `await CommonFunc.sleep(1000)` 调用包裹 try-catch（符合 XTS.CHECK.ASYNC_TESTCASE.02 规范）

#### popupKeyboardAvoidMode.test.ets
- **未修改**：该文件的 beforeAll 仅设置 `currentDeviceIsPC`，不包含 startAbility 调用，无需删除

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套目录 | 非 static 目录 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_nowear_api15_static | ace_ets_module_dialog_nowear_api15 | 是 |

### 已对齐（无需修改，时长已一致）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) |
|---|---|---|---|---|
| detentSelection.test.ets | detentSelection.test.ets | beforeEach | 2000 | 2000 |
| detentSelection.test.ets | detentSelection.test.ets | it_0100 sleep ×3 | 1000 | 1000 |
| detentSelection.test.ets | detentSelection.test.ets | it_0200 sleep ×3 | 1000 | 1000 |
| popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode.test.ets | beforeEach | 2000 | 2000 |
| popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode.test.ets | it_0100~0400 sleep | 1000 | 1000 |

### 差异过大（未修改）
无

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| detentSelection.test.ets | detentSelection_static_0100 | detentSelection.test.ets | detentSelection_0100 | 去除 _static |
| detentSelection.test.ets | detentSelection_static_0200 | detentSelection.test.ets | detentSelection_0200 | 去除 _static |
| popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_static_0100 | popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_0100 | 去除 _static |
| popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_static_0200 | popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_0200 | 去除 _static |
| popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_static_0300 | popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_0300 | 去除 _static |
| popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_static_0400 | popupKeyboardAvoidMode.test.ets | popupKeyboardAvoidMode_0400 | 去除 _static |

### 仅 static 存在的用例（非 static 中无对应）
无

### 仅非 static 存在的用例（static 中无对应）
无

## 汇总

| 指标 | 数值 |
|---|---|
| 修改文件数 | 2 |
| Sleep 时长已对齐数 | 0（全部已一致，无需修改） |
| it 用例匹配数 | 6/6（100%） |
