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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'
import { arrayLike } from './TypeArrayConst'
import { collections } from '@kit.ArkTS';



interface GeneratedObjectLiteralInterface_1 {
  id: number;
  values: collections.Uint32Array;
}

export default function typeArrayUint32ArrayTest() {
  describe('TypeArrayUint32ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   TypeArrayUint32Array001
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_001
     * @tc.desc   用长度参数创建空Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.length).assertEqual(5);
        expect(arr.byteLength).assertEqual(20);
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array002
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_002
     * @tc.desc   从普通数字数组创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4]);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr.toString()).assertEqual('1,2,3,4');
      })

    /**
     * @tc.name   TypeArrayUint32Array003
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_003
     * @tc.desc   从ArrayBuffer创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr = new collections.Uint32Array(buffer);
        expect(arr.length).assertEqual(4);
        expect(arr.buffer).assertEqual(buffer);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array004
     * @tc.number SUB_BUILDINS_TYPEARRAY_UINT32ARRAY_004
     * @tc.desc   从ArrayBuffer和偏移量、长度创建Uint32Array
