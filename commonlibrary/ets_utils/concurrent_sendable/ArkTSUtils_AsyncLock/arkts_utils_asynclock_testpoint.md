# ArkTSUtils.locks.AsyncLock 最终测试点报告

## 文件清单
| # | 文件 | 活跃用例 | 注释用例 | 总计 |
|---|------|---------|---------|------|
| 1 | AsynclockSameTest.test.ets | 49 | 0 | 49 |
| 2 | AsynclockSameAddTest.test.ets | 32 | 0 | 32 |
| 3 | AsynclockSameSecondTest.test.ets | 7 | 0 | 7 |
| 4 | AsynclockSameAddSecondTest.test.ets | 5 | 0 | 5 |
| 5 | AsynclockDifferentTest.test.ets | 38 | 0 | 38 |
| 6 | AsynclockDifferentSecondTest.test.ets | 12 | 0 | 12 |
| 7 | AsynclockDifferentThirdTest.test.ets | 37 | 0 | 37 |
| 8 | AsynclockDifferentForthTest.test.ets | 13 | 0 | 13 |
| 9 | AsyncLockConcurrencyBaseTest.test.ets | 5 | 0 | 5 |
| 10 | AsyncLocktest.test.ets | 5 | 0 | 5 |
| 11 | ConcurrentAsyncLockTest.test.ets | 9 | 0 | 9 |
| 12 | ConcurrencyModularImportAsyncLockTest.test.ets | 16 | 0 | 16 |
| 13 | AsyncLockArkTSUtilsSubset.test.ets | 52 | 0 | 52 |
| 14 | AsyncLockUtilsCoverageSubset.test.ets | 4 | 0 | 4 |
| **合计** | **14个文件** | **284** | **0** | **284** |

---

# AsyncLock 动态组测试点提取（8文件193用例）

## 1. AsynclockSameTest.test.ets (49用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockSameTest0100 | request('lock_1')/lockAsync/SHARED | lock_1/10并发 | 10次同名锁SHARED并发try-catch内throw验证计数count=10 |
| 2 | AsynclockSameTest0200 | taskpool.execute(taskFunctionTest0200) | 3次execute | taskpool执行taskFunctionTest0200验证3次完成count=3 |
| 3 | AsynclockSameTest0300 | request('lock_1')/lockAsync/SHARED | lock_1/10并发 | 10次同名锁SHARED并发setTimeout resolve验证计数count=10 |
| 4 | AsynclockSameTest0400 | taskpool.execute(taskFunctionTest0400) | 3次execute | taskpool执行taskFunctionTest0400验证3次完成count=3 |
| 5 | AsynclockSameTest0500 | request('lock_1')/lockAsync/SHARED | lock_1/10并发 | 10次同名锁SHARED并发setTimeout reject验证计数count=10 |
| 6 | AsynclockSameTest0600 | taskpool.execute(taskFunctionTest0600) | 3次execute | taskpool执行taskFunctionTest0600验证3次完成count=3 |
| 7 | AsynclockSameTest0700 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=10 |
| 8 | AsynclockSameTest0800 | request('lock_1')/lockAsync/SHARED | lock_1/10并发 | 10次同名锁SHARED并发throw+reject验证count=10 errorCount=10 |
| 9 | AsynclockSameTest0900 | taskpool.execute(taskFunctionTest0900) | 3次execute | taskpool执行taskFunctionTest0900验证3次完成count=3 |
| 10 | AsynclockSameTest1000 | request('lock_1')/lockAsync/SHARED+onExecutionSucceeded | lock_1/printArgs1 | onExecutionSucceeded回调内SHARED+throw验证count=1 executionSucceededCount=1 errorCount=1 |
| 11 | AsynclockSameTest1100 | request('lock_1')x2/lockAsync/SHARED+SHARED | lock_1x2/10并发 | 双同名锁SHARED嵌套SHARED+throw+reject验证count=10 errorCount=10 |
| 12 | AsynclockSameTest1200 | taskpool.execute(taskFunctionTest1200) | 3次execute | taskpool执行taskFunctionTest1200验证3次完成count=3 |
| 13 | AsynclockSameTest1300 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |
| 14 | AsynclockSameTest1400 | request('lock_1')x2/lockAsync/SHARED+SHARED | lock_1x2/10并发 | 双同名锁SHARED嵌套SHARED+setTimeout resolve验证count=10 |
| 15 | AsynclockSameTest1500 | taskpool.execute(taskFunctionTest1500) | 3次execute | taskpool执行taskFunctionTest1500验证3次完成count=3 |
| 16 | AsynclockSameTest1600 | request('lock_1')x2/lockAsync/SHARED+SHARED+onEnqueued | lock_1x2/printArgs1 | onEnqueued回调内双同名锁SHARED嵌套SHARED验证count=1 onEnqueuedcount=1 |
| 17 | AsynclockSameTest1700 | request('lock_1')x2/lockAsync/SHARED+SHARED | lock_1x2/10并发 | 双同名锁SHARED嵌套SHARED+setTimeout reject验证count=10 |
| 18 | AsynclockSameTest1800 | taskpool.execute(taskFunctionTest1800) | 3次execute | taskpool执行taskFunctionTest1800验证3次完成count=3 |
| 19 | AsynclockSameTest1900 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |
| 20 | AsynclockSameTest2000 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE | lock_1x2/10并发 | 同名锁SHARED外层EXCLUSIVE内层+throw+catch验证count=10 errorCount=10 |
| 21 | AsynclockSameTest2100 | taskpool.execute(taskFunctionTest2100) | 3次execute | taskpool执行taskFunctionTest2100验证3次完成count=3 |
| 22 | AsynclockSameTest2200 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE+onStartExecution | lock_1x2/printArgs1 | onStartExecution回调内SHARED+EXCLUSIVE+throw验证count=1 onStartExecutioncount=1 |
| 23 | AsynclockSameTest2300 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE | lock_1x2/10并发 | 同名锁SHARED外层EXCLUSIVE内层+new Promise count++验证count=10 |
| 24 | AsynclockSameTest2400 | taskpool.execute(taskFunctionTest2400) | 3次execute | taskpool执行taskFunctionTest2400验证3次完成count=3 |
| 25 | AsynclockSameTest2500 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE+onExecutionFailed | lock_1x2/test(抛异常) | onExecutionFailed回调内SHARED+EXCLUSIVE验证count=1 onExecutionFailedcount=1 |
| 26 | AsynclockSameTest2600 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE | lock_1x2/10并发 | 同名锁SHARED外层EXCLUSIVE内层+new Promise reject验证count=10 |
| 27 | AsynclockSameTest2700 | taskpool.execute(taskFunctionTest2700) | 3次execute | taskpool执行taskFunctionTest2700验证3次完成count=3 |
| 28 | AsynclockSameTest2800 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |
| 29 | AsynclockSameTest2900 | request('lock_1')x2/lockAsync/SHARED+SHARED | lock_1x2/10并发/printArgs1 | 双同名锁SHARED嵌套SHARED+内嵌taskpool printArgs1验证count=10 |
| 30 | AsynclockSameTest3000 | taskpool.execute(taskFunctionTest3000) | 3次execute | taskpool执行taskFunctionTest3000验证3次完成count=3 |
| 31 | AsynclockSameTest3100 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |
| 32 | AsynclockSameTest3200 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE | lock_1x2/10并发/printArgs1 | 同名锁SHARED外层EXCLUSIVE内层+内嵌taskpool printArgs1验证count=10 |
| 33 | AsynclockSameTest3300 | taskpool.execute(taskFunctionTest3300) | 3次execute | taskpool执行taskFunctionTest3300验证3次完成count=3 |
| 34 | AsynclockSameTest3400 | request('lock_1')x2/lockAsync/SHARED+SHARED+taskpool.finally | lock_1x2/printArgs1 | taskpool.finally回调内双同名锁SHARED嵌套+内嵌printArgs1验证count=1 |
| 35 | AsynclockSameTest3500 | request('lock_1')x2/lockAsync/SHARED+SHARED | lock_1x2/10并发 | 双同名锁SHARED嵌套SHARED+内嵌worker(Worker)验证count=10 returnCount=42 |
| 36 | AsynclockSameTest3600 | taskpool.execute(taskFunctionTest3600) | 3次execute | taskpool执行taskFunctionTest3600验证3次完成count=3 |
| 37 | AsynclockSameTest3700 | request('lock_1')x2/lockAsync/SHARED+SHARED+worker.onmessage | lock_1x2/Worker | worker onmessage回调内SHARED嵌套SHARED+内嵌worker验证count=42 |
| 38 | AsynclockSameTest3800 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE | lock_1x2/10并发 | 同名锁SHARED外层EXCLUSIVE内层+内嵌worker(Worker)验证count=10 returnCount=42 |
| 39 | AsynclockSameTest3900 | taskpool.execute(taskFunctionTest3900) | 3次execute | taskpool执行taskFunctionTest3900验证3次完成count=3 |
| 40 | AsynclockSameTest4000 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证e.data=42 |
| 41 | AsynclockSameTest4100 | request('lock_1')x3/lockAsync/SHARED+SHARED+SHARED | lock_1x3/10并发/printArgs1 | 三同名锁SHARED三层嵌套+内嵌taskpool printArgs1验证count=10 |
| 42 | AsynclockSameTest4200 | taskpool.execute(taskFunctionTest4200) | 3次execute | taskpool执行taskFunctionTest4200验证3次完成count=3 |
| 43 | AsynclockSameTest4300 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |
| 44 | AsynclockSameTest4400 | request('lock_1')x3/lockAsync/SHARED+EXCLUSIVE+SHARED | lock_1x3/10并发 | 三同名锁SHARED+EXCLUSIVE+SHARED嵌套+new Promise验证count=10 |
| 45 | AsynclockSameTest4500 | taskpool.execute(taskFunctionTest4500) | 3次execute | taskpool执行taskFunctionTest4500验证3次完成count=3 |
| 46 | AsynclockSameTest4600 | request('lock_1')x3/lockAsync/SHARED+SHARED+EXCLUSIVE | lock_1x3/10并发 | 三同名锁SHARED+SHARED+EXCLUSIVE嵌套+setTimeout验证count=10 |
| 47 | AsynclockSameTest4700 | taskpool.execute(taskFunctionTest4700) | 3次execute | taskpool执行taskFunctionTest4700验证3次完成count=3 |
| 48 | AsynclockSameTest4800 | request('lock_1')x3/lockAsync/SHARED+EXCLUSIVE+EXCLUSIVE | lock_1x3/10并发 | 三同名锁SHARED+EXCLUSIVE+EXCLUSIVE嵌套+内嵌worker验证count=10 returnCount=42 |
| 49 | AsynclockSameTest4900 | taskpool.execute(taskFunctionTest4900) | 3次execute | taskpool执行taskFunctionTest4900验证3次完成count=3 |

## 2. AsynclockSameAddTest.test.ets (32用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockSameAddTest0100 | request('lock_1')/lockAsync/EXCLUSIVE | lock_1/10并发 | 10次同名锁EXCLUSIVE串行try-catch内throw验证计数count=10 |
| 2 | AsynclockSameAddTest0300 | request('lock_1')/lockAsync/EXCLUSIVE | lock_1/10并发 | 10次同名锁EXCLUSIVE串行setTimeout resolve验证计数count=10 |
| 3 | AsynclockSameAddTest0500 | request('lock_1')/lockAsync/EXCLUSIVE | lock_1/10并发 | 10次同名锁EXCLUSIVE串行setTimeout reject验证计数count=10 |
| 4 | AsynclockSameAddTest0700 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=10 |
| 5 | AsynclockSameAddTest0800 | request('lock_1')/lockAsync/EXCLUSIVE | lock_1/10并发 | 10次同名锁EXCLUSIVE串行throw+reject验证count=10 errorCount=10 |
| 6 | AsynclockSameAddTest1000 | taskpool+onReceiveData(taskFunctionAddTest1000) | taskFunctionAddTest1010/3次execute | taskpool+onReceiveData回调验证3次完成count=3 |
| 7 | AsynclockSameAddTest1100 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE | lock_1x2/10并发 | 双同名锁EXCLUSIVE嵌套EXCLUSIVE+throw+reject验证count=10 errorCount=10 |
| 8 | AsynclockSameAddTest1300 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 9 | AsynclockSameAddTest1400 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE | lock_1x2/10并发 | 双同名锁EXCLUSIVE嵌套EXCLUSIVE+setTimeout resolve验证count=10 |
| 10 | AsynclockSameAddTest1600 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE+onEnqueued | lock_1x2/printArgs1 | onEnqueued回调内双同名锁EXCLUSIVE嵌套EXCLUSIVE验证count=1 onEnqueuedcount=1 |
| 11 | AsynclockSameAddTest1700 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE | lock_1x2/10并发 | 双同名锁EXCLUSIVE嵌套EXCLUSIVE+setTimeout reject验证count=10 |
| 12 | AsynclockSameAddTest1900 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 13 | AsynclockSameAddTest2000 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED | lock_1x2/10并发 | 同名锁EXCLUSIVE外层SHARED内层+throw+catch验证count=10 errorCount=10 |
| 14 | AsynclockSameAddTest2200 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED+onStartExecution | lock_1x2/printArgs1 | onStartExecution回调内EXCLUSIVE+SHARED+throw验证count=1 onStartExecutioncount=1 |
| 15 | AsynclockSameAddTest2300 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED | lock_1x2/10并发 | 同名锁EXCLUSIVE外层SHARED内层+new Promise count++验证count=10 |
| 16 | AsynclockSameAddTest2500 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED+taskpool.finally | lock_1x2/printArgs1 | taskpool.finally回调内EXCLUSIVE+SHARED验证count=1 |
| 17 | AsynclockSameAddTest2600 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED | lock_1x2/10并发 | 同名锁EXCLUSIVE外层SHARED内层+new Promise reject验证count=10 |
| 18 | AsynclockSameAddTest2800 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 19 | AsynclockSameAddTest2900 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE | lock_1x2/10并发/printArgs1 | 双同名锁EXCLUSIVE嵌套EXCLUSIVE+内嵌taskpool printArgs1验证count=10 |
| 20 | AsynclockSameAddTest3100 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 21 | AsynclockSameAddTest3200 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED | lock_1x2/10并发/printArgs1 | 同名锁EXCLUSIVE外层SHARED内层+内嵌taskpool printArgs1验证count=10 |
| 22 | AsynclockSameAddTest3400 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED+worker.onmessage | lock_1x2/Worker1/printArgs1 | worker onmessage回调内EXCLUSIVE+SHARED+内嵌printArgs1验证count=1 |
| 23 | AsynclockSameAddTest3500 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE | lock_1x2/10并发 | 双同名锁EXCLUSIVE嵌套EXCLUSIVE+内嵌worker(Worker1)验证count=10 returnCount=42 |
| 24 | AsynclockSameAddTest3700 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE+onExecutionSucceeded | lock_1x2/printArgs1/Worker1 | onExecutionSucceeded回调内EXCLUSIVE嵌套EXCLUSIVE+内嵌worker验证count=1 returnCount=42 |
| 25 | AsynclockSameAddTest3800 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED | lock_1x2/10并发 | 同名锁EXCLUSIVE外层SHARED内层+内嵌worker(Worker1)验证count=10 returnCount=42 |
| 26 | AsynclockSameAddTest4000 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证e.data=42 |
| 27 | AsynclockSameAddTest4100 | request('lock_1')x3/lockAsync/EXCLUSIVE+EXCLUSIVE+EXCLUSIVE | lock_1x3/10并发/printArgs1 | 三同名锁EXCLUSIVE三层嵌套+内嵌taskpool printArgs1验证count=10 |
| 28 | AsynclockSameAddTest4300 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 29 | AsynclockSameAddTest4400 | request('lock_1')x3/lockAsync/EXCLUSIVE+SHARED+EXCLUSIVE | lock_1x3/10并发 | 三同名锁EXCLUSIVE+SHARED+EXCLUSIVE嵌套+new Promise验证count=10 |
| 30 | AsynclockSameAddTest4600 | request('lock_1')x3/lockAsync/EXCLUSIVE+EXCLUSIVE+SHARED | lock_1x3/10并发 | 三同名锁EXCLUSIVE+EXCLUSIVE+SHARED嵌套+setTimeout验证count=10 |
| 31 | AsynclockSameAddTest4800 | request('lock_1')x3/lockAsync/EXCLUSIVE+EXCLUSIVE+SHARED+onExecutionFailed | lock_1x3/test(抛异常) | onExecutionFailed回调内EXCLUSIVE+EXCLUSIVE+SHARED验证count=1 onExecutionFailedcount=1 |
| 32 | AsynclockSameAddTest4900 | request('lock_1')x3/lockAsync/EXCLUSIVE+SHARED+SHARED | lock_1x3/10并发 | 三同名锁EXCLUSIVE+SHARED+SHARED嵌套+内嵌worker(Worker1)验证count=10 returnCount=42 |

## 3. AsynclockSameSecondTest.test.ets (7用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockSameTest5000 | taskpool+onReceiveData(taskFunctionTest5000) | taskFunctionTest5010/3次execute | taskpool+onReceiveData回调验证3次完成count=3 |
| 2 | AsynclockSameTest5100 | request('lock_1')x2/lockAsync/SHARED+EXCLUSIVE | lock_1x2/10并发 | 同名锁SHARED外层EXCLUSIVE内层+setTimeout(1000)resolve验证count=10 |
| 3 | AsynclockSameTest5200 | taskpool.execute(taskFunctionTest5200) | 3次execute | taskpool执行taskFunctionTest5200验证3次完成count=3 |
| 4 | AsynclockSameTest5300 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |
| 5 | AsynclockSameTest5400 | request('lock_1')x2/lockAsync/SHARED+SHARED | lock_1x2/10并发 | 双同名锁SHARED嵌套SHARED+setTimeout(1000)count++验证count=10 |
| 6 | AsynclockSameTest5500 | taskpool.execute(taskFunctionTest5500) | 3次execute | taskpool执行taskFunctionTest5500验证3次完成count=3 |
| 7 | AsynclockSameTest5600 | worker.ThreadWorker(Worker) | postMessage | worker内lockAsync验证count=1 |

## 4. AsynclockSameAddSecondTest.test.ets (5用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockSameAddTest5000 | taskpool.execute(taskFunctionTest5000) | 3次execute | taskpool执行taskFunctionTest5000验证3次完成count=3 |
| 2 | AsynclockSameAddTest5100 | request('lock_1')x2/lockAsync/EXCLUSIVE+EXCLUSIVE | lock_1x2/10并发 | 双同名锁EXCLUSIVE嵌套EXCLUSIVE+setTimeout(1000)resolve验证count=10 |
| 3 | AsynclockSameAddTest5300 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 4 | AsynclockSameAddTest5400 | request('lock_1')x2/lockAsync/EXCLUSIVE+SHARED | lock_1x2/10并发 | 同名锁EXCLUSIVE外层SHARED内层+setTimeout(1000)count++验证count=10 |
| 5 | AsynclockSameAddTest5600 | worker.ThreadWorker(Worker1) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |

## 5. AsynclockDifferentTest.test.ets (38用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockDifferentTest0100 | new AsyncLock()/lockAsync/SHARED | 10并发 | 10次异名锁SHARED并发try-catch内throw验证计数count=10 |
| 2 | AsynclockDifferentTest0200 | taskpool.execute(printArgs2) | 3次execute | taskpool执行printArgs2验证3次完成count=3 |
| 3 | AsynclockDifferentTest0300 | new AsyncLock()/lockAsync/SHARED | 10并发 | 10次异名锁SHARED并发setTimeout resolve验证计数count=10 |
| 4 | AsynclockDifferentTest0400 | taskpool.execute(printArgs4) | 3次execute | taskpool执行printArgs4验证3次完成count=3 |
| 5 | AsynclockDifferentTest0500 | new AsyncLock()/lockAsync/SHARED | 10并发 | 10次异名锁SHARED并发setTimeout reject验证计数count=10 |
| 6 | AsynclockDifferentTest0600 | taskpool.execute(printArgs1) | 3次execute | taskpool执行printArgs1验证3次完成count=3 |
| 7 | AsynclockDifferentTest0700 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=10 |
| 8 | AsynclockDifferentTest0800 | new AsyncLock()/lockAsync/SHARED | 10并发 | 10次异名锁SHARED并发throw+reject验证count=10 errorCount=10 |
| 9 | AsynclockDifferentTest0900 | taskpool.execute(printArgs9) | 3次execute | taskpool执行printArgs9验证3次完成count=3 |
| 10 | AsynclockDifferentTest1000 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 11 | AsynclockDifferentTest1100 | new AsyncLock()x2/lockAsync/SHARED+SHARED | 10并发 | 双异名锁SHARED嵌套SHARED+throw+reject验证count=10 errorCount=10 |
| 12 | AsynclockDifferentTest1200 | taskpool.execute(printArgs12) | 3次execute | taskpool执行printArgs12验证3次完成count=3 |
| 13 | AsynclockDifferentTest1300 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 14 | AsynclockDifferentTest1400 | new AsyncLock()x2/lockAsync/SHARED+SHARED | 10并发 | 双异名锁SHARED嵌套SHARED+setTimeout resolve验证count=10 |
| 15 | AsynclockDifferentTest1500 | taskpool.execute(printArgs15) | 3次execute | taskpool执行printArgs15验证3次完成count=3 |
| 16 | AsynclockDifferentTest1600 | new AsyncLock()x2/lockAsync/SHARED+SHARED | 10并发 | 双异名锁SHARED嵌套SHARED+setTimeout reject验证count=10 |
| 17 | AsynclockDifferentTest1700 | taskpool.execute(printArgs17) | 3次execute | taskpool执行printArgs17验证3次完成count=3 |
| 18 | AsynclockDifferentTest1800 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 19 | AsynclockDifferentTest1900 | new AsyncLock()x2/lockAsync/SHARED+EXCLUSIVE | 10并发 | 异名锁SHARED外层EXCLUSIVE内层+throw+reject验证count=10 errorCount=10 |
| 20 | AsynclockDifferentTest2000 | taskpool.execute(printArgs20) | 3次execute | taskpool执行printArgs20验证3次完成count=3 |
| 21 | AsynclockDifferentTest2100 | taskpool.execute(printArgs21)+onEnqueued | 3次execute | taskpool+onEnqueued回调验证3次完成count=3 |
| 22 | AsynclockDifferentTest2200 | new AsyncLock()x2/lockAsync/SHARED+EXCLUSIVE | 10并发 | 异名锁SHARED外层EXCLUSIVE内层+setTimeout resolve验证count=10 |
| 23 | AsynclockDifferentTest2300 | taskpool.execute(printArgs23) | 3次execute | taskpool执行printArgs23验证3次完成count=3 |
| 24 | AsynclockDifferentTest2400 | new AsyncLock()x2/lockAsync/SHARED+EXCLUSIVE | 10并发 | 异名锁SHARED外层EXCLUSIVE内层+setTimeout reject验证count=10 |
| 25 | AsynclockDifferentTest2500 | taskpool.execute(printArgs25) | 3次execute | taskpool执行printArgs25验证3次完成count=3 |
| 26 | AsynclockDifferentTest2600 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 27 | AsynclockDifferentTest2700 | new AsyncLock()x2/lockAsync/SHARED+SHARED | 10并发/printArgs1 | 双异名锁SHARED嵌套SHARED+内嵌taskpool printArgs1验证count=10 count1=10 |
| 28 | AsynclockDifferentTest2800 | taskpool.execute(testTask) | 3次execute | taskpool执行testTask验证3次完成count=3 |
| 29 | AsynclockDifferentTest2900 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 30 | AsynclockDifferentTest3000 | new AsyncLock()x2/lockAsync/SHARED+EXCLUSIVE | 10并发/printArgs1 | 异名锁SHARED外层EXCLUSIVE内层+内嵌taskpool printArgs1验证count=10 count1=10 |
| 31 | AsynclockDifferentTest3100 | taskpool.execute(testTask1) | 3次execute | taskpool执行testTask1验证3次完成count=3 |
| 32 | AsynclockDifferentTest3200 | new AsyncLock()x2/lockAsync/SHARED+EXCLUSIVE+onStartExecution | delay/printArgs1 | onStartExecution回调内SHARED+EXCLUSIVE+内嵌taskpool验证count=1 count1=1 |
| 33 | AsynclockDifferentTest3300 | request('lock1'/'lock2'/'lock3')/lockAsync/SHARED+SHARED+SHARED | 10并发/printArgs1 | 三异名锁SHARED三层嵌套+内嵌taskpool printArgs1验证count=10 count1=10 |
| 34 | AsynclockDifferentTest3400 | taskpool.execute(testTask2) | 3次execute | taskpool执行testTask2验证3次完成count=3 |
| 35 | AsynclockDifferentTest3500 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 36 | AsynclockDifferentTest3600 | request('lock1'/'lock2'/'lock3')/lockAsync/SHARED+EXCLUSIVE+SHARED | 10并发 | 三异名锁SHARED+EXCLUSIVE+SHARED嵌套+setTimeout resolve验证count=10 |
| 37 | AsynclockDifferentTest3700 | taskpool.execute(printArgs37) | 3次execute | taskpool执行printArgs37验证3次完成count=3 |
| 38 | AsynclockDifferentTest3800 | taskpool+onReceiveData(ConcurrentFunc) | 3次execute | taskpool ConcurrentFunc+onReceiveData回调验证count=3 count1=3 |

## 6. AsynclockDifferentSecondTest.test.ets (12用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockDifferentTest3900 | request('lock1'/'lock2'/'lock3')/lockAsync/SHARED+SHARED+EXCLUSIVE | 10并发 | 三异名锁SHARED+SHARED+EXCLUSIVE嵌套+setTimeout count++验证count=10 |
| 2 | AsynclockDifferentTest4000 | taskpool.execute(printArgs40) | 3次execute | taskpool执行printArgs40验证3次完成count=3 |
| 3 | AsynclockDifferentTest4100 | taskpool+onExecutionSucceeded(delay) | 3次execute | taskpool delay+onExecutionSucceeded回调验证count=3 count1=3 |
| 4 | AsynclockDifferentTest4200 | request('lock1'/'lock2'/'lock3')/lockAsync/SHARED+EXCLUSIVE+EXCLUSIVE | 10并发/Worker2 | 三异名锁SHARED+EXCLUSIVE+EXCLUSIVE嵌套+内嵌worker(Worker2)验证count=1 |
| 5 | AsynclockDifferentTest4300 | taskpool.execute(printArgs43) | 3次execute | taskpool执行printArgs43验证3次完成count=3 |
| 6 | AsynclockDifferentTest4400 | taskpool.execute(printArgs44)+finally | 3次execute | taskpool printArgs44+finally回调验证3次完成count=3 |
| 7 | AsynclockDifferentTest4500 | request('lock1'/'lock2')/lockAsync/SHARED+EXCLUSIVE+options(timeout=1000) | 11并发 | 异名锁SHARED+EXCLUSIVE+timeout选项+lock2超时catch验证count=10 |
| 8 | AsynclockDifferentTest4600 | taskpool.execute(printArgs46) | 3次execute | taskpool执行printArgs46验证3次完成count=3 |
| 9 | AsynclockDifferentTest4700 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |
| 10 | AsynclockDifferentTest4800 | request('lock1'/'lock2')/lockAsync/SHARED+SHARED+options(timeout=1000) | 10并发 | 异名锁SHARED+SHARED+timeout选项+setTimeout count++验证count=10 |
| 11 | AsynclockDifferentTest4900 | taskpool.execute(printArgs49) | 3次execute | taskpool执行printArgs49验证3次完成count=3 |
| 12 | AsynclockDifferentTest5000 | worker.ThreadWorker(Worker2) | postMessage | worker内lockAsync验证count=1 |

## 7. AsynclockDifferentThirdTest.test.ets (37用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockDifferentThirdTest0100 | new AsyncLock()/lockAsync/EXCLUSIVE | 10并发 | 10次异名锁EXCLUSIVE串行try-catch内throw验证计数count=10 |
| 2 | AsynclockDifferentThirdTest0200 | taskpool.execute(TaskFun2) | 3次execute | taskpool执行TaskFun2验证3次完成count=3 |
| 3 | AsynclockDifferentThirdTest0300 | new AsyncLock()/lockAsync/EXCLUSIVE | 10并发 | 10次异名锁EXCLUSIVE串行setTimeout resolve验证计数count=10 |
| 4 | AsynclockDifferentThirdTest0400 | taskpool.execute(TaskFun4) | 3次execute | taskpool执行TaskFun4验证3次完成count=3 |
| 5 | AsynclockDifferentThirdTest0500 | new AsyncLock()/lockAsync/EXCLUSIVE+onStartExecution | delay1 | onStartExecution回调内EXCLUSIVE+内嵌taskpool验证count=1 count1=1 |
| 6 | AsynclockDifferentThirdTest0600 | new AsyncLock()/lockAsync/EXCLUSIVE | 10并发 | 10次异名锁EXCLUSIVE串行setTimeout reject验证计数count=10 |
| 7 | AsynclockDifferentThirdTest0700 | taskpool.execute(TaskFun7) | 3次execute | taskpool执行TaskFun7验证3次完成count=3 |
| 8 | AsynclockDifferentThirdTest0800 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=10 |
| 9 | AsynclockDifferentThirdTest0900 | new AsyncLock()/lockAsync/EXCLUSIVE | 10并发 | 10次异名锁EXCLUSIVE串行throw+reject验证count=10 errorCount=10 |
| 10 | AsynclockDifferentThirdTest1000 | taskpool.execute(TaskFun10) | 3次execute | taskpool执行TaskFun10验证3次完成count=3 |
| 11 | AsynclockDifferentThirdTest1100 | new AsyncLock()x2/lockAsync/EXCLUSIVE+EXCLUSIVE | 10并发 | 双异名锁EXCLUSIVE嵌套EXCLUSIVE+throw+reject验证count=10 errorCount=10 |
| 12 | AsynclockDifferentThirdTest1200 | taskpool.execute(TaskFun12) | 3次execute | taskpool执行TaskFun12验证3次完成count=3 |
| 13 | AsynclockDifferentThirdTest1300 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 14 | AsynclockDifferentThirdTest1400 | new AsyncLock()x2/lockAsync/EXCLUSIVE+EXCLUSIVE | 10并发 | 双异名锁EXCLUSIVE嵌套EXCLUSIVE+setTimeout resolve验证count=10 |
| 15 | AsynclockDifferentThirdTest1500 | taskpool.execute(TaskFun15) | 3次execute | taskpool执行TaskFun15验证3次完成count=3 |
| 16 | AsynclockDifferentThirdTest1600 | taskpool.execute(TaskFun16)+finally | 3次execute | taskpool TaskFun16+finally回调验证3次完成count=3 |
| 17 | AsynclockDifferentThirdTest1700 | new AsyncLock()x2/lockAsync/EXCLUSIVE+EXCLUSIVE | 10并发 | 双异名锁EXCLUSIVE嵌套EXCLUSIVE+setTimeout reject验证count=10 |
| 18 | AsynclockDifferentThirdTest1800 | taskpool.execute(TaskFun18) | 3次execute | taskpool执行TaskFun18验证3次完成count=3 |
| 19 | AsynclockDifferentThirdTest1900 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 20 | AsynclockDifferentThirdTest2000 | new AsyncLock()x2/lockAsync/EXCLUSIVE+SHARED | 10并发 | 异名锁EXCLUSIVE外层SHARED内层+throw+reject验证count=10 errorCount=10 |
| 21 | AsynclockDifferentThirdTest2100 | taskpool.execute(TaskFun21) | 3次execute | taskpool执行TaskFun21验证3次完成count=3 |
| 22 | AsynclockDifferentThirdTest2200 | taskpool.execute(TaskFun22)+onEnqueued | 3次execute | taskpool TaskFun22+onEnqueued回调验证3次完成count=3 |
| 23 | AsynclockDifferentThirdTest2300 | new AsyncLock()x2/lockAsync/EXCLUSIVE+SHARED | 10并发 | 异名锁EXCLUSIVE外层SHARED内层+setTimeout resolve验证count=10 |
| 24 | AsynclockDifferentThirdTest2400 | taskpool.execute(TaskFun24) | 3次execute | taskpool执行TaskFun24验证3次完成count=3 |
| 25 | AsynclockDifferentThirdTest2500 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 26 | AsynclockDifferentThirdTest2600 | new AsyncLock()x2/lockAsync/EXCLUSIVE+SHARED | 10并发 | 异名锁EXCLUSIVE外层SHARED内层+setTimeout reject验证count=10 |
| 27 | AsynclockDifferentThirdTest2700 | taskpool.execute(TaskFun27) | 3次execute | taskpool执行TaskFun27验证3次完成count=3 |
| 28 | AsynclockDifferentThirdTest2800 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 29 | AsynclockDifferentThirdTest2900 | new AsyncLock()x2/lockAsync/EXCLUSIVE+EXCLUSIVE | 10并发/TaskFun1 | 双异名锁EXCLUSIVE嵌套EXCLUSIVE+内嵌taskpool TaskFun1验证count=10 count1=10 |
| 30 | AsynclockDifferentThirdTest3000 | taskpool.execute(TaskTest) | 3次execute | taskpool执行TaskTest验证3次完成count=3 |
| 31 | AsynclockDifferentThirdTest3100 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 32 | AsynclockDifferentThirdTest3200 | new AsyncLock()x2/lockAsync/EXCLUSIVE+SHARED | 10并发/TaskFun1 | 异名锁EXCLUSIVE外层SHARED内层+内嵌taskpool TaskFun1验证count=10 count1=10 |
| 33 | AsynclockDifferentThirdTest3300 | taskpool.execute(TaskTest1) | 3次execute | taskpool执行TaskTest1验证3次完成count=3 |
| 34 | AsynclockDifferentThirdTest3400 | taskpool+onExecutionSucceeded(delay) | 3次execute | taskpool delay+onExecutionSucceeded回调验证count=3 count1=3 |
| 35 | AsynclockDifferentThirdTest3500 | request('lock1'/'lock2'/'lock3')/lockAsync/EXCLUSIVE+EXCLUSIVE+EXCLUSIVE | 10并发/printArgs1 | 三异名锁EXCLUSIVE三层嵌套+内嵌taskpool printArgs1验证count=10 count1=10 |
| 36 | AsynclockDifferentThirdTest3600 | taskpool.execute(TaskTest2) | 3次execute | taskpool执行TaskTest2验证3次完成count=3 |
| 37 | AsynclockDifferentThirdTest3700 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |

## 8. AsynclockDifferentForthTest.test.ets (13用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|---|---|---|---|---|
| 1 | AsynclockDifferentThirdTest3800 | request('lock1'/'lock2'/'lock3')/lockAsync/EXCLUSIVE+SHARED+EXCLUSIVE | 10并发 | 三异名锁EXCLUSIVE+SHARED+EXCLUSIVE嵌套+setTimeout resolve验证count=10 |
| 2 | AsynclockDifferentThirdTest3900 | taskpool.execute(TaskFun39) | 3次execute | taskpool执行TaskFun39验证3次完成count=3 |
| 3 | AsynclockDifferentThirdTest4000 | taskpool+onReceiveData(ConcurrentFunc1) | 3次execute | taskpool ConcurrentFunc1+onReceiveData回调验证count=3 count1=3 |
| 4 | AsynclockDifferentThirdTest4100 | request('lock1'/'lock2'/'lock3')/lockAsync/EXCLUSIVE+EXCLUSIVE+SHARED | 10并发 | 三异名锁EXCLUSIVE+EXCLUSIVE+SHARED嵌套+setTimeout count++验证count=10 |
| 5 | AsynclockDifferentThirdTest4200 | taskpool.execute(TaskFun42) | 3次execute | taskpool执行TaskFun42验证3次完成count=3 |
| 6 | AsynclockDifferentThirdTest4300 | request('lock1'/'lock2'/'lock3')/lockAsync/SHARED+EXCLUSIVE+EXCLUSIVE | 10并发/Worker3 | 三异名锁SHARED+EXCLUSIVE+EXCLUSIVE嵌套+内嵌worker(Worker3)验证count=1 |
| 7 | AsynclockDifferentThirdTest4400 | taskpool.execute(TaskFun44) | 3次execute | taskpool执行TaskFun44验证3次完成count=3 |
| 8 | AsynclockDifferentThirdTest4500 | request('lock1'/'lock2')/lockAsync/EXCLUSIVE+SHARED+options(timeout=1000) | 10并发/TaskFun1 | 异名锁EXCLUSIVE+SHARED+timeout选项+内嵌taskpool TaskFun1验证count=10 |
| 9 | AsynclockDifferentThirdTest4600 | taskpool.execute(TaskFun46) | 3次execute | taskpool执行TaskFun46验证3次完成count=3 |
| 10 | AsynclockDifferentThirdTest4700 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |
| 11 | AsynclockDifferentThirdTest4800 | request('lock1'/'lock2')/lockAsync/EXCLUSIVE+EXCLUSIVE+options(timeout=1000) | 10并发 | 异名锁EXCLUSIVE+EXCLUSIVE+timeout选项+setTimeout count++验证count=10 |
| 12 | AsynclockDifferentThirdTest4900 | taskpool.execute(TaskFun49) | 3次execute | taskpool执行TaskFun49验证3次完成count=3 |
| 13 | AsynclockDifferentThirdTest5000 | worker.ThreadWorker(Worker3) | postMessage | worker内lockAsync EXCLUSIVE验证count=1 |

---

**合计：49 + 32 + 7 + 5 + 38 + 12 + 37 + 13 = 193用例**
# AsyncLock 其它6文件 去重后测试点（5列简表）

## 工程信息
- **工程路径**: `ArkTSUtils_AsyncLock/entry/src/ohosTest/ets/test/`
- **用例总数**: 91
- **测试文件数**: 6
- **节号**: 9-14

---

## 9. AsyncLockConcurrencyBaseTest.test.ets (5用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|------|------|-----|---------|------|
| 1 | setDelayRequestAndCloseWorkerInstantlyTest | lockAsync (concurrency) | worker延迟request+立即关闭worker | 关闭worker瞬间跳过worker中的request，主线程request被执行 |
| 2 | gcAfterLockAsyncTest0 | GC | lockAsync后立即触发GC | lockAsync后立即触发GC验证锁状态正确 |
| 3 | timeoutLockWithEnvDestroyedTest | options timeout / env destroyed | shared lock timeout+环境销毁 | timeout回调与环境销毁正确处理（二次退出shared lock） |
| 4 | pendingSharedRequestAfterGC | GC / shared lock | shared lock pending+GC | GC后shared lock的pending request销毁验证 |
| 5 | checkDeadlock | lockAsync deadlock | 死锁场景 | 死锁检测验证 |

---

## 10. AsyncLocktest.test.ets (5用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|------|------|-----|---------|------|
| 1 | AsyncLocktest0100 | query (错误码10200030) | request("queryTestLock")+query('1') | query不存在的锁名'1'抛10200030 |
| 2 | AsyncLocktest0200 | lockAsync (错误码401) | new AsyncLock()+lockAsync(callback,123) | lockAsync mode传123非有效mode抛401 |
| 3 | AsyncLocktest0300 | lockAsync mode (错误码401) | new AsyncLock()+lockAsync(callback,-1) | lockAsync mode传-1抛401 |
| 4 | AsyncLocktest0400 | lockAsync mode (错误码401) | new AsyncLock()+AsyncLockOptions+lockAsync(callback,999,options) | lockAsync mode传999抛401 |
| 5 | AsyncLocktest0500 | lockAsync timeout (错误码10200031) | new AsyncLock()+options.timeout=1000+2个EXCLUSIVE | operation1占锁3s，operation2超时抛10200031 |

---

## 11. ConcurrentAsyncLockTest.test.ets (9用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|------|------|-----|---------|------|
| 1 | test_concurrent_asynclock_001 | constructor | concurrentNum=100+100次taskpool.execute | 100并发AsyncLock constructor返回1 |
| 2 | test_concurrent_asynclock_002 | request | concurrentNum=100+100次taskpool.execute | 100并发request返回'request_success' |
| 3 | test_concurrent_asynclock_003 | query | concurrentNum=100+100次taskpool.execute | 100并发query返回true |
| 4 | test_concurrent_asynclock_004 | queryAll | concurrentNum=100+100次taskpool.execute | 100并发queryAll返回true |
| 5 | test_concurrent_asynclock_005 | lockAsync | concurrentNum=100+100次taskpool.execute | 100并发lockAsync基础返回100 |
| 6 | test_concurrent_asynclock_006 | lockAsync mode | concurrentNum=100+100次taskpool.execute | 100并发lockAsync EXCLUSIVE mode返回'exclusive_mode_success' |
| 7 | test_concurrent_asynclock_007 | lockAsync timeout | concurrentNum=100+100次taskpool.execute | 100并发lockAsync timeout返回'timeout_success' |
| 8 | test_concurrent_asynclock_008 | lockAsync concurrent | concurrentNum=100+100次taskpool.execute | 100并发lockAsync并发访问返回100 |
| 9 | test_concurrent_asynclock_009 | lockAsync error | concurrentNum=100+100次taskpool.execute | 100并发lockAsync错误处理返回'error_handled' |

---

## 12. ConcurrencyModularImportAsyncLockTest.test.ets (16用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|------|------|-----|---------|------|
| 1 | ConcurrencyModularImportAsyncLockTest0100 | lockAsync SHARED (跨模块import) | 跨模块lock+taskpool task | 跨模块lock SHARED内taskpool.execute(task)执行失败 |
| 2 | ConcurrencyModularImportAsyncLockTest0200 | lockAsync SHARED (跨模块import) | 跨模块lock1+taskpool task | 跨模块lock1 SHARED内taskpool.execute(task)执行失败 |
| 3 | ConcurrencyModularImportAsyncLockTest0300 | lockAsync SHARED (跨模块import) | 跨模块lock+taskpool task+workerlock | 跨模块lock SHARED内task执行失败后调用workerlock |
| 4 | ConcurrencyModularImportAsyncLockTest0400 | lockAsync EXCLUSIVE (跨模块import) | 跨模块lock+taskpool task+workerlock | 跨模块lock EXCLUSIVE内task执行失败后调用workerlock |
| 5 | ConcurrencyModularImportAsyncLockTest0500 | lockAsync SHARED (跨模块import) | taskpool.execute(printArgsshared)+lock SHARED+task | 先taskpool执行printArgsshared再lock SHARED内执行task |
| 6 | ConcurrencyModularImportAsyncLockTest0600 | lockAsync (跨模块import/worker) | WorkerModularImport postMessage(4) | worker postMessage(4)跨模块lock返回true |
| 7 | ConcurrencyModularImportAsyncLockTest0700 | lockAsync (跨模块import/worker) | WorkerModularImport postMessage(5) | worker postMessage(5)跨模块lock返回count===5 |
| 8 | ConcurrencyModularImportAsyncLockTest0800 | lockAsync (跨模块import) | 跨模块tasklock2() | 跨模块tasklock2()执行后count===2 |
| 9 | ConcurrencyModularImportAsyncLockTest0900 | lockAsync SHARED (跨模块import) | 跨模块lock+timelock(100) | 跨模块lock SHARED内timelock(100)返回true |
| 10 | ConcurrencyModularImportAsyncLockTest1100 | lockAsync SHARED (跨模块import) | 跨模块lock+timelock2(100) | 跨模块lock SHARED内timelock2(100)返回true |
| 11 | ConcurrencyModularImportAsyncLockTest1200 | lockAsync (跨模块import/worker) | WorkerModularImport postMessage(6) | worker postMessage(6)跨模块lock返回true |
| 12 | ConcurrencyModularImportAsyncLockTest1300 | lockAsync (跨模块import/worker) | WorkerModularImport postMessage(7) | worker postMessage(7)跨模块lock返回true |
| 13 | ConcurrencyModularImportAsyncLockTest1400 | lockAsync (跨模块import/worker) | WorkerModularImport postMessage(8) | worker postMessage(8)跨模块lock返回true |
| 14 | ConcurrencyModularImportAsyncLockTest1600 | lockAsync (跨模块import/worker) | WorkerModularImport postMessage(9) | worker postMessage(9)跨模块lock返回count===42 |
| 15 | ConcurrencyModularImportAsyncLockTest1700 | lockAsync SHARED (跨模块import) | 跨模块lock+workerlockexclusive | 跨模块lock SHARED内workerlockexclusive返回true |
| 16 | ConcurrencyModularImportAsyncLockTest1800 | lockAsync SHARED (跨模块import) | 跨模块lock+tasklockexclusive | 跨模块lock SHARED内tasklockexclusive返回true |

---

## 13. AsyncLockArkTSUtilsSubset.test.ets (52用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|------|------|-----|---------|------|
| 1 | testTaskLocksQueryAll0001 | queryAll | 无锁 | queryAll()无锁时length===0 |
| 2 | testTaskLocksQueryAll0002 | queryAll | 无锁 | queryAll()返回Array |
| 3 | testTaskLocksQueryAll0003 | queryAll | request("name1"/"name2"/"name3") | queryAll()3锁length===3 |
| 4 | testTaskLocksConstructor0001 | constructor new | new AsyncLock() | new AsyncLock() instanceof验证 |
| 5 | testTaskLocksQuery0001 | query (错误) | query("")未创建 | query("")未创建锁抛错 |
| 6 | testTaskLocksQuery0005 | query (错误) | query("name")未创建 | query("name")未创建锁抛错 |
| 7 | testTaskLocksRequest0001 | request | request("") | request("")name==="" |
| 8 | testTaskLocksRequest0002 | request | request("")重复 | request("")重复name==="" |
| 9 | testTaskLocksRequest0003 | request | request("name") | request("name")name==="name" |
| 10 | testTaskLocksRequest0004 | request | request("name")重复 | request("name")重复name==="name" |
| 11 | testTaskLocksRequest0005 | request | request("name")+request("Name") | request("Name")不同名name==="Name" |
| 12 | testTaskLocksQuery0002 | query | request("")+query("") | query("")已创建held/pending是Array |
| 13 | testTaskLocksQuery0003 | query | request("name")+query("name") | query("name")已创建held/pending是Array |
| 14 | testTaskLocksQuery0004 | query (错误) | request("name")+query("NAme") | query("NAme")不存在抛错 |
| 15 | testLockAsync0001 | lockAsync (错误) | new AsyncLock()+query(lock.name)+lockAsync SHARED | new实例lockAsync SHARED抛错（锁未通过request创建） |
| 16 | testLockAsync0006 | lockAsync/options | options isAvailable=false,signal=null,timeout=0+EXCLUSIVE then SHARED | EXCLUSIVE后SHARED result==='AB' |
| 17 | testLockAsync0007 | lockAsync/options isAvailable | options isAvailable=true+EXCLUSIVE then EXCLUSIVE | EXCLUSIVE后EXCLUSIVE(isAvailable=true)抛错 |
| 18 | testLockAsync0008 | lockAsync/options signal | options signal aborted=true+2个SHARED | signal aborted=true两SHARED result===''（中止） |
| 19 | testLockAsync0009 | lockAsync/options signal | options signal aborted=false+2个SHARED | signal aborted=false两SHARED result==='AB' |
| 20 | testLockAsync0010 | lockAsync/options signal | options signal aborted=true+await EXCLUSIVE | signal aborted=true await EXCLUSIVE抛错 |
| 21 | testLockAsync0011 | lockAsync/options timeout | options timeout=1000+await EXCLUSIVE | timeout=1000 await EXCLUSIVE result==='A' |
| 22 | testLockAsync0012 | lockAsync/options timeout | options timeout=1000+EXCLUSIVE then SHARED | EXCLUSIVE占锁后SHARED超时抛错 |
| 23 | testLockAsync0017 | lockAsync SHARED (taskpool) | 2个taskpool sharedTaskTask | 2个SHARED taskpool任务时间重叠(task1_start<task2_start<=task1_end<task2_end) |
| 24 | testLockAsync0018 | lockAsync mode (taskpool) | sharedTimeTask then exclusiveTimeTask | SHARED后EXCLUSIVE B-A>=200 |
| 25 | testLockAsync0019 | lockAsync mode (taskpool) | exclusiveTimeTask then sharedTimeTask | EXCLUSIVE后SHARED B-A>=500 |
| 26 | testLockAsync0020 | lockAsync EXCLUSIVE (taskpool) | 2个exclusiveTask | 2个EXCLUSIVE taskpool任务result==='AB' |
| 27 | testLockAsync0021 | lockAsync SHARED (taskpool) | request(TAG)+2个locksTimeTask SHARED | 2个SHARED taskpool任务时间重叠 |
| 28 | testLockAsync0022 | lockAsync mode (taskpool) | request(TAG)+locksTask SHARED then EXCLUSIVE | SHARED then EXCLUSIVE result==='A'（EXCLUSIVE pending） |
| 29 | testLockAsync0023 | lockAsync mode (taskpool) | request(TAG)+locksTask EXCLUSIVE then SHARED | EXCLUSIVE then SHARED result==='BA' |
| 30 | testLockAsync0024 | lockAsync EXCLUSIVE (taskpool) | request(TAG)+2个lockExclusiveTask | 2个EXCLUSIVE taskpool任务result==='AB' |
| 31 | testAsyncLockMode0001 | mode SHARED | new AsyncLock+2个SHARED | 2个SHARED lockAsync result==='AB' |
| 32 | testAsyncLockMode0002 | mode SHARED/EXCLUSIVE | request("exclusive0")+SHARED then EXCLUSIVE | SHARED then EXCLUSIVE result==='AB' |
| 33 | testAsyncLockOptions0001 | options | new AsyncLockOptions | AsyncLockOptions默认值(isAvailable=false,signal=null,timeout=0) |
| 34 | testAsyncLockOptions0002 | options isAvailable | options isAvailable=true+2个SHARED | isAvailable=true 2个SHARED lockAsync |
| 35 | testAsyncLockOptions0003 | options isAvailable | options isAvailable=false+SHARED | isAvailable=false SHARED lockAsync |
| 36 | testAsyncLockOptions0004 | options signal | options signal=null+SHARED | signal=null SHARED lockAsync |
| 37 | testAsyncLockOptions0005 | options signal | options signal aborted=true+SHARED | signal aborted=true SHARED lockAsync |
| 38 | testAsyncLockOptions0006 | options signal | options signal aborted=false+SHARED | signal aborted=false SHARED lockAsync |
| 39 | testAsyncLockOptions0007 | options timeout | options timeout=0+SHARED | timeout=0 SHARED lockAsync |
| 40 | testAsyncLockOptions0008 | options timeout | options timeout=1000+SHARED | timeout=1000 SHARED lockAsync |
| 41 | testAsyncLockState0001 | state held | request(TAG)+lockAsync+query | query held含name |
| 42 | testAsyncLockState0002 | state held/mode | request(TAG)+lockAsync SHARED+query | query held mode==SHARED |
| 43 | testAsyncLockState0003 | state held/mode | request(TAG)+lockAsync EXCLUSIVE+query | query held mode==EXCLUSIVE |
| 44 | testAsyncLockState0004 | state held/contextId | request(TAG)+lockAsync EXCLUSIVE+query | query held contextId isFinite |
| 45 | testAsyncLockState0005 | state pending | request(TAG)+EXCLUSIVE+SHARED+query | query pending含name |
| 46 | testAsyncLockState0006 | state pending/mode | request(TAG)+EXCLUSIVE+SHARED+query | query pending mode==SHARED |
| 47 | testAsyncLockState0007 | state pending/mode | request(TAG)+EXCLUSIVE+EXCLUSIVE+query | query pending mode==EXCLUSIVE |
| 48 | testAsyncLockState0008 | state pending/contextId | request(TAG)+EXCLUSIVE+EXCLUSIVE+query | query pending contextId isFinite |
| 49 | testAsyncLockParseOptions0001 | parseOptions (ASON) | BigIntMode.DEFAULT+parse('{"largeNumber":112233445566778899n}') | ASON.parse BigIntMode.DEFAULT抛错 |
| 50 | testAsyncLockParseOptions0002 | parseOptions (ASON) | BigIntMode.PARSE_AS_BIGINT+parse('9007199254740992') | ASON.parse返回bigint |
| 51 | testAsyncLockParseOptions0003 | parseOptions (ASON) | BigIntMode.ALWAYS_PARSE_AS_BIGINT+parse('1') | ASON.parse返回bigint |
| 52 | testAsyncLockParseOptions0004 | parseOptions (ASON) | BigIntMode.DEFAULT+parse('1') | ASON.parse返回object isSendable |

---

## 14. AsyncLockUtilsCoverageSubset.test.ets (4用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
|------|------|-----|---------|------|
| 1 | asyncLockQueryPropertyValidation001 | query/state | request("testLockQuery")+query | query held/pending length===0 |
| 2 | asyncLockLockAsyncReturnValidation001 | lockAsync返回值 | new AsyncLock()+lockAsync | lockAsync返回string/number/boolean/object验证 |
| 3 | asyncLockRequestEmptyString001 | request | request("") | request("")name==="" instanceof验证 |
| 4 | asyncLockQueryEmptyString001 | query/state | request("")+query("") | query("")held/pending length===0且是Array |

---

## 合计
- 节9: 5用例
- 节10: 5用例
- 节11: 9用例
- 节12: 16用例
- 节13: 52用例
- 节14: 4用例
- **总计: 91用例**
