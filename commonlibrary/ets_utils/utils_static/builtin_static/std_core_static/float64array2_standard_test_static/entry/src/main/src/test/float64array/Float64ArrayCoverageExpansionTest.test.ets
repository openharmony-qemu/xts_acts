'use static';
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

function assertStoredNegativeZero(value: number): void {
  const actualResult = 1.0 / value;
  const expectedResult: number = -Infinity;
  expect(actualResult).assertEqual(expectedResult);
}

export default function Float64ArrayCoverageExpansionTest(): void {
  describe('Float64ArrayCoverageExpansionTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0010
     * @tc.name testFloat64ArrayCoverageExpansion001
     * @tc.desc Verify toString on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float64Array(0);
      const s1 = arr1.toString();
      const actualResult = s1;
      const expectedResult: string = '';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0020
     * @tc.name testFloat64ArrayCoverageExpansion002
     * @tc.desc Verify toString on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of2 = Float64Array.of(42.0);
      const s2 = of2.toString();
      const actualResult = s2;
      const expectedResult: string = '42';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0030
     * @tc.name testFloat64ArrayCoverageExpansion003
     * @tc.desc Verify toString with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of3 = Float64Array.of(Infinity);
      const s3 = of3.toString();
      const actualResult = s3;
      const expectedResult: string = 'Infinity';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0040
     * @tc.name testFloat64ArrayCoverageExpansion004
     * @tc.desc Verify toString with -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of4 = Float64Array.of(-Infinity);
      const s4 = of4.toString();
      const actualResult = s4;
      const expectedResult: string = '-Infinity';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0050
     * @tc.name testFloat64ArrayCoverageExpansion005
     * @tc.desc Verify toString with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of5 = Float64Array.of(NaN);
      const s5 = of5.toString();
      const actualResult = s5;
      const expectedResult: string = 'NaN';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0060
     * @tc.name testFloat64ArrayCoverageExpansion006
     * @tc.desc Verify toString with -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of6 = Float64Array.of(-0.0);
      const s6 = of6.toString();
      const actualResult = s6;
      const expectedResult: string = '0';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0070
     * @tc.name testFloat64ArrayCoverageExpansion007
     * @tc.desc Verify toString after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(7.0);
      const actualString = arr.toString();
      const expectedString: string = '7,7,7';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0080
     * @tc.name testFloat64ArrayCoverageExpansion008
     * @tc.desc Verify toString with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const _arr = new Float64Array([1.7976931348623157e+308]);
      const s = _arr.toString();
      const actualResult = s;
      const expectedResult: string = '1.7976931348623157e+308';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0090
     * @tc.name testFloat64ArrayCoverageExpansion009
     * @tc.desc Verify toString with decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of11 = Float64Array.of(0.5, 1.5);
      const s11 = of11.toString();
      const actualResult = s11;
      const expectedResult: string = '0.5,1.5';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0100
     * @tc.name testFloat64ArrayCoverageExpansion010
     * @tc.desc Verify valueOf returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0110
     * @tc.name testFloat64ArrayCoverageExpansion011
     * @tc.desc Verify valueOf on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0120
     * @tc.name testFloat64ArrayCoverageExpansion012
     * @tc.desc Verify valueOf returns Float64Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const v = arr.valueOf();
      const actualLength = v.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0130
     * @tc.name testFloat64ArrayCoverageExpansion013
     * @tc.desc Verify valueOf chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      const firstResult = arr.valueOf();
      const secondResult = firstResult.valueOf();
      expect(secondResult).assertEqual(arr);
      const actualElement0 = secondResult.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0140
     * @tc.name testFloat64ArrayCoverageExpansion014
     * @tc.desc Verify join on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr17 = new Float64Array(0);
      const j17 = arr17.join();
      const actualResult = j17;
      const expectedResult: string = '';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0150
     * @tc.name testFloat64ArrayCoverageExpansion015
     * @tc.desc Verify join with multi-char separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of18 = Float64Array.of(1.0, 2.0, 3.0);
      const j18 = of18.join('---');
      const actualResult = j18;
      const expectedResult: string = '1---2---3';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0160
     * @tc.name testFloat64ArrayCoverageExpansion016
     * @tc.desc Verify join with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of19 = Float64Array.of(1.0, NaN, 3.0);
      const j19 = of19.join();
      const actualResult = j19;
      const expectedResult: string = '1,NaN,3';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0170
     * @tc.name testFloat64ArrayCoverageExpansion017
     * @tc.desc Verify join with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const of20 = Float64Array.of(Infinity, -Infinity);
      const j20 = of20.join();
      const actualResult = j20;
      const expectedResult: string = 'Infinity,-Infinity';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0180
     * @tc.name testFloat64ArrayCoverageExpansion018
     * @tc.desc Verify $_get on 2000-element array middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.$_set(1000, 3.14);
      const actualElementAt1000 = arr.$_get(1000);
      const expectedElementAt1000: number = 3.14;
      expect(actualElementAt1000).assertEqual(expectedElementAt1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0190
     * @tc.name testFloat64ArrayCoverageExpansion019
     * @tc.desc Verify $_get on 5000-element array last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5000);
      arr.$_set(4999, 2.718);
      const actualElementAt4999 = arr.$_get(4999);
      const expectedElementAt4999: number = 2.718;
      expect(actualElementAt4999).assertEqual(expectedElementAt4999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0200
     * @tc.name testFloat64ArrayCoverageExpansion020
     * @tc.desc Verify $_get reads subnormal 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0210
     * @tc.name testFloat64ArrayCoverageExpansion021
     * @tc.desc Verify $_get reads -0.0 with sign preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      const actualElement0 = 1.0 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0220
     * @tc.name testFloat64ArrayCoverageExpansion022
     * @tc.desc Verify $_get returns stored numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0230
     * @tc.name testFloat64ArrayCoverageExpansion023
     * @tc.desc Verify $_set Infinity then $_get reads Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      arr.$_set(0, Infinity);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0240
     * @tc.name testFloat64ArrayCoverageExpansion024
     * @tc.desc Verify $_set -Infinity then read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      arr.$_set(0, -Infinity);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0250
     * @tc.name testFloat64ArrayCoverageExpansion025
     * @tc.desc Verify $_set MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -9007199254740991.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -9007199254740991.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0260
     * @tc.name testFloat64ArrayCoverageExpansion026
     * @tc.desc Verify $_set -0.0 preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -0.0);
      const actualElement0 = 1.0 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0270
     * @tc.name testFloat64ArrayCoverageExpansion027
     * @tc.desc Verify $_set multiple writes then read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0280
     * @tc.name testFloat64ArrayCoverageExpansion028
     * @tc.desc Verify $_set overwrites previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 1.0);
      arr.$_set(0, 99.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0290
     * @tc.name testFloat64ArrayCoverageExpansion029
     * @tc.desc Verify $_iterator on 1000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1000);
      let count: int = 0;
      for (const v of arr) {
        const actualResult = v;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
        count++;
      }
      const actualResultSecond = count;
      const expectedResultSecond: number = 1000;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0300
     * @tc.name testFloat64ArrayCoverageExpansion030
     * @tc.desc Verify $_iterator on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(1, 3);
      let count: int = 0;
      for (const v of sub) {
        if (count === 0) {
          const actualResult = v;
          const expectedResult: number = 2.0;
          expect(actualResult).assertEqual(expectedResult);
        }
        if (count === 1) {
          const actualResultSecond = v;
          const expectedResultSecond: number = 3.0;
          expect(actualResultSecond).assertEqual(expectedResultSecond);
        }
        count++;
      }
      const actualResultThird = count;
      const expectedResultThird: number = 2;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0310
     * @tc.name testFloat64ArrayCoverageExpansion031
     * @tc.desc Verify $_iterator on array with NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 2.0, NaN);
      let count: int = 0;
      for (const v of arr) {
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0320
     * @tc.name testFloat64ArrayCoverageExpansion032
     * @tc.desc Verify $_iterator exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const iter = arr.$_iterator();
      iter.next();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0330
     * @tc.name testFloat64ArrayCoverageExpansion033
     * @tc.desc Verify entries on single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const _arr = Float64Array.of(99.0);
      for (const entry of _arr.entries()) {
        const actualResult = entry[0];
        const expectedResult: number = 0;
        expect(actualResult).assertEqual(expectedResult);
        const actualResultSecond = entry[1];
        const expectedResultSecond: number = 99.0;
        expect(actualResultSecond).assertEqual(expectedResultSecond);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0340
     * @tc.name testFloat64ArrayCoverageExpansion034
     * @tc.desc Verify entries on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const _arr = new Float64Array(0);
      for (const _ of _arr.entries()) {
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0350
     * @tc.name testFloat64ArrayCoverageExpansion035
     * @tc.desc Verify entries correct key-value for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const _arr = Float64Array.of(NaN);
      for (const entry of _arr.entries()) {
        const actualResult = entry[0];
        const expectedResult: number = 0;
        expect(actualResult).assertEqual(expectedResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0360
     * @tc.name testFloat64ArrayCoverageExpansion036
     * @tc.desc Verify keys on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const _arr = new Float64Array(0);
      for (const _ of _arr.keys()) {
        count++;
      }
      const actualResult = count;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0370
     * @tc.name testFloat64ArrayCoverageExpansion037
     * @tc.desc Verify keys correct index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: int = 0;
      const _arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      for (const k of _arr.keys()) {
        expect(k).assertEqual(idx);
        idx++;
      }
      const actualResult = idx;
      const expectedResult: number = 5;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0380
     * @tc.name testFloat64ArrayCoverageExpansion038
     * @tc.desc Verify keys on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0);
      const sub = arr.subarray(1, 3);
      let idx: int = 0;
      for (const k of sub.keys()) {
        expect(k).assertEqual(idx);
        idx++;
      }
      const actualResult = idx;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0390
     * @tc.name testFloat64ArrayCoverageExpansion039
     * @tc.desc Verify toSorted returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r = arr.toSorted();
      expect(r).not().assertEqual(arr);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0400
     * @tc.name testFloat64ArrayCoverageExpansion040
     * @tc.desc Verify toSorted with pre-sorted array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0410
     * @tc.name testFloat64ArrayCoverageExpansion041
     * @tc.desc Verify toSorted with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const _arr = Float64Array.of(NaN, 2.0, 1.0);
      const r = _arr.toSorted();
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0420
     * @tc.name testFloat64ArrayCoverageExpansion042
     * @tc.desc Verify toReversed returns copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.toReversed();
      expect(r).not().assertEqual(arr);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0430
     * @tc.name testFloat64ArrayCoverageExpansion043
     * @tc.desc Verify toReversed single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const _arr = Float64Array.of(5.0);
      const r = _arr.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0440
     * @tc.name testFloat64ArrayCoverageExpansion044
     * @tc.desc Verify valueOf returns the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0450
     * @tc.name testFloat64ArrayCoverageExpansion045
     * @tc.desc Verify a mapped array preserves its identity through valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float64Array([1.0, 2.0, 3.0]);
      const r = Float64Array.from(src, (v: number): number => {
        return v + 1.0;
      });
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0460
     * @tc.name testFloat64ArrayCoverageExpansion046
     * @tc.desc Verify subarray valueOf returns view itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const view = arr.subarray(1);
      expect(view.valueOf()).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0470
     * @tc.name testFloat64ArrayCoverageExpansion047
     * @tc.desc Verify slice valueOf returns copy itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const copy = arr.slice();
      expect(copy.valueOf()).assertEqual(copy);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0480
     * @tc.name testFloat64ArrayCoverageExpansion048
     * @tc.desc Verify NaN through valueOf stays NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN]);
      const valueView = arr.valueOf();
      const val57 = valueView.$_get(0);
      expect(val57).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0490
     * @tc.name testFloat64ArrayCoverageExpansion049
     * @tc.desc Verify -Infinity through valueOf stays -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-Infinity]);
      const valueView = arr.valueOf();
      const val58 = valueView.$_get(0);
      const actualResult = val58;
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0500
     * @tc.name testFloat64ArrayCoverageExpansion050
     * @tc.desc Verify MAX_VALUE through valueOf stays MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Number.MAX_VALUE]);
      const valueView = arr.valueOf();
      const val59 = valueView.$_get(0);
      const actualResult = val59;
      const expectedResult: number = Number.MAX_VALUE;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0510
     * @tc.name testFloat64ArrayCoverageExpansion051
     * @tc.desc Verify -0 through valueOf keeps sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr[0] = -0.0;
      const valueView = arr.valueOf();
      const val60 = valueView.$_get(0);
      const actualResult = 1.0 / val60;
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0520
     * @tc.name testFloat64ArrayCoverageExpansion052
     * @tc.desc Verify valueOf().valueOf() returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const valueView = arr.valueOf();
      const vv61 = valueView.valueOf();
      expect(vv61).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0530
     * @tc.name testFloat64ArrayCoverageExpansion053
     * @tc.desc Verify valueOf then $_set affects original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const _v = arr.valueOf();
      _v.$_set(0, 55.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 55.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0540
     * @tc.name testFloat64ArrayCoverageExpansion054
     * @tc.desc Verify slice after valueOf does not change original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const _v = arr.valueOf();
      const copy = _v.slice(1);
      copy.$_set(0, 99.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0550
     * @tc.name testFloat64ArrayCoverageExpansion055
     * @tc.desc Verify valueOf result finds the matching element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const valueView = arr.valueOf();
      const idx64 = valueView.indexOf(2.0);
      const actualResult = idx64;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0560
     * @tc.name testFloat64ArrayCoverageExpansion056
     * @tc.desc Verify valueOf result reports a present element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const valueView = arr.valueOf();
      const inc65 = valueView.includes(2.0);
      expect(inc65).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0570
     * @tc.name testFloat64ArrayCoverageExpansion057
     * @tc.desc Verify valueOf result finds the first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const valueView = arr.valueOf();
      const fnd66 = valueView.find((v: number): boolean => {
        return v > 1.0;
      });
      const actualResult = fnd66;
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0580
     * @tc.name testFloat64ArrayCoverageExpansion058
     * @tc.desc Verify valueOf result reduces all elements to their sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const valueView = arr.valueOf();
      const red67 = valueView.reduce((a: number, b: number): number => {
        return a + b;
      });
      const actualResult = red67;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0590
     * @tc.name testFloat64ArrayCoverageExpansion059
     * @tc.desc Verify valueOf leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.length;
      arr.valueOf();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0600
     * @tc.name testFloat64ArrayCoverageExpansion060
     * @tc.desc Verify valueOf leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.byteLength;
      arr.valueOf();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0610
     * @tc.name testFloat64ArrayCoverageExpansion061
     * @tc.desc Verify valueOf leaves buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const before = arr.buffer;
      arr.valueOf();
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0620
     * @tc.name testFloat64ArrayCoverageExpansion062
     * @tc.desc Verify forEach returns undefined for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([]);
      expect(arr.forEach((): void => {
      })).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0630
     * @tc.name testFloat64ArrayCoverageExpansion063
     * @tc.desc Verify forEach returns undefined for multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      expect(arr.forEach((): void => {
      })).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0640
     * @tc.name testFloat64ArrayCoverageExpansion064
     * @tc.desc Verify callback array instanceof Float64Array for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isF64: boolean = false;
      const arr = new Float64Array([1.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        isF64 = a instanceof Float64Array;
      });
      expect(isF64).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0650
     * @tc.name testFloat64ArrayCoverageExpansion065
     * @tc.desc Verify callback array typeof 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrType: string = '';
      const arr = new Float64Array([1.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        arrType = typeof a;
      });
      const actualResult = arrType;
      const expectedResult: string = 'object';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0660
     * @tc.name testFloat64ArrayCoverageExpansion066
     * @tc.desc Verify callback array.length=1 for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alen: number = 0;
      const arr = new Float64Array([1.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        alen = a.length;
      });
      const actualResult = alen;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0670
     * @tc.name testFloat64ArrayCoverageExpansion067
     * @tc.desc Verify callback array.length=3 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alen: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        alen = a.length;
      });
      const actualResult = alen;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0680
     * @tc.name testFloat64ArrayCoverageExpansion068
     * @tc.desc Verify callback array.length=5 for five elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alen: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        alen = a.length;
      });
      const actualResult = alen;
      const expectedResult: number = 5;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0690
     * @tc.name testFloat64ArrayCoverageExpansion069
     * @tc.desc Verify callback array.length=10 for ten elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alen: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        alen = a.length;
      });
      const actualResult = alen;
      const expectedResult: number = 10;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0700
     * @tc.name testFloat64ArrayCoverageExpansion070
     * @tc.desc Verify callback array.byteLength=8 for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bl: number = 0;
      const arr = new Float64Array([1.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        bl = a.byteLength;
      });
      const actualResult = bl;
      const expectedResult: number = 8;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0710
     * @tc.name testFloat64ArrayCoverageExpansion071
     * @tc.desc Verify callback array.byteLength=24 for three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bl: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        bl = a.byteLength;
      });
      const actualResult = bl;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0720
     * @tc.name testFloat64ArrayCoverageExpansion072
     * @tc.desc Verify callback array.byteLength=length*8 relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bl: number = 0;
      let len: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        bl = a.byteLength;
        len = a.length;
      });
      const actualResult = bl;
      const expectedResult: number = len * 8;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0730
     * @tc.name testFloat64ArrayCoverageExpansion073
     * @tc.desc Verify callback array.byteOffset=0 for default view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bo: number = -1;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        bo = a.byteOffset;
      });
      const actualResult = bo;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0740
     * @tc.name testFloat64ArrayCoverageExpansion074
     * @tc.desc Verify callback array.byteOffset=8 for offset 8 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bo: number = -1;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 8, 2);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        bo = a.byteOffset;
      });
      const actualResult = bo;
      const expectedResult: number = 8;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0750
     * @tc.name testFloat64ArrayCoverageExpansion075
     * @tc.desc Verify callback array.buffer same reference as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer | null = null;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        buf = a.buffer;
      });
      expect(buf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0760
     * @tc.name testFloat64ArrayCoverageExpansion076
     * @tc.desc Verify callback array.buffer instanceof ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isAB: boolean = false;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        isAB = a.buffer instanceof ArrayBuffer;
      });
      expect(isAB).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0770
     * @tc.name testFloat64ArrayCoverageExpansion077
     * @tc.desc Verify array[0] in callback equals arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a0: number = 0;
      const arr = new Float64Array([42.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        a0 = a[0];
      });
      expect(a0).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0780
     * @tc.name testFloat64ArrayCoverageExpansion078
     * @tc.desc Verify array.$_get(i) in callback equals v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let match: boolean = true;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        if (a.$_get(i) !== v) {
          match = false;
        }
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0790
     * @tc.name testFloat64ArrayCoverageExpansion079
     * @tc.desc Verify NaN unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN, 1.0]);
      arr.forEach((v: number): void => {
      });
      expect(arr[0]).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0800
     * @tc.name testFloat64ArrayCoverageExpansion080
     * @tc.desc Verify Infinity unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Infinity]);
      arr.forEach((v: number): void => {
      });
      const actualResult = arr[0];
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0810
     * @tc.name testFloat64ArrayCoverageExpansion081
     * @tc.desc Verify -0 sign unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1);
      arr[0] = -0.0;
      arr.forEach((v: number): void => {
      });
      const actualResult = arr[0];
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
      assertStoredNegativeZero(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0820
     * @tc.name testFloat64ArrayCoverageExpansion082
     * @tc.desc Verify MAX_VALUE unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Number.MAX_VALUE]);
      arr.forEach((v: number): void => {
      });
      const actualResult = arr[0];
      const expectedResult: number = Number.MAX_VALUE;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0830
     * @tc.name testFloat64ArrayCoverageExpansion083
     * @tc.desc Verify 0.1 precision unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1]);
      arr.forEach((v: number): void => {
      });
      const actualResult = arr[0];
      const expectedResult: number = 0.1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0840
     * @tc.name testFloat64ArrayCoverageExpansion084
     * @tc.desc Verify 0-param callback using captured const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threshold: int = 2;
      const arr = new Float64Array([1.0, 5.0, 3.0]);
      let callbackCount: int = 0;
      const r = arr.find((): boolean => {
        callbackCount++;
        return callbackCount >= threshold;
      });
      const actualResult = r;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = callbackCount;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0850
     * @tc.name testFloat64ArrayCoverageExpansion085
     * @tc.desc Verify 3-param callback using only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: number = 0;
      const arr = new Float64Array([6.0]);
      const r = arr.find((v: number, i: int, a: Float64Array): boolean => {
        captured = v;
        return true;
      });
      const actualResult = captured;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0860
     * @tc.name testFloat64ArrayCoverageExpansion086
     * @tc.desc Verify 3-param callback using only index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedIndex: number = -1;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        capturedIndex = i;
        return i === 2;
      });
      const actualResult = capturedIndex;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0870
     * @tc.name testFloat64ArrayCoverageExpansion087
     * @tc.desc Verify 3-param callback using only array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedLen: number = 0;
      const arr = new Float64Array([1.0, 2.0]);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        capturedLen = a.length;
        return false;
      });
      const actualResult = capturedLen;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0880
     * @tc.name testFloat64ArrayCoverageExpansion088
     * @tc.desc Verify higher-order factory predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 5.0, 3.0]);
      const r = arr.find((v: number): boolean => {
        return v > 4.0;
      });
      const actualResult = r;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0890
     * @tc.name testFloat64ArrayCoverageExpansion089
     * @tc.desc Verify predicate with if-else branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checked: number = 0;
      const arr = new Float64Array([1.0, 5.0, 3.0]);
      const r = arr.find((v: number): boolean => {
        checked++;
        if (v > 4.0) {
          return true;
        }
        return false;
      });
      const actualResult = r;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = checked;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0900
     * @tc.name testFloat64ArrayCoverageExpansion090
     * @tc.desc Verify composed predicate (value>2 && value%2===0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 8.0, 3.0, 4.0]);
      const r = arr.find((v: number): boolean => {
        return v > 2.0 && v % 2 === 0;
      });
      const actualResult = r;
      const expectedResult: number = 8.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0910
     * @tc.name testFloat64ArrayCoverageExpansion091
     * @tc.desc Verify AND condition value>1 && value<5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 3.0, 6.0]);
      const r = arr.find((v: number): boolean => {
        return v > 1.0 && v < 5.0;
      });
      const actualResult = r;
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0920
     * @tc.name testFloat64ArrayCoverageExpansion092
     * @tc.desc Verify OR condition value<0 || value>8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([5.0, 9.0, 3.0]);
      const r = arr.find((v: number): boolean => {
        return v < 0.0 || v > 8.0;
      });
      const actualResult = r;
      const expectedResult: number = 9.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0930
     * @tc.name testFloat64ArrayCoverageExpansion093
     * @tc.desc Verify predicate index>1 returns element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([10.0, 20.0, 30.0, 40.0]);
      const r = arr.find((v: number, i: int): boolean => {
        return i > 1;
      });
      const actualResult = r;
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0940
     * @tc.name testFloat64ArrayCoverageExpansion094
     * @tc.desc Verify callback array.byteLength=24 for 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedByteLen: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        capturedByteLen = a.byteLength;
        return false;
      });
      const actualResult = capturedByteLen;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0950
     * @tc.name testFloat64ArrayCoverageExpansion095
     * @tc.desc Verify callback array instanceof Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isF64: boolean = false;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        isF64 = a instanceof Float64Array;
        return false;
      });
      expect(isF64).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0960
     * @tc.name testFloat64ArrayCoverageExpansion096
     * @tc.desc Verify callback array.byteOffset=8 for offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedOffset: number = -1;
      const buf = new ArrayBuffer(32);
      const arr = new Float64Array(buf, 8, 3);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        capturedOffset = a.byteOffset;
        return false;
      });
      const actualResult = capturedOffset;
      const expectedResult: number = 8;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0970
     * @tc.name testFloat64ArrayCoverageExpansion097
     * @tc.desc Verify callback array supports $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedValue: number = 0;
      const arr = new Float64Array([9.0, 2.0]);
      arr.find((v: number, i: int, a: Float64Array): boolean => {
        capturedValue = a.$_get(0);
        return false;
      });
      const actualResult = capturedValue;
      const expectedResult: number = 9.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0980
     * @tc.name testFloat64ArrayCoverageExpansion098
     * @tc.desc Verify index sequence 0+1+2+3=6 through all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indexSum: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.find((v: number, i: int): boolean => {
        indexSum += i;
        return false;
      });
      const actualResult = indexSum;
      const expectedResult: number = 6;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_0990
     * @tc.name testFloat64ArrayCoverageExpansion099
     * @tc.desc Verify single element index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedIndex: number = -1;
      const arr = new Float64Array([7.0]);
      arr.find((v: number, i: int): boolean => {
        capturedIndex = i;
        return true;
      });
      const actualResult = capturedIndex;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_1000
     * @tc.name testFloat64ArrayCoverageExpansion100
     * @tc.desc Verify 50-element last index=49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(50);
      let lastIndex: number = -1;
      arr.find((v: number, i: int): boolean => {
        lastIndex = i;
        return false;
      });
      const actualResult = lastIndex;
      const expectedResult: number = 49;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_EXPANSION_1010
     * @tc.name testFloat64ArrayCoverageExpansion101
     * @tc.desc Verify map callback throw propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverageExpansion101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0]);
      try {
        arr.map((v: number): number => {
          throw new Error('coverage map error');
        });
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'Error';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'coverage map error';
        expect(actualMessage).assertEqual(expectedMessage);
      }
    });
  })
}
