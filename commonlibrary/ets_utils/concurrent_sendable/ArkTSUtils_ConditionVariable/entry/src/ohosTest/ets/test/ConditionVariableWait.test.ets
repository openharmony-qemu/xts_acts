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
import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { sleep, threadWaitNotAwait } from './ConditionVariableHelpers';

export default function conditionVariableWaitTest() {
  describe('ConditionVariableWaitTest', () => {

    beforeEach(async () => {
      await sleep(1000);
    })

    /**
     * @tc.name   ActsLocksTestConditionVariableWait001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_0001
     * @tc.desc   check wait use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait001';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        conditionVariable.wait();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWait002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_0002
     * @tc.desc   check create wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait002';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        await taskpool.execute(threadWaitNotAwait, conditionVariable).then((data) => {
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
     * @tc.name   ActsLocksTestConditionVariableWait003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_0003
     * @tc.desc   check wait use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait003';
      console.info(`${CASE} START`);
      try {
        const conditionVariable: ArkTSUtils.locks.ConditionVariable = ArkTSUtils.locks.ConditionVariable.request("Test");
        conditionVariable.wait();
      } catch (err) {
        console.error(`${CASE} error:` + err);
        expect().assertFail();
      }
      console.info(`${CASE} END`);
      done();
    });

    /**
     * @tc.name   ActsLocksTestConditionVariableWait004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_0004
     * @tc.desc   check create wait thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsLocksTestConditionVariableWait004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableWait004';
      console.info(`${CASE} START`);
      try {
        let result = false;
        const conditionVariable = ArkTSUtils.locks.ConditionVariable.request('Test');
        await taskpool.execute(threadWaitNotAwait, conditionVariable).then((data) => {
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
     * @tc.name   ActsLocksTestConditionVariableRecursive001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONDITION_VARIABLE_WAIT_0005
     * @tc.desc   check recursive wait()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsLocksTestConditionVariableRecursive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const CASE: string = 'ActsLocksTestConditionVariableRecursive001';
      console.info(`${CASE} START`);
      let cv = ArkTSUtils.locks.ConditionVariable.request(CASE);
      let count = 0;
      cv.wait().then(() => {
        ++count;
        cv.wait().then(() => {
          ++count;
          cv.wait().then(() => {
            ++count;
          }).catch((err: Error) => { console.error(err.message); done(); });
        }).catch((err: Error) => { console.error(err.message); done(); });
      }).catch((err: Error) => { console.error(err.message); done(); });
      let id = setInterval(() => {
        cv.notifyAll();
      }, 100)
      while(count < 3) {
        await sleep(100);
      }
      clearInterval(id);
      expect(count).assertEqual(3);
      done();
    });

  });
}
