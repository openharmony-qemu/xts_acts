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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsFloatFourthPrototypebTest() {
  describe('builtinsFloatFourthPrototypebTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0100
     * @tc.name builtinsFloatFourthPrototypebTest0100
     * @tc.desc test sub(other: Float): Float (positive - positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Float(5.5);
        const b = new Float(2.2);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(3.3 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0200
     * @tc.name builtinsFloatFourthPrototypebTest0200
     * @tc.desc test sub(other: Float): Float (positive - negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Float(5.5);
        const b = new Float(-2.2);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(7.7 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0300
     * @tc.name builtinsFloatFourthPrototypebTest0300
     * @tc.desc test sub(other: Float): Float (negative - positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Float(-5.5);
        const b = new Float(2.2);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(-7.7 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0400
     * @tc.name builtinsFloatFourthPrototypebTest0400
     * @tc.desc test sub(other: Float): Float (zero - positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(2.2);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(-2.2 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0500
     * @tc.name builtinsFloatFourthPrototypebTest0500
     * @tc.desc test sub(other: Float): Float (positive - zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Float(2.2);
        const b = new Float(0.0);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(2.2 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0600
     * @tc.name builtinsFloatFourthPrototypebTest0600
     * @tc.desc test sub(other: Float): Float (max - min)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(Number.MIN_VALUE);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(Float.MAX_VALUE - Number.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0700
     * @tc.name builtinsFloatFourthPrototypebTest0700
     * @tc.desc test sub(other: Float): Float (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Float(1.0);
        const b = new Float(NaN);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(Number.isNaN(result)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0800
     * @tc.name builtinsFloatFourthPrototypebTest0800
     * @tc.desc test sub(other: Float): Float (Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.sub(b);
        expect(result instanceof Float).assertEqual(true);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_0900
     * @tc.name builtinsFloatFourthPrototypebTest0900
     * @tc.desc test toString(r: int): String (decimal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Float(10.5);
        expect(a.toString(10)).assertEqual('10.5');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1000
     * @tc.name builtinsFloatFourthPrototypebTest1000
     * @tc.desc test toString(r: int): String (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Float(10.5);
        expect(a.toString(2)).assertEqual('1010.1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1100
     * @tc.name builtinsFloatFourthPrototypebTest1100
     * @tc.desc test toString(r: int): String (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Float(10.5);
        expect(a.toString(8)).assertEqual('12.4');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1200
     * @tc.name builtinsFloatFourthPrototypebTest1200
     * @tc.desc test toString(r: int): String (hexadecimal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Float(10.5);
        expect(a.toString(16)).assertEqual('a.8');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1300
     * @tc.name builtinsFloatFourthPrototypebTest1300
     * @tc.desc test toString(r: int): String (negative number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Float(-10.5);
        expect(a.toString(10)).assertEqual('-10.5');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1400
     * @tc.name builtinsFloatFourthPrototypebTest1400
     * @tc.desc test toString(r: int): String (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a.toString(10)).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1500
     * @tc.name builtinsFloatFourthPrototypebTest1500
     * @tc.desc test toString(r: int): String (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(a.toString(10)).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1600
     * @tc.name builtinsFloatFourthPrototypebTest1600
     * @tc.desc test toString(r: int): String (Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(Number.NEGATIVE_INFINITY);
        expect(a.toString(10)).assertEqual('Infinity');
        expect(b.toString(10)).assertEqual('-Infinity');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1700
     * @tc.name builtinsFloatFourthPrototypebTest1700
     * @tc.desc test unboxed(): float (正数)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Float(123.456);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(123.456 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1800
     * @tc.name builtinsFloatFourthPrototypebTest1800
     * @tc.desc test unboxed(): float (负数)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Float(-789.123);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(-789.123 as float);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_1900
     * @tc.name builtinsFloatFourthPrototypebTest1900
     * @tc.desc test unboxed(): float (零)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_2000
     * @tc.name builtinsFloatFourthPrototypebTest2000
     * @tc.desc test unboxed(): float (NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(Number.isNaN(result)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_2100
     * @tc.name builtinsFloatFourthPrototypebTest2100
     * @tc.desc test unboxed(): float (Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_2200
     * @tc.name builtinsFloatFourthPrototypebTest2200
     * @tc.desc test unboxed(): float (-Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_2300
     * @tc.name builtinsFloatFourthPrototypebTest2300
     * @tc.desc test unboxed(): float (MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_FOURTH_PROTOTYPEB_TEST_2400
     * @tc.name builtinsFloatFourthPrototypebTest2400
     * @tc.desc test unboxed(): float (MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatFourthPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatFourthPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const result = a.unboxed();
        expect(typeof result).assertEqual('number');
        expect(result).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


  })
}