# ActsAceEtsModuleCommonAttrsDialogApi16StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 全套仅启动一次 |
| entry/src/main/src/test/BindSheetTest/bindSheetRadius.test.ets | 删除 beforeAll 中的 startAbility 调用、删除未使用 import 和变量、包裹 standalone await | ~4s |

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
  ```

#### bindSheetRadius.test.ets
- **删除的 beforeAll 块**：
  ```typescript
  beforeAll(async (): Promise<void> => {
    console.info("assemblyCallbackTest beforeAll start");
    await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
  });
  ```
- **删除的未使用 import**：
  - `import UIAbility from '@ohos.app.ability.UIAbility'`
  - `import { BusinessError } from '@ohos.base'`
  - `import hilog from '@ohos.hilog'`
  - `import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'`
  - `import common from '@ohos.app.ability.common'`
  - `import { UtilsTest } from '../Util.test'`
- **删除的未使用模块级变量**：
  - `let domain: number = 0x0000;`
  - `let tag: string = 'testTag';`
  - `let testAbilityContext: common.UIAbilityContext;`
- **hypium import 清理**：从 `import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level }` 中移除 `beforeAll`
- **standalone await 包裹 try...catch**：afterEach 中的 `await CommonFunc.sleep(1000)` 及各 it 用例中的所有 `await driver.findComponent()`、`await CommonFunc.sleep()`、`await (btn?.click())` 调用均包裹 try...catch
- **保留 `'use static'` 指令**

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套 | 非 static 测试套 | 是否存在 |
|---|---|---|
| ace_ets_module_commonAttrsDialog_api16_static | ace_ets_module_commonAttrsDialog_api16 | 是 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| bindSheetRadius.test.ets | bindSheetRadius.test.ets | it_0100 click 后 | 2000 | 1000 |
| bindSheetRadius.test.ets | bindSheetRadius.test.ets | it_0200 click 后 | 2000 | 1000 |
| bindSheetRadius.test.ets | bindSheetRadius.test.ets | it_0300 click 后 | 2000 | 1000 |
| bindSheetRadius.test.ets | bindSheetRadius.test.ets | it_0400 click 后 | 2000 | 1000 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

### Sleep 对齐说明
- static 版本的 it 用例中 click 后的 sleep 原为 2000ms，非 static 版本为 1000ms，差异 1000ms（≤1000ms），已对齐为 1000ms。
- static 版本存在但非 static 版本不存在的 sleep（如 click 前的 sleep(1000)、it_0100/it_0200 中 date1 后的 sleep(2000)）保留不变，不做增删。
- beforeEach 中 pushUrl 后的 sleep(2000) 与非 static 一致，无需修改。
- afterEach 中 sleep(1000) 与非 static 一致，无需修改（已包裹 try...catch）。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| bindSheetRadius.test.ets | bindSheetTest_static_0100 | bindSheetRadius.test.ets | bindSheetTest_0100 | 去除 _static 后缀 |
| bindSheetRadius.test.ets | bindSheetTest_static_0200 | bindSheetRadius.test.ets | bindSheetTest_0200 | 去除 _static 后缀 |
| bindSheetRadius.test.ets | bindSheetTest_static_0300 | bindSheetRadius.test.ets | bindSheetTest_0300 | 去除 _static 后缀 |
| bindSheetRadius.test.ets | bindSheetTest_static_0400 | bindSheetRadius.test.ets | bindSheetTest_0400 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### it 用例对齐总结
- static 用例数：4
- 非 static 用例数：4
- 已匹配数：4
- 匹配率：100%
