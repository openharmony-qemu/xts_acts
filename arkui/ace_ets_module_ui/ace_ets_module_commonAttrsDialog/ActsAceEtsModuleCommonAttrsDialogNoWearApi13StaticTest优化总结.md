# ActsAceEtsModuleCommonAttrsDialogNoWearApi13StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | ~4s（原 beforeAll 中 msSleep(4000) 移除） |
| entry/src/main/src/test/bindSheetTest/bindSheetKeyboardAvoidMode.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫、删除未使用 import 和变量、await 包裹 try-catch | ~4s |

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

#### bindSheetKeyboardAvoidMode.test.ets
- **修改前**：
  ```typescript
  import { beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
  import common from '@ohos.app.ability.common';
  import { UtilsTest } from '../Util.test';

  let domain: number = 0x0000;
  let tag: string = 'testTag';
  let testAbilityContext: common.UIAbilityContext;

  beforeAll(async (): Promise<void> => {
    console.info("bindSheetKeyboardAvoidMode beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.nowear.api13.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  import { beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // UtilsTest、common import 已删除
  // domain、tag、testAbilityContext 变量已删除
  ```
- **await 包裹 try-catch**：4 个 it 用例中的所有 standalone await 调用已包裹在 try...catch 块中

## 二、Sleep 时长对齐

### 对应非 static 测试套
- static 目录：`ace_ets_module_commonAttrsDialog_nowear_api13_static`
- 非 static 目录：`ace_ets_module_commonAttrsDialog_nowear_api13`（去掉 `_static` 后缀，同级目录）

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode.test.ets | beforeEach pushUrl 后 | 2000 | 2000（一致，无需修改） |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode.test.ets | it_0100 各步骤 sleep | 2000 | 2000（一致，无需修改） |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode.test.ets | it_0200 各步骤 sleep | 2000 | 2000（一致，无需修改） |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode.test.ets | it_0300 各步骤 sleep | 2000 | 2000（一致，无需修改） |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode.test.ets | it_0400 各步骤 sleep | 2000 | 2000（一致，无需修改） |

### 差异过大（未修改）
无

### 说明
static 与非 static 的 `bindSheetKeyboardAvoidMode.test.ets` 中所有 sleep 调用时长完全一致（均为 2000ms），无需对齐修改。非 static 目录中的 `menuControlTest/bindContextMenuAnchorPosition.test.ets` 和 `menuControlTest/bindMenuAnchorPosition.test.ets` 在 static 目录中无对应文件，不涉及 sleep 对齐。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_static_0100 | bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_0100 | 去除 _static 后缀 |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_static_0200 | bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_0200 | 去除 _static 后缀 |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_static_0300 | bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_0300 | 去除 _static 后缀 |
| bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_static_0400 | bindSheetKeyboardAvoidMode.test.ets | bindSheetKeyboardAvoidMode_0400 | 去除 _static 后缀 |

### 仅 static 存在的用例（非 static 中无对应）
无

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| menuControlTest/bindContextMenuAnchorPosition.test.ets | bindContextMenuAnchorPosition_0100 |
| menuControlTest/bindContextMenuAnchorPosition.test.ets | bindContextMenuAnchorPosition_0200 |
| menuControlTest/bindContextMenuAnchorPosition.test.ets | bindContextMenuAnchorPosition_0300 |
| menuControlTest/bindMenuAnchorPosition.test.ets | bindMenuAnchorPosition_0100 |
| menuControlTest/bindMenuAnchorPosition.test.ets | bindMenuAnchorPosition_0200 |
| menuControlTest/bindMenuAnchorPosition.test.ets | bindMenuAnchorPosition_0300 |

### 汇总
| 类别 | 数量 |
|---|---|
| static it 用例总数 | 4 |
| 非 static it 用例总数 | 10 |
| 已匹配 | 4 |
| 仅 static 存在 | 0 |
| 仅非 static 存在 | 6 |

### 说明
非 static 目录包含 `menuControlTest` 子目录（bindContextMenuAnchorPosition.test.ets 和 bindMenuAnchorPosition.test.ets，共 6 个用例），而 static 目录未包含这些文件，因此这 6 个用例仅在非 static 中存在。static 目录的 4 个 `bindSheetKeyboardAvoidMode_static_*` 用例与非 static 中对应的 `bindSheetKeyboardAvoidMode_*` 用例通过去除 `_static` 后缀完全匹配。
