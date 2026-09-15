/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import {
  asyncRunnerNestedGroup,
  asyncRunnerNestedTask,
  asyncRunnerTaskNestedTimeout,
  delayedNestedTask,
  demoSenddata,
  level1Task,
  level3Task,
  longTaskNestedGroup,
  longTaskNestedTimeout,
  nestedDifferentTimeout,
  nestedInnerCancelExceptionTimeout,
  nestedInnerExceptionTask,
  nestedInnerTimeout1Task,
  nestedInnerTimeoutTask,
  nestedOuterCancelTask,
  nestedOuterCompleteTask,
  nestedOuterTask,
  nestedTaskGroupTask,
  nestedTimeoutTask,
  outerAwaitMultipleTimeout,
  periodicTaskInner,
  rejectTaskLong,
  rejectTaskShort,
  sendableClassWithTime,
  sequenceRunnerNestedGroup,
  sequenceRunnerNestedTask,
  setTransferListTestWithTime,
  taskAsyncRunnerInnerLongOuterShort,
  taskAsyncRunnerInnerShortOuterLong,
  taskError,
  taskGroupAsyncRunnerInnerLongOuterShort,
  taskGroupAsyncRunnerInnerShortOuterLong,
  taskGroupSequenceRunnerInnerLongOuterShort,
  taskGroupSequenceRunnerInnerShortOuterLong,
  taskSequenceRunnerInnerLongOuterShort,
  taskSequenceRunnerInnerShortOuterLong,
  timeoutDemo,
  timeoutWithLongTask
} from '../utils/TimeoutFuncList';
import { promiseCase } from './testFunclist';
import { SendableClassTest, sendableFunc } from './sendable';
import { level2Task } from '../utils/TimeoutFunc2';
import { nestPeriodicTaskInner } from '../utils/TimeoutFunc3';

export default function TaskTimeout2Test() {
  describe('ActTaskTimeout2Test', () => {
    /**
     * @tc.name   TaskTimeout2TestClass001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0339
     * @tc.desc   HIGH priority + short timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass001';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { priority: taskpool.Priority.HIGH, timeout: 50 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0340
     * @tc.desc   LOW priority + long timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass002';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 100);
      taskpool.execute(task, { priority: taskpool.Priority.LOW, timeout: 200 }).then((res) => {
        isTerminate = true;
        console.log(`${caseName} then`);
        expect(res).assertEqual(100);
      }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0341
     * @tc.desc   IDLE priority + timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTimeout2TestClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'TaskTimeout2TestClass003';
      console.log(`${caseName} start.`);
      let isTerminate = false;
      let task: taskpool.Task = new taskpool.Task(timeoutDemo, 600);
      taskpool.execute(task, { priority: taskpool.Priority.IDLE, timeout: 500 }).catch((e: BusinessError) => {
        console.log(`${caseName} catch: ${e}`);
        isTerminate = true;
        expect(e.code).assertEqual(10200058);
      });
      while (!isTerminate) {
        await promiseCase();
      }
      console.log(`${caseName} end.`);
      done();
    })

    /**
     * @tc.name   TaskTimeout2TestClass004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TASKPOOL_0342
     * @tc.desc   Multiple tasks with different priorities and same timeout
     * @tc.type   Function
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
