# ActsAceEtsModuleAlertDialogStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| entry/src/main/src/test/OpenOrderOverlay/OpenOrderOverlay.test.ets | 删除 beforeAll 中的 startAbility，清理 UtilsTest/BUNDLE 常量，包裹 beforeEach/afterEach/afterAll 及 it 块中 standalone await |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：onRun 中直接调用 `Hypium.hypiumTest`
- **修改后**：onRun 中用 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability，`setTimeout(4000)` 后执行 `Hypium.hypiumTest`

#### OpenOrderOverlay.test.ets
- **修改前**：`beforeAll` 中调用 `await UtilsTest.startAbility(BUNDLE, 'EntryAbility')`
- **修改后**：`beforeAll` 整块删除，清理 `UtilsTest` import 及 `BUNDLE` 常量（仅 beforeAll 使用）；beforeEach/afterEach/afterAll 中 standalone await 包裹 try-catch；it 块中 `await Utils.sleep(SLEEP_TIME)` 用 replaceAll 批量包裹 try-catch；`await Utils.sleep(5000)`(Err103307) 和 `await Utils.sleep(800)`(cleanupSystemFilePicker) 分别包裹

## 二、Sleep 时长对齐

### 已对齐
| static 文件 | 非 static 文件 | sleep 位置 | 修改前(ms) | 修改后(ms) |
|---|---|---|---|---|
| (无) | - | - | - | - |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) | 说明 |
|---|---|---|---|---|---|---|
| OpenOrderOverlay.test.ets | OpenOrderOverlay.test.ets | beforeEach 页面导航 sleep | 1000 | 2500 | 1500 | 非 static 用 await replaceUrl + sleep(2500)，static 用非 await replaceUrl + sleep(1000) |

### 仅 static 存在的 sleep
| static 文件 | sleep 位置 | 时长(ms) | 说明 |
|---|---|---|---|
| OpenOrderOverlay.test.ets | cleanupSystemFilePicker | 800 | 非 static 无此清理函数 |
| OpenOrderOverlay.test.ets | afterEach removeBtn click 后 | 300 | 非 static 在 it 块内处理 removeBtn |
| OpenOrderOverlay.test.ets | afterEach 末尾 | 500 | 非 static 在 it 块内处理 |
| OpenOrderOverlay.test.ets | Err103307 用例 | 5000 | 非 static 无此用例 |

### 已对齐说明
- it 块中 `Utils.sleep(SLEEP_TIME)` 时长为 1000ms，与非 static 的 `Utils.sleep(1000)` 一致

## 三、it 用例对齐

### 已匹配的用例（共 10 个，按后缀匹配）
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelOrderClamp_0100 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelOrderClamp_0100 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_Content_0100 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_Content_0100 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0100 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelMode_0100 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelMode_0200 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelMode_0200 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0100 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelOrder_0100 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0200 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelOrder_0200 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0300 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelOrder_0300 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelOrder_0400 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelOrder_0400 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_LevelUniqueId_0100 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelUniqueId_0100 | 后缀匹配(前缀不同) |
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_AllParams_0100 | OpenOrderOverlay.test.ets | OpenOrderOverlayTest_AllParams_0100 | 后缀匹配(前缀不同) |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| OpenOrderOverlay.test.ets | SUB_ARKUI_API_OpenOrderOverlay_Err103307_0100 |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| OpenOrderOverlay.test.ets | OpenOrderOverlayTest_Options_0100 |
| OpenOrderOverlay.test.ets | OpenOrderOverlayTest_ReturnValue_0100 |
| OpenOrderOverlay.test.ets | OpenOrderOverlayTest_LevelModeEnum_0100 |

### 说明
- static 使用 `SUB_ARKUI_API_OpenOrderOverlay_` 前缀，非 static 使用 `OpenOrderOverlayTest_` 前缀
- Levenshtein 距离 > 3（前缀不同），但后缀完全一致，故按后缀匹配归为"已匹配"
