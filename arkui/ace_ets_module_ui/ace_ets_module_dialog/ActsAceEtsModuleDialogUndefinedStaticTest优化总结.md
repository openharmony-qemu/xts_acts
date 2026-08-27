# ActsAceEtsModuleDialogUndefinedStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| buttonTest/buttonContentModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| buttonTest/buttonModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| buttonTest/buttonUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| CheckBoxTest/checkboxDemoOne.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| CheckBoxTest/checkboxModiferDemoOne.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| CheckBoxTest/checkBoxUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |
| CommonTest/bindContextMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| CommonTest/bindTipsUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| CommonTest/commonBindMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| CommonTest/commonBindPopup.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| menuItemTest/menuItemUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/window/common import | ~8s |
| menuTest/menuUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/window/common import | ~8s |
| RadioTest/radioModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| RadioTest/radioUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| RadioTest/radioUndefinedTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| RadioTest/radioUndefinedTest_one.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| ratingTest/ratingContentModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| ratingTest/ratingModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/window/common import | ~8s |
| ratingTest/ratingUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/window/common import | ~8s |
| SelectTest/selectModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| SelectTest/selectModifierUndefinedOne.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| SelectTest/selectModifierUndefinedTwo.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| SelectTest/selectUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| SelectTest/selectUndefinedFour.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| SelectTest/selectUndefinedOne.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| SelectTest/selectUndefinedThree.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest import | ~8s |
| SelectTest/selectUndefinedTwoTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |
| SliderTest/sliderModifierUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| SliderTest/sliderModifierUndefinedOneTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |
| SliderTest/sliderUndefined.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| SliderTest/sliderUndefinedOneTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError/KeyCode import | ~8s |
| ToggleTest/toggleModifierUndefinedTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |
| ToggleTest/toggleUndefinedTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、移除 UtilsTest/startAbility/events_emitter/hilog/abilityDelegatorRegistry/UIAbility/common/BusinessError import | ~8s |

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
  import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
  import { UtilsTest } from '../Util.test';
  // 或: import { UtilsTest, startAbility } from '../Util.test';

  beforeAll(async ():Promise<void> => {
    await UtilsTest.msSleep(4000);
    await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
    await UtilsTest.msSleep(4000);
  });
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, it, expect, Level } from "../../../../hypium/index"
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```
- **额外清理的未使用 import**：
  - `import events_emitter from '@ohos.events.emitter'`（19个文件）
  - `import hilog from '@ohos.hilog'`（19个文件）
  - `import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'`（19个文件）
  - `import UIAbility from '@ohos.app.ability.UIAbility'`（19个文件）
  - `import common from '@ohos.app.ability.common'`（23个文件）
  - `import { BusinessError } from '@ohos.base'`（19个文件）
  - `import type { KeyCode } from '@ohos.multimodalInput.keyCode'`（15个文件）
  - `import window from '@ohos.window'`（4个文件）
  - `import { Router, UIContext }` → `import { Router }`（19个文件，UIContext 未使用）
- **保留 `'use static'` 指令**：所有文件均保留

### 统计
- 修改文件总数：**36 个**（1个 OpenHarmonyTestRunner.ets + 35个 .test.ets 文件）
- 删除的 beforeAll 块：**35 个**
- 每个测试用例节省时间：约 **8 秒**（msSleep(4000) + startAbility + msSleep(4000)）
- 总优化效果：整个测试套只启动一次 Ability，由 OpenHarmonyTestRunner 统一管理

---

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_undefined_static | ace_ets_module_dialog_undefined | 不存在 |

### 查找过程
1. **目录名推导**：去掉 `_static` 后缀 → `ace_ets_module_dialog_undefined`，在同父目录下未找到
2. **反向查找**：提取 static 用例名（如 `buttonContentModifierUndefinedTest_0100`、`bindTipsUndefinedTest_0100`、`arrowModifier_0100`），去掉 `_static` 后缀后在 `ace_ets_module_ui` 目录下 Grep 搜索，未找到任何匹配文件
3. **全局搜索**：在整个 `arkui` 目录下搜索包含 `dialog_undefined` 的目录，仅找到 static 版本

### 结论
非 static 测试套不存在，无法进行 sleep 时长对齐。static 测试套中所有 sleep 调用保持不变。

### static 测试套 sleep 调用统计（仅供参考）
| sleep 时长 | 调用次数 |
|---|---|
| 500ms | 160 |
| 1000ms | 156 |
| 2000ms | 140 |
| 3000ms | 1 |
| 10000ms | 1 |
| **合计** | **458** |

---

## 三、it 用例对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_undefined_static | ace_ets_module_dialog_undefined | 不存在 |

### 仅 static 存在的用例（非 static 中无对应）
由于非 static 测试套不存在，所有 155 个 static 用例均为 static 专属用例。

| 文件 | it 用例名称 |
|---|---|
| buttonTest/buttonContentModifierUndefined.test.ets | buttonContentModifierUndefinedTest_static_0100 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0100 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0200 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0300 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0400 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0500 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0600 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0700 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0800 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_0900 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_1000 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_1100 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_1200 |
| buttonTest/buttonModifierUndefined.test.ets | buttonModifierUndefinedTest_static_1300 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0100 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0200 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0300 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0400 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0500 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0600 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0700 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0800 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_0900 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_1000 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_1100 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_1200 |
| buttonTest/buttonUndefined.test.ets | buttonUndefinedTest_static_1300 |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | checkboxGroupModifierUndefined_static_0001 |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | checkboxGroupModifierUndefined_static_0002 |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | checkboxGroupModifierUndefined_static_0003 |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | checkboxGroupModifierUndefined_static_0004 |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | checkboxGroupModifierUndefined_static_0005 |
| CheckBoxGroupTest/checkboxGroupModifierUndefined.test.ets | checkboxGroupModifierUndefined_static_0006 |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | checkboxGroupUndefined_static_0001 |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | checkboxGroupUndefined_static_0002 |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | checkboxGroupUndefined_static_0003 |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | checkboxGroupUndefined_static_0004 |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | checkboxGroupUndefined_static_0005 |
| CheckBoxGroupTest/checkboxGroupUndefined.test.ets | checkboxGroupUndefined_static_0006 |
| CheckBoxTest/checkboxDemoOne.test.ets | onChange_static_0100 |
| CheckBoxTest/checkboxDemoOne.test.ets | select_static_0200 |
| CheckBoxTest/checkboxModiferDemoOne.test.ets | selectModifier_static_0200 |
| CheckBoxTest/checkBoxUndefined.test.ets | CheckBoxUndefinedTest_static_0100 |
| CheckBoxTest/checkBoxUndefined.test.ets | CheckBoxUndefinedTest_static_0200 |
| CheckBoxTest/checkBoxUndefined.test.ets | CheckBoxUndefinedTest_static_0300 |
| CheckBoxTest/checkBoxUndefined.test.ets | CheckBoxUndefinedTest_static_0400 |
| CheckBoxTest/checkBoxUndefined.test.ets | CheckBoxUndefinedTest_static_0500 |
| CommonTest/bindContextMenu.test.ets | commonMenu_static_0001 |
| CommonTest/bindTipsUndefined.test.ets | bindTipsUndefinedTest_static_0100 |
| CommonTest/commonBindMenu.test.ets | commonBindMenu_static_0001 |
| CommonTest/commonBindMenu.test.ets | commonBindMenu_static_0002 |
| CommonTest/commonBindPopup.test.ets | commonBindPopup_static_0001 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0100 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0200 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0300 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0400 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0500 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0600 |
| menuItemTest/menuItemUndefined.test.ets | menuItemUndefinedTest_static_0700 |
| menuTest/menuUndefined.test.ets | menuUndefinedTest_static_0100 |
| menuTest/menuUndefined.test.ets | menuUndefinedTest_static_0200 |
| menuTest/menuUndefined.test.ets | menuUndefinedTest_static_0300 |
| menuTest/menuUndefined.test.ets | menuUndefinedTest_static_0400 |
| menuTest/menuUndefined.test.ets | menuUndefinedTest_static_0500 |
| menuTest/menuUndefined.test.ets | menuUndefinedTest_static_0600 |
| RadioTest/radioModifierUndefined.test.ets | radioModifierUndefined_static_0001 |
| RadioTest/radioModifierUndefined.test.ets | radioModifierUndefined_static_0002 |
| RadioTest/radioModifierUndefined.test.ets | radioModifierUndefined_static_0003 |
| RadioTest/radioUndefined.test.ets | radioUndefined_static_0001 |
| RadioTest/radioUndefined.test.ets | radioUndefined_static_0002 |
| RadioTest/radioUndefined.test.ets | radioUndefined_static_0003 |
| RadioTest/radioUndefined.test.ets | radioUndefined_static_0004 |
| RadioTest/radioUndefinedTest.test.ets | radioUndefinedTest_static_0001 |
| RadioTest/radioUndefinedTest_one.test.ets | radioUndefined_one_static_0001 |
| ratingTest/ratingContentModifierUndefined.test.ets | ratingContentModifierUndefinedTest_static_0100 |
| ratingTest/ratingModifierUndefined.test.ets | ratingModifierUndefinedTest_static_0100 |
| ratingTest/ratingModifierUndefined.test.ets | ratingModifierUndefinedTest_static_0200 |
| ratingTest/ratingModifierUndefined.test.ets | ratingModifierUndefinedTest_static_0300 |
| ratingTest/ratingModifierUndefined.test.ets | ratingModifierUndefinedTest_static_0400 |
| ratingTest/ratingUndefined.test.ets | ratingUndefinedTest_static_0100 |
| ratingTest/ratingUndefined.test.ets | ratingUndefinedTest_static_0200 |
| ratingTest/ratingUndefined.test.ets | ratingUndefinedTest_static_0300 |
| SelectTest/selectModifierUndefined.test.ets | selectModifierUndefined_static_0001 |
| SelectTest/selectModifierUndefined.test.ets | selectModifierUndefined_static_0002 |
| SelectTest/selectModifierUndefined.test.ets | selectModifierUndefined_static_0003 |
| SelectTest/selectModifierUndefined.test.ets | selectModifierUndefined_static_0004 |
| SelectTest/selectModifierUndefinedOne.test.ets | menuAlignModifier_static_0100 |
| SelectTest/selectModifierUndefinedOne.test.ets | menuBackgroundBlurStyleModifier_static_0200 |
| SelectTest/selectModifierUndefinedOne.test.ets | optionHeightModifier_static_0300 |
| SelectTest/selectModifierUndefinedOne.test.ets | menuBackgroundColorModifier_static_0400 |
| SelectTest/selectModifierUndefinedOne.test.ets | optionBgColorModifier_static_0500 |
| SelectTest/selectModifierUndefinedTwo.test.ets | fontModifier_static_0100 |
| SelectTest/selectModifierUndefinedTwo.test.ets | fontColorModifier_static_0200 |
| SelectTest/selectModifierUndefinedTwo.test.ets | valueModifier_static_0300 |
| SelectTest/selectModifierUndefinedTwo.test.ets | spaceModifier_static_0400 |
| SelectTest/selectModifierUndefinedTwo.test.ets | dividerModifier_static_0500 |
| SelectTest/selectModifierUndefinedTwo.test.ets | optionBgColorModifier_static_0600 |
| SelectTest/selectModifierUndefinedTwo.test.ets | arrowPositionModifier_static_0700 |
| SelectTest/selectModifierUndefinedTwo.test.ets | selectedOptionBgColorModifier_static_0800 |
| SelectTest/selectModifierUndefinedTwo.test.ets | selectedOptionFontModifier_static_0900 |
| SelectTest/selectModifierUndefinedTwo.test.ets | selectedOptionFontColorModifier_static_1000 |
| SelectTest/selectModifierUndefinedTwo.test.ets | controlSizeModifier_static_1100 |
| SelectTest/selectModifierUndefinedTwo.test.ets | dividerStyleModifier_static_1200 |
| SelectTest/selectUndefined.test.ets | selectUndefined_static_0001 |
| SelectTest/selectUndefined.test.ets | selectUndefined_static_0002 |
| SelectTest/selectUndefined.test.ets | selectUndefined_static_0003 |
| SelectTest/selectUndefined.test.ets | selectUndefined_static_0004 |
| SelectTest/selectUndefinedFour.test.ets | arrowModifier_static_0100 |
| SelectTest/selectUndefinedFour.test.ets | optionTextModifier_static_0200 |
| SelectTest/selectUndefinedFour.test.ets | selectedOptionTextModifier_static_0300 |
| SelectTest/selectUndefinedOne.test.ets | menuAlign_static_0100 |
| SelectTest/selectUndefinedOne.test.ets | menuBackgroundBlurStyle_static_0200 |
| SelectTest/selectUndefinedOne.test.ets | optionHeight_static_0300 |
| SelectTest/selectUndefinedOne.test.ets | menuBackgroundColor_static_0400 |
| SelectTest/selectUndefinedOne.test.ets | optionBgColor_static_0500 |
| SelectTest/selectUndefinedThree.test.ets | font_static_0100 |
| SelectTest/selectUndefinedThree.test.ets | fontColor_static_0200 |
| SelectTest/selectUndefinedThree.test.ets | value_static_0300 |
| SelectTest/selectUndefinedThree.test.ets | space_static_0400 |
| SelectTest/selectUndefinedThree.test.ets | divider_static_0500 |
| SelectTest/selectUndefinedThree.test.ets | optionBgColor_static_0600 |
| SelectTest/selectUndefinedThree.test.ets | arrowPosition_static_0700 |
| SelectTest/selectUndefinedThree.test.ets | selectedOptionBgColor_static_0800 |
| SelectTest/selectUndefinedThree.test.ets | selectedOptionFont_static_0900 |
| SelectTest/selectUndefinedThree.test.ets | selectedOptionFontColor_static_1000 |
| SelectTest/selectUndefinedThree.test.ets | controlSize_static_1100 |
| SelectTest/selectUndefinedThree.test.ets | dividerStyle_static_1200 |
| SelectTest/selectUndefinedTwoTest.test.ets | selectUndefinedTest_static_0100 |
| SliderTest/sliderModifierUndefined.test.ets | sliderModifierUndefined_static_0001 |
| SliderTest/sliderModifierUndefined.test.ets | sliderModifierUndefined_static_0002 |
| SliderTest/sliderModifierUndefined.test.ets | sliderModifierUndefined_static_0003 |
| SliderTest/sliderModifierUndefined.test.ets | sliderModifierUndefined_static_0004 |
| SliderTest/sliderModifierUndefined.test.ets | sliderModifierUndefined_static_0005 |
| SliderTest/sliderModifierUndefinedOneTest.test.ets | sliderModifierUndefined_one_static_0001 |
| SliderTest/sliderModifierUndefinedOneTest.test.ets | sliderModifierUndefined_one_static_0002 |
| SliderTest/sliderModifierUndefinedOneTest.test.ets | sliderModifierUndefined_one_static_0003 |
| SliderTest/sliderModifierUndefinedOneTest.test.ets | sliderModifierUndefined_one_static_0004 |
| SliderTest/sliderUndefined.test.ets | sliderUndefined_static_0001 |
| SliderTest/sliderUndefined.test.ets | sliderUndefined_static_0002 |
| SliderTest/sliderUndefined.test.ets | sliderUndefined_static_0003 |
| SliderTest/sliderUndefined.test.ets | sliderUndefined_static_0004 |
| SliderTest/sliderUndefined.test.ets | sliderUndefined_static_0005 |
| SliderTest/sliderUndefinedOneTest.test.ets | sliderUndefined_one_static_0001 |
| SliderTest/sliderUndefinedOneTest.test.ets | sliderUndefined_one_static_0002 |
| SliderTest/sliderUndefinedOneTest.test.ets | sliderUndefined_one_static_0003 |
| SliderTest/sliderUndefinedOneTest.test.ets | sliderUndefined_one_static_0004 |
| ToggleTest/toggleModifierUndefinedTest.test.ets | ToggleModifierUndefinedTest_static_0100 |
| ToggleTest/toggleModifierUndefinedTest.test.ets | ToggleModifierUndefinedTest_static_0200 |
| ToggleTest/toggleModifierUndefinedTest.test.ets | ToggleModifierUndefinedTest_static_0300 |
| ToggleTest/toggleModifierUndefinedTest.test.ets | ToggleModifierUndefinedTest_static_0400 |
| ToggleTest/toggleUndefinedTest.test.ets | ToggleUndefinedTest_static_0100 |
| ToggleTest/toggleUndefinedTest.test.ets | ToggleUndefinedTest_static_0200 |
| ToggleTest/toggleUndefinedTest.test.ets | ToggleUndefinedTest_static_0300 |
| ToggleTest/toggleUndefinedTest.test.ets | ToggleUndefinedTest_static_0400 |
| ToggleTest/toggleUndefinedTest.test.ets | ToggleUndefinedTest_static_0500 |

### 仅非 static 存在的用例（static 中无对应）
无（非 static 测试套不存在）

### 已匹配的用例
无（非 static 测试套不存在，无法匹配）

### 统计
- static 用例总数：**155 个**
- 已匹配用例：**0 个**
- 仅 static 存在用例：**155 个**
- 仅非 static 存在用例：**0 个**
