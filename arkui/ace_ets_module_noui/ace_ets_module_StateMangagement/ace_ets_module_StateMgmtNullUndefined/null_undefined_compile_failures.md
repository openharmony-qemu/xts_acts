# StateMgmt null/undefined 编译失败与不可测归档

工程：`ace_ets_module_StateMgmtNullUndefined`  
对照表：`/root/aiSkill/develop/需求/arkui动态未覆盖接口.xlsx`（134 行）  
探测时间：2026-07-17（hapbuild `CompileArkTS` 实测；终审复测）

## 规则

1. Method 有参：优先直接传 `null`/`undefined`；字面量编不过则用 `T | null` 中间变量。
2. 仍编不过：记入本文件，**不写** Hypium 异常入参；可写合法用法页面。
3. 无参 Method / Class / Interface / TypeAlias / Enum / protected ctor：无法传异常入参。
4. **审查口径**（与 `@Provide` 示例一致）：页面仅合法用法 ≠ 已覆盖异常入参；须同时满足「异常入参用例」或「本文件归档」。

## 编译失败（实测 ERROR，已从用例移除）

| 接口 | 异常值 | 错误摘要 |
|------|--------|----------|
| `LocalStorage` constructor | `null` | `Argument of type 'null' is not assignable to parameter of type 'Object \| undefined'` |
| `ConnectOptions.defaultCreator` | `null` | `Type 'null' is not assignable to type 'StorageDefaultCreator<T> \| undefined'` |
| `ConnectOptionsCollections.defaultCreator` | `null` | 同上 |
| `ConnectOptionsCollections.defaultSubCreator` | `null` | 同上 |
| `EntryOptions.storage` | `null` | `Type 'null' is not assignable to type 'LocalStorage \| undefined'` |
| `ReuseOptions.reuseId` | `null` | `Type 'null' is not assignable to type 'ReuseIdCallback \| undefined'` |
| `@Provide(null/undefined)` | null/undefined | 不可赋给 `string \| ProvideOptions` |
| `@Consume(null/undefined)` | null/undefined | 不可赋给 `string` |
| `@Watch(null)` | null | `'@Watch' cannot be used with 'null'`（ERROR） |
| `@Extend(null/undefined)` | null/undefined | Extend 链式体解析失败 / options 不可用 |
| `@Preview(null/undefined)` | null/undefined | class decorator 调用签名无法解析；`null` 不可赋给 Function |
| `@Component(null/undefined)` | null/undefined | 同上 |
| `@ComponentV2(null/undefined)` | null/undefined | 同上 |
| `@ReusableV2(null/undefined)` | null/undefined | 同上 |
| `@Entry(null)` | null | class decorator 调用签名无法解析 |
| `@Env(null/undefined)` | null/undefined | 仅接受合法 `SystemProperties`（如 BREAK_POINT） |
| `@Type(...)` | （本工程） | `Cannot find name 'Type'`（以 `@Trace` + ObservedV2 页面覆盖） |

## 编译通过但运行时崩溃（不可挂页面加载路径）

| 接口 | 异常值 | 现象（设备 hilog） | 处理 |
|------|--------|-------------------|------|
| `@Monitor(null)` / `@Monitor(undefined)`（含 options 第二参 null/undefined） | null/undefined | `TypeError: Cannot read property enableWildcard of null`；页面无法加载 | **异常入参用例已删除**（不测正常参数）；归档本表 |

## 编译通过的异常参数（必须写用例/页面）

| 接口 | 写法 |
|------|------|
| `@Provider(null/undefined)` | DecoratorNullArgsCover |
| `@Consumer(null/undefined)` | DecoratorNullArgsCover |
| `@StorageProp/@StorageLink/@LocalStorage*(null/undefined)` | StorageWatchNullArgsCover |
| `@Watch(undefined)` | StorageWatchNullArgsCover（仅 WARN，可编） |
| `Method Env(null/undefined)` | EnvDecoratorCover.aboutToAppear |
| `IMonitor.value(null/undefined)` | MonitorValueCover（合法 `@Monitor('name')`） |
| `EntryOptions.storage: undefined` | EntryOptionsNullUndefinedTest |
| `ReuseOptions.reuseId: undefined` | ReuseOptionsNullUndefinedTest |
| `ConnectOptions*.default*Creator: undefined` | ConnectOptionsNullUndefinedTest |

## 页面合法用法 + 上表归档（异常参数不可编）

| 接口 | 页面 |
|------|------|
| `@Provide` / `@Consume`（合法 string） | ProvideConsumeNullArgsCover |
| `@Watch`（合法回调名；null 归档） | StorageWatchNullArgsCover |
| `@Preview` / `@Extend` / `@Component*` / `@ReusableV2` | PreviewExtendCover |
| `@Env`（合法 SystemProperties） | EnvDecoratorCover / CustomEnvCover |
| `@Entry` + EntryOptions 合法 storage | EntryOptionsCover |

## 无参 / 非入参类型

AppStorage.Clear/clear、Environment.Keys/keys、PersistentStorage.Keys/keys、LocalStorage.clear、UIUtils.flushUpdates/flushUIUpdates、SystemEnvKey/CustomEnvKey **protected** constructor、TypeAlias、Enum、Class/Interface 声明本体（工程内引用即可）。
