# ActsAceEtsModuleCommonStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 整个测试套只启动一次 Ability |
| entry/src/main/src/test/CommonMethodTest/CommonMethod.test.ets | 删除 beforeAll 中的 startAbility 调用，移除 UtilsTest import，移除 beforeAll from hypium import，beforeEach/afterEach sleep 包裹 try-catch | ~2s |
| entry/src/main/src/test/DismissReasonTest/DismissReason.test.ets | 同上 | ~2s |
| entry/src/main/src/test/ChildrenMainSizeTest/ChildrenMainSize.test.ets | 同上 | ~2s |
| entry/src/main/src/test/CommonTest/Common.test.ets | 删除 beforeAll 中的 msSleep+startAbility 调用，移除 UtilsTest import，移除 beforeAll from hypium import，afterEach sleep 包裹 try-catch | ~4s |
| entry/src/main/src/test/ContentCoverOptionsTest/ContentCoverOptions.test.ets | 同 CommonMethod | ~2s |
| entry/src/main/src/test/RotateAngleOptionsTest/RotateAngleOptions.test.ets | 同上 | ~2s |
| entry/src/main/src/test/LayoutPolicyTest/LayoutPolicy.test.ets | 删除 beforeAll 中的 msSleep+startAbility 调用，移除 UtilsTest import，移除 beforeAll from hypium import，afterEach sleep 包裹 try-catch | ~4s |
| entry/src/main/src/test/ResponseRegionTest/ResponseRegion.test.ets | 同 CommonMethod | ~2s |
| entry/src/main/src/test/DrawModifierTest/DrawModifier.test.ets | 同上 | ~2s |
| entry/src/main/src/test/SourceTypeTest/SourceType.test.ets | 同上 | ~2s |
| entry/src/main/src/test/ScrollResultTest/ScrollResult.test.ets | 同上 | ~2s |
| entry/src/main/src/test/ScrollableCommonMethodTest/ScrollableCommonMethod.test.ets | 同上 | ~2s |
| entry/src/main/src/test/AxisEventTest/AxisEvent.test.ets | 同上 | ~2s |
| entry/src/main/src/test/TextContentControllerBaseTest/TextContentControllerBase.test.ets | 同上 | ~2s |
| entry/src/main/src/test/DragEventTest/DragEvent.test.ets | 同上 | ~2s |
| entry/src/main/src/test/SweepGradientOptionsTest/SweepGradientOptions.test.ets | 同上 | ~2s |
| entry/src/main/src/test/TransitionEffectTest/TransitionEffect.test.ets | 同上 | ~2s |

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
- **修改前**（通用模式）：
  ```typescript
  import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '...';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.ets.module.common.static', 'EntryAbility');
  });
  beforeEach(async (): Promise<void> => {
    ...
    await CommonFunc.sleep(SLEEP_TIME);  // 未包裹 try-catch
    ...
  });
  afterEach(async (): Promise<void> => {
    await CommonFunc.sleep(SLEEP_TIME);  // 未包裹 try-catch
  });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, beforeEach, afterEach, Level } from '...';
  // UtilsTest import 已删除
  ...
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  beforeEach(async (): Promise<void> => {
    ...
    try {
      await CommonFunc.sleep(SLEEP_TIME);
    } catch (err) {
      console.info('xxxTest sleep err: ' + JSON.stringify(err));
    }
    ...
  });
  afterEach(async (): Promise<void> => {
    try {
      await CommonFunc.sleep(SLEEP_TIME);
    } catch (err) {
      console.info('xxxTest sleep err: ' + JSON.stringify(err));
    }
  });
  ```

#### Common.test.ets 和 LayoutPolicy.test.ets 特殊处理
这两个文件的 beforeAll 还包含 `UtilsTest.msSleep(2000)` 调用，已一并删除。afterEach 中的 `Utils.sleep(SLEEP_TIME)` 已包裹 try-catch。

---

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在

| static 测试套名称 | 推导的非 static 名称 | 是否存在 | 查找方式 |
|---|---|---|---|
| ace_ets_module_common_static | ace_ets_module_common | 否 | 目录名推导 + it 用例名反向查找 + bundleName 搜索 |

**查找过程**：
1. **第一级（目录名推导）**：去掉 `_static` 后缀，在同级目录 `D:\code\newC\xts_acts_2725\arkui\ace_ets_module_ui\` 下查找 `ace_ets_module_common`，不存在
2. **第二级（it 用例名反向查找）**：提取 static 用例名 `getTest_static_0100`、`layoutSafeAreaEdgeTopEnum`、`SweepGradientOpticmetricsColors`、`ignoresLayoutSafeAreaEdgesFieldSet`、`layoutPolicy_wrapContent_notNull`，去掉 `_static` 后缀在代码库中 Grep 搜索，均未在非 static 测试套中找到对应用例
3. **bundleName 搜索**：搜索 `com.arkui.ace.ets.module.common`（去掉 `.static`），在代码库的 `build-profile.json5` 等配置文件中未找到匹配

**结论**：非 static 测试套 `ace_ets_module_common` 不存在于代码库中，无法进行 sleep 时长对齐。

### 已对齐
（无 — 非 static 测试套不存在）

### 差异过大（未修改）
（无 — 非 static 测试套不存在）

---

## 三、it 用例对齐

### 非 static 测试套不存在
由于对应的非 static 测试套 `ace_ets_module_common` 不存在于代码库中，无法进行 it 用例名称匹配对齐。以下列出 static 测试套中的全部 48 个 it 用例，均归类为"仅 static 存在"。

### 仅 static 存在的用例（非 static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| CommonMethod.test.ets | responseRegionList |
| CommonMethod.test.ets | backgroundColor |
| CommonMethod.test.ets | materialFilter |
| CommonMethod.test.ets | transform3D |
| CommonMethod.test.ets | bindContextMenuWithResponse |
| CommonMethod.test.ets | accessibilityActionOptions |
| DismissReason.test.ets | slide |
| ChildrenMainSize.test.ets | getTest_static_0100 |
| ChildrenMainSize.test.ets | setTest_0100 |
| Common.test.ets | layoutSafeAreaEdgeTopEnum |
| Common.test.ets | layoutSafeAreaEdgeBottomEnum |
| Common.test.ets | ignoresLayoutSafeAreaEdgesFieldSet |
| Common.test.ets | commonPageRenders |
| ContentCoverOptions.test.ets | safeArea_0010 |
| RotateAngleOptions.test.ets | angleX |
| RotateAngleOptions.test.ets | angleY |
| RotateAngleOptions.test.ets | angleZ |
| RotateAngleOptions.test.ets | centerX |
| RotateAngleOptions.test.ets | centerY |
| RotateAngleOptions.test.ets | centerZ |
| RotateAngleOptions.test.ets | perspective |
| LayoutPolicy.test.ets | layoutPolicy_wrapContent_notNull |
| LayoutPolicy.test.ets | layoutPolicy_fixAtIdealSize_notNull |
| LayoutPolicy.test.ets | layoutPolicy_wrapContent_notEqualFixAtIdealSize |
| LayoutPolicy.test.ets | layoutPolicy_wrapContent_sameSingletonReference |
| LayoutPolicy.test.ets | layoutPolicy_fixAtIdealSize_sameSingletonReference |
| LayoutPolicy.test.ets | layoutPolicy_wrapContent_componentRender |
| LayoutPolicy.test.ets | layoutPolicy_fixAtIdealSize_componentRender |
| ResponseRegion.test.ets | responseRegionListTest_0100 |
| ResponseRegion.test.ets | responseRegionListTest_0200 |
| ResponseRegion.test.ets | responseRegionListTest_0300 |
| ResponseRegion.test.ets | responseRegionListTest_0400 |
| ResponseRegion.test.ets | responseRegionListTest_0500 |
| DrawModifier.test.ets | drawOverlay |
| SourceType.test.ets | key |
| SourceType.test.ets | joystick |
| ScrollResult.test.ets | setOffsetRemain |
| ScrollResult.test.ets | getOffsetRemain |
| ScrollableCommonMethod.test.ets | scrollBarColor |
| AxisEvent.test.ets | hasAxis |
| TextContentControllerBase.test.ets | setStyledPlaceholder |
| TextContentControllerBase.test.ets | deleteBackward |
| TextContentControllerBase.test.ets | scrollToVisible |
| DragEvent.test.ets | getDisplayId |
| SweepGradientOptions.test.ets | SweepGradientOpticmetricsColors |
| TransitionEffect.test.ets | identity |
| TransitionEffect.test.ets | slide |
| TransitionEffect.test.ets | slideSwitch |

### 仅非 static 存在的用例（static 中无对应）
（无 — 非 static 测试套不存在）

### 已匹配的用例
（无 — 非 static 测试套不存在，匹配数为 0）

---

## 汇总

| 步骤 | 结果 |
|---|---|
| STEP 1: 启动方式优化 | 修改 1 个 OpenHarmonyTestRunner.ets + 17 个 .test.ets 文件，删除所有 beforeAll 中的 startAbility 调用，Ability 启动统一移至 OpenHarmonyTestRunner.onRun，所有 beforeEach/afterEach 中的 standalone await 已包裹 try-catch |
| STEP 2: Sleep 时长对齐 | 非 static 测试套不存在，无法对齐（0 项对齐） |
| STEP 3: it 用例对齐 | 非 static 测试套不存在，48 个 static 用例均无对应（已匹配 0 项） |
