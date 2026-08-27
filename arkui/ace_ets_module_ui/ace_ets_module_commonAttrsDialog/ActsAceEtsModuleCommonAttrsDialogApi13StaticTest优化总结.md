# ActsAceEtsModuleCommonAttrsDialogApi13StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/bindContextMenuTest/bindContextMenuMargin.test.ets | 删除 beforeAll 中的 startAbility 调用、守卫变量、未使用 import/模块变量；beforeAll 从 hypium import 移除；未包裹 try-catch 的 await 调用补充 try-catch | ~4s |

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

#### bindContextMenuMargin.test.ets
- **修改前**：
  ```typescript
  let isAbilityStarted: boolean = false;  // （本文件中无此守卫变量，beforeAll 直接调用 startAbility）
  ...
  beforeAll(async (): Promise<void> => {
    console.info("activeTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api13.Static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **删除的未使用 import**：
  - `import UIAbility from '@ohos.app.ability.UIAbility'`
  - `import { BusinessError } from '@ohos.base'`
  - `import common from '@ohos.app.ability.common'`
  - `import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'`
  - `import hilog from '@ohos.hilog'`
  - `import { UtilsTest } from '../Util.test'`
- **删除的未使用模块级变量**：
  - `let domain: number = 0x0000;`
  - `let tag: string = 'testTag';`
  - `let testAbilityContext: common.UIAbilityContext;`
- **hypium import 调整**：移除 `beforeAll`
  ```typescript
  // 修改前
  import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '...';
  // 修改后
  import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '...';
  ```
- **await 调用补充 try-catch**：it 用例中的 standalone await 调用（`CommonFunc.sleep`、`driver.findComponent`、`btn.click()`）已按逻辑分组包裹 try-catch

## 二、Sleep 时长对齐

### 非 static 测试套
| static 目录名 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_commonAttrsDialog_api13_static | ace_ets_module_commonAttrsDialog_api13 | 是 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| bindContextMenuMargin.test.ets | bindContextMenuMargin.test.ets | beforeEach - pushUrl 后 sleep | 2000 | 2000（已一致，无需修改） |
| bindContextMenuMargin.test.ets | bindContextMenuMargin.test.ets | it - findComponent 前 sleep | 1000 | 1000（已一致，无需修改） |
| bindContextMenuMargin.test.ets | bindContextMenuMargin.test.ets | it - click 后 sleep | 1000 | 1000（已一致，无需修改） |
| bindContextMenuMargin.test.ets | bindContextMenuMargin.test.ets | it - menu findComponent 前 sleep | 1000 | 1000（已一致，无需修改） |
| bindContextMenuMargin.test.ets | bindContextMenuMargin.test.ets | it - menu click 后 sleep | 1000 | 1000（已一致，无需修改） |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

> 说明：static 与非 static 的所有 sleep 时长完全一致，无需对齐修改。无 unilateral sleep（单边 sleep）记录。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| bindContextMenuMargin.test.ets | bindContextMenuMargin_Static_0100 | bindContextMenuMargin.test.ets | bindContextMenuMargin_0100 | 移除 `_static` 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

## 四、总结

| 维度 | 数量 |
|---|---|
| 修改文件数 | 2 |
| Sleep 已对齐数 | 5（全部已一致） |
| Sleep 差异过大未修改 | 0 |
| it 用例已匹配数 | 1 |
| it 用例仅 static 存在 | 0 |
| it 用例仅非 static 存在 | 0 |
