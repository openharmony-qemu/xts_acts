# ActsAceCArkUI19StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/textpicker/textPickerRangeTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest 导入，包裹 await 异步调用 | ~4s |
| entry/src/main/src/test/textpicker/textPickerEnableHapticFeedback.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest 导入，包裹 await 异步调用 | ~4s |
| entry/src/main/src/test/customdialog/customDialogTest1.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest 导入，包裹 await 异步调用 | ~4s |
| entry/src/main/src/test/customdialog/customDialogTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest 导入，包裹 await 异步调用 | ~4s |
| entry/src/main/src/test/customdialog/customDialogBackGroundTest.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫，清理 UtilsTest 导入，包裹 await 异步调用 | ~4s |

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

#### 各 .test.ets 文件
- **修改前**：
  ```typescript
  import { ..., beforeAll } from '.../hypium/index';
  import { UtilsTest } from '../Util.test'
  ...
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api19.static", "EntryAbility")
  });
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  // UtilsTest 导入已删除
  // beforeAll 从 hypium 导入中移除
  // 所有 await 异步调用包裹在 try...catch 中
  ```

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| customDialogTest1.test.ets | customDialogTest1.test.ets | beforeEach | 100 | 1000 |
| customDialogTest1.test.ets | customDialogTest1.test.ets | it customDialogTest1_0010 - openDialog 后 | 500 | 1000 |
| customDialogTest1.test.ets | customDialogTest1.test.ets | it customDialogTest1_0010 - updateDialog 后 | 500 | 1000 |

### 已一致（无需修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) |
|---|---|---|---|---|
| textPickerRangeTest.test.ets | textPickerRangeTest.test.ets | afterEach | 100 | 100 |
| textPickerRangeTest.test.ets | textPickerRangeTest.test.ets | it testTextPicker001 | 3000 | 3000 |
| textPickerRangeTest.test.ets | textPickerRangeTest.test.ets | it testTextPicker002 | 3000 | 3000 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | afterEach | 100 | 100 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | it 0001 pushPage 后 | 3000 | 3000 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | it 0001 expect 后 | 1000 | 1000 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | it 0002 pushPage 后 | 3000 | 3000 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | it 0002 expect 后 | 1000 | 1000 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | it 0003 pushPage 后 | 3000 | 3000 |
| textPickerEnableHapticFeedback.test.ets | textPickerEnableHapticFeedback.test.ets | it 0003 expect 后 | 1000 | 1000 |
| customDialogTest1.test.ets | customDialogTest1.test.ets | it customDialogTest1_0010 起始 | 500 | 500 |
| customDialogTest.test.ets | customDialogTest.test.ets | afterEach | 100 | 100 |
| customDialogBackGroundTest.test.ets | customDialogBackGroundTest.test.ets | beforeEach | 100 | 100 |

### 差异过大（未修改）
无

### 备注
- 非 static customDialogTest1.test.ets 在 `Driver.create()` 后有一个额外的 `Utils.sleep(500)`，static 版本中不存在该 sleep。此为结构性差异（缺少 sleep 调用），非时长对齐问题，不做处理。

## 三、it 用例对齐

### 已匹配的用例（27/27 全部匹配）

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| textPickerRangeTest.test.ets | testTextPicker001 | textPickerRangeTest.test.ets | testTextPicker001 | 完全匹配 |
| textPickerRangeTest.test.ets | testTextPicker002 | textPickerRangeTest.test.ets | testTextPicker002 | 完全匹配 |
| textPickerEnableHapticFeedback.test.ets | TestTextPickerEnableHapticFeedback0001 | textPickerEnableHapticFeedback.test.ets | TestTextPickerEnableHapticFeedback0001 | 完全匹配 |
| textPickerEnableHapticFeedback.test.ets | TestTextPickerEnableHapticFeedback002 | textPickerEnableHapticFeedback.test.ets | TestTextPickerEnableHapticFeedback002 | 完全匹配 |
| textPickerEnableHapticFeedback.test.ets | TestTextPickerEnableHapticFeedback0003 | textPickerEnableHapticFeedback.test.ets | TestTextPickerEnableHapticFeedback0003 | 完全匹配 |
| customDialogTest1.test.ets | customDialogTest1_0010 | customDialogTest1.test.ets | customDialogTest1_0010 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog001 | customDialogTest.test.ets | testCustomDialog001 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog002 | customDialogTest.test.ets | testCustomDialog002 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog003 | customDialogTest.test.ets | testCustomDialog003 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog004 | customDialogTest.test.ets | testCustomDialog004 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog005 | customDialogTest.test.ets | testCustomDialog005 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog006 | customDialogTest.test.ets | testCustomDialog006 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog007 | customDialogTest.test.ets | testCustomDialog007 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog008 | customDialogTest.test.ets | testCustomDialog008 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog009 | customDialogTest.test.ets | testCustomDialog009 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog010 | customDialogTest.test.ets | testCustomDialog010 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog011 | customDialogTest.test.ets | testCustomDialog011 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog012 | customDialogTest.test.ets | testCustomDialog012 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog013 | customDialogTest.test.ets | testCustomDialog013 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog014 | customDialogTest.test.ets | testCustomDialog014 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog015 | customDialogTest.test.ets | testCustomDialog015 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog016 | customDialogTest.test.ets | testCustomDialog016 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog017 | customDialogTest.test.ets | testCustomDialog017 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog018 | customDialogTest.test.ets | testCustomDialog018 | 完全匹配 |
| customDialogTest.test.ets | testCustomDialog019 | customDialogTest.test.ets | testCustomDialog019 | 完全匹配 |
| customDialogBackGroundTest.test.ets | testCustomDialog001 | customDialogBackGroundTest.test.ets | testCustomDialog001 | 完全匹配 |
| customDialogBackGroundTest.test.ets | testCustomDialog002 | customDialogBackGroundTest.test.ets | testCustomDialog002 | 完全匹配 |

### 仅 static 存在的用例（非 static 中无对应）
无

### 仅非 static 存在的用例（static 中无对应）
无
