# ActsAceEtsModuleDialogApi23StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/ButtonOptionsTest/ButtonOptions.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/AlertDialogTest/AlertDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/ConfirmDialogTest/ConfirmDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/SelectDialogTest/SelectDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/TipsDialogTest/TipsDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/CustomContentDialogTest/CustomContentDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/LoadingDialogTest/LoadingDialog.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入 | ~4s |
| entry/src/main/src/test/PopupOptions/PopupOptionsSystemMaterialTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |
| entry/src/main/src/test/PopupOptions/PopupOptionsColorModeTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |
| entry/src/main/src/test/PopupCommonOptions/PopupCommonOptionsColorModeSystemMaterialTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |
| entry/src/main/src/test/CustomPopupOptions/CustomPopupOptionsColorModeTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |
| entry/src/main/src/test/CustomPopupOptions/CustomPopupOptionsSystemMaterialTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |
| entry/src/main/src/test/ContextMenuOptions/ContextMenuOptionsColorModeTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |
| entry/src/main/src/test/SheetOptions/SheetOptionsSystemMaterialTest.test.ets | 删除 beforeAll 中的 startAbility 调用，清理 beforeAll/abilityDelegatorRegistry/UtilsTest 导入，it 块补 try-catch | ~4s |

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
  import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
  import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
  import { UtilsTest } from '../Util.test';
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
  });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
  import { Driver, ON, MatchPattern } from '@kit.TestKit';
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // UtilsTest 导入已删除（不再使用）
  // abilityDelegatorRegistry 导入已删除（不再使用）
  ```
- **额外修改**：Group B 文件（PopupOptions/CustomPopupOptions/ContextMenuOptions/SheetOptions/PopupCommonOptions 下的测试文件）中所有 it 块的 standalone await 调用已包裹 try-catch 错误捕获

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_api23_static | ace_ets_module_dialog_api23 | 否 |

### 查找过程
1. **目录名推导**：去掉 `_static` 后缀得到 `ace_ets_module_dialog_api23`，在同父目录下未找到该目录
2. **it 用例名反向查找**：提取 static 中的 it 用例名（如 `buttonOptionsNormalNormal`、`alertDialogPrimaryTitle`、`PopupOptionsSystemMaterial_0100`）在代码库中 Grep 搜索，仅在 static 目录本身找到匹配，未在任何非 static 测试套中找到对应用例
3. **相邻 API 版本检查**：检查了 `ace_ets_module_dialog_api26`（非 static），其测试文件（DialogStyleAlert、DialogAbnormalOpts 等）与 api23 static 的测试内容完全不同，非同一功能的非 static 版本

### 结论
由于非 static 对应测试套不存在，无法进行 sleep 时长对齐。static 测试套中主要 sleep 时长如下（记录用）：
- `Utils.sleep(500)` - beforeEach 中页面跳转后等待
- `Utils.sleep(1000)` - it 块中点击后等待弹窗打开
- `Utils.sleep(1500)` - theme 相关用例中等待弹窗打开
- `Utils.sleep(300)` - afterEach 中关闭弹窗后等待
- `CommonFunc.sleep(1000)` - Group B 文件中等待操作完成
- `CommonFunc.sleep(2000)` - ColorMode 测试中等待

## 三、it 用例对齐

### 对应非 static 测试套不存在
由于非 static 对应测试套 `ace_ets_module_dialog_api23` 不存在，无法进行 it 用例名对齐。

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| ButtonOptions.test.ets | buttonOptionsNormalNormal |
| ButtonOptions.test.ets | buttonOptionsNormalError |
| ButtonOptions.test.ets | buttonOptionsEmphasizedNormal |
| ButtonOptions.test.ets | buttonOptionsEmphasizedError |
| ButtonOptions.test.ets | buttonOptionsTextualNormal |
| ButtonOptions.test.ets | buttonOptionsTextualError |
| AlertDialog.test.ets | alertDialogPrimaryTitle |
| AlertDialog.test.ets | alertDialogSecondaryTitle |
| AlertDialog.test.ets | alertDialogContent |
| AlertDialog.test.ets | alertDialogPrimaryButton |
| AlertDialog.test.ets | alertDialogSecondaryButton |
| AlertDialog.test.ets | alertDialogTheme |
| AlertDialog.test.ets | alertDialogThemeColorModeSystem |
| AlertDialog.test.ets | alertDialogThemeColorModeLight |
| AlertDialog.test.ets | alertDialogThemeColorModeDark |
| ConfirmDialog.test.ets | confirmDialogTitle |
| ConfirmDialog.test.ets | confirmDialogContent |
| ConfirmDialog.test.ets | confirmDialogCheckTips |
| ConfirmDialog.test.ets | confirmDialogIsCheckedTrue |
| ConfirmDialog.test.ets | confirmDialogIsCheckedFalse |
| ConfirmDialog.test.ets | confirmDialogPrimaryButton |
| ConfirmDialog.test.ets | confirmDialogSecondaryButton |
| ConfirmDialog.test.ets | confirmDialogTheme |
| ConfirmDialog.test.ets | confirmDialogThemeColorModeSystem |
| ConfirmDialog.test.ets | confirmDialogThemeColorModeLight |
| ConfirmDialog.test.ets | confirmDialogThemeColorModeDark |
| ConfirmDialog.test.ets | confirmDialogOnCheckedChange |
| SelectDialog.test.ets | selectDialogTitle |
| SelectDialog.test.ets | selectDialogContent |
| SelectDialog.test.ets | selectDialogSelectedIndex |
| SelectDialog.test.ets | selectDialogConfirm |
| SelectDialog.test.ets | selectDialogRadioContent |
| SelectDialog.test.ets | selectDialogTheme |
| SelectDialog.test.ets | selectDialogThemeColorModeSystem |
| SelectDialog.test.ets | selectDialogThemeColorModeLight |
| SelectDialog.test.ets | selectDialogThemeColorModeDark |
| TipsDialog.test.ets | tipsDialogThemeColorModeSystem |
| TipsDialog.test.ets | tipsDialogThemeColorModeLight |
| TipsDialog.test.ets | tipsDialogThemeColorModeDark |
| TipsDialog.test.ets | tipsDialogImageResImageSizeTitleContent |
| TipsDialog.test.ets | tipsDialogThemeCustomTheme |
| TipsDialog.test.ets | tipsDialogPrimaryButtonSecondaryButton |
| TipsDialog.test.ets | tipsDialogCheckTipsIsCheckedTrueCheckActionOnCheckedChange |
| TipsDialog.test.ets | tipsDialogIsCheckedFalse |
| CustomContentDialog.test.ets | customContentDialogPrimaryTitle |
| CustomContentDialog.test.ets | customContentDialogSecondaryTitle |
| CustomContentDialog.test.ets | customContentDialogContentBuilder |
| CustomContentDialog.test.ets | customContentDialogContentAreaPadding |
| CustomContentDialog.test.ets | customContentDialogButtons |
| LoadingDialog.test.ets | loadingDialogContent |
| LoadingDialog.test.ets | loadingDialogTheme |
| LoadingDialog.test.ets | loadingDialogThemeColorModeSystem |
| LoadingDialog.test.ets | loadingDialogThemeColorModeLight |
| LoadingDialog.test.ets | loadingDialogThemeColorModeDark |
| PopupOptionsSystemMaterialTest.test.ets | PopupOptionsSystemMaterial_0100 |
| PopupOptionsSystemMaterialTest.test.ets | PopupOptionsSystemMaterial_0200 |
| PopupOptionsSystemMaterialTest.test.ets | PopupOptionsSystemMaterial_0300 |
| PopupOptionsSystemMaterialTest.test.ets | PopupOptionsSystemMaterial_0400 |
| PopupOptionsSystemMaterialTest.test.ets | PopupOptionsSystemMaterial_0500 |
| PopupOptionsSystemMaterialTest.test.ets | PopupOptionsSystemMaterial_0600 |
| PopupOptionsColorModeTest.test.ets | PopupOptionsColorModeTest_0100 |
| PopupCommonOptionsColorModeSystemMaterialTest.test.ets | PopupCommonOptionsColorModeSystemMaterialTest_0100 |
| CustomPopupOptionsColorModeTest.test.ets | CustomPopupOptionsColorModeTest_0100 |
| CustomPopupOptionsSystemMaterialTest.test.ets | CustomPopupOptionsSystemMaterial_0100 |
| CustomPopupOptionsSystemMaterialTest.test.ets | CustomPopupOptionsSystemMaterial_0200 |
| CustomPopupOptionsSystemMaterialTest.test.ets | CustomPopupOptionsSystemMaterial_0300 |
| CustomPopupOptionsSystemMaterialTest.test.ets | CustomPopupOptionsSystemMaterial_0400 |
| CustomPopupOptionsSystemMaterialTest.test.ets | CustomPopupOptionsSystemMaterial_0500 |
| CustomPopupOptionsSystemMaterialTest.test.ets | CustomPopupOptionsSystemMaterial_0600 |
| ContextMenuOptionsColorModeTest.test.ets | ContextMenuOptionsColorModeTest_0100 |
| SheetOptionsSystemMaterialTest.test.ets | SheetOptionsSystemMaterial_0100 |
| SheetOptionsSystemMaterialTest.test.ets | SheetOptionsSystemMaterial_0200 |
| SheetOptionsSystemMaterialTest.test.ets | SheetOptionsSystemMaterial_0300 |
| SheetOptionsSystemMaterialTest.test.ets | SheetOptionsSystemMaterial_0400 |
| SheetOptionsSystemMaterialTest.test.ets | SheetOptionsSystemMaterial_0500 |
| SheetOptionsSystemMaterialTest.test.ets | SheetOptionsSystemMaterial_0600 |

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| （无） | | | | 非 static 测试套不存在，无匹配项 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| （无） | 非 static 测试套不存在 |

## 总结

| 项目 | 数量 |
|---|---|
| 修改文件数 | 15（1 runner + 14 test.ets） |
| Sleep 时长对齐数 | 0（非 static 测试套不存在） |
| it 用例已匹配数 | 0（非 static 测试套不存在） |
| it 用例仅 static 存在数 | 76 |
| it 用例仅非 static 存在数 | 0 |
