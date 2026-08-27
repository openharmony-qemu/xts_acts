# ActsAceEtsModuleCommonAttrsVisualApi12StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 统一启动，避免每文件重复启动 |
| entry/src/main/src/test/ForegroundEffectTest.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 UtilsTest import；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/visualEffectTest/visualEffect.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/visualEffectTest/motionBlur.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/backgroundImageTest/backgroundImageResizable.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/backgroundImageTest/backgroundBrightness.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/ImageEffectTest/fractionStops.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/ImageEffectTest/systemBarEffect1.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |
| entry/src/main/src/test/ImageEffectTest/freeze.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/UtilsTest import；删除 domain/tag/testAbilityContext 变量；移除 beforeAll 从 hypium import；包裹 standalone await | ~4s |

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
  let isAbilityStarted: boolean = false;
  // 或: let domain/tag/testAbilityContext 等变量
  ...
  beforeAll(async (): Promise<void> => {
    console.info("xxxTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api12.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // 未使用的 import (UtilsTest, hilog, abilityDelegatorRegistry, UIAbility, common, BusinessError) 已删除
  // 未使用的变量 (domain, tag, testAbilityContext) 已删除
  // beforeAll 已从 hypium import 中移除
  // standalone await 调用已包裹 try...catch
  ```

---

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 目录名 | 非 static 目录名 | 是否存在 |
|---|---|---|
| ace_ets_module_commonAttrsVisual_api12_static | ace_ets_module_commonAttrsVisual_api12 | 是 |

### 已对齐
所有 static 与非 static 匹配的 sleep 时长均已一致，无需修改。

| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 状态 |
|---|---|---|---|---|---|
| ForegroundEffectTest.test.ets | foregroundEffect.test.ets | afterEach | 1000 | 1000 | 已对齐 |
| ForegroundEffectTest.test.ets | foregroundEffect.test.ets | it_0100 #1 | 1000 | 1000 | 已对齐 |
| ForegroundEffectTest.test.ets | foregroundEffect.test.ets | it_0100 #2 | 1000 | 1000 | 已对齐 |
| ForegroundEffectTest.test.ets | foregroundEffect.test.ets | it_0100 #3 | 1000 | 1000 | 已对齐 |
| visualEffect.test.ets | visualEffect.test.ets | it_0100 #1 | 1000 | 1000 | 已对齐 |
| visualEffect.test.ets | visualEffect.test.ets | it_0200 #1 | 1000 | 1000 | 已对齐 |
| visualEffect.test.ets | visualEffect.test.ets | it_0300 #1 | 1000 | 1000 | 已对齐 |
| visualEffect.test.ets | visualEffect.test.ets | it_0400 #1 | 1000 | 1000 | 已对齐 |
| motionBlur.test.ets | motionBlur.test.ets | it_0100 | 1000 | 1000 | 已对齐 |
| backgroundImageResizable.test.ets | backgroundImageResizable.test.ets | beforeEach | 2000 | 2000 | 已对齐 |
| backgroundImageResizable.test.ets | backgroundImageResizable.test.ets | it_0100 | 1000 | 1000 | 已对齐 |
| backgroundBrightness.test.ets | backgroundBrightness.test.ets | beforeEach | 2000 | 2000 | 已对齐 |
| backgroundBrightness.test.ets | backgroundBrightness.test.ets | afterEach | 1000 | 1000 | 已对齐 |
| backgroundBrightness.test.ets | backgroundBrightness.test.ets | it_0100 #1 | 1000 | 1000 | 已对齐 |
| backgroundBrightness.test.ets | backgroundBrightness.test.ets | it_0100 #2 | 1000 | 1000 | 已对齐 |
| fractionStops.test.ets | fractionStops.test.ets | beforeEach | 2000 | 2000 | 已对齐 |
| fractionStops.test.ets | fractionStops.test.ets | afterEach | 1000 | 1000 | 已对齐 |
| fractionStops.test.ets | fractionStops.test.ets | it_0100 | 1000 | 1000 | 已对齐 |
| systemBarEffect1.test.ets | systemBarEffect1.test.ets | beforeEach | 2000 | 2000 | 已对齐 |
| systemBarEffect1.test.ets | systemBarEffect1.test.ets | afterEach | 1000 | 1000 | 已对齐 |
| systemBarEffect1.test.ets | systemBarEffect1.test.ets | it_0100 #1 | 1000 | 1000 | 已对齐 |
| systemBarEffect1.test.ets | systemBarEffect1.test.ets | it_0100 #2 | 1000 | 1000 | 已对齐 |
| freeze.test.ets | freeze.test.ets | beforeEach | 2000 | 2000 | 已对齐 |
| freeze.test.ets | freeze.test.ets | afterEach | 1000 | 1000 | 已对齐 |

### 差异过大（未修改）
无。

### 结构性差异说明（非时长差异，仅记录）
| static 文件 | 非 static 文件 | 说明 |
|---|---|---|
| visualEffect.test.ets | visualEffect.test.ets | static 每个 it 块多一个 sleep(1000)，非 static 每个 it 块仅 1 个 sleep(1000) |
| backgroundBrightness.test.ets | backgroundBrightness.test.ets | static it 块多一个 sleep(1000)，非 static it 块仅 1 个 sleep(1000) |
| freeze.test.ets | freeze.test.ets | static it 块有 sleep(4000)，非 static it 块无 sleep |
| ForegroundEffectTest.test.ets | foregroundEffect.test.ets | static beforeEach pushUrl 后无 sleep，非 static beforeEach pushUrl 后有 sleep(2000) |

---

## 三、it 用例对齐

### 已匹配的用例
共 11 个 static 用例全部匹配，匹配方式均为去除 `_static` 后缀后完全匹配。

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| ForegroundEffectTest.test.ets | foregroundEffect_static_0100 | foregroundEffect.test.ets | foregroundEffect_0100 | 去 _static |
| visualEffect.test.ets | visualEffectTest_static_0100 | visualEffect.test.ets | visualEffectTest_0100 | 去 _static |
| visualEffect.test.ets | foregroundFilterTest_static_0200 | visualEffect.test.ets | foregroundFilterTest_0200 | 去 _static |
| visualEffect.test.ets | backgroundFilterTest_static_0300 | visualEffect.test.ets | backgroundFilterTest_0300 | 去 _static |
| visualEffect.test.ets | compositingFilterTest_static_0400 | visualEffect.test.ets | compositingFilterTest_0400 | 去 _static |
| motionBlur.test.ets | motionBlurTest_static_0100 | motionBlur.test.ets | motionBlurTest_0100 | 去 _static |
| backgroundImageResizable.test.ets | backgroundImageResizableTest_static_0100 | backgroundImageResizable.test.ets | backgroundImageResizableTest_0100 | 去 _static |
| backgroundBrightness.test.ets | backgroundBrightness_static_0100 | backgroundBrightness.test.ets | backgroundBrightness_0100 | 去 _static |
| fractionStops.test.ets | fractionStops_static_0100 | fractionStops.test.ets | fractionStops_0100 | 去 _static |
| systemBarEffect1.test.ets | systemBarEffectTest_static_0100 | systemBarEffect1.test.ets | systemBarEffectTest_0100 | 去 _static |
| freeze.test.ets | freezeTest_static_0100 | freeze.test.ets | freezeTest_0100 | 去 _static |

### 仅 static 存在的用例（非 static 中无对应）
无。

### 仅非 static 存在的用例（static 中无对应）
无。

---

## 汇总

| 步骤 | 结果 |
|---|---|
| 启动方式优化 | 修改 9 个文件（1 个 OpenHarmonyTestRunner + 8 个 .test.ets） |
| Sleep 时长对齐 | 0 处修改（所有匹配 sleep 时长已一致） |
| it 用例对齐 | 11/11 用例匹配（100% 匹配率） |
