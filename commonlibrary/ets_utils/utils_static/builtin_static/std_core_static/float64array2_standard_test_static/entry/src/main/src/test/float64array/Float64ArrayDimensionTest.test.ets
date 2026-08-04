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

export default function Float64ArrayDimensionTest(): void {
  describe('Float64ArrayDimensionTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0010
     * @tc.name testFloat64ArrayDimension001
     * @tc.desc Verify fill on 2000-element array sets all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(3.1415);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 3.1415;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt1999 = arr.$_get(1999);
      const expectedElementAt1999: number = 3.1415;
      expect(actualElementAt1999).assertEqual(expectedElementAt1999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0020
     * @tc.name testFloat64ArrayDimension002
     * @tc.desc Verify every on 2000-element filled array returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(5.0);
      const r: boolean = arr.every((v: number): boolean => {
        return v > 0.0;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0030
     * @tc.name testFloat64ArrayDimension003
     * @tc.desc Verify reduce sum of 2000 elements 1..2000 = 2001000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, i + 1);
      }
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = 2001000.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0040
     * @tc.name testFloat64ArrayDimension004
     * @tc.desc Verify forEach counts 2000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(1.0);
      let cnt: int = 0;
      arr.forEach((v: number): void => {
        cnt++;
      });
      const actualResult = cnt;
      const expectedResult: number = 2000;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0050
     * @tc.name testFloat64ArrayDimension005
     * @tc.desc Verify map multiplies each value by three in 2000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(2.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * 3.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 6.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt1999 = mapped.$_get(1999);
      const expectedElementAt1999: number = 6.0;
      expect(actualElementAt1999).assertEqual(expectedElementAt1999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0060
     * @tc.name testFloat64ArrayDimension006
     * @tc.desc Verify map transforms 10000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      arr.fill(3.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v + 1.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt9999 = mapped.$_get(9999);
      const expectedElementAt9999: number = 4.0;
      expect(actualElementAt9999).assertEqual(expectedElementAt9999);
      const actualLength = mapped.length;
      const expectedLength: int = 10000;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0070
     * @tc.name testFloat64ArrayDimension007
     * @tc.desc Verify indexOf finds value in 2000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.$_set(500, 42.0);
      const idx: int = arr.indexOf(42.0);
      const actualResult = idx;
      const expectedResult: number = 500;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0080
     * @tc.name testFloat64ArrayDimension008
     * @tc.desc Verify join on 2000-element array produces string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(1.0);
      const s: string = arr.join(',');
      const actualLength = s.length;
      const expectedLength: int = 3999;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0090
     * @tc.name testFloat64ArrayDimension009
     * @tc.desc Verify join on 5000-element array with default separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5000);
      arr.fill(2.0);
      const s: string = arr.join();
      const actualLength = s.length;
      const expectedLength: int = 9999;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0100
     * @tc.name testFloat64ArrayDimension010
     * @tc.desc Verify copyWithin forward on 2000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, i + 1);
      }
      arr.copyWithin(0, 1000, 1005);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1001.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt4 = arr.$_get(4);
      const expectedElementAt4: number = 1005.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0110
     * @tc.name testFloat64ArrayDimension011
     * @tc.desc Verify copyWithin backward on 10000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      for (let i: int = 0; i < 10000; i++) {
        arr.$_set(i, i + 1);
      }
      arr.copyWithin(5000, 0, 5);
      const actualElementAt5000 = arr.$_get(5000);
      const expectedElementAt5000: number = 1.0;
      expect(actualElementAt5000).assertEqual(expectedElementAt5000);
      const actualElementAt5004 = arr.$_get(5004);
      const expectedElementAt5004: number = 5.0;
      expect(actualElementAt5004).assertEqual(expectedElementAt5004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0120
     * @tc.name testFloat64ArrayDimension012
     * @tc.desc Verify filter then map chain on 2000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, i + 1);
      }
      const filtered: Float64Array = arr.filter((v: number): boolean => {
        return v > 1000.0;
      });
      const mapped: Float64Array = filtered.map((v: number): number => {
        return v * 2.0;
      });
      const actualLength = mapped.length;
      const expectedLength: int = 1000;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 2002.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0130
     * @tc.name testFloat64ArrayDimension013
     * @tc.desc Verify values() iterator yields 2000 elements summing to 2001000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, i + 1);
      }
      let sum: number = 0.0;
      for (const v of arr.values()) {
        sum += v;
      }
      const actualResult = sum;
      const expectedResult: number = 2001000.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0140
     * @tc.name testFloat64ArrayDimension014
     * @tc.desc Verify entries() iterator yields 5000 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5000);
      arr.fill(7.0);
      let cnt: int = 0;
      for (const _e of arr.entries()) {
        cnt++;
      }
      const actualResult = cnt;
      const expectedResult: number = 5000;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0150
     * @tc.name testFloat64ArrayDimension015
     * @tc.desc Verify keys() iterator yields 10000 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      let cnt: int = 0;
      for (const _k of arr.keys()) {
        cnt++;
      }
      const actualResult = cnt;
      const expectedResult: number = 10000;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0160
     * @tc.name testFloat64ArrayDimension016
     * @tc.desc Verify for...of iterates 2000 elements summing to 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(1.0);
      let sum: number = 0.0;
      for (const v of arr) {
        sum += v;
      }
      const actualResult = sum;
      const expectedResult: number = 2000.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0170
     * @tc.name testFloat64ArrayDimension017
     * @tc.desc Verify set fills 5000-element array from typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = new Float64Array(500);
      src.fill(3.0);
      const dst: Float64Array = new Float64Array(5000);
      dst.set(src);
      const actualElement0 = dst.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt499 = dst.$_get(499);
      const expectedElementAt499: number = 3.0;
      expect(actualElementAt499).assertEqual(expectedElementAt499);
      const actualElementAt500 = dst.$_get(500);
      const expectedElementAt500: number = 0.0;
      expect(actualElementAt500).assertEqual(expectedElementAt500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0180
     * @tc.name testFloat64ArrayDimension018
     * @tc.desc Verify set fills 10000-element array at offset 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = new Float64Array(100);
      src.fill(9.0);
      const dst: Float64Array = new Float64Array(10000);
      dst.set(src, 500);
      const actualElementAt500 = dst.$_get(500);
      const expectedElementAt500: number = 9.0;
      expect(actualElementAt500).assertEqual(expectedElementAt500);
      const actualElementAt599 = dst.$_get(599);
      const expectedElementAt599: number = 9.0;
      expect(actualElementAt599).assertEqual(expectedElementAt599);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0190
     * @tc.name testFloat64ArrayDimension019
     * @tc.desc Verify sort on 2000-element descending array produces ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, 2000 - i);
      }
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt1999 = arr.$_get(1999);
      const expectedElementAt1999: number = 2000.0;
      expect(actualElementAt1999).assertEqual(expectedElementAt1999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0200
     * @tc.name testFloat64ArrayDimension020
     * @tc.desc Verify reverse on 2000-element array reverses order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, i + 1);
      }
      arr.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2000.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt1999 = arr.$_get(1999);
      const expectedElementAt1999: number = 1.0;
      expect(actualElementAt1999).assertEqual(expectedElementAt1999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0210
     * @tc.name testFloat64ArrayDimension021
     * @tc.desc Verify reverse on 10000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      for (let i: int = 0; i < 10000; i++) {
        arr.$_set(i, i + 1);
      }
      arr.reverse();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 10000.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0220
     * @tc.name testFloat64ArrayDimension022
     * @tc.desc Verify toString on 2000-element array produces string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(1.0);
      const s: string = arr.toString();
      const actualLength = s.length;
      const expectedLength: int = 3999;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0230
     * @tc.name testFloat64ArrayDimension023
     * @tc.desc Verify subarray on 2000-element array returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(5.0);
      const sub: Float64Array = arr.subarray(0, 100);
      const actualLength = sub.length;
      const expectedLength: int = 100;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sub.$_get(0);
      const expectedElement0: number = 5.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0240
     * @tc.name testFloat64ArrayDimension024
     * @tc.desc Verify subarray on 10000-element array middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      arr.fill(3.0);
      const sub: Float64Array = arr.subarray(100, 200);
      const actualLength = sub.length;
      const expectedLength: int = 100;
      expect(actualLength).assertEqual(expectedLength);
      const actualByteOffset = sub.byteOffset;
      const expectedByteOffset: int = 800;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0250
     * @tc.name testFloat64ArrayDimension025
     * @tc.desc Verify slice on 2000-element array returns correct copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      arr.fill(7.0);
      const sliced: Float64Array = arr.slice(0, 50);
      const actualLength = sliced.length;
      const expectedLength: int = 50;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = sliced.$_get(0);
      const expectedElement0: number = 7.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0260
     * @tc.name testFloat64ArrayDimension026
     * @tc.desc Verify byteLength of 2000-element array is 16000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      const actualByteLength = arr.byteLength;
      const expectedByteLength: int = 16000;
      expect(actualByteLength).assertEqual(expectedByteLength);
      const actualLength = arr.length;
      const expectedLength: int = 2000;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0270
     * @tc.name testFloat64ArrayDimension027
     * @tc.desc Verify toSorted on 2000-element array returns sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, 2000 - i);
      }
      const sorted: Float64Array = arr.toSorted();
      const actualElement0 = sorted.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt1999 = sorted.$_get(1999);
      const expectedElementAt1999: number = 2000.0;
      expect(actualElementAt1999).assertEqual(expectedElementAt1999);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 2000.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0280
     * @tc.name testFloat64ArrayDimension028
     * @tc.desc Verify toReversed on 2000-element array returns reversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2000);
      for (let i: int = 0; i < 2000; i++) {
        arr.$_set(i, i + 1);
      }
      const rev: Float64Array = arr.toReversed();
      const actualElement0 = rev.$_get(0);
      const expectedElement0: number = 2000.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt1999 = rev.$_get(1999);
      const expectedElementAt1999: number = 1.0;
      expect(actualElementAt1999).assertEqual(expectedElementAt1999);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0290
     * @tc.name testFloat64ArrayDimension029
     * @tc.desc Verify sort with compareFn on 10000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      for (let i: int = 0; i < 10000; i++) {
        arr.$_set(i, 10000 - i);
      }
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt9999 = arr.$_get(9999);
      const expectedElementAt9999: number = 10000.0;
      expect(actualElementAt9999).assertEqual(expectedElementAt9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0300
     * @tc.name testFloat64ArrayDimension030
     * @tc.desc Verify toReversed on 10000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10000);
      arr.fill(3.0);
      const rev: Float64Array = arr.toReversed();
      const actualLength = rev.length;
      const expectedLength: int = 10000;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = rev.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0310
     * @tc.name testFloat64ArrayDimension031
     * @tc.desc Verify map on 20000-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(20000);
      arr.fill(1.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v + 1.0;
      });
      const actualLength = mapped.length;
      const expectedLength: int = 20000;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0320
     * @tc.name testFloat64ArrayDimension032
     * @tc.desc Verify findLast finds subnormal 5e-324 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 3.0);
      const r = arr.findLast((v: number): boolean => {
        return v < 1.0;
      });
      const actualResult = r;
      const expectedResult: number = 5e-324;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0330
     * @tc.name testFloat64ArrayDimension033
     * @tc.desc Verify findLast finds subnormal 1e-323 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e-323, 2.0, 3.0);
      const r = arr.findLast((v: number): boolean => {
        return v > 0.0 && v < 1.0;
      });
      const actualResult = r;
      const expectedResult: number = 1e-323;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0340
     * @tc.name testFloat64ArrayDimension034
     * @tc.desc Verify findLastIndex finds subnormal 5e-324 at correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 2.0);
      const idx: int = arr.findLastIndex((v: number): boolean => {
        return v < 1.0;
      });
      const actualResult = idx;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0350
     * @tc.name testFloat64ArrayDimension035
     * @tc.desc Verify findLastIndex locates subnormal 1e-323 at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 2.0, 1e-323);
      const idx: int = arr.findLastIndex((v: number): boolean => {
        return v < 1.0;
      });
      const actualResult = idx;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0360
     * @tc.name testFloat64ArrayDimension036
     * @tc.desc Verify reduceRight sums array containing subnormal 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 1.0);
      const sum: number = arr.reduceRight((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      expect(sum).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0370
     * @tc.name testFloat64ArrayDimension037
     * @tc.desc Verify reduceRight with subnormal 1e-323 accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1e-323, 2.0, 3.0);
      const sum: number = arr.reduceRight((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0380
     * @tc.name testFloat64ArrayDimension038
     * @tc.desc Verify toSorted includes subnormal 5e-324 in sorted output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 5e-324, 1.0);
      const sorted: Float64Array = arr.toSorted();
      const actualElement0 = sorted.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0390
     * @tc.name testFloat64ArrayDimension039
     * @tc.desc Verify findLast with mixed subnormal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1e-323, 5e-324);
      const r = arr.findLast((v: number): boolean => {
        return v === 5e-324;
      });
      const actualResult = r;
      const expectedResult: number = 5e-324;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0400
     * @tc.name testFloat64ArrayDimension040
     * @tc.desc Verify findLastIndex with subnormal at start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1e-323, 2.0);
      const idx: int = arr.findLastIndex((v: number): boolean => {
        return v === 5e-324;
      });
      const actualResult = idx;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0410
     * @tc.name testFloat64ArrayDimension041
     * @tc.desc Verify reduceRight accumulates subnormals into sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1e-323);
      const sum: number = arr.reduceRight((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      expect(sum).assertEqual(1.5e-323);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0420
     * @tc.name testFloat64ArrayDimension042
     * @tc.desc Verify toSorted with subnormals and normal values preserves subnormals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 5e-324, 3.0, 1e-323, 1.0);
      const sorted: Float64Array = arr.toSorted();
      const actualElement0 = sorted.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = sorted.$_get(1);
      const expectedElement1: number = 1e-323;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0430
     * @tc.name testFloat64ArrayDimension043
     * @tc.desc Verify findLast with subnormal at end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 2.0, 1e-323);
      const r = arr.findLast((v: number): boolean => {
        return v < 1.0;
      });
      const actualResult = r;
      const expectedResult: number = 1e-323;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0440
     * @tc.name testFloat64ArrayDimension044
     * @tc.desc Verify reduceRight subtract with subnormals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 5e-324, 1e-323);
      const r = arr.reduceRight((acc: number, v: number): number => {
        return acc - v;
      }, 0.0);
      expect(r).assertEqual(-10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0450
     * @tc.name testFloat64ArrayDimension045
     * @tc.desc Verify every detects -0 via 1.0/x returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 1.0, 2.0);
      let found: boolean = false;
      arr.every((v: number): boolean => {
        if (1.0 / v === -Infinity) {
          found = true;
        }
        return true;
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0460
     * @tc.name testFloat64ArrayDimension046
     * @tc.desc Verify some detects -0 via 1.0/x sign check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -0.0, 3.0);
      const r: boolean = arr.some((v: number): boolean => {
        return 1.0 / v === -Infinity;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0470
     * @tc.name testFloat64ArrayDimension047
     * @tc.desc Verify forEach identifies -0 element by sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -0.0, 3.0);
      let foundNegZero: boolean = false;
      arr.forEach((v: number): void => {
        if (1.0 / v === -Infinity) {
          foundNegZero = true;
        }
      });
      expect(foundNegZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0480
     * @tc.name testFloat64ArrayDimension048
     * @tc.desc Verify every detects -0 not equal to +0 in sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 0.0);
      let hasNegZero: boolean = false;
      let hasPosZero: boolean = false;
      arr.every((v: number): boolean => {
        if (1.0 / v === -Infinity) {
          hasNegZero = true;
        }
        if (1.0 / v === Infinity) {
          hasPosZero = true;
        }
        return true;
      });
      expect(hasNegZero).assertTrue();
      expect(hasPosZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0490
     * @tc.name testFloat64ArrayDimension049
     * @tc.desc Verify some detects only -0 not +0 in mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, 2.0, -0.0);
      let negCount: int = 0;
      arr.some((v: number): boolean => {
        if (1.0 / v === -Infinity) {
          negCount++;
        }
        return false;
      });
      expect(negCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0500
     * @tc.name testFloat64ArrayDimension050
     * @tc.desc Verify forEach counts -0 elements separately from +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 0.0, -0.0, 0.0);
      let nz: int = 0;
      let pz: int = 0;
      arr.forEach((v: number): void => {
        if (1.0 / v === -Infinity) {
          nz++;
        }
        if (1.0 / v === Infinity) {
          pz++;
        }
      });
      const actualResult = nz;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = pz;
      const expectedResultSecond: number = 2;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0510
     * @tc.name testFloat64ArrayDimension051
     * @tc.desc Verify every on all -0 returns true from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, -0.0, -0.0);
      const r: boolean = arr.every((v: number): boolean => {
        return 1.0 / v === -Infinity;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0520
     * @tc.name testFloat64ArrayDimension052
     * @tc.desc Verify some with -0 returns true for sign check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, 0.0, -0.0);
      const r: boolean = arr.some((v: number): boolean => {
        return 1.0 / v === -Infinity;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0530
     * @tc.name testFloat64ArrayDimension053
     * @tc.desc Verify forEach modifies external counter on -0 sign detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, -0.0, 0.0, -0.0);
      let negCount: int = 0;
      arr.forEach((v: number): void => {
        if (1.0 / v === -Infinity) {
          negCount++;
        }
      });
      const actualResult = negCount;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0540
     * @tc.name testFloat64ArrayDimension054
     * @tc.desc Verify every -0 array returns correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, -0.0);
      const r: boolean = arr.every((v: number): boolean => {
        return 1.0 / v === -Infinity;
      });
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0550
     * @tc.name testFloat64ArrayDimension055
     * @tc.desc Verify map MAX_VALUE times 2 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * 2.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0560
     * @tc.name testFloat64ArrayDimension056
     * @tc.desc Verify reduce overflow MAX_VALUE + MAX_VALUE = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308, 1.7976931348623157e308);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0570
     * @tc.name testFloat64ArrayDimension057
     * @tc.desc Verify toString of MAX_VALUE shows representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = '1.7976931348623157e+308';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0580
     * @tc.name testFloat64ArrayDimension058
     * @tc.desc Verify includes finds MAX_VALUE in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308, 2.0);
      const r: boolean = arr.includes(1.7976931348623157e308);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0590
     * @tc.name testFloat64ArrayDimension059
     * @tc.desc Verify map MAX_VALUE * MAX_VALUE overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * v;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0600
     * @tc.name testFloat64ArrayDimension060
     * @tc.desc Verify reduce chain overflow with MAX_VALUE accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array =
        Float64Array.of(1.7976931348623157e308, 1.7976931348623157e308, -1.7976931348623157e308);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0610
     * @tc.name testFloat64ArrayDimension061
     * @tc.desc Verify toString of MAX_VALUE array with multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308, 1.0, 2.0);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = '1.7976931348623157e+308,1,2';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0620
     * @tc.name testFloat64ArrayDimension062
     * @tc.desc Verify includes MAX_VALUE with fromIndex finds at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 1.7976931348623157e308, 3.0);
      const r: boolean = arr.includes(1.7976931348623157e308, 1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0630
     * @tc.name testFloat64ArrayDimension063
     * @tc.desc Verify reduce sums MAX_VALUE returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308, 1.7976931348623157e308);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      });
      const actualResult = sum;
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0640
     * @tc.name testFloat64ArrayDimension064
     * @tc.desc Verify map MIN_VALUE/2 underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v / 2.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0650
     * @tc.name testFloat64ArrayDimension065
     * @tc.desc Verify filter preserves MIN_VALUE when condition matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1.0, 2.0);
      const filtered: Float64Array = arr.filter((v: number): boolean => {
        return v < 1.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = filtered.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0660
     * @tc.name testFloat64ArrayDimension066
     * @tc.desc Verify reduce of two minimum subnormals remains non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 5e-324);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      expect(sum).assertEqual(1e-323);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0670
     * @tc.name testFloat64ArrayDimension067
     * @tc.desc Verify indexOf finds MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 3.0);
      const idx: int = arr.indexOf(5e-324);
      const actualResult = idx;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0680
     * @tc.name testFloat64ArrayDimension068
     * @tc.desc Verify map MIN_VALUE * 0.5 underflows to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * 0.5;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0690
     * @tc.name testFloat64ArrayDimension069
     * @tc.desc Verify filter excludes MIN_VALUE when condition is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1.0);
      const filtered: Float64Array = arr.filter((v: number): boolean => {
        return v > 1.0;
      });
      const actualLength = filtered.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0700
     * @tc.name testFloat64ArrayDimension070
     * @tc.desc Verify reduce with MIN_VALUE positive accumulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 5e-324, 5e-324);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      expect(sum).assertEqual(1.5e-323);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0710
     * @tc.name testFloat64ArrayDimension071
     * @tc.desc Verify indexOf finds MIN_VALUE at first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 2.0);
      const idx: int = arr.indexOf(5e-324);
      const actualResult = idx;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0720
     * @tc.name testFloat64ArrayDimension072
     * @tc.desc Verify associative property (0.1+0.2)+0.3 vs 0.1+(0.2+0.3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Float64Array = Float64Array.of(0.1, 0.2, 0.3);
      const lhs: number = arr1.reduce((acc: number, v: number): number => {
        return acc + v;
      });
      const rhs: number = arr1.$_get(0) + (arr1.$_get(1) + arr1.$_get(2));
      expect(lhs).assertEqual(0.6000000000000001);
      expect(rhs).assertEqual(0.6);
      const hasDifferentPrecision: boolean = lhs === rhs;
      expect(hasDifferentPrecision).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0730
     * @tc.name testFloat64ArrayDimension073
     * @tc.desc Verify map precision 0.1+0.2 produces 0.30000000000000004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v + 0.2;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 0.30000000000000004;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0740
     * @tc.name testFloat64ArrayDimension074
     * @tc.desc Verify includes finds 0.30000000000000004 in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.30000000000000004);
      const r: boolean = arr.includes(0.30000000000000004);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0750
     * @tc.name testFloat64ArrayDimension075
     * @tc.desc Verify map precision small decimal 0.1 * 0.1 equals 0.01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * 0.1;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 0.010000000000000002;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0760
     * @tc.name testFloat64ArrayDimension076
     * @tc.desc Verify includes 0.1 in Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1, 0.2, 0.3);
      const r: boolean = arr.includes(0.1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0770
     * @tc.name testFloat64ArrayDimension077
     * @tc.desc Verify reduce sum 0.1+0.2+0.3 matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1, 0.2, 0.3);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      });
      const actualResult = sum;
      const expectedResult: number = 0.6000000000000001;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0780
     * @tc.name testFloat64ArrayDimension078
     * @tc.desc Verify map precision for 0.1+0.2 comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.1, 0.2);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      });
      const actualResult = sum;
      const expectedResult: number = 0.30000000000000004;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0790
     * @tc.name testFloat64ArrayDimension079
     * @tc.desc Verify map float precision for 1.0/3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v / 3.0;
      });
      expect(mapped.$_get(0)).assertEqual(0.3333333333333333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0800
     * @tc.name testFloat64ArrayDimension080
     * @tc.desc Verify sort puts NaN at end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, NaN, 1.0, 2.0);
      arr.sort();
      expect(Number.isNaN(arr.$_get(3))).assertTrue();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0810
     * @tc.name testFloat64ArrayDimension081
     * @tc.desc Verify sort returns subnormal 5e-324 as the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 5e-324, 1.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0820
     * @tc.name testFloat64ArrayDimension082
     * @tc.desc Verify sort preserves -0 sign after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -0.0, 2.0);
      arr.sort();
      const firstElementHasNegativeZeroSign: boolean = 1.0 / arr.$_get(0) === -Infinity;
      expect(firstElementHasNegativeZeroSign).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0830
     * @tc.name testFloat64ArrayDimension083
     * @tc.desc Verify custom compareFn puts NaN at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0, 2.0);
      arr.sort((a: number, b: number): int => {
        if (Number.isNaN(a) && Number.isNaN(b)) {
          return 0;
        }
        if (Number.isNaN(a)) {
          return 1;
        }
        if (Number.isNaN(b)) {
          return -1;
        }
        return a < b ? -1 : a > b ? 1 : 0;
      });
      expect(Number.isNaN(arr.$_get(3))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0840
     * @tc.name testFloat64ArrayDimension084
     * @tc.desc Verify sort with mixed subnormals and normals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1e-323, 1.0, 0.5);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 1e-323;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0850
     * @tc.name testFloat64ArrayDimension085
     * @tc.desc Verify sort with -0 and +0 preserves both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, -0.0, 0.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 0.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 0.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const hasNegativeZero = (1.0 / arr.$_get(0) === -Infinity) || (1.0 / arr.$_get(1) === -Infinity) ||
        (1.0 / arr.$_get(2) === -Infinity);
      expect(hasNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0860
     * @tc.name testFloat64ArrayDimension086
     * @tc.desc Verify sort NaN position with custom compareFn at front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 1.0, 2.0);
      arr.sort((a: number, b: number): int => {
        if (Number.isNaN(a) && Number.isNaN(b)) {
          return 0;
        }
        if (Number.isNaN(a)) {
          return 1;
        }
        if (Number.isNaN(b)) {
          return -1;
        }
        return a < b ? -1 : a > b ? 1 : 0;
      });
      expect(Number.isNaN(arr.$_get(2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0870
     * @tc.name testFloat64ArrayDimension087
     * @tc.desc Verify sort all special values combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -0.0, NaN, 5e-324, 2.0);
      arr.sort();
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(Number.isNaN(arr.$_get(4))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0880
     * @tc.name testFloat64ArrayDimension088
     * @tc.desc Verify copyWithin forward overlapping region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
      arr.copyWithin(2, 0, 4);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElementAt5 = arr.$_get(5);
      const expectedElementAt5: number = 4.0;
      expect(actualElementAt5).assertEqual(expectedElementAt5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0890
     * @tc.name testFloat64ArrayDimension089
     * @tc.desc Verify copyWithin backward overlapping region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
      arr.copyWithin(0, 3, 7);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 7.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0900
     * @tc.name testFloat64ArrayDimension090
     * @tc.desc Verify copyWithin contained non-overlapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      arr.copyWithin(0, 3, 6);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 4.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 6.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0910
     * @tc.name testFloat64ArrayDimension091
     * @tc.desc Verify copyWithin full array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 0, 4);
      const actualElement0Third = arr.$_get(0);
      const expectedElement0Third: number = 1.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElement3Second = arr.$_get(3);
      const expectedElement3Second: number = 4.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0920
     * @tc.name testFloat64ArrayDimension092
     * @tc.desc Verify copyWithin forward shift by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      arr.copyWithin(1, 0, 3);
      const actualElement1Second = arr.$_get(1);
      const expectedElement1Second: number = 1.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement3Second = arr.$_get(3);
      const expectedElement3Second: number = 3.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0930
     * @tc.name testFloat64ArrayDimension093
     * @tc.desc Verify copyWithin backward shift overlapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      arr.copyWithin(0, 1, 4);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 4.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0940
     * @tc.name testFloat64ArrayDimension094
     * @tc.desc Verify copyWithin contained range in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
      arr.copyWithin(3, 1, 4);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 2.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElementAt5 = arr.$_get(5);
      const expectedElementAt5: number = 4.0;
      expect(actualElementAt5).assertEqual(expectedElementAt5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0950
     * @tc.name testFloat64ArrayDimension095
     * @tc.desc Verify copyWithin copies entire array to same positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr.copyWithin(0, 0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0960
     * @tc.name testFloat64ArrayDimension096
     * @tc.desc Verify copyWithin with negative target copies to front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      arr.copyWithin(-3, 0, 2);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 2.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0970
     * @tc.name testFloat64ArrayDimension097
     * @tc.desc Verify copyWithin with target inside source range overlapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      arr.copyWithin(1, 2, 5);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 5.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0980
     * @tc.name testFloat64ArrayDimension098
     * @tc.desc Verify set from Int32Array at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array([1, 2, 3]);
      const dst: Float64Array = new Float64Array(5);
      dst.set(src);
      const actualElement0 = dst.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = dst.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_0990
     * @tc.name testFloat64ArrayDimension099
     * @tc.desc Verify set from Uint8Array at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const dst: Float64Array = new Float64Array(5);
      dst.set(src);
      const actualElement0 = dst.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = dst.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1000
     * @tc.name testFloat64ArrayDimension100
     * @tc.desc Verify set from Int32Array at offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array([100, 200]);
      const dst: Float64Array = new Float64Array(5);
      dst.set(src, 2);
      const actualElement2 = dst.$_get(2);
      const expectedElement2: number = 100.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = dst.$_get(3);
      const expectedElement3: number = 200.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElement0 = dst.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1010
     * @tc.name testFloat64ArrayDimension101
     * @tc.desc Verify set from Uint8Array at offset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([255, 128]);
      const dst: Float64Array = new Float64Array(6);
      dst.set(src, 4);
      const actualElementAt4 = dst.$_get(4);
      const expectedElementAt4: number = 255.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
      const actualElementAt5 = dst.$_get(5);
      const expectedElementAt5: number = 128.0;
      expect(actualElementAt5).assertEqual(expectedElementAt5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1020
     * @tc.name testFloat64ArrayDimension102
     * @tc.desc Verify set from Int32Array copies values to Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array([1, 2]);
      const dst: Float64Array = new Float64Array(2);
      dst.set(src);
      const actualLength = dst.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = dst.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = dst.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1030
     * @tc.name testFloat64ArrayDimension103
     * @tc.desc Verify set from Uint8Array partial coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3, 4]);
      const dst: Float64Array = new Float64Array(8);
      dst.set(src);
      const actualElement0 = dst.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = dst.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualElementAt4 = dst.$_get(4);
      const expectedElementAt4: number = 0.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1040
     * @tc.name testFloat64ArrayDimension104
     * @tc.desc Verify set from Int32Array at large offset 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = new Int32Array([5, 6]);
      const dst: Float64Array = new Float64Array(10);
      dst.set(src, 7);
      const actualElementAt7 = dst.$_get(7);
      const expectedElementAt7: number = 5.0;
      expect(actualElementAt7).assertEqual(expectedElementAt7);
      const actualElementAt8 = dst.$_get(8);
      const expectedElementAt8: number = 6.0;
      expect(actualElementAt8).assertEqual(expectedElementAt8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1050
     * @tc.name testFloat64ArrayDimension105
     * @tc.desc Verify set from Uint8Array fills at end of target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([99]);
      const dst: Float64Array = new Float64Array(3);
      dst.set(src, 2);
      const actualElement2 = dst.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1060
     * @tc.name testFloat64ArrayDimension106
     * @tc.desc Verify reduce accumulator propagation sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = 15.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1070
     * @tc.name testFloat64ArrayDimension107
     * @tc.desc Verify reduceRight sum of numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const sum: number = arr.reduceRight((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1080
     * @tc.name testFloat64ArrayDimension108
     * @tc.desc Verify reduceRight subtract from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r = arr.reduceRight((acc: number, v: number): number => {
        return acc - v;
      }, 10.0);
      const actualResult = r;
      const expectedResult: number = 4.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1090
     * @tc.name testFloat64ArrayDimension109
     * @tc.desc Verify reduce accumulator object counter propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const sum: number = arr.reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0.0);
      const actualResult = sum;
      const expectedResult: number = 60.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1100
     * @tc.name testFloat64ArrayDimension110
     * @tc.desc Verify reduce accumulator multiply propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 3.0, 4.0);
      const prod: number = arr.reduce((acc: number, v: number): number => {
        return acc * v;
      }, 1.0);
      const actualResult = prod;
      const expectedResult: number = 24.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1110
     * @tc.name testFloat64ArrayDimension111
     * @tc.desc Verify reduce subtract propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 3.0, 2.0);
      const r = arr.reduce((acc: number, v: number): number => {
        return acc - v;
      }, 100.0);
      const actualResult = r;
      const expectedResult: number = 85.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1120
     * @tc.name testFloat64ArrayDimension112
     * @tc.desc Verify forEach external counter increments per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let cnt: int = 0;
      arr.forEach((v: number): void => {
        cnt++;
      });
      const actualResult = cnt;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1130
     * @tc.name testFloat64ArrayDimension113
     * @tc.desc Verify forEach external array collects values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const collected: Float64Array = new Float64Array(3);
      let idx: int = 0;
      arr.forEach((v: number): void => {
        collected.$_set(idx, v * 2.0);
        idx++;
      });
      const actualElement0 = collected.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = collected.$_get(2);
      const expectedElement2: number = 6.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1140
     * @tc.name testFloat64ArrayDimension114
     * @tc.desc Verify forEach external sum accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let sum: number = 0.0;
      arr.forEach((v: number): void => {
        sum += v;
      });
      const actualResult = sum;
      const expectedResult: number = 15.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1150
     * @tc.name testFloat64ArrayDimension115
     * @tc.desc Verify forEach external sum with index tracking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let sum: number = 0.0;
      let sumIdx: int = 0;
      arr.forEach((v: number, i: int): void => {
        sum += v;
        sumIdx += i;
      });
      const actualResult = sum;
      const expectedResult: number = 6.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = sumIdx;
      const expectedResultSecond: number = 3;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1160
     * @tc.name testFloat64ArrayDimension116
     * @tc.desc Verify forEach external state with array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let len: int = 0;
      arr.forEach((v: number, i: int, a: Float64Array): void => {
        len = a.length;
      });
      const actualResult = len;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1170
     * @tc.name testFloat64ArrayDimension117
     * @tc.desc Verify map linear transform y = 2 * x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * 2.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 6.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1180
     * @tc.name testFloat64ArrayDimension118
     * @tc.desc Verify map linear transform y = x / 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 4.0, 6.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v / 2.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1190
     * @tc.name testFloat64ArrayDimension119
     * @tc.desc Verify map transform to range [0,1] via division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, 5.0, 10.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v / 10.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1200
     * @tc.name testFloat64ArrayDimension120
     * @tc.desc Verify map linear shift y = x + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v + 1.0;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = 4.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1210
     * @tc.name testFloat64ArrayDimension121
     * @tc.desc Verify map nonlinear transform y = x * x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return v * v;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt4 = mapped.$_get(4);
      const expectedElementAt4: number = 25.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1220
     * @tc.name testFloat64ArrayDimension122
     * @tc.desc Verify map linear transform y = -x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const mapped: Float64Array = arr.map((v: number): number => {
        return -v;
      });
      const actualElement0 = mapped.$_get(0);
      const expectedElement0: number = -1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = mapped.$_get(2);
      const expectedElement2: number = -3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1230
     * @tc.name testFloat64ArrayDimension123
     * @tc.desc Verify constructor negative length -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1240
     * @tc.name testFloat64ArrayDimension124
     * @tc.desc Verify constructor NaN length creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(NaN);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1250
     * @tc.name testFloat64ArrayDimension125
     * @tc.desc Verify constructor Infinity length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float64Array(Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1260
     * @tc.name testFloat64ArrayDimension126
     * @tc.desc Verify constructor buffer offset 1 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1270
     * @tc.name testFloat64ArrayDimension127
     * @tc.desc Verify constructor buffer offset 2 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 2, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1280
     * @tc.name testFloat64ArrayDimension128
     * @tc.desc Verify constructor buffer offset 3 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 3, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1290
     * @tc.name testFloat64ArrayDimension129
     * @tc.desc Verify constructor buffer offset 4 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1300
     * @tc.name testFloat64ArrayDimension130
     * @tc.desc Verify constructor buffer offset 5 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 5, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1310
     * @tc.name testFloat64ArrayDimension131
     * @tc.desc Verify constructor buffer offset 6 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 6, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1320
     * @tc.name testFloat64ArrayDimension132
     * @tc.desc Verify constructor buffer offset 7 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 7, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1330
     * @tc.name testFloat64ArrayDimension133
     * @tc.desc Verify constructor buffer too small for offset+length throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(16);
        new Float64Array(buf, 8, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1340
     * @tc.name testFloat64ArrayDimension134
     * @tc.desc Verify constructor buffer offset 0 length too large throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(8);
        new Float64Array(buf, 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1350
     * @tc.name testFloat64ArrayDimension135
     * @tc.desc Verify constructor buffer negative offset throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, -8, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1360
     * @tc.name testFloat64ArrayDimension136
     * @tc.desc Verify constructor buffer offset beyond bounds throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(16);
        new Float64Array(buf, 16, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1370
     * @tc.name testFloat64ArrayDimension137
     * @tc.desc Verify constructor negative length on buffer variant throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1380
     * @tc.name testFloat64ArrayDimension138
     * @tc.desc Verify constructor Infinity length on buffer variant throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(32);
        new Float64Array(buf, 0, Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1390
     * @tc.name testFloat64ArrayDimension139
     * @tc.desc Verify constructor buffer zero length with offset at end works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 24, 0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1400
     * @tc.name testFloat64ArrayDimension140
     * @tc.desc Verify constructor buffer offset 9 not multiple of 8 throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = new ArrayBuffer(64);
        new Float64Array(buf, 9, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1410
     * @tc.name testFloat64ArrayDimension141
     * @tc.desc Verify includes finds subnormal 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 3.0);
      const r: boolean = arr.includes(5e-324);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1420
     * @tc.name testFloat64ArrayDimension142
     * @tc.desc Verify includes finds -0 by SameValueZero equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -0.0, 3.0);
      const r: boolean = arr.includes(-0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1430
     * @tc.name testFloat64ArrayDimension143
     * @tc.desc Verify includes finds MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1.0);
      const r: boolean = arr.includes(5e-324);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1440
     * @tc.name testFloat64ArrayDimension144
     * @tc.desc Verify includes returns true for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const r: boolean = arr.includes(NaN);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1450
     * @tc.name testFloat64ArrayDimension145
     * @tc.desc Verify includes finds Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, Infinity, 3.0);
      const r: boolean = arr.includes(Infinity);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1460
     * @tc.name testFloat64ArrayDimension146
     * @tc.desc Verify includes finds -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -Infinity, 3.0);
      const r: boolean = arr.includes(-Infinity);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1470
     * @tc.name testFloat64ArrayDimension147
     * @tc.desc Verify includes subnormal 5e-324 with fromIndex non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 5e-324);
      const r: boolean = arr.includes(5e-324, 2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1480
     * @tc.name testFloat64ArrayDimension148
     * @tc.desc Verify includes -0 when source contains +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, 0.0);
      const r: boolean = arr.includes(-0.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1490
     * @tc.name testFloat64ArrayDimension149
     * @tc.desc Verify includes MIN_VALUE not found returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const r: boolean = arr.includes(5e-324);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1500
     * @tc.name testFloat64ArrayDimension150
     * @tc.desc Verify lastIndexOf finds subnormal 5e-324 at last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324, 1.0, 5e-324);
      const idx: int = arr.lastIndexOf(5e-324);
      const actualResult = idx;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1510
     * @tc.name testFloat64ArrayDimension151
     * @tc.desc Verify indexOf finds -0 at correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -0.0, 3.0);
      const idx: int = arr.indexOf(-0.0);
      const actualResult = idx;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1520
     * @tc.name testFloat64ArrayDimension152
     * @tc.desc Verify lastIndexOf finds -0 at correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 1.0, -0.0);
      const idx: int = arr.lastIndexOf(-0.0);
      const actualResult = idx;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1530
     * @tc.name testFloat64ArrayDimension153
     * @tc.desc Verify indexOf finds MAX_VALUE at correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 1.7976931348623157e308, 3.0);
      const idx: int = arr.indexOf(1.7976931348623157e308);
      const actualResult = idx;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1540
     * @tc.name testFloat64ArrayDimension154
     * @tc.desc Verify lastIndexOf finds MAX_VALUE at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308, 1.0, 1.7976931348623157e308);
      const idx: int = arr.lastIndexOf(1.7976931348623157e308);
      const actualResult = idx;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1550
     * @tc.name testFloat64ArrayDimension155
     * @tc.desc Verify indexOf NaN returns -1 as NaN never matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, NaN, 3.0);
      const idx: int = arr.indexOf(NaN);
      const actualResult = idx;
      const expectedResult: number = -1;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1560
     * @tc.name testFloat64ArrayDimension156
     * @tc.desc Verify lastIndexOf -Infinity at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, -Infinity, 3.0, -Infinity);
      const idx: int = arr.lastIndexOf(-Infinity);
      const actualResult = idx;
      const expectedResult: number = 3;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1570
     * @tc.name testFloat64ArrayDimension157
     * @tc.desc Verify fill with subnormal 5e-324 fills all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(5e-324);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 5e-324;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5e-324;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1580
     * @tc.name testFloat64ArrayDimension158
     * @tc.desc Verify fill with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(1.7976931348623157e308);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 1.7976931348623157e308;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 1.7976931348623157e308;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1590
     * @tc.name testFloat64ArrayDimension159
     * @tc.desc Verify fill with MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(5e-324);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 5e-324;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1600
     * @tc.name testFloat64ArrayDimension160
     * @tc.desc Verify fill with NaN fills all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(NaN);
      expect(Number.isNaN(arr.$_get(0))).assertTrue();
      expect(Number.isNaN(arr.$_get(2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1610
     * @tc.name testFloat64ArrayDimension161
     * @tc.desc Verify fill with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(Infinity);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1620
     * @tc.name testFloat64ArrayDimension162
     * @tc.desc Verify fill with -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(-Infinity);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = -Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1630
     * @tc.name testFloat64ArrayDimension163
     * @tc.desc Verify fill partial range 1-3 with subnormal 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      arr.fill(5e-324, 1, 3);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 0.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 5e-324;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5e-324;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1640
     * @tc.name testFloat64ArrayDimension164
     * @tc.desc Verify fill with -0 sign detection via 1.0/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr.fill(-0.0);
      const secondElementHasNegativeZeroSign: boolean = 1.0 / arr.$_get(1) === -Infinity;
      expect(secondElementHasNegativeZeroSign).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1650
     * @tc.name testFloat64ArrayDimension165
     * @tc.desc Verify toString subnormal 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5e-324);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = '5e-324';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1660
     * @tc.name testFloat64ArrayDimension166
     * @tc.desc Verify toString -0 shows as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = '0';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1670
     * @tc.name testFloat64ArrayDimension167
     * @tc.desc Verify toString NaN representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = 'NaN';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1680
     * @tc.name testFloat64ArrayDimension168
     * @tc.desc Verify toString Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Infinity);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = 'Infinity';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1690
     * @tc.name testFloat64ArrayDimension169
     * @tc.desc Verify toString -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-Infinity);
      const s: string = arr.toString();
      const actualResult = s;
      const expectedResult: string = '-Infinity';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1700
     * @tc.name testFloat64ArrayDimension170
     * @tc.desc Verify join with subnormal shows proper format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 2.0);
      const s: string = arr.join('|');
      const actualResult = s;
      const expectedResult: string = '1|5e-324|2';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1710
     * @tc.name testFloat64ArrayDimension171
     * @tc.desc Verify join -0 with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(-0.0, 1.0, -0.0);
      const s: string = arr.join(',');
      const actualResult: string = s;
      const expectedResult: string = '0,1,0';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1720
     * @tc.name testFloat64ArrayDimension172
     * @tc.desc Verify join MAX_VALUE with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.7976931348623157e308, 2.0);
      const s: string = arr.join();
      const actualResult = s;
      const expectedResult: string = '1.7976931348623157e+308,2';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1730
     * @tc.name testFloat64ArrayDimension173
     * @tc.desc Verify join mixed special values NaN, Infinity, -Infinity, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Infinity, -Infinity, 0.0);
      const s: string = arr.join(',');
      const actualResult: string = s;
      const expectedResult: string = 'NaN,Infinity,-Infinity,0';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1740
     * @tc.name testFloat64ArrayDimension174
     * @tc.desc Verify find locates subnormal 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 3.0);
      const r = arr.find((v: number): boolean => {
        return v < 1.0;
      });
      const actualResult = r;
      const expectedResult: number = 5e-324;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_DIMENSION_1750
     * @tc.name testFloat64ArrayDimension175
     * @tc.desc Verify findIndex locates MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayDimension175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 5e-324, 3.0);
      const idx: int = arr.findIndex((v: number): boolean => {
        return v < 1.0;
      });
      const actualResult = idx;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
    });

  })
}
