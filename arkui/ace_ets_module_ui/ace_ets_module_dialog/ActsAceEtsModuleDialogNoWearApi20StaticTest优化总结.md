# ActsAceEtsModuleDialogNoWearApi20StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/sliderTest/sliderTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var | ~4s |
| entry/src/main/src/test/sliderTest/sliderBlockColorTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var，包裹 sleep await | ~4s |
| entry/src/main/src/test/selectTest/selectShowInSubWindowTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var | ~4s |
| entry/src/main/src/test/selectTest/selectShowDefaultSelectedIconTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var | ~4s |
| entry/src/main/src/test/selectTest/selectOptionSymbolIconTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var，包裹 sleep await | ~4s |
| entry/src/main/src/test/selectTest/selectModifierTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var，包裹 sleep await | ~4s |
| entry/src/main/src/test/ratingTest/ratingStarStyleOptionsTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/var，包裹 sleep await | ~4s |
| entry/src/main/src/test/popupTest/bindPopupAvoidTargetTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，包裹 sleep await | ~4s |
| entry/src/main/src/test/promptActionTest/showActionMenuLifeTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，包裹 sleep await | ~4s |
| entry/src/main/src/test/promptActionTest/presentCustomDialogGetState.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，包裹 sleep await | ~4s |
| entry/src/main/src/test/promptActionTest/openPopupAvoidTargetTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，包裹 sleep await | ~4s |
| entry/src/main/src/test/promptActionTest/openCustomDialogWithControllerGetState.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，包裹 sleep await | ~4s |
| entry/src/main/src/test/customDialogTest/customDialogGetState.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，包裹 sleep await | ~4s |

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
  let domain: number = 0x0000;
  let tag: string = 'testTag';
  // ... 未使用的 import: hilog, abilityDelegatorRegistry, UIAbility, common, BusinessError, UtilsTest
  beforeAll(async (): Promise<void> => {
    console.info("xxxTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api20.static", "EntryAbility")
  });
  ```

- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // 未使用的 import 和模块级变量已清理
  // beforeAll 从 hypium import 中移除
  // 独立 await sleep 调用已包裹 try...catch
  ```

### try-catch 包裹详情

以下文件的独立 `await Utils.sleep(...)` / `await CommonFunc.sleep(...)` 调用已包裹 try-catch：

| 文件 | 包裹数量 | 包裹的 await 类型 |
|---|---|---|
| sliderBlockColorTest.test.ets | 3 | await Utils.sleep(SLEEP_TIME_1000) |
| selectOptionSymbolIconTest.test.ets | 8 | await Utils.sleep(SLEEP_TIME_500) |
| selectModifierTest.test.ets | 6 | await Utils.sleep(SLEEP_TIME_1000) |
| ratingStarStyleOptionsTest.test.ets | 6 | await Utils.sleep(SLEEP_TIME_1000) |
| bindPopupAvoidTargetTest.test.ets | 12 | await CommonFunc.sleep(SLEEP_TIME_1000) |
| openPopupAvoidTargetTest.test.ets | 6 | await CommonFunc.sleep(SLEEP_TIME_1000) |
| showActionMenuLifeTest.test.ets | 7 | await CommonFunc.sleep(SLEEP_TIME_1000) x6 + await CommonFunc.sleep(1000) x1 (afterEach) |
| presentCustomDialogGetState.test.ets | 4 | await Utils.sleep(SLEEP_TIME_1000) x3 + await CommonFunc.sleep(SLEEP_TIME_1000) x1 |
| openCustomDialogWithControllerGetState.test.ets | 4 | await Utils.sleep(SLEEP_TIME_3000) x3 + await CommonFunc.sleep(SLEEP_TIME_1000) x1 |
| customDialogGetState.test.ets | 6 | await Utils.sleep(SLEEP_TIME_1000) x4 + await CommonFunc.sleep(SLEEP_TIME_1000) x2 |

## 二、Sleep 时长对齐

### 对应非 static 测试套

| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_nowear_api20_static | ace_ets_module_dialog_nowear_api20 | 存在 |

### 已对齐

无。static 与非 static 匹配的文件中，static 版本 it 块内无 sleep 调用，无需对齐。

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

### 差异过大（未修改）

无。

### 文件匹配说明

static 测试套包含 13 个测试文件，非 static 测试套包含 4 个测试文件。两者测试内容差异较大：

| static 文件 | 非 static 文件 | 匹配情况 | sleep 对齐说明 |
|---|---|---|---|
| selectShowInSubWindowTest.test.ets | showInSubWindow.test.ets | 功能匹配 | static it 块内无 sleep 调用（仅 inspector 同步调用），非 static 有 Utils.sleep(1000)。无 sleep 需对齐 |
| selectShowDefaultSelectedIconTest.test.ets | showDefaultSelectedIcon.test.ets | 功能匹配 | static it 块内无 sleep 调用，非 static 有 Utils.sleep(1000)。无 sleep 需对齐 |
| sliderTest.test.ets | 无匹配 | - | - |
| sliderBlockColorTest.test.ets | 无匹配 | - | - |
| selectOptionSymbolIconTest.test.ets | 无匹配 | - | - |
| selectModifierTest.test.ets | 无匹配 | - | - |
| ratingStarStyleOptionsTest.test.ets | 无匹配 | - | - |
| bindPopupAvoidTargetTest.test.ets | 无匹配 | - | - |
| showActionMenuLifeTest.test.ets | 无匹配 | - | - |
| presentCustomDialogGetState.test.ets | 无匹配 | - | - |
| openPopupAvoidTargetTest.test.ets | 无匹配 | - | - |
| openCustomDialogWithControllerGetState.test.ets | 无匹配 | - | - |
| customDialogGetState.test.ets | 无匹配 | - | - |
| 无匹配 | bindSheetKeyboardAvoidMode.test.ets | - | - |
| 无匹配 | showAtAnchor.test.ets | - | - |

## 三、it 用例对齐

### 概况

- static 测试套 it 用例总数：38
- 非 static 测试套 it 用例总数：14
- 已匹配数量：0
- 仅 static 存在数量：38
- 仅非 static 存在数量：14

### 匹配方式说明

static 用例名使用 `_static_XXXX` 命名模式（如 `SliderTest_static_0100`），非 static 用例名使用 `_value_XXXX` 命名模式（如 `showInSubWindow_value_0001`）。去除 `_static` 后缀后，两者命名差异仍远超 Levenshtein<=3 模糊匹配阈值，无法匹配。

### 仅 static 存在的用例（非 static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| sliderTest.test.ets | SliderTest_static_0100 |
| sliderTest.test.ets | SliderTest_static_0200 |
| sliderTest.test.ets | SliderTest_static_0300 |
| sliderBlockColorTest.test.ets | SliderBlockColorTest_static_0100 |
| sliderBlockColorTest.test.ets | SliderBlockColorTest_static_0200 |
| sliderBlockColorTest.test.ets | SliderBlockColorTest_static_0300 |
| selectShowInSubWindowTest.test.ets | selectShowInSubWindow_static_0100 |
| selectShowInSubWindowTest.test.ets | selectShowInSubWindow_static_0200 |
| selectShowInSubWindowTest.test.ets | selectShowInSubWindow_static_0300 |
| selectShowDefaultSelectedIconTest.test.ets | selectShowDefaultSelectedIcon_static_0100 |
| selectShowDefaultSelectedIconTest.test.ets | selectShowDefaultSelectedIcon_static_0200 |
| selectShowDefaultSelectedIconTest.test.ets | selectShowDefaultSelectedIcon_static_0300 |
| selectOptionSymbolIconTest.test.ets | selectOptionSymbolIcon_static_0100 |
| selectModifierTest.test.ets | selectModifier_static_0100 |
| selectModifierTest.test.ets | selectModifier_static_0200 |
| selectModifierTest.test.ets | selectModifier_static_0300 |
| selectModifierTest.test.ets | selectModifier_static_0400 |
| selectModifierTest.test.ets | selectModifier_static_0500 |
| selectModifierTest.test.ets | selectModifier_static_0600 |
| selectModifierTest.test.ets | selectModifier_static_0700 |
| selectModifierTest.test.ets | selectModifier_static_0800 |
| ratingStarStyleOptionsTest.test.ets | RatingStarStyle_static_0100 |
| ratingStarStyleOptionsTest.test.ets | RatingStarStyle_static_0200 |
| ratingStarStyleOptionsTest.test.ets | RatingStarStyle_static_0300 |
| bindPopupAvoidTargetTest.test.ets | BindPopup_AvoidTargetPopup_0010 |
| bindPopupAvoidTargetTest.test.ets | BindPopup_AvoidTargetPopup_0020 |
| bindPopupAvoidTargetTest.test.ets | BindPopup_AvoidTargetPopup_0030 |
| bindPopupAvoidTargetTest.test.ets | BindPopup_AvoidTargetPopup_0040 |
| bindPopupAvoidTargetTest.test.ets | BindPopup_AvoidTargetPopup_0050 |
| bindPopupAvoidTargetTest.test.ets | BindPopup_AvoidTargetPopup_0060 |
| showActionMenuLifeTest.test.ets | showActionMenu_static_0010 |
| showActionMenuLifeTest.test.ets | showActionMenu_static_0020 |
| presentCustomDialogGetState.test.ets | PresentCustomDialogGetStateTest_static_0100 |
| openPopupAvoidTargetTest.test.ets | OpenPopup_AvoidTargetPopup_0010 |
| openPopupAvoidTargetTest.test.ets | OpenPopup_AvoidTargetPopup_0020 |
| openPopupAvoidTargetTest.test.ets | OpenPopup_AvoidTargetPopup_0030 |
| openCustomDialogWithControllerGetState.test.ets | OpenCustomDialogWithControllerGetStateTest_static_0100 |
| customDialogGetState.test.ets | CustomDialogGetStateTest_static_0100 |

### 仅非 static 存在的用例（static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| showInSubWindow.test.ets | showInSubWindow_value_0001 |
| showInSubWindow.test.ets | showInSubWindow_value_0002 |
| showInSubWindow.test.ets | showInSubWindow_value_0003 |
| showInSubWindow.test.ets | showInSubWindow_value_0004 |
| showDefaultSelectedIcon.test.ets | showDefaultSelectedIcon_value_0001 |
| showDefaultSelectedIcon.test.ets | showDefaultSelectedIcon_value_0002 |
| showDefaultSelectedIcon.test.ets | showDefaultSelectedIcon_value_0003 |
| showDefaultSelectedIcon.test.ets | showDefaultSelectedIcon_value_0004 |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_0100 |
| showAtAnchor.test.ets | showAtAnchor_value_0001 |
| showAtAnchor.test.ets | showAtAnchor_value_0002 |
| showAtAnchor.test.ets | showAtAnchor_value_0003 |
| showAtAnchor.test.ets | showAtAnchor_value_0004 |
| showAtAnchor.test.ets | showAtAnchor_value_0005 |

### 已匹配的用例

无匹配用例。static 与非 static 测试套的测试用例命名体系和测试内容完全不同，无法建立对应关系。

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| - | - | - | - | - |
