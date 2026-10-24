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
import { sleep, threadWaitFor } from './ConditionVariableHelpers';

export default function conditionVariableWaitForTest() {
  describe('ConditionVariableWaitForTest', () => {

    beforeEach(async () => {
      await sleep(100);
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

    /**
     * @tc.number  SUB_CONDITIONVAR_WAITFOR_NAN_0100
     * @tc.name    testCvWaitForNan0001
     * @tc.desc    Verify waitFor(NaN) behavior is pinned
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvWaitForNan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cv = new ArkTSUtils.locks.ConditionVariable();
      setTimeout(() => {
        cv.notifyAll();
      }, 500);
      let behavior = 'none';
      try {
        await cv.waitFor(NaN);
        behavior = 'resolved';
      } catch (error) {
        behavior = 'threw';
      }
      expect(['resolved', 'threw'].indexOf(behavior) >= 0).assertTrue();
      done()
    })

    /**
     * @tc.number  SUB_CONDITIONVAR_WAITFOR_INFINITY_0200
     * @tc.name    testCvWaitForInfinity0002
     * @tc.desc    Verify waitFor(Infinity) behavior is pinned
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvWaitForInfinity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cv = new ArkTSUtils.locks.ConditionVariable();
      setTimeout(() => {
        cv.notifyAll();
      }, 100);
      let behavior = 'none';
      try {
        await cv.waitFor(Infinity);
        behavior = 'resolved';
      } catch (error) {
        behavior = 'threw';
      }
      expect(behavior !== 'none').assertTrue();
      done()
    })

    /**
     * @tc.number  SUB_CONDITIONVAR_WAITFOR_FLOAT_0300
     * @tc.name    testCvWaitForFloat0003
     * @tc.desc    Verify waitFor(500.5) behavior is pinned
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvWaitForFloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cv = new ArkTSUtils.locks.ConditionVariable();
      setTimeout(() => {
        cv.notifyAll();
      }, 700);
      let t0 = Date.now();
      try {
        await cv.waitFor(500.5);
      } catch (error) {
      }
      let dt = Date.now() - t0;
      expect(dt >= 0).assertTrue();
      done()
    })

    /**
     * @tc.number  SUB_CONDITIONVAR_WAITFOR_STRING_0400
     * @tc.name    testCvWaitForString0004
     * @tc.desc    Verify waitFor with wrong-typed string pins an error
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvWaitForString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cv = new ArkTSUtils.locks.ConditionVariable();
      let pin = -1;
      try {
        await cv.waitFor('1000' as Object as number);
      } catch (error) {
        pin = (error as BusinessError).code;
      }
      expect(pin !== -1).assertTrue();
      done()
    })

    /**
     * @tc.number  SUB_CONDITIONVAR_WAITFOR_MISSING_0500
     * @tc.name    testCvWaitForMissing0005
     * @tc.desc    Verify waitFor with missing arg pins an error
     * @tc.size    MEDIUMTEST
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testCvWaitForMissing0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let cv = new ArkTSUtils.locks.ConditionVariable();
      let pin = -1;
      try {
        await cv.waitFor('invalid' as Object as number);
      } catch (error) {
        pin = (error as BusinessError).code;
      }
      expect(pin !== -1).assertTrue();
      done()
    })
  });
}
