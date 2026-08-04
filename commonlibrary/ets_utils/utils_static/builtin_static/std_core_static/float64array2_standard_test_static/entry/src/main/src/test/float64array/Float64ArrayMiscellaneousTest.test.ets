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

export default function Float64ArrayMiscellaneousTest(): void {
  describe('Float64ArrayMiscellaneousTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0100
     * @tc.name testFloat64ArrayMiscellaneous001
     * @tc.desc Verify 0-param closure callback every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const r = arr.every((): boolean => {
        return true;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0200
     * @tc.name testFloat64ArrayMiscellaneous002
     * @tc.desc Verify every AND condition value>1 && value<5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([2.0, 3.0, 4.0]);
      const r = arr.every((v: number): boolean => {
        return v > 1.0 && v < 5.0;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0300
     * @tc.name testFloat64ArrayMiscellaneous003
     * @tc.desc Verify every OR condition value<0 || value>8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 9.0, 3.0]);
      const r = arr.every((v: number): boolean => {
        return v < 0.0 || v > 8.0;
      });
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0400
     * @tc.name testFloat64ArrayMiscellaneous004
     * @tc.desc Verify every index>1 short-circuits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      let calls: int = 0;
      const r = arr.every((v: number, i: int): boolean => {
        calls++;
        return i > 1;
      });
      expect(r).assertFalse();
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0500
     * @tc.name testFloat64ArrayMiscellaneous005
     * @tc.desc Verify every callback array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alen: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.every((v: number, i: int, a: Float64Array): boolean => {
        alen = a.byteLength;
        return true;
      });
      const actualResult = alen;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0600
     * @tc.name testFloat64ArrayMiscellaneous006
     * @tc.desc Verify every callback array.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bo: number = -1;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.every((v: number, i: int, a: Float64Array): boolean => {
        bo = a.byteOffset;
        return true;
      });
      const actualResult = bo;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0700
     * @tc.name testFloat64ArrayMiscellaneous007
     * @tc.desc Verify every callback array.buffer same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer | null = null;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.every((v: number, i: int, a: Float64Array): boolean => {
        buf = a.buffer;
        return true;
      });
      expect(buf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0800
     * @tc.name testFloat64ArrayMiscellaneous008
     * @tc.desc Verify 0-param closure callback some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const r = arr.some((): boolean => {
        return true;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_0900
     * @tc.name testFloat64ArrayMiscellaneous009
     * @tc.desc Verify some AND condition value>1 && value<5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 3.0, 5.0]);
      const r = arr.some((v: number): boolean => {
        return v > 1.0 && v < 5.0;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1000
     * @tc.name testFloat64ArrayMiscellaneous010
     * @tc.desc Verify some OR condition value<0 || value>8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 9.0, 3.0]);
      const r = arr.some((v: number): boolean => {
        return v < 0.0 || v > 8.0;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1100
     * @tc.name testFloat64ArrayMiscellaneous011
     * @tc.desc Verify some index>1 short-circuits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      let calls: int = 0;
      const r = arr.some((v: number, i: int): boolean => {
        calls++;
        return i > 1;
      });
      expect(r).assertTrue();
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1200
     * @tc.name testFloat64ArrayMiscellaneous012
     * @tc.desc Verify some callback array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alen: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.some((v: number, i: int, a: Float64Array): boolean => {
        alen = a.byteLength;
        return true;
      });
      const actualResult = alen;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1300
     * @tc.name testFloat64ArrayMiscellaneous013
     * @tc.desc Verify some callback array.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bo: number = -1;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.some((v: number, i: int, a: Float64Array): boolean => {
        bo = a.byteOffset;
        return true;
      });
      const actualResult = bo;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1400
     * @tc.name testFloat64ArrayMiscellaneous014
     * @tc.desc Verify some callback array.buffer same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer | null = null;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.some((v: number, i: int, a: Float64Array): boolean => {
        buf = a.buffer;
        return true;
      });
      expect(buf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1500
     * @tc.name testFloat64ArrayMiscellaneous015
     * @tc.desc Verify filter callback array instanceof Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isF64: boolean = false;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.filter((v: number, i: int, a: Float64Array): boolean => {
        isF64 = a instanceof Float64Array;
        return true;
      });
      expect(isF64).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1600
     * @tc.name testFloat64ArrayMiscellaneous016
     * @tc.desc Verify filter callback array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bl: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.filter((v: number, i: int, a: Float64Array): boolean => {
        bl = a.byteLength;
        return true;
      });
      const actualResult = bl;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1700
     * @tc.name testFloat64ArrayMiscellaneous017
     * @tc.desc Verify filter callback array.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bo: number = -1;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.filter((v: number, i: int, a: Float64Array): boolean => {
        bo = a.byteOffset;
        return true;
      });
      const actualResult = bo;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1800
     * @tc.name testFloat64ArrayMiscellaneous018
     * @tc.desc Verify filter callback array.buffer same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer | null = null;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.filter((v: number, i: int, a: Float64Array): boolean => {
        buf = a.buffer;
        return true;
      });
      expect(buf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_1900
     * @tc.name testFloat64ArrayMiscellaneous019
     * @tc.desc Verify AND compound predicate filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.filter((v: number): boolean => {
        return v > 2.0 && v < 5.0;
      });
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualResult = r[0];
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2000
     * @tc.name testFloat64ArrayMiscellaneous020
     * @tc.desc Verify map callback array instanceof Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isF64: boolean = false;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.map((v: number, i: int, a: Float64Array): number => {
        isF64 = a instanceof Float64Array;
        return v;
      });
      expect(isF64).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2100
     * @tc.name testFloat64ArrayMiscellaneous021
     * @tc.desc Verify map callback array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bl: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.map((v: number, i: int, a: Float64Array): number => {
        bl = a.byteLength;
        return v;
      });
      const actualResult = bl;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2200
     * @tc.name testFloat64ArrayMiscellaneous022
     * @tc.desc Verify map callback array.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bo: number = -1;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.map((v: number, i: int, a: Float64Array): number => {
        bo = a.byteOffset;
        return v;
      });
      const actualResult = bo;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2300
     * @tc.name testFloat64ArrayMiscellaneous023
     * @tc.desc Verify map callback a[0] equals v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matchA0: boolean = true;
      const arr = new Float64Array([42.0, 2.0]);
      arr.map((v: number, i: int, a: Float64Array): number => {
        if (i === 0 && a[0] !== v) {
          matchA0 = false;
        }
        return v;
      });
      expect(matchA0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2400
     * @tc.name testFloat64ArrayMiscellaneous024
     * @tc.desc Verify map callback a.$_get(i) equals v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let match: boolean = true;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.map((v: number, i: int, a: Float64Array): number => {
        if (a.$_get(i) !== v) {
          match = false;
        }
        return v;
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2500
     * @tc.name testFloat64ArrayMiscellaneous025
     * @tc.desc Verify of() zero args returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of();
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2600
     * @tc.name testFloat64ArrayMiscellaneous026
     * @tc.desc Verify of(1.0) single arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2700
     * @tc.name testFloat64ArrayMiscellaneous027
     * @tc.desc Verify of(1.0,2.0,3.0) three args byteLength 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 24;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2800
     * @tc.name testFloat64ArrayMiscellaneous028
     * @tc.desc Verify of(NaN, Infinity) special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity);
      const actualLength = arr.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      expect(arr.$_get(0)).assertNaN();
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_2900
     * @tc.name testFloat64ArrayMiscellaneous029
     * @tc.desc Verify of(-Infinity, 0, -0) preserves -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-Infinity, 0.0, -0.0);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement2Second = 1 / arr.$_get(2);
      const expectedElement2Second: number = -Infinity;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3000
     * @tc.name testFloat64ArrayMiscellaneous030
     * @tc.desc Verify of(number variable) double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstResult: number = 0.1;
      const secondResult: number = 0.2;
      const arr: Float64Array = Float64Array.of(firstResult, secondResult);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.1;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.2;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3100
     * @tc.name testFloat64ArrayMiscellaneous031
     * @tc.desc Verify of() with length/byteLength consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 40;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3200
     * @tc.name testFloat64ArrayMiscellaneous032
     * @tc.desc Verify from empty array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([]);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3300
     * @tc.name testFloat64ArrayMiscellaneous033
     * @tc.desc Verify from array source three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0]);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3400
     * @tc.name testFloat64ArrayMiscellaneous034
     * @tc.desc Verify from with Int32Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array([10, 20]);
      const arr: Float64Array = Float64Array.from(src);
      const actualLength = arr.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 20;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3500
     * @tc.name testFloat64ArrayMiscellaneous035
     * @tc.desc Verify from applies mapFn to each source value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0], (v: number): number => v * 10);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3600
     * @tc.name testFloat64ArrayMiscellaneous036
     * @tc.desc Verify from with mapFn returning constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([1.0, 2.0, 3.0], (): number => 7.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 7.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3700
     * @tc.name testFloat64ArrayMiscellaneous037
     * @tc.desc Verify from array with NaN/Infinity elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.from([NaN, Infinity]);
      expect(arr.$_get(0)).assertNaN();
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3800
     * @tc.name testFloat64ArrayMiscellaneous038
     * @tc.desc Verify reduce callback array parameter byteLength equals 24 for 3-element Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      let capturedByteLen: number = 0;
      arr.reduce((sum: number, val: number, idx: int, ary: Float64Array): number => {
        capturedByteLen = ary.byteLength;
        return sum + val;
      }, 0.0);
      const actualResult = capturedByteLen;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_3900
     * @tc.name testFloat64ArrayMiscellaneous039
     * @tc.desc Verify reduce callback throw does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        arr.reduce((sum: number, val: number, idx: int): number => {
          if (idx === 2) {
            throw new Error("stop");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'stop';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(arr.length).assertEqual(fourValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4000
     * @tc.name testFloat64ArrayMiscellaneous040
     * @tc.desc Verify reduceRight callback array parameter byteLength equals 24 for 3-element Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      let capturedByteLen: number = 0;
      arr.reduceRight((prev: number, curr: number, idx: int, ary: Float64Array): number => {
        capturedByteLen = ary.byteLength;
        return prev + curr;
      }, 0.0);
      const actualResult = capturedByteLen;
      const expectedResult: number = 24;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4100
     * @tc.name testFloat64ArrayMiscellaneous041
     * @tc.desc Verify reduceRight callback throw does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      try {
        arr.reduceRight((prev: number, curr: number, idx: int): number => {
          if (idx === 1) {
            throw new Error("stop");
          }
          return prev + curr;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const actualMessage = e.message;
        const expectedMessage: string = 'stop';
        expect(actualMessage).assertEqual(expectedMessage);
        expect(arr.length).assertEqual(fourValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4200
     * @tc.name testFloat64ArrayMiscellaneous042
     * @tc.desc Verify Float64Array join returns comma-separated values by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const actualString = arr.join();
      const expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4300
     * @tc.name testFloat64ArrayMiscellaneous043
     * @tc.desc Verify Float64Array join uses the provided separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const actualString = arr.join('-');
      const expectedString: string = '1-2-3';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4400
     * @tc.name testFloat64ArrayMiscellaneous044
     * @tc.desc Verify Float64Array toString returns comma-separated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const actualString = arr.toString();
      const expectedString: string = '1,2';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4500
     * @tc.name testFloat64ArrayMiscellaneous045
     * @tc.desc Verify Float64Array toString returns a single value for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0]);
      const actualString = arr.toString();
      const expectedString: string = '5';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4600
     * @tc.name testFloat64ArrayMiscellaneous046
     * @tc.desc Verify Float64Array valueOf returns the same mutable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      const r: Float64Array = arr.valueOf();
      r.$_set(0, 99.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4700
     * @tc.name testFloat64ArrayMiscellaneous047
     * @tc.desc Verify Float64Array every visits positive elements with index callback input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let sumIndex: number = 0;
      const r: boolean = arr.every((v: number, i: int): boolean => {
        sumIndex = sumIndex + i;
        return v > 0;
      });
      expect(r).assertTrue();
      const actualResult = sumIndex;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4800
     * @tc.name testFloat64ArrayMiscellaneous048
     * @tc.desc Verify Float64Array some returns true when a later element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([5.0, 6.0, 7.0]);
      const r: boolean = arr.some((v: number): boolean => v > 6);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_4900
     * @tc.name testFloat64ArrayMiscellaneous049
     * @tc.desc Verify Float64Array forEach visits each value for accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let sum: number = 0;
      arr.forEach((v: number): void => {
        sum = sum + v;
      });
      const actualResult = sum;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5000
     * @tc.name testFloat64ArrayMiscellaneous050
     * @tc.desc Verify Float64Array map returns constant values for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float64Array = arr.map((v: number): number => 5.0);
      const actualLength = r.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = r.$_get(3);
      const expectedElement3: number = 5.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5100
     * @tc.name testFloat64ArrayMiscellaneous051
     * @tc.desc Verify Float64Array map preserves NaN callback results and default byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const r: Float64Array = arr.map((v: number): number => NaN);
      expect(r.$_get(0)).assertNaN();
      const actualByteOffset = r.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5200
     * @tc.name testFloat64ArrayMiscellaneous052
     * @tc.desc Verify Float64Array filter returns all elements when callback is always true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float64Array = arr.filter((v: number): boolean => true);
      const actualLength = r.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5300
     * @tc.name testFloat64ArrayMiscellaneous053
     * @tc.desc Verify Float64Array filter returns an empty typed array when callback is always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float64Array = arr.filter((v: number): boolean => false);
      const actualLength = r.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteLength = r.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5400
     * @tc.name testFloat64ArrayMiscellaneous054
     * @tc.desc Verify Float64Array filter can select even index positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const r: Float64Array = arr.filter((v: number, i: int): boolean => i % 2 === 0);
      const actualLength = r.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = r.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = r.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5500
     * @tc.name testFloat64ArrayMiscellaneous055
     * @tc.desc Verify Float64Array reduce accumulates all values with an initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0]);
      let calls: number = 0;
      const r: number = arr.reduce((acc: number, v: number): number => {
        calls++;
        return acc + v;
      }, 0);
      const actualResult = r;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = calls;
      const expectedResultSecond: number = 3;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5600
     * @tc.name testFloat64ArrayMiscellaneous056
     * @tc.desc Verify repeated Float64Array $_set calls keep the latest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr.$_set(0, 1.0);
      arr.$_set(0, 2.0);
      arr.$_set(0, 3.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5700
     * @tc.name testFloat64ArrayMiscellaneous057
     * @tc.desc Verify Float64Array toLocaleString returns exact numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      const r: string = arr.toLocaleString('en-US');
      const actualResult = r;
      const expectedResult: string = '1,2';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MISCELLANEOUS_5800
     * @tc.name testFloat64ArrayMiscellaneous058
     * @tc.desc Verify business pipeline call order handles critical static values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMiscellaneous058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const metrics: Float64Array = new Float64Array(0x4);
      metrics.$_set(0, 1e-308);
      metrics.$_set(0b1, 3.0);
      metrics.$_set(0o2, 2.0);
      metrics.$_set(3, Number.MAX_VALUE);
      const beforeAfter = metrics.slice(1, 4).sort().join(',');
      const afterBefore = metrics.sort().slice(1, 4).join(',');
      const actualResult = beforeAfter;
      const expectedResult: string = '2,3,1.7976931348623157e+308';
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = afterBefore;
      const expectedResultSecond: string = '2,3,1.7976931348623157e+308';
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });
  })
}
