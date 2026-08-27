# ActsAceEtsModuleDialogApi19StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | 全局启动一次 |
| entry/src/main/src/test/alertDialogTest/alertDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/alertDialogTest/alertDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/customDialogTest/customDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/customDialogTest/customDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/customDialogTest/CustomDialogControllerOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/closeMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/openCustomDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/openCustomDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/openMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/openMenuAnchorPosition.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/showDialogBackgroundEffect1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/showDialogBackgroundEffect2.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/showDialogBlurStyleOptions1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/showDialogBlurStyleOptions2.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/updateMenu.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/promptActionTest/updateMenuAnchorPosition.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/selectDividerTest/selectDividerTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/openCustomDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/openCustomDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/presentCustomDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/presentCustomDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/showAlertDialogBackgroundEffect.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/showAlertDialogBlurStyleOptions.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/showDialogBackgroundEffect1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/showDialogBackgroundEffect2.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/showDialogBlurStyleOptions1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |
| entry/src/main/src/test/UIContextTest/showDialogBlurStyleOptions2.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫 | ~4s |

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
  import { UtilsTest } from '../Util.test';
  import {
    afterEach,
    beforeAll,
    beforeEach,
    describe,
    expect,
    it,
    Level,
    Size,
    TestType
  } from '../../../../hypium/index';
  ...
  beforeAll(async (): Promise<void> => {
    console.info("xxxTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // UtilsTest import 已删除
  import {
    afterEach,
    beforeEach,  // beforeAll 已从 import 中移除
    describe,
    expect,
    it,
    Level,
    Size,
    TestType
  } from '../../../../hypium/index';
  ...
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```

### 总结
- 共修改 **28 个文件**（1 个 OpenHarmonyTestRunner.ets + 27 个 .test.ets 文件）
- 每个 .test.ets 文件删除了 beforeAll 块、UtilsTest import、beforeAll hypium import
- 保留了 `'use static'` 指令
- Ability 启动统一在 OpenHarmonyTestRunner.onRun 中通过 `executeShellCommand` + `setTimeout(4000)` 完成

---

## 二、Sleep 时长对齐

### 对应非 static 测试套
- static 目录：`ace_ets_module_dialog_api19_static`
- 非 static 目录：`ace_ets_module_dialog_api19`（存在）

### 已对齐（差异 <= 1000ms）
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) | 差异(ms) |
|---|---|---|---|---|---|
| customDialogTest/customDialogBlurStyleOptions.test.ets | customDialogTest/customDialogBlurStyleOptions.test.ets | L141 (it_0100 结尾 btn2 click 后) | 2000 | 1000 | 1000 |
| customDialogTest/customDialogBlurStyleOptions.test.ets | customDialogTest/customDialogBlurStyleOptions.test.ets | L197 (it_0200 结尾 btn2 click 后) | 2000 | 1000 | 1000 |

### 差异过大（未修改，差异 > 1000ms）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| alertDialogTest/alertDialogBackgroundEffect.test.ets | alertDialogTest/alertDialogBackgroundEffect.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| alertDialogTest/alertDialogBlurStyleOptions.test.ets | alertDialogTest/alertDialogBlurStyleOptions.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| customDialogTest/customDialogBackgroundEffect.test.ets | customDialogTest/customDialogBackgroundEffect.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| customDialogTest/CustomDialogControllerOptions.test.ets | customDialogTest/CustomDialogControllerOptions.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/closeMenu.test.ets | promptActionTest/closeMenu.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/openCustomDialogBackgroundEffect.test.ets | promptActionTest/openCustomDialogBackgroundEffect.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/openCustomDialogBlurStyleOptions.test.ets | promptActionTest/openCustomDialogBlurStyleOptions.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/openMenu.test.ets | promptActionTest/openMenu.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/showDialogBackgroundEffect1.test.ets | promptActionTest/showDialogBackgroundEffect1.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/showDialogBackgroundEffect2.test.ets | promptActionTest/showDialogBackgroundEffect2.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/showDialogBlurStyleOptions1.test.ets | promptActionTest/showDialogBlurStyleOptions1.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/showDialogBlurStyleOptions2.test.ets | promptActionTest/showDialogBlurStyleOptions2.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| promptActionTest/updateMenu.test.ets | promptActionTest/updateMenu.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| selectDividerTest/selectDividerTest.test.ets | selectDividerTest/selectDividerTest.test.ets | beforeEach (pushUrl 后) | 无 | 5000 | 5000 |
| UIContextTest/openCustomDialogBackgroundEffect.test.ets | UIContextTest/openCustomDialogBackgroundEffect.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/openCustomDialogBlurStyleOptions.test.ets | UIContextTest/openCustomDialogBlurStyleOptions.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/presentCustomDialogBackgroundEffect.test.ets | UIContextTest/presentCustomDialogBackgroundEffect.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/presentCustomDialogBlurStyleOptions.test.ets | UIContextTest/presentCustomDialogBlurStyleOptions.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/showAlertDialogBackgroundEffect.test.ets | UIContextTest/showAlertDialogBackgroundEffect.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/showAlertDialogBlurStyleOptions.test.ets | UIContextTest/showAlertDialogBlurStyleOptions.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/showDialogBackgroundEffect1.test.ets | UIContextTest/showDialogBackgroundEffect1.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/showDialogBackgroundEffect2.test.ets | UIContextTest/showDialogBackgroundEffect2.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/showDialogBlurStyleOptions1.test.ets | UIContextTest/showDialogBlurStyleOptions1.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |
| UIContextTest/showDialogBlurStyleOptions2.test.ets | UIContextTest/showDialogBlurStyleOptions2.test.ets | beforeEach (pushUrl 后) | 无 | 2000 | 2000 |

> 说明：static 版本 beforeEach 中 `routerInstance.pushUrl()` 未 await 也未 sleep，而非 static 版本在 `await router.push()` 后有 `await Utils.sleep(2000)`（selectDividerTest 为 5000ms）等待页面加载。差异均 > 1000ms，按规则仅记录不修改。

### 对应非 static 测试套不存在
| static 文件 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| promptActionTest/openMenuAnchorPosition.test.ets | promptActionTest/openMenuAnchorPosition.test.ets | 否 |
| promptActionTest/updateMenuAnchorPosition.test.ets | promptActionTest/updateMenuAnchorPosition.test.ets | 否 |

---

## 三、it 用例对齐

### 统计
| 类别 | 数量 |
|---|---|
| 已匹配 | 64 |
| 仅 static 存在 | 6 |
| 仅非 static 存在 | 0 |
| static 用例总数 | 70 |
| 非 static 用例总数 | 64 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 | 原因 |
|---|---|---|
| promptActionTest/openMenuAnchorPosition.test.ets | openMenuAnchorPositionTest_static_0100 | 非 static 无此测试文件 |
| promptActionTest/openMenuAnchorPosition.test.ets | openMenuAnchorPositionTest_static_0200 | 非 static 无此测试文件 |
| promptActionTest/openMenuAnchorPosition.test.ets | openMenuAnchorPositionTest_static_0300 | 非 static 无此测试文件 |
| promptActionTest/updateMenuAnchorPosition.test.ets | updateMenuAnchorPositionTest_static_0100 | 非 static 无此测试文件 |
| promptActionTest/updateMenuAnchorPosition.test.ets | updateMenuAnchorPositionTest_static_0200 | 非 static 无此测试文件 |
| promptActionTest/updateMenuAnchorPosition.test.ets | updateMenuAnchorPositionTest_static_0300 | 非 static 无此测试文件 |

### 仅非 static 存在的用例（static 中无对应）
无

### 已匹配的用例（共 64 个，按匹配方式分类）

#### 精确匹配（exact）- 38 个
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| closeMenu.test.ets | closeMenuTest_0100 | closeMenu.test.ets | closeMenuTest_0100 | exact |
| openCustomDialogBackgroundEffect.test.ets | UIOpenCustomDialogBackgroundEffectTest_0100 | openCustomDialogBackgroundEffect.test.ets | UIOpenCustomDialogBackgroundEffectTest_0100 | exact |
| openCustomDialogBackgroundEffect.test.ets | UIOpenCustomDialogBackgroundEffectTest_0200 | openCustomDialogBackgroundEffect.test.ets | UIOpenCustomDialogBackgroundEffectTest_0200 | exact |
| openCustomDialogBackgroundEffect.test.ets | UIOpenCustomDialogBackgroundEffectTest_0300 | openCustomDialogBackgroundEffect.test.ets | UIOpenCustomDialogBackgroundEffectTest_0300 | exact |
| openCustomDialogBlurStyleOptions.test.ets | UIOpenCustomDialogBlurStyleOptions_0100 | openCustomDialogBlurStyleOptions.test.ets | UIOpenCustomDialogBlurStyleOptions_0100 | exact |
| openCustomDialogBlurStyleOptions.test.ets | UIOpenCustomDialogBlurStyleOptions_0200 | openCustomDialogBlurStyleOptions.test.ets | UIOpenCustomDialogBlurStyleOptions_0200 | exact |
| openCustomDialogBlurStyleOptions.test.ets | UIOpenCustomDialogBlurStyleOptions_0300 | openCustomDialogBlurStyleOptions.test.ets | UIOpenCustomDialogBlurStyleOptions_0300 | exact |
| presentCustomDialogBackgroundEffect.test.ets | UIPresentCustomDialogBackgroundEffectTest_0100 | presentCustomDialogBackgroundEffect.test.ets | UIPresentCustomDialogBackgroundEffectTest_0100 | exact |
| presentCustomDialogBackgroundEffect.test.ets | UIPresentCustomDialogBackgroundEffectTest_0200 | presentCustomDialogBackgroundEffect.test.ets | UIPresentCustomDialogBackgroundEffectTest_0200 | exact |
| presentCustomDialogBackgroundEffect.test.ets | UIPresentCustomDialogBackgroundEffectTest_0300 | presentCustomDialogBackgroundEffect.test.ets | UIPresentCustomDialogBackgroundEffectTest_0300 | exact |
| presentCustomDialogBlurStyleOptions.test.ets | UIPresentCustomDialogBlurStyleOptions_0100 | presentCustomDialogBlurStyleOptions.test.ets | UIPresentCustomDialogBlurStyleOptions_0100 | exact |
| presentCustomDialogBlurStyleOptions.test.ets | UIPresentCustomDialogBlurStyleOptions_0200 | presentCustomDialogBlurStyleOptions.test.ets | UIPresentCustomDialogBlurStyleOptions_0200 | exact |
| presentCustomDialogBlurStyleOptions.test.ets | UIPresentCustomDialogBlurStyleOptions_0300 | presentCustomDialogBlurStyleOptions.test.ets | UIPresentCustomDialogBlurStyleOptions_0300 | exact |
| showAlertDialogBackgroundEffect.test.ets | showAlertDialogBackgroundEffectTest_0100 | showAlertDialogBackgroundEffect.test.ets | showAlertDialogBackgroundEffectTest_0100 | exact |
| showAlertDialogBackgroundEffect.test.ets | showAlertDialogBackgroundEffectTest_0200 | showAlertDialogBackgroundEffect.test.ets | showAlertDialogBackgroundEffectTest_0200 | exact |
| showAlertDialogBackgroundEffect.test.ets | showAlertDialogBackgroundEffectTest_0300 | showAlertDialogBackgroundEffect.test.ets | showAlertDialogBackgroundEffectTest_0300 | exact |
| showAlertDialogBlurStyleOptions.test.ets | showAlertDialogBlurStyleOptions_0100 | showAlertDialogBlurStyleOptions.test.ets | showAlertDialogBlurStyleOptions_0100 | exact |
| showAlertDialogBlurStyleOptions.test.ets | showAlertDialogBlurStyleOptions_0200 | showAlertDialogBlurStyleOptions.test.ets | showAlertDialogBlurStyleOptions_0200 | exact |
| showAlertDialogBlurStyleOptions.test.ets | showAlertDialogBlurStyleOptions_0300 | showAlertDialogBlurStyleOptions.test.ets | showAlertDialogBlurStyleOptions_0300 | exact |
| showDialogBackgroundEffect1.test.ets | UIShowDialogBackgroundEffectTest_0100 | showDialogBackgroundEffect1.test.ets | UIShowDialogBackgroundEffectTest_0100 | exact |
| showDialogBackgroundEffect1.test.ets | UIShowDialogBackgroundEffectTest_0200 | showDialogBackgroundEffect1.test.ets | UIShowDialogBackgroundEffectTest_0200 | exact |
| showDialogBackgroundEffect1.test.ets | UIShowDialogBackgroundEffectTest_0300 | showDialogBackgroundEffect1.test.ets | UIShowDialogBackgroundEffectTest_0300 | exact |
| showDialogBackgroundEffect2.test.ets | showDialogCallbackBackgroundEffectTest_0100 | showDialogBackgroundEffect2.test.ets | showDialogCallbackBackgroundEffectTest_0100 | exact |
| showDialogBackgroundEffect2.test.ets | showDialogCallbackBackgroundEffectTest_0200 | showDialogBackgroundEffect2.test.ets | showDialogCallbackBackgroundEffectTest_0200 | exact |
| showDialogBackgroundEffect2.test.ets | showDialogCallbackBackgroundEffectTest_0300 | showDialogBackgroundEffect2.test.ets | showDialogCallbackBackgroundEffectTest_0300 | exact |
| showDialogBackgroundEffect2.test.ets | UIShowDialogCallbackBackgroundEffectTest_0100 | showDialogBackgroundEffect2.test.ets | UIShowDialogCallbackBackgroundEffectTest_0100 | exact |
| showDialogBackgroundEffect2.test.ets | UIShowDialogCallbackBackgroundEffectTest_0200 | showDialogBackgroundEffect2.test.ets | UIShowDialogCallbackBackgroundEffectTest_0200 | exact |
| showDialogBackgroundEffect2.test.ets | UIShowDialogCallbackBackgroundEffectTest_0300 | showDialogBackgroundEffect2.test.ets | UIShowDialogCallbackBackgroundEffectTest_0300 | exact |
| showDialogBlurStyleOptions1.test.ets | UIShowDialogBlurStyleOptions_0100 | showDialogBlurStyleOptions1.test.ets | UIShowDialogBlurStyleOptions_0100 | exact |
| showDialogBlurStyleOptions1.test.ets | UIShowDialogBlurStyleOptions_0200 | showDialogBlurStyleOptions1.test.ets | UIShowDialogBlurStyleOptions_0200 | exact |
| showDialogBlurStyleOptions1.test.ets | UIShowDialogBlurStyleOptions_0300 | showDialogBlurStyleOptions1.test.ets | UIShowDialogBlurStyleOptions_0300 | exact |
| showDialogBlurStyleOptions2.test.ets | UIShowDialogCallbackBlurStyleOptions_0100 | showDialogBlurStyleOptions2.test.ets | UIShowDialogCallbackBlurStyleOptions_0100 | exact |
| showDialogBlurStyleOptions2.test.ets | UIShowDialogCallbackBlurStyleOptions_0200 | showDialogBlurStyleOptions2.test.ets | UIShowDialogCallbackBlurStyleOptions_0200 | exact |
| showDialogBlurStyleOptions2.test.ets | UIShowDialogCallbackBlurStyleOptions_0300 | showDialogBlurStyleOptions2.test.ets | UIShowDialogCallbackBlurStyleOptions_0300 | exact |

#### 去除 _static 匹配（remove_static）- 26 个
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| alertDialogBackgroundEffect.test.ets | alertDialogBackgroundEffectTest_static_0100 | alertDialogBackgroundEffect.test.ets | alertDialogBackgroundEffectTest_0100 | remove_static |
| alertDialogBackgroundEffect.test.ets | alertDialogBackgroundEffectTest_static_0200 | alertDialogBackgroundEffect.test.ets | alertDialogBackgroundEffectTest_0200 | remove_static |
| alertDialogBackgroundEffect.test.ets | alertDialogBackgroundEffectTest_static_0300 | alertDialogBackgroundEffect.test.ets | alertDialogBackgroundEffectTest_0300 | remove_static |
| alertDialogBlurStyleOptions.test.ets | alertDialogBlurStyleOptions_static_0100 | alertDialogBlurStyleOptions.test.ets | alertDialogBlurStyleOptions_0100 | remove_static |
| alertDialogBlurStyleOptions.test.ets | alertDialogBlurStyleOptions_static_0200 | alertDialogBlurStyleOptions.test.ets | alertDialogBlurStyleOptions_0200 | remove_static |
| alertDialogBlurStyleOptions.test.ets | alertDialogBlurStyleOptions_static_0300 | alertDialogBlurStyleOptions.test.ets | alertDialogBlurStyleOptions_0300 | remove_static |
| customDialogBackgroundEffect.test.ets | customDialogBackgroundEffectTest_static_0100 | customDialogBackgroundEffect.test.ets | customDialogBackgroundEffectTest_0100 | remove_static |
| customDialogBackgroundEffect.test.ets | customDialogBackgroundEffectTest_static_0200 | customDialogBackgroundEffect.test.ets | customDialogBackgroundEffectTest_0200 | remove_static |
| customDialogBlurStyleOptions.test.ets | customDialogBlurStyleOptions_static_0100 | customDialogBlurStyleOptions.test.ets | customDialogBlurStyleOptions_0100 | remove_static |
| customDialogBlurStyleOptions.test.ets | customDialogBlurStyleOptions_static_0200 | customDialogBlurStyleOptions.test.ets | customDialogBlurStyleOptions_0200 | remove_static |
| CustomDialogControllerOptions.test.ets | CustomDialogControllerOptionsTest_static_0100 | CustomDialogControllerOptions.test.ets | CustomDialogControllerOptionsTest_0100 | remove_static |
| openCustomDialogBackgroundEffect.test.ets | openCustomDialogBackgroundEffectTest_static_0100 | openCustomDialogBackgroundEffect.test.ets | openCustomDialogBackgroundEffectTest_0100 | remove_static |
| openCustomDialogBackgroundEffect.test.ets | openCustomDialogBackgroundEffectTest_static_0200 | openCustomDialogBackgroundEffect.test.ets | openCustomDialogBackgroundEffectTest_0200 | remove_static |
| openCustomDialogBackgroundEffect.test.ets | openCustomDialogBackgroundEffectTest_static_0300 | openCustomDialogBackgroundEffect.test.ets | openCustomDialogBackgroundEffectTest_0300 | remove_static |
| openCustomDialogBlurStyleOptions.test.ets | openCustomDialogBlurStyleOptions_static_0100 | openCustomDialogBlurStyleOptions.test.ets | openCustomDialogBlurStyleOptions_0100 | remove_static |
| openCustomDialogBlurStyleOptions.test.ets | openCustomDialogBlurStyleOptions_static_0200 | openCustomDialogBlurStyleOptions.test.ets | openCustomDialogBlurStyleOptions_0200 | remove_static |
| openCustomDialogBlurStyleOptions.test.ets | openCustomDialogBlurStyleOptions_static_0300 | openCustomDialogBlurStyleOptions.test.ets | openCustomDialogBlurStyleOptions_0300 | remove_static |
| openMenu.test.ets | openMenuTest_static_0100 | openMenu.test.ets | openMenuTest_0100 | remove_static |
| selectDividerTest.test.ets | selectDividerTest_static_001 | selectDividerTest.test.ets | selectDividerTest_001 | remove_static |
| selectDividerTest.test.ets | selectDividerTest_static_002 | selectDividerTest.test.ets | selectDividerTest_002 | remove_static |
| showDialogBackgroundEffect1.test.ets | showDialogBackgroundEffectTest_static_0100 | showDialogBackgroundEffect1.test.ets | showDialogBackgroundEffectTest_0100 | remove_static |
| showDialogBackgroundEffect1.test.ets | showDialogBackgroundEffectTest_static_0200 | showDialogBackgroundEffect1.test.ets | showDialogBackgroundEffectTest_0200 | remove_static |
| showDialogBackgroundEffect1.test.ets | showDialogBackgroundEffectTest_static_0300 | showDialogBackgroundEffect1.test.ets | showDialogBackgroundEffectTest_0300 | remove_static |
| showDialogBlurStyleOptions1.test.ets | showDialogBlurStyleOptions_static_0100 | showDialogBlurStyleOptions1.test.ets | showDialogBlurStyleOptions_0100 | remove_static |
| showDialogBlurStyleOptions1.test.ets | showDialogBlurStyleOptions_static_0200 | showDialogBlurStyleOptions1.test.ets | showDialogBlurStyleOptions_0200 | remove_static |
| showDialogBlurStyleOptions1.test.ets | showDialogBlurStyleOptions_static_0300 | showDialogBlurStyleOptions1.test.ets | showDialogBlurStyleOptions_0300 | remove_static |
| showDialogBlurStyleOptions2.test.ets | showDialogCallbackBlurStyleOptions_static_0100 | showDialogBlurStyleOptions2.test.ets | showDialogCallbackBlurStyleOptions_0100 | remove_static |
| showDialogBlurStyleOptions2.test.ets | showDialogCallbackBlurStyleOptions_static_0200 | showDialogBlurStyleOptions2.test.ets | showDialogCallbackBlurStyleOptions_0200 | remove_static |
| showDialogBlurStyleOptions2.test.ets | showDialogCallbackBlurStyleOptions_static_0300 | showDialogBlurStyleOptions2.test.ets | showDialogCallbackBlurStyleOptions_0300 | remove_static |
| updateMenu.test.ets | updateMenuTest_static_0100 | updateMenu.test.ets | updateMenuTest_0100 | remove_static |

---

## 总结

| 优化项 | 修改数量 | 详情 |
|---|---|---|
| 启动方式优化 | 28 个文件 | 1 个 OpenHarmonyTestRunner.ets + 27 个 .test.ets 文件 |
| Sleep 时长对齐 | 2 处修改 | customDialogBlurStyleOptions.test.ets 中 2 处 2000ms→1000ms（差异=1000ms） |
| Sleep 差异记录 | 24 处 | 23 处 beforeEach 缺失 2000ms + 1 处 selectDividerTest beforeEach 缺失 5000ms（差异 > 1000ms） |
| it 用例匹配 | 64 个匹配 | 38 个精确匹配 + 26 个去除 _static 匹配 |
| it 用例仅 static 存在 | 6 个 | openMenuAnchorPosition (3) + updateMenuAnchorPosition (3)，非 static 无对应文件 |
| it 用例仅非 static 存在 | 0 个 | - |
