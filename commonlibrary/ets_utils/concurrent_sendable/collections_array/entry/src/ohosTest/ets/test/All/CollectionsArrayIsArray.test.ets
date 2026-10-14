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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import { sleep } from './pages/Utils';
import { collections } from '@kit.ArkTS';

export default function CollectionsArrayIsArray() {
  describe('CollectionsArrayIsArray', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   builtinsArrayIsArrayTest0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0157
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayIsArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0100';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray([])).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0197
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayIsArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0200';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray([1, 2, 3])).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0236
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayIsArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0300';
      console.info(`${caseName} test start`);
      try {
        const arr = new collections.Array("");
        expect(collections.Array.isArray(arr)).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0275
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0400';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(new collections.Array(1, 2, 3))).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0313
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0500';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray({})).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0349
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0600';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray(null)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0384
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0700';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(undefined)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0418
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0800';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray(42)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest0900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0449
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest0900';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray('test')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0479
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1000';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(true)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0505
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1100';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray(false)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0529
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1200';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray(() => {
        })).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0547
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1300';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray(new collections.Uint8Array([1, 2, 3]))).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0564
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1400';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0580
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1500';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray('undefined')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0595
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1600';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray('null')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0609
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1700';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray('')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1800
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0623
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1800';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray('\u7b11')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest1900
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0636
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest1900';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray('\uFFFD')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2000
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0648
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2000';
      console.info(`${caseName} test start`);

      try {
        expect(Array.isArray(Math.floor(1.5))).assertFalse();
        expect(Array.isArray(0)).assertFalse();
        expect(Array.isArray(-0)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0659
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2100';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(Number.EPSILON)).assertFalse();
        expect(Array.isArray(Number.MIN_VALUE)).assertFalse();
        expect(Array.isArray(Number.MAX_VALUE)).assertFalse();
        expect(Array.isArray(-Infinity)).assertFalse();
        expect(Array.isArray(Infinity)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2200
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0669
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2200';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(123.456)).assertFalse();
        expect(Array.isArray(0xcafebabe)).assertFalse();
        expect(Array.isArray(0x0102)).assertFalse();
        expect(Array.isArray(0x01020304)).assertFalse();
        expect(Array.isArray(0x3)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2300
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0677
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2300';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(true)).assertFalse();
        expect(Array.isArray(false)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2400
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0685
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2400';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(!'s')).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2500
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0691
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2500';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(!0)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2600
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0696
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2600';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(NaN)).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayIsArrayTest2700
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARRAY_ALL_0701
     * @tc.desc   Testing isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIsArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayIsArrayTest2700';
      console.info(`${caseName} test start`);
      try {
        expect(Array.isArray(123)).assertFalse();
        expect(Array.isArray([123, 'a'])).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}