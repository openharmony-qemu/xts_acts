# ActsAceEtsComponentCommonSevenAttrsLinearGradientBlurStaticTest Static 优化总结报告

## 一、启动方式优化

### 修改文件列表
| 文件路径 | 修改内容 | 节省时间/用例 |
|---|---|---|
| entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets | onRun 中添加 executeShellCommand 启动 Ability + setTimeout(4000) 延迟执行测试 | - |
| entry/src/main/src/test/linearGradientBlur/LinearGradientBlurTest.test.ets | 删除 beforeAll 中的 msSleep/startAbility 调用、清理未使用 import | ~8s |

### 修改详情

#### OpenHarmonyTestRunner.ets
- **修改前**：直接调用 `Hypium.hypiumTest` 启动测试
- **修改后**：添加 `abilityDelegator.executeShellCommand(cmd)` 启动 Ability（fire and forget），`setTimeout(4000)` 延迟后执行 `Hypium.hypiumTest`，确保 Ability 完成生命周期后再跑测试

#### LinearGradientBlurTest.test.ets
- 删除 `beforeAll` 块（含 `UtilsTest.msSleep(4000)` × 2 + `startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")` 调用）
- 清理未使用 import：
  - `beforeAll` 从 hypium import 中移除
  - `UtilsTest, startAbility, stopApplication` import 整行删除（均无其他引用）
  - `AttrsManager` import 删除（无引用）
  - `HoverEffect` import 删除（无引用）
  - `Utils` default import 和 `SetValue` 从 Utils import 中移除（无引用）
- 无 standalone await 需要包裹（回调函数体仅 `expect(true).assertTrue()`，无 await 调用）
- 保持 `'use static'` 指令

## 二、Sleep 时长对齐

非 static 测试套路径：`ace_ets_component_common_seven_attrs_linearGradientBlur`（存在）

### sleep 一致（无需修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) |
|---|---|---|---|---|
| Utils.ets (static) | Utils.ets (non-static) | back() 方法 | 1000 | 1000 |
| Utils.ets (static) | Utils.ets (non-static) | backOnly() 方法 | 1000 | 1000 |
| CommonTest.ets (static) | CommonTest.ets (non-static) | back() 方法 - sharePage 分支 | 1000 | 1000 |

### 差异过大（未修改）
| static 文件 | 非 static 文件 | sleep 位置 | static(ms) | 非 static(ms) | 差异(ms) | 说明 |
|---|---|---|---|---|---|---|
| Utils.ets (static) | Utils.ets (non-static) | pushPage() 方法 - pushUrl 后 | 500 | 2000 | 1500 | 差异 > 1000ms，不修改 |
| CommonTest.ets (static) | CommonTest.ets (non-static) | initTest - 属性设置后 | 0（已注释） | 1000 | 1000 | 结构差异：static 版本整个属性设置逻辑已注释，非仅 sleep 时长不同 |

## 三、it 用例对齐

### 已匹配的用例
| static 文件 | static it 名称 | 非 static 文件 | 非 static it 名称 | 匹配方式 |
|---|---|---|---|---|
| LinearGradientBlurTest.test.ets | testLinearGradientBlurButtonSetLinearGradientBlur | LinearGradientBlurTest.test.ets | testLinearGradientBlurButtonSetLinearGradientBlur | 完全匹配 |

> 注：it 用例名由 `CommonTest.initTest` 动态生成，格式为 `pageConfig.testName + targetView + testValue.describe`。static 与非 static 参数完全一致：
> - `testName = 'testLinearGradientBlur'`
> - `supportView = ['Button']`（targetView = 'Button'）
> - `testValues[0].describe = 'SetLinearGradientBlur'`
>
> 生成相同用例名 `testLinearGradientBlurButtonSetLinearGradientBlur`，无需重命名。static 用例名不含 `_static` 后缀。

### 仅 static 存在的用例（非 static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| （无） | - |

### 仅非 static 存在的用例（static 中无对应）
| 文件 | it 用例名称 |
|---|---|
| （无） | - |

## 总结

| 步骤 | 状态 | 说明 |
|---|---|---|
| 第一步：启动方式优化 | ✅ 完成 | OpenHarmonyTestRunner.ets + LinearGradientBlurTest.test.ets 已修改 |
| 第二步：Sleep 时长对齐 | ✅ 完成 | 3 处 sleep 一致无需修改；2 处差异过大仅记录（pushPage 500→2000 差 1500ms，initTest 属性设置结构差异） |
| 第三步：it 用例对齐 | ✅ 完成 | 1 个用例完全匹配，0 个仅 static/非 static 独有 |
