# ActsAceEtsModuleDialogApi16StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| promptActionTest/updatePopup.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| promptActionTest/subwindowDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 import，it 块包裹 try-catch | ~4s |
| promptActionTest/showToastOptions.test.ets | 删除 beforeAll 中的 startAbility 调用（保留 deviceInfo 逻辑），清理未使用 import/变量，9 个 it 块包裹 try-catch | ~4s |
| promptActionTest/openPopup.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| promptActionTest/openDialogTransition.test.ets | 删除 beforeAll 中的 startAbility 调用（保留页面导航逻辑），清理未使用 import/变量，6 个 it 块包裹 try-catch | ~4s |
| promptActionTest/closePopup.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| MenuTest/effectOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，3 个 it 块包裹 try-catch | ~4s |
| MenuTest/blurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，3 个 it 块包裹 try-catch | ~4s |
| MenuTest/menuBindMenuModifierTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| MenuTest/menuFontsizeModifierTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，3 个 it 块包裹 try-catch | ~4s |
| MenuTest/menuitemOnChangeModifierTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| bindSheet/showInSubWindowBindSheet.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，8 个 it 块包裹 try-catch | ~4s |
| dialogLifeTest/CustomDialogLife.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| dialogLifeTest/AlertDialogLife.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| dialogLifeTest/ActionSheetLife.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import/变量，it 块包裹 try-catch | ~4s |
| PopupTest/Maxwidth.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import，3 个 it 块包裹 try-catch | ~4s |

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
    abilityDelegator.executeShellCommand(cmd)
    setTimeout(() => {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
    }, 4000)
  }
  ```

#### 各 .test.ets 文件
- **修改前**：每个文件的 beforeAll 中包含 `await UtilsTest.startAbility("com.arkui.ace.dialog.api16.static", "EntryAbility")`
- **修改后**：beforeAll 中的 startAbility 调用已删除，Ability 启动统一移至 OpenHarmonyTestRunner

#### 清理的 import 和变量
- 删除了所有 .test.ets 中不再使用的 import：`hilog`、`abilityDelegatorRegistry`、`UIAbility`、`BusinessError`、`UtilsTest`/`startAbility`/`stopApplication`
- 删除了不再使用的模块级变量：`domain`、`tag`、`testAbilityContext`
- 从 hypium import 中移除了不再使用的 `beforeAll`（showToastOptions 和 openDialogTransition 保留 beforeAll 因仍有其他逻辑）
- 保留了 `common` import（subwindowDialog 和 showInSubWindowBindSheet 的 it 块中使用）
- 保留了 `UtilsTest` import（Maxwidth、ActionSheetLife、AlertDialogLife 的 beforeEach 中使用 `UtilsTest.msSleep`）

#### try-catch 包裹
- 所有 it 块中的 await 调用已包裹在 try-catch 块中，符合 XTS.CHECK.ASYNC_TESTCASE.02 规范
- beforeEach 中已有 try-catch 的保持不变

---

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| menuFontsizeModifierTest.test.ets | menuFontsizeModifierTest.test.ets | beforeEach pushUrl | 2000 | 2500 |
| menuBindMenuModifierTest.test.ets | menuBindMenuModifierTest.test.ets | beforeEach pushUrl | 2000 | 2500 |
| effectOptions.test.ets | effectOptions.test.ets | beforeEach pushUrl | 2000 | 2500 |
| CustomDialogLife.test.ets | CustomDialogLife.test.ets | beforeEach pushUrl | 2000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | beforeAll pushUrl | 2000 | 3000 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_300 dialogTransitionButton click 后 | 200 | 500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_400 maskTransitionButton click 后 | 200 | 500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_500 maskTransitionButton click 后 | 200 | 500 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| updatePopup.test.ets | updatePopup.test.ets | beforeEach Driver.create 后额外 sleep | 1000 | 无 | 1000 (结构差异) |
| closePopup.test.ets | closePopup.test.ets | beforeEach Driver.create 后额外 sleep | 1000 | 无 | 1000 (结构差异) |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_100 maskTransition click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_100 Confirm click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_200 OpenDialog click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_200 Confirm click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_300 OpenDialog click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_300 Confirm click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_400 OpenDialog click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_400 Confirm click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_500 OpenDialog click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_500 Confirm click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_600 OpenDialog click 后 | 500 | 3000 | 2500 |
| openDialogTransition.test.ets | openDialogTransition.test.ets | it_600 Confirm click 后 | 500 | 3000 | 2500 |
| blurStyleOptions.test.ets | blurStyleOptions.test.ets | beforeEach pushUrl | 2000 | 无 (非 static 使用 SLEEP_TIME 常量) | 2000 |
| CustomDialogLife.test.ets | CustomDialogLife.test.ets | it 块内多处 | 多处不一致 | 多处不一致 | 1000 (结构差异) |

### 对应非 static 测试套不存在
| static 文件 | 推导的非 static 文件 | 是否存在 |
|---|---|---|
| PopupTest/Maxwidth.test.ets | PopupTest/Maxwidth.test.ets | 否 |
| promptActionTest/subwindowDialog.test.ets | promptActionTest/subwindowDialog.test.ets | 否 |

---

## 三、it 用例对齐

### 匹配统计
- static 总用例数：45
- 非 static 总用例数：40
- 已匹配：40
- 仅 static 存在：5
- 仅非 static 存在：0

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| PopupTest/Maxwidth.test.ets | popup_maxWidth_static_0101 |
| PopupTest/Maxwidth.test.ets | popup_maxWidth_static_0102 |
| PopupTest/Maxwidth.test.ets | popup_maxWidth_static_0103 |
| promptActionTest/subwindowDialog.test.ets | subwindowDialog_static_0100 |
| promptActionTest/subwindowDialog.test.ets | subwindowDialog_static_0200 |

### 仅非 static 存在的用例（static 中无对应）
无

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| updatePopup.test.ets | updatePopupTest_static_0100 | updatePopup.test.ets | updatePopupTest_0100 | 去除 _static |
| openPopup.test.ets | openPopupTest_static_0100 | openPopup.test.ets | openPopupTest_0100 | 去除 _static |
| closePopup.test.ets | closePopupTest_static_0100 | closePopup.test.ets | closePopupTest_0100 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0100 | showToastOptions.test.ets | showToastOptions_0100 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0200 | showToastOptions.test.ets | showToastOptions_0200 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0300 | showToastOptions.test.ets | showToastOptions_0300 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0400 | showToastOptions.test.ets | showToastOptions_0400 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0500 | showToastOptions.test.ets | showToastOptions_0500 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0600 | showToastOptions.test.ets | showToastOptions_0600 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0700 | showToastOptions.test.ets | showToastOptions_0700 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0800 | showToastOptions.test.ets | showToastOptions_0800 | 去除 _static |
| showToastOptions.test.ets | showToastOptions_static_0900 | showToastOptions.test.ets | showToastOptions_0900 | 去除 _static |
| openDialogTransition.test.ets | OpenDialogTransitionTest_static_100 | openDialogTransition.test.ets | OpenDialogTransitionTest_100 | 去除 _static |
| openDialogTransition.test.ets | OpenDialogTransitionTest_static_200 | openDialogTransition.test.ets | OpenDialogTransitionTest_200 | 去除 _static |
| openDialogTransition.test.ets | OpenDialogTransitionTest_static_300 | openDialogTransition.test.ets | OpenDialogTransitionTest_300 | 去除 _static |
| openDialogTransition.test.ets | OpenDialogTransitionTest_static_400 | openDialogTransition.test.ets | OpenDialogTransitionTest_400 | 去除 _static |
| openDialogTransition.test.ets | OpenDialogTransitionTest_static_500 | openDialogTransition.test.ets | OpenDialogTransitionTest_500 | 去除 _static |
| openDialogTransition.test.ets | OpenDialogTransitionTest_static_600 | openDialogTransition.test.ets | OpenDialogTransitionTest_600 | 去除 _static |
| effectOptions.test.ets | EffectOptionsTest_static_0101 | effectOptions.test.ets | EffectOptionsTest_0101 | 去除 _static |
| effectOptions.test.ets | EffectOptionsTest_static_0102 | effectOptions.test.ets | EffectOptionsTest_0102 | 去除 _static |
| effectOptions.test.ets | EffectOptionsTest_static_0103 | effectOptions.test.ets | EffectOptionsTest_0103 | 去除 _static |
| blurStyleOptions.test.ets | MenuStyleOptionsTest_static_0101 | blurStyleOptions.test.ets | MenuStyleOptionsTest_0101 | 去除 _static |
| blurStyleOptions.test.ets | MenuStyleOptionsTest_static_0102 | blurStyleOptions.test.ets | MenuStyleOptionsTest_0102 | 去除 _static |
| blurStyleOptions.test.ets | MenuStyleOptionsTest_static_0103 | blurStyleOptions.test.ets | MenuStyleOptionsTest_0103 | 去除 _static |
| menuBindMenuModifierTest.test.ets | MenuBindMenu_static_0001 | menuBindMenuModifierTest.test.ets | MenuBindMenu_0001 | 去除 _static |
| menuFontsizeModifierTest.test.ets | ArkUX_Modifier_Menu_FontSize_static_1001 | menuFontsizeModifierTest.test.ets | ArkUX_Modifier_Menu_FontSize_1001 | 去除 _static |
| menuFontsizeModifierTest.test.ets | ArkUX_Modifier_Menu_FontSize_static_1002 | menuFontsizeModifierTest.test.ets | ArkUX_Modifier_Menu_FontSize_1002 | 去除 _static |
| menuFontsizeModifierTest.test.ets | ArkUX_Modifier_Menu_FontSize_static_1003 | menuFontsizeModifierTest.test.ets | ArkUX_Modifier_Menu_FontSize_1003 | 去除 _static |
| menuitemOnChangeModifierTest.test.ets | ArkUX_Modifier_MenuItem_OnChange_static_1001 | menuitemOnChangeModifierTest.test.ets | ArkUX_Modifier_MenuItem_OnChange_1001 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0100 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0100 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0200 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0200 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0300 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0300 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0400 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0400 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0500 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0500 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0600 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0600 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0700 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0700 | 去除 _static |
| showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_static_0800 | showInSubWindowBindSheet.test.ets | showInSubWindowBindSheet_0800 | 去除 _static |
| CustomDialogLife.test.ets | CustomDialogLife_static_0001 | CustomDialogLife.test.ets | CustomDialogLife_0001 | 去除 _static |
| AlertDialogLife.test.ets | AlertDialogLife_static_0001 | AlertDialogLife.test.ets | AlertDialogLife_0001 | 去除 _static |
| ActionSheetLife.test.ets | ActionSheetLife_static_0001 | ActionSheetLife.test.ets | ActionSheetLife_0001 | 去除 _static |
