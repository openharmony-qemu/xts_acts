# processtest 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/processtest/entry/src/ohosTest/ets/test/` 下 **5** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`），post-dedup 解析 **100** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；与 `concurrent_builtin_test_dedup_report.md` 完全一致，0 definite-dup）。本套件为 @ohos.process 特性主套件。
> **契约来源**：`interface/sdk-js/api/@ohos.process.d.ts`（`declare namespace process`，593 行；36 成员：22 public + 14 systemapi @test）。
> **文档来源**：`docs/zh-cn/application-dev/reference/apis-arkts/js-apis-process.md`（@ohos.process 进程信息）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
processtest（@ohos.process 进程信息与管理）
├── 1. 接口测试
│   ├── 1.1 uid / 1.2 pid / 1.3 tid（只读）
│   ├── 1.4 isIsolatedProcess / 1.5 is64Bit / 1.6 getStartRealtime / 1.7 getPastCpuTime / 1.8 uptime
│   ├── 1.9 isAppUid / 1.10 getUidForName / 1.11 getThreadPriority / 1.12 getSystemConfig / 1.13 getEnvironmentVar
│   ├── 1.14 exit / 1.15 kill（namespace 废弃 + ProcessManager @since9，合并覆盖）
│   └── 1.16 systemapi 成员与 abort（ProcessSystemApiTest：runCmd/on/off/cwd/chdir/ppid/euid/egid/gid/groups/abort 可达性）
├── 2. 稳定性（process API 100 次循环调用一致性）
├── 3. 性能（getPastCpuTime 单调递增校验）
├── 4. 并发安全（process API 跨 TaskPool/Worker 取值一致性）
├── 5. 兼容性与继承（ProcessManager 类 new 实例化；namespace→ProcessManager 迁移对应性；deprecated→@useinstead 对齐）
└── 6. 资料与文档符合性（abort/runCmd/on/off/cwd/chdir 第三方 HAP 可达性已测；ProcessInterfacetTest0700/1500 @tc.desc 与实测 API 不符）
```

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 5 文件 / 100 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | ProcessBoundaryTest.test.ets | 39 | 边界/异常(null/undefined/非法 signal→401)：namespace 7 + ProcessManager 7 方法 |
| 2 | ProcessInterfacetTest.test.ets | 15 | 独立函数 isIsolatedProcess/is64Bit/getStartRealtime/getPastCpuTime/uptime × main/TaskPool/Worker |
| 3 | ProcessSupplementSecondTest.test.ets | 26 | 并发矩阵 isAppUid/getUidForName/getThreadPriority/getSystemConfig/getEnvironmentVar × {namespace,ProcessManager} × {main,taskpool,worker} |
| 4 | ProcessSupplementTes.test.ets | 9 | 只读属性 uid/pid/tid × main/TaskPool/Worker |
| 5 | ProcessSystemApiTest.test.ets | 11 | systemapi 成员 runCmd/ChildProcess、on/off/EventListener、cwd/chdir、ppid/euid/egid/gid/groups、abort（202 或值断言） |
| | **合计** | **100** | 5 文件（+1 聚合器 List.test.ets，0 例已排除） |

---

# 1. 接口测试

## 1.1 process.uid（只读属性）

```
process.uid
├── 入参范围覆盖
│   └── number 只读常量，无入参
├── 边界值测试
│   └── uid>0（间接校验）
├── 返回值与类型验证
│   ├── 类型为 number
│   └── uid>0 断言
├── 组合场景
│   └── uid↔isAppUid 联动（散见 ProcessSupplementSecond）
├── 重复调用/幂等性
│   └── 100 次循环取值一致（main 段）
└── 并发跨线程
    ├── 主线程取值（ProcessSupplementTest0100）
    ├── TaskPool 取值（printArgs1，0200）
    └── Worker 取值（Worker9 postMessage 回环，0300）
```

- **用例位置**：`ProcessSupplementTes.test.ets`（uid `0100~0300`，3 例三场景）。
- **测了哪些**：uid 主线程/TaskPool/Worker 三场景取值与一致性 + number 类型 + uid>0；❌ 未见 ppid/euid/egid/gid/groups（systemapi，见 §7.2）。

---

## 1.2 process.pid（只读属性）

```
process.pid
├── 入参范围覆盖
│   └── number 只读常量，无入参
├── 边界值测试
│   └── pid>0（间接校验）
├── 返回值与类型验证
│   ├── 类型为 number
│   └── pid>0 断言
├── 组合场景
│   └── pid↔kill 联动（kill 未授权 pid 路径）
├── 重复调用/幂等性
│   └── 100 次循环取值一致（main 段）
└── 并发跨线程
    ├── 主线程取值（ProcessSupplementTest0400）
    ├── TaskPool 取值（printArgs2，0500）
    └── Worker 取值（Worker9 postMessage 回环，0600）
```

- **用例位置**：`ProcessSupplementTes.test.ets`（pid `0400~0600`，3 例三场景）。
- **测了哪些**：pid 主/TaskPool/Worker 三场景取值与一致性 + number 类型 + pid>0。

---

## 1.3 process.tid（只读属性）

```
process.tid
├── 入参范围覆盖
│   └── number 只读常量，无入参
├── 边界值测试
│   └── tid>0（间接校验）
├── 返回值与类型验证
│   ├── 类型为 number
│   └── tid>0 断言
├── 组合场景
│   └── tid↔getThreadPriority 联动（ProcessSupplementSecond 0700/0800/2000/2100 共 4 例）
├── 重复调用/幂等性
│   └── 100 次循环取值一致（main 段）
└── 并发跨线程
    ├── 主线程取值（ProcessSupplementTest0700）
    ├── TaskPool 取值（printArgs3，0800）
    └── Worker 取值（Worker9 postMessage 回环，0900）
```

- **用例位置**：`ProcessSupplementTes.test.ets`（tid `0700~0900`，3 例三场景）+ `ProcessSupplementSecondTest.test.ets`（tid 与 getThreadPriority 联动 4 例）。
- **测了哪些**：tid 主/TaskPool/Worker 三场景取值与一致性 + number 类型 + tid>0 + tid↔getThreadPriority 联动。

---

## 1.4 process.isIsolatedProcess()

```
isIsolatedProcess
├── 入参范围覆盖
│   └── 无参 boolean 函数
├── 返回值与类型验证
│   ├── 类型为 boolean
│   └── 断言 true（XTS 沙箱内为隔离进程）
├── 组合场景
│   └── 主线程值 vs TaskPool/Worker 返回值一致性
├── 重复调用/幂等性
│   └── 100 次循环调用结果一致
└── 并发跨线程
    ├── 主线程（ProcessInterfacetTest0100）
    ├── TaskPool（printArgs4，0200）
    └── Worker（WorkThread5 postMessage 回环，0300）
```

- **用例位置**：`ProcessInterfacetTest.test.ets`（isIsolatedProcess `0100~0300`，各 main/taskpool/worker）。
- **测了哪些**：无参 boolean 函数主线程 100 次循环 + TaskPool/Worker 跨线程一致；无异常/边界（无参无 401 契约）。

---

## 1.5 process.is64Bit()

```
is64Bit
├── 入参范围覆盖
│   └── 无参 boolean 函数
├── 返回值与类型验证
│   ├── 类型为 boolean
│   └── is64Bit 断言一致
├── 组合场景
│   └── 主线程值 vs TaskPool/Worker 返回值一致性
├── 重复调用/幂等性
│   └── 100 次循环调用结果一致
└── 并发跨线程
    ├── 主线程（ProcessInterfacetTest0400）
    ├── TaskPool（printArgs5，0500）
    └── Worker（WorkThread6 postMessage 回环，0600）
```

- **用例位置**：`ProcessInterfacetTest.test.ets`（is64Bit `0400~0600`，各 main/taskpool/worker）。
- **测了哪些**：无参 boolean 函数主线程 100 次循环 + TaskPool/Worker 跨线程一致；无异常/边界。

---

## 1.6 process.getStartRealtime()

```
getStartRealtime
├── 入参范围覆盖
│   └── 无参 number 函数
├── 边界值测试
│   └── 同进程内不变
├── 返回值与类型验证
│   ├── 类型为 number
│   └── 同进程内取值不变
├── 重复调用/幂等性
│   └── 100 次循环调用一致（main 段）
└── 并发跨线程
    ├── 主线程（ProcessInterfacetTest0700）
    ├── TaskPool（printArgs6，0800）
    └── Worker（WorkThread6 postMessage 回环，0900）
```

- **用例位置**：`ProcessInterfacetTest.test.ets`（getStartRealtime `0700~0900`，各 main/taskpool/worker）。
- **测了哪些**：无参 number 函数主线程 100 次循环 + TaskPool/Worker 跨线程比对 + 同进程不变。⚠️ `0700` @tc.desc 写 getPastCpuTime 但实测 getStartRealtime（🔴 标注错误，见 §7.2 #3/E.1）。

---

## 1.7 process.getPastCpuTime()

```
getPastCpuTime
├── 入参范围覆盖
│   └── 无参 number 函数
├── 边界值测试
│   └── 单调递增（当前值 ≥ 初始值，越界 startTime>currentTime 抛错）
├── 返回值与类型验证
│   ├── 类型为 number
│   └── 单调递增断言
├── 重复调用/幂等性
│   └── 100 次循环调用单调（main 段）
└── 并发跨线程
    ├── 主线程（ProcessInterfacetTest1000）
    ├── TaskPool（printArgs7，1100）
    └── Worker（WorkThread7 postMessage 回环，1200）
```

- **用例位置**：`ProcessInterfacetTest.test.ets`（getPastCpuTime `1000~1200`，各 main/taskpool/worker）。
- **测了哪些**：无参 number 函数主线程 100 次循环 + TaskPool/Worker 跨线程比对 + 单调递增。

---

## 1.8 process.uptime()

```
uptime
├── 入参范围覆盖
│   └── 无参 number 函数
├── 边界值测试
│   └── 单调递增（当前值 ≥ 初始值，越界 startTime>currentTime 抛错）
├── 返回值与类型验证
│   ├── 类型为 number
│   └── 单调递增断言
├── 重复调用/幂等性
│   └── 100 次循环调用单调（main 段）
└── 并发跨线程
    ├── 主线程（ProcessInterfacetTest1300）
    ├── TaskPool（printArgs8，1400）
    └── Worker（WorkThread8 postMessage 回环，1500）
```

- **用例位置**：`ProcessInterfacetTest.test.ets`（uptime `1300~1500`，各 main/taskpool/worker）。
- **测了哪些**：无参 number 函数主线程 100 次循环 + TaskPool/Worker 跨线程比对 + 单调递增。⚠️ `1500` @tc.desc 写 getPastCpuTime 但实测 uptime（🔴 标注错误，见 §7.2 #3/E.1）。

---

## 1.9 process.isAppUid(v)（namespace 废弃 + ProcessManager @since9）

```
isAppUid
├── 入参范围覆盖
│   ├── v=合法 uid（namespace isAppUid_001 / PM_isAppUid_001）
│   └── null/undefined（namespace isAppUid_002 / PM_isAppUid_002）
├── 边界值测试
│   └── null/undefined 入参
├── 异常与非法输入
│   ├── namespace null/undefined→401（弱断言，仅 `// error code 401` 注释未 assertEqual，F.1）
│   └── ProcessManager null/undefined→401（强断言 assertEqual(401)）
├── 返回值与类型验证
│   └── boolean（合法 uid→true/false）
├── 组合场景
│   └── uid↔isAppUid 联动（SupplementSecond 0100~0300 namespace / 1400~1600 PM）
├── 重复调用/幂等性
│   └── 跨 TaskPool/Worker 一致
└── 并发跨线程
    ├── namespace：TaskPool（taskpoolTestFunc1）+ Worker（Worker9）
    └── ProcessManager：TaskPool（taskpoolTestFunc6）+ Worker（Worker14）
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `isAppUid_001/002` + PM `ProcessManager_isAppUid_001/002`）+ `ProcessSupplementSecondTest.test.ets`（namespace `0100~0300` + PM `1400~1600`）。
- **测了哪些**：合法/异常入参 + namespace↔PM 对称 + 跨线程一致；401 弱断言（namespace，F.1 改造）/ 强断言（PM）。

---

## 1.10 process.getUidForName(name)（namespace 废弃 + ProcessManager @since9）

```
getUidForName
├── 入参范围覆盖
│   ├── name=合法用户名（namespace _001 / PM _001）
│   ├── name=空串（namespace _001）
│   └── null/undefined（namespace _003 / PM _002）
├── 边界值测试
│   └── 不存在用户名→-1
├── 异常与非法输入
│   ├── namespace null/undefined→401（弱断言，F.1）
│   └── ProcessManager null→401（强断言）
├── 返回值与类型验证
│   └── number（合法→uid，不存在→-1）
├── 组合场景
│   └── 合法 name→uid↔isAppUid 链
├── 重复调用/幂等性
│   └── 跨 TaskPool/Worker 一致
└── 并发跨线程
    ├── namespace：TaskPool（taskpoolTestFunc2）+ Worker（Worker10）
    └── ProcessManager：TaskPool（taskpoolTestFunc7）+ Worker（Worker15）
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `getUidForName_001~003` + PM `ProcessManager_getUidForName_001~003`）+ `ProcessSupplementSecondTest.test.ets`（namespace `0400~0600` + PM `1700~1900`）。
- **测了哪些**：合法/空串/null/undefined + 不存在→-1 + namespace↔PM 对称 + 401 弱/强断言 + 跨线程一致。

---

## 1.11 process.getThreadPriority(t)（namespace 废弃 + ProcessManager @since9）

```
getThreadPriority
├── 入参范围覆盖
│   ├── t=合法 tid（namespace _001 / PM _001）
│   └── null/undefined（namespace _002 / PM _001）
├── 边界值测试
│   └── null/undefined 入参
├── 异常与非法输入
│   ├── namespace undefined→401（弱断言，F.1）
│   └── ProcessManager null→401（强断言）
├── 返回值与类型验证
│   └── number（线程优先级）
├── 组合场景
│   └── tid↔getThreadPriority 联动（SupplementSecond 0700~0900 namespace / 2000~2100 PM）
├── 重复调用/幂等性
│   └── 跨 TaskPool/Worker 一致
└── 并发跨线程
    ├── namespace：TaskPool（taskpoolTestFunc3）+ Worker（Worker11）
    └── ProcessManager：TaskPool（taskpoolTestFunc8）+ Worker（Worker16）
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `getThreadPriority_001/002` + PM `ProcessManager_getThreadPriority_001/002`）+ `ProcessSupplementSecondTest.test.ets`（namespace `0700~0900` + PM `2000~2100`）。
- **测了哪些**：合法/null 入参 + tid↔getThreadPriority 联动 + namespace↔PM 对称 + 401 弱/强断言 + 跨线程一致。

---

## 1.12 process.getSystemConfig(name)（namespace 废弃 + ProcessManager @since9）

```
getSystemConfig
├── 入参范围覆盖
│   ├── name=合法配置名（namespace _001 / PM _001）
│   └── null/undefined（namespace _002 / PM _001）
├── 边界值测试
│   └── null/undefined 入参
├── 异常与非法输入
│   ├── namespace undefined→401（弱断言，F.1）
│   └── ProcessManager null→401（强断言）
├── 返回值与类型验证
│   └── string（系统配置值）
├── 组合场景
│   └── 合法 name→配置值读取链
├── 重复调用/幂等性
│   └── 跨 TaskPool/Worker 一致
└── 并发跨线程
    ├── namespace：TaskPool（taskpoolTestFunc4）+ Worker（Worker12）
    └── ProcessManager：TaskPool（taskpoolTestFunc9）+ Worker（Worker17）
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `getSystemConfig_001/002` + PM `ProcessManager_getSystemConfig_001/002`）+ `ProcessSupplementSecondTest.test.ets`（namespace `1000/1100` + PM `2200/2300`）。
- **测了哪些**：合法/null 入参 + namespace↔PM 对称 + 401 弱/强断言 + 跨线程一致；main 段由 Boundary 承担（SupplementSecond 无 main 段）。

---

## 1.13 process.getEnvironmentVar(name)（namespace 废弃 + ProcessManager @since9）

```
getEnvironmentVar
├── 入参范围覆盖
│   ├── name=合法环境变量名（namespace _001 / PM _001）
│   └── null（namespace _002 / PM _001）
├── 边界值测试
│   └── null 入参
├── 异常与非法输入
│   ├── namespace null→401（弱断言，F.1）
│   └── ProcessManager null→401（强断言）
├── 返回值与类型验证
│   └── string（环境变量值）
├── 组合场景
│   └── 合法 name→环境变量读取链
├── 重复调用/幂等性
│   └── 跨 TaskPool/Worker 一致
└── 并发跨线程
    ├── namespace：TaskPool（taskpoolTestFunc5）+ Worker（Worker13）
    └── ProcessManager：TaskPool（taskpoolTestFunc10）+ Worker（Worker18）
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `getEnvironmentVar_001~003` + PM `ProcessManager_getEnvironmentVar_001~003`）+ `ProcessSupplementSecondTest.test.ets`（namespace `1200/1300` + PM `2400/2500`）。
- **测了哪些**：合法/null 入参 + namespace↔PM 对称 + 401 弱/强断言 + 跨线程一致。

---

## 1.14 process.exit(code)（namespace 废弃 + ProcessManager @since9）

```
exit
├── 入参范围覆盖
│   ├── code=0（namespace exit_001 / PM_exit_001）
│   └── code=null（namespace exit_002 / PM_exit_002）
├── 边界值测试
│   └── null 入参
├── 异常与非法输入
│   ├── namespace null→401（弱断言，F.1）
│   └── ProcessManager null→401（强断言）
├── 返回值与类型验证
│   └── void（成功即终止进程）
├── 组合场景
│   └── 成功路径终止进程，不可在 XTS 内断言（结构性限制）
└── 并发跨线程
    └── ⑦❌ exit 成功即终止，无跨线程语义
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `exit_001/002` + PM `ProcessManager_exit_001/002`）。
- **测了哪些**：null 入参→401（namespace 弱断言/PM 强断言）；exit 成功路径因终止进程不可在 XTS 内断言（结构性未覆盖）。

---

## 1.15 process.kill(signal, pid)（namespace 废弃 + ProcessManager @since9）

```
kill
├── 入参范围覆盖
│   ├── signal=28（合法 1~64）、pid=合法（namespace kill_001 / PM_kill_001）
│   └── signal=null/pid=null（namespace kill_003/005 / PM_kill_003/005）
├── 边界值测试
│   ├── signal 越界（1~64 之外）
│   └── pid=负值（kill_005 invalid pid negative value）
├── 异常与非法输入
│   ├── namespace null signal/pid→401（弱断言，F.1）
│   └── ProcessManager null signal/pid→401（强断言）
├── 返回值与类型验证
│   └── boolean/void（未授权 pid→false/抛错）
├── 组合场景
│   └── pid↔kill 联动（未授权 pid 路径）
└── 并发跨线程
    └── ⑦❌ kill 成功即终止，无跨线程语义
```

- **用例位置**：`ProcessBoundaryTest.test.ets`（namespace `kill_001~005` + PM `ProcessManager_kill_001~005` + `kill_006`[实测 PM]）。
- **测了哪些**：合法/非法 signal·pid + 越界/负 pid→401（namespace 弱/PM 强）+ 跨线程一致性；kill 成功路径不可断言。⚠️ `kill_006` 命名无 `ProcessManager_` 前缀但实测 PM（命名与实现不符，见 §7.4 E.2）。

---

## 1.16 systemapi 成员与 abort（ProcessSystemApiTest，11 例）

```
systemapi 成员 + abort
├── runCmd(cmd)/ChildProcess
│   ├── testProcessSystemApi0001：runCmd('echo hi') 执行，返回 ChildProcess，断言 pid 为 number 或捕获错误码
│   └── 成功路径断言 child.close()；失败路径断言 typeof code==='number'
├── process.on(type,listener)/off(type)/EventListener
│   ├── testProcessSystemApi0002：on('testEvent', listener) 注册，成功后 off 返回 boolean
│   └── testProcessSystemApi0003：off('testEvent') 返回 boolean 或捕获错误码
├── process.cwd()
│   └── testProcessSystemApi0004：cwd() 返回非空串或捕获错误码
├── process.chdir(path)
│   └── testProcessSystemApi0005：chdir('/xts_nonexistent_dir_12345') 必抛错，断言 code 为 string 或 number
├── ppid/euid/egid/gid/groups（systemapi 只读常量）
│   ├── testProcessSystemApi0006~0010：逐属性访问，断言 202（systemapi 权限拒绝）或返回 number/number[]
│   └── 第三方 HAP 默认得 202，断言 code===202 或 typeof value==='number'
└── process.abort()（PUBLIC）
    └── testProcessSystemApi0011：仅断言 typeof process.abort==='function'（调用即终止进程，需进程外 harness）
```

- **用例位置**：`ProcessSystemApiTest.test.ets`（11 例：`SUB_PROCESS_SYSTEM_API_TEST_0100~1100`）。
- **测了哪些**：systemapi 成员 runCmd/on/off/cwd/chdir + ppid/euid/egid/gid/groups 的第三方 HAP 可达性验证（202 权限拒绝或值断言）+ abort 存在性断言；**均采用"成功即断言值类型，失败即断言错误码"双路径模式**，适配 systemapi 在第三方 HAP 下不可达的特性。

---

# 2. 稳定性
- **用例位置**：`ProcessInterfacetTest` 各 main 场景 100 循环 + `ProcessSupplementSecondTest` TaskPool 100 任务 + Worker 100 次 postMessage。
- **测了哪些**：process API 100 次循环调用结果一致性（uid/pid/tid/isIsolatedProcess/is64Bit/getStartRealtime/getPastCpuTime/uptime + 5 废弃/PM 方法跨线程 100 次）。

# 3. 性能
- **用例位置**：`ProcessInterfacetTest1000/1300`（getPastCpuTime/uptime 100 次循环断言 `startTime > currentTime` 抛错）。
- **测了哪些**：`getPastCpuTime`/`uptime` 单调递增性能校验；❌ 未见单方法基线延迟/吞吐基准。

# 4. 并发安全
- **用例位置**：`ProcessSupplementTes`（uid/pid/tid × main/TaskPool/Worker）+ `ProcessSupplementSecondTest`（5 方法 × {namespace,ProcessManager} × {main,taskpool,worker} 完整矩阵）。
- **测了哪些**：process API 跨 TaskPool/Worker 取值一致性（9+26=35 例并发矩阵）；❌ 未校验并发写写数据一致性（process API 多为只读/单调用，无写写语义）。

# 5. 兼容性与继承
- **用例位置**：`ProcessBoundaryTest`（PM 段 20）+ `ProcessSupplementSecondTest`（PM 段 13）。
- **测了哪些**：`ProcessManager` 类 `new process.ProcessManager()` 实例化覆盖 + namespace→ProcessManager 迁移对应性（7 方法 deprecated since 9 ↔ @since 9 两套对应用例，@useinstead 指向一致）；❌ 无 ProcessManager 子类化用例。

# 6. 资料与文档符合性
- **用例位置**：`ProcessSystemApiTest.test.ets`（11 例覆盖 abort/runCmd/on/off/cwd/chdir/ppid/euid/egid/gid/groups 第三方 HAP 可达性）；`ProcessInterfacetTest0700/1500` @tc.desc 与实测 API 不符（🔴，见 §7.2 #3/E.1）。
- **测了哪些**：14 个声明成员中 11 个已有第三方 HAP 可达性验证（ProcessSystemApiTest：202 权限拒绝或值断言）；abort 仅 typeof 存在性断言（调用路径需进程外 harness）；`ProcessInterfacetTest0700/1500` @tc.desc 与实测 API 不符（🔴，见 §7.2 #3/E.1）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| uid/pid/tid | ✅(9) | ✅(>0 单调) | ❌(只读) | ✅(number) | ✅(联动) | ✅(100 循环) | ✅(main/TP/Worker) |
| isIsolatedProcess/is64Bit | ✅(6) | ❌(无参) | ❌(无契约) | ✅(boolean) | ✅(三场景一致) | ✅(100 循环) | ✅(main/TP/Worker) |
| getStartRealtime/getPastCpuTime/uptime | ✅(9) | ✅(单调) | ❌(无契约) | ✅(number) | 🟡(desc 复用) | ✅(100 循环) | ✅(main/TP/Worker) |
| namespace 废弃函数(7) | ✅ | ✅(null/不存在/signal) | 🟡(401 弱断言) | ✅ | ✅(联动) | ❌(exit/kill) | ✅(TP/Worker) |
| ProcessManager 类(7) | ✅ | ✅(null/signal) | ✅(401 强断言) | ✅ | ✅(实例化) | ❌(exit/kill) | ✅(TP/Worker) |
| abort(PUBLIC) | 🟡(typeof断言) | ❌ | ❌ | ✅(typeof function) | ❌ | ❌ | ❌ |
| on/off/EventListener | 🟡(202或注册) | ❌ | ✅(202或成功) | ✅(boolean) | ❌ | ❌ | ❌ |
| runCmd/ChildProcess/ConditionType | 🟡(202或执行) | ❌ | ✅(202或成功) | ✅(pid number) | ❌ | ❌ | ❌ |
| ppid/euid/egid/gid/groups | 🟡(202或值) | ❌ | ✅(202) | ✅(number/number[]) | ❌ | ❌ | ❌ |
| cwd/chdir | 🟡(202或值) | ✅(chdir无效路径) | ✅(202或错误码) | ✅(string/boolean) | ❌ | ❌ | ❌ |

## 7.2 逐接口遗漏确认（对照 `@ohos.process.d.ts` / `js-apis-process.md`）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口 / 🔴 测试或标注缺陷。结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ts / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `uid`/`pid`/`tid`（只读） | 只读 number 常量 | ✅ 覆盖：main/TaskPool/Worker 三场景取值 + 100 循环一致。无异常契约，无缺口。 |
| 2 | `ppid`/`euid`/`egid`/`gid`/`groups`（systemapi） | systemapi @test 只读常量 | 🟡 **第三方 HAP 可达性已测**（ProcessSystemApiTest0006~0010：逐属性访问，断言 202 权限拒绝或返回 number/number[]）。✅ systemapi 不可达行为已固化。 |
| 3 | `isIsolatedProcess`/`is64Bit`/`getStartRealtime`/`getPastCpuTime`/`uptime` | 独立函数 | ✅ 覆盖：main/TP/Worker + 100 循环 + 单调性。🔴 **`ProcessInterfacetTest0700` @tc.desc 写 getPastCpuTime 但实测 getStartRealtime、`1500` desc 写 getPastCpuTime 但实测 uptime**（标注错误，E.1）。 |
| 4 | `abort()`（PUBLIC） | 终止进程 | 🟡 **存在性已测**（ProcessSystemApiTest0011：`typeof process.abort==='function'`）。❌ 调用路径（终止进程）仍需进程外 harness，XTS 内不可断言（见 §7.4 #1）。 |
| 5 | namespace 废弃函数(7) | deprecated since 9，@throws 401 | ✅ 覆盖：合法/异常入参 + 跨线程。🟡 **401 弱断言**（仅 `// error code 401` 注释，未 `assertEqual(401)`，F.1 改造）。exit/kill 成功路径结构性未覆盖。 |
| 6 | `ProcessManager` 类(7) | @since 9，@throws 401 | ✅ 覆盖：7 方法入参边界 + 401 强断言（修复 namespace 弱断言）+ 跨线程。⚠️ **`kill_006` 命名无 `ProcessManager_` 前缀但实测 PM**（命名与实现不符，E.2）。exit/kill 成功路径同 §1.4 结构性未覆盖。 |
| 7 | `on`/`off`/`EventListener`（systemapi @test） | 事件监听 | 🟡 **第三方 HAP 可达性已测**（ProcessSystemApiTest0002/0003：on 注册 + off 返回 boolean，或 202 拒绝）。✅ systemapi 不可达行为已固化。 |
| 8 | `runCmd`/`ChildProcess`/`ConditionType`（systemapi @test） | 子进程 | 🟡 **第三方 HAP 可达性已测**（ProcessSystemApiTest0001：runCmd 执行返回 ChildProcess + pid，或 202 拒绝）。✅ systemapi 不可达行为已固化。 |
| 9 | `cwd`/`chdir`（systemapi @test） | 工作目录 | 🟡 **已测**（ProcessSystemApiTest0004/0005：cwd 返回非空串或 202；chdir 无效路径必抛错断言 code 为 string/number）。✅ systemapi 不可达行为已固化。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **namespace ↔ ProcessManager 对称性**：7 方法 deprecated since 9 ↔ @since 9 两套对应用例齐全（Boundary 39 + SupplementSecond 26）；ProcessManager 段 401 强断言修复了 namespace 段的弱断言。✅ 此项基本覆盖，仅建议 namespace 段 401 强化（F.1）。
2. **exit/kill 成功路径**：exit/kill 成功即终止进程，无法在 XTS 内断言（结构性限制）；仅覆盖非法 signal/未授权 pid 的 401 路径。⚠️ 结构性缺口，非测试缺陷。
3. **uid↔isAppUid / tid↔getThreadPriority 联动**：散见 `ProcessSupplementSecondTest`（tid 0700/0800/2000/2100 与 getThreadPriority 联动）；❌ 未做 uid→isAppUid(uid)→true 的完整闭环断言（SUP_PROCESS_UID_ISAPPUID_001）。
4. **systemapi 成员可达性**：on/off/runCmd/ChildProcess/cwd/chdir/ppid/euid/egid/gid/groups 共 14 个声明成员现已由 `ProcessSystemApiTest.test.ets`（11 例）覆盖第三方 HAP 可达性（202 权限拒绝或值/调用断言）。✅ 可达性已覆盖；🟡 systemapi 成员在 systemapi 权限环境下的正向行为仍需 systemapi 测试套件覆盖。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **abort() 存在性已测、调用路径未测（PUBLIC）**：`process.abort()` 为 PUBLIC 成员，`ProcessSystemApiTest0011` 已断言 `typeof process.abort==='function'`（存在性）。调用路径（终止进程）不可在 XTS 内断言，需进程外 harness。建议资料侧在 `.md` 注明"abort 在 XTS 测试环境因终止进程不可断言，建议在隔离环境验证"。
2. **systemapi 成员可达性已测、正向行为待 systemapi 套件**：on/off/EventListener/runCmd/ChildProcess/ConditionType/cwd/chdir/ppid/euid/egid/gid/groups 共 14 个声明为 systemapi @test，`ProcessSystemApiTest.test.ets`（11 例）已覆盖第三方 HAP 下的可达性（202 权限拒绝或值断言）。systemapi 权限环境下的正向行为仍需 systemapi 测试套件覆盖。建议资料侧保留 systemapi 标注。
3. **@tc.desc 与实测 API 不符（🔴 测试缺陷）**：`ProcessInterfacetTest0700` desc 写 getPastCpuTime 但实测 getStartRealtime、`1500` desc 写 getPastCpuTime 但实测 uptime（E.1）。建议修正 @tc.desc 与实测 API 对齐。
4. **namespace 段 401 弱断言**：namespace 废弃函数 401 仅注释 `// error code 401` 未 `assertEqual(401)`，ProcessManager 段已强断言（对照）。建议 namespace 段同步强化为 `expect(error.code).assertEqual(401)`（F.1）。
5. **kill_006 命名不符**：`kill_006` 用例名无 `ProcessManager_` 前缀但实测 `new process.ProcessManager().kill()`（E.2）。建议重命名为 `ProcessManager_kill_006` 与实现对齐。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 3 | E.1（0700/1500 desc 修正）、E.2（kill_006 重命名）、F.1（namespace 401 强化） | 标注错误/命名不符/弱断言强化；属契约符合性与可追溯性硬缺口。 |
| **P2** | 1 | SUP_PROCESS_UID_ISAPPUID_001 | uid→isAppUid 闭环联动；非阻断但提升组合覆盖。 |
| — | — | abort 调用路径 + systemapi 正向行为（14 systemapi 成员） | 可达性已由 ProcessSystemApiTest 覆盖（11 例）；调用路径/正向行为需进程外 harness 或 systemapi 套件覆盖，本套件不补。 |
| **合计** | **1 新增 + 3 改造** | | P1=3 改造 / P2=1 新增。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 只读属性无参、独立函数无参、废弃/PM 方法合法+非法入参（uid/tid/name/signal/code/null/undefined） | BoundaryTest null/undefined/非法 signal、SupplementSecond 5 方法 × 合法入参 |
| ②边界值测试 | uid>0/pid>0 单调、null/undefined、不存在用户名→-1、signal 1~64 越界、单调递增 | InterfacetTest getPastCpuTime/uptime 单调、Boundary signal 越界 |
| ③异常与非法输入 | null/undefined→401（namespace 弱断言/PM 强断言）、非法 signal | BoundaryTest namespace 段 + PM 段 401 |
| ④返回值与类型验证 | number（uid/pid/tid/getStartRealtime/getPastCpuTime/uptime）、boolean（isIsolatedProcess/is64Bit/isAppUid）、string（getSystemConfig/getEnvironmentVar）、void（exit/kill） | InterfacetTest/SupplementTes 返回值断言 |
| ⑤组合场景 | uid↔isAppUid、tid↔getThreadPriority、pid↔kill 联动、new ProcessManager() 实例化+方法链 | SupplementSecond 联动段、Boundary PM 实例化 |
| ⑥重复调用幂等性 | 100 次循环取值一致（只读属性/无参函数/5 方法跨线程 100 次） | InterfacetTest 100 循环、SupplementSecond TP 100 任务/Worker 100 次 |
| ⑦并发跨线程 | 主线程 vs TaskPool（printArgs1~10）vs Worker（Worker9~18 postMessage 回环）取值一致性 | SupplementTes/SupplementSecond main/TP/Worker 三场景矩阵 |
