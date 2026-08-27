# ActsAceEtsModuleSelectApi12StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| entry/src/main/src/test/SelectMenu.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 imports |
| entry/src/main/src/test/Select01.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 imports，12 处 await 包裹 try-catch |
| entry/src/main/src/test/Select.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 imports，3 处 await 包裹 try-catch |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：`Hypium.hypiumTest` 直接在 onRun 中调用，无 Ability 启动逻辑
- **修改后**：onRun 中通过 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability，`setTimeout(4000)` 延迟后调用 `Hypium.hypiumTest`，包名从 `abilityDelegatorArguments.bundleName` 自动获取

#### 各 .test.ets 文件
- **修改前**：每个文件的 `beforeAll` 中调用 `await UtilsTest.startAbility("com.arkui.ace.select.api12.static", "EntryAbility")`
- **修改后**：beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner

#### 清理的未使用 imports（各文件）
- `UtilsTest` from './Util.test'
- `UIAbility` from '@ohos.app.ability.UIAbility'
- `BusinessError` from '@ohos.base'
- `abilityDelegatorRegistry` from '@ohos.app.ability.abilityDelegatorRegistry'
- `hilog` from '@ohos.hilog'
- `common` from '@ohos.app.ability.common'
- `Color` from '@ohos.arkui.component'（SelectMenu、Select01、Select）
- `Utils` from '../../ets/MainAbility/common/Utils'（SelectMenu）
- `Driver, ON, MouseButton, Component` from '@ohos.UiTest'（SelectMenu、Select01、Select）
- `router` from '@ohos.router'（Select01）
- `UIContext` from '@ohos.arkui.UIContext'（保留 Router）
- `AppStorage` from '@ohos.arkui.stateManagement'（Select01）
- hypium 中的 `beforeAll`, `Size`, `TestType`, `afterEach`（视各文件使用情况保留或删除）

#### await try-catch 包裹
- Select01.test.ets: beforeEach 1 处 + 11 个 it 块各 1 处 = 12 处 `await Utils.sleep(2000)` 包裹
- Select.test.ets: afterEach 1 处 `await Utils.sleep(1000)` + 2 个 it 块各 1 处 `await Utils.sleep(2000)` = 3 处包裹

## 二、Sleep 时长对齐

### 已对齐
无修改。所有 sleep 时长 static 与非 static 已一致。

| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 状态 |
|---|---|---|---|---|---|
| SelectMenu.test.ets | SelectMenu.ets | 各 it 的 setTimeout | 500 | 500 | 一致 |
| Select01.test.ets | Select.ets | beforeEach sleep | 2000 | 2000 | 一致 |
| Select01.test.ets | Select.ets | 各 it 的 Utils.sleep | 2000 | 2000 | 一致 |
| Select.test.ets | select.test.ets | afterEach sleep | 1000 | 1000 | 一致 |
| Select.test.ets | select.test.ets | 各 it 的 Utils.sleep | 2000 | 2000 | 一致 |

### 差异过大（未修改）
无。

### 对应非 static 测试套
| static 测试套 | 非 static 目录 | 是否存在 |
|---|---|---|
| ace_ets_module_select_api12_static | ace_ets_module_select_api12 | 是 |

## 三、it 用例对齐

### 已匹配的用例（共 31 个，全部匹配）

#### SelectMenu.test.ets ↔ SelectMenu.ets（15 个）
| static it 名称（修改后） | 非 static it 名称 | 匹配方式 |
|---|---|---|
| ArkUXII_Stage_Select_Menu_MenuAlign_0100 | ArkUXII_Stage_Select_Menu_MenuAlign_0100 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0200 | ArkUXII_Stage_Select_Menu_MenuAlign_0200 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0300 | ArkUXII_Stage_Select_Menu_MenuAlign_0300 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0400 | ArkUXII_Stage_Select_Menu_MenuAlign_0400 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0500 | ArkUXII_Stage_Select_Menu_MenuAlign_0500 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0600 | ArkUXII_Stage_Select_Menu_MenuAlign_0600 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0700 | ArkUXII_Stage_Select_Menu_MenuAlign_0700 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0800 | ArkUXII_Stage_Select_Menu_MenuAlign_0800 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_0900 | ArkUXII_Stage_Select_Menu_MenuAlign_0900 | 移除 _static |
| ArkUXII_Stage_Select_Menu_MenuAlign_1000 | ArkUXII_Stage_Select_Menu_MenuAlign_1000 | 精确匹配 |
| ArkUXII_Stage_Select_Menu_MenuAlign_1100 | ArkUXII_Stage_Select_Menu_MenuAlign_1100 | 精确匹配 |
| ArkUXII_Stage_Select_Menu_MenuAlign_1200 | ArkUXII_Stage_Select_Menu_MenuAlign_1200 | 精确匹配 |
| ArkUXII_Stage_Select_Menu_MenuAlign_1300 | ArkUXII_Stage_Select_Menu_MenuAlign_1300 | 精确匹配 |
| ArkUXII_Stage_Select_Menu_MenuAlign_1400 | ArkUXII_Stage_Select_Menu_MenuAlign_1400 | 精确匹配 |
| ArkUXII_Stage_Select_Menu_MenuAlign_1500 | ArkUXII_Stage_Select_Menu_MenuAlign_1500 | 精确匹配 |

#### Select01.test.ets ↔ Select.ets（14 个）
| static it 名称（修改后） | 非 static it 名称 | 匹配方式 |
|---|---|---|
| ArkUI_Stage_Select_Layout_0100 | ArkUI_Stage_Select_Layout_0100 | 移除 _static |
| ArkUI_Stage_Select_Layout_0200 | ArkUI_Stage_Select_Layout_0200 | 移除 _static |
| ArkUI_Stage_Select_Layout_0300 | ArkUI_Stage_Select_Layout_0300 | 移除 _static |
| ArkUI_Stage_Select_Layout_0400 | ArkUI_Stage_Select_Layout_0400 | 移除 _static |
| ArkUI_Stage_Select_Space_0100 | ArkUI_Stage_Select_Space_0100 | 精确匹配 |
| ArkUI_Stage_Select_Space_0200 | ArkUI_Stage_Select_Space_0200 | 精确匹配 |
| ArkUI_Stage_Select_Space_0300 | ArkUI_Stage_Select_Space_0300 | 精确匹配 |
| ArkUI_Stage_Select_Space_0400 | ArkUI_Stage_Select_Space_0400 | 精确匹配 |
| ArkUI_Stage_Select_Space_0500 | ArkUI_Stage_Select_Space_0500 | 精确匹配 |
| ArkUI_Stage_Select_Space_0600 | ArkUI_Stage_Select_Space_0600 | 精确匹配 |
| ArkUI_Stage_Select_Space_0700 | ArkUI_Stage_Select_Space_0700 | 精确匹配 |
| ArkUI_Stage_Select_Space_0800 | ArkUI_Stage_Select_Space_0800 | 精确匹配 |
| ArkUI_Stage_Select_Space_0900 | ArkUI_Stage_Select_Space_0900 | 精确匹配 |
| ArkUI_Stage_Select_Size_1000 | ArkUI_Stage_Select_Size_1000 | 精确匹配 |

#### Select.test.ets ↔ select.test.ets（2 个）
| static it 名称（修改后） | 非 static it 名称 | 匹配方式 |
|---|---|---|
| testselectOnSelect0001 | testselectOnSelect0001 | 移除 _static（Levenshtein=1） |
| testselectOnSelect0002 | testselectOnSelect0002 | 移除 _static（Levenshtein=1） |

### it 用例重命名汇总（共 15 个重命名）
| 文件 | 修改前 | 修改后 |
|---|---|---|
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0100 | ArkUXII_Stage_Select_Menu_MenuAlign_0100 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0200 | ArkUXII_Stage_Select_Menu_MenuAlign_0200 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0300 | ArkUXII_Stage_Select_Menu_MenuAlign_0300 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0400 | ArkUXII_Stage_Select_Menu_MenuAlign_0400 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0500 | ArkUXII_Stage_Select_Menu_MenuAlign_0500 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0600 | ArkUXII_Stage_Select_Menu_MenuAlign_0600 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0700 | ArkUXII_Stage_Select_Menu_MenuAlign_0700 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0800 | ArkUXII_Stage_Select_Menu_MenuAlign_0800 |
| SelectMenu.test.ets | ArkUXII_Stage_Select_Menu_MenuAlign_static_0900 | ArkUXII_Stage_Select_Menu_MenuAlign_0900 |
| Select01.test.ets | ArkUI_Stage_Select_Layout_static_0100 | ArkUI_Stage_Select_Layout_0100 |
| Select01.test.ets | ArkUI_Stage_Select_Layout_static_0200 | ArkUI_Stage_Select_Layout_0200 |
| Select01.test.ets | ArkUI_Stage_Select_Layout_static_0300 | ArkUI_Stage_Select_Layout_0300 |
| Select01.test.ets | ArkUI_Stage_Select_Layout_static_0400 | ArkUI_Stage_Select_Layout_0400 |
| Select.test.ets | testselectOnSelect_static_0001 | testselectOnSelect0001 |
| Select.test.ets | testselectOnSelect_static_0002 | testselectOnSelect0002 |

### 仅 static 存在的用例
无。

### 仅非 static 存在的用例
无。
