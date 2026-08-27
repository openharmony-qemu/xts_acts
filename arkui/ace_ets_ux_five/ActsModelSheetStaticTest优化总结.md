# ActsModelSheetStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/ModelSheet.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 import（UiTest 全部、startAbility） | ~0s（beforeAll 仅 startAbility 无 sleep） |

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

#### ModelSheet.test.ets
- **修改前**：
  ```typescript
  import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
  import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
  ...
  import { UtilsTest, startAbility } from './Util.test'
  ...
  beforeAll(async (): Promise<void> => {
    console.info("ModelSheetTest beforeAll start");
    await UtilsTest.startAbility("com.example.ModelSheet.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, it, expect, Level } from '../../../hypium/index';
  import { UtilsTest } from './Util.test'
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **清理的未使用 import**：`Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix`（from '@ohos.UiTest'）；`startAbility`（from './Util.test'）；`beforeAll, afterEach, afterAll`（from hypium）
- **保留的 import**：`UtilsTest`（beforeEach 中 msSleep 仍使用）、`router`、`inspector`、`Router`、`AppStorage`、`emitter`、`SheetSize, BlurStyle, SheetType`

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| ModelSheet.test.ets | ModelSheet.test.ets | beforeEach pushUrl 后 | 2000 | 0（无 sleep） | 2000 |

> static beforeEach 在 pushUrl 后有 `await UtilsTest.msSleep(2000)`；非 static beforeEach 使用 `await router.pushUrl(options)`（await 等待导航完成，无需额外 sleep）。差异 2000ms > 1000ms，仅记录不修改。

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_component_ModelSheet_static | ace_ets_component_ModelSheet | 是 |

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0150 | ModelSheet.test.ets | ArkUX_Model_Visual_0150 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0160 | ModelSheet.test.ets | ArkUX_Model_Visual_0160 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0170 | ModelSheet.test.ets | ArkUX_Model_Visual_0170 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0180 | ModelSheet.test.ets | ArkUX_Model_Visual_0180 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0190 | ModelSheet.test.ets | ArkUX_Model_Visual_0190 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0200 | ModelSheet.test.ets | ArkUX_Model_Visual_0200 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0210 | ModelSheet.test.ets | ArkUX_Model_Visual_0210 | 去除 _static 后缀 |
| ModelSheet.test.ets | ArkUX_Model_Visual_static_0220 | ModelSheet.test.ets | ArkUX_Model_Visual_0220 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

**匹配统计：static 8 个用例，非 static 8 个用例，已匹配 8 对。**
