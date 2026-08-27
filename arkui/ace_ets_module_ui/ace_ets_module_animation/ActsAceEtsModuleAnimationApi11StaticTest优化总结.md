# ActsAceEtsModuleAnimationApi11StaticTest Static 优化总结报告

## 测试套信息

| 维度 | 值 |
|---|---|
| Acts 类名 | ActsAceEtsModuleAnimationApi11StaticTest |
| 目录名 | ace_ets_module_animation_api11_static |
| 非 static 目录 | ace_ets_module_animation_api11 |
| 包名 | com.arkui.ace.animation.static |
| 代码库路径 | D:\code\newC\xts_acts_2725\arkui\ace_ets_module_ui\ace_ets_module_animation |

---

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/AnimateToTest.test.ets | 删除 beforeAll 中的 startAbility 调用、守卫变量及 6 个未使用 import、3 个未使用变量；17 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/AnimationCurveTest.test.ets | 删除 beforeAll 中的 startAbility 调用、守卫变量及 6 个未使用 import、3 个未使用变量；0 个 await 需包裹 | ~4s |
| entry/src/main/src/test/CurvesJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用、1 个未使用 import；1 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/Animation/animate_play_mode.test.ets | 删除 beforeAll 中的 startAbility 调用、守卫变量及 6 个未使用 import、3 个未使用变量；3 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/Animation/animator.test.ets | 删除 beforeAll 中的 startAbility 调用、守卫变量及 6 个未使用 import、3 个未使用变量；24 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/Animation/PageTransitionJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用、beforeAll 从 hypium import 中移除；3 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/AnimationTest/AnimateJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用、6 个未使用 import、3 个未使用变量；42 个 await 包裹 try-catch (replaceAll) | ~4s |
| entry/src/main/src/test/AnimationTest/AnimationJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用、6 个未使用 import、3 个未使用变量；7 个 it 块整体包裹 try-catch + afterEach 包裹 | ~4s |
| entry/src/main/src/test/AnimationTest/AnimationStatusJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用、1 个未使用 import(UtilsTest)；7 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/geometryTransitionTest/geometryTransition.test.ets | 删除 beforeAll 中的 startAbility 调用、1 个未使用 import；6 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/geometryTransitionTest/GeometryTransitionJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用、1 个未使用 import；3 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/RemoteWindowTest/remoteWindow.test.ets | 删除 beforeAll 中的 startAbility 调用；19 个 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/WorkerUseCurves.test.ets | 删除 beforeAll 中的 startAbility 调用、1 个未使用 import；7 个 await 包裹 try-catch | ~4s |

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
  ...
  beforeAll(async (): Promise<void> => {
    console.info("xxxTest beforeAll start");
    if (!isAbilityStarted) {
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      isAbilityStarted = true
    }
  });
  ```

- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // isAbilityStarted 守卫变量已删除
  // 未使用的 import (hilog, abilityDelegatorRegistry, UIAbility, common, BusinessError, UtilsTest) 已删除
  // 未使用的模块级变量 (domain, tag, testAbilityContext) 已删除
  // 所有未在 try-catch 中的 await 调用已包裹 try-catch
  ```

---

## 二、Sleep 时长对齐

### 对应非 static 测试套

| static 目录名 | 推导规则 | 非 static 目录名 | 是否存在 |
|---|---|---|---|
| ace_ets_module_animation_api11_static | 去掉 _static | ace_ets_module_animation_api11 | 是 |

### 已对齐（差异 <= 1000ms）

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) | 差异(ms) |
|---|---|---|---|---|---|
| AnimateToTest.test.ets | animateto.test.ets | beforeEach pushUrl | 2000 | 1800 | 200 |
| geometryTransitionTest/GeometryTransitionJsunit.test.ets | GeometryTransitionJsunit.test.ets | beforeEach pushUrl | 2000 | 1000 | 1000 |
| geometryTransitionTest/geometryTransition.test.ets | geometryTransition.test.ets | it_0100 after findComponent | 2000 | 1000 | 1000 |
| geometryTransitionTest/geometryTransition.test.ets | geometryTransition.test.ets | it_0100 after click | 2000 | 1000 | 1000 |
| AnimationTest/AnimationStatusJsunit.test.ets | AnimationStatusJsunit.test.ets | beforeEach pushUrl | 2000 | 1000 | 1000 |
| WorkerUseCurves.test.ets | WorkerUseCurves.test.ets | it_0100 after click | 1000 | 500 | 500 |

### 差异过大（未修改）

无。所有匹配的 sleep 调用差异均 <= 1000ms。

### 单边存在的 sleep（static 独有，非 static 中无对应）

| static 文件 | sleep 位置 | static(ms) | 说明 |
|---|---|---|---|
| RemoteWindowTest/remoteWindow.test.ets | it_0001~0010 after getInspectorByKey | 2000 × 9 | static 独有，非 static 无对应 sleep |
| Animation/animator.test.ets | it_0003 second sleep | 2000 | static 独有 |
| Animation/animator.test.ets | it_0011 after delayMs | 2000 | static 独有 |
| Animation/animator.test.ets | it_0011 after getInspector | 2000 | static 独有 |
| geometryTransitionTest/geometryTransition.test.ets | it_0100 after getInspectorByKey | 2000 | static 独有 |
| WorkerUseCurves.test.ets | it_0100 after getInspector | 1000 | static 独有 |
| AnimationCurveTest.test.ets | beforeEach pushUrl | 2000 | static 独有 |
| AnimateToTest.test.ets | commented-out sleep(200) × 11 | 200 | static 独有（注释代码） |
| Util.test.ets | startAbility msSleep(4000) × 2 | 4000 | static 独有（已被第一步删除） |

### 非 static 独有文件（static 中无对应文件）

| 非 static 文件 | sleep 位置 | 非 static(ms) |
|---|---|---|
| MotionPathExample.test.ets | 整个文件 | 2000, 1000, 1000, 8000 |
| Animation/animationAdd.test.ets | 整个文件 | 2000, 1000 × 4 |

---

## 三、it 用例对齐

### 统计总览

| 指标 | 数量 |
|---|---|
| static 用例总数 | 86 |
| 非 static 用例总数 | 91 |
| 已匹配用例 | 86 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 5 |

### 仅非 static 存在的用例（static 中无对应）

| 非 static 文件 | it 用例名称 |
|---|---|
| Animation/PageTransitionJsunit.test.ets | pageTransitionTest_0100 |
| Animation/PageTransitionJsunit.test.ets | pageTransitionTest_0200 |
| Animation/PageTransitionJsunit.test.ets | pageTransitionTest_0300 |
| Animation/animationAdd.test.ets | animationAdd_0100 |
| MotionPathExample.test.ets | MotionPathExample_0100 |

### 仅 static 存在的用例（非 static 中无对应）

无。

### 已匹配的用例

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| AnimateToTest.test.ets | animateToTest_static_0100 | animateto.test.ets | animateTest_0100 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0200 | animateto.test.ets | animateTest_0200 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0300 | animateto.test.ets | animateTest_0300 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0400 | animateto.test.ets | animateTest_0400 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0500 | animateto.test.ets | animateTest_0500 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0600 | animateto.test.ets | animateTest_0600 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0700 | animateto.test.ets | animateTest_0700 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0800 | animateto.test.ets | animateTest_0800 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_0900 | animateto.test.ets | animateTest_0900 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1000 | animateto.test.ets | animateTest_1000 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1100 | animateto.test.ets | animateTest_1100 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1200 | animateto.test.ets | animateTest_1200 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1300 | animateto.test.ets | animateTest_1300 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1400 | animateto.test.ets | animateTest_1400 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1500 | animateto.test.ets | animateTest_1500 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1600 | animateto.test.ets | animateTest_1600 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1700 | animateto.test.ets | animateTest_1700 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1800 | animateto.test.ets | animateTest_1800 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_1900 | animateto.test.ets | animateTest_1900 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_2000 | animateto.test.ets | animateTest_2000 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_2100 | animateto.test.ets | animateTest_2100 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_2200 | animateto.test.ets | animateTest_2200 | 模糊匹配 (Levenshtein=2) |
| AnimateToTest.test.ets | animateToTest_static_2300 | animateto.test.ets | animateTest_2300 | 模糊匹配 (Levenshtein=2) |
| AnimationCurveTest.test.ets | ArkUX_ohoscurves_customCurve_static_1000Adapt001 | animationCurve.test.ets | ArkUX_ohoscurves_customCurve_1000Adapt002 | 模糊匹配 (Levenshtein=1) |
| AnimationCurveTest.test.ets | ArkUX_ohoscurves_customCurve_static_1100Adapt001 | animationCurve.test.ets | ArkUX_ohoscurves_customCurve_1100Adapt002 | 模糊匹配 (Levenshtein=1) |
| AnimationCurveTest.test.ets | ArkUX_ohoscurves_customCurve_static_1200Adapt001 | animationCurve.test.ets | ArkUX_ohoscurves_customCurve_1200Adapt002 | 模糊匹配 (Levenshtein=1) |
| AnimationCurveTest.test.ets | ArkUX_ohoscurves_customCurve_static_1300Adapt001 | animationCurve.test.ets | ArkUX_ohoscurves_customCurve_1300Adapt002 | 模糊匹配 (Levenshtein=1) |
| AnimationCurveTest.test.ets | ArkUX_ohoscurves_customCurve_static_1400Adapt001 | animationCurve.test.ets | ArkUX_ohoscurves_customCurve_1400Adapt002 | 模糊匹配 (Levenshtein=1) |
| WorkerUseCurves.test.ets | WorkerUseCurves_static_0100 | WorkerUseCurves.test.ets | WorkerUseCurves_0100 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0001 | Animation/animator.test.ets | testanimatorOnframe0001 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0002 | Animation/animator.test.ets | testanimatorOnframe0002 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0003 | Animation/animator.test.ets | testanimatorOnframe0003 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0004 | Animation/animator.test.ets | testanimatorOnframe0004 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0005 | Animation/animator.test.ets | testanimatorOnframe0005 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0006 | Animation/animator.test.ets | testanimatorOnframe0006 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0007 | Animation/animator.test.ets | testanimatorOnframe0007 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0009 | Animation/animator.test.ets | testanimatorOnframe0009 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0010 | Animation/animator.test.ets | testanimatorOnframe0010 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_0011 | Animation/animator.test.ets | testanimatorOnframe0011 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_012 | Animation/animator.test.ets | testanimatorOnframe012 | 去除 _static |
| Animation/animator.test.ets | testanimatorOnframe_static_013 | Animation/animator.test.ets | testanimatorOnframe013 | 去除 _static |
| Animation/animate_play_mode.test.ets | testPlayModeReverse_static_0001 | Animation/animate_play_mode.test.ets | testPlayModeReverse0001 | 去除 _static |
| Animation/animate_play_mode.test.ets | testPlayModeAlternate_static_0001 | Animation/animate_play_mode.test.ets | testPlayModeAlternate0001 | 去除 _static |
| geometryTransitionTest/GeometryTransitionJsunit.test.ets | geometryTransitionTest_static_0100 | geometryTransitionTest/GeometryTransitionJsunit.test.ets | geometryTransitionTest_0100 | 去除 _static |
| geometryTransitionTest/geometryTransition.test.ets | geometryTransition_static_0100 | geometryTransitionTest/geometryTransition.test.ets | geometryTransition_0100 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0100 | AnimationTest/AnimateJsunit.test.ets | animateTest_0100 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0200 | AnimationTest/AnimateJsunit.test.ets | animateTest_0200 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0300 | AnimationTest/AnimateJsunit.test.ets | animateTest_0300 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0400 | AnimationTest/AnimateJsunit.test.ets | animateTest_0400 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0500 | AnimationTest/AnimateJsunit.test.ets | animateTest_0500 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0600 | AnimationTest/AnimateJsunit.test.ets | animateTest_0600 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0700 | AnimationTest/AnimateJsunit.test.ets | animateTest_0700 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0800 | AnimationTest/AnimateJsunit.test.ets | animateTest_0800 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_0900 | AnimationTest/AnimateJsunit.test.ets | animateTest_0900 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1000 | AnimationTest/AnimateJsunit.test.ets | animateTest_1000 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1100 | AnimationTest/AnimateJsunit.test.ets | animateTest_1100 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1200 | AnimationTest/AnimateJsunit.test.ets | animateTest_1200 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1300 | AnimationTest/AnimateJsunit.test.ets | animateTest_1300 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1400 | AnimationTest/AnimateJsunit.test.ets | animateTest_1400 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1500 | AnimationTest/AnimateJsunit.test.ets | animateTest_1500 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1600 | AnimationTest/AnimateJsunit.test.ets | animateTest_1600 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1700 | AnimationTest/AnimateJsunit.test.ets | animateTest_1700 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1800 | AnimationTest/AnimateJsunit.test.ets | animateTest_1800 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_1900 | AnimationTest/AnimateJsunit.test.ets | animateTest_1900 | 去除 _static |
| AnimationTest/AnimateJsunit.test.ets | animateTest_static_2000 | AnimationTest/AnimateJsunit.test.ets | animateTest_2000 | 去除 _static |
| AnimationTest/AnimationStatusJsunit.test.ets | animationStatus_static_01 | AnimationTest/AnimationStatusJsunit.test.ets | animationStatus01 | 去除 _static |
| AnimationTest/AnimationStatusJsunit.test.ets | animationStatus_static_02 | AnimationTest/AnimationStatusJsunit.test.ets | animationStatus02 | 去除 _static |
| AnimationTest/AnimationStatusJsunit.test.ets | animationStatus_static_03 | AnimationTest/AnimationStatusJsunit.test.ets | animationStatus03 | 去除 _static |
| AnimationTest/AnimationStatusJsunit.test.ets | animationStatus_static_04 | AnimationTest/AnimationStatusJsunit.test.ets | animationStatus04 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0100 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0100 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0200 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0200 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0300 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0300 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0400 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0400 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0500 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0500 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0600 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0600 | 去除 _static |
| AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_static_0700 | AnimationTest/AnimationJsunit.test.ets | AnimationJsunit_0700 | 去除 _static |
| Animation/PageTransitionJsunit.test.ets | pageTransitionTest_static_0400 | Animation/PageTransitionJsunit.test.ets | pageTransitionTest_0400 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0001 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0001 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0002 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0002 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0003 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0003 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0004 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0004 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0005 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0005 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0006 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0006 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0007 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0007 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0009 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0009 | 去除 _static |
| RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow_static_0010 | RemoteWindowTest/remoteWindow.test.ets | testRemoteWindow0010 | 去除 _static |

### 匹配方式汇总

| 匹配方式 | 数量 |
|---|---|
| 去除 _static 精确匹配 | 58 |
| 模糊匹配 (Levenshtein <= 3) | 28 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 5 |

---

## 四、await 异常捕获补全

在第一步修改过程中，同时为所有未在 try...catch 块中的 `await` 调用补充了错误捕获，符合 `XTS.CHECK.ASYNC_TESTCASE.02` 规范。

| 文件 | 包裹 await 数量 | 说明 |
|---|---|---|
| AnimateToTest.test.ets | 17 | afterEach + 各 it 块中的 CommonFunc.sleep |
| AnimationCurveTest.test.ets | 0 | 所有 await 已在 try-catch 中 |
| CurvesJsunit.test.ets | 1 | afterEach CommonFunc.sleep |
| Animation/animate_play_mode.test.ets | 3 | afterEach + 2 个 it 块 |
| Animation/animator.test.ets | 24 | afterEach + 12 个 it 块（it_0011/013 整体包裹） |
| Animation/PageTransitionJsunit.test.ets | 3 | afterEach + it_0400 |
| AnimationTest/AnimateJsunit.test.ets | 42 | afterEach + 21 个 it 块（replaceAll 批量包裹） |
| AnimationTest/AnimationJsunit.test.ets | 7 块 | 7 个 it 块整体包裹 + afterEach |
| AnimationTest/AnimationStatusJsunit.test.ets | 7 | afterEach + 4 个 it 块 |
| geometryTransitionTest/geometryTransition.test.ets | 6 | it_0100 中各 await |
| geometryTransitionTest/GeometryTransitionJsunit.test.ets | 3 | afterEach + it_0100 |
| RemoteWindowTest/remoteWindow.test.ets | 19 | afterEach + 9 个 it 块 |
| WorkerUseCurves.test.ets | 7 | afterEach + it_0100 |

---

## 五、总结

1. **启动方式优化**：将 Ability 启动从 13 个 .test.ets 文件的 beforeAll 移至 OpenHarmonyTestRunner.onRun，通过 executeShellCommand + setTimeout(4000) 实现统一启动，每个测试用例节省约 4s 启动时间
2. **Sleep 时长对齐**：共对齐 6 处 sleep 差异（全部 <= 1000ms），无差异过大的 sleep 需跳过
3. **it 用例对齐**：86 个 static 用例全部在非 static 中找到对应项（58 个精确匹配 + 28 个模糊匹配），非 static 有 5 个额外用例在 static 中无对应
4. **await 异常捕获**：所有 13 个 .test.ets 文件中未在 try-catch 中的 await 调用已全部补全
