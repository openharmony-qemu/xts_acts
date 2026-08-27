# ActsAceEtsModuleMenuStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/BindContextMenuByIsShowTest/BindContextMenuByIsShowOptions.test.ets | 删除 beforeAll 中的 startAbility 调用、UtilsTest/BusinessError 导入、beforeAll 导入、abilityDelegatorRegistry 导入 | ~4s |
| entry/src/main/src/test/BindContextMenuByIsShowTest/BindContextMenuByIsShowNullUndefined.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuByIsShowTest/BindContextMenuByIsShowBlurMask.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuByIsShowTest/BindContextMenuByIsShowBlurMaskBg.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuByIsShowTest/BindContextMenuByIsShowBlurMaskMask.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuTest/ContextMenuOptions.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuTest/ContextMenuMaxHeightTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuTest/BindMenuWithResponse.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuTest/bindContextMenuTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindContextMenuTest/BindContextMenuResponseType.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/maskTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/maskColorTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/maskBackgroundBlurStyleTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/onDidAppearTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/onDidDisappearTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/onWillAppearTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/BindMenuTest/onWillDisappearTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/OpenMenuTest/SubMenuBuilderTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/OpenMenuTest/onDidAppearOpenTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/OpenMenuTest/onDidDisappearOpenTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/OpenMenuTest/onWillAppearOpenTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/OpenMenuTest/onWillDisappearOpenTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/GridStyleTest/GridStyleTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/UpdateMenuTest/updateMenuTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/scrollBarTest/scrollBarTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/maxHeightTest/maxHeightTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/menuExpandSymbol/Menu.test.ets | 同上 | ~4s |
| entry/src/main/src/test/PromptActionTest/PromptAction.test.ets | 同上 | ~4s |
| entry/src/main/src/test/PromptActionTest/GetState.test.ets | 同上 | ~4s |
| entry/src/main/src/test/SheetTest/Sheet.test.ets | 同上 | ~4s |
| entry/src/main/src/test/targetSpaceTest/targetSpaceTest.test.ets | 同上 | ~4s |
| entry/src/main/src/test/CommonTest/HoverScaleInterruption.test.ets | 同上 | ~4s |

共修改 33 个文件（1 个 OpenHarmonyTestRunner.ets + 32 个 .test.ets），删除 32 处 beforeAll/startAbility 调用，清理 16 处 BusinessError 未使用导入，清理 7 处 abilityDelegatorRegistry 未使用导入，为 129 个 beforeEach/afterEach/it 块补充 try-catch 错误捕获。

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
  abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
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
  abilityDelegator.executeShellCommand(cmd)
  setTimeout(() => {
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }, 4000)
  ```

#### 各 .test.ets 文件
- 删除 beforeAll 块中的 `await UtilsTest.startAbility(...)` 调用
- 删除 `let isAbilityStarted: boolean = false;` 守卫变量（部分文件）
- 清理未使用导入：UtilsTest（32处）、BusinessError（16处）、abilityDelegatorRegistry（7处）、beforeAll（32处）
- 为 129 个含 await 调用但未包裹 try-catch 的 beforeEach/afterEach/it 块补充 try-catch

## 二、Sleep 时长对齐

### 对应非 static 测试套
| static 测试套 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_menu_static | ace_ets_module_menu | 是 ✅ |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| maxHeightTest.test.ets | maxHeight.test.ets | beforeEach pushUrl | 2000 | 2000（已对齐） |
| maxHeightTest.test.ets | maxHeight.test.ets | afterEach | 1000 | 1000（已对齐） |
| targetSpaceTest.test.ets | targetSpace.test.ets | beforeEach pushUrl | 2000 | 2000（已对齐） |
| targetSpaceTest.test.ets | targetSpace.test.ets | afterEach | 1000 | 1000（已对齐） |
| scrollBarTest.test.ets | scrollBar.test.ets | beforeEach | 2000 | 2000（已对齐） |
| updateMenuTest.test.ets | updateMenu.test.ets | afterEach | 1000 | 1000（已对齐） |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| GridStyleTest.test.ets | GridStyle.test.ets | beforeEach | 500 | 2000 | 1500 |
| SubMenuBuilderTest.test.ets | subMenuBuilderTest.test.ets | beforeEach | 500 | 2000 | 1500 |
| BindMenuWithResponse.test.ets | BindMenuWithResponse.test.ets | beforeEach | 500 | 2000 | 1500 |
| HoverScaleInterruption.test.ets | - | beforeEach | 500 | 2000 | 1500 |

### 说明
- static 与非 static 测试文件结构差异较大（static 是精简版本，用例数少于非 static），sleep 调用数量和位置不完全对应
- beforeEach 中的 pushUrl sleep：static 和非 static 均为 2000ms，已对齐
- afterEach 中的 sleep：static 和非 static 均为 1000ms，已对齐
- 部分 static 文件的 beforeEach sleep 为 500ms，非 static 对应为 2000ms，差异 > 1000ms，未修改

## 三、it 用例对齐

### 统计
| 指标 | 数量 |
|---|---|
| static it 用例总数 | 136 |
| 非 static it 用例总数 | 297 |
| 已匹配 | 64 |
| 仅 static 存在 | 72 |
| 仅非 static 存在 | 229 |

### 已匹配的用例（64个，全部为 EXACT 精确匹配）
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| BindMenuWithResponse.test.ets | BindMenuWithResponse_0100 | BindMenuWithResponse.test.ets | BindMenuWithResponse_0100 | EXACT |
| GridStyleTest.test.ets | GridStyleTest_AllParams_0100 | GridStyle.test.ets | GridStyleTest_AllParams_0100 | EXACT |
| GridStyleTest.test.ets | GridStyleTest_BindMenu_0100 | GridStyle.test.ets | GridStyleTest_BindMenu_0100 | EXACT |
| GridStyleTest.test.ets | GridStyleTest_Count_0100 | GridStyle.test.ets | GridStyleTest_Count_0100 | EXACT |
| GridStyleTest.test.ets | GridStyleTest_MenuGridPosition_BOTTOM_0100 | GridStyle.test.ets | GridStyleTest_MenuGridPosition_BOTTOM_0100 | EXACT |
| GridStyleTest.test.ets | GridStyleTest_MenuGridPosition_TOP_0100 | GridStyle.test.ets | GridStyleTest_MenuGridPosition_TOP_0100 | EXACT |
| GridStyleTest.test.ets | GridStyleTest_MenuGridPosition_UI_0100 | GridStyle.test.ets | GridStyleTest_MenuGridPosition_UI_0100 | EXACT |
| maxHeightTest.test.ets | maxHeightTest_0100~0800 | maxHeight.test.ets | maxHeightTest_0100~0800 | EXACT |
| scrollBarTest.test.ets | scrollBarTest_0100~0300 | scrollBar.test.ets | scrollBarTest_0100~0300 | EXACT |
| targetSpaceTest.test.ets | targetSpaceTest_0100~0800 | targetSpace.test.ets | targetSpaceTest_0100~0800 | EXACT |
| updateMenuTest.test.ets | updateMenuTest_0100 | updateMenu.test.ets | updateMenuTest_0100 | EXACT |
| BindContextMenuByIsShowOptions.test.ets | SUB_ARKUI_MENU_BCMByIsShow_* (20个) | BindContextMenuByIsShowOptions.test.ets | 同名 | EXACT |
| BindContextMenuByIsShowNullUndefined.test.ets | SUB_ARKUI_MENU_BCMByIsShow_* (4个) | BindContextMenuByIsShowNullUndefined.test.ets | 同名 | EXACT |
| BindContextMenuByIsShowBlurMask.test.ets | SUB_ARKUI_MENU_BCMByIsShow_* (6个) | BindContextMenuByIsShowBlurMask.test.ets | 同名 | EXACT |
| BindContextMenuByIsShowBlurMaskBg.test.ets | SUB_ARKUI_MENU_BCMByIsShow_backgroundBlurStyle_all_0100 | BindContextMenuByIsShowBlurMask.test.ets | 同名 | EXACT |
| BindContextMenuByIsShowBlurMaskMask.test.ets | SUB_ARKUI_MENU_BCMByIsShow_mask_backgroundBlurStyle_all_0200 | BindContextMenuByIsShowBlurMask.test.ets | 同名 | EXACT |

### 仅 static 存在的用例（72个）
| 文件 | it 用例名称 |
|---|---|
| maskTest.test.ets | maskTest_static_0001, maskTest_static_0002, maskTest_static_0003 |
| maskColorTest.test.ets | maskColorTest_static_0001~0005 |
| maskBackgroundBlurStyleTest.test.ets | maskBackgroundBlurStyleTest_static_0001~0014 |
| onDidAppearTest.test.ets | onDidAppearTest_static_0001 |
| onDidDisappearTest.test.ets | onDidDisappearTest_static_0001 |
| onWillAppearTest.test.ets | onWillAppearTest_static_0001 |
| onWillDisappearTest.test.ets | onWillDisappearTest_static_0001 |
| onDidAppearOpenTest.test.ets | onDidAppearOpenTest_static_0001 |
| onDidDisappearOpenTest.test.ets | onDidDisappearOpenTest_static_0001 |
| onWillAppearOpenTest.test.ets | onWillAppearOpenTest_static_0001 |
| onWillDisappearOpenTest.test.ets | onWillDisappearOpenTest_static_0100 |
| SubMenuBuilderTest.test.ets | SubMenuBuilder_openMenu_0100, SubMenuBuilder_subMenu_0200 |
| bindContextMenuTest.test.ets | bindContextMenuTest_static_0001~0003 |
| ContextMenuMaxHeightTest.test.ets | ContextMenuMaxHeightTest_0100 |
| ContextMenuOptions.test.ets | contextMenuOptions* (11个) |
| BindContextMenuResponseType.test.ets | BindContextMenuResponseType_LongPress_0100, BindContextMenuResponseType_RightClick_0100 |
| Menu.test.ets | menuSubMenuExpandSymbol |
| GetState.test.ets | getStateTest |
| HoverScaleInterruption.test.ets | hoverScaleInterruptionFalse, hoverScaleInterruptionTrue |
| PromptAction.test.ets | actionMenuOnDidAppear, actionMenuOnDidDisappear, actionMenuOnWillAppear, actionMenuOnWillDisappear, dialogControllerAppStorage, dialogStateAppeared, dialogStateAppearing, dialogStateDisappeared, dialogStateDisappearing, dialogStateEnumAssertion, dialogStateUninitialized |
| Sheet.test.ets | sheetKeyboardAvoidModePopupSheet, sheetOptionsEnableFloatingDragBar, sheetOptionsModalTransition, sheetTypeContentCover, sheetTypeSide |
| MenuKeyboardAvoidMode.test.ets | menuKeyboardAvoidModeNone, menuKeyboardAvoidModeTranslateAndResize |

### 仅非 static 存在的用例
非 static 有 229 个用例在 static 中无对应，主要集中在：menu.test.ets、menufirst.test.ets、menusecond.test.ets、menuDivider.test.ets、menuEnabledJsunit.test.ets、blurStyleOptions.test.ets、effectOptions.test.ets、AvailableLayoutAreaTest.test.ets、BindMenuJsunitt.test.ets、BindPopupJsunit.test.ets、previewBorderRadius.test.ets、bindContextMenuHapticFeedback.test.ets、bindMenuHapticFeedbackMode.test.ets 等。
