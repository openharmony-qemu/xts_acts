/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, MessageEvents, taskpool, worker } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { GCFull } from './GCFull';
import { sleep, threadGC, threadNotify, threadWait } from './ConditionVariableHelpers';


@Sendable
class SupCvShared001 {
  cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
}

@Concurrent
async function supCvWait001(cv: ArkTSUtils.locks.ConditionVariable): Promise<void> {
  await cv.wait();
}

@Concurrent
function supCvNotify001(cv: ArkTSUtils.locks.ConditionVariable): void {
  cv.notifyAll();
}

@Sendable
class SupMyCv001 extends ArkTSUtils.locks.ConditionVariable {
  notifyCount: number = 0;

  notifyAll(): void {
    this.notifyCount = this.notifyCount + 1;
    super.notifyAll();
  }
}
export default function conditionVariableConcurrentTest() {
  describe('ConditionVariableConcurrentTest', () => {

    beforeEach(async () => {
      await sleep(100);
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableTaskPool001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0001
     * @tc.desc   check create taskPool wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableTaskPool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool001';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        taskpool.execute(threadNotify, conditionVariable, CASE);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableTaskPool002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0002
     * @tc.desc   check create taskPool notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableTaskPool002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool002';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        taskpool.execute(threadWait, conditionVariable, CASE).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        Promise.all([
          threadNotify(),
        ]);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });


    /**
     * @tc.name   ActsLocksTestConditionVariableTaskPool003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0003
     * @tc.desc   check create taskPool wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableTaskPool003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool003';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        taskpool.execute(threadNotify, conditionVariable, CASE);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableTaskPool004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0004
     * @tc.desc   check create taskPool notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableTaskPool004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableTaskPool004';
      console.info(`${CASE} test start`);
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        taskpool.execute(threadWait, conditionVariable, CASE).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        Promise.all([
          threadNotify(),
        ]);
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableThreadWorker001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0005
     * @tc.desc   check create worker notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableThreadWorker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker001';
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableThreadWorker002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0006
     * @tc.desc   check create worker wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableThreadWorker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker002';
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        Promise.all([
          threadNotify(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableThreadWorker003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0007
     * @tc.desc   check create worker notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableThreadWorker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker003';
      try {
        let result = false;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWait = async () => {
          console.log(`${CASE} TaskPool Thread Wait: Waiting...`);
          await conditionVariable.wait().then(() => {
            console.log(`${CASE} TaskPool Thread Wait: Then continue...`);
            result = true;
          });
          console.log(`${CASE} TaskPool Thread Wait: Notified and continuing...`);
        };
        Promise.all([
          threadWait(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(sleepTime);
        expect(result).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableThreadWorker004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0008
     * @tc.desc   check create worker wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableThreadWorker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorker004';
      try {
        let result = false;
        const operationTime: number = 500;
        const sleepTime: number = 3000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadNotify = async () => {
          await sleep(operationTime);
          console.log(`${CASE} TaskPool Thread Notify: Notifying one thread...`);
          conditionVariable.notifyAll();
        };
        Promise.all([
          threadNotify(),
        ]);
        const threadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableThreadWorkerTerminate001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0009
     * @tc.desc   check create worker wait notify thread use terminate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableThreadWorkerTerminate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorkerTerminate001';
      try {
        let result = false;
        const sleepTime: number = 5000;
        const createCVThreadWorker = new worker.ThreadWorker('../workers/workerCreateCV.ets');
        createCVThreadWorker.postMessage(CASE);
        createCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
          if (undefined != e.data) {
            const conditionVariable: ArkTSUtils.locks.ConditionVariable = e.data;
            const implementCVThreadWorker = new worker.ThreadWorker('../workers/workerImplementCV.ets');
            implementCVThreadWorker.postMessageWithSharedSendable(conditionVariable);
            await sleep(500);
            createCVThreadWorker.terminate();
            console.info(`${CASE} createCVThreadWorker terminate`);
            implementCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
              result = e.data;
              console.info(`${CASE} implementCVThreadWorker result: ` + result);
            }
          }
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableThreadWorkerTerminate002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0010
     * @tc.desc   check create worker wait notify thread use terminate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableThreadWorkerTerminate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableThreadWorkerTerminate002';
      try {
        let result = false;
        const sleepTime: number = 5000;
        const createCVThreadWorker = new worker.ThreadWorker('../workers/workerCreateCVReq.ets');
        createCVThreadWorker.postMessage(CASE);
        createCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
          if (undefined != e.data) {
            const conditionVariable: ArkTSUtils.locks.ConditionVariable = e.data;
            const implementCVThreadWorker = new worker.ThreadWorker('../workers/workerImplementCV.ets');
            implementCVThreadWorker.postMessageWithSharedSendable(conditionVariable);
            await sleep(500);
            createCVThreadWorker.terminate();
            console.info(`${CASE} createCVThreadWorker terminate`);
            implementCVThreadWorker.onmessage = async (e: MessageEvents): Promise<void> => {
              result = e.data;
              console.info(`${CASE} implementCVThreadWorker result: ` + result);
            }
          }
        }
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} test end`);
      done();
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableGCFull001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0011
     * @tc.desc   check create wait notify thread use GCFull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableGCFull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull001';
      console.info(`${CASE} START`);
      try {
        {
          const conditionVariableGC: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
          console.log(`${CASE} threadGC Thread Wait: Waiting...`);
          conditionVariableGC.wait().then(() => {
             console.log(`${CASE} threadGC Thread Wait: Then continue...`);
          }).catch((err: Error) => { console.error(err.message); done(); });
          conditionVariableGC.notifyAll();
        }
        GCFull();
        console.log(`${CASE} threadGC thread continuing...`);
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableGCFull002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0012
     * @tc.desc   check create wait notify thread use GCFull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableGCFull002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadGC, conditionVariable).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableGCFull003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0013
     * @tc.desc   check create wait notify thread use GCFull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableGCFull003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull003';
      console.info(`${CASE} START`);
      try {
        {
          const conditionVariableGC = ArkTSUtils.locks.ConditionVariable.request("Test");
          console.log(`${CASE} threadGC Thread Wait: Waiting...`);
          conditionVariableGC.wait().then(() => {
            console.log(`${CASE} threadGC Thread Wait: Then continue...`);
          }).catch((err: Error) => { console.error(err.message); done(); });
          conditionVariableGC.notifyAll();
        }
        GCFull();
        console.log(`${CASE} threadGC thread continuing...`);
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableGCFull004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_CONCURRENT_0014
     * @tc.desc   check create wait notify thread use GCFull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableGCFull004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableGCFull004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadGC, conditionVariable).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(sleepTime);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.number  SUB_CONDITIONVAR_CONC_NO_ONE_0100
     * @tc.name    testCvConcNoOne0001
     * @tc.desc    Verify concurrent wait/notify does not throw 10200201
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvConcNoOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let shared = new SupCvShared001();
      let tasks: taskpool.Task[] = [];
      for (let t = 0; t < 5; t++) {
        tasks.push(new taskpool.Task(supCvWait001, shared.cv));
      }
      for (let t = 0; t < 5; t++) {
        tasks.push(new taskpool.Task(supCvNotify001, shared.cv));
      }
      let saw10200201 = false;
      let executions: Promise<Object>[] = [];
      for (let t = 0; t < tasks.length; t++) {
        executions.push(taskpool.execute(tasks[t]));
      }
      await sleep(100);
      shared.cv.notifyAll();
      for (let t = 0; t < executions.length; t++) {
        try {
          await executions[t];
        } catch (error) {
          let e = error as BusinessError;
          if (e.code === 10200201) {
            saw10200201 = true;
          }
        }
      }
      expect(saw10200201).assertFalse();
      done()
    })

    /**
     * @tc.number  SUB_CONDITIONVAR_INHERIT_ONE_0200
     * @tc.name    testCvInherit0002
     * @tc.desc    Verify subclassing native ConditionVariable does not preserve instanceof or notifyAll override (actual)
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvInherit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let myCv = new SupMyCv001();
      myCv.notifyAll();
      expect(myCv.notifyCount).assertEqual(0);
      expect(myCv instanceof ArkTSUtils.locks.ConditionVariable).assertFalse();
      let waitDone = false;
      myCv.wait().then(() => {
        waitDone = true;
      }).catch(() => { });
      await sleep(100);
      myCv.notifyAll();
      await sleep(100);
      expect(waitDone).assertTrue();
      done()
    })
  });
}
