# ActsAceEtsModuleAnimationApi18StaticTest Static 优化总结报告

## 1. 启动方式优化

### 1.1 OpenHarmonyTestRunner.ets 修改

**文件路径**: `entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets`

**修改内容**: 将 `onRun` 方法替换为使用 `executeShellCommand` 启动 Ability + `setTimeout(4000)` 等待 Ability 就绪后再执行测试用例。

| 修改项 | 修改前 | 修改后 |
|--------|--------|--------|
| onRun 方法 | 直接调用 `Hypium.hypiumTest()` | 先执行 `aa start` 命令启动 EntryAbility，再 `setTimeout(4000)` 后执行测试 |

### 1.2 测试文件 startAbility 清理

通过 Grep 搜索 `startAbility`，找到以下文件：

| 文件 | 包含 startAbility | 修改操作 |
|------|-------------------|----------|
| `Util.test.ets` | 是（函数定义） | 无需修改（无 beforeAll 块，await 已在 try-catch 中） |
| `AnimatorResultTest/ExpectedFrameRateRange.test.ets` | 是（beforeAll 中调用） | 已修改 |

**ExpectedFrameRateRange.test.ets 具体修改**:

| 修改项 | 操作 |
|--------|------|
| `beforeAll` 块（含 `UtilsTest.startAbility`） | 已删除 |
| `beforeAll` 从 hypium import 中移除 | 已删除 |
| `import { UtilsTest } from '../Util.test'` | 已删除（不再使用） |
| `'use static'` 指令 | 保留 |
| afterEach 中 `await CommonFunc.sleep(1000)` | 已包裹 try-catch |
| 测试体中 4 处独立 `await` 调用 | 已包裹 try-catch |
| `let isAbilityStarted: boolean = false` | 不存在，无需处理 |
| 未使用模块变量（domain, tag, testAbilityContext） | 不存在，无需处理 |

**保留的 imports**（仍被使用）:
- `emitter`, `router`, `CommonFunc`, `inspector`, `Router`, `AppStorage`, `RecordData`
- UiTest 相关: `Component`, `DisplayRotation`, `Driver`, `MatchPattern`, `ON`, `PointerMatrix`, `ResizeDirection`, `WindowMode`
- hypium: `afterAll`, `afterEach`, `beforeEach`, `describe`, `expect`, `it`, `Level`

### 1.3 修改文件清单

| 文件 | 修改类型 |
|------|----------|
| `entry/src/main/src/testrunner/OpenHarmonyTestRunner.ets` | onRun 方法重写 |
| `entry/src/main/src/test/AnimatorResultTest/ExpectedFrameRateRange.test.ets` | 删除 beforeAll，清理 import，包裹 try-catch |

---

## 2. Sleep 时长对齐

**非静态目录**: `ace_ets_module_animation_api18/entry/src/main/ets/test/`

### 2.1 匹配文件对比

| 测试文件 | 静态路径 | 非静态路径 |
|----------|----------|------------|
| `ExpectedFrameRateRange.test.ets` | `src/main/src/test/AnimatorResultTest/` | `src/main/ets/test/AnimatorResultTest/` |

### 2.2 Sleep 调用对比

| 位置 | 静态 Sleep | 非静态 Sleep | 差值 | 操作 |
|------|-----------|-------------|------|------|
| beforeEach | `CommonFunc.sleep(2000)` | `CommonFunc.sleep(2000)` | 0ms | 已对齐，无需修改 |
| afterEach | `CommonFunc.sleep(1000)` | `CommonFunc.sleep(1000)` | 0ms | 已对齐，无需修改 |
| 测试体 #1 | `CommonFunc.sleep(1000)` | `CommonFunc.sleep(1000)` | 0ms | 已对齐，无需修改 |
| 测试体 #2 | `CommonFunc.sleep(1000)` | `CommonFunc.sleep(1000)` | 0ms | 已对齐，无需修改 |

### 2.3 单边 Sleep 统计

| 类型 | 数量 | 说明 |
|------|------|------|
| 静态独有 Sleep | 0 | 无 |
| 非静态独有 Sleep | 0 | 无 |

### 2.4 Sleep 对齐总结

- **已对齐 Sleep 数量**: 4（全部已匹配，差值均为 0ms）
- **需要修改的 Sleep 数量**: 0
- **差值 > 1000ms 未修改的 Sleep 数量**: 0

---

## 3. it 用例对齐

### 3.1 用例名称提取

**静态用例**:

| 序号 | it 名称 |
|------|---------|
| 1 | `ExpectedFrameRateRange_static_001` |

**非静态用例**:

| 序号 | it 名称 |
|------|---------|
| 1 | `ExpectedFrameRateRange` |

### 3.2 匹配结果

| 静态用例名 | 去除 _static 后 | 非静态候选 | 精确匹配 | 去后缀匹配 | Levenshtein 距离 | 模糊匹配 (<=3) | 最终结果 |
|------------|-----------------|------------|----------|-----------|-----------------|---------------|----------|
| `ExpectedFrameRateRange_static_001` | `ExpectedFrameRateRange_001` | `ExpectedFrameRateRange` | 否 | 否 | 4 | 否 | 静态独有 |

> Levenshtein 距离计算: `ExpectedFrameRateRange_001` → `ExpectedFrameRateRange` 需删除 `_001` 共 4 个字符，距离 = 4 > 3，不满足模糊匹配条件。

### 3.3 用例分类

| 分类 | 数量 | 用例名称 |
|------|------|----------|
| 匹配成功 | 0 | — |
| 静态独有 | 1 | `ExpectedFrameRateRange_static_001` |
| 非静态独有 | 1 | `ExpectedFrameRateRange` |

### 3.4 it 用例对齐总结

- **匹配成功数量**: 0
- **静态独有数量**: 1
- **非静态独有数量**: 1

---

## 4. 总结

| 优化维度 | 修改文件数 | 修改项数 |
|----------|-----------|---------|
| 启动方式优化 | 2 | 7（onRun 重写 + beforeAll 删除 + import 清理 + try-catch 包裹） |
| Sleep 时长对齐 | 0 | 0（全部已对齐） |
| it 用例对齐 | 0 | 0（无匹配项） |

### 修改文件汇总

1. **OpenHarmonyTestRunner.ets** — onRun 方法增加 `executeShellCommand` 启动 Ability + `setTimeout(4000)` 等待
2. **ExpectedFrameRateRange.test.ets** — 删除 beforeAll(startAbility) 块，移除 beforeAll/UtilsTest import，为 5 处独立 await 调用添加 try-catch

### Sleep 对齐汇总

- 全部 4 处 sleep 调用已与非静态版本完全一致（差值 0ms），无需修改

### it 用例对齐汇总

- 匹配成功: 0 对
- 静态独有: 1 个（`ExpectedFrameRateRange_static_001`）
- 非静态独有: 1 个（`ExpectedFrameRateRange`）
