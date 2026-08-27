# ActsAceEtsModuleDialogDownloadStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/DownloadFileButtonTest/DownloadFileButton.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理未使用 import 和变量，包裹 standalone await | ~4s |

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

#### DownloadFileButton.test.ets
- **修改前**：
  ```typescript
  import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
  import { Want } from '@kit.AbilityKit';
  import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
  import inspector from '@ohos.arkui.inspector';
  import router from '@ohos.router';
  import { Router } from '@ohos.arkui.UIContext';
  import { AppStorage } from '@ohos.arkui.stateManagement';
  import { UtilsTest } from '../Util.test';
  ...

  let want: Want;
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

  beforeAll(async (): Promise<void> => {
    console.info('DownloadFileButtonTest beforeAll start');
    await UtilsTest.startAbility('com.arkui.ace.dialog.download.static', 'EntryAbility');
    // ... router navigation ...
  });

  // standalone await without try-catch
  let buttonComponent = await driver.findComponent(ON.id('downloadFileButtonFullFilled'));
  ```
- **修改后**：
  ```typescript
  import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
  import { Driver, ON } from '@kit.TestKit';
  import inspector from '@ohos.arkui.inspector';
  ...

  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner

  // standalone await wrapped in try-catch
  let buttonComponent;
  try {
    buttonComponent = await driver.findComponent(ON.id('downloadFileButtonFullFilled'));
  } catch (err) {
    console.info('DownloadFileButtonTest findComponent err: ' + JSON.stringify(err));
  }
  ```

**清理的未使用 import**：`beforeAll`（hypium）、`Want`、`abilityDelegatorRegistry`/`MouseButton`/`MatchPattern`/`UiDirection`（TestKit）、`router`、`Router`、`AppStorage`、`UtilsTest`

**清理的未使用变量**：`want`、`bundleName`、`delegator`、`abilityDelegator`

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_module_dialog_download_static | ace_ets_module_dialog_download | 否 |

非 static 测试套目录 `ace_ets_module_dialog_download` 在代码库中不存在。static 测试套的 `.test.ets` 文件中无 sleep 调用（仅 `Util.test.ets` 中定义了 `msSleep` 工具方法，由原 `UtilsTest.startAbility` 内部调用，已随 beforeAll 删除一并移除引用）。无法进行 sleep 时长对齐。

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| - | - | - | - | - |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

## 三、it 用例对齐

### 对应非 static 测试套不存在

非 static 测试套目录 `ace_ets_module_dialog_download` 不存在，无法进行 it 用例对齐。通过在 `D:\code\newC\xts_acts_2725\arkui` 全目录搜索 static 用例名（`downloadIconStyleFullFilled`、`DownloadFileButtonGetNode`、`downloadDescriptionDownload` 等），均仅在本 static 测试套中匹配到，未找到任何非 static 对应版本。

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| DownloadFileButton.test.ets | DownloadFileButtonGetNode |
| DownloadFileButton.test.ets | downloadIconStyleFullFilled |
| DownloadFileButton.test.ets | downloadIconStyleLines |
| DownloadFileButton.test.ets | downloadDescriptionDownload |
| DownloadFileButton.test.ets | downloadDescriptionDownloadFile |
| DownloadFileButton.test.ets | downloadDescriptionSave |
| DownloadFileButton.test.ets | downloadDescriptionSaveImage |
| DownloadFileButton.test.ets | downloadDescriptionSaveFile |
| DownloadFileButton.test.ets | downloadDescriptionDownloadAndShare |
| DownloadFileButton.test.ets | downloadDescriptionReceive |
| DownloadFileButton.test.ets | downloadDescriptionContinueToReceive |
| DownloadFileButton.test.ets | downloadLayoutDirectionHorizontal |
| DownloadFileButton.test.ets | downloadLayoutDirectionVertical |
| DownloadFileButton.test.ets | SUB_ARKUI_DOWNLOADFILEBUTTON_FONTSTYLENORMAL_0100 |
| DownloadFileButton.test.ets | SUB_ARKUI_DOWNLOADFILEBUTTON_FONTWEIGHTNORMAL_0200 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| - | - | - | - | - |

## 总结

| 维度 | 结果 |
|---|---|
| 修改文件数 | 2（OpenHarmonyTestRunner.ets、DownloadFileButton.test.ets） |
| Sleep 对齐数 | 0（非 static 测试套不存在） |
| it 用例匹配数 | 0（非 static 测试套不存在） |
| static it 用例总数 | 15 |
