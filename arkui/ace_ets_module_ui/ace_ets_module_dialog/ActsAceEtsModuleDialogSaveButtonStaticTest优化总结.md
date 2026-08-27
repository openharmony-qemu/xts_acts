# ActsAceEtsModuleDialogSaveButtonStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | Ability 启动统一收口，全测试套只启动一次 |
| entry/src/main/src/test/SaveButtonTest/SaveButton.test.ets | 删除 beforeAll 中的 startAbility 调用；删除 UtilsTest import；从 hypium import 中移除 beforeAll；afterEach 中的 await 补 try-catch | ~4s/用例 |

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
  }
  ```

#### SaveButton.test.ets
- **修改前**：
  ```typescript
  import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
  ...
  import { UtilsTest } from '../Util.test';
  ...
  export default function SaveButtonTest() {
    describe('SaveButtonTest', () => {
      beforeAll(async (): Promise<void> => {
        console.info("SaveButtonTest beforeAll start");
        await UtilsTest.startAbility("com.arkui.ace.dialog.saveButton.static", "EntryAbility");
      });

      beforeEach(async (): Promise<void> => {
        ...
      });

      afterEach(async () => {
        await Utils.sleep(SLEEP_TIME);
        console.info("SaveButtonTest after each called");
      });
  ```
- **修改后**：
  ```typescript
  import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
  ...
  // UtilsTest import 已删除（仅 beforeAll 使用）
  ...
  export default function SaveButtonTest() {
    describe('SaveButtonTest', () => {
      // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner

      beforeEach(async (): Promise<void> => {
        ...
      });

      afterEach(async () => {
        try {
          await Utils.sleep(SLEEP_TIME);
        } catch (err) {
          console.info('SaveButtonTest afterEach sleep err: ' + JSON.stringify(err));
        }
        console.info("SaveButtonTest after each called");
      });
  ```
- 说明：`'use static'` 指令保持不变；该文件无 `isAbilityStarted` 守卫变量（原本直接调用 startAbility），故无需删除守卫变量；各 `it` 块内的 `await` 调用原本已包裹在 try-catch 中，无需重复包裹。

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_SaveButton_static | ace_ets_module_dialog_SaveButton | 否 |

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

说明：非 static 对应测试套在代码库中不存在（已通过目录推导、Glob 模糊匹配、it 用例名 Grep 反向查找、非 static bundleName Grep 等多种方式确认）。因此 static 测试套中的 sleep 时长（如 `SLEEP_TIME = 1000`、`Utils.sleep(500)` 等）保持原值，未做对齐修改。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| - | - | - | - | - |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| SaveButton.test.ets | saveButtonSetIcon |
| SaveButton.test.ets | saveButtonSetText |
| SaveButton.test.ets | saveButtonIconBorderRadius |
| SaveButton.test.ets | saveButtonStateEffect |
| SaveButton.test.ets | saveButtonUserCancelEvent |
| SaveButton.test.ets | saveButtonCanceledByUser |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

说明：由于非 static 测试套不存在，static 中全部 6 条 it 用例均无对应项，已匹配用例数为 0。
