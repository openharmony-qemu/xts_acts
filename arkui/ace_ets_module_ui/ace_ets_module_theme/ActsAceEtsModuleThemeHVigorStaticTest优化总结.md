# ActsAceEtsModuleThemeHVigorStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| entry/src/main/src/test/themeTokens/SetDefaultTheme.test.ets | 删除 beforeAll 中的 startAbility + msSleep(4000)，清理未使用 import，保留 UtilsTest(beforeEach 仍用 msSleep) |
| entry/src/main/src/test/themeTokens/SystemTheme.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import，保留 UtilsTest(beforeEach 仍用 msSleep) |
| entry/src/main/src/test/themeTokens/themeTokenType.test.ets | 删除 beforeAll 中的 startAbility + msSleep(2000)，清理未使用 import(含 UtilsTest)，包裹 it 中 standalone await |
| entry/src/main/src/test/WithThemeDebugLineTest/WithThemeDebugLine.test.ets | 删除 beforeAll 中的 startAbility，清理 UtilsTest import，包裹 afterEach 中 standalone await |
| entry/src/main/src/test/components/Checkbox.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import(含 UtilsTest)，包裹 it 0300 中 standalone await |
| entry/src/main/src/test/components/DatePicker.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import(含 UtilsTest) |
| entry/src/main/src/test/components/Divider.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import，保留 UtilsTest(beforeEach 仍用 msSleep)，包裹 it 0300/0400/0500 中 standalone await |
| entry/src/main/src/test/components/Slider.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import(含 UtilsTest) |
| entry/src/main/src/test/components/Text.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import，保留 UtilsTest(beforeEach 仍用 msSleep)，包裹 it 0300 中 standalone await |
| entry/src/main/src/test/components/TextPicker.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import(含 UtilsTest) |
| entry/src/main/src/test/components/Toggle.test.ets | 删除 beforeAll 中的 startAbility，清理未使用 import，保留 UtilsTest(beforeEach 仍用 msSleep)，包裹 it 0300 中 standalone await |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：onRun 中直接调用 `Hypium.hypiumTest`
- **修改后**：onRun 中用 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability，`setTimeout(4000)` 后执行 `Hypium.hypiumTest`

#### 各 .test.ets 文件
- **修改前**：每个文件的 `beforeAll` 中调用 `UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")`
- **修改后**：`beforeAll` 整块删除，Ability 启动已移至 OpenHarmonyTestRunner；清理未使用的 import（UIAbility、common、BusinessError、abilityDelegatorRegistry、hilog、UtilsTest）；未在 try-catch 中的 standalone `await` 调用已包裹

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| themeTokenType.test.ets | themeTokenType.test.ets | beforeEach 页面导航 | 2500 | 2000 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) | 说明 |
|---|---|---|---|---|---|---|
| SetDefaultTheme.test.ets | SetDefaultTheme.test.ets | beforeEach 页面导航 msSleep | 4000 | 0 | 4000 | 非 static 在 beforeAll 用 await pushUrl 无需 sleep |
| SystemTheme.test.ets | SystemTheme.test.ets | beforeEach 页面导航 msSleep | 2000 | 0 | 2000 | 非 static 在 beforeAll 用 await pushUrl 无需 sleep |
| Divider.test.ets | Divider.test.ets | beforeEach 页面导航 msSleep | 1000 | 0 | 1000 | 非 static 在 beforeAll 用 await pushUrl 无需 sleep |
| Text.test.ets | Text.test.ets | beforeEach 页面导航 msSleep | 1000 | 0 | 1000 | 非 static 在 beforeAll 用 await pushUrl 无需 sleep |
| Toggle.test.ets | Toggle.test.ets | beforeEach 页面导航 msSleep | 1000 | 0 | 1000 | 非 static 在 beforeAll 用 await pushUrl 无需 sleep |

### 已对齐说明
- Checkbox、DatePicker、Slider、TextPicker 的 it 块中 `await sleep(frameTime)` 时长与非 static 一致（frameTime=1000），无需修改
- WithThemeDebugLine.test.ets 无非 static 对应文件

## 三、it 用例对齐

### 已匹配的用例（共 35 个）
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| SetDefaultTheme.test.ets | ActsSetDefaultThemeColors_static_0100 | SetDefaultTheme.test.ets | ActsSetDefaultThemeColors_0100 | 去除 _static |
| SetDefaultTheme.test.ets | ActsSetDefaultThemeColors_static_0200 | SetDefaultTheme.test.ets | ActsSetDefaultThemeColors_0200 | 去除 _static |
| SystemTheme.test.ets | ActsSystemThemeColors_static_0100 | SystemTheme.test.ets | ActsSystemThemeColors_0100 | 去除 _static |
| SystemTheme.test.ets | ActsSystemThemeColors_static_0200 | SystemTheme.test.ets | ActsSystemThemeColors_0200 | 去除 _static |
| themeTokenType.test.ets | themeTokenType_static_0100 | themeTokenType.test.ets | themeTokenType_0100 | 去除 _static |
| Checkbox.test.ets | ActsCheckBoxThemeColors_static_0100 | Checkbox.test.ets | ActsCheckBoxThemeColors_0100 | 去除 _static |
| Checkbox.test.ets | ActsCheckBoxThemeColors_static_0200 | Checkbox.test.ets | ActsCheckBoxThemeColors_0200 | 去除 _static |
| Checkbox.test.ets | ActsCheckBoxThemeColors_static_0300 | Checkbox.test.ets | ActsCheckBoxThemeColors_0300 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0100 | DatePicker.test.ets | ActsDatePickerThemeColors_0100 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0200 | DatePicker.test.ets | ActsDatePickerThemeColors_0200 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0300 | DatePicker.test.ets | ActsDatePickerThemeColors_0300 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0400 | DatePicker.test.ets | ActsDatePickerThemeColors_0400 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0500 | DatePicker.test.ets | ActsDatePickerThemeColors_0500 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0600 | DatePicker.test.ets | ActsDatePickerThemeColors_0600 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0700 | DatePicker.test.ets | ActsDatePickerThemeColors_0700 | 去除 _static |
| DatePicker.test.ets | ActsDatePickerThemeColors_static_0800 | DatePicker.test.ets | ActsDatePickerThemeColors_0800 | 去除 _static |
| Divider.test.ets | ActsDividerThemeColors_static_0100 | Divider.test.ets | ActsDividerThemeColors_0100 | 去除 _static |
| Divider.test.ets | ActsDividerThemeColors_static_0200 | Divider.test.ets | ActsDividerThemeColors_0200 | 去除 _static |
| Divider.test.ets | ActsDividerThemeColors_static_0300 | Divider.test.ets | ActsDividerThemeColors_0300 | 去除 _static |
| Divider.test.ets | ActsDividerThemeColors_static_0400 | Divider.test.ets | ActsDividerThemeColors_0400 | 去除 _static |
| Divider.test.ets | ActsDividerThemeColors_static_0500 | Divider.test.ets | ActsDividerThemeColors_0500 | 去除 _static |
| Slider.test.ets | ActsSliderThemeColors_static_0100 | Slider.test.ets | ActsSliderThemeColors_0100 | 去除 _static |
| Slider.test.ets | ActsSliderThemeColors_static_0200 | Slider.test.ets | ActsSliderThemeColors_0200 | 去除 _static |
| Slider.test.ets | ActsSliderThemeColors_static_0300 | Slider.test.ets | ActsSliderThemeColors_0300 | 去除 _static |
| Slider.test.ets | ActsSliderThemeColors_static_0400 | Slider.test.ets | ActsSliderThemeColors_0400 | 去除 _static |
| Text.test.ets | ActsTextThemeColors_static_0100 | Text.test.ets | ActsTextThemeColors_0100 | 去除 _static |
| Text.test.ets | ActsTextThemeColors_static_0200 | Text.test.ets | ActsTextThemeColors_0200 | 去除 _static |
| Text.test.ets | ActsTextThemeColors_static_0300 | Text.test.ets | ActsTextThemeColors_0300 | 去除 _static |
| TextPicker.test.ets | ActsTextPickerThemeColors_static_0100 | TextPicker.test.ets | ActsTextPickerThemeColors_0100 | 去除 _static |
| TextPicker.test.ets | ActsTextPickerThemeColors_static_0200 | TextPicker.test.ets | ActsTextPickerThemeColors_0200 | 去除 _static |
| TextPicker.test.ets | ActsTextPickerThemeColors_static_0300 | TextPicker.test.ets | ActsTextPickerThemeColors_0300 | 去除 _static |
| TextPicker.test.ets | ActsTextPickerThemeColors_static_0400 | TextPicker.test.ets | ActsTextPickerThemeColors_0400 | 去除 _static |
| Toggle.test.ets | ActsToggleThemeColors_static_0100 | Toggle.test.ets | ActsToggleThemeColors_0100 | 去除 _static |
| Toggle.test.ets | ActsToggleThemeColors_static_0200 | Toggle.test.ets | ActsToggleThemeColors_0200 | 去除 _static |
| Toggle.test.ets | ActsToggleThemeColors_static_0300 | Toggle.test.ets | ActsToggleThemeColors_0300 | 去除 _static |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| WithThemeDebugLine.test.ets | SUB_arkui_with_theme_debug_line_wt_dl_page_loads_0100 |
| WithThemeDebugLine.test.ets | SUB_arkui_with_theme_debug_line_wt_dl_mounted_flag_0200 |
| WithThemeDebugLine.test.ets | SUB_arkui_with_theme_debug_line_inspector_wt_dl_body_0300 |
| WithThemeDebugLine.test.ets | SUB_arkui_with_theme_debug_line_inspector_wt_dl_title_0400 |
| WithThemeDebugLine.test.ets | SUB_arkui_with_theme_debug_line_driver_find_content_text_0500 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| themeTokenType.test.ets | themeTokenType_0200 |
| themeTokenType.test.ets | themeTokenType_0300 |
