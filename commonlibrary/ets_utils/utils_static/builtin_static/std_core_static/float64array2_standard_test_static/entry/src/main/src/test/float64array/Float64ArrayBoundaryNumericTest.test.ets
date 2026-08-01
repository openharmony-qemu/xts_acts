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

export default function Float64ArrayBoundaryNumericTest(): void {
  describe('Float64ArrayBoundaryNumericTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0010
     * @tc.name testFloat64ArrayBoundaryNumeric001
     * @tc.desc Verify empty array some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: boolean = arr.some((v: number): boolean => true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0020
     * @tc.name testFloat64ArrayBoundaryNumeric002
     * @tc.desc Verify empty array some callback not called (called=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let called: number = 0;
      arr.some((v: number): boolean => {
        called++;
        return true;
      });
      const actualResult = called;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0030
     * @tc.name testFloat64ArrayBoundaryNumeric003
     * @tc.desc Verify empty array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: boolean = arr.every((v: number): boolean => false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0040
     * @tc.name testFloat64ArrayBoundaryNumeric004
     * @tc.desc Verify empty array find returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const r: number | undefined = arr.find((v: number): boolean => true);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0050
     * @tc.name testFloat64ArrayBoundaryNumeric005
     * @tc.desc Verify empty array findIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const idx: number = arr.findIndex((v: number): boolean => true);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0060
     * @tc.name testFloat64ArrayBoundaryNumeric006
     * @tc.desc Verify empty array findLast throws when element cannot be found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      try {
        arr.findLast((v: number): boolean => true);
        expect().assertFail();
      } catch (e) {
        expect(e.message)
          .assertEqual('Float64Array.findLast: not implemented if an element was not found');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0070
     * @tc.name testFloat64ArrayBoundaryNumeric007
     * @tc.desc Verify empty array findLastIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const idx: number = arr.findLastIndex((v: number): boolean => true);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0080
     * @tc.name testFloat64ArrayBoundaryNumeric008
     * @tc.desc Verify empty array forEach callback not called (called=0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let called: number = 0;
      arr.forEach((v: number): void => {
        called++;
      });
      const actualResult = called;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0090
     * @tc.name testFloat64ArrayBoundaryNumeric009
     * @tc.desc Verify empty array indexOf returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const actualIndex = arr.indexOf(1.0);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0100
     * @tc.name testFloat64ArrayBoundaryNumeric010
     * @tc.desc Verify empty array lastIndexOf returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const actualIndex = arr.lastIndexOf(1.0);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0110
     * @tc.name testFloat64ArrayBoundaryNumeric011
     * @tc.desc Verify empty array includes returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expect(arr.includes(1.0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0120
     * @tc.name testFloat64ArrayBoundaryNumeric012
     * @tc.desc Verify empty array values().next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const it: IterableIterator<number> = arr.values();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0130
     * @tc.name testFloat64ArrayBoundaryNumeric013
     * @tc.desc Verify empty array at(0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expect(arr.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0140
     * @tc.name testFloat64ArrayBoundaryNumeric014
     * @tc.desc Verify empty array at(-1) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expect(arr.at(-1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0150
     * @tc.name testFloat64ArrayBoundaryNumeric015
     * @tc.desc Verify single element some matching returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const r: boolean = arr.some((v: number): boolean => v === 7.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0160
     * @tc.name testFloat64ArrayBoundaryNumeric016
     * @tc.desc Verify single element some not matching returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const r: boolean = arr.some((v: number): boolean => v > 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0170
     * @tc.name testFloat64ArrayBoundaryNumeric017
     * @tc.desc Verify single element every matching returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const r: boolean = arr.every((v: number): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0180
     * @tc.name testFloat64ArrayBoundaryNumeric018
     * @tc.desc Verify single element find matching returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const r: number | undefined = arr.find((v: number): boolean => v === 7.0);
      const actualResult = r;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0190
     * @tc.name testFloat64ArrayBoundaryNumeric019
     * @tc.desc Verify single element findIndex matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const idx: number = arr.findIndex((v: number): boolean => v === 7.0);
      const actualResult = idx;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0200
     * @tc.name testFloat64ArrayBoundaryNumeric020
     * @tc.desc Verify single element reduce no initialValue returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const r: number = arr.reduce((acc: number, v: number): number => acc + v);
      const actualResult = r;
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0210
     * @tc.name testFloat64ArrayBoundaryNumeric021
     * @tc.desc Verify single element at(0) returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const actualResult = arr.at(0);
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0220
     * @tc.name testFloat64ArrayBoundaryNumeric022
     * @tc.desc Verify single element at(-1) wraps to that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([7.0]);
      const actualResult = arr.at(-1);
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0230
     * @tc.name testFloat64ArrayBoundaryNumeric023
     * @tc.desc Verify all same values indexOf returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 5.0, 5.0]);
      const actualIndex = arr.indexOf(5.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0240
     * @tc.name testFloat64ArrayBoundaryNumeric024
     * @tc.desc Verify all same values lastIndexOf returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 5.0, 5.0]);
      const actualIndex = arr.lastIndexOf(5.0);
      const expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0250
     * @tc.name testFloat64ArrayBoundaryNumeric025
     * @tc.desc Verify all same values find returns the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 5.0, 5.0]);
      const r: number | undefined = arr.find((v: number): boolean => v === 5.0);
      const actualResult = r;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0260
     * @tc.name testFloat64ArrayBoundaryNumeric026
     * @tc.desc Verify all same values some returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 5.0, 5.0]);
      const r: boolean = arr.some((v: number): boolean => v === 5.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0270
     * @tc.name testFloat64ArrayBoundaryNumeric027
     * @tc.desc Verify all same values sort without compareFn stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 5.0, 5.0]);
      arr.sort();
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0280
     * @tc.name testFloat64ArrayBoundaryNumeric028
     * @tc.desc Verify subnormal 5e-324 read via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5e-324]);
      const v = arr.$_get(0);
      const actualResult = v;
      const expectedResult: number = 5e-324;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0290
     * @tc.name testFloat64ArrayBoundaryNumeric029
     * @tc.desc Verify subnormal 1e-323 via constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1e-323]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1e-323;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0300
     * @tc.name testFloat64ArrayBoundaryNumeric030
     * @tc.desc Verify denormalized 2.225073858507201e-308 read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.225073858507201e-308);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2.225073858507201e-308;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0310
     * @tc.name testFloat64ArrayBoundaryNumeric031
     * @tc.desc Verify subnormal in sort maintains position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 2.0, 1e-323);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0320
     * @tc.name testFloat64ArrayBoundaryNumeric032
     * @tc.desc Verify -0.0 stored and read preserves sign via 1/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      const v = arr.$_get(0);
      const actualResult = 1.0 / v;
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0330
     * @tc.name testFloat64ArrayBoundaryNumeric033
     * @tc.desc Verify -0.0 fill preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      arr.fill(-0.0);
      const actualElement0 = 1.0 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = 1.0 / arr.$_get(1);
      const expectedElement1: number = -Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0340
     * @tc.name testFloat64ArrayBoundaryNumeric034
     * @tc.desc Verify +0.0 and -0.0 are treated equal in includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      expect(arr.includes(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0350
     * @tc.name testFloat64ArrayBoundaryNumeric035
     * @tc.desc Verify +0.0 and -0.0 indexOf treated equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      const actualIndex = arr.indexOf(0.0);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0360
     * @tc.name testFloat64ArrayBoundaryNumeric036
     * @tc.desc Verify -0.0 after map preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 1.0);
      const r = arr.map((v: number): number => v);
      const actualElement0 = 1.0 / r.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0370
     * @tc.name testFloat64ArrayBoundaryNumeric037
     * @tc.desc Verify Infinity stored and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Infinity);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0380
     * @tc.name testFloat64ArrayBoundaryNumeric038
     * @tc.desc Verify -Infinity stored and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-Infinity);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0390
     * @tc.name testFloat64ArrayBoundaryNumeric039
     * @tc.desc Verify sort places Infinity at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, Infinity, 2.0, -Infinity);
      arr.sort();
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = Infinity;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0400
     * @tc.name testFloat64ArrayBoundaryNumeric040
     * @tc.desc Verify MAX_VALUE 1.7976931348623157e+308 stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.7976931348623157e+308]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.7976931348623157e+308;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0410
     * @tc.name testFloat64ArrayBoundaryNumeric041
     * @tc.desc Verify map MAX_VALUE * 2 produces Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.7976931348623157e+308]);
      const r = arr.map((v: number): number => v * 2.0);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0420
     * @tc.name testFloat64ArrayBoundaryNumeric042
     * @tc.desc Verify reduce with MAX_VALUE overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e+308, 1.7976931348623157e+308);
      const r = arr.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0430
     * @tc.name testFloat64ArrayBoundaryNumeric043
     * @tc.desc Verify MIN_VALUE 5e-324 stored and read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5e-324]);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0440
     * @tc.name testFloat64ArrayBoundaryNumeric044
     * @tc.desc Verify map MIN_VALUE / 2 produces 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5e-324]);
      const r = arr.map((v: number): number => v / 2.0);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0450
     * @tc.name testFloat64ArrayBoundaryNumeric045
     * @tc.desc Verify 2^53 stored precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9007199254740992.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740992.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0460
     * @tc.name testFloat64ArrayBoundaryNumeric046
     * @tc.desc Verify 2^53+1 rounds to 2^53 (double precision limit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9007199254740993.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9007199254740992.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0470
     * @tc.name testFloat64ArrayBoundaryNumeric047
     * @tc.desc Verify scientific notation 1e-10 stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e-10);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1e-10;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0480
     * @tc.name testFloat64ArrayBoundaryNumeric048
     * @tc.desc Verify reduce precision: 0.1+0.2 accumulative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1, 0.2);
      const r = arr.reduce((a: number, v: number): number => a + v, 0.0);
      const actualResult = r;
      const expectedResult: number = 0.30000000000000004;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0490
     * @tc.name testFloat64ArrayBoundaryNumeric049
     * @tc.desc Verify 0.1+0.2 same as 0.30000000000000004 in includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1, 0.2);
      const sum = arr.reduce((a: number, v: number): number => a + v, 0.0);
      expect(arr.includes(sum)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0500
     * @tc.name testFloat64ArrayBoundaryNumeric050
     * @tc.desc Verify MAX_VALUE + 1.0 == MAX_VALUE (precision loss)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: number = 1.7976931348623157e+308;
      const r = maxVal + 1.0;
      const arr: Float64Array = new Float64Array([maxVal, r]);
      expect(arr.$_get(0)).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0510
     * @tc.name testFloat64ArrayBoundaryNumeric051
     * @tc.desc Verify subnormal sort order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 0.0, 1e-323, -5e-324);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0520
     * @tc.name testFloat64ArrayBoundaryNumeric052
     * @tc.desc Verify filter with Infinity condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, Infinity, 2.0, -Infinity, 3.0);
      const finite = arr.filter((v: number): boolean => isFinite(v));
      const actualLength = finite.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0530
     * @tc.name testFloat64ArrayBoundaryNumeric053
     * @tc.desc Verify includes(NaN) returns true (unlike indexOf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, 2.0, 3.0]);
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0540
     * @tc.name testFloat64ArrayBoundaryNumeric054
     * @tc.desc Verify indexOf(NaN) returns -1 (=== comparison)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, 2.0, 3.0]);
      const actualIndex = arr.indexOf(NaN);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0550
     * @tc.name testFloat64ArrayBoundaryNumeric055
     * @tc.desc Verify lastIndexOf(NaN) returns -1 (=== comparison)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([NaN, 2.0, 3.0]);
      const actualIndex = arr.lastIndexOf(NaN);
      const expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0560
     * @tc.name testFloat64ArrayBoundaryNumeric056
     * @tc.desc Verify includes(+Infinity) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, Infinity, 3.0]);
      expect(arr.includes(Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0570
     * @tc.name testFloat64ArrayBoundaryNumeric057
     * @tc.desc Verify includes(-Infinity) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -Infinity, 3.0]);
      expect(arr.includes(-Infinity)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0580
     * @tc.name testFloat64ArrayBoundaryNumeric058
     * @tc.desc Verify find with v===NaN never matches NaN, returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const r: number | undefined = arr.find((v: number): boolean => v === NaN);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0590
     * @tc.name testFloat64ArrayBoundaryNumeric059
     * @tc.desc Verify findIndex with v===NaN never matches NaN, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const idx: number = arr.findIndex((v: number): boolean => v === NaN);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0600
     * @tc.name testFloat64ArrayBoundaryNumeric060
     * @tc.desc Verify findLast with v===NaN never matches and throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      try {
        arr.findLast((v: number): boolean => v === NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.message)
          .assertEqual('Float64Array.findLast: not implemented if an element was not found');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0610
     * @tc.name testFloat64ArrayBoundaryNumeric061
     * @tc.desc Verify findLastIndex with v===NaN never matches, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const idx: number = arr.findLastIndex((v: number): boolean => v === NaN);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0620
     * @tc.name testFloat64ArrayBoundaryNumeric062
     * @tc.desc Verify some with v!==v detects NaN returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const r: boolean = arr.some((v: number): boolean => v !== v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0630
     * @tc.name testFloat64ArrayBoundaryNumeric063
     * @tc.desc Verify every with v===v returns false when NaN present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const r: boolean = arr.every((v: number): boolean => v === v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0640
     * @tc.name testFloat64ArrayBoundaryNumeric064
     * @tc.desc Verify sort puts NaN to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, NaN, 1.0]);
      arr.sort();
      expect(arr.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0650
     * @tc.name testFloat64ArrayBoundaryNumeric065
     * @tc.desc Verify sort puts +Infinity to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, Infinity, 3.0]);
      arr.sort();
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0660
     * @tc.name testFloat64ArrayBoundaryNumeric066
     * @tc.desc Verify sort puts -Infinity to the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -Infinity, 3.0]);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0670
     * @tc.name testFloat64ArrayBoundaryNumeric067
     * @tc.desc Verify sort mixed NaN/Infinity/numbers order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, NaN, -Infinity, 3.0, Infinity, 1.0]);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 5.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElementAt4 = arr.$_get(4);
      const expectedElementAt4: number = Infinity;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
      expect(arr.$_get(5)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0680
     * @tc.name testFloat64ArrayBoundaryNumeric068
     * @tc.desc Verify toString includes NaN as 'NaN' in output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const actualString = arr.toString();
      const expectedString: string = '1,NaN,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0690
     * @tc.name testFloat64ArrayBoundaryNumeric069
     * @tc.desc Verify toString single Infinity outputs 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Infinity]);
      const actualString = arr.toString();
      const expectedString: string = 'Infinity';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0700
     * @tc.name testFloat64ArrayBoundaryNumeric070
     * @tc.desc Verify toString single -Infinity outputs '-Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([-Infinity]);
      const actualString = arr.toString();
      const expectedString: string = '-Infinity';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0710
     * @tc.name testFloat64ArrayBoundaryNumeric071
     * @tc.desc Verify join with separator outputs NaN correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const actualString = arr.join('-');
      const expectedString: string = '1-NaN-3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0720
     * @tc.name testFloat64ArrayBoundaryNumeric072
     * @tc.desc Verify $_set -0 preserves sign bit via 1/x check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, -0);
      const actualElement0 = 1 / arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0730
     * @tc.name testFloat64ArrayBoundaryNumeric073
     * @tc.desc Verify $_set +0 preserves sign bit via 1/x check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 0);
      const actualElement0 = 1 / arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0740
     * @tc.name testFloat64ArrayBoundaryNumeric074
     * @tc.desc Verify toSorted puts NaN to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([3.0, NaN, 1.0]);
      const r: Float64Array = arr.toSorted();
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0750
     * @tc.name testFloat64ArrayBoundaryNumeric075
     * @tc.desc Verify toSorted puts -Infinity at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, -Infinity, 3.0]);
      const r: Float64Array = arr.toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0760
     * @tc.name testFloat64ArrayBoundaryNumeric076
     * @tc.desc Verify some with v===NaN returns false due to NaN self-inequality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, NaN, 3.0]);
      const r: boolean = arr.some((v: number): boolean => v === NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0770
     * @tc.name testFloat64ArrayBoundaryNumeric077
     * @tc.desc Verify join with Infinity outputs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([Infinity, -Infinity]);
      const actualString = arr.join(',');
      const expectedString: string = 'Infinity,-Infinity';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0780
     * @tc.name testFloat64ArrayBoundaryNumeric078
     * @tc.desc Verify includes(NaN) with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 1.0, NaN, 3.0);
      expect(arr.includes(NaN, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0790
     * @tc.name testFloat64ArrayBoundaryNumeric079
     * @tc.desc Verify includes(NaN) with fromIndex past NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN);
      expect(arr.includes(NaN, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0800
     * @tc.name testFloat64ArrayBoundaryNumeric080
     * @tc.desc Verify find via isNaN finds first NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 2.0, NaN);
      const r = arr.find((v: number): boolean => isNaN(v));
      expect(r).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0810
     * @tc.name testFloat64ArrayBoundaryNumeric081
     * @tc.desc Verify findIndex via isNaN finds first NaN index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 2.0, NaN);
      const r = arr.findIndex((v: number): boolean => isNaN(v));
      const actualResult = r;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0820
     * @tc.name testFloat64ArrayBoundaryNumeric082
     * @tc.desc Verify filter selects NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 2.0, NaN, 3.0);
      const r = arr.filter((v: number): boolean => isNaN(v));
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0830
     * @tc.name testFloat64ArrayBoundaryNumeric083
     * @tc.desc Verify sort places NaN at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, NaN, 1.0, NaN, 2.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0840
     * @tc.name testFloat64ArrayBoundaryNumeric084
     * @tc.desc Verify toSorted places NaN at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, NaN, 1.0);
      const r = arr.toSorted();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0850
     * @tc.name testFloat64ArrayBoundaryNumeric085
     * @tc.desc Verify reduce propagates NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const r = arr.reduce((a: number, v: number): number => a + v, 0.0);
      expect(r).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0860
     * @tc.name testFloat64ArrayBoundaryNumeric086
     * @tc.desc Verify NaN in map transformed remains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN);
      const r = arr.map((v: number): number => v + 1.0);
      expect(r.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0870
     * @tc.name testFloat64ArrayBoundaryNumeric087
     * @tc.desc Verify NaN * 0 = NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN);
      const r = arr.map((v: number): number => v * 0.0);
      expect(r.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0880
     * @tc.name testFloat64ArrayBoundaryNumeric088
     * @tc.desc Verify fill NaN then read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(NaN);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertNaN();
      expect(arr.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0890
     * @tc.name testFloat64ArrayBoundaryNumeric089
     * @tc.desc Verify NaN and Infinity in same array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, NaN, 1.0, Infinity, -Infinity, NaN);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 2.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = Infinity;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0900
     * @tc.name testFloat64ArrayBoundaryNumeric090
     * @tc.desc Verify findLast via isNaN finds last NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 1.0, NaN, 2.0);
      const r = arr.findLast((v: number): boolean => isNaN(v));
      expect(r).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0910
     * @tc.name testFloat64ArrayBoundaryNumeric091
     * @tc.desc Verify set NaN preserves NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0920
     * @tc.name testFloat64ArrayBoundaryNumeric092
     * @tc.desc Verify $_set NaN preserves NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      arr.$_set(0, NaN);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0930
     * @tc.name testFloat64ArrayBoundaryNumeric093
     * @tc.desc Verify reverse with NaN element preserves position relative to other elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      arr.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0940
     * @tc.name testFloat64ArrayBoundaryNumeric094
     * @tc.desc Verify copyWithin with NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 2.0, NaN, 4.0);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertNaN();
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 4.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0950
     * @tc.name testFloat64ArrayBoundaryNumeric095
     * @tc.desc Verify every with NaN returns false for isNaN predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const r = arr.every((v: number): boolean => !isNaN(v));
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0960
     * @tc.name testFloat64ArrayBoundaryNumeric096
     * @tc.desc Verify some with NaN returns true for isNaN predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const r = arr.some((v: number): boolean => isNaN(v));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0970
     * @tc.name testFloat64ArrayBoundaryNumeric097
     * @tc.desc Verify forEach with NaN counts NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      let count: int = 0;
      arr.forEach((): void => {
        count++;
      });
      const actualResult = count;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0980
     * @tc.name testFloat64ArrayBoundaryNumeric098
     * @tc.desc Verify with NaN value creates new array with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r = arr.with(0, NaN);
      expect(r.$_get(0)).assertNaN();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_0990
     * @tc.name testFloat64ArrayBoundaryNumeric099
     * @tc.desc Verify toLocaleString renders a NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const r = arr.toLocaleString();
      const actualResult = r;
      const expectedResult: string = "1,NaN,3";
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1000
     * @tc.name testFloat64ArrayBoundaryNumeric100
     * @tc.desc Verify $_get on NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 2.0);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1010
     * @tc.name testFloat64ArrayBoundaryNumeric101
     * @tc.desc Verify valueOf alias write affects original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const alias: Float64Array = arr.valueOf();
      alias.$_set(0, 9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1020
     * @tc.name testFloat64ArrayBoundaryNumeric102
     * @tc.desc Verify subarray child write affects parent slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0);
      const child: Float64Array = parent.subarray(1, 3);
      child.$_set(0, 8.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 8.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1030
     * @tc.name testFloat64ArrayBoundaryNumeric103
     * @tc.desc Verify parent write affects subarray child slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const child: Float64Array = parent.subarray(1);
      parent.$_set(2, 7.0);
      const actualElement1 = child.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1040
     * @tc.name testFloat64ArrayBoundaryNumeric104
     * @tc.desc Verify slice copy write does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const copy: Float64Array = arr.slice();
      copy.$_set(0, 9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1050
     * @tc.name testFloat64ArrayBoundaryNumeric105
     * @tc.desc Verify map result write does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const mapped: Float64Array = arr.map((v: number): number => v * 2.0);
      mapped.$_set(0, 99.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1060
     * @tc.name testFloat64ArrayBoundaryNumeric106
     * @tc.desc Verify filter result write does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, Number.MAX_SAFE_INTEGER, -0.0);
      const filtered: Float64Array = arr.filter((v: number): boolean => v > 1.0);
      filtered.$_set(0, 88.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1070
     * @tc.name testFloat64ArrayBoundaryNumeric107
     * @tc.desc Verify toReversed result write does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: Float64Array = arr.toReversed();
      r.$_set(0, 99.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1080
     * @tc.name testFloat64ArrayBoundaryNumeric108
     * @tc.desc Verify toSorted result write does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 1.0);
      const r: Float64Array = arr.toSorted();
      r.$_set(0, 99.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1090
     * @tc.name testFloat64ArrayBoundaryNumeric109
     * @tc.desc Verify with result write does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: Float64Array = arr.with(0, 7.0);
      r.$_set(1, 8.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1100
     * @tc.name testFloat64ArrayBoundaryNumeric110
     * @tc.desc Verify reverse return value aliases original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: Float64Array = arr.reverse();
      r.$_set(0, 9.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 9.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1110
     * @tc.name testFloat64ArrayBoundaryNumeric111
     * @tc.desc Verify sort return value aliases original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 1.0);
      const r: Float64Array = arr.sort();
      r.$_set(1, 9.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 9.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1120
     * @tc.name testFloat64ArrayBoundaryNumeric112
     * @tc.desc Verify fill return value aliases original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: Float64Array = arr.fill(5.0);
      r.$_set(0, 6.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 6.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1130
     * @tc.name testFloat64ArrayBoundaryNumeric113
     * @tc.desc Verify copyWithin return value aliases original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, -0.0, Number.MAX_SAFE_INTEGER);
      const r: Float64Array = arr.copyWithin(1, 0, 1);
      r.$_set(2, 7.0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 7.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1140
     * @tc.name testFloat64ArrayBoundaryNumeric114
     * @tc.desc Verify subarray of subarray still shares parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const a: Float64Array = parent.subarray(1);
      const b: Float64Array = a.subarray(1);
      b.$_set(0, 33.0);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 33.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1150
     * @tc.name testFloat64ArrayBoundaryNumeric115
     * @tc.desc Verify slice of subarray breaks sharing with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(NaN, Infinity, -Infinity);
      const child: Float64Array = parent.subarray(1);
      const copy: Float64Array = child.slice();
      copy.$_set(0, 99.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1160
     * @tc.name testFloat64ArrayBoundaryNumeric116
     * @tc.desc Verify valueOf followed by slice creates copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const copy: Float64Array = arr.valueOf().slice();
      copy.$_set(0, 77.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1170
     * @tc.name testFloat64ArrayBoundaryNumeric117
     * @tc.desc Verify valueOf followed by subarray shares original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const child: Float64Array = arr.valueOf().subarray(1);
      child.$_set(0, 88.0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 88.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1180
     * @tc.name testFloat64ArrayBoundaryNumeric118
     * @tc.desc Verify toReversed then reverse mutates only copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_VALUE, -0.0);
      const r: Float64Array = arr.toReversed();
      r.reverse();
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = Number.MAX_SAFE_INTEGER;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1190
     * @tc.name testFloat64ArrayBoundaryNumeric119
     * @tc.desc Verify toSorted then sort mutates only copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const r: Float64Array = arr.toSorted();
      r.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1200
     * @tc.name testFloat64ArrayBoundaryNumeric120
     * @tc.desc Verify with then fill mutates only copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const r: Float64Array = arr.with(0, 9.0);
      r.fill(7.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 7.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1210
     * @tc.name testFloat64ArrayBoundaryNumeric121
     * @tc.desc Verify map then reverse mutates only mapped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, Infinity);
      const r: Float64Array = arr.map((v: number): number => v + 10.0);
      r.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MIN_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = Infinity;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BOUNDARY_NUMERIC_1220
     * @tc.name testFloat64ArrayBoundaryNumeric122
     * @tc.desc Verify filter then sort mutates only filtered result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBoundaryNumeric122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
