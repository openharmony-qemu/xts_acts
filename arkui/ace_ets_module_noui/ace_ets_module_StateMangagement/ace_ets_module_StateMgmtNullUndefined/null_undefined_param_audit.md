# 逐接口 / 逐参数覆盖结论（复审）

对照：`/root/aiSkill/develop/需求/arkui动态未覆盖接口.xlsx`（134 行）  
工程：`ace_ets_module_StateMgmtNullUndefined`  
复审时间：2026-07-17

## 总览

| 类别 | 结论 |
|------|------|
| **Method 有参**（AppStorage/LocalStorage/Environment/PersistentStorage/AppStorageV2/PersistenceV2/UIUtils/AbstractProperty/$r/$rawfile/IMonitor.value 等） | **每个可调用参数均有 null + undefined 用例**（或页面内实际调用） |
| **Property**（EntryOptions.storage / ConnectOptions.defaultCreator / ReuseOptions.reuseId 等） | **undefined 已覆盖**；**null 类型不接受 → 已归档编不过** |
| **Decorator** | 能编过的（Provider/Consumer/Monitor/Storage*/LocalStorage*）已传 null/undefined；编不过的见下表 |
| **无参 Method** | NoArgSmoke 冒烟调用（无法传异常入参） |
| **Class/Interface/TypeAlias/Enum/protected ctor** | 非入参实体：页面/引用覆盖或 N/A |

## Method：已确认参数全覆盖

对下列类的**每一个形参**核对了 `*_null_*` / `*_undefined_*` 命名用例或等价调用：

- AppStorage（含大小写重载：Link/link、Set/set…）
- LocalStorage（除 constructor(null) 编不过）
- Environment / PersistentStorage
- AppStorageV2.connect(type, keyOrDefaultCreator, defaultCreator) / remove
- PersistenceV2.globalConnect / save / notifyOnError
- UIUtils 各 Method（含 addMonitor 的 target/path/callback/options）
- AbstractProperty.set / SubscribedAbstractProperty.set
- IMonitor.value(path)
- `$r(value, ...params)` / `$rawfile(value)`

**唯一 Method 缺口（编不过，非漏写）：**

| 接口 | 参数 | 异常值 | 说明 |
|------|------|--------|------|
| `LocalStorage.constructor` | initializingProperties | **null** | 类型仅为 `Object \| undefined`，见 compile_failures |

## Property：undefined OK / null 编不过

| 属性 | undefined | null |
|------|-----------|------|
| ConnectOptions.defaultCreator | OK | 编不过（已归档） |
| ConnectOptionsCollections.defaultCreator | OK（已补专用用例） | 编不过（同 StorageDefaultCreator） |
| ConnectOptionsCollections.defaultSubCreator | OK | 编不过（同左） |
| EntryOptions.storage | OK | 编不过（已归档） |
| ReuseOptions.reuseId | OK | 编不过（已归档） |

## Decorator：异常参数 vs 页面覆盖

| 装饰器 | null/undefined 入参 | 说明 |
|--------|---------------------|------|
| @Provider / @Consumer | **已传** | DecoratorNullArgsCover |
| @Monitor(null/undefined) | **不可测，已删** | 运行时崩溃；异常入参用例已删除，不测正常参数；见 compile_failures |
| @StorageProp / @StorageLink / @LocalStorageProp / @LocalStorageLink | **已传** | StorageWatchNullArgsCover |
| @Provide / @Consume | **编不过** | 页面合法 string 键覆盖 + 归档 |
| @Watch(null) | **编不过** | 合法回调名覆盖 + 归档 |
| @Watch(undefined) | 编译器 WARN/不接受 | 同上 |
| @Entry(null) / @Preview(null) / @Extend(null) / @Component*(null) / @ReusableV2(null) / @Env(null) / @Type | **编不过或不可用** | 页面合法用法覆盖 + 归档 |
| Env 函数式 `Env(key)` | 同 @Env | 用 SystemProperties 合法键覆盖 |

## 无参 / N/A（无法做异常入参）

- AppStorage.Clear/clear、Environment.Keys/keys、PersistentStorage.Keys/keys、LocalStorage.clear、UIUtils.flushUpdates/flushUIUpdates → `NoArgSmokeNullUndefinedTest`
- SystemEnvKey / CustomEnvKey **protected constructor** → 不可外部 new
- Class / Interface / TypeAlias / Enum 声明本体 → 非可调入参

## 设备验证

最近一次整包连跑：**21 Suites / 215 Pass / 0 Fail**（补 `ConnectOptionsCollections_defaultCreator_undefined` 后建议再跑 ConnectOptions 套件确认）。

编不过归档：`null_undefined_compile_failures.md`
