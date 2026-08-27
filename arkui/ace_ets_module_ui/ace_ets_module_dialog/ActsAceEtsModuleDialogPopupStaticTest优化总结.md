# ActsAceEtsModuleDialogPopupStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| popupColorMode/PopupOptionsColorModeTest.test.ets | 删除 beforeAll 中的 startAbility 调用，移除 UtilsTest/router 导入，beforeAll 从 hypium 导入移除，standalone await 包裹 try-catch | ~4s |
| popupColorMode/PopupCommonOptionsColorModeTest.test.ets | 同上 | ~4s |
| popupColorMode/CustomPopupOptionsColorModeTest.test.ets | 同上 | ~4s |
| popupLevelMode/PopupOptionsLevelModeTest.test.ets | 同上 | ~4s |
| popupLevelMode/PopupCommonOptionsLevelModeTest.test.ets | 同上 | ~4s |
| popupLevelMode/CustomPopupOptionsLevelModeTest.test.ets | 同上 | ~4s |
| popupBackgroundEffect/PopupOptionsBackgroundEffectTest.test.ets | 同上 | ~4s |
| popupBackgroundEffect/PopupCommonOptionsBackgroundEffectTest.test.ets | 同上 | ~4s |
| popupBackgroundEffect/CustomPopupOptionsBackgroundEffectTest.test.ets | 同上 | ~4s |
| popupSystemMaterial/PopupOptionsSystemMaterial.test.ets | 删除 beforeAll，移除 UtilsTest/abilityDelegatorRegistry/MatchPattern 导入，standalone await 包裹 try-catch | ~4s |
| popupSystemMaterial/PopupCommonOptionsSystemMaterial.test.ets | 同上 | ~4s |
| popupSystemMaterial/CustomPopupOptionsSystemMaterial.test.ets | 同上 | ~4s |
| popupSystemMaterial/SheetOptionsSystemMaterial.test.ets | 同上 | ~4s |
| popupSystemMaterial/TipsOptionsSystemMaterial.test.ets | 同上 | ~4s |
| dialogSystemMaterial/ShowToastOptions.test.ets | 同上 | ~4s |
| dialogSystemMaterial/ShowDialogOptionsSystemMaterial.test.ets | 同上 | ~4s |
| dialogSystemMaterial/BaseDialogOptionsSystemMaterial.test.ets | 同上 | ~4s |
| dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test.ets | 同上 | ~4s |
| dialogSystemMaterial/ActionSheetOptionsSystemMaterial.test.ets | 同上 | ~4s |
| dialogSystemMaterial/ActionMenuOptionsSystemMaterial.test.ets | 同上 | ~4s |
| dialogSystemMaterial/AlertDialogSystemMaterial.test.ets | 同上 | ~4s |
| PopupTest/popupTest.test.ets | 删除 beforeAll，移除 UtilsTest/abilityDelegatorRegistry 导入，afterEach await 包裹 try-catch | ~4s |
| PopupTest/PopupOptions.test.ets | 删除 beforeAll，移除 UtilsTest/abilityDelegatorRegistry/MatchPattern 导入 | ~4s |
| PopupTest/PopupNodeTest.test.ets | 同上 | ~4s |
| PopupTest/PopupCommon.test.ets | 将 beforeAll 中的导航代码移至 beforeEach，删除 startAbility，afterEach await 包裹 try-catch | ~4s |
| PopupTest/CustomPopupOptions.test.ets | 删除 beforeAll，移除 UtilsTest/abilityDelegatorRegistry/MatchPattern 导入 | ~4s |
| TipsOptionsTest/TipsOptions.test.ets | 删除 beforeAll，移除 UtilsTest/abilityDelegatorRegistry/MatchPattern 导入，afterEach await 包裹 try-catch | ~4s |
| uimaterial/UIMaterial.test.ets | 删除 beforeAll，移除 UtilsTest/abilityDelegatorRegistry/MatchPattern 导入，standalone await 包裹 try-catch | ~4s |
| uimaterial/ImmersiveStyleTest.test.ets | 同上 | ~4s |
| uimaterial/ImmersiveOptionsMaterialColor.test.ets | 同上 | ~4s |
| uimaterial/ImmersiveOptionsColorInvert.test.ets | 同上 | ~4s |
| uimaterial/ImmersiveOptionsApplyShadow.test.ets | 同上 | ~4s |

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

- **修改前**：
  ```typescript
  import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.dialog.popup.static', 'EntryAbility');
  });
  ```

- **修改后**：
  ```typescript
  import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // UtilsTest 导入已删除
  ```

- **standalone await 包裹 try-catch**（315 处，覆盖 21 个文件）：
  ```typescript
  // 修改前
  await CommonFunc.sleep(SLEEP_TIME);
  // 修改后
  try {
    await CommonFunc.sleep(SLEEP_TIME);
  } catch (err) {
    console.info('await err: ' + JSON.stringify(err));
  }
  ```

#### 导入清理统计

| 清理项 | 影响文件数 |
|---|---|
| 移除 beforeAll 从 hypium 导入 | 32 |
| 移除 UtilsTest 导入 | 32 |
| 移除 abilityDelegatorRegistry 导入 | 18 |
| 移除 MatchPattern 导入 | 17 |
| 移除 router 导入（未使用） | 6 |

## 二、Sleep 时长对齐

### 已对齐（差异 ≤ 1000ms）

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| popupColorMode/PopupOptionsColorModeTest.test.ets | popup/PopupColorMode.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupColorMode/PopupCommonOptionsColorModeTest.test.ets | popup/PopupColorMode.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupColorMode/CustomPopupOptionsColorModeTest.test.ets | popup/PopupColorMode.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupLevelMode/PopupOptionsLevelModeTest.test.ets | popup/PopupLevelModeTest.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupLevelMode/PopupCommonOptionsLevelModeTest.test.ets | popup/PopupLevelModeTest.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupLevelMode/CustomPopupOptionsLevelModeTest.test.ets | popup/PopupLevelModeTest.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupBackgroundEffect/PopupOptionsBackgroundEffectTest.test.ets | popupBackground/PopupBackgroundEffect.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupBackgroundEffect/PopupCommonOptionsBackgroundEffectTest.test.ets | popupBackground/PopupCommonOptionsBackgroundEffect.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupBackgroundEffect/CustomPopupOptionsBackgroundEffectTest.test.ets | popupBackground/CustomPopupOptionsBackgroundEffect.test.ets | navigatePage 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupSystemMaterial/PopupOptionsSystemMaterial.test.ets | popupSystemMaterial/PopupOptionsSystemMaterial.test.ets | beforeEach 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupSystemMaterial/PopupCommonOptionsSystemMaterial.test.ets | popupSystemMaterial/PopupCommonOptionsSystemMaterial.test.ets | beforeEach 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupSystemMaterial/CustomPopupOptionsSystemMaterial.test.ets | popupSystemMaterial/CustomPopupOptionsSystemMaterial.test.ets | beforeEach 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupSystemMaterial/SheetOptionsSystemMaterial.test.ets | popupSystemMaterial/SheetOptionsSystemMaterial.test.ets | beforeEach 页面导航 | 1000 (SLEEP_TIME) | 2000 |
| popupSystemMaterial/TipsOptionsSystemMaterial.test.ets | popupSystemMaterial/TipsOptionsSystemMaterial.test.ets | beforeEach 页面导航 | 1000 (SLEEP_TIME) | 2000 |

### 差异过大（未修改，差异 > 1000ms）

| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| uimaterial/UIMaterial.test.ets | uimaterial/UIMaterial.test.ets | beforeEach 页面导航 | 500 | 2000 | 1500 |
| uimaterial/ImmersiveStyleTest.test.ets | uimaterial/ImmersiveStyleTest.test.ets | beforeEach 页面导航 | 500 | 2000 | 1500 |
| uimaterial/ImmersiveOptionsMaterialColor.test.ets | uimaterial/ImmersiveOptionsMaterialColor.test.ets | beforeEach 页面导航 | 500 | 2000 | 1500 |
| uimaterial/ImmersiveOptionsColorInvert.test.ets | uimaterial/ImmersiveOptionsColorInvert.test.ets | beforeEach 页面导航 | 500 | 2000 | 1500 |
| uimaterial/ImmersiveOptionsApplyShadow.test.ets | uimaterial/ImmersiveOptionsApplyShadow.test.ets | beforeEach 页面导航 | 500 | 2000 | 1500 |
| popupSystemMaterial/TipsOptionsSystemMaterial.test.ets | popupSystemMaterial/TipsOptionsSystemMaterial.test.ets | it 块内 sleep | 500 | 1500 | 1000 |

### 对应非 static 测试套不存在

| static 文件 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| dialogSystemMaterial/ShowToastOptions.test.ets | ShowToastOptions.test.ets | 否 |
| dialogSystemMaterial/ShowDialogOptionsSystemMaterial.test.ets | ShowDialogOptionsSystemMaterial.test.ets | 否 |
| dialogSystemMaterial/BaseDialogOptionsSystemMaterial.test.ets | BaseDialogOptionsSystemMaterial.test.ets | 否 |
| dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test.ets | BaseDialogOptionsDisplayModeInSubWindow.test.ets | 否 |
| dialogSystemMaterial/ActionSheetOptionsSystemMaterial.test.ets | ActionSheetOptionsSystemMaterial.test.ets | 否 |
| dialogSystemMaterial/ActionMenuOptionsSystemMaterial.test.ets | ActionMenuOptionsSystemMaterial.test.ets | 否 |
| dialogSystemMaterial/AlertDialogSystemMaterial.test.ets | AlertDialogSystemMaterial.test.ets | 否 |
| PopupTest/PopupNodeTest.test.ets | PopupNodeTest.test.ets | 否 |
| PopupTest/CustomPopupOptions.test.ets | CustomPopupOptions.test.ets | 否 |
| PopupTest/PopupOptions.test.ets | PopupOptions.test.ets | 否 |
| PopupTest/popupTest.test.ets | PopupJsunit.test.ets | 可能（Dialog 目录） |
| TipsOptionsTest/TipsOptions.test.ets | TipsOptions.test.ets | 否 |

## 三、it 用例对齐

### 统计概览

| 指标 | 数量 |
|---|---|
| static it() 用例总数 | 191 |
| 非 static it() 用例总数 | 396 |
| 已匹配用例数 | 97 |
| 仅 static 存在用例数 | 94 |
| 仅非 static 存在用例数 | 331 |

### 匹配方式分布

| 匹配方式 | 数量 |
|---|---|
| 精确匹配 | 0 |
| 去除 _static 后缀匹配 | 0 |
| 模糊匹配（Levenshtein ≤ 3） | 97 |

### 已匹配的用例（部分示例）

| static 文件 | static it 名称 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|
| CustomPopupOptionsBackgroundEffectTest.test.ets | CustomPopupOptionsBackgroundEffect_0001 | CustomPopupOptionsBackgroundEffect_0100 | fuzzy(dist=2) |
| CustomPopupOptionsBackgroundEffectTest.test.ets | CustomPopupOptionsBackgroundEffect_0002 | CustomPopupOptionsBackgroundEffect_0200 | fuzzy(dist=2) |
| PopupCommonOptionsBackgroundEffectTest.test.ets | PopupCommonOptionsBackgroundEffect_0001 | PopupCommonOptionsBackgroundEffect_0100 | fuzzy(dist=2) |
| PopupOptionsBackgroundEffectTest.test.ets | PopupOptionsBackgroundEffect_0001 | PopupBackgroundEffect_0100 | fuzzy(dist=3) |
| PopupOptionsColorModeTest.test.ets | PopupOptionsColorMode_0001 | PopupColorMode_0100 | fuzzy(dist=3) |
| PopupOptionsLevelModeTest.test.ets | PopupOptionsLevelMode_0100 | PopupLevelModeTest_0100 | fuzzy(dist=3) |
| PopupOptionsSystemMaterial.test.ets | PopupOptionsSystemMaterial_0100 | PopupOptionsSystemMaterial_0100 | fuzzy(dist=3) |
| TipsOptionsSystemMaterial.test.ets | TipsOptionsSystemMaterial_0100 | TipsOptionsSystemMaterial_0100 | fuzzy(dist=3) |
| UIMaterial.test.ets | MaterialTypeTest_0100 | MaterialTypeTest_0100 | exact |
| UIMaterial.test.ets | MaterialStateTest_0100 | MaterialStateTest_0100 | exact |
| ImmersiveStyleTest.test.ets | ImmersiveStyleTest_0100 | ImmersiveStyleTest_0100 | exact |
| ImmersiveOptionsApplyShadow.test.ets | ImmersiveOptionsApplyShadow_0100 | ImmersiveOptionsApplyShadow_0100 | exact |

### 仅 static 存在的用例（非 static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| dialogSystemMaterial/ShowToastOptions.test.ets | ShowToastOptionsTest_Message_0100 |
| dialogSystemMaterial/ShowDialogOptionsSystemMaterial.test.ets | ShowDialogOptionsSystemMaterial_Message_0100 |
| dialogSystemMaterial/BaseDialogOptionsSystemMaterial.test.ets | BaseDialogOptionsSystemMaterial_0100 |
| dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test.ets | BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0100 |
| dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test.ets | BaseDialogOptionsDisplayModeInSubWindow_DialogDisplayMode_0200 |
| dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test.ets | BaseDialogOptionsDisplayModeInSubWindow_Menu_0300 |
| dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test.ets | BaseDialogOptionsDisplayModeInSubWindow_Menu_0400 |
| dialogSystemMaterial/ActionSheetOptionsSystemMaterial.test.ets | ActionSheetOptionsSystemMaterial_0100 |
| dialogSystemMaterial/ActionMenuOptionsSystemMaterial.test.ets | ActionMenuOptionsSystemMaterial_0100 |
| dialogSystemMaterial/AlertDialogSystemMaterial.test.ets | AlertDialogSystemMaterial_0100 |
| PopupTest/popupTest.test.ets | Popup_static_001 |
| TipsOptionsTest/TipsOptions.test.ets | tipsOptionsShowAtAnchor1 |
| TipsOptionsTest/TipsOptions.test.ets | tipsOptionsShowAtAnchor2 |
| PopupTest/PopupNodeTest.test.ets | (21 个用例，非 static 中无对应) |

### 仅非 static 存在的用例（static 中无对应）

共 331 个用例，主要分布在以下非 static 文件中：

| 文件 | 用例数 |
|---|---|
| bindPopupNullUndefined.test.ets | 10 |
| bindTipsTest1.test.ets | 1 |
| bindTipsTest2.test.ets | 1 |
| PopupJsunit.test.ets | 多个 |
| bindContentCoverNullUndefined.test.ets | 6 |
| bindContextMenuNull.test.ets | 4 |
| bindContextResponseNull.test.ets | 多个 |
| bindMenuNullUndefined.test.ets | 多个 |
| BindPopupJsunit.test.ets | 多个 |
| isShownContextMenuNull.test.ets | 多个 |
| arrowOffset.test.ets | 多个 |
| isVisible.test.ets | 多个 |
| PopupBackgroundBlurStyleOptions.test.ets | 多个 |
| CustomPopupOptionsBackgroundBlurStyleOptions.test.ets | 多个 |
| PopupCommonOptionsBackgroundBlurStyleOptions.test.ets | 多个 |
| openPopup.test.ets | 多个 |
| PromptActionNullAndUndefined/*.test.ets | 多个 |
| bindPopupOffset.test.ets | 多个 |

这些非 static 独有用例主要属于 NullAndUndefined 测试、BlurStyleOptions 测试、Menu 测试等，在 static 测试套中未实现对应用例。
