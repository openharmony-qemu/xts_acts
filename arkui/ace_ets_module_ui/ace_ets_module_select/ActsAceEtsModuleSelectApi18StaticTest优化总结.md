# ActsAceEtsModuleSelectApi18StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 |
|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 |
| entry/src/main/src/test/ModifierSelect/ModifierSelect.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 imports，1 处 await 包裹 try-catch |
| entry/src/main/src/test/CustomSelect/CustomSelect.test.ets | 删除 beforeAll 中的 startAbility 调用，清理未使用 imports，1 处 await 包裹 try-catch |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：`Hypium.hypiumTest` 直接在 onRun 中调用，无 Ability 启动逻辑
- **修改后**：onRun 中通过 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability，`setTimeout(4000)` 延迟后调用 `Hypium.hypiumTest`，包名从 `abilityDelegatorArguments.bundleName` 自动获取

#### 各 .test.ets 文件
- **修改前**：每个文件的 `beforeAll` 中调用 `await UtilsTest.startAbility("com.arkui.ace.select.api18.static", "EntryAbility")`
- **修改后**：beforeAll 整块删除，Ability 启动已移至 OpenHarmonyTestRunner

#### 清理的未使用 imports（各文件）
- `events_emitter` from '@ohos.events.emitter'
- `UtilsTest, startAbility` from '../Util.test'
- `UIAbility` from '@ohos.app.ability.UIAbility'
- `BusinessError` from '@ohos.base'
- `abilityDelegatorRegistry` from '@ohos.app.ability.abilityDelegatorRegistry'
- `hilog` from '@ohos.hilog'
- `common` from '@ohos.app.ability.common'
- `Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix` from '@ohos.UiTest'
- hypium 中的 `beforeAll`, `afterEach`

#### await try-catch 包裹
- ModifierSelect.test.ets: 1 处 `await CommonFunc.sleep(1000)` 包裹（it 块内）
- CustomSelect.test.ets: 1 处 `await CommonFunc.sleep(1000)` 包裹（it 块内）
- 注：beforeEach 中的 `await CommonFunc.sleep(2500)` 已在 try-catch 内，无需重复包裹

## 二、Sleep 时长对齐

### 已对齐
无修改。所有 sleep 时长 static 与非 static 已一致。

| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 状态 |
|---|---|---|---|---|---|
| ModifierSelect.test.ets | ModifierSelect.test.ets | beforeEach sleep | 2500 | 2500 | 一致 |
| ModifierSelect.test.ets | ModifierSelect.test.ets | it 内 sleep | 1000 | 1000 | 一致 |
| CustomSelect.test.ets | CustomSelect.test.ets | beforeEach sleep | 2500 | 2500 | 一致 |
| CustomSelect.test.ets | CustomSelect.test.ets | it 内 sleep | 1000 | 1000 | 一致 |

### 差异过大（未修改）
无。

### 对应非 static 测试套
| static 测试套 | 非 static 目录 | 是否存在 |
|---|---|---|
| ace_ets_module_select_api18_static | ace_ets_module_select_api18 | 是 |

## 三、it 用例对齐

### 已匹配的用例（共 2 个，全部匹配）

#### ModifierSelect.test.ets（1 个）
| static it 名称（修改后） | 非 static it 名称 | 匹配方式 |
|---|---|---|
| ModifierSelect001 | ModifierSelect001 | 移除 _static（Levenshtein=1） |

#### CustomSelect.test.ets（1 个）
| static it 名称（修改后） | 非 static it 名称 | 匹配方式 |
|---|---|---|
| selecttest_001 | selecttest_001 | 移除 _static |

### it 用例重命名汇总（共 2 个重命名）
| 文件 | 修改前 | 修改后 |
|---|---|---|
| ModifierSelect.test.ets | ModifierSelect_static_001 | ModifierSelect001 |
| CustomSelect.test.ets | selecttest_static_001 | selecttest_001 |

### 仅 static 存在的用例
无。

### 仅非 static 存在的用例
无。
