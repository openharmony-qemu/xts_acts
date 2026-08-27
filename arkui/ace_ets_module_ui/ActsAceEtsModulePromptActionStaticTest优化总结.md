# ActsAceEtsModulePromptActionStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/LevelOrderTest/LevelOrder.test.ets | 删除 beforeAll 中的 startAbility 调用、UtilsTest 导入、beforeAll 导入；beforeEach/afterEach 补充 try-catch | ~4s |

共修改 2 个文件（1 个 OpenHarmonyTestRunner.ets + 1 个 .test.ets），删除 1 处 beforeAll/startAbility 调用，清理 1 处 UtilsTest 未使用导入，为 2 个 beforeEach/afterEach 块补充 try-catch 错误捕获。

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
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
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

#### LevelOrder.test.ets
- **修改前**：
  ```typescript
  import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.ets.module.promptaction.static', 'EntryAbility');
  });
  beforeEach(async (): Promise<void> => {
    const options: router.RouterOptions = { url: PAGE_URL };
    const routerInstance = AppStorage.get<Router>('router') as Router;
    routerInstance.clear();
    routerInstance.replaceUrl(options);
    await CommonFunc.sleep(SLEEP_TIME);
    expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
  });
  afterEach(async (): Promise<void> => {
    await CommonFunc.sleep(SLEEP_TIME);
  });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
  // UtilsTest 导入已删除
  ...
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  beforeEach(async (): Promise<void> => {
    try {
      const options: router.RouterOptions = { url: PAGE_URL };
      const routerInstance = AppStorage.get<Router>('router') as Router;
      routerInstance.clear();
      routerInstance.replaceUrl(options);
      await CommonFunc.sleep(SLEEP_TIME);
      expect(routerInstance.getState().name).assertEqual(PAGE_NAME);
    } catch (err) {
      console.info('LevelOrderTest beforeEach err: ' + JSON.stringify(err));
    }
  });
  afterEach(async (): Promise<void> => {
    try {
      await CommonFunc.sleep(SLEEP_TIME);
    } catch (err) {
      console.info('LevelOrderTest afterEach err: ' + JSON.stringify(err));
    }
  });
  ```

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_promptAction_static | ace_ets_module_promptAction | 否 ❌ |

非 static 测试套 `ace_ets_module_promptAction` 不存在于代码库中（在 `arkui/ace_ets_module_ui/` 目录下仅有 `ace_ets_module_promptAction_static`，无对应非 static 目录）。因此无法进行 sleep 时长对齐。

### 已对齐
无（无非 static 测试套可对比）

### 差异过大（未修改）
无（无非 static 测试套可对比）

## 三、it 用例对齐

### 统计
| 指标 | 数量 |
|---|---|
| static it 用例总数 | 1 |
| 非 static it 用例总数 | 0（无非 static 测试套） |
| 已匹配 | 0 |
| 仅 static 存在 | 1 |
| 仅非 static 存在 | 0 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| LevelOrder.test.ets | clamp |

### 仅非 static 存在的用例（static 中无对应）
无非 static 测试套，无对应用例。

### 说明
非 static 测试套 `ace_ets_module_promptAction` 不存在，无法进行 it 用例名称对齐。该 static 测试套为独立新增测试，与非 static 无对应关系。
