/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function math02Test() {

  describe("math02Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  TEST_MATH_POWER70001
     * @tc.name    testmathpower70001
     * @tc.desc    Test power2 function with positive infinity exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70001 start');
        try {
          const result = power2(Infinity);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70001 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70001 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70002
     * @tc.name    testmathpower70002
     * @tc.desc    Test power2 function with negative infinity exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70002 start');
        try {
          const result = power2(-Infinity);
          expect(result === 0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70002 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70002 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70003
     * @tc.name    testmathpower70003
     * @tc.desc    Test power2 function with NaN exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70003 start');
        try {
          const result = power2(NaN);
          expect(result !== result).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70003 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70003 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70004
     * @tc.name    testmathpower70004
     * @tc.desc    Test power2 function with positive zero exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70004 start');
        try {
          const result = power2(0.0);
          expect(result === 1.0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70004 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70004 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70005
     * @tc.name    testmathpower70005
     * @tc.desc    Test power2 function with negative zero exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70005 start');
        try {
          const result = power2(-0.0);
          expect(result === 1.0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70005 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70005 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70006
     * @tc.name    testmathpower70006
     * @tc.desc    Test power2 function with positive integer exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70006 start');
        try {
          const result = power2(3);
          expect(result === 8).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70006 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70006 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70007
     * @tc.name    testmathpower70007
     * @tc.desc    Test power2 function with negative integer exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70007 start');
        try {
          const result = power2(-3);
          expect(result === 0.125).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70007 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70007 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70008
     * @tc.name    testmathpower70008
     * @tc.desc    Test power2 function with positive fractional exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70008 start');
        try {
          const result = power2(0.5);
          expect(result === Math.sqrt(2)).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70008 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70008 end');
        }
      });

    /**
     * @tc.number  tTEST_MATH_POWER70009
     * @tc.name    testmathpower70009
     * @tc.desc    Test power2 function with negative fractional exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70009 start');
        try {
          const result = power2(-0.5);
          const expected = 1 / Math.sqrt(2);
          const epsilon = 1e-6;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70009 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70009 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70010
     * @tc.name    testmathpower70010
     * @tc.desc    Test power2 function with exponent as positive infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70010 start');
        try {
          const result = power2(Infinity);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70010 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70010 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70011
     * @tc.name    testmathpower70011
     * @tc.desc    Test power2 function with exponent 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70011 start');
        try {
          const result = power2(1);
          expect(result === 2).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70011 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70011 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70012
     * @tc.name    testmathpower70012
     * @tc.desc    Test power2 function with exponent -1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70012 start');
        try {
          const result = power2(-1);
          expect(result === 0.5).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70012 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70012 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70013
     * @tc.name    testmathpower70013
     * @tc.desc    Test power2 function with exponent 1024 (overflow)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70013 start');
        try {
          const result = power2(1024);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70013 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70013 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70015
     * @tc.name    testmathpower70015
     * @tc.desc    Test power2 function with exponent 1023 (max finite value)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70015 start');
        try {
          const result = power2(1023);
          const expected = 8.98846567431158e307;
          const epsilon = 1e292;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70015 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70015 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70016
     * @tc.name    testmathpower70016
     * @tc.desc    Test power2 function with exponent -1023 (min non-zero value)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70016 start');
        try {
          const result = power2(-1023);
          const expected = 1.1125369292536007e-308;
          const epsilon = 1e-320;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70016 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70016 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70017
     * @tc.name    testmathpower70017
     * @tc.desc    Test power2 function with exponent 2.5
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70017 start');
        try {
          const result = power2(2.5);
          const expected = 4 * Math.sqrt(2);
          const epsilon = 1e-6;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70017 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70017 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70018
     * @tc.name    testmathpower70018
     * @tc.desc    Test power2 function with exponent -2.5
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70018 start');
        try {
          const result = power2(-2.5);
          const expected = 1 / (4 * Math.sqrt(2));
          const epsilon = 1e-6;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70018 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70018 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70019
     * @tc.name    testmathpower70019
     * @tc.desc    Test power2 function with exponent Number.MAX_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70019 start');
        try {
          const result = power2(Number.MAX_SAFE_INTEGER);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70019 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70019 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70020
     * @tc.name    testmathpower70020
     * @tc.desc    Test power2 function with exponent Number.MIN_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70020 start');
        try {
          const result = power2(Number.MIN_SAFE_INTEGER);
          expect(result === 0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70020 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70020 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70021
     * @tc.name    testmathpower70021
     * @tc.desc    Test power2 with exponent as MAX_VALUE
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70021 start');
        try {
          const result = power2(Number.MAX_VALUE);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70021 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70021 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70022
     * @tc.name    testmathpower70022
     * @tc.desc    Test power2 with exponent as MIN_VALUE
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70022 start');
        try {
          const result = power2(Number.MIN_VALUE);
          const epsilon = 1e-15;
          const isClose = Math.abs(result - 1) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70022 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70022 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70023
     * @tc.name    testmathpower70023
     * @tc.desc    Test power2 with exponent as EPSILON
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70023 start');
        try {
          const result = power2(Number.EPSILON);
          const expected = 1 + Number.EPSILON * Math.LN2;
          const epsilon = 1e-15;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70023 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70023 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70025
     * @tc.name    testmathpower70025
     * @tc.desc    Test power2 with exponent 53 (max safe integer boundary)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70025 start');
        try {
          const result = power2(53);
          expect(result === 9007199254740992).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70025 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70025 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70026
     * @tc.name    testmathpower70026
     * @tc.desc    Test power2 with exponent -1074 (smallest denormalized)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70026 start');
        try {
          const result = power2(-1074);
          expect(result === Number.MIN_VALUE).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70026 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70026 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70027
     * @tc.name    testmathpower70027
     * @tc.desc    Test power2 with exponent 0.0001 (small positive fraction)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70027 start');
        try {
          const result = power2(0.0001);
          const expected = Math.pow(2, 0.0001);
          const epsilon = 1e-15;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70027 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70027 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70028
     * @tc.name    testmathpower70028
     * @tc.desc    Test power2 with exponent -0.0001 (small negative fraction)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathpower70028 start');
        try {
          const result = power2(-0.0001);
          const expected = Math.pow(2, -0.0001);
          const epsilon = 1e-15;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70028 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathpower70028 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80001
     * @tc.name    testmathrandom80001
     * @tc.desc    Test random function returns a value in [0.0, 1.0)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathrandom80001 start');
        try {
          const result = random();
          expect(result >= 0.0 && result < 1.0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathrandom80001 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathrandom80001 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80002
     * @tc.name    testmathrandom80002
     * @tc.desc    Test random function without seed
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testmathrandom80002 start');
        try {
          const result1 = random();
          const result2 = random();
          expect(result1 !== result2).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s, error: %{public}s', 'testmathrandom80002 failed:', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testmathrandom80002 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80004
     * @tc.name    testmathrandom80004
     * @tc.desc    Verify different seeds produce different sequences
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testSeedChangeBehavior start');
        try {
          seedRandom(999);
          const seqA = random();
          seedRandom(1000);
          const seqB = random();
          expect(seqA === seqB).assertFalse();
        } catch (error) {
          hilog.error(domain, tag, 'Seed change test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testSeedChangeBehavior end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80006
     * @tc.name    testmathrandom80006
     * @tc.desc    Verify minimum return value boundary
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomLowerBound start');
        try {
          let minValue = 1.0;
          for (let i = 0; i < 100; i++) {
            const val = random();
            if (val < minValue) {
              minValue = val;
            }
          }
          expect(minValue).assertLargerOrEqual(0.0);
          hilog.info(domain, tag, 'Minimum observed value: %{public}f', minValue);
        } catch (error) {
          hilog.error(domain, tag, 'Lower bound test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomLowerBound end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80007
     * @tc.name     testmathrandom80007
     * @tc.desc    Verify maximum return value is strictly less than 1.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomUpperBound start');
        try {
          let maxValue = 0.0;
          for (let i = 0; i < 100; i++) {
            const val = random();
            if (val > maxValue) {
              maxValue = val;
            }
          }
          expect(maxValue).assertLess(1.0);
          hilog.info(domain, tag, 'Maximum observed value: %{public}f', maxValue);
        } catch (error) {
          hilog.error(domain, tag, 'Upper bound test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomUpperBound end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80009
     * @tc.name    testmathrandom80009
     * @tc.desc    Verify values span the full [0.0, 1.0) range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomValueSpread start');
        try {
          let hasNearZero = false;
          let hasNearOne = false;
          for (let i = 0; i < 100; i++) {
            const val = random();
            if (val < 0.1) {
              hasNearZero = true;
            }
            if (val > 0.9) {
              hasNearOne = true;
            }
          }
          expect(hasNearZero && hasNearOne).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, 'Value spread test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomValueSpread end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80010
     * @tc.name    testmathrandom80010
     * @tc.desc    Verify negative seeds produce valid sequences
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomWithNegativeSeed start');
        try {
          seedRandom(-123456);
          const result = random();
          expect(result >= 0.0 && result < 1.0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, 'Negative seed test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomWithNegativeSeed end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80011
     * @tc.name    testmathrandom80011
     * @tc.desc    Verify consecutive values in a sequence are distinct
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomSequenceUniqueness start');
        try {
          const values = new Set<number>();
          const sequenceLength = 100;
          for (let i = 0; i < sequenceLength; i++) {
            values.add(random());
          }
          expect(values.size).assertLarger(sequenceLength * 0.99);
        } catch (error) {
          hilog.error(domain, tag, 'Sequence uniqueness test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomSequenceUniqueness end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80012
     * @tc.name    testmathrandom80012
     * @tc.desc    Verify sequence continues correctly without reseeding
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomWithoutReseeding start');
        try {
          seedRandom(100);
          const first = random();
          const second = random();
          const third = random();
          expect(first !== second && second !== third).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, 'Sequence continuation test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomWithoutReseeding end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80013
     * @tc.name    testmathrandom80013
     * @tc.desc    Verify seed=0 produces valid sequence
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomWithZeroSeed start');
        try {
          seedRandom(0);
          const result = random();
          expect(result >= 0.0 && result < 1.0).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, 'Zero seed test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomWithZeroSeed end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80015
     * @tc.name    testmathrandom80015
     * @tc.desc    Verify reseeding changes sequence mid-stream
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testRandomAfterReseed start');
        try {
          seedRandom(555);
          const val1 = random();
          const val2 = random();
          seedRandom(556);
          const val3 = random();
          expect(val1 === val3).assertFalse();
        } catch (error) {
          hilog.error(domain, tag, 'Mid-sequence reseed test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'testRandomAfterReseed end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90001
     * @tc.name    testmathrem90001
     * @tc.desc    Verify remainder when dividend is zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'ZeroDividend start');
        try {
          expect(rem(0.0, 5.5)).assertEqual(0.0);
          expect(rem(0.0, -3.2)).assertEqual(0.0);
        } catch (error) {
          hilog.error(domain, tag, 'ZeroDividend failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'ZeroDividend end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90002
     * @tc.name    testmathrem90002
     * @tc.desc    Verify remainder with special values (Infinity/NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'SpecialValues start');
        try {
          expect(isNaN(rem(NaN, 2.0))).assertTrue();
          expect(isNaN(rem(2.0, NaN))).assertTrue();
          expect(isNaN(rem(Infinity, 2.0))).assertTrue();
          expect(isNaN(rem(-Infinity, 2.0))).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, 'SpecialValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'SpecialValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90003
     * @tc.name    testmathrem90003
     * @tc.desc    Verify remainder when divisor is zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'DivisorZero start');
        try {
          expect(isNaN(rem(5.5, 0.0))).assertTrue();
          expect(isNaN(rem(-3.2, 0.0))).assertTrue();
        } catch (error) {
          hilog.error(domain, tag, 'DivisorZero failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'DivisorZero end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90004
     * @tc.name    testmathrem90004
     * @tc.desc    Verify banker's rounding behavior
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingBehavior start');
        try {
          expect(rem(5.0, 2.0)).assertEqual(1.0);
          expect(rem(7.0, 2.0)).assertEqual(-1.0);
          expect(rem(9.0, 2.0)).assertEqual(1.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingBehavior failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingBehavior end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90005
     * @tc.name    testmathrem90005
     * @tc.desc    Verify remainder for positive dividends and divisors
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PositiveDivision start');
        try {
          expect(rem(6.0, 3.0)).assertEqual(0.0);
          expect(rem(10.0, 3.0)).assertEqual(1.0);
          expect(rem(11.0, 4.0)).assertEqual(-1.0);
          expect(rem(8.5, 1.0)).assertEqual(0.5);
        } catch (error) {
          hilog.error(domain, tag, 'PositiveDivision failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'PositiveDivision end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90006
     * @tc.name    testmathrem90006
     * @tc.desc    Verify remainder with negative dividends
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'NegativeDividend start');
        try {
          expect(rem(-5.0, 2.0)).assertEqual(-1.0);
          expect(rem(-7.5, 1.0)).assertEqual(0.5);
          expect(rem(-11.0, 4.0)).assertEqual(1.0);
        } catch (error) {
          hilog.error(domain, tag, 'NegativeDividend failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'NegativeDividend end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90007
     * @tc.name    testmathrem90007
     * @tc.desc    Verify remainder with negative divisors
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'NegativeDivisor start');
        try {
          expect(rem(5.0, -2.0)).assertEqual(1.0);
          expect(rem(8.5, -1.0)).assertEqual(0.5);
          expect(rem(10.0, -3.0)).assertEqual(1.0);
        } catch (error) {
          hilog.error(domain, tag, 'NegativeDivisor failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'NegativeDivisor end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90009
     * @tc.name    testmathrem9009_01
     * @tc.desc    Verify remainder when |dividend| < |divisor|
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem9009_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'SmallDividend start');
        try {
          expect(rem(2.5, 5.0)).assertEqual(2.5);
          expect(rem(3.5, 7.0)).assertEqual(3.5);
          expect(rem(3.0, 5.0)).assertEqual(-2.0);
        } catch (error) {
          hilog.error(domain, tag, 'SmallDividend failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'SmallDividend end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10001
     * @tc.name    testmathround10001
     * @tc.desc    Verify basic rounding behavior (positive/negative)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingBasic start');
        try {
          expect(round(2.3)).assertEqual(2.0);
          expect(round(2.7)).assertEqual(3.0);
          expect(round(5.0)).assertEqual(5.0);
          expect(round(-2.3)).assertEqual(-2.0);
          expect(round(-2.7)).assertEqual(-3.0);
          expect(round(-5.0)).assertEqual(-5.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingBasic failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingBasic end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10002
     * @tc.name    testmathround10002
     * @tc.desc    Verify special value handling (NaN/Infinity)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingSpecial start');
        try {
          expect(isNaN(round(NaN))).assertTrue();
          expect(round(Infinity)).assertEqual(Infinity);
          expect(round(-Infinity)).assertEqual(-Infinity);
          expect(round(0.0)).assertEqual(0.0);
          expect(round(-0.0)).assertEqual(-0.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingSpecial failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingSpecial end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10003
     * @tc.name    testmathround10003
     * @tc.desc    Verify rounding at midpoint (0.5) with even/odd integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingHalfway start');
        try {
          expect(round(2.5)).assertEqual(3.0);
          expect(round(3.5)).assertEqual(4.0);
          expect(round(4.5)).assertEqual(5.0);
          expect(round(-2.5)).assertEqual(-2.0);
          expect(round(-3.5)).assertEqual(-3.0);
          expect(round(-4.5)).assertEqual(-4.0);
          expect(round(0.5)).assertEqual(1.0);
          expect(round(-0.5)).assertEqual(-0.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingHalfway failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingHalfway end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10005
     * @tc.name    testmathround10005
     * @tc.desc    Verify integer values remain unchanged
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingIntegers start');
        try {
          expect(round(0.0)).assertEqual(0.0);
          expect(round(1.0)).assertEqual(1.0);
          expect(round(1000000.0)).assertEqual(1000000.0);
          expect(round(-0.0)).assertEqual(-0.0);
          expect(round(-1.0)).assertEqual(-1.0);
          expect(round(-1000000.0)).assertEqual(-1000000.0);
          expect(round(1e15)).assertEqual(1000000000000000.0);
          expect(round(-2e20)).assertEqual(-200000000000000000000.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingIntegers failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingIntegers end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10006
     * @tc.name    testmathround10006
     * @tc.desc    Verify denormalized number handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingSubnormal start');
        try {
          const minDouble = Number.MIN_VALUE;
          expect(round(minDouble)).assertEqual(0.0);
          expect(round(-minDouble)).assertEqual(-0.0);
          expect(round(0.0000000000000001)).assertEqual(0.0);
          expect(round(-0.0000000000000001)).assertEqual(-0.0);
          expect(round(0.5000000000000001)).assertEqual(1.0);
          expect(round(-0.5000000000000001)).assertEqual(-1.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingSubnormal failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingSubnormal end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10007
     * @tc.name    testmathround10007
     * @tc.desc    Verify rounding of large numbers (within safe integer range)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingLargeValues start');
        try {
          const maxSafeInt = 9007199254740991;
          expect(round(maxSafeInt - 0.5)).assertEqual(maxSafeInt - 1);
          expect(round(maxSafeInt + 0.4)).assertEqual(maxSafeInt);
          expect(round(maxSafeInt + 0.5)).assertEqual(maxSafeInt + 1);
          expect(round(-maxSafeInt + 0.5)).assertEqual(-maxSafeInt + 1);
          expect(round(-maxSafeInt - 0.5)).assertEqual(-maxSafeInt - 1);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingLargeValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingLargeValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10009
     * @tc.name    testmathround10009
     * @tc.desc    Verify rounding of tiny fractional values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingTinyValues start');
        try {
          expect(round(Number.MIN_VALUE * 2)).assertEqual(0.0);
          expect(round(0.0000000000000001)).assertEqual(0.0);
          expect(round(0.49999999999999994)).assertEqual(1.0);
          expect(round(-Number.MIN_VALUE * 3)).assertEqual(-0.0);
          expect(round(-0.0000000000000001)).assertEqual(-0.0);
          expect(round(-0.49999999999999994)).assertEqual(-0.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingTinyValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingTinyValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10010
     * @tc.name    testmathround10010
     * @tc.desc    Verify rounding at extreme values (near Number.MAX_VALUE)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingExtremes start');
        try {
          const maxValue = Number.MAX_VALUE;
          expect(round(maxValue)).assertEqual(maxValue);
          expect(round(-maxValue)).assertEqual(-maxValue);
          expect(round(maxValue - 0.5)).assertEqual(maxValue);
          expect(round(-maxValue + 0.5)).assertEqual(-maxValue + 1);
          expect(round(Infinity)).assertEqual(Infinity);
          expect(round(-Infinity)).assertEqual(-Infinity);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingExtremes failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingExtremes end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10011
     * @tc.name    testmathround10011
     * @tc.desc    Verify edge cases in decimal representations
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'RoundingDecimalEdgeCases start');
        try {
          expect(round(1.23456789)).assertEqual(1.0);
          expect(round(-9.87654321)).assertEqual(-10.0);
          expect(round(123456789.5)).assertEqual(123456790.0);
          expect(round(-123456789.5)).assertEqual(-123456789.0);
          expect(round(0.1 + 0.2)).assertEqual(0.0);
          expect(round(-(0.1 + 0.2))).assertEqual(-0.0);
        } catch (error) {
          hilog.error(domain, tag, 'RoundingDecimalEdgeCases failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'RoundingDecimalEdgeCases end');
        }
      });

    /**
     * @tc.number  TEST_MATH_MATH_11001
     * @tc.name    testmath11001
     * @tc.desc    Verify handling of NaN and infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ScalbnSpecialValues start');
      try {
        expect(isNaN(scalbn(NaN, 5))).assertTrue();
        expect(scalbn(Infinity, 10)).assertEqual(Infinity);
        expect(scalbn(-Infinity, -5)).assertEqual(-Infinity);
      } catch (error) {
        hilog.error(domain, tag, 'ScalbnSpecialValues failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        hilog.info(domain, tag, '%{public}s', 'ScalbnSpecialValues end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11002
     * @tc.name    testmath11002
     * @tc.desc    Verify handling at exponent boundaries
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ScalbnExponentBoundaries start');
      try {
        expect(scalbn(1.0, 1024)).assertEqual(Infinity);
        expect(scalbn(1.0, -1075)).assertEqual(0);
        expect(scalbn(Number.MAX_VALUE, 1)).assertEqual(Infinity);
        expect(scalbn(Number.MIN_VALUE, -1)).assertEqual(0);
      } catch (error) {
        hilog.error(domain, tag, 'ScalbnExponentBoundaries failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        hilog.info(domain, tag, '%{public}s', 'ScalbnExponentBoundaries end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11003
     * @tc.name    testmath11003
     * @tc.desc    Verify edge case handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ScalbnSpecialCases start');
      try {
        expect(scalbn(Number.MAX_SAFE_INTEGER, 1)).assertEqual(Number.MAX_SAFE_INTEGER * 2);
        expect(scalbn(Number.MIN_SAFE_INTEGER, 1)).assertEqual(Number.MIN_SAFE_INTEGER * 2);
        const minDouble = Number.MIN_VALUE;
        expect(scalbn(minDouble, 1)).assertEqual(minDouble * 2);
        expect(scalbn(minDouble, -1)).assertEqual(0);
        expect(scalbn(1.7976931348623157e308, 1)).assertEqual(Infinity);
      } catch (error) {
        hilog.error(domain, tag, 'ScalbnSpecialCases failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        hilog.info(domain, tag, '%{public}s', 'ScalbnSpecialCases end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11004
     * @tc.name    testmath11004
     * @tc.desc    Verify basic scaling operations
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ScalbnBasicOperations start');
      try {
        expect(scalbn(3, 2)).assertEqual(12);
        expect(scalbn(1.5, 3)).assertEqual(12);
        expect(scalbn(0.5, -1)).assertEqual(0.25);
        expect(scalbn(-2, 4)).assertEqual(-32);
        expect(scalbn(-0.25, -2)).assertEqual(-0.0625);
        expect(scalbn(123.456, 0)).assertEqual(123.456);
        expect(scalbn(-789.012, 0)).assertEqual(-789.012);
      } catch (error) {
        hilog.error(domain, tag, 'ScalbnBasicOperations failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        hilog.info(domain, tag, '%{public}s', 'ScalbnBasicOperations end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11005
     * @tc.name    testmath11005
     * @tc.desc    Verify precision handling for fractional values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ScalbnPrecisionHandling start');
      try {
        expect(scalbn(1.000000000000001, 50))
          .assertClose(1.1258999068426243e15, 1e-2);
        const result1 = scalbn(0.9999999999999999, -40);
        const expected1 = 9.094947017729283e-13;
        expect(Math.abs(result1 - expected1) < 1e-25).assertTrue();
        expect(scalbn(Number.EPSILON, 52)).assertClose(1, 1e-15);
        const result2 = scalbn(1 + Number.EPSILON, 0);
        const expected2 = 1.0000000000000002;
        expect(Math.abs(result2 - expected2) < 1e-16).assertTrue();
      } catch (error) {
        hilog.error(domain, tag, 'ScalbnPrecisionHandling failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        hilog.info(domain, tag, '%{public}s', 'ScalbnPrecisionHandling end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11008
     * @tc.name    testmath11008
     * @tc.desc    Verify handling of extreme exponent values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'ScalbnExtremeValues start');
      try {
        expect(scalbn(1, 1023)).assertClose(8.98846567431158e307, 1e292);
        expect(scalbn(1, 1024)).assertEqual(Infinity);
        const minValue = scalbn(1, -1074);
        expect(minValue > 0).assertTrue();
        expect(minValue).assertEqual(5e-324);
        expect(scalbn(1, -1075)).assertEqual(0);
        expect(scalbn(Number.MAX_VALUE, 1)).assertEqual(Infinity);
        expect(scalbn(Number.MAX_VALUE, -1)).assertClose(8.98846567431158e307, 1e292);
        expect(scalbn(-Number.MAX_VALUE, 1)).assertEqual(-Infinity);
        expect(scalbn(-Number.MAX_VALUE, -1)).assertClose(-8.98846567431158e307, 1e292);
      } catch (error) {
        hilog.error(domain, tag, 'ScalbnExtremeValues failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        hilog.info(domain, tag, '%{public}s', 'ScalbnExtremeValues end');
      }
    });

    /**
     * @tc.number  TEST_MATH_SIGN_12001
     * @tc.name    testmathsign12001
     * @tc.desc    Verify trunc function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12001 start');
        try {
          expect(trunc(3.2)).assertEqual(3.0);
          expect(trunc(5.9)).assertEqual(5.0);
          expect(trunc(7.0)).assertEqual(7.0);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12001 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12002
     * @tc.name    testmathsign12002
     * @tc.desc    Verify trunc function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12002 start');
        try {
          expect(trunc(-3.2)).assertEqual(-3.0);
          expect(trunc(-5.9)).assertEqual(-5.0);
          expect(trunc(-7.0)).assertEqual(-7.0);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12002 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12003
     * @tc.name    testmathsign12003
     * @tc.desc    Verify trunc function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12003 start');
        try {
          expect(trunc(0.0)).assertEqual(0.0);
          expect(trunc(-0.0)).assertEqual(-0.0);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12003 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12004
     * @tc.name    testmathsign12004_01
     * @tc.desc    Verify trunc function with very small numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12004_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12004_01 start');
        try {
          expect(trunc(1e-14)).assertEqual(0.0);
          expect(trunc(-1e-14)).assertEqual(-0.0);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12004_01 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12004_01: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12005
     * @tc.name    testmathsign12005
     * @tc.desc    Verify trunc function with very large numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it(' testmathsign12005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12005 start');
        try {
          expect(trunc(Number.MAX_VALUE)).assertEqual(Number.MAX_VALUE);
          expect(trunc(-Number.MAX_VALUE)).assertEqual(-Number.MAX_VALUE);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12005 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12006
     * @tc.name    testmathsign12006
     * @tc.desc    Verify trunc function with infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it(' testmathsign12006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12006 start');
        try {
          expect(trunc(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
          expect(trunc(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12006 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12007
     * @tc.name    testmathsign12007
     * @tc.desc    Verify trunc function with NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12007 start');
        try {
          expect(Number.isNaN(trunc(Number.NaN))).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'testMathSign12007 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12007: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12008
     * @tc.name    testmathsign12008
     * @tc.desc    Verify sign function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12008 start');
        try {
          expect(sign(3.2)).assertEqual(1);
          expect(sign(5.9)).assertEqual(1);
          expect(sign(7.0)).assertEqual(1);
          expect(sign(Number.MAX_VALUE)).assertEqual(1);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12008 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12008: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12009
     * @tc.name    testmathsign12009
     * @tc.desc    Verify sign function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12009 start');
        try {
          expect(sign(-3.2)).assertEqual(-1);
          expect(sign(-5.9)).assertEqual(-1);
          expect(sign(-7.0)).assertEqual(-1);
          expect(sign(-Number.MAX_VALUE)).assertEqual(-1);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12009 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12010
     * @tc.name    testmathsign12010_01
     * @tc.desc    Verify sign function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12010_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12010_01 start');
        try {
          expect(sign(0.0)).assertEqual(0);
          expect(sign(-0.0)).assertEqual(0);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12010_01 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12010_01: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12011
     * @tc.name    testmathsign12011
     * @tc.desc    Verify sign function with positive infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12011 start');
        try {
          expect(sign(Number.POSITIVE_INFINITY)).assertEqual(1);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12011 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12011: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12012
     * @tc.name    testmathsign12012
     * @tc.desc    Verify sign function with negative infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12012 start');
        try {
          expect(sign(Number.NEGATIVE_INFINITY)).assertEqual(-1);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12012 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12012: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12016
     * @tc.name    testMathSign12016
     * @tc.desc    Verify sign function with values exactly at the 1e-13 threshold
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign12016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12016 start');
        try {
          expect(sign(1e-13)).assertEqual(1);
          expect(sign(-1e-13)).assertEqual(-1);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12016 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12016: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12018
     * @tc.name    testMathSign12018
     * @tc.desc    Verify sign function correctly handles values around zero
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign12018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSign12018 start');
        try {
          expect(sign(9e-14)).assertEqual(1);
          expect(sign(1.1e-13)).assertEqual(1);
          expect(sign(-9e-14)).assertEqual(-1);
          expect(sign(-1.1e-13)).assertEqual(-1);
          hilog.info(domain, tag, '%{public}s', 'testMathSign12018 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSign12018: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13001
     * @tc.name    testmathnewError13001
     * @tc.desc    Verify sign with common mathematical constants
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathnewError13001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'SignCommonValues start');
        try {
          expect(sign(Math.PI)).assertEqual(1);
          expect(sign(Math.E)).assertEqual(1);
          expect(sign(-Math.PI)).assertEqual(-1);
          expect(sign(-Math.E)).assertEqual(-1);
          expect(sign(Math.LN2)).assertEqual(1);
          expect(sign(Math.LN10)).assertEqual(1);
          expect(sign(-Math.LOG2E)).assertEqual(-1);
          expect(sign(-Math.LOG10E)).assertEqual(-1);
          expect(sign(Math.sin(0))).assertEqual(0);
          expect(sign(Math.cos(Math.PI))).assertEqual(-1);
          expect(sign(Math.tan(Math.PI / 4))).assertEqual(1);
          expect(sign(Math.exp(1))).assertEqual(1);
          expect(sign(Math.exp(0))).assertEqual(1);
          expect(sign(Math.exp(-100))).assertEqual(1);
        } catch (error) {
          hilog.error(domain, tag, 'SignCommonValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          hilog.info(domain, tag, '%{public}s', 'SignCommonValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_1301
     * @tc.name    testMathSignbit13001
     * @tc.desc    Verify signbit function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSignbit13001 start');
        try {
          expect(signbit(3.2)).assertFalse();
          expect(signbit(5.9)).assertFalse();
          expect(signbit(7.0)).assertFalse();
          hilog.info(domain, tag, '%{public}s', 'testMathSignbit13001 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSignbit13001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13002
     * @tc.name    testMathSignbit13002
     * @tc.desc    Verify signbit function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSignbit13002 start');
        try {
          expect(signbit(-3.2)).assertTrue();
          expect(signbit(-5.9)).assertTrue();
          expect(signbit(-7.0)).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'testMathSignbit13002 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSignbit13002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13003
     * @tc.name    testMathSignbit13003
     * @tc.desc    Verify signbit function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'testMathSignbit13003 start');
        try {
          expect(signbit(0.0)).assertFalse();
          expect(signbit(-0.0)).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'testMathSignbit13003 end');
          done();
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `Error in testMathSignbit13003: ${error}`);
          expect().assertFail();
        }
      });
  });
}