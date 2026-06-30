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

let atomicInt: AtomicInt = new AtomicInt(0);
let atomicRef: AtomicReference<string> = new AtomicReference<string>("initial");

async function atomicIncrement(): Promise<int> {
  let oldValue: int = atomicInt.fetchAdd(1);
  await sleep(50);
  let newValue: int = atomicInt.load();
  return newValue;
}

async function atomicCompare(): Promise<boolean> {
  let current: int = atomicInt.load();
  let oldValue: int = atomicInt.compareAndSwap(current, current + 10);
  let success: boolean = (oldValue === current);
  return success;
}

export default function AtomicsTest():void {
  describe('AtomicsTest', (): void => {
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
     * @tc.number SUB_SPEC_ATOMICS_0100
     * @tc.name AtomicsInAsyncFunctionTest
     * @tc.desc test Atomics operations in async function: atomic operations are valid in async context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
it('AtomicsInAsyncFunctionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-063: Atomics in async function
      atomicInt.store(0);
      
      let value1: int = await atomicIncrement();
      expect(value1).assertEqual(1);
      
      let result1: boolean = await atomicCompare();
      expect(result1).assertTrue();
      
      let finalValue: int = atomicInt.load();
      expect(finalValue).assertEqual(11);
      
      let result2: boolean = await atomicCompare();
      expect(result2).assertTrue();
      
      let afterSecondCAS: int = atomicInt.load();
      expect(afterSecondCAS).assertEqual(21);
    });
  });
}