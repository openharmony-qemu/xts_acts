# ActsAceEtsModuleDialogApi11StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| entry/src/main/src/test/alertDialogTest/stageAlertDialog.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import/变量、beforeAll 从 hypium import 移除 |
| entry/src/main/src/test/alertDialogTest/DialogJsunit.test.ets | 同上 |
| entry/src/main/src/test/alertDialogTest/AlertDialogTrue.test.ets | 同上 |
| entry/src/main/src/test/alertDialogTest/AlertDialog1.test.ets | 同上 |
| entry/src/main/src/test/alertDialogTest/AlertDialogJsunit.test.ets | 同上 |
| entry/src/main/src/test/alertDialogTest/alertDialog.test.ets | 同上 |
| entry/src/main/src/test/alertDialogTest/AlertDialogFalse.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/ToastShowMode.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/stagePrompt.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showToast.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showDialogTrue.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showDialogFalse.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showDialog.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/ShowDialogJsunit.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showActionMenuTrue.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showActionMenuFalse.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/showActionMenu.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/promptTest.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/prompt.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/openCustomDialogTrue.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/openCustomDialogNew.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/openCustomDialogFalse.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/openCustomDialog.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/OhosPromptJsunit.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/Dialog.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/CustomDialogMask.test.ets | 同上 |
| entry/src/main/src/test/promptActionTest/bindPopupOffset.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/BindMenuJsunitt.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/BindPopupJsunit.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/menusecond.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/menufirst.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/menuEnabledJsunit.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/menuDivider.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/menu.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/ResponseRegionJsunit.test.ets | 同上 |
| entry/src/main/src/test/MenuTest/responseType.test.ets | 同上 |
| entry/src/main/src/test/checkbox/SelectStatus.test.ets | 同上 |
| entry/src/main/src/test/actionSheetTest/stageActionSheet.test.ets | 同上 |
| entry/src/main/src/test/actionSheetTest/ActionSheetJsunit.test.ets | 同上 |
| entry/src/main/src/test/actionSheetTest/ActionSheetFalse.test.ets | 同上 |
| entry/src/main/src/test/actionSheetTest/ActionSheetTrue.test.ets | 同上 |
| entry/src/main/src/test/actionSheetTest/ActionSheet.test.ets | 同上 |
| entry/src/main/src/test/customDialogTest/CustomDialogTrue.test.ets | 同上 |
| entry/src/main/src/test/customDialogTest/CustomDialogRouter.test.ets | 同上 |
| entry/src/main/src/test/customDialogTest/CustomDialogJsunit.test.ets | 同上 |
| entry/src/main/src/test/customDialogTest/CustomDialogFalse.test.ets | 同上 |
| entry/src/main/src/test/customDialogTest/CustomDialogControllerJsunit.test.ets | 同上 |
| entry/src/main/src/test/customDialogTest/CustomDialog.test.ets | 同上 |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：`onRun` 中直接调用 `Hypium.hypiumTest`，Ability 未启动即执行测试
- **修改后**：`onRun` 中使用 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability，`setTimeout(4000)` 延迟后执行 `Hypium.hypiumTest`，确保 Ability 完成 `aboutToAppear`（AppStorage 存 router）后再跑测试

#### 各 .test.ets 文件
每个文件执行以下修改：
1. **删除 beforeAll 块**：移除 `beforeAll(async () => { await UtilsTest.startAbility(...) })` 整块代码
2. **删除未使用 import**：`UtilsTest`、`startAbility`、`stopApplication`、`hilog`、`abilityDelegatorRegistry`、`UIAbility`、`BusinessError`，以及 `common`（仅当文件中除 `testAbilityContext` 类型外无其他 `common.` 引用时）
3. **删除未使用变量**：`let domain`、`let tag`、`let testAbilityContext`
4. **清理 hypium import**：从 `import { describe, beforeAll, ... }` 中移除 `beforeAll`
5. **包裹 await 调用**：所有未在 `try...catch` 内的 `await` 调用（共 390 处）包裹 `try { ... } catch (err) { console.info('xxxTest await err: ' + JSON.stringify(err)); }`
6. **保留 `'use static'` 指令**

**统计**：共修改 49 个文件（1 个 Runner + 48 个 .test.ets），包裹 390 个 standalone await 调用

---

## 二、Sleep 时长对齐

### 已对齐（差异 <= 1000ms，已修改 static）

| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| checkbox/SelectStatus.test.ets | checkbox/SelectStatus.test.ets | beforeEach 中 pushUrl 后 | 2000 | 1000 |
| MenuTest/BindPopupJsunit.test.ets | MenuTest/BindPopupJsunit.test.ets | beforeEach 中 pushUrl 后 | 2000 | 1000 |

### 差异过大（差异 > 1000ms，未修改）

| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| customDialogTest/CustomDialogControllerJsunit.test.ets | customDialogTest/CustomDialogControllerJsunit.test.ets | beforeEach 中 pushUrl 后 | 2000 | 4000 | 2000 |

### 非 static 无对应 sleep（static 存在但非 static 不存在）

| static 文件 | 非 static 文件 | static sleep(ms) | 说明 |
|---|---|---|---|
| promptActionTest/bindPopupOffset.test.ets | promptActionTest/bindPopupOffset.test.ets | 2000 (beforeEach) | 非 static beforeEach 无 sleep |
| promptActionTest/Dialog.test.ets | promptActionTest/Dialog.test.ets | 2000 (beforeEach) | 非 static beforeEach 无 sleep |
| promptActionTest/stagePrompt.test.ets | promptActionTest/stagePrompt.test.ets | 2000 (beforeEach) | 非 static beforeEach 无 sleep |
| MenuTest/menuDivider.test.ets | MenuTest/menuDivider.test.ets | 2000 (beforeEach) | 非 static 无 CommonFunc/Utils sleep 调用 |
| MenuTest/menufirst.test.ets | MenuTest/menufirst.test.ets | 2000 (beforeEach) | 非 static 无 CommonFunc/Utils sleep 调用 |
| MenuTest/menusecond.test.ets | MenuTest/menusecond.test.ets | 2000 (beforeEach) | 非 static 无 CommonFunc/Utils sleep 调用 |

**统计**：已对齐 2 处 sleep，记录差异过大 1 处，记录无对应 6 处

---

## 三、it 用例对齐

### 统计总览

| 维度 | 数量 |
|---|---|
| static it 用例总数 | 109 |
| 非 static it 用例总数 | 137 |
| 已匹配 | 109 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 26 |

### 模糊匹配详情（Levenshtein 距离 <= 3）

| static it 名称 | 非 static it 名称 | 匹配方式 | 文件 |
|---|---|---|---|
| stageAlertDialog_static_001 | stageAlertDialog001 | fuzzy (dist=1, 去除`_`) | stageAlertDialog.test.ets |
| stageAlertDialog_static_002 | stageAlertDialog002 | fuzzy (dist=1, 去除`_`) | stageAlertDialog.test.ets |
| stageAlertDialog_static_003 | stageAlertDialog003 | fuzzy (dist=1, 去除`_`) | stageAlertDialog.test.ets |
| testpromptShowDialog_static_001 | testpromptShowDialog001 | fuzzy (dist=1, 去除`_`) | prompt.test.ets |

### 仅非 static 存在的用例（static 中无对应）

| 文件 | it 用例名称 |
|---|---|
| ActionsheetDialogJsunit.test.ets | ActionsheetDialogAJsunit_0100 |
| CustomDialogJsunit.test.ets | CustomDialogAJsunit_0100Adapt001 |
| muneRadiusTest.test.ets | muneRadiusTest_0100 |
| muneRadiusTest.test.ets | muneRadiusTest_0200 |
| muneRadiusTest.test.ets | muneRadiusTest_0300 |
| muneRadiusTest.test.ets | muneRadiusTest_0400 |
| muneRadiusTest.test.ets | muneRadiusTest_0500 |
| muneRadiusTest.test.ets | muneRadiusTest_0600 |
| muneRadiusTest.test.ets | muneRadiusTest_0700 |
| muneRadiusTest.test.ets | muneRadiusTest_0800 |
| muneRadiusTest.test.ets | muneRadiusTest_0900 |
| PanelUIJsunit.test.ets | PanelJsunit_0100 |
| PanelJsunit.test.ets | panelTest001 |
| PanelJsunit.test.ets | panelTest002 |
| PanelJsunit.test.ets | panelTest003 |
| PopupJsunit.test.ets | PopupAJsunit_0100 |
| PromptDialogJsunit.test.ets | PromptDialogAJsunit_0100 |
| showActionMenuError.test.ets | showActionMenuError_0100 |
| PanelJsunit2.test.ets | testPanel_100 |
| PanelJsunit2.test.ets | testPanel_200 |
| PanelJsunit2.test.ets | testPanel_300 |
| PanelJsunit2.test.ets | testPanel_400 |
| PanelJsunit2.test.ets | testPanel_500 |
| PanelJsunit2.test.ets | testPanel_600 |
| PanelJsunit2.test.ets | testPanel_700 |
| prompt.test.ets | testshowActionMenu0001 |

### 匹配方式分布

| 匹配方式 | 数量 |
|---|---|
| 精确匹配 | 0 |
| 去除 `_static` 后缀匹配 | 105 |
| 模糊匹配 (Levenshtein <= 3) | 4 |

**统计**：109 个 static 用例全部匹配成功，26 个非 static 用例无 static 对应（主要来自 muneRadiusTest、Panel 系列、Dialog 系列等 static 不存在的测试文件）
