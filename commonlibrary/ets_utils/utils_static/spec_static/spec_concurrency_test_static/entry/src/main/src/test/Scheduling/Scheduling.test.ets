'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let executionOrder: int[] = [];
let orderCounter: int = 0;

function schedulingTask(): number {
  executionOrder.push(100);
  return 100;
}

class ClosureTestClass {
  public instanceValue: int = 42;
  public closureValue: int = 0;
  
  async coroutineMethod(): Promise<int> {
    let capturedValue: int = this.instanceValue;
    await sleep(50);
    this.closureValue = capturedValue;
    return capturedValue;
  }
}

let testInstance: ClosureTestClass = new ClosureTestClass();

export default function SchedulingTest():void {
  describe('SchedulingTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_SPEC_SCHEDULING_0200
     * @tc.name SamePriorityFIFOTest
     * @tc.desc test same priority Jobs are scheduled in FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SamePriorityFIFOTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-073: same priority FIFO scheduling
      executionOrder = [];
      orderCounter = 0;
      
      let p: Promise<number> = Promise.resolve(42.0);
      
      p.then((value: number) => {
        executionOrder.push(1);
      });
      
      p.then((value: number) => {
        executionOrder.push(2);
      });
      
      p.then((value: number) => {
        executionOrder.push(3);
      });
      
      p.then((value: number) => {
        executionOrder.push(4);
      });
      
      await sleep(100);
      
      expect(executionOrder.length).assertEqual(4);
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);
      expect(executionOrder[2]).assertEqual(3);
      expect(executionOrder[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_SPEC_SCHEDULING_0300
     * @tc.name CoroutineRescheduleConsistencyTest
     * @tc.desc test coroutine rescheduling: this and closure variables remain consistent after await resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('CoroutineRescheduleConsistencyTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-074: coroutine reschedule - this/closure consistency
      testInstance = new ClosureTestClass();
      testInstance.instanceValue = 100;
      
      let originalInstance: ClosureTestClass = testInstance;
      let result: int = await testInstance.coroutineMethod();
      
      expect(result).assertEqual(100);
      expect(testInstance.closureValue).assertEqual(100);
      expect(testInstance === originalInstance).assertTrue();
    });
  });
}