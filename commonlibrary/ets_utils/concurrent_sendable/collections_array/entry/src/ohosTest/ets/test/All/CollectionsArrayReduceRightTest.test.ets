/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { sleep } from './pages/Utils';
import { collections } from '@kit.ArkTS'
import { BusinessError } from '@kit.BasicServicesKit';

export default function CollectionsArrayReduceRightTest() {
  describe('CollectionsArrayReduceRightTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   builtinsArrayReduceRightTest1001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0165
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayReduceRightTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0);
      expect(6).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0205
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayReduceRightTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3]);
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr);
      expect(6).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0244
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([]);
      try {
        let reducedRightValue = array.reduceRight((acc, curr) => acc + curr,0);
        expect(0).assertEqual(reducedRightValue);
        Done();
      } catch (error) {
        console.info('======', error)
        expect('out of range.').assertEqual(error.message);
        Done();
      }
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0282
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([]);
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0);
      expect(0).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0319
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, , 3]);
      let reducedRightValue = array.reduceRight((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0);
      expect(4).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0355
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([5]);
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0);
      expect(5).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0390
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([,]);
      let reducedRightValue = array.reduceRight((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0);
      expect(0).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0423
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from(['a', 'b', 'c', 'd']);
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, '');
      expect('dcba').assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0454
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([Math.floor(1.5)]);
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, 0);
      expect(1).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0484
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE]);
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, Infinity);
      expect(Infinity).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0510
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([123.456, 0xcafebabe, 0x0102]);
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, 0x01020304);
      expect(3422601023.456).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number  SUB_ARRAY_REDUCERIGHT_BIND_0100
     * @tc.name    testArrayReduceRightBind0001
     * @tc.desc    Verify reduceRight detached invocation throws 10200011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testArrayReduceRightBind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new collections.Array<number>(1, 2, 3);
      let fn = arr.reduceRight;
      try {
        fn((a: number, b: number): number => a + b, 0);
        expect().assertFail();
      } catch (error) {
        expect((error as BusinessError).code).assertEqual(10200011);
      }
    });
  })
}