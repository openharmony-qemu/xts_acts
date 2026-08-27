# ActsAceEtsModuleDialogApi26StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/CacheMaxCountTest/CacheMaxCountForHSPValidTest.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/CacheMaxCountTest/CacheMaxCountForHSPErrorTest.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupBackground/PopupCommonOptionsBackgroundBlurStyleOptionsTest.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupBackground/PopupBackgroundBlurStyleOptionsTest.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupBackground/CustomPopupOptionsBackgroundBlurStyleOptionsTest.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/MenuTest/SubMenuBuilderTest.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/CustomDialogTest/CustomDialogDisplayModeInSubWindow.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |
| entry/src/main/src/test/CustomDialogTest/CustomDialogSystemMaterial.test.ets | 删除 beforeAll 中的 startAbility 调用及 UtilsTest import，beforeEach/afterEach 包裹 try-catch | ~4s |

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
  ```

#### 各 .test.ets 文件
- **修改前**：
  ```typescript
  import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility('com.arkui.ace.dialog.api26.static', 'EntryAbility');
  });
  beforeEach(async (): Promise<void> => { await navigatePage(); });
  afterEach(async (): Promise<void> => { await Utils.sleep(1000); });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
  // UtilsTest import 已删除
  ...
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  beforeEach(async (): Promise<void> => {
    try {
      await navigatePage();
    } catch (err) {
      console.info('xxxTest beforeEach err: ' + JSON.stringify(err));
    }
  });
  afterEach(async (): Promise<void> => {
    try {
      await Utils.sleep(1000);
    } catch (err) {
      console.info('xxxTest afterEach err: ' + JSON.stringify(err));
    }
  });
  ```

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| CustomDialogDisplayModeInSubWindow.test.ets | DisplayModeInSubWindow.test.ets | 是 |
| SubMenuBuilderTest.test.ets | MenuItemSubMenuBuilder.test.ets | 是 |
| PopupCommonOptionsBackgroundBlurStyleOptionsTest.test.ets | 无对应（非 static 测试 ColorMode/LevelMode） | 否 |
| PopupBackgroundBlurStyleOptionsTest.test.ets | 无对应 | 否 |
| CustomPopupOptionsBackgroundBlurStyleOptionsTest.test.ets | 无对应 | 否 |
| CustomDialogSystemMaterial.test.ets | 无对应 | 否 |
| MenuSystemMaterial.test.ets | 无对应 | 否 |
| CacheMaxCountForHSPValidTest.test.ets | 无对应 | 否 |
| CacheMaxCountForHSPErrorTest.test.ets | 无对应 | 否 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| CustomDialogDisplayModeInSubWindow.test.ets | DisplayModeInSubWindow.test.ets | navigatePage 页面跳转后 | 1000 | 800 |
| SubMenuBuilderTest.test.ets | MenuItemSubMenuBuilder.test.ets | navigatePage 页面跳转后 | 1000 | 800 |

说明：非 static 使用 `DialogApi26TestHelper.openPageIfNeeded`，其 `PAGE_READY_MS = 800`。static 原为 1000ms，差异 200ms <= 1000ms，已对齐为 800ms。此外，static 与非 static 在点击按钮后均有 `sleep(1000)` 调用，已天然一致，无需修改。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| SubMenuBuilderTest.test.ets | MenuItemSubMenuBuilder.test.ets | it 块内初始 sleep | 1500 | 200 | 1300 |
| CustomDialogDisplayModeInSubWindow.test.ets | DisplayModeInSubWindow.test.ets | it 块内初始 sleep | 1000 | 200 | 800 |

说明：SubMenuBuilderTest 的 it 块初始 sleep(1500) 与非 static sleep(200) 差异 1300ms > 1000ms，仅记录不修改。CustomDialogDisplayModeInSubWindow 的 it 块初始 sleep(1000) 与非 static sleep(200) 差异 800ms <= 1000ms，但因测试用例结构不同（static 的 0100/0200 为纯枚举断言无 sleep，0300/0400 为 UI 测试），与非 static 的 0100-0400 无法一一对应，故保持不变。

## 三、it 用例对齐

### 匹配方式说明
- 完全匹配：it 名称完全一致
- 去除 _static 后缀：去除 _static 后一致
- 模糊匹配：Levenshtein 距离 <= 3

### 匹配结果汇总
| 类别 | 数量 |
|---|---|
| static it 用例总数 | 70 |
| 非 static it 用例总数 | 84 |
| 已匹配 | 0 |
| 仅 static 存在 | 70 |
| 仅非 static 存在 | 84 |

### 匹配分析
static 与非 static 测试套使用完全不同的命名前缀和测试范围：
- static 前缀：`SUB_ACE_API26_*`
- 非 static 前缀：`SUB_ArkUI_DialogApi26_*`

static 测试套覆盖 API26 新增功能（BackgroundBlurStyleOptions、CacheMaxCountForHSP、SystemMaterial、CustomDialogDisplayMode、SubMenuBuilder），非 static 测试套覆盖既有功能（Dialog 选项、ContextMenu、Popup ColorMode/LevelMode、Select 等）。两套用例无重叠，Levenshtein 距离均 > 3。

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| MenuSystemMaterial.test.ets | SUB_ACE_API26_MenuSystemMaterial_0100 ~ 0900 |
| MenuSystemMaterial.test.ets | SUB_ACE_API26_MenuSystemMaterial_MaterialLevel_0100 ~ 0300 |
| MenuSystemMaterial.test.ets | SUB_ACE_API26_MenuSystemMaterial_getGlobalMaterialLevel_0100 |
| MenuSystemMaterial.test.ets | SUB_ACE_API26_MenuSystemMaterial_isImmersiveMaterialSupported_0100 |
| CustomDialogSystemMaterial.test.ets | SUB_ACE_API26_CustomDialogSystemMaterial_0100 ~ 0300 |
| CustomDialogDisplayModeInSubWindow.test.ets | SUB_ACE_API26_CustomDialogDisplayMode_0100 ~ 0400 |
| SubMenuBuilderTest.test.ets | SUB_ACE_API26_SubMenuBuilder_0100 ~ 0500 |
| CacheMaxCountForHSPValidTest.test.ets | SUB_ACE_API26_CacheMaxCountForHSPValid_0100 |
| CacheMaxCountForHSPErrorTest.test.ets | SUB_ACE_API26_CacheMaxCountForHSPError_0100 |
| PopupCommonOptionsBackgroundBlurStyleOptionsTest.test.ets | SUB_ACE_API26_PopupCommonOptionsBackgroundBlurStyleOptions_0100 ~ 1400 |
| PopupBackgroundBlurStyleOptionsTest.test.ets | SUB_ACE_API26_PopupBackgroundBlurStyleOptions_0100 ~ 1400 |
| CustomPopupOptionsBackgroundBlurStyleOptionsTest.test.ets | SUB_ACE_API26_CustomPopupOptionsBackgroundBlurStyleOptions_0100 ~ 1400 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| DialogAbnormalOpts.test.ets | SUB_ArkUI_DialogApi26_DialogAbnormalOpts_0100 |
| DialogAbnormalOptsExtra.test.ets | SUB_ArkUI_DialogApi26_DialogAbnormalOptsExtra_0100 |
| ContextMenuByIsShow.test.ets | SUB_ArkUI_DialogApi26_ContextMenuByIsShow_0100 ~ 0400 |
| DialogAlignWordBreak.test.ets | SUB_ArkUI_DialogApi26_DialogAlignWordBreak_0100 |
| PopupOptionsLevelMode.test.ets | SUB_ArkUI_DialogApi26_PopupOptionsLevelMode_0100 ~ 0400 |
| ContextMenuByResponseType.test.ets | SUB_ArkUI_DialogApi26_ContextMenuByResponseType_0100 ~ 0400 |
| DialogAlignWordBreakExtra.test.ets | SUB_ArkUI_DialogApi26_DialogAlignWordBreakExtra_0100 |
| PopupOptionsColorMode.test.ets | SUB_ArkUI_DialogApi26_PopupOptionsColorMode_0100 ~ 0400 |
| MenuItemSubMenuBuilder.test.ets | SUB_ArkUI_DialogApi26_MenuItemSubMenuBuilder_0100 ~ 0400 |
| PopupCommonOptionsColorMode.test.ets | SUB_ArkUI_DialogApi26_PopupCommonOptionsColorMode_0100 ~ 0300 |
| ContextMenuWithResponse.test.ets | SUB_ArkUI_DialogApi26_ContextMenuWithResponse_0100 ~ 0400 |
| CustomPopupOptionsLevelMode.test.ets | SUB_ArkUI_DialogApi26_CustomPopupOptionsLevelMode_0100 ~ 0300 |
| ContextMenuGridStyle.test.ets | SUB_ArkUI_DialogApi26_ContextMenuGridStyle_0100 ~ 0600 |
| DialogBaseControllerLife.test.ets | SUB_ArkUI_DialogApi26_DialogBaseControllerLife_0100 ~ 0400 |
| SelectMenuBackground.test.ets | SUB_ArkUI_DialogApi26_SelectMenuBackground_0100 ~ 0700 |
| DialogBaseOptionsLayout.test.ets | SUB_ArkUI_DialogApi26_DialogBaseOptionsLayout_0100 |
| DialogBaseOptionsVisual.test.ets | SUB_ArkUI_DialogApi26_DialogBaseOptionsVisual_0100 |
| DialogBaseSizeBorder.test.ets | SUB_ArkUI_DialogApi26_DialogBaseSizeBorder_0100 |
| DialogButtonMatrix.test.ets | SUB_ArkUI_DialogApi26_DialogButtonMatrix_0100 |
| DialogCustomPresent.test.ets | SUB_ArkUI_DialogApi26_DialogCustomPresent_0100 ~ 0600 |
| DialogEnumsAssert.test.ets | SUB_ArkUI_DialogApi26_DialogEnumsAssert_0100, 0500, 1100 |
| DialogEnumsAssertExtra.test.ets | SUB_ArkUI_DialogApi26_DialogEnumsAssertExtra_0100, 0500 |
| DialogLifeCallbacks.test.ets | SUB_ArkUI_DialogApi26_DialogLifeCallbacks_0100 ~ 0800 |
| DialogStyleAlert.test.ets | SUB_ArkUI_DialogApi26_DialogStyleAlert_0100 |
| DialogStyleSheets.test.ets | SUB_ArkUI_DialogApi26_DialogStyleSheets_0100 ~ 0500 |
| DisplayModeInSubWindow.test.ets | SUB_ArkUI_DialogApi26_DisplayModeInSubWindow_0100 ~ 0400 |
