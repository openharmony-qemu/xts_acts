# ActsSelectStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/Select.test.ets | 删除 beforeAll 中的 startAbility 调用，清理大量未使用 import | ~0s（beforeAll 仅 startAbility 无 sleep） |

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

#### Select.test.ets
- **修改前**：
  ```typescript
  import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
  import { Component, DisplayRotation, Driver, MatchPattern, ON, PointerMatrix, ResizeDirection, UiWindow, WindowMode } from '@ohos.UiTest';
  import CommonFunc from '../../ets/MainAbility/common/Common';
  import { Callback, MessageManager } from '../../ets/MainAbility/common/MessageManager';
  import { BusinessError } from '@ohos.base';
  import { Router, UIContext } from '@ohos.arkui.UIContext';
  ...
  import { startAbility, stopApplication, UtilsTest } from './Util.test'
  ...
  beforeAll(async (): Promise<void> => {
    console.info("SelectTest beforeEach start");
    await UtilsTest.startAbility("com.example.Select.static", "EntryAbility");
  });
  ```
- **修改后**：
  ```typescript
  import { beforeEach, describe, expect, it, Level } from '../../../hypium/index';
  import router from '@ohos.router';
  import { Router } from '@ohos.arkui.UIContext';
  import { AppStorage } from '@ohos.arkui.stateManagement';
  import inspector from '@ohos.arkui.inspector';
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **清理的未使用 import**：
  - `Component, DisplayRotation, Driver, MatchPattern, ON, PointerMatrix, ResizeDirection, UiWindow, WindowMode`（from '@ohos.UiTest'）
  - `CommonFunc`（from '../../ets/MainAbility/common/Common'）
  - `Callback, MessageManager`（from '../../ets/MainAbility/common/MessageManager'）
  - `BusinessError`（from '@ohos.base'）
  - `UIContext`（from '@ohos.arkui.UIContext'，保留 Router）
  - `startAbility, stopApplication, UtilsTest`（from './Util.test'）
  - `beforeAll, afterAll, afterEach`（from hypium）
- **保留的 import**：`router`、`Router`、`AppStorage`、`inspector`（均有引用）

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| Select.test.ets | Select.test.ets | beforeEach pushUrl 后 | 0（无 sleep） | 2000 | 2000 |
| Select.test.ets | Select.test.ets | it 块内（每个用例） | 0（setTimeout 500） | 1000 x3 | 2500 |
| Select.test.ets | Select.test.ets | afterEach | 0（无 afterEach） | 1000 | 1000 |

> static 版本使用 `setTimeout(500)` 模式，无 sleep/msSleep 调用；非 static 版本使用 `CommonFunc.sleep(1000)` / `CommonFunc.sleep(2000)` 多处调用。两者结构差异较大，static 无 sleep 可对齐，仅记录差异。

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_component_Select_static | ace_ets_component_Select | 是 |

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| Select.test.ets | ArkUX_Select_Visual_static_0030 | Select.test.ets | ArkUX_Select_Visual_0030 | 去除 _static 后缀 |
| Select.test.ets | ArkUX_Select_Visual_static_0040 | Select.test.ets | ArkUX_Select_Visual_0040 | 去除 _static 后缀 |
| Select.test.ets | ArkUX_Select_Visual_static_0050 | Select.test.ets | ArkUX_Select_Visual_0050 | 去除 _static 后缀 |
| Select.test.ets | ArkUX_Select_Visual_static_0060 | Select.test.ets | ArkUX_Select_Visual_0060 | 去除 _static 后缀 |
| Select.test.ets | ArkUX_Select_Visual_static_0070 | Select.test.ets | ArkUX_Select_Visual_0070 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

**匹配统计：static 5 个用例，非 static 5 个用例，已匹配 5 对。**
