# ActsAceEtsModuleSliderStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/slider/trackColorMetrics.test.ets | 删除 beforeAll 中的 startAbility 调用及 msSleep(4000)；移除 7 个未使用 import（hilog、abilityDelegatorRegistry、UIAbility、common、BusinessError、UIContext、UtilsTest）；beforeAll 从 hypium import 移除；Utils.sleep(1000) 包裹 try-catch | ~4s |
| entry/src/main/src/test/slider/sliderCustomContentOptions.test.ets | 删除 beforeAll 中的 startAbility 调用；移除 UtilsTest import，从 @kit.TestKit import 移除 abilityDelegatorRegistry 和 MatchPattern；beforeAll 从 hypium import 移除；afterEach Utils.sleep 包裹 try-catch | ~4s |
| entry/src/main/src/test/slider/slider.test.ets | 删除 beforeAll 中的 startAbility 调用，将 beforeAll 中的路由导航逻辑移至 beforeEach；移除 UtilsTest import，从 @kit.TestKit import 移除 abilityDelegatorRegistry 和 MatchPattern；beforeAll 从 hypium import 移除；afterEach Utils.sleep 包裹 try-catch | ~4s |
| entry/src/main/src/test/ArcSliderTest/ArcSlider.test.ets | 删除 beforeAll 中的 startAbility 调用；移除 Want import、从 @kit.TestKit import 移除 abilityDelegatorRegistry、移除 UtilsTest import；删除 4 个未使用变量（want、bundleName、delegator、abilityDelegator）；beforeAll 从 hypium import 移除；afterEach Utils.sleep(300) 包裹 try-catch；it('arcSliderOptionsOnTouch') 中 4 个 await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner onRun end');
  ```
- **修改后**：
  ```typescript
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
  // trackColorMetrics.test.ets
  beforeAll(async (): Promise<void> => {
    console.info("trackColorMetrics beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.slider_static", "EntryAbility")
    await UtilsTest.msSleep(4000)
  });

  // sliderCustomContentOptions.test.ets
  beforeAll(async (): Promise<void> => {
    console.info("SliderCustomContentOptionsTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.slider_static", "EntryAbility");
  });

  // slider.test.ets
  beforeAll(async (): Promise<void> => {
    console.info("SliderTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.slider_static", "EntryAbility");
    // ...路由导航逻辑...
  });

  // ArcSlider.test.ets
  beforeAll(async (): Promise<void> => {
    console.info(`${LOG_TAG} beforeAll start`);
    await UtilsTest.startAbility('com.arkui.ace.slider_static', 'EntryAbility');
    console.info(`${LOG_TAG} beforeAll end`);
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // slider.test.ets 的路由导航逻辑移至 beforeEach
  // 所有未包裹 try-catch 的 standalone await 已补上 try-catch
  ```

### 删除的未使用 import 和变量汇总

| 文件 | 删除的 import | 删除的变量 |
|---|---|---|
| trackColorMetrics.test.ets | hilog, abilityDelegatorRegistry, UIAbility, common, BusinessError, UIContext(从 import 中移除), UtilsTest | 无 |
| sliderCustomContentOptions.test.ets | UtilsTest; abilityDelegatorRegistry 和 MatchPattern 从 @kit.TestKit import 移除 | 无 |
| slider.test.ets | UtilsTest; abilityDelegatorRegistry 和 MatchPattern 从 @kit.TestKit import 移除 | 无 |
| ArcSlider.test.ets | Want; abilityDelegatorRegistry 从 @kit.TestKit import 移除; UtilsTest | want, bundleName, delegator, abilityDelegator |

### try-catch 包裹汇总

| 文件 | 位置 | await 调用 |
|---|---|---|
| trackColorMetrics.test.ets | it('trackColorMetrics_static_001') | Utils.sleep(1000) |
| sliderCustomContentOptions.test.ets | afterEach | Utils.sleep(SLEEP_TIME) |
| slider.test.ets | afterEach | Utils.sleep(1000) |
| ArcSlider.test.ets | afterEach | Utils.sleep(300) |
| ArcSlider.test.ets | it('arcSliderOptionsOnTouch') | driver.delayMs(300), driver.findComponent(), comp?.click(), Utils.sleep(600) |

## 二、Sleep 时长对齐

### 对应非 static 测试套

| static 目录名 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_Slider_static | ace_ets_module_dialog_Slider | 是 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| slider/trackColorMetrics.test.ets | SliderTest/sliderTrackColorMetrics.test.ets | beforeEach pushUrl 后 | 2500 | 2000 |
| slider/slider.test.ets | SliderTest/slider.test.ets | it body CommonFunc.sleep (8处) | 1000 | 2000 |
| slider/slider.test.ets | SliderTest/slider.test.ets | afterEach | 1000 (SLEEP_TIME) | 1000 (显式值，防止 SLEEP_TIME 改为 2000 后 afterEach 跟随变化) |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| 无 | - | - | - | - | - |

### 无匹配非 static 文件
| static 文件 | 原因 |
|---|---|
| slider/sliderCustomContentOptions.test.ets | 非 static 中无同名文件，SliderContentModifier.test.ets 测试内容不同（页面和用例名均不匹配） |
| ArcSliderTest/ArcSlider.test.ets | 非 static 中无 ArcSlider 相关测试文件，ArcSlider 为 static 新增测试 |
| slider/ArcSliderEnum.test.ets | 非 static 中无 ArcSlider 相关测试文件；且该文件无 sleep 调用 |

### Sleep 对齐说明
- **trackColorMetrics.test.ets**: beforeEach 中 `Utils.sleep(2500)` 对齐为 `Utils.sleep(2000)`，与非 static 的 `sliderTrackColorMetrics.test.ets` beforeEach 中 `CommonFunc.sleep(2000)` 一致（差异 500ms ≤ 1000ms）
- **slider.test.ets**: 将 `SLEEP_TIME` 常量从 1000 改为 2000，使 8 处 `CommonFunc.sleep(SLEEP_TIME)` 从 1000ms 变为 2000ms，与非 static 的 `SliderTest/slider.test.ets` it body 中 `Utils.sleep(2000)` 一致（差异 1000ms ≤ 1000ms）；afterEach 改为显式 `Utils.sleep(1000)` 保持与非 static afterEach 一致
- **trackColorMetrics.test.ets it body**: static 有 `Utils.sleep(1000)`，非 static it body 无 sleep，无法对齐

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| slider/trackColorMetrics.test.ets | trackColorMetrics_static_001 | SliderTest/sliderTrackColorMetrics.test.ets | TrackColorMetrics_0010 | 模糊匹配（去掉 _static 后缀，Levenshtein 距离=2：大小写差异 + 末尾多一个 0） |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| slider/ArcSliderEnum.test.ets | arcSliderPositionLeft |
| ArcSliderTest/ArcSlider.test.ets | arcSliderPositionLeft |
| ArcSliderTest/ArcSlider.test.ets | arcSliderValueOptionsProgress |
| ArcSliderTest/ArcSlider.test.ets | arcSliderValueOptionsMin |
| ArcSliderTest/ArcSlider.test.ets | arcSliderValueOptionsMax |
| ArcSliderTest/ArcSlider.test.ets | arcSliderLayoutOptionsReverse |
| ArcSliderTest/ArcSlider.test.ets | arcSliderLayoutOptionsPosition |
| ArcSliderTest/ArcSlider.test.ets | arcSliderStyleOptionsTrackThickness |
| ArcSliderTest/ArcSlider.test.ets | arcSliderStyleOptionsActiveTrackThickness |
| ArcSliderTest/ArcSlider.test.ets | arcSliderStyleOptionsTrackColor |
| ArcSliderTest/ArcSlider.test.ets | arcSliderStyleOptionsSelectedColor |
| ArcSliderTest/ArcSlider.test.ets | arcSliderStyleOptionsTrackBlur |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsValueOptions |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsLayoutOptions |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsStyleOptions |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsDigitalCrownSensitivity |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsOnTouch |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsOnChange |
| ArcSliderTest/ArcSlider.test.ets | arcSliderOptionsOnEnlarge |
| slider/sliderCustomContentOptions.test.ets | sliderCustomContentOptionsAccessibilityDescription |
| slider/sliderCustomContentOptions.test.ets | sliderCustomContentOptionsAccessibilityLevel |
| slider/slider.test.ets | colorMetricsStopColor |
| slider/slider.test.ets | colorMetricsStopOffset |
| slider/slider.test.ets | sliderStepItemAccessibilityText |
| slider/slider.test.ets | sliderShowStepOptionsStepsAccessibility |
| slider/slider.test.ets | sliderCustomContentOptionsAccessibilityText |
| slider/slider.test.ets | sliderAttributePrefix |
| slider/slider.test.ets | sliderAttributeSuffix |
| slider/slider.test.ets | sliderAttributeTrackColorMetrics |

### 仅非 static 存在的用例（static 中无对应）

非 static 测试套包含大量 static 中不存在的用例，以下为主要分类：

| 非 static 文件 | it 用例名称（示例） |
|---|---|
| Slider/slider.test.ets | Slider_0101, Slider_0102, Slider_0103, Slider_0104, Slider_0105, Slider_0106 |
| Slider/SliderJsunit1.test.ets | testSlider001 ~ testSlider006 |
| Slider/sliderInterfaceTest.test.ets | SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_0180 ~ SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_0020 (24个) |
| Slider/sliderOnChangeModifier.test.ets | ArkUX_Modifier_Slider_OnChange_1001, ArkUX_Modifier_Slider_OnChange_1002 |
| Slider/sliderNode.test.ets | sliderNode0100 |
| SliderTest/slider.test.ets | testsliderMoving0011 |
| SliderTest/SliderJsunit.test.ets | testGetSliderAttr010, testGetSliderAttr020 |
| SliderTest/SliderContentModifier.test.ets | SliderContentModifier_001 |
| SliderTest/slideRange.test.ets | slideRange_001 |
| SliderTest/SliderAttrs.test.ets | SliderAttrs_001, SliderAttrs_002, SliderAttrs_003 |
| SliderTest/SliderAttrs2.test.ets | SliderAttrs2_001 |
| SliderTest/XcomponentSlider.test.ets | SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_021 ~ SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100 (26个) |
| SliderTestC/sliderJsunit.test.ets | sliderJsunitSliderTest_0100 ~ sliderJsunitSliderTest_1000 (10个) |
| sliderNullTest/sliderNull.test.ets | slidenull_001, slideundefined_001 |
| radioNullTest/radio.test.ets | radionull_001, radioundefined_001 |
| selectNullTest/SelectAttributeNullTest.test.ets | selectFont_Null_001 ~ selectAvoidance_Undefined_043 (43个) |
| selectNullTest/SelectSelectedNullTest.test.ets | selectSelected_Null_001, selectSelected_Undefined_002 |
| selectNullTest/SelectValueNullTest.test.ets | selectValue_Null_001, selectValue_Undefined_002 |
| StackTest/StackAlignContentNullTest.test.ets | StackAlignContentNull_001 ~ StackAlignContentMethodUndefined_001 (4个，List.test.ets 中已注释) |

### it 用例对齐统计
| 维度 | 数量 |
|---|---|
| static it 用例总数 | 30 |
| 非 static it 用例总数 | ~135+ |
| 已匹配 | 1 |
| 仅 static 存在 | 29 |
| 仅非 static 存在 | ~134+ |

### it 用例对齐说明

static 测试套主要包含 ArcSlider（19个用例）、SliderCustomContentOptions（2个用例）、Slider 新属性（8个用例）、trackColorMetrics（1个用例）等新增测试，这些测试是 static 模式特有的功能验证，非 static 测试套中不存在对应用例。唯一匹配的是 `trackColorMetrics_static_001` ↔ `TrackColorMetrics_0010`，两者测试内容相同（验证 Slider trackColor 属性），仅命名格式不同。
