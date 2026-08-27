# ActsAceEtsModuleAdvancedEditableTitleBarNowearStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/editableTitleBar/editableTitleBarAccessibilityPage.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest/startAbility import，移除 beforeAll import，afterEach/it 中 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/editableTitleBar/editableTitleBarSymbolPage.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest/startAbility import，移除 beforeAll import，afterEach/it 中 await 包裹 try-catch | ~4s |

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

#### editableTitleBarAccessibilityPage.test.ets
- **修改前**：
  ```typescript
  import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
  import {UtilsTest,startAbility} from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    console.info("editableTitleBarAccessibilityPage beforeEach start");
    await UtilsTest.startAbility("com.acts.arkui.editableTitleBar.nowear.test.static", "EntryAbility")
  });
  ...
  afterEach(async (): Promise<void> => {
    await Utils.sleep(1000);
    console.info('editableTitleBarAccessibilityPage after each called');
  })
  ...
  // it body 中 await 未包裹 try-catch
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
  // UtilsTest/startAbility import 已删除
  ...
  // beforeAll 块已删除，Ability 启动已移至 OpenHarmonyTestRunner
  ...
  afterEach(async (): Promise<void> => {
    try {
      await Utils.sleep(1000);
    } catch (err) {
      console.info('editableTitleBarAccessibilityPage afterEach sleep err: ' + JSON.stringify(err));
    }
    console.info('editableTitleBarAccessibilityPage after each called');
  })
  ...
  // it body 已包裹 try-catch
  ```

#### editableTitleBarSymbolPage.test.ets
- **修改前**：
  ```typescript
  import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
  import {UtilsTest,startAbility} from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    console.info("editableTitleBarSymbolPage beforeEach start");
    await UtilsTest.startAbility("com.acts.arkui.editableTitleBar.nowear.test.static", "EntryAbility")
  });
  ...
  afterEach(async (): Promise<void> => {
    await Utils.sleep(1000);
    console.info('editableTitleBarSymbolPage after each called');
  })
  ...
  // it body 中 await 未包裹 try-catch
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
  // UtilsTest/startAbility import 已删除
  ...
  // beforeAll 块已删除，Ability 启动已移至 OpenHarmonyTestRunner
  ...
  afterEach(async (): Promise<void> => {
    try {
      await Utils.sleep(1000);
    } catch (err) {
      console.info('editableTitleBarSymbolPage afterEach sleep err: ' + JSON.stringify(err));
    }
    console.info('editableTitleBarSymbolPage after each called');
  })
  ...
  // it body 已包裹 try-catch
  ```

## 二、Sleep 时长对齐

### 对应非 static 测试套

| static 目录名 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_editableTitleBar_nowear_static | ace_ets_module_editableTitleBar_nowear | 是 |

### 文件匹配情况

static 与非 static 测试套测试**不同的页面和功能**，文件名无法匹配：

| static 文件 | 非 static 文件 | 是否匹配 |
|---|---|---|
| editableTitleBarAccessibilityPage.test.ets | editableTitleBarSafeAreaEdges.test.ets | 否（不同页面） |
| editableTitleBarAccessibilityPage.test.ets | editableTitleBarSafeAreaTypes.test.ets | 否（不同页面） |
| editableTitleBarSymbolPage.test.ets | editableTitleBarSafeAreaEdges.test.ets | 否（不同页面） |
| editableTitleBarSymbolPage.test.ets | editableTitleBarSafeAreaTypes.test.ets | 否（不同页面） |

### Sleep 时长对比

尽管文件不匹配，仍对比已有 sleep 时长：

| 位置 | static 时长(ms) | 非 static 时长(ms) | 差异(ms) | 处理 |
|---|---|---|---|---|
| beforeEach pushUrl 后 | 2000 (CommonFunc.sleep) | 2000 (Utils.sleep) | 0 | 已一致 |
| beforeEach try-catch 后 | 无 | 1000 (Utils.sleep) | 1000 | 非 static 多出，文件不匹配，不修改 |
| it 第一个 sleep | 2000 (CommonFunc.sleep) | 2000 (driver.delayMs) | 0 | 已一致 |
| it 第二个 sleep | 1000 (CommonFunc.sleep) | 1000 (driver.delayMs) | 0 | 已一致 |
| afterEach | 1000 (Utils.sleep) | 1000 (Utils.sleep) | 0 | 已一致 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| 无 | - | - | - | - |

> 所有已存在的 sleep 时长均已一致（2000ms/1000ms），无需修改。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| 无 | - | - | - | - | - |

## 三、it 用例对齐

### it 用例清单

**static 用例（共 2 个）：**
| 文件 | it 用例名称 |
|---|---|
| editableTitleBarAccessibilityPage.test.ets | editableTitleBarAccessibilityPage_static_0100 |
| editableTitleBarSymbolPage.test.ets | editableTitleBarSymbolPage_static_0100 |

**非 static 用例（共 2 个）：**
| 文件 | it 用例名称 |
|---|---|
| editableTitleBarSafeAreaEdges.test.ets | editableTitleBarSafeAreaEdges_0100 |
| editableTitleBarSafeAreaTypes.test.ets | editableTitleBarSafeAreaTypes_0100 |

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| 无 | - | - | - | - |

> 匹配数：**0**

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 | 去除 _static 后名称 | 最近非 static 名称 | Levenshtein 距离 |
|---|---|---|---|---|
| editableTitleBarAccessibilityPage.test.ets | editableTitleBarAccessibilityPage_static_0100 | editableTitleBarAccessibilityPage_0100 | editableTitleBarSafeAreaEdges_0100 | 18 |
| editableTitleBarSymbolPage.test.ets | editableTitleBarSymbolPage_static_0100 | editableTitleBarSymbolPage_0100 | editableTitleBarSafeAreaTypes_0100 | 17 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 | 最近 static 名称（去除 _static） | Levenshtein 距离 |
|---|---|---|---|
| editableTitleBarSafeAreaEdges.test.ets | editableTitleBarSafeAreaEdges_0100 | editableTitleBarAccessibilityPage_0100 | 18 |
| editableTitleBarSafeAreaTypes.test.ets | editableTitleBarSafeAreaTypes_0100 | editableTitleBarSymbolPage_0100 | 17 |

> static 与非 static 测试套测试不同的页面功能（AccessibilityPage/SymbolPage vs SafeAreaEdges/SafeAreaTypes），it 用例名称无任何匹配。

## 总结

| 优化项 | 结果 |
|---|---|
| 修改文件数 | 3（OpenHarmonyTestRunner.ets + 2 个 .test.ets） |
| 启动方式优化 | 已完成（beforeAll 中 startAbility 移至 OpenHarmonyTestRunner.onRun） |
| await try-catch 包裹 | 已完成（afterEach + it 块） |
| Sleep 时长对齐 | 0 处修改（所有已有 sleep 时长已一致） |
| it 用例匹配数 | 0 / 2（static 与非 static 测试不同页面功能，无匹配用例） |
