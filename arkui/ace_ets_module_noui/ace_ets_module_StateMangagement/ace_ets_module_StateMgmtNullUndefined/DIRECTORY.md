# StateMgmtNullUndefined 目录结构

对照表：`需求/arkui动态未覆盖接口.xlsx`（134 行）

## 页面 `entry/src/main/ets/MainAbility/pages/`

| 目录 | 覆盖接口 |
|------|----------|
| `appStorage/` | @StorageProp/@StorageLink/@Watch/@LocalStorage* |
| `entry/` | @Entry / EntryOptions.storage |
| `env/` | @Env / EnvDecorator / CustomEnvKey / SystemProperties |
| `decorators/` | @Provider/@Consumer/@Monitor/@Provide/@Consume/@Preview/@Extend/@Component*/@ReusableV2 |
| `monitor/` | IMonitor.value(null/undefined) |
| `reuse/` | ReuseOptions / @ReusableV2.reuse |
| `lifecycle/` | CustomComponentLifecycle / IReusePool / aboutToReuse |
| `index/` | Hypium 入口 |

## 用例 `entry/src/main/ets/test/`

| 目录 | Suite |
|------|-------|
| `appStorage/` | AppStorageNullUndefinedTest |
| `localStorage/` | LocalStorageNullUndefinedTest |
| `environment/` | EnvironmentNullUndefinedTest |
| `persistentStorage/` | PersistentStorageNullUndefinedTest |
| `appStorageV2/` | AppStorageV2NullUndefinedTest |
| `persistenceV2/` | PersistenceV2NullUndefinedTest |
| `uiUtils/` | UIUtilsNullUndefinedTest / UIUtilsOptionsNullUndefinedTest |
| `global/` | GlobalResNullUndefinedTest（$r/$rawfile） |
| `abstractProperty/` | AbstractPropertyNullUndefinedTest |
| `connectOptions/` | ConnectOptionsNullUndefinedTest |
| `entry/` | EntryOptionsNullUndefinedTest |
| `decorators/` | Provider/Storage/Provide/Preview 等装饰器 Suite |
| `env/` | EnvDecoratorNullUndefinedTest |
| `monitor/` | MonitorValueNullUndefinedTest |
| `reuse/` | ReuseOptionsNullUndefinedTest |
| `lifecycle/` | LifecycleReuseNullUndefinedTest |
| `noArg/` | NoArgSmokeNullUndefinedTest（无参 Method 冒烟） |
| `common/` | NullUndefinedAssertHelper / PagePushHelper |

## 归档

- `null_undefined_compile_failures.md`：null 编不过清单
- `null_undefined_coverage_matrix.md`：134 接口覆盖矩阵（可重生成）
