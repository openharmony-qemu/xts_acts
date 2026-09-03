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
import { sleep, threadNotifyOne, threadWait, threadWaitFor } from './ConditionVariableHelpers';

export default function conditionVariableNotifyOneTest() {
  describe('ConditionVariableNotifyOneTest', () => {

    beforeEach(async () => {
      await sleep(1000);
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0001
     * @tc.desc   check use notifyOne
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableNotifyOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.notifyOne();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0002
     * @tc.desc   check create notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsLocksTestConditionVariableNotifyOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne002';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadNotifyOne, conditionVariable).then(() => {
        });
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0003
     * @tc.desc   check create wait notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne003';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
        waitThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0004
     * @tc.desc   check create more wait one notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne004';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0005
     * @tc.desc   check create waitFor notify operationTime less than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne005';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(500);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0006
     * @tc.desc   check create waitFor notifyOne operationTime greater than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne006';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0007
     * @tc.desc   check create waitFor operationTime greater than waitTime 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne007';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0008
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne008';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(1000);
        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0009
     * @tc.desc   check create wait waitFor more notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne009';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        taskpool.execute(threadWaitFor, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        taskpool.execute(threadNotifyOne, conditionVariable);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0010
     * @tc.desc   check create overlapping wait notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne010';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        notifyThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker2.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0011
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne011';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(5000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0012
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne012';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }).catch((err: Error) => { console.error(err.message); done(); });
        taskpool.execute(threadWait, conditionVariable, 5000).then((data) => {
          resultThread4 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2 && resultThread3 && resultThread4
          && threadExecutionTime < 1000).assertTrue();
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0013
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne013';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        let resultFirst: boolean = false;
        let resultSecond: boolean = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        taskpool.execute(threadWait, conditionVariable, 8000).then((data) => {
          resultThread4 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        resultFirst = resultThread1 && !resultThread2 && resultThread3 && !resultThread4
          && threadExecutionTime < 1000;
        if (resultFirst) {
          const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
          notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
          await sleep(2000);
          resultSecond = resultThread1 && resultThread2 && resultThread3 && resultThread4
            && threadExecutionTime < 1000;
          notifyThreadWorker.terminate();
          expect(resultSecond).assertTrue();
        } else {
          expect(resultFirst).assertTrue();
        }
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0014
     * @tc.desc   check use notifyOne
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableNotifyOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne014';
      console.info(`${CASE} START`);
      try {
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        conditionVariable.notifyOne();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0015
     * @tc.desc   check create notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsLocksTestConditionVariableNotifyOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne015';
      console.info(`${CASE} START`);
      try {
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadNotifyOne, conditionVariable).then(() => {
        });
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0016
     * @tc.desc   check create wait notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne016';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0017
     * @tc.desc   check create more wait one notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne017';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0018
     * @tc.desc   check create waitFor notify operationTime less than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne018';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(500);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0019
     * @tc.desc   check create waitFor notifyOne operationTime greater than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne019';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0020
     * @tc.desc   check create waitFor operationTime greater than waitTime 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne020';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(sleepTime);
        expect(resultWaitFor).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0021
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne021';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        console.info(`${CASE} START 1`);

        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        console.info(`${CASE} START 2`);

        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        console.info(`${CASE} START 3`);

        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        console.info(`${CASE} START 4`);

        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
          console.info(`${CASE} START 5` + resultThread1);

        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
          console.info(`${CASE} START 6` + resultThread2);

        }
        await sleep(1000);
        console.info(`${CASE} START 7`);

        expect(resultThread1 && !resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0022
     * @tc.desc   check create wait waitFor more notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne022';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        taskpool.execute(threadWaitFor, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        taskpool.execute(threadNotifyOne, conditionVariable);
        taskpool.execute(threadNotifyOne, conditionVariable);
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0023
     * @tc.desc   check create overlapping wait notifyOne thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne023';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker1.terminate();
        notifyThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker2.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0024
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne024';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(5000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0025
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne025';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }).catch((err: Error) => { console.error(err.message); done(); });
        taskpool.execute(threadWait, conditionVariable, 5000).then((data) => {
          resultThread4 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2 && resultThread3 && resultThread4
          && threadExecutionTime < 1000).assertTrue();
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyThreadWorker.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotifyOne026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_ONE_0026
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotifyOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotifyOne026';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        let resultThread3 = false;
        let resultThread4 = false;
        let resultFirst: boolean = false;
        let resultSecond: boolean = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        taskpool.execute(threadWaitFor, conditionVariable, 0).then((data) => {
          resultThread3 = data as boolean;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        taskpool.execute(threadWait, conditionVariable, 8000).then((data) => {
          resultThread4 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        const notifyOneThreadWorker = new worker.ThreadWorker('../workers/workerNotifyOne.ets');
        notifyOneThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        waitThreadWorker2.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        resultFirst = resultThread1 && !resultThread2 && resultThread3 && !resultThread4
          && threadExecutionTime < 1000;
        if (resultFirst) {
          const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
          notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
          await sleep(2000);
          resultSecond = resultThread1 && resultThread2 && resultThread3 && resultThread4
            && threadExecutionTime < 1000;
          expect(resultSecond).assertTrue();
          notifyThreadWorker.terminate();
        } else {
          expect(resultFirst).assertTrue();
        }
        waitThreadWorker1.terminate();
        waitThreadWorker2.terminate();
        notifyOneThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

  });
}
