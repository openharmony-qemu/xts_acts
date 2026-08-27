# ActsAceEtsModuleCommonAttrsDialogApi11StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/bindSheetTest/ModelSheet.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量 | ~4s |
| entry/src/main/src/test/popupControlTest/customPopup.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/CustomPopupOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/CustomPopupOptionsFalse.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/CustomPopupOptionsTrue.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/PopupOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/PopupOptionsFalse.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/PopupOptionsTrue.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/popup.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/popupArrowJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/popupControlTest/popupfirst.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量 | ~4s |
| entry/src/main/src/test/menuTest/ModalBlurStyle.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuTest/menuBlurStyleJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuControlTest/AboutToDisappearJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuControlTest/BindMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuControlTest/BindMenu1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuControlTest/bindContextMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuControlTest/bindContextMenuAnchorPosition.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |
| entry/src/main/src/test/menuControlTest/bindMenuAnchorPosition.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，await 包裹 try-catch | ~4s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：
  ```typescript
  hilog.info(domain, tag, '%{public}s', 'start run testcase!!!');
  Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  ```
- **修改后**：
  ```typescript
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
- **修改前**：
  ```typescript
  let isAbilityStarted: boolean = false;
  beforeAll(async () => {
    await UtilsTest.startAbility(...)
    isAbilityStarted = true
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- 清理的未使用 import：UtilsTest、UIAbility、BusinessError（仅未使用时）、abilityDelegatorRegistry、hilog、common（仅未使用时）
- 清理的未使用模块变量：domain、tag、testAbilityContext
- 所有未被 try-catch 包裹的 standalone await 调用已包裹 try-catch

## 二、Sleep 时长对齐

### 非 static 测试套对应关系
| static 测试套 | 非 static 测试套 | 是否存在 |
|---|---|---|
| ace_ets_module_commonAttrsDialog_api11_static | ace_ets_module_commonAttrsDialog_api11 | 是 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| popupControlTest/customPopup.test.ets | popupControlTest/customPopup.test.ets | beforeEach pushUrl 后 | 2000 | 1000 |
| menuControlTest/BindMenu.test.ets | menuControlTest/BindMenu.test.ets | beforeEach pushUrl 后 | 2000 | 3000 |
| popupControlTest/popup.test.ets | popupControlTest/popup.test.ets | beforeEach pushUrl 后 | 2000 | 1000 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| popupControlTest/CustomPopupOptions.test.ets | popupControlTest/CustomPopupOptions.test.ets | beforeEach pushUrl 后 | 2000 | 5000 | 3000 |

### static 仅有 sleep（非 static 无对应 sleep）
| static 文件 | sleep 位置 | static(ms) | 说明 |
|---|---|---|---|
| bindSheetTest/ModelSheet.test.ets | beforeEach pushUrl 后 | 2000 | 非 static 无 sleep |
| popupControlTest/popupfirst.test.ets | beforeEach pushUrl 后 | 2000 | 非 static 无 sleep |
| menuControlTest/bindContextMenuAnchorPosition.test.ets | beforeEach + 多处 it | 2000/3000/1000 | 非 static 无此文件 |
| menuControlTest/bindMenuAnchorPosition.test.ets | beforeEach + 多处 it | 2000/3000/1000 | 非 static 无此文件 |

### sleep 已一致（无需修改）
以下文件的 sleep 时长在 static 和非 static 之间完全一致：
- popupControlTest/CustomPopupOptionsFalse.test.ets
- popupControlTest/CustomPopupOptionsTrue.test.ets
- popupControlTest/PopupOptions.test.ets
- popupControlTest/PopupOptionsFalse.test.ets
- popupControlTest/PopupOptionsTrue.test.ets
- popupControlTest/popupArrowJsunit.test.ets
- menuTest/ModalBlurStyle.test.ets
- menuTest/menuBlurStyleJsunit.test.ets
- menuControlTest/AboutToDisappearJsunit.test.ets
- menuControlTest/BindMenu1.test.ets
- menuControlTest/bindContextMenu.test.ets

## 三、it 用例对齐

### 已匹配的用例（29 个）
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0150 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0150 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0160 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0160 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0170 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0170 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0180 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0180 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0190 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0190 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0200 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0200 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0210 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0210 | 去除 _static 后缀 |
| bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_static_0220 | bindSheetTest/ModelSheet.test.ets | ArkUX_Model_Visual_0220 | 去除 _static 后缀 |
| menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_static_0100 | menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_0100 | 去除 _static 后缀 |
| menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_static_0200 | menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_0200 | 去除 _static 后缀 |
| menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_static_0300 | menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_0300 | 去除 _static 后缀 |
| menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_static_0400 | menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_0400 | 去除 _static 后缀 |
| menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_static_0500 | menuTest/ModalBlurStyle.test.ets | ModalBlurStyle_0500 | 去除 _static 后缀 |
| menuControlTest/bindContextMenu.test.ets | bindContextMenu_static_0100 | menuControlTest/bindContextMenu.test.ets | bindContextMenu_0100 | 去除 _static 后缀 |
| menuTest/menuBlurStyleJsunit.test.ets | menuBlurStyleJsunit_static_0100 | menuTest/menuBlurStyleJsunit.test.ets | menuBlurStyleJsunit_0100 | 去除 _static 后缀 |
| menuControlTest/AboutToDisappearJsunit.test.ets | aboutToDisappearTest_static_0100 | menuControlTest/AboutToDisappearJsunit.test.ets | aboutToDisappearTest_0100 | 去除 _static 后缀 |
| menuControlTest/BindMenu.test.ets | ArkUI_Menu_static_0100 | menuControlTest/BindMenu.test.ets | ArkUI_Menu_0100 | 去除 _static 后缀 |
| menuControlTest/BindMenu.test.ets | ArkUI_Menu_static_0200 | menuControlTest/BindMenu.test.ets | ArkUI_Menu_0200 | 去除 _static 后缀 |
| menuControlTest/BindMenu1.test.ets | bindMenu_static_0100 | menuControlTest/BindMenu1.test.ets | bindMenu_0100 | 去除 _static 后缀 |
| popupControlTest/customPopup.test.ets | customPopup_static_0100 | popupControlTest/customPopup.test.ets | customPopup_0100 | 去除 _static 后缀 |
| popupControlTest/CustomPopupOptions.test.ets | CustomPopupOptions_static_0100 | popupControlTest/CustomPopupOptions.test.ets | CustomPopupOptions_0100 | 去除 _static 后缀 |
| popupControlTest/CustomPopupOptionsTrue.test.ets | CustomPopupOptionsTrue_static_0100 | popupControlTest/CustomPopupOptionsTrue.test.ets | CustomPopupOptionsTrue_0100 | 去除 _static 后缀 |
| popupControlTest/CustomPopupOptionsFalse.test.ets | CustomPopupOptionsFalse_static_0100 | popupControlTest/CustomPopupOptionsFalse.test.ets | CustomPopupOptionsFalse_0100 | 去除 _static 后缀 |
| popupControlTest/popup.test.ets | popup_static_0100 | popupControlTest/popup.test.ets | popup_0100 | 去除 _static 后缀 |
| popupControlTest/popupArrowJsunit.test.ets | popupArrowJsunit_static_0100 | popupControlTest/popupArrowJsunit.test.ets | popupArrowJsunit_0100 | 去除 _static 后缀 |
| popupControlTest/popupfirst.test.ets | ArkUX_Stage_Popup_static_0100 | popupControlTest/popupfirst.test.ets | ArkUX_Stage_Popup_0100 | 去除 _static 后缀 |
| popupControlTest/PopupOptions.test.ets | PopupOptions_static_0100 | popupControlTest/PopupOptions.test.ets | PopupOptions_0100 | 去除 _static 后缀 |
| popupControlTest/PopupOptionsTrue.test.ets | PopupOptionsTrue_static_0100 | popupControlTest/PopupOptionsTrue.test.ets | PopupOptionsTrue_0100 | 去除 _static 后缀 |
| popupControlTest/PopupOptionsFalse.test.ets | PopupOptionsFalse_static_0100 | popupControlTest/PopupOptionsFalse.test.ets | PopupOptionsFalse_0100 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 | 原因 |
|---|---|---|
| menuControlTest/bindMenuAnchorPosition.test.ets | bindMenuAnchorPosition_static_0100 | 非 static 无此文件 |
| menuControlTest/bindMenuAnchorPosition.test.ets | bindMenuAnchorPosition_static_0200 | 非 static 无此文件 |
| menuControlTest/bindMenuAnchorPosition.test.ets | bindMenuAnchorPosition_static_0300 | 非 static 无此文件 |
| menuControlTest/bindContextMenuAnchorPosition.test.ets | bindContextMenuAnchorPosition_static_0100 | 非 static 无此文件 |
| menuControlTest/bindContextMenuAnchorPosition.test.ets | bindContextMenuAnchorPosition_static_0200 | 非 static 无此文件 |
| menuControlTest/bindContextMenuAnchorPosition.test.ets | bindContextMenuAnchorPosition_static_0300 | 非 static 无此文件 |

### 仅非 static 存在的用例（static 中无对应）
无。所有 29 个非 static 用例在 static 中均有对应。

## 四、总结

| 维度 | 数量 |
|---|---|
| 修改文件总数 | 20（1 个 OpenHarmonyTestRunner.ets + 19 个 .test.ets） |
| Sleep 已对齐 | 3 处 |
| Sleep 差异过大未修改 | 1 处（CustomPopupOptions beforeEach: 2000 vs 5000） |
| static 仅有 sleep | 4 个文件（2 个无对应文件 + 2 个非 static 无 sleep） |
| it 用例已匹配 | 29 个 |
| it 用例仅 static 存在 | 6 个（2 个文件在非 static 中不存在） |
| it 用例仅非 static 存在 | 0 个 |
