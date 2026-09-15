/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import {
  test_uint8Array_001,
  test_uint8Array_002,
  test_uint8Array_003,
  test_uint8Array_004,
  test_uint8Array_005,
  test_uint8Array_006,
  test_uint8Array_007,
  test_uint8Array_008,
  test_uint8Array_009,
  test_uint8Array_010,
  test_uint8Array_011,
  test_uint8Array_012,
  test_uint8Array_013,
  test_uint8Array_014,
  test_uint8Array_015,
  test_uint8Array_016,
  test_uint8Array_017,
  test_uint8Array_018,
  test_uint8Array_019,
  test_uint8Array_020,
  test_uint8Array_021,
  test_uint8Array_022,
  test_uint8Array_023,
  test_uint8Array_024,
  test_uint8Array_025,
  test_uint8Array_026,
  test_uint8Array_027} from './taskpool';
import { BusinessError } from '@kit.BasicServicesKit';

let concurrentNum = 100

function getInitUint8Array1(): collections.Uint8Array {
  let uint8Array = new collections.Uint8Array(1000);
  for (let i = 0; i < 1000; i++) {
    uint8Array[i] = (i % 256);
  }
  return uint8Array;
}

function getInitUint8Array2(): collections.Uint8Array {
  let uint8Array = new collections.Uint8Array([1, 2, 3, 4]);
  return uint8Array;
}

function getInitUint8Array3(): collections.Uint8Array {
  let arrayPara = [1, 2, 3, 4];
  let uint8Array = new collections.Uint8Array(arrayPara);
  return uint8Array;
}

function getInitUint8Array4(): collections.Uint8Array {
  let uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  return uint8Array;
}

function getInitUint8Array5(): collections.Uint8Array {
  let array: Array<number> = [1, 2, 3, 4];
  let uint8Array = collections.Uint8Array.from(array);
  return uint8Array;
}

function getInitUint8Array6(): collections.Uint8Array {
  const set = new Set([1, 2, 3, 4]);
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from(set);
  return uint8Array;
}

function getInitUint8Array7(): collections.Uint8Array {
  let array: Array<number> = [1, 2, 3];
  let uint8Array = collections.Uint8Array.from(array, (value, index) => value + index);
  return uint8Array;
}

function getInitUint8Array8(): collections.Uint8Array {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.of(1, 2, 3, 4);
  return uint8Array;
}

function getInitUint8Array9(): collections.Uint8Array {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(3, 1, 3);
  return copied;
}

function getInitUint8Array10(): collections.Uint8Array {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayBuffer, 1, 5);
  return uint8Array;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

export default function Uint8ArrayConcurrentTestConcurrent() {
  describe('Uint8ArrayConcurrentTestConcurrent', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   test_concurrent_collections_uint8Array_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT8_ARRAY_CONCURRENT_0028
     * @tc.desc   test_concurrent_collections_uint8Array_001 - test Uint8Array constructor and basic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_concurrent_collections_uint8Array_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'test_concurrent_collections_uint8Array_001';
        console.info(`${caseName} test start`);
        let uint8Array = getInitUint8Array1()
        try {
          let group = new taskpool.TaskGroup(caseName)
          for (let i = 0; i < concurrentNum; i++) {
            group.addTask(test_uint8Array_001, uint8Array, caseName, i)
