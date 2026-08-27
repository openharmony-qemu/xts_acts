# ActsAceEtsModuleDialogButtonStaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 全测试套仅需启动一次 |
| ButtonTest/Button.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（hilog, UIAbility, Want, abilityDelegatorRegistry, MouseButton, UiDirection, UtilsTest）；删除未使用变量（want, bundleName, delegator, abilityDelegator）；3 个 it 块 await 包裹 try-catch | ~4s |
| ButtonLabelStyleTest/ButtonLabelStyle.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（abilityDelegatorRegistry, Driver, UtilsTest）；afterEach sleep 包裹 try-catch | ~4s |
| ArcButtonTest/ArcButton.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（UtilsTest）；afterEach sleep 包裹 try-catch；2 个 it 块 await 包裹 try-catch | ~4s |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（UtilsTest）；afterEach sleep 包裹 try-catch | ~4s |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（UtilsTest）；afterEach sleep 包裹 try-catch | ~4s |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（UtilsTest）；afterEach sleep 包裹 try-catch | ~4s |
| SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test.ets | 删除 beforeAll 中的 startAbility 调用；删除未使用 import（UtilsTest）；afterEach sleep 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  ```
- **修改后**：
  ```typescript
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
  ```

#### 各 .test.ets 文件
- **修改前**：
  ```typescript
  let isAbilityStarted: boolean = false;
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.dialog.button.static', 'EntryAbility');
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **try-catch 包裹示例**：
  ```typescript
  // 修改前
  let buttonComponent = await driver.findComponent(ON.text('modifier', MatchPattern.CONTAINS));
  await (buttonComponent?.click() as Promise<void>);
  await Utils.sleep(500);

  // 修改后
  try {
    let buttonComponent = await driver.findComponent(ON.text('modifier', MatchPattern.CONTAINS));
    await (buttonComponent?.click() as Promise<void>);
    await Utils.sleep(500);
  } catch (err) {
    console.info('modifierTest err: ' + JSON.stringify(err));
    expect().assertFail();
  }
  ```

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 非 static 目录名 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_button_static | ace_ets_module_dialog_button | 是 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| ButtonTest/Button.test.ets | buttonTest/ButtonText.test.ets | modifier - click 后 UI 等待 | 1000 | 500 |
| ButtonTest/Button.test.ets | buttonTest/ButtonText.test.ets | modifier1 - click 后 UI 等待 | 1000 | 500 |
| ButtonTest/Button.test.ets | buttonTest/ButtonText.test.ets | modifierDiff - click 后 UI 等待 | 1000 | 500 |

> 说明：非 static 版本（ButtonText.test.ets）在 modifier/modifier1/modifierDiff 中使用 `setTimeout(() => { ... }, 500)` 延迟执行断言，等效延迟 500ms。static 版本原为 `Utils.sleep(1000)`，差异 500ms ≤ 1000ms，已对齐为 500ms。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| ButtonTest/Button.test.ets | buttonTest/ButtonText.test.ets | beforeEach - 页面加载等待 | 无 | 2000 | 结构差异 |

> 说明：非 static beforeEach 中有 `CommonFunc.sleep(2000)` 等待页面加载；static beforeEach 无 sleep（页面导航通过 `routerInstance.replaceUrl` 完成，初始 Ability 启动已由 OpenHarmonyTestRunner 的 `setTimeout(4000)` 统一处理）。此为结构差异，不单独对齐。

### 无匹配非 static 文件的 static 测试文件
| static 文件 | 说明 |
|---|---|
| ArcButtonTest/ArcButton.test.ets | 非 static 无 ArcButton 测试 |
| ButtonTest/ArcButtonEnum.test.ets | 非 static 无 ArcButton 枚举测试 |
| ButtonLabelStyleTest/ButtonLabelStyle.test.ets | 非 static 无 ButtonLabelStyle 测试 |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | 非 static 无 DialogV2ButtonTextAlign 测试 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | 非 static 无 DialogButtonOptionsTextAlign 测试 |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | 非 static 无 SegmentButtonV2 测试 |
| SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test.ets | 非 static 无 SegmentButton 测试 |

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| ButtonTest/Button.test.ets | shortText | buttonTest/ButtonText.test.ets | shortText | 完全匹配 |
| ButtonTest/Button.test.ets | longText | buttonTest/ButtonText.test.ets | longText | 完全匹配 |
| ButtonTest/Button.test.ets | longText1 | buttonTest/ButtonText.test.ets | longText1 | 完全匹配 |
| ButtonTest/Button.test.ets | modifier | buttonTest/ButtonText.test.ets | modifier | 完全匹配 |
| ButtonTest/Button.test.ets | modifier1 | buttonTest/ButtonText.test.ets | modifier1 | 完全匹配 |
| ButtonTest/Button.test.ets | modifierDiff | buttonTest/ButtonText.test.ets | modifierDiff | 完全匹配 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_inspector_position_bottom_edge_0100 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_position_0200 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_style_mode_0300 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_status_0400 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_label_0500 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_background_blur_style_0600 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_background_color_0700 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_shadow_color_0800 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_shadow_enabled_0900 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_font_size_1000 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_font_color_1100 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_pressed_font_color_1200 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_font_style_1300 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_font_family_1400 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_font_margin_1500 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_on_touch_1600 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_on_click_1700 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_progress_config_value_1800 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_progress_config_total_1900 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_progress_config_color_2000 |
| ArcButtonTest/ArcButton.test.ets | SUB_arkui_arc_button_options_progress_config_2100 |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonPositionBottomEdge |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonStyleModeEmphasizedLight |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonStyleModeEmphasizedDark |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonStyleModeNormalLight |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonStyleModeNormalDark |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonStatusPressed |
| ButtonTest/ArcButtonEnum.test.ets | arcButtonStatusDisabled |
| ButtonLabelStyleTest/ButtonLabelStyle.test.ets | buttonLabelStyleTextAlignStart |
| ButtonLabelStyleTest/ButtonLabelStyle.test.ets | buttonLabelStyleTextAlignCenter |
| ButtonLabelStyleTest/ButtonLabelStyle.test.ets | buttonLabelStyleTextAlignEnd |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | SUB_arkui_dialog_v2_button_text_align_page_loads_0100 |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | SUB_arkui_dialog_v2_button_text_align_advanced_dialog_v2_button_text_align_end_action_0200 |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | SUB_arkui_dialog_v2_button_text_align_inspector_open_button_node_0300 |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | SUB_arkui_dialog_v2_button_text_align_inspector_title_node_0400 |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | SUB_arkui_dialog_v2_button_text_align_app_storage_v2_align_key_cleared_before_case_0500 |
| DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test.ets | SUB_arkui_dialog_v2_button_text_align_driver_find_v2_open_stable_0600 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | SUB_arkui_dialog_button_options_text_align_page_loads_0100 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | SUB_arkui_dialog_button_options_text_align_primary_button_text_align_center_action_0200 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | SUB_arkui_dialog_button_options_text_align_inspector_open_button_node_0300 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | SUB_arkui_dialog_button_options_text_align_inspector_title_node_0400 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | SUB_arkui_dialog_button_options_text_align_app_storage_align_key_cleared_before_case_0500 |
| DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test.ets | SUB_arkui_dialog_button_options_text_align_driver_find_open_button_stable_0600 |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_page_loads_0100 |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_mounted_flag_0200 |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_tab_and_capsule_0300 |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_title_0400 |
| SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test.ets | SUB_arkui_segment_button_v2_enable_state_anim_driver_find_tab_text_a_0500 |
| SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test.ets | SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100 |
| SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test.ets | SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200 |
| SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test.ets | SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300 |
| SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test.ets | SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| button/ButtonApi1.test.ets | ButtonApi1_0100 |
| button/ButtonApi1.test.ets | ButtonApi1_0200 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0100 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0200 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0300 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0400 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0500 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0600 |
| buttonType/minFontScale.test.ets | buttonMinFontScaleTest_0700 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0100 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0200 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0300 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0400 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0500 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0600 |
| buttonType/maxFontScale.test.ets | buttonMaxFontScaleTest_0700 |
| button/buttonMaxFontSize.test.ets | buttonMaxFontSize_0100 |
| button/buttonMaxFontSize.test.ets | buttonMaxFontSize_0200 |
| button/buttonMaxFontSize.test.ets | buttonMaxFontSize_0300 |
| buttonType/ButtonTypeTest.test.ets | ButtonTypeTest_0100 |
| buttonTest/buttonControl.test.ets | buttonControlSize_0100 |
| buttonType/buttonTypeApi.test.ets | buttonType_0200 |
| buttonTest/Button3Jsunit.test.ets | testButton01 |
| buttonTest/Button3Jsunit.test.ets | testButton02 |
| buttonTest/Button3Jsunit.test.ets | testButton03 |
| buttonTest/Button3Jsunit.test.ets | testButton04 |
| buttonTest/Button3Jsunit.test.ets | testButton05 |
| buttonTest/Button3Jsunit.test.ets | testButton06 |
| buttonTest/Button3Jsunit.test.ets | testButton07 |
| buttonTest/Button3Jsunit.test.ets | testButton08 |
| buttonTest/Button3Jsunit.test.ets | testButton09 |
| buttonTest/Button3Jsunit.test.ets | testButton10 |
| buttonTest/Button3Jsunit.test.ets | testButton11 |
| buttonTest/Button3Jsunit.test.ets | testButton12 |
| buttonTest/Button3Jsunit.test.ets | testButton13 |
| buttonTest/Button3Jsunit.test.ets | testButton14 |
| buttonTest/Button3Jsunit.test.ets | testButton15 |
| button/ButtonApi2.test.ets | ButtonApi2_0100 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0100 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0200 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0300 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0400 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0500 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0600 |
| buttonTest/buttonEnabledJsunit.test.ets | buttonEnabledJsunit_0700 |
| buttonTest/ButtonJsunit2.test.ets | buttonGetInspectorByKey010 |
| buttonTest/ButtonJsunit2.test.ets | ButtonGetInspectorByKey020 |
| buttonTest/ButtonJsunit2.test.ets | ButtonGetInspectorByKey030 |
| buttonTest/ButtonHover.test.ets | ArkUX_Hover_stoppropagation_0100 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0100 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0200 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0300 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0400 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0500 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0600 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0700 |
| buttonTest/ButtonJsunit.test.ets | buttonJsunit_0800 |
| buttonTest/getcomponent.test.ets | ArkUX_Get_component_0010 |

## 统计汇总

| 指标 | 数量 |
|---|---|
| 修改文件数 | 8（1 个 OpenHarmonyTestRunner + 7 个 .test.ets） |
| Sleep 对齐数 | 3（Button.test.ets modifier/modifier1/modifierDiff: 1000ms → 500ms） |
| it 用例匹配数 | 6（完全匹配） |
| 仅 static 存在用例数 | 52 |
| 仅非 static 存在用例数 | 58 |
| static 用例总数 | 58 |
| 非 static 用例总数 | 64 |
