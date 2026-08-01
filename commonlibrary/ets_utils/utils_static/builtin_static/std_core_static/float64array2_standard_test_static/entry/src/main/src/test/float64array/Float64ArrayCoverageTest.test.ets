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

export default function Float64ArrayCoverageTest(): void {
  describe('Float64ArrayCoverageTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0100
     * @tc.name testFloat64ArrayCoverage001
     * @tc.desc Verify toString with hex literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0xA, 0xB, 0xC]);
      const actualString = arr.toString();
      const expectedString: string = '10,11,12';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0200
     * @tc.name testFloat64ArrayCoverage002
     * @tc.desc Verify toString with octal literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0o10, 0o20]);
      const actualString = arr.toString();
      const expectedString: string = '8,16';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0300
     * @tc.name testFloat64ArrayCoverage003
     * @tc.desc Verify toString with binary literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0b101, 0b1111]);
      const actualString = arr.toString();
      const expectedString: string = '5,15';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0400
     * @tc.name testFloat64ArrayCoverage004
     * @tc.desc Verify toString with subnormal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 2.225073858507201e-308);
      const s = arr.toString();
      const actualResult = s;
      const expectedResult: string = '5e-324,2.225073858507201e-308';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0500
     * @tc.name testFloat64ArrayCoverage005
     * @tc.desc Verify toString after toSorted returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const sorted: Float64Array = arr.toSorted();
      const actualString = sorted.toString();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0600
     * @tc.name testFloat64ArrayCoverage006
     * @tc.desc Verify toString after toReversed returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const reversed: Float64Array = arr.toReversed();
      const actualString = reversed.toString();
      const expectedString: string = '3,2,1';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0700
     * @tc.name testFloat64ArrayCoverage007
     * @tc.desc Verify toString with all -0 elements prints 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, -0.0);
      const actualString = arr.toString();
      const expectedString: string = '0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0800
     * @tc.name testFloat64ArrayCoverage008
     * @tc.desc Verify toString with mix of hex and decimal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0xA, 5.5, 0xF]);
      const actualString = arr.toString();
      const expectedString: string = '10,5.5,15';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_0900
     * @tc.name testFloat64ArrayCoverage009
     * @tc.desc Verify toString with scientific notation elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e10, 2e-5);
      const actualString = arr.toString();
      const expectedString: string = '10000000000,0.00002';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1000
     * @tc.name testFloat64ArrayCoverage010
     * @tc.desc Verify toString on subarray returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const sub: Float64Array = arr.subarray(0, 2);
      const actualString = sub.toString();
      const expectedString: string = '10,20';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1100
     * @tc.name testFloat64ArrayCoverage011
     * @tc.desc Verify toString on slice returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const sliced: Float64Array = arr.slice(1, 3);
      const actualString = sliced.toString();
      const expectedString: string = '20,30';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1200
     * @tc.name testFloat64ArrayCoverage012
     * @tc.desc Verify valueOf after sort returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0);
      arr.sort();
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1300
     * @tc.name testFloat64ArrayCoverage013
     * @tc.desc Verify valueOf after fill returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr.fill(0.0);
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1400
     * @tc.name testFloat64ArrayCoverage014
     * @tc.desc Verify valueOf after copyWithin returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2);
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1500
     * @tc.name testFloat64ArrayCoverage015
     * @tc.desc Verify valueOf on subarray returns subarray itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sub: Float64Array = arr.subarray(0, 2);
      expect(sub.valueOf() === sub).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1600
     * @tc.name testFloat64ArrayCoverage016
     * @tc.desc Verify valueOf on slice returns slice itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const s: Float64Array = arr.slice(0, 2);
      expect(s.valueOf() === s).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1700
     * @tc.name testFloat64ArrayCoverage017
     * @tc.desc Verify valueOf after reverse returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1800
     * @tc.name testFloat64ArrayCoverage018
     * @tc.desc Verify valueOf chain sort-fill returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      arr.fill(0.0);
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_1900
     * @tc.name testFloat64ArrayCoverage019
     * @tc.desc Verify valueOf after set returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      arr.set(0, 5.0);
      expect(arr.valueOf() === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2000
     * @tc.name testFloat64ArrayCoverage020
     * @tc.desc Verify valueOf on subarray after sort returns subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const sub: Float64Array = arr.subarray(0, 2);
      sub.sort();
      expect(sub.valueOf() === sub).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2100
     * @tc.name testFloat64ArrayCoverage021
     * @tc.desc Verify valueOf on slice after fill returns slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const s: Float64Array = arr.slice();
      s.fill(0.0);
      expect(s.valueOf() === s).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2200
     * @tc.name testFloat64ArrayCoverage022
     * @tc.desc Verify join with hex literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0xFF, 0x100]);
      const actualString = arr.join('-');
      const expectedString: string = '255-256';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2300
     * @tc.name testFloat64ArrayCoverage023
     * @tc.desc Verify join with octal literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0o10, 0o77]);
      const actualString = arr.join('.');
      const expectedString: string = '8.63';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2400
     * @tc.name testFloat64ArrayCoverage024
     * @tc.desc Verify join with scientific notation elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e5, 2e-3);
      const actualString = arr.join();
      const expectedString: string = '100000,0.002';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2500
     * @tc.name testFloat64ArrayCoverage025
     * @tc.desc Verify join after sort then reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      arr.reverse();
      const actualString = arr.join();
      const expectedString: string = '3,2,1';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2600
     * @tc.name testFloat64ArrayCoverage026
     * @tc.desc Verify join with binary literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([0b1000, 0b1111]);
      const actualString = arr.join('|');
      const expectedString: string = '8|15';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2700
     * @tc.name testFloat64ArrayCoverage027
     * @tc.desc Verify join with subnormal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1.0);
      const s = arr.join();
      const actualResult = s;
      const expectedResult: string = '5e-324,1';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2800
     * @tc.name testFloat64ArrayCoverage028
     * @tc.desc Verify join after fill then sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(5.0);
      arr.sort();
      const actualString = arr.join();
      const expectedString: string = '5,5,5';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_2900
     * @tc.name testFloat64ArrayCoverage029
     * @tc.desc Verify join after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2);
      const actualString = arr.join();
      const expectedString: string = '3,4,3,4';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3000
     * @tc.name testFloat64ArrayCoverage030
     * @tc.desc Verify join with all -0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, -0.0, -0.0);
      const actualString = arr.join(',');
      const expectedString: string = '0,0,0';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3100
     * @tc.name testFloat64ArrayCoverage031
     * @tc.desc Verify join with mixed precision elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1, 0.2);
      const sum = arr.reduce((a: number, v: number): number => a + v, 0.0);
      const arr2: Float64Array = Float64Array.of(1.0, sum);
      const actualString = arr2.join();
      const expectedString: string = '1,0.30000000000000004';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3200
     * @tc.name testFloat64ArrayCoverage032
     * @tc.desc Verify $_get with hex index 0xA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(11);
      arr.$_set(10, 42.0);
      const actualElementAt0xA = arr.$_get(0xA);
      const expectedElementAt0xA: number = 42.0;
      expect(actualElementAt0xA).assertEqual(expectedElementAt0xA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3300
     * @tc.name testFloat64ArrayCoverage033
     * @tc.desc Verify $_get with binary index 0b101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(6);
      arr.$_set(5, 99.0);
      const actualElementAt0b101 = arr.$_get(0b101);
      const expectedElementAt0b101: number = 99.0;
      expect(actualElementAt0b101).assertEqual(expectedElementAt0b101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3400
     * @tc.name testFloat64ArrayCoverage034
     * @tc.desc Verify $_get with octal index 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(9);
      arr.$_set(8, 77.0);
      const actualElementAt0o10 = arr.$_get(0o10);
      const expectedElementAt0o10: number = 77.0;
      expect(actualElementAt0o10).assertEqual(expectedElementAt0o10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3500
     * @tc.name testFloat64ArrayCoverage035
     * @tc.desc Verify $_get with hex index 0x0 equals index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 10.0);
      const actualElementAt0x0 = arr.$_get(0x0);
      const expectedElementAt0x0: number = 5.0;
      expect(actualElementAt0x0).assertEqual(expectedElementAt0x0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3600
     * @tc.name testFloat64ArrayCoverage036
     * @tc.desc Verify $_get with hex index 0x1 OOB on empty throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      try {
        arr.$_get(0x1);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3700
     * @tc.name testFloat64ArrayCoverage037
     * @tc.desc Verify $_get with octal index 0o0 equals index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      const actualElementAt0o0 = arr.$_get(0o0);
      const expectedElementAt0o0: number = 7.0;
      expect(actualElementAt0o0).assertEqual(expectedElementAt0o0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3800
     * @tc.name testFloat64ArrayCoverage038
     * @tc.desc Verify $_get with binary index 0b0 equals index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0);
      const actualElementAt0b0 = arr.$_get(0b0);
      const expectedElementAt0b0: number = 3.0;
      expect(actualElementAt0b0).assertEqual(expectedElementAt0b0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_3900
     * @tc.name testFloat64ArrayCoverage039
     * @tc.desc Verify $_get with hex index 0xF on large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(16);
      arr.$_set(15, 88.0);
      const actualElementAt0xF = arr.$_get(0xF);
      const expectedElementAt0xF: number = 88.0;
      expect(actualElementAt0xF).assertEqual(expectedElementAt0xF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4000
     * @tc.name testFloat64ArrayCoverage040
     * @tc.desc Verify $_get with octal 0o77 OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      try {
        arr.$_get(0o77);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4100
     * @tc.name testFloat64ArrayCoverage041
     * @tc.desc Verify $_get with binary 0b11111111 OOB throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      try {
        arr.$_get(0b11111111);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4200
     * @tc.name testFloat64ArrayCoverage042
     * @tc.desc Verify $_set scientific 1e-10 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 1e-10);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1e-10;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4300
     * @tc.name testFloat64ArrayCoverage043
     * @tc.desc Verify $_set hex 0xFF value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0xFF);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 255.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4400
     * @tc.name testFloat64ArrayCoverage044
     * @tc.desc Verify $_set hex 0x0 value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0x0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4500
     * @tc.name testFloat64ArrayCoverage045
     * @tc.desc Verify $_set scientific 1e10 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 1e10);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1e10;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4600
     * @tc.name testFloat64ArrayCoverage046
     * @tc.desc Verify $_set octal 0o77 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0o77);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 63.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4700
     * @tc.name testFloat64ArrayCoverage047
     * @tc.desc Verify $_set binary 0b1111 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0b1111);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 15.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4800
     * @tc.name testFloat64ArrayCoverage048
     * @tc.desc Verify $_set multiple scientific values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.$_set(0, 1e5);
      arr.$_set(1, 2e-5);
      arr.$_set(2, 3e10);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1e5;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2e-5;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3e10;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_4900
     * @tc.name testFloat64ArrayCoverage049
     * @tc.desc Verify $_set then $_get hex value readback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0xABC);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2748.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5000
     * @tc.name testFloat64ArrayCoverage050
     * @tc.desc Verify $_set hex values across multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.$_set(0, 0x1);
      arr.$_set(1, 0x10);
      arr.$_set(2, 0x100);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 16.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 256.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5100
     * @tc.name testFloat64ArrayCoverage051
     * @tc.desc Verify entries exhausted iterator done stays true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const iter = arr.entries();
      iter.next();
      const nxt = iter.next();
      expect(nxt.done).assertTrue();
      const nxt2 = iter.next();
      expect(nxt2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5200
     * @tc.name testFloat64ArrayCoverage052
     * @tc.desc Verify entries after sort key-value correspondence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      for (const e of arr.entries()) {
        expect(e[1]).assertEqual(arr.$_get(e[0]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5300
     * @tc.name testFloat64ArrayCoverage053
     * @tc.desc Verify entries after reverse key-value correspondence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      for (const e of arr.entries()) {
        expect(e[1]).assertEqual(arr.$_get(e[0]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5400
     * @tc.name testFloat64ArrayCoverage054
     * @tc.desc Verify entries after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.fill(5.0);
      for (const e of arr.entries()) {
        const actualResult = e[1];
        const expectedResult: number = 5.0;
        expect(actualResult).assertEqual(expectedResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5500
     * @tc.name testFloat64ArrayCoverage055
     * @tc.desc Verify entries after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 2);
      const iter = arr.entries();
      const nxt = iter.next();
      const e = nxt.value!;
      const actualResult = e[1];
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5600
     * @tc.name testFloat64ArrayCoverage056
     * @tc.desc Verify entries value mutation visible through iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const iter = arr.entries();
      arr.$_set(0, 99.0);
      const nxt = iter.next();
      const e = nxt.value!;
      const actualResult = e[1];
      const expectedResult: number = 99.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5700
     * @tc.name testFloat64ArrayCoverage057
     * @tc.desc Verify entries multiple iterators independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const a = arr.entries(), b = arr.entries();
      a.next();
      a.next();
      const an = a.next();
      const actualResult = an.value![1];
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
      const bn = b.next();
      const actualResultSecond = bn.value![1];
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5800
     * @tc.name testFloat64ArrayCoverage058
     * @tc.desc Verify keys range 0 to length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let i: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(i++);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_5900
     * @tc.name testFloat64ArrayCoverage059
     * @tc.desc Verify keys two iterators independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const a = arr.keys(), b = arr.keys();
      a.next();
      a.next();
      const an = a.next();
      const actualResult = an.value;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const bn = b.next();
      const actualResultSecond = bn.value;
      const expectedResultSecond: number = 0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6000
     * @tc.name testFloat64ArrayCoverage060
     * @tc.desc Verify keys after sort correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      arr.sort();
      let i: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(i++);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6100
     * @tc.name testFloat64ArrayCoverage061
     * @tc.desc Verify keys after reverse correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.reverse();
      let i: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(i++);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6200
     * @tc.name testFloat64ArrayCoverage062
     * @tc.desc Verify keys iterator exhaustion done stays true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const iter = arr.keys();
      iter.next();
      iter.next();
      const nxt = iter.next();
      expect(nxt.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6300
     * @tc.name testFloat64ArrayCoverage063
     * @tc.desc Verify keys after fill correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(5.0);
      let i: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(i++);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6400
     * @tc.name testFloat64ArrayCoverage064
     * @tc.desc Verify keys after set 0-based indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.set(1, 99.0);
      let i: int = 0;
      for (const k of arr.keys()) {
        expect(k).assertEqual(i++);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6500
     * @tc.name testFloat64ArrayCoverage065
     * @tc.desc Verify toSorted empty returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const sorted: Float64Array = arr.toSorted();
      const actualLength = sorted.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6600
     * @tc.name testFloat64ArrayCoverage066
     * @tc.desc Verify toSorted single element returns copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0);
      const r = arr.toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(r === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6700
     * @tc.name testFloat64ArrayCoverage067
     * @tc.desc Verify toSorted all-equal same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      const filled: Float64Array = arr.fill(7.0);
      const r = filled.toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 7.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6800
     * @tc.name testFloat64ArrayCoverage068
     * @tc.desc Verify toSorted already-sorted preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sorted: Float64Array = arr.toSorted();
      const actualString = sorted.toString();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_6900
     * @tc.name testFloat64ArrayCoverage069
     * @tc.desc Verify toSorted -0 values sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 2.0);
      const sorted: Float64Array = arr.toSorted();
      const actualElement0 = sorted.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7000
     * @tc.name testFloat64ArrayCoverage070
     * @tc.desc Verify toReversed empty returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const reversed: Float64Array = arr.toReversed();
      const actualLength = reversed.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7100
     * @tc.name testFloat64ArrayCoverage071
     * @tc.desc Verify toReversed two elements swaps order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r = arr.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7200
     * @tc.name testFloat64ArrayCoverage072
     * @tc.desc Verify toReversed all-same copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tmp: Float64Array = new Float64Array(3);
      const arr: Float64Array = tmp.fill(5.0);
      const r = arr.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(r === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7300
     * @tc.name testFloat64ArrayCoverage073
     * @tc.desc Verify toReversed single returns copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      const r = arr.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(r === Float64Array.of(7.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7400
     * @tc.name testFloat64ArrayCoverage074
     * @tc.desc Verify toReversed NaN reverses correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const r = arr.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7500
     * @tc.name testFloat64ArrayCoverage075
     * @tc.desc Verify toReversed Infinity reverses correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Infinity, 2.0, -Infinity);
      const r = arr.toReversed();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = r.$_get(2);
      const expectedElement2: number = Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7600
     * @tc.name testFloat64ArrayCoverage076
     * @tc.desc Verify entries exhausted iterator stays done after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const iter = arr.entries();
      iter.next();
      expect(iter.next().done).assertTrue();
      arr.$_set(0, 99.0);
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COVERAGE_7700
     * @tc.name testFloat64ArrayCoverage077
     * @tc.desc Verify keys exhausted iterator stays done after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCoverage077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
      arr.fill(8.0);
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });
  })
}
