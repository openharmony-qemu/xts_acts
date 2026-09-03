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
import { sleep, threadNotify, threadWait, threadWaitFor } from './ConditionVariableHelpers';

export default function conditionVariableNotifyTest() {
  describe('ConditionVariableNotifyTest', () => {

    beforeEach(async () => {
      await sleep(1000);
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0001
     * @tc.desc   check notify use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableNotify001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.notifyAll();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0002
     * @tc.desc   check create notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableNotify002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadNotify, conditionVariable).then(() => {
          result = true;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0003
     * @tc.desc   check create wait notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify003';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
        waitThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0004
     * @tc.desc   check create more wait one notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify004';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
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
        expect(resultThread1 && resultThread2).assertTrue();
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
     * @tc.name   ActsLocksTestConditionVariableNotify005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0005
     * @tc.desc   check create waitFor notify operationTime less than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify005';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(500);
        taskpool.execute(threadNotify, conditionVariable);
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
     * @tc.name   ActsLocksTestConditionVariableNotify006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0006
     * @tc.desc   check create waitFor notify operationTime greater than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify006';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0007
     * @tc.desc   check create waitFor operationTime greater than waitTime 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify007';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0008
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify008';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0009
     * @tc.desc   check create more wait more notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify009';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
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
     * @tc.name   ActsLocksTestConditionVariableNotify010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0010
     * @tc.desc   check create overlapping wait notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify010';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotify.ets');
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
     * @tc.name   ActsLocksTestConditionVariableNotify011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0011
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify011';
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
        taskpool.execute(threadWait, conditionVariable, 3000).then((data) => {
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
     * @tc.name   ActsLocksTestConditionVariableNotify012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0012
     * @tc.desc   check notify use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableNotify012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify012';
      console.info(`${CASE} START`);
      try {
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        conditionVariable.notifyAll();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0013
     * @tc.desc   check create notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableNotify013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify013';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadNotify, conditionVariable).then(() => {
          result = true;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0014
     * @tc.desc   check create wait notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify014';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data as boolean;
        }
        await sleep(2000);
        expect(result).assertTrue();
        waitThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0015
     * @tc.desc   check create more wait one notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify015';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
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
        expect(resultThread1 && resultThread2).assertTrue();
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
     * @tc.name   ActsLocksTestConditionVariableNotify016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0016
     * @tc.desc   check create waitFor notify operationTime less than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify016';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 1000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(500);
        taskpool.execute(threadNotify, conditionVariable);
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
     * @tc.name   ActsLocksTestConditionVariableNotify017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0017
     * @tc.desc   check create waitFor notify operationTime greater than waitTime thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify017';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 500;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0018
     * @tc.desc   check create waitFor operationTime greater than waitTime 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify018';
      console.info(`${CASE} START`);
      try {
        let resultWaitFor = false;
        let resultNotify = false;
        const waitTime: number = 0;
        const operationTime: number = 1000;
        const sleepTime: number = 2000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          resultWaitFor = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(operationTime);
        taskpool.execute(threadNotify, conditionVariable).then(() => {
          resultNotify = true;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(sleepTime);
        expect(resultWaitFor && resultNotify).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
        done();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0019
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify019';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker.postMessageWithSharedSendable(conditionVariable);
        const waitForThreadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        waitForThreadWorker.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        waitForThreadWorker.onmessage = (e: MessageEvents): void => {
          resultThread2 = e.data as boolean;
        }
        await sleep(2000);
        expect(resultThread1 && resultThread2).assertTrue();
        waitThreadWorker.terminate();
        waitForThreadWorker.terminate();
        notifyThreadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableNotify020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0020
     * @tc.desc   check create more wait more notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify020';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread1 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        taskpool.execute(threadWait, conditionVariable).then((data) => {
          resultThread2 = data as boolean;
        }).catch((err: Error) => { console.error(err.message); done(); });
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
        await sleep(1000);
        taskpool.execute(threadNotify, conditionVariable);
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
     * @tc.name   ActsLocksTestConditionVariableNotify021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0021
     * @tc.desc   check create overlapping wait notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify021';
      console.info(`${CASE} START`);
      try {
        let resultThread1 = false;
        let resultThread2 = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitThreadWorker1 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker1 = new worker.ThreadWorker('../workers/workerNotify.ets');
        notifyThreadWorker1.postMessageWithSharedSendable(conditionVariable);
        waitThreadWorker1.onmessage = (e: MessageEvents): void => {
          resultThread1 = e.data as boolean;
        }
        await sleep(1000);
        const waitThreadWorker2 = new worker.ThreadWorker('../workers/workerWait.ets');
        waitThreadWorker2.postMessageWithSharedSendable(conditionVariable);
        await sleep(1000);
        const notifyThreadWorker2 = new worker.ThreadWorker('../workers/workerNotify.ets');
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
     * @tc.name   ActsLocksTestConditionVariableNotify022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_NOTIFY_0022
     * @tc.desc   check create wait waitFor notify thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableNotify022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableNotify022';
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
        taskpool.execute(threadWait, conditionVariable, 3000).then((data) => {
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

  });
}
