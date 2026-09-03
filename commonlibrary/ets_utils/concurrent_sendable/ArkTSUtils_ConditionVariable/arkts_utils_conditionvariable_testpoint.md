# ArkTSUtils.locks.ConditionVariable 最终测试点报告

## 文件清单
| # | 文件 | 活跃用例 | 注释用例 | 总计 |
| --- | --- | --- | --- | --- |
| 1 | ConditionVariableWait.test.ets | 5 | 0 | 5 |
| 2 | ConditionVariableWaitFor.test.ets | 10 | 0 | 10 |
| 3 | ConditionVariableNotify.test.ets | 22 | 0 | 22 |
| 4 | ConditionVariableNotifyOne.test.ets | 26 | 0 | 26 |
| 5 | ConditionVariableConcurrent.test.ets | 14 | 0 | 14 |
| **合计** | **5个文件** | **77** | **0** | **77** |

---

## 1. ConditionVariableWait.test.ets (5用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | ActsLocksTestConditionVariableWait001 | new ConditionVariable()/wait() | new CV() | 主线程直接调用wait()阻塞，期望不抛异常 |
| 2 | ActsLocksTestConditionVariableWait002 | new ConditionVariable()/wait() | new CV()+threadWaitNotAwait | TaskPool线程中调用wait()阻塞，期望返回true |
| 3 | ActsLocksTestConditionVariableWait003 | ConditionVariable.request()/wait() | request('Test') | 主线程直接调用wait()阻塞，期望不抛异常 |
| 4 | ActsLocksTestConditionVariableWait004 | ConditionVariable.request()/wait() | request('Test')+threadWaitNotAwait | TaskPool线程中调用wait()阻塞，期望返回true |
| 5 | ActsLocksTestConditionVariableRecursive001 | ConditionVariable.request()/wait()/notifyAll() | request(CASE) | 嵌套递归调用wait()×3配合setInterval周期notifyAll()唤醒，期望count=3 |

---

## 2. ConditionVariableWaitFor.test.ets (10用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | ActsLocksTestConditionVariableWaitFor0100 | new ConditionVariable()/waitFor() | new CV()+waitTime=500 | 主线程直接调用waitFor(500)超时等待，期望不抛异常 |
| 2 | ActsLocksTestConditionVariableWaitFor0200 | new ConditionVariable()/waitFor() | new CV()+ThreadWorker(workerWaitFor)+sleepTime=5000 | ThreadWorker线程中调用waitFor()，5s后期望返回true |
| 3 | ActsLocksTestConditionVariableWaitFor0300 | new ConditionVariable()/waitFor() | new CV()+taskpool(threadWaitFor)+waitTime=0 | TaskPool线程中调用waitFor(0)，期望返回true |
| 4 | ActsLocksTestConditionVariableWaitFor0400 | new ConditionVariable()/waitFor() | new CV()+taskpool(threadWaitFor)+waitTime=-1 | TaskPool线程中调用waitFor(-1)，期望返回true |
| 5 | ActsLocksTestConditionVariableWaitFor0500 | new ConditionVariable()/waitFor() | new CV()+ThreadWorker(workerWaitFor)+sleepTime=5000 | ThreadWorker中调用waitFor()，期望执行时间>=3000ms |
| 6 | ActsLocksTestConditionVariableWaitFor0600 | ConditionVariable.request()/waitFor() | request('Test')+waitTime=500 | 主线程直接调用waitFor(500)，期望不抛异常 |
| 7 | ActsLocksTestConditionVariableWaitFor0700 | ConditionVariable.request()/waitFor() | request('Test')+ThreadWorker(workerWaitFor)+sleepTime=5000 | ThreadWorker线程中调用waitFor()，5s后期望返回true |
| 8 | ActsLocksTestConditionVariableWaitFor0800 | ConditionVariable.request()/waitFor() | request('Test')+taskpool(threadWaitFor)+waitTime=0 | TaskPool线程中调用waitFor(0)，期望返回true |
| 9 | ActsLocksTestConditionVariableWaitFor0900 | ConditionVariable.request()/waitFor() | request('Test')+taskpool(threadWaitFor)+waitTime=-1 | TaskPool线程中调用waitFor(-1)，期望返回true |
| 10 | ActsLocksTestConditionVariableWaitFor1100 | ConditionVariable.request()/waitFor() | request('Test')+ThreadWorker(workerWaitFor)+sleepTime=5000 | ThreadWorker中调用waitFor()，期望执行时间>=3000ms |

---

## 3. ConditionVariableNotify.test.ets (22用例)

> 注：本文件threadNotify/workerNotify实际调用notifyAll()。

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | ActsLocksTestConditionVariableNotify001 | new ConditionVariable()/notifyAll() | new CV() | 主线程直接调用notifyAll()，期望不抛异常 |
| 2 | ActsLocksTestConditionVariableNotify002 | new ConditionVariable()/notifyAll() | new CV()+taskpool(threadNotify) | TaskPool线程中调用notifyAll()，期望返回true |
| 3 | ActsLocksTestConditionVariableNotify003 | new ConditionVariable()/wait()/notifyAll() | new CV()+workerWait+workerNotify | 1个wait线程+1个notifyAll线程，notifyAll唤醒wait，期望result=true |
| 4 | ActsLocksTestConditionVariableNotify004 | new ConditionVariable()/wait()/notifyAll() | new CV()+2×workerWait+workerNotify | 2个wait线程+1个notifyAll，notifyAll唤醒所有wait，期望两个result都true |
| 5 | ActsLocksTestConditionVariableNotify005 | new ConditionVariable()/waitFor()/notifyAll() | new CV()+taskpool(threadWaitFor,1000)+sleep(500)+taskpool(threadNotify) | waitFor(1000)在500ms时被notifyAll唤醒，期望result=true |
| 6 | ActsLocksTestConditionVariableNotify006 | new ConditionVariable()/waitFor()/notifyAll() | new CV()+taskpool(threadWaitFor,500)+sleep(1000)+taskpool(threadNotify)+sleepTime=2000 | waitFor(500)超时(1000ms)后再notifyAll，期望resultWaitFor和resultNotify都true |
| 7 | ActsLocksTestConditionVariableNotify007 | new ConditionVariable()/waitFor()/notifyAll() | new CV()+taskpool(threadWaitFor,0)+sleep(1000)+taskpool(threadNotify)+sleepTime=2000 | waitFor(0)超时(1000ms)后再notifyAll，期望resultWaitFor和resultNotify都true |
| 8 | ActsLocksTestConditionVariableNotify008 | new ConditionVariable()/wait()/waitFor()/notifyAll() | new CV()+workerWait+workerWaitFor+workerNotify | wait+waitFor混合+notifyAll，期望两个result都true |
| 9 | ActsLocksTestConditionVariableNotify009 | new ConditionVariable()/wait()/notifyAll() | new CV()+2×taskpool(threadWait)+2×taskpool(threadNotify) | 2个wait+2个notifyAll，期望两个result都true |
| 10 | ActsLocksTestConditionVariableNotify010 | new ConditionVariable()/wait()/notifyAll() | new CV()+workerWait1+workerNotify1+workerWait2+workerNotify2 | 2组重叠wait+notifyAll，期望两个result都true |
| 11 | ActsLocksTestConditionVariableNotify011 | new ConditionVariable()/wait()/waitFor()/notifyAll() | new CV()+2×workerWait+taskpool(threadWaitFor,0)+taskpool(threadWait,3000)+workerNotify | 4线程混合(2 wait worker+2 taskpool)+notifyAll，期望4个result都true且执行时间<1000ms |
| 12 | ActsLocksTestConditionVariableNotify012 | ConditionVariable.request()/notifyAll() | request('Test') | 主线程直接调用notifyAll()，期望不抛异常 |
| 13 | ActsLocksTestConditionVariableNotify013 | ConditionVariable.request()/notifyAll() | request('Test')+taskpool(threadNotify) | TaskPool线程中调用notifyAll()，期望返回true |
| 14 | ActsLocksTestConditionVariableNotify014 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+workerWait+workerNotify | 1个wait+1个notifyAll，notifyAll唤醒wait，期望result=true |
| 15 | ActsLocksTestConditionVariableNotify015 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+2×workerWait+workerNotify | 2个wait+1个notifyAll，notifyAll唤醒所有wait，期望两个result都true |
| 16 | ActsLocksTestConditionVariableNotify016 | ConditionVariable.request()/waitFor()/notifyAll() | request('Test')+taskpool(threadWaitFor,1000)+sleep(500)+taskpool(threadNotify) | waitFor(1000)在500ms被notifyAll唤醒，期望result=true |
| 17 | ActsLocksTestConditionVariableNotify017 | ConditionVariable.request()/waitFor()/notifyAll() | request('Test')+taskpool(threadWaitFor,500)+sleep(1000)+taskpool(threadNotify)+sleepTime=2000 | waitFor(500)超时(1000ms)后再notifyAll，期望resultWaitFor和resultNotify都true |
| 18 | ActsLocksTestConditionVariableNotify018 | ConditionVariable.request()/waitFor()/notifyAll() | request('Test')+taskpool(threadWaitFor,0)+sleep(1000)+taskpool(threadNotify)+sleepTime=2000 | waitFor(0)超时(1000ms)后再notifyAll，期望resultWaitFor和resultNotify都true |
| 19 | ActsLocksTestConditionVariableNotify019 | ConditionVariable.request()/wait()/waitFor()/notifyAll() | request('Test')+workerWait+workerWaitFor+workerNotify | wait+waitFor混合+notifyAll，期望两个result都true |
| 20 | ActsLocksTestConditionVariableNotify020 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+2×taskpool(threadWait)+2×taskpool(threadNotify) | 2个wait+2个notifyAll，期望两个result都true |
| 21 | ActsLocksTestConditionVariableNotify021 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+workerWait1+workerNotify1+workerWait2+workerNotify2 | 2组重叠wait+notifyAll，期望两个result都true |
| 22 | ActsLocksTestConditionVariableNotify022 | ConditionVariable.request()/wait()/waitFor()/notifyAll() | request('Test')+2×workerWait+taskpool(threadWaitFor,0)+taskpool(threadWait,3000)+workerNotify | 4线程混合+notifyAll，期望4个result都true且执行时间<1000ms |

---

## 4. ConditionVariableNotifyOne.test.ets (26用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | ActsLocksTestConditionVariableNotifyOne001 | new ConditionVariable()/notifyOne() | new CV() | 主线程直接调用notifyOne()，期望不抛异常 |
| 2 | ActsLocksTestConditionVariableNotifyOne002 | new ConditionVariable()/notifyOne() | new CV()+taskpool(threadNotifyOne) | TaskPool线程中调用notifyOne()，期望不抛异常 |
| 3 | ActsLocksTestConditionVariableNotifyOne003 | new ConditionVariable()/wait()/notifyOne() | new CV()+workerWait+workerNotifyOne | 1个wait+1个notifyOne，notifyOne唤醒wait，期望result=true |
| 4 | ActsLocksTestConditionVariableNotifyOne004 | new ConditionVariable()/wait()/notifyOne() | new CV()+2×workerWait+workerNotifyOne | 2个wait+1个notifyOne，notifyOne只唤醒1个，期望resultThread1且!resultThread2 |
| 5 | ActsLocksTestConditionVariableNotifyOne005 | new ConditionVariable()/waitFor()/notifyOne() | new CV()+taskpool(threadWaitFor,1000)+sleep(500)+taskpool(threadNotifyOne) | waitFor(1000)在500ms被notifyOne唤醒，期望result=true |
| 6 | ActsLocksTestConditionVariableNotifyOne006 | new ConditionVariable()/waitFor()/notifyOne() | new CV()+taskpool(threadWaitFor,500)+sleep(1000)+taskpool(threadNotifyOne)+sleepTime=2000 | waitFor(500)超时(1000ms)后再notifyOne，期望resultWaitFor=true |
| 7 | ActsLocksTestConditionVariableNotifyOne007 | new ConditionVariable()/waitFor()/notifyOne() | new CV()+taskpool(threadWaitFor,0)+sleep(1000)+taskpool(threadNotifyOne)+sleepTime=2000 | waitFor(0)超时(1000ms)后再notifyOne，期望resultWaitFor=true |
| 8 | ActsLocksTestConditionVariableNotifyOne008 | new ConditionVariable()/wait()/waitFor()/notifyOne() | new CV()+workerWait+workerWaitFor+workerNotifyOne | wait+waitFor+notifyOne，notifyOne只唤醒wait，期望resultThread1且!resultThread2 |
| 9 | ActsLocksTestConditionVariableNotifyOne009 | new ConditionVariable()/wait()/waitFor()/notifyOne() | new CV()+taskpool(threadWait)+taskpool(threadWaitFor)+2×taskpool(threadNotifyOne) | wait+waitFor+2个notifyOne，期望两个result都true |
| 10 | ActsLocksTestConditionVariableNotifyOne010 | new ConditionVariable()/wait()/notifyOne() | new CV()+workerWait1+workerNotifyOne1+workerWait2+workerNotifyOne2 | 2组重叠wait+notifyOne，期望两个result都true |
| 11 | ActsLocksTestConditionVariableNotifyOne011 | new ConditionVariable()/wait()/waitFor()/notifyOne() | new CV()+workerWait+workerWaitFor+workerNotifyOne+sleep(5000) | wait+waitFor+notifyOne，sleep(5000)后waitFor超时+notifyOne唤醒wait，期望两个result都true |
| 12 | ActsLocksTestConditionVariableNotifyOne012 | new ConditionVariable()/wait()/waitFor()/notifyAll()/notifyOne() | new CV()+2×workerWait+taskpool(threadWaitFor,0)+taskpool(threadWait,5000)+workerNotify(notifyAll)+workerNotifyOne | 4线程+notifyAll+notifyOne，期望4个result都true且执行时间<1000ms |
| 13 | ActsLocksTestConditionVariableNotifyOne013 | new ConditionVariable()/wait()/waitFor()/notifyOne()/notifyAll() | new CV()+2×workerWait+taskpool(threadWaitFor,0)+taskpool(threadWait,8000)+workerNotifyOne+workerNotify | 4线程+notifyOne(唤醒1个)+notifyAll(唤醒剩余)，期望先resultFirst(r1&&!r2&&r3&&!r4)再resultSecond(全true) |
| 14 | ActsLocksTestConditionVariableNotifyOne014 | ConditionVariable.request()/notifyOne() | request('Test') | 主线程直接调用notifyOne()，期望不抛异常 |
| 15 | ActsLocksTestConditionVariableNotifyOne015 | ConditionVariable.request()/notifyOne() | request('Test')+taskpool(threadNotifyOne) | TaskPool线程中调用notifyOne()，期望不抛异常 |
| 16 | ActsLocksTestConditionVariableNotifyOne016 | ConditionVariable.request()/wait()/notifyOne() | request('Test')+workerWait+workerNotifyOne | 1个wait+1个notifyOne，notifyOne唤醒wait，期望result=true |
| 17 | ActsLocksTestConditionVariableNotifyOne017 | ConditionVariable.request()/wait()/notifyOne() | request('Test')+2×workerWait+workerNotifyOne | 2个wait+1个notifyOne，notifyOne只唤醒1个，期望resultThread1且!resultThread2 |
| 18 | ActsLocksTestConditionVariableNotifyOne018 | ConditionVariable.request()/waitFor()/notifyOne() | request('Test')+taskpool(threadWaitFor,1000)+sleep(500)+taskpool(threadNotifyOne) | waitFor(1000)在500ms被notifyOne唤醒，期望result=true |
| 19 | ActsLocksTestConditionVariableNotifyOne019 | ConditionVariable.request()/waitFor()/notifyOne() | request('Test')+taskpool(threadWaitFor,500)+sleep(1000)+taskpool(threadNotifyOne)+sleepTime=2000 | waitFor(500)超时(1000ms)后再notifyOne，期望resultWaitFor=true |
| 20 | ActsLocksTestConditionVariableNotifyOne020 | ConditionVariable.request()/waitFor()/notifyOne() | request('Test')+taskpool(threadWaitFor,0)+sleep(1000)+taskpool(threadNotifyOne)+sleepTime=2000 | waitFor(0)超时(1000ms)后再notifyOne，期望resultWaitFor=true |
| 21 | ActsLocksTestConditionVariableNotifyOne021 | ConditionVariable.request()/wait()/waitFor()/notifyOne() | request('Test')+workerWait+workerWaitFor+workerNotifyOne | wait+waitFor+notifyOne，notifyOne只唤醒wait，期望resultThread1且!resultThread2 |
| 22 | ActsLocksTestConditionVariableNotifyOne022 | ConditionVariable.request()/wait()/waitFor()/notifyOne() | request('Test')+taskpool(threadWait)+taskpool(threadWaitFor)+2×taskpool(threadNotifyOne) | wait+waitFor+2个notifyOne，期望两个result都true |
| 23 | ActsLocksTestConditionVariableNotifyOne023 | ConditionVariable.request()/wait()/notifyOne() | request('Test')+workerWait1+workerNotifyOne1+workerWait2+workerNotifyOne2 | 2组重叠wait+notifyOne，期望两个result都true |
| 24 | ActsLocksTestConditionVariableNotifyOne024 | ConditionVariable.request()/wait()/waitFor()/notifyOne() | request('Test')+workerWait+workerWaitFor+workerNotifyOne+sleep(5000) | wait+waitFor+notifyOne，sleep(5000)后两个result都true |
| 25 | ActsLocksTestConditionVariableNotifyOne025 | ConditionVariable.request()/wait()/waitFor()/notifyAll()/notifyOne() | request('Test')+2×workerWait+taskpool(threadWaitFor,0)+taskpool(threadWait,5000)+workerNotify(notifyAll)+workerNotifyOne | 4线程+notifyAll+notifyOne，期望4个result都true且执行时间<1000ms |
| 26 | ActsLocksTestConditionVariableNotifyOne026 | ConditionVariable.request()/wait()/waitFor()/notifyOne()/notifyAll() | request('Test')+2×workerWait+taskpool(threadWaitFor,0)+taskpool(threadWait,8000)+workerNotifyOne+workerNotify | 4线程+notifyOne(唤醒1个)+notifyAll(唤醒剩余)，期望先resultFirst再resultSecond(全true) |

---

## 5. ConditionVariableConcurrent.test.ets (14用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | ActsLocksTestConditionVariableTaskPool001 | new ConditionVariable()/wait()/notifyAll() | new CV()+Promise.all(threadWait())+taskpool(threadNotify)+sleepTime=3000 | 主线程wait()+TaskPool notifyAll，期望result=true |
| 2 | ActsLocksTestConditionVariableTaskPool002 | new ConditionVariable()/wait()/notifyAll() | new CV()+taskpool(threadWait)+Promise.all(threadNotify())+operationTime=500+sleepTime=3000 | TaskPool wait()+主线程notifyAll，期望result=true |
| 3 | ActsLocksTestConditionVariableTaskPool003 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+Promise.all(threadWait())+taskpool(threadNotify)+sleepTime=3000 | request CV，主线程wait()+TaskPool notifyAll，期望result=true |
| 4 | ActsLocksTestConditionVariableTaskPool004 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+taskpool(threadWait)+Promise.all(threadNotify())+operationTime=500+sleepTime=3000 | request CV，TaskPool wait()+主线程notifyAll，期望result=true |
| 5 | ActsLocksTestConditionVariableThreadWorker001 | new ConditionVariable()/wait()/notifyAll() | new CV()+Promise.all(threadWait())+workerNotify+sleepTime=3000 | 主线程wait()+ThreadWorker notifyAll，期望result=true |
| 6 | ActsLocksTestConditionVariableThreadWorker002 | new ConditionVariable()/wait()/notifyAll() | new CV()+Promise.all(threadNotify())+workerWait+operationTime=500+sleepTime=3000 | 主线程notifyAll()+ThreadWorker wait，期望result=true |
| 7 | ActsLocksTestConditionVariableThreadWorker003 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+Promise.all(threadWait())+workerNotify+sleepTime=3000 | request CV，主线程wait()+ThreadWorker notifyAll，期望result=true |
| 8 | ActsLocksTestConditionVariableThreadWorker004 | ConditionVariable.request()/wait()/notifyAll() | request('Test')+Promise.all(threadNotify())+workerWait+operationTime=500+sleepTime=3000 | request CV，主线程notifyAll()+ThreadWorker wait，期望result=true |
| 9 | ActsLocksTestConditionVariableThreadWorkerTerminate001 | new ConditionVariable()/wait()/notifyAll() | workerCreateCV(new)+workerImplementCV+createCV.terminate()+sleepTime=5000 | ThreadWorker创建CV(new)后terminate()，CV传递给另一worker仍可用，期望result=true |
| 10 | ActsLocksTestConditionVariableThreadWorkerTerminate002 | ConditionVariable.request()/wait()/notifyAll() | workerCreateCVReq(request)+workerImplementCV+createCV.terminate()+sleepTime=5000 | ThreadWorker创建CV(request)后terminate()，CV传递给另一worker仍可用，期望result=true |
| 11 | ActsLocksTestConditionVariableGCFull001 | new ConditionVariable()/wait()/notifyAll()/GCFull() | new CV()局部作用域+wait().then()+notifyAll()+GCFull() | 作用域内CV wait+notifyAll后GCFull回收，期望不抛异常 |
| 12 | ActsLocksTestConditionVariableGCFull002 | new ConditionVariable()/wait()/notifyAll()/GCFull() | new CV()+taskpool(threadGC)+sleepTime=5000 | TaskPool threadGC中wait+notifyAll+GCFull，期望result=true |
| 13 | ActsLocksTestConditionVariableGCFull003 | ConditionVariable.request()/wait()/notifyAll()/GCFull() | request("Test")局部作用域+wait().then()+notifyAll()+GCFull() | request CV，作用域内wait+notifyAll后GCFull回收，期望不抛异常 |
| 14 | ActsLocksTestConditionVariableGCFull004 | ConditionVariable.request()/wait()/notifyAll()/GCFull() | request('Test')+taskpool(threadGC)+sleepTime=5000 | request CV，TaskPool threadGC中wait+notifyAll+GCFull，期望result=true |
