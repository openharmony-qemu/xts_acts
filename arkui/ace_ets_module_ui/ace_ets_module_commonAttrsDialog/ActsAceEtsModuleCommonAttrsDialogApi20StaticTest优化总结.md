# ActsAceEtsModuleCommonAttrsDialogApi20StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/PromptActionTest/showActionMenuLife.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、beforeAll 从 hypium import 移除、await 包裹 try-catch | ~4s |
| entry/src/main/src/test/BindPopupTest/bindpopup.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、beforeAll 从 hypium import 移除、await 包裹 try-catch | ~4s |
| entry/src/main/src/test/BindContextMenuTest/contextMenuLife.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、beforeAll 从 hypium import 移除、await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  }
  ```
- **修改后**：
  ```typescript
  public onRun: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun');
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
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
  }
  ```

#### 各 .test.ets 文件
- **修改前**：
  ```typescript
  import { ..., beforeAll, ... } from '../../../../hypium/index'
  import { startAbility, UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    console.info("xxx beforeEach start");
    await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // import 中移除 beforeAll
  // import { startAbility, UtilsTest } from '../Util.test'; 整行删除
  // 所有 standalone await 调用包裹 try...catch
  ```

### 清理的 import 列表
| 文件 | 删除的 import |
|---|---|
| showActionMenuLife.test.ets | `beforeAll` (from hypium), `{ startAbility, UtilsTest }` (from Util.test) |
| bindpopup.test.ets | `beforeAll` (from hypium), `{UtilsTest, startAbility}` (from Util.test) |
| contextMenuLife.test.ets | `beforeAll` (from hypium), `{ startAbility, UtilsTest }` (from Util.test) |

### try-catch 包裹详情
| 文件 | 包裹位置 | await 调用 |
|---|---|---|
| showActionMenuLife.test.ets | afterEach | `await CommonFunc.sleep(1000)` |
| showActionMenuLife.test.ets | it (showActionMenu_static_0010) | `await CommonFunc.sleep(SLEEP_TIME_1000)` x3, `await (button?.click()...)`, `await (buttons?.click()...)` |
| bindpopup.test.ets | afterEach | `await CommonFunc.sleep(1000)` |
| bindpopup.test.ets | it (bindPopupTest_static_001) | `await CommonFunc.sleep(1000)`, `await CommonFunc.sleep(5000)`, `await (btn1?.click()...)` |
| contextMenuLife.test.ets | afterEach | `await CommonFunc.sleep(1000)` |
| contextMenuLife.test.ets | it (contextMenu_static_0010) | `await CommonFunc.sleep(SLEEP_TIME_1000)` x2, `await CommonFunc.sleep(SLEEP_TIME_2000)`, `await (button?.click()...)` |

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| (无) | - | - | - | - |

> 所有匹配的 sleep 时长在 static 与非 static 之间已完全一致，无需修改。

### Sleep 对比详情
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 状态 |
|---|---|---|---|---|---|
| showActionMenuLife.test.ets | showActionMenuLife.test.ets | beforeEach (pushUrl后) | 2000 | 2000 | 一致 |
| showActionMenuLife.test.ets | showActionMenuLife.test.ets | afterEach | 1000 | 1000 | 一致 |
| showActionMenuLife.test.ets | showActionMenuLife.test.ets | it sleep #1 | 1000 | 1000 | 一致 |
| showActionMenuLife.test.ets | showActionMenuLife.test.ets | it sleep #2 | 1000 | 1000 | 一致 |
| showActionMenuLife.test.ets | showActionMenuLife.test.ets | it sleep #3 | 1000 | 1000 | 一致 |
| bindpopup.test.ets | bindpopup.test.ets | beforeEach (pushUrl后) | 2000 | 2000 | 一致 |
| bindpopup.test.ets | bindpopup.test.ets | afterEach | 1000 | 1000 | 一致 |
| bindpopup.test.ets | bindpopup.test.ets | it sleep #1 | 1000 | 1000 | 一致 |
| bindpopup.test.ets | bindpopup.test.ets | it sleep #2 | 5000 | 5000 | 一致 |
| contextMenuLife.test.ets | contextMenuLife.test.ets | beforeEach (pushUrl后) | 2000 | 2000 | 一致 |
| contextMenuLife.test.ets | contextMenuLife.test.ets | afterEach | 1000 | 1000 | 一致 |
| contextMenuLife.test.ets | contextMenuLife.test.ets | it sleep #1 | 1000 | 1000 | 一致 |
| contextMenuLife.test.ets | contextMenuLife.test.ets | it sleep #2 | 1000 | 1000 | 一致 |
| contextMenuLife.test.ets | contextMenuLife.test.ets | it sleep #3 | 2000 | 2000 | 一致 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| (无) | - | - | - | - | - |

> 注：非 static 的 beforeEach 末尾多一个 `await CommonFunc.sleep(1000)`（在 try-catch 之外），static 版本无此 sleep。此为结构差异而非时长差异，不纳入时长对齐范围。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| PromptActionTest/showActionMenuLife.test.ets | showActionMenu_static_0010 | PromptActionTest/showActionMenuLife.test.ets | showActionMenu_0010 | 去除 _static 后缀 |
| BindPopupTest/bindpopup.test.ets | bindPopupTest_static_001 | BindPopupTest/bindpopup.test.ets | bindPopupTest_001 | 去除 _static 后缀 |
| BindContextMenuTest/contextMenuLife.test.ets | contextMenu_static_0010 | BindContextMenuTest/contextMenuLife.test.ets | contextMenu_0010 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| (无) | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| SafeAreaTest/enableSafeArea.test.ets | safeArea_0010 |
| SafeAreaTest/enableSafeArea.test.ets | safeArea_0020 |

> 注：非 static 测试套包含 SafeAreaTest/enableSafeArea.test.ets 文件（含 safeArea_0010、safeArea_0020 两个用例），static 测试套中无此文件及对应用例。

## 四、总结

| 指标 | 数量 |
|---|---|
| 修改文件数 | 4 |
| Sleep 时长对齐数 | 0（全部已一致） |
| it 用例匹配数 | 3 |
| 仅 static 存在用例 | 0 |
| 仅非 static 存在用例 | 2（SafeAreaTest，static 无对应文件） |
