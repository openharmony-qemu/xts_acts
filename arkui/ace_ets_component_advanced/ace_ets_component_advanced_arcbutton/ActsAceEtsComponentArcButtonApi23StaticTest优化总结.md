# ActsAceEtsComponentArcButtonApi23StaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/ArcButtonTest/arcButtonTest.test.ets | 删除 beforeAll 中的 startAbility 调用、清理未使用 import、包裹 standalone await | ~8s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：直接调用 `Hypium.hypiumTest` 启动测试
- **修改后**：添加 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability（fire and forget），`setTimeout(4000)` 延迟后执行 `Hypium.hypiumTest`，确保 Ability 完成生命周期后再跑测试

#### arcButtonTest.test.ets
- 删除 `beforeAll` 块（含 `UtilsTest.startAbility("com.arkui.ace.arcbutton.api23.static", "EntryAbility")` 调用）
- 清理未使用 import：
  - `beforeAll` 从 hypium import 中移除
  - `UtilsTest` import 整行删除
  - `abilityDelegatorRegistry` 从 `@kit.TestKit` import 中移除
  - `UIContext` 从 `@ohos.arkui.UIContext` import 中移除
- `afterEach` 中的 `await Utils.sleep(SLEEP_TIME)` 包裹 try-catch
- `it` 块中的 `await driver.findComponent`、`await (button?.click())`、`await Utils.sleep` 包裹 try-catch
- 保持 `'use static'` 指令

## 二、Sleep 时长对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_component_advanced_arcbutton_api23_static | ace_ets_component_advanced_arcbutton_api23 | 不存在 |

> 注：父目录 `ace_ets_component_advanced_arcbutton/` 下仅有 `ace_ets_component_advanced_arcbutton_api16`（不同 API 版本，测试文件名和用例名完全不同），无法作为非 static 对照。无法进行 sleep 时长对齐。

### static 文件中现有 sleep 值（供参考）
| 文件 | 位置 | sleep(ms) |
|---|---|---|
| arcButtonTest.test.ets | SLEEP_TIME 常量 | 1000 |
| arcButtonTest.test.ets | beforeEach pushUrl 后 | 1000 |
| arcButtonTest.test.ets | afterEach | 1000 |
| arcButtonTest.test.ets | it 块 click 后 | 1000 |

## 三、it 用例对齐

### 对应非 static 测试套不存在
| static 测试套名称 | 推导的非 static 名称 | 是否存在 |
|---|---|---|
| ace_ets_component_advanced_arcbutton_api23_static | ace_ets_component_advanced_arcbutton_api23 | 不存在 |

### static it 用例列表
| 文件 | it 用例名称 |
|---|---|
| arcButtonTest.test.ets | ArcButton_static_001 |

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 | 说明 |
|---|---|---|
| arcButtonTest.test.ets | ArcButton_static_001 | 非 static 测试套不存在，无法对齐 |

> 注：static 用例名 `ArcButton_static_001` 包含 `_static` 后缀，但因非 static 测试套不存在，无法进行用例名对齐和重命名。

## 总结

| 步骤 | 状态 | 说明 |
|---|---|---|
| 第一步：启动方式优化 | ✅ 完成 | OpenHarmonyTestRunner.ets + arcButtonTest.test.ets 已修改 |
| 第二步：Sleep 时长对齐 | ⚠️ 无法执行 | 非 static 测试套不存在 |
| 第三步：it 用例对齐 | ⚠️ 无法执行 | 非 static 测试套不存在，1 个 static 用例无对照 |
