# ActsAceEtsModuleCommonAttrsDialogNoWearApi14StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | Ability 启动统一至 Runner，全测试套只启动一次 |
| entry/src/main/src/test/DatePickerDialog/lunarSwitchStyleTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；删除未使用 import（UIAbility、BusinessError、hilog、abilityDelegatorRegistry、common、UtilsTest）；删除未使用变量（domain、tag、testAbilityContext）；hypium import 移除 beforeAll；4 处独立 await 包裹 try-catch | ~4s |
| entry/src/main/src/test/TimePickerDialog/timePickerDialogHoverMode.test.ets | 同上清理；12 处独立 await 包裹 try-catch（afterEach 1 + it_0100 5 + it_0200 6） | ~4s |
| entry/src/main/src/test/DatePickerDialog/datePickerDialogHoverMode.test.ets | 同上清理；12 处独立 await 包裹 try-catch（afterEach 1 + it_0100 5 + it_0200 6） | ~4s |
| entry/src/main/src/test/TextPickerDialog/textPickerDialogHoverMode.test.ets | 同上清理；12 处独立 await 包裹 try-catch（afterEach 1 + it_0100 5 + it_0200 6） | ~4s |
| entry/src/main/src/test/CalendarPickerDialog/calendarPickerDialogHoverMode.test.ets | 同上清理；12 处独立 await 包裹 try-catch（afterEach 1 + it_0100 5 + it_0200 6） | ~4s |

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
  if (debug == 'true') { cmd += ' -D' }
  let user = abilityDelegatorArguments.parameters['-u'];
  if (user !== undefined) { cmd += ' -u ' + user; }
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
  let domain: number = 0x0000;
  let tag: string = 'testTag';
  let testAbilityContext: common.UIAbilityContext;
  ...
  beforeAll(async (): Promise<void> => {
    console.info("xxxTest beforeAll start");
    await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.nowear.api14.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // domain/tag/testAbilityContext 变量删除
  // UIAbility/BusinessError/hilog/abilityDelegatorRegistry/common/UtilsTest import 删除
  // beforeAll 从 hypium import 移除
  ```
- **独立 await 包裹**（示例）：
  ```typescript
  // 修改前
  await CommonFunc.sleep(1000);
  // 修改后
  try {
    await CommonFunc.sleep(1000);
  } catch (err) {
    console.info('xxxTest sleep err: ' + JSON.stringify(err));
  }
  ```

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| lunarSwitchStyleTest.test.ets | lunarSwitchStyleTest.test.ets | beforeEach pushUrl 后 | 2000 | 2000（已一致） |
| lunarSwitchStyleTest.test.ets | lunarSwitchStyleTest.test.ets | it_0100 各处 | 1000/2000 | 1000/2000（已一致） |
| timePickerDialogHoverMode.test.ets | timePickerDialogHoverMode.test.ets | beforeEach/afterEach/it 全部 | 1000/2000 | 1000/2000（已一致） |
| datePickerDialogHoverMode.test.ets | datePickerDialogHoverMode.test.ets | beforeEach/afterEach/it 全部 | 1000/2000 | 1000/2000（已一致） |
| textPickerDialogHoverMode.test.ets | textPickerDialogHoverMode.test.ets | beforeEach/afterEach/it 全部 | 1000/2000 | 1000/2000（已一致） |
| calendarPickerDialogHoverMode.test.ets | calendarPickerDialogHoverMode.test.ets | beforeEach/afterEach/it 全部 | 1000/2000 | 1000/2000（已一致） |

> 所有 sleep 时长 static 与非 static 已完全一致，无需修改。

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) |
|---|---|---|---|---|---|
| - | - | - | - | - | - |

> 无差异过大的 sleep 调用。

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| lunarSwitchStyleTest.test.ets | lunarSwitchStyleTest_static_0100 | lunarSwitchStyleTest.test.ets | lunarSwitchStyleTest_0100 | 去除 _static 后缀 |
| timePickerDialogHoverMode.test.ets | timePickerDialogHoverMode_static_0100 | timePickerDialogHoverMode.test.ets | timePickerDialogHoverMode_0100 | 去除 _static 后缀 |
| timePickerDialogHoverMode.test.ets | timePickerDialogHoverMode_static_0200 | timePickerDialogHoverMode.test.ets | timePickerDialogHoverMode_0200 | 去除 _static 后缀 |
| datePickerDialogHoverMode.test.ets | datePickerDialogHoverMode_static_0100 | datePickerDialogHoverMode.test.ets | datePickerDialogHoverMode_0100 | 去除 _static 后缀 |
| datePickerDialogHoverMode.test.ets | datePickerDialogHoverMode_static_0200 | datePickerDialogHoverMode.test.ets | datePickerDialogHoverMode_0200 | 去除 _static 后缀 |
| textPickerDialogHoverMode.test.ets | textPickerDialogHoverMode_static_0100 | textPickerDialogHoverMode.test.ets | textPickerDialogHoverMode_0100 | 去除 _static 后缀 |
| textPickerDialogHoverMode.test.ets | textPickerDialogHoverMode_static_0200 | textPickerDialogHoverMode.test.ets | textPickerDialogHoverMode_0200 | 去除 _static 后缀 |
| calendarPickerDialogHoverMode.test.ets | calendarPickerDialogHoverMode_static_0100 | calendarPickerDialogHoverMode.test.ets | calendarPickerDialogHoverMode_0100 | 去除 _static 后缀 |
| calendarPickerDialogHoverMode.test.ets | calendarPickerDialogHoverMode_static_0200 | calendarPickerDialogHoverMode.test.ets | calendarPickerDialogHoverMode_0200 | 去除 _static 后缀 |

> 共 9 个 static 用例，全部与非 static 一一匹配（去除 `_static` 后缀即完全一致）。

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

> 无仅 static 存在的用例。

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| - | - |

> 无仅非 static 存在的用例。
