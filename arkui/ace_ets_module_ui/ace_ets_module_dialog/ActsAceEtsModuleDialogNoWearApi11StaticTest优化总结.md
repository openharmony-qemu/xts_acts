# ActsAceEtsModuleDialogNoWearApi11StaticTest 优化总结报告

## 一、启动方式优化

### 修改文件列表

| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| calendarPickerDialogTest/CalendarPickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest, hilog, abilityDelegatorRegistry, UIAbility, deviceInfo, BusinessError, inspector）；it() body 包裹 try-catch |
| timePickerDialogTest/TimePickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest, startAbility, stopApplication, hilog, abilityDelegatorRegistry, UIAbility, deviceInfo, BusinessError）和模块级变量（domain, tag, testAbilityContext）；it() body 包裹 try-catch |
| datePickerDialogTest/DatePickerDialogJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest）；it() body 包裹 try-catch |
| textPickerDialogTest/TextPickerJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest）；afterEach 中 await 包裹 try-catch |
| timePickerDialogTest/TimePickerDialogJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest）；it() body 包裹 try-catch |
| calendarPickerDialogTest/CalendarJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest, common, deviceInfo）；afterEach 中 await 包裹 try-catch |
| datePickerDialogTest/DatePickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest, startAbility, stopApplication, hilog, abilityDelegatorRegistry, UIAbility）和模块级变量（domain, tag, testAbilityContext）；it() body 包裹 try-catch |
| textPickerDialogTest/TextPickerDialogJsunit.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest）；it() body 包裹 try-catch |
| textPickerDialogTest/TextPickerDialog.test.ets | 删除 beforeAll 中的 startAbility 调用及守卫；清理未使用 import（UtilsTest, startAbility, stopApplication, hilog, abilityDelegatorRegistry, UIAbility, deviceInfo, BusinessError）和模块级变量（domain, tag, testAbilityContext）；it() body 包裹 try-catch |

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
  beforeAll(async (): Promise<void> => {
    await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api11.static", "EntryAbility")
  })
  ```
- **修改后**：
  ```typescript
  // beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner
  ```

## 二、Sleep 时长对齐

### 对应非 static 测试套
- static 目录：`ace_ets_module_dialog_nowear_api11_static`
- 非 static 目录：`ace_ets_module_dialog_nowear_api11`
- 对应关系：去掉 `_static` 后缀即得非 static 目录名，存在于同父目录下

### 已对齐
所有 static 文件中的 sleep 时长与非 static 完全一致，无需修改。

| static 文件 | 非 static 文件 | sleep 对比结果 |
|---|---|---|
| calendarPickerDialogTest/CalendarPickerDialog.test.ets | calendarPickerDialogTest/CalendarPickerDialog.test.ets | 2000, 1000, 1000, 1000, 1000 — 完全一致 |
| timePickerDialogTest/TimePickerDialog.test.ets | timePickerDialogTest/TimePickerDialog.test.ets | 2000, 1000, 1000, 1000 — 完全一致（非 static 多 1 个 1000ms 的 click 坐标 sleep，static 中已注释） |
| datePickerDialogTest/DatePickerDialogJsunit.test.ets | datePickerDialogTest/DatePickerDialogJsunit.test.ets | 2000, 1000, 1500 — 完全一致 |
| textPickerDialogTest/TextPickerJsunit.test.ets | textPickerDialogTest/TextPickerJsunit.test.ets | 2000, 1000, 1000, 1000 — 完全一致 |
| timePickerDialogTest/TimePickerDialogJsunit.test.ets | timePickerDialogTest/TimePickerDialogJsunit.test.ets | 2000, 1000, 1000 — 完全一致 |
| calendarPickerDialogTest/CalendarJsunit.test.ets | calendarPickerDialogTest/CalendarJsunit.test.ets | 2000, 1000×11 — 完全一致 |
| datePickerDialogTest/DatePickerDialog.test.ets | datePickerDialogTest/DatePickerDialog.test.ets | 2000, 1000, 1000, 1000 — 完全一致（非 static 多 1 个 1000ms 的 click 坐标 sleep，static 中已注释） |
| textPickerDialogTest/TextPickerDialogJsunit.test.ets | textPickerDialogTest/TextPickerDialogJsunit.test.ets | 2000, 1000, 1000 — 完全一致 |
| textPickerDialogTest/TextPickerDialog.test.ets | textPickerDialogTest/TextPickerDialog.test.ets | 2000, 1000, 1000, 1000 — 完全一致（非 static 多 1 个 1000ms 的 click 坐标 sleep，static 中已注释） |

### 差异过大（未修改）
无。

## 三、it 用例对齐

### 已匹配的用例（19 个）

| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| TimePickerDialogJsunit.test.ets | TimePickerDialogJsunit_0100 | timePickerDialogTest/TimePickerDialogJsunit.test.ets | TimePickerDialogJsunit_0100 | 完全匹配 |
| TimePickerDialog.test.ets | TimePickerDialog_static_0100 | timePickerDialogTest/TimePickerDialog.test.ets | TimePickerDialog_0100 | 去除 _static |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_colSpace | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_colSpace | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_dailyFiveRowSpace | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_dailyFiveRowSpace | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_dailySixRowSpace | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_dailySixRowSpace | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_lunarHeight | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_lunarHeight | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_underscoreWidth | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_underscoreWidth | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_underscoreLength | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_underscoreLength | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_scheduleMarkerRadius | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_scheduleMarkerRadius | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_boundaryRowOffset | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CurrentDayStyle_boundaryRowOffset | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_WeekStyle_weekAndDayRowSpace | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_WeekStyle_weekAndDayRowSpace | 完全匹配 |
| CalendarJsunit.test.ets | ACE_calendar_CalendarAttribute_direction | calendarPickerDialogTest/CalendarJsunit.test.ets | ACE_calendar_CalendarAttribute_direction | 完全匹配 |
| CalendarPickerDialog.test.ets | CalendarPickerDialog_static_0100 | calendarPickerDialogTest/CalendarPickerDialog.test.ets | CalendarPickerDialog_0100 | 去除 _static |
| DatePickerDialogJsunit.test.ets | DatePickerDialogJsunit_static_0100 | datePickerDialogTest/DatePickerDialogJsunit.test.ets | DatePickerDialogJsunit_0100 | 去除 _static |
| TextPickerJsunit.test.ets | testTextPickerDialog_static_0100 | textPickerDialogTest/TextPickerJsunit.test.ets | testTextPickerDialog0100 | 去除 _static |
| TextPickerJsunit.test.ets | testTextPickerDialog_static_0200 | textPickerDialogTest/TextPickerJsunit.test.ets | testTextPickerDialog0200 | 去除 _static |
| DatePickerDialog.test.ets | DatePickerDialog_static_0100 | datePickerDialogTest/DatePickerDialog.test.ets | DatePickerDialog_0100 | 去除 _static |
| TextPickerDialogJsunit.test.ets | TextPickerDialogJsunit_static_0100 | textPickerDialogTest/TextPickerDialogJsunit.test.ets | TextPickerDialogJsunit_0100 | 去除 _static |
| TextPickerDialog.test.ets | TextPickerDialog_static_0100 | textPickerDialogTest/TextPickerDialog.test.ets | TextPickerDialog_0100 | 去除 _static |

### 仅 static 存在的用例
无。

### 仅非 static 存在的用例

| 文件 | it 用例名称 |
|---|---|
| Dialog/TimePickerDialogJsunit.test.ets | TimePickerDialogAJsunit_0100 |
| Dialog/DatePickerDialogJsunit.test.ets | DatePickerDialogAJsunit_0100 |
| Dialog/CalendarDialogJsunit.test.ets | CalendarDialogAJsunit_0100 |
| Dialog/TextPickerDialogJsunit.test.ets | TextPickerDialogAJsunit_0100 |

> 注：以上 4 个用例均位于非 static 的 `Dialog/` 子目录中，该子目录在 static 测试套中不存在对应目录。
