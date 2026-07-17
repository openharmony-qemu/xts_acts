# 终审：需求表 × 异常入参覆盖（按「Provide 检查思路」）

对照：`arkui动态未覆盖接口.xlsx`（134 行）  
口径：每个**可传参**接口，对每个参数的 `null` / `undefined` 必须是下面之一：

1. **ABN**：用例或页面**实际传入**异常值；  
2. **ARCH**：`null_undefined_compile_failures.md` 有实测编不过记录；  
3. **N/A**：无参 / protected ctor / 纯类型声明。

禁止：仅页面合法用法却**既未传异常参数、又未归档**（本次终审重点）。

## 本轮发现并修复的遗漏

| 项 | 问题 | 处理 |
|----|------|------|
| `CustomComponentLifecycle.addObserver` | 仅 null，缺 undefined | LifecycleReuseCover 已补 |
| `CustomComponentLifecycle.removeObserver` | 仅 undefined，缺 null | LifecycleReuseCover 已补 |
| Method `Env(key)` | 仅有 `@Env(合法键)`，未调 `Env(null/undefined)`（函数式可编） | EnvDecoratorCover 已补 |
| `@Watch(undefined)` | 仅归档了 null；undefined 仅 WARN 可编却未写 | StorageWatchNullArgsCover 已补 |
| `@Component/@Preview/@Extend/@ComponentV2/@ReusableV2/@Entry(null)/@Env` | 合法页有，归档表原先未逐条写清 | compile_failures 已补全 |

## 134 行分类结论

### A. Method 有参 → ABN 或 ARCH（齐全）

AppStorage（含大小写重载）、LocalStorage（constructor null=ARCH）、Environment、PersistentStorage、AppStorageV2、PersistenceV2、UIUtils、AbstractProperty、SubscribedAbstractProperty、`$r`/`$rawfile`、IMonitor.value、ConnectOptions*、EntryOptions.storage、ReuseOptions.reuseId、lifecycle/reuse 池相关 Method。

### B. Decorator → ABN 或 ARCH（齐全）

| 装饰器 | null | undefined |
|--------|------|-----------|
| Provider / Consumer / Monitor | ABN | ABN |
| StorageProp / StorageLink / LocalStorage* | ABN | ABN |
| Watch | ARCH(ERROR) | ABN（WARN） |
| Provide / Consume | ARCH | ARCH |
| Component / ComponentV2 / Preview / Extend / ReusableV2 | ARCH | ARCH |
| Entry | ARCH(null)；无参 `@Entry` 合法页 | `@Entry(undefined)` 非目标（可选 options 省略） |
| EnvDecorator `@Env` | ARCH | ARCH |
| TypeDecorator | ARCH（无 Type 符号） | 同左 |

### C. N/A（无法异常入参）

无参 Clear/Keys/flush*；Class/Interface/TypeAlias/Enum；SystemEnvKey/CustomEnvKey protected ctor。  
类型名在 Connect/Env/Reuse 页面与用例中有引用即可。

## 设备验证（本轮增量）

- LifecycleReuseNullUndefinedTest：2 Pass  
- Env / StorageWatch：编签后须再跑（见会话）

## 相关文件

- `null_undefined_compile_failures.md` — 编不过权威表  
- `null_undefined_param_audit.md` — 摘要  
- `ProvideConsumeNullArgsCover.ets` — 合法用法 + 注释指向归档（正确范式）
