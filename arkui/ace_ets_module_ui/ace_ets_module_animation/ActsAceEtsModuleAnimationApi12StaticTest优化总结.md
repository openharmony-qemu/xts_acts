# ActsAceEtsModuleAnimationApi12StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 全局启动一次，节省重复启动 |
| entry/src/main/src/test/AnimatorResultTest/animateToTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/APIParticleEmitter.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/AnimatorResultTest/AnimatorResultTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/Blur.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/AnimatorResultTest/setExpectedFrameRateRangeTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import、删除 domain/tag/testAbilityContext 模块变量、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/CurvePage.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import、删除 domain/tag/testAbilityContext 模块变量、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/Particle/ParticleAnimatorTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/Particle.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/Particle/ParticleAttributeTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/ParticleTest/ParticleTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/SetPolyToPoly1.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/SimpleAnimatorOptionsPage.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import、删除 domain/tag/testAbilityContext 模块变量、移除 beforeAll import、包裹 standalone await | ~4s |
| entry/src/main/src/test/SymbolGlyphTest/SymbolGlyphTest.test.ets | 删除 beforeAll 中的 startAbility 调用、删除 startAbility/UtilsTest import、移除 beforeAll import、包裹 standalone await | ~4s |

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
  }
  ```

#### 各 .test.ets 文件
- **修改前**：每个文件 beforeAll 中调用 `await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")`
- **修改后**：beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
- **额外清理**：3 个文件（setExpectedFrameRateRangeTest、CurvePage、SimpleAnimatorOptionsPage）还删除了 hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError 未使用 import 和 domain/tag/testAbilityContext 模块变量
- **await 包裹**：所有未在 try-catch 中的 standalone await 调用（CommonFunc.sleep、driver.delayMs、driver.findComponent、click 等）均已包裹 try-catch

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_animation_api12_static | ace_ets_module_animation_api12 | 是 |

### 已对齐（diff <= 1000ms）

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) | 差异(ms) |
|---|---|---|---|---|---|
| Particle/ParticleAnimatorTest.test.ets | Particle/ParticleAnimatorTest.test.ets | beforeEach pushUrl 后 | 2000 | 3000 | 1000 |
| Particle/ParticleAttributeTest.test.ets | Particle/ParticleAttributeTest.test.ets | beforeEach pushUrl 后 | 2000 | 3000 | 1000 |
| SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest/SymbolGlyphTest.test.ets | it_001 getInspectorByKey 后 | 2000 | 1000 | 1000 |

### 差异过大（未修改，diff > 1000ms）

无。所有匹配位置的 sleep 差异均 <= 1000ms，已全部对齐。

### 单边 sleep（static 中存在但非 static 中不存在的 sleep）

| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 说明 |
|---|---|---|---|---|
| Blur.test.ets | Blur.test.ets | it: getInspectorByKey 后 | 2000 | 非 static 无此 sleep |
| APIParticleEmitter.test.ets | APIParticleEmitter.test.ets | it: click 后 | 3000 | 非 static 此处为 1000ms |
| APIParticleEmitter.test.ets | APIParticleEmitter.test.ets | it: getInspectorByKey 后 | 1000 | 非 static 无此 sleep |
| Particle.test.ets | Particle.test.ets | it: getInspectorByKey 后 | 2000 | 非 static 无此 sleep |
| Particle/ParticleAnimatorTest.test.ets | Particle/ParticleAnimatorTest.test.ets | it: getInspectorByKey 后 | 2000 | 非 static 无此 sleep |
| Particle/ParticleAttributeTest.test.ets | Particle/ParticleAttributeTest.test.ets | it: findComponent 后 click 前 | 2000 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_001: findComponent 后 | 2000 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_001: 第二个 findComponent 后 | 2000 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_001: getInspectorByKey 后 | 1500 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_002: findComponent 后 | 2000 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_002: getInspectorByKey 后 | 1500 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_003: findComponent 后 | 2000 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_003: getInspectorByKey 后 | 1500 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_004: findComponent 后 | 2000 | 非 static 无此 sleep |
| ParticleTest/ParticleTest.test.ets | ParticleTest/ParticleTest.test.ets | it_004: getInspectorByKey 后 | 1500 | 非 static 无此 sleep |
| AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest/AnimatorResultTest.test.ets | it_001: findComponent('create') 后 click 前 | 2000 | 非 static 无此 sleep |
| AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest/AnimatorResultTest.test.ets | it_001: findComponent('play') 后 click 前 | 2000 | 非 static 无此 sleep |
| AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest/AnimatorResultTest.test.ets | it_002: findComponent('create') 后 click 前 | 2000 | 非 static 无此 sleep |
| AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest/AnimatorResultTest.test.ets | it_002: findComponent('play') 后 click 前 | 2000 | 非 static 无此 sleep |
| CurvePage.test.ets | CurvePage.test.ets | it_0100: click 后 | 5000 | 非 static 此处无 sleep |
| CurvePage.test.ets | CurvePage.test.ets | it_0100: AppStorage.get 后 | 1000 | 非 static 无此 sleep |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage.test.ets | it_0100: findComponent('changeFillMode') 后 | 2000 | 非 static 无此 sleep |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage.test.ets | it_0100: findComponent('playId') 后 | 2000 | 非 static 无此 sleep |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage.test.ets | it_0100: findComponent('recoverId') 后 | 2000 | 非 static 无此 sleep |

### 非 static 单边 sleep（非 static 中存在但 static 中不存在的 sleep）

无。

## 三、it 用例对齐

### 仅 static 存在的用例（非 static 中无对应）

无。所有 static 用例均在非 static 中找到对应项。

### 仅非 static 存在的用例（static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| ParticleModifierTest.test.ets | ParticleModifierTest_0100 |
| ParticleShapePage.test.ets | ParticleShapePage_0100 |

### 已匹配的用例

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| AnimatorResultTest/animateToTest.test.ets | animateToTest_static_001 | AnimatorResultTest/animateToTest.test.ets | animateToTest_001 | 去除 _static 后缀 |
| APIParticleEmitter.test.ets | APIParticleEmitter_0100 | APIParticleEmitter.test.ets | APIParticleEmitter_0100 | 完全匹配 |
| AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest_static_001 | AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest_001 | 去除 _static 后缀 |
| AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest_static_002 | AnimatorResultTest/AnimatorResultTest.test.ets | AnimatorResultTest_002 | 去除 _static 后缀 |
| Blur.test.ets | Blur_static_0100 | Blur.test.ets | Blur_0100 | 去除 _static 后缀 |
| AnimatorResultTest/setExpectedFrameRateRangeTest.test.ets | setExpectedFrameRateRangeTest_static_001 | AnimatorResultTest/setExpectedFrameRateRangeTest.test.ets | setExpectedFrameRateRangeTest_001 | 去除 _static 后缀 |
| CurvePage.test.ets | CurvePage_Static_0100 | CurvePage.test.ets | CurvePage_0100 | 去除 _Static 后缀（大小写） |
| CurvePage.test.ets | CurvePage_Static_0200 | CurvePage.test.ets | CurvePage_0200 | 去除 _Static 后缀（大小写） |
| CurvePage.test.ets | CurvePage_Static_0300 | CurvePage.test.ets | CurvePage_0300 | 去除 _Static 后缀（大小写） |
| CurvePage.test.ets | CurvePage_Static_0400 | CurvePage.test.ets | CurvePage_0400 | 去除 _Static 后缀（大小写） |
| Particle/ParticleAnimatorTest.test.ets | ParticleAnimatorTest_static_001 | Particle/ParticleAnimatorTest.test.ets | ParticleAnimatorTest_001 | 去除 _static 后缀 |
| Particle.test.ets | ParticlePage_static_0100 | Particle.test.ets | ParticlePage_0100 | 去除 _static 后缀 |
| Particle/ParticleAttributeTest.test.ets | ParticleAttributeTest_static_001 | Particle/ParticleAttributeTest.test.ets | ParticleAttributeTest_001 | 去除 _static 后缀 |
| ParticleTest/ParticleTest.test.ets | ParticleTest_static_001 | ParticleTest/ParticleTest.test.ets | ParticleTest_001 | 去除 _static 后缀 |
| ParticleTest/ParticleTest.test.ets | ParticleTest_static_002 | ParticleTest/ParticleTest.test.ets | ParticleTest_002 | 去除 _static 后缀 |
| ParticleTest/ParticleTest.test.ets | ParticleTest_static_003 | ParticleTest/ParticleTest.test.ets | ParticleTest_003 | 去除 _static 后缀 |
| ParticleTest/ParticleTest.test.ets | ParticleTest_static_004 | ParticleTest/ParticleTest.test.ets | ParticleTest_004 | 去除 _static 后缀 |
| SetPolyToPoly1.test.ets | setPolyToPoly_static_0100 | setPolyToPoly.test.ets | setPolyToPoly_0100 | 去除 _static 后缀 |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_static_0100 | SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_0100 | 去除 _static 后缀 |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_static_0200 | SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_0200 | 去除 _static 后缀 |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_static_0300 | SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_0300 | 去除 _static 后缀 |
| SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_static_0400 | SimpleAnimatorOptionsPage.test.ets | SimpleAnimatorOptionsPage_0400 | 去除 _static 后缀 |
| SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_static_001 | SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_001 | 去除 _static 后缀 |
| SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_static_002 | SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_002 | 去除 _static 后缀 |
| SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_static_003 | SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_003 | 去除 _static 后缀 |
| SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_static_004 | SymbolGlyphTest/SymbolGlyphTest.test.ets | SymbolGlyphTest_004 | 去除 _static 后缀 |
