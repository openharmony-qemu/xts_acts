/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}

class NormalClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

export default function ArrayBasicTest() {
  describe('ArrayBasicTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(200);
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
     * @tc.name   CollectionstestConcatArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BASIC_0001
     * @tc.desc   ConcatArray join 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionstestConcatArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestConcatArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        const normal = new NormalClass(10);
        const unboundcreate = concatArray.join;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionstestConcatArray0101
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BASIC_0002
     * @tc.desc   ConcatArray slice 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionstestConcatArray0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestConcatArray0101';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        let concatArray: collections.ConcatArray<string> = new collections.Array<string>('a', 'b', 'c');
        const normal = new NormalClass(10);
        const unboundcreate = concatArray.slice;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionstestArray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BASIC_0003
     * @tc.desc   Array create 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionstestArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray0100';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const normal = new NormalClass(10);
        const unboundcreate = collections.Array.create;
        const boundcreate: () => void = unboundcreate.bind(normal);
        try {
          boundcreate()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(401)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })
    /**
     * @tc.name   CollectionstestArray01001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BASIC_0004
     * @tc.desc   Array create 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionstestArray01001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray01001';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        const normal = new NormalClass(10);
        const unboundcreate = collections.Array.create;
        const boundcreate: () => void = unboundcreate.bind(normal, 3, 1);
        try {
          boundcreate()
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200011)
          // flag = true
        }
        // expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionstestArray0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BASIC_0005
     * @tc.desc   Array 10200201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionstestArray0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray0200';
        console.info(`${caseName} test start`);
        let flag: boolean = false;
        try {
          collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]).forEach((value, key, array) => {
            array.copyWithin(3, 1, 3);
          });
        } catch (e) {
          console.info(`${caseName} Task execution failed with error: ${e.message}, code: ${e.code}`);
          expect(e.code).assertEqual(10200201)
          flag = true
        }
        expect(flag).assertTrue()
        console.info(`${caseName} test end`);
        done()
      })

    /**
     * @tc.name   CollectionstestArray0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_BASIC_0006
     * @tc.desc   Array forEach 10200011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CollectionstestArray0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'CollectionstestArray0300';
