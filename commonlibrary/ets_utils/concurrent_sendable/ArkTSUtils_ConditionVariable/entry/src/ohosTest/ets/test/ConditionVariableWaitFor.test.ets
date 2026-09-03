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
import { sleep, threadWaitFor } from './ConditionVariableHelpers';

export default function conditionVariableWaitForTest() {
  describe('ConditionVariableWaitForTest', () => {

    beforeEach(async () => {
      await sleep(1000);
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0001
     * @tc.desc   check waitFor use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0100';
      console.info(`${CASE} START`);
      try {
        const waitTime: number = 500;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await conditionVariable.waitFor(waitTime);
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });


    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0002
     * @tc.desc   check create waitFor greater than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0200';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
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
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0003
     * @tc.desc   check create waitFor equal to 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0300';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 0;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0004
     * @tc.desc   check create waitFor less than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0400';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = -1;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0005
     * @tc.desc   check create waitFor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0500';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }
        await sleep(sleepTime);
        expect(result && threadExecutionTime >= 3000).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0006
     * @tc.desc   check waitFor use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0600';
      console.info(`${CASE} START`);
      try {
        const waitTime: number = 500;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await conditionVariable.waitFor(waitTime);
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });


    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0007
     * @tc.desc   check create waitFor greater than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0700';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
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
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0008
     * @tc.desc   check create waitFor equal to 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0800';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = 0;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor0900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0009
     * @tc.desc   check create waitFor less than 0 thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsLocksTestConditionVariableWaitFor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor0900';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const waitTime: number = -1;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitFor, conditionVariable, waitTime).then((data) => {
          result = data as boolean;
        });
        expect(result).assertTrue();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWaitFor1100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_FOR_0010
     * @tc.desc   check create waitFor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWaitFor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWaitFor1100';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const sleepTime: number = 5000;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        const waitBeginTime = Date.now();
        let threadExecutionTime: number = 0;
        const threadWorker = new worker.ThreadWorker('../workers/workerWaitFor.ets');
        threadWorker.postMessageWithSharedSendable(conditionVariable);
        threadWorker.onmessage = (e: MessageEvents): void => {
          result = e.data;
          const waitEndTime = Date.now();
          threadExecutionTime = waitEndTime - waitBeginTime;
        }
        await sleep(sleepTime);
        expect(result && threadExecutionTime >= 3000).assertTrue();
        threadWorker.terminate();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

  });
}
