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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils, { recPred032 } from '../Util.test';

export default function Float64ArrayFindLast2Test(): void {
  describe('Float64ArrayFindLast2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0100
     * @tc.name testFloat64ArrayFindLast2001
     * @tc.desc Verify findLast predicate returns false variable and throws not-found Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const expectedMessage = "Float64Array.findLast: not implemented if an element was not found";
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          let falsy: boolean = false;
          return falsy;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual(expectedMessage);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0200
     * @tc.name testFloat64ArrayFindLast2002
     * @tc.desc Verify findLast predicate returns true variable and matches last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const result = arr.findLast((value: number, index: int): boolean => {
        let ret: boolean = true;
        return ret;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0300
     * @tc.name testFloat64ArrayFindLast2003
     * @tc.desc Verify findLast value-only predicate returns true variable and matches last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      const result = arr.findLast((value: number): boolean => {
        let ret: boolean = true;
        return ret;
      })

      const expectVal = pointTwoFive;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0400
     * @tc.name testFloat64ArrayFindLast2004
     * @tc.desc Verify findLast predicate uses negative Infinity comparison returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.findLast((value: number): boolean => {
        let negInf: double = -Infinity;
        return negInf < 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0500
     * @tc.name testFloat64ArrayFindLast2005
     * @tc.desc Verify findLast with reversed order recording showing backward traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const fourValue: number = 4;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, 1, 2147483647);
      let indices: FixedArray<int> = [0, 0, 0, 0, 0];
      let pos: int = 0;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        indices[pos] = index;
        pos = pos + 1;
        return index === 0;
      })

      expect(indices[0]).assertEqual(fourValue);
      expect(indices[4]).assertEqual(zeroValue);
      expect(result).assertEqual(int32MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0600
     * @tc.name testFloat64ArrayFindLast2006
     * @tc.desc Verify findLast callback throws Error on first checked element and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          if (value === zeroValue) {
            throw new Error("first from end");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0700
     * @tc.name testFloat64ArrayFindLast2007
     * @tc.desc Verify findLast with subnormal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = 1.5;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0800
     * @tc.name testFloat64ArrayFindLast2008
     * @tc.desc Verify findLast finds first element from end when using index condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(-32768, -128, 0, int8MaxValue, 32767);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return index === 3;
      })

      const expectVal = int8MaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_0900
     * @tc.name testFloat64ArrayFindLast2009
     * @tc.desc Verify findLast with all elements negative satisfying negative condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLast((value: number): boolean => {
        return value < 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1000
     * @tc.name testFloat64ArrayFindLast2010
     * @tc.desc Verify findLast with sparse-like scenario single non-zero in zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tinyNegativeValue: number = -1e-100;
      const arr =
        new Float64Array([tinyNegativeValue, tinyNegativeValue, 0, tinyNegativeValue, tinyNegativeValue]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value !== 0.0;
      })

      const expectVal = tinyNegativeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1100
     * @tc.name testFloat64ArrayFindLast2011
     * @tc.desc Verify findLast on 20 element array finds last positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nineteenPointzero: number = 19.0;
      const arr = new Float64Array(20);
      for (let i: int = 0; i < 20; i++) {
        arr.$_set(i, i);
      }
      const result = arr.findLast((value: number, index: int): boolean => {
        return value > 18.0;
      })

      const expectVal = nineteenPointzero;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1200
     * @tc.name testFloat64ArrayFindLast2012
     * @tc.desc Verify findLast with element at MAX_SAFE_INTEGER threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991.0;
      const arr = Float64Array.of(0.5, maxSafeInteger);
      const result = arr.findLast((value: number): boolean => {
        return value === maxSafeInteger;
      })

      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1300
     * @tc.name testFloat64ArrayFindLast2013
     * @tc.desc Verify findLast with negative MIN_SAFE_INTEGER element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991.0;
      const arr = new Float64Array([-32768, minSafeInteger]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === minSafeInteger;
      })

      const expectVal = minSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1400
     * @tc.name testFloat64ArrayFindLast2014
     * @tc.desc Verify findLast element value equals callback second parameter index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, oneValue, 0, oneValue, 2147483647]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === index;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1500
     * @tc.name testFloat64ArrayFindLast2015
     * @tc.desc Verify findLast from negative array searching backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, tinyNegativeValue);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value < 0.0;
      })

      const expectVal = tinyNegativeValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1600
     * @tc.name testFloat64ArrayFindLast2016
     * @tc.desc Verify findLast callback throws Error object and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.findLast((value: number): boolean => {
          throw new Error("obj throw");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1700
     * @tc.name testFloat64ArrayFindLast2017
     * @tc.desc Verify findLast external state reading in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2.0;
      const arr = new Float64Array([-32768, -128, twoValue]);
      let extFlag: boolean = false;
      let found: number = 0.0;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (!extFlag && value > 1.0) {
          found = value;
          return true;
        }
        return false;
      })

      const expectVal = twoValue;
      expect(found).assertEqual(expectVal);
      const expectVal2 = twoValue;
      expect(result).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1800
     * @tc.name testFloat64ArrayFindLast2018
     * @tc.desc Verify findLast with recursive predicate from helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2.0;
      const arr = new Float64Array([-2147483648, -1, twoValue]);
      const result = arr.findLast(recPred032);
      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_1900
     * @tc.name testFloat64ArrayFindLast2019
     * @tc.desc Verify findLast with floating point precision 0.1+0.2 not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precisionValue: number = 0.30000000000000004;
      const arr = Float64Array.of(0.1 + 0.2);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === precisionValue;
      })

      const expectVal = precisionValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2000
     * @tc.name testFloat64ArrayFindLast2020
     * @tc.desc Verify findLast with int boundary 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647.0;
      const arr = Float64Array.of(0.5, int32MaxValue, 0.25);
      const result = arr.findLast((value: number): boolean => {
        return value === int32MaxValue;
      })

      const expectVal = int32MaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2100
     * @tc.name testFloat64ArrayFindLast2021
     * @tc.desc Verify findLast with int boundary -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648.0;
      const arr = Float64Array.of(int32MinValue, -128, 0);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === int32MinValue;
      })

      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2200
     * @tc.name testFloat64ArrayFindLast2022
     * @tc.desc Verify findLast returns negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinityValue: number = -Infinity;
      const arr = new Float64Array([-2147483648, negativeInfinityValue, 0]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === negativeInfinityValue;
      })

      const expectVal = negativeInfinityValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2300
     * @tc.name testFloat64ArrayFindLast2023
     * @tc.desc Verify findLast returns negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, -0.0]);
      const result = arr.findLast((value: number): boolean => {
        return value === 0.0 && 1.0 / value < 0.0;
      })

      const expectVal = -Infinity;
      expect(1.0 / result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2400
     * @tc.name testFloat64ArrayFindLast2024
     * @tc.desc Verify findLast original array content unchanged after invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive]);
      arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0;
      })

      const actVal6 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = arr.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal8).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2500
     * @tc.name testFloat64ArrayFindLast2025
     * @tc.desc Verify findLast single parameter overload with only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2.0;
      const arr = new Float64Array([-32768, -128, twoValue]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value > 1.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2600
     * @tc.name testFloat64ArrayFindLast2026
     * @tc.desc Verify findLast with repeated MAX_VALUE elements finds last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxDoubleValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(-2147483648, maxDoubleValue, 0, maxDoubleValue);
      const result = arr.findLast((value: number): boolean => {
        return value === maxDoubleValue;
      })

      const expectVal = maxDoubleValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2700
     * @tc.name testFloat64ArrayFindLast2027
     * @tc.desc Verify findLast with repeated MIN_VALUE elements finds last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minDoubleValue: number = 5e-324;
      const arr = Float64Array.of(3.141592653589793, minDoubleValue, 0, minDoubleValue);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === minDoubleValue;
      })

      const expectVal = minDoubleValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2800
     * @tc.name testFloat64ArrayFindLast2028
     * @tc.desc Verify findLast with multiple NaN elements finds last NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr =
        Float64Array.of(0.0625, 1.5, NaN, 0.125, NaN);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value !== value;
      })

      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_2900
     * @tc.name testFloat64ArrayFindLast2029
     * @tc.desc Verify findLast with mixed Infinity NaN finds NaN via NaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(32767, Infinity, 0, NaN, 127);
      const result = arr.findLast((value: number): boolean => {
        return value !== value;
      })

      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3000
     * @tc.name testFloat64ArrayFindLast2030
     * @tc.desc Verify findLast on 10 element array finding value greater than 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int32MaxValue: number = 2147483647;
      const arr =
        new Float64Array([-2147483648, -1, zeroValue, 1, int32MaxValue, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value > 5.0;
      })

      const expectVal = int32MaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3100
     * @tc.name testFloat64ArrayFindLast2031
     * @tc.desc Verify findLast on 10 element array finds first element from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100, zeroValue, zeroValue,
        zeroValue, zeroValue, zeroValue);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3200
     * @tc.name testFloat64ArrayFindLast2032
     * @tc.desc Verify findLast with strictly decreasing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(0.5, 1.5, 0.25, 0.125, pointZeroSixTwoFive);
      const result = arr.findLast((value: number): boolean => {
        return value < 5.0;
      })

      const expectVal = pointZeroSixTwoFive;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3300
     * @tc.name testFloat64ArrayFindLast2033
     * @tc.desc Verify findLast callback throws SyntaxError propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          throw new SyntaxError("syntax");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3400
     * @tc.name testFloat64ArrayFindLast2034
     * @tc.desc Verify findLast callback throws ReferenceError propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.findLast((value: number, index: int): boolean => {
          throw new ReferenceError("ref");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ReferenceError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3500
     * @tc.name testFloat64ArrayFindLast2035
     * @tc.desc Verify findLast callback throws EvalError propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLast((value: number): boolean => {
          throw new EvalError("eval");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("EvalError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3600
     * @tc.name testFloat64ArrayFindLast2036
     * @tc.desc Verify findLast callback throws URIError propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          throw new URIError("uri");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("URIError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3700
     * @tc.name testFloat64ArrayFindLast2037
     * @tc.desc Verify findLast with decimal precision 0.1 plus 0.2 not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precisionSumValue: number =
        0.30000000000000004;
      const arr = Float64Array.of(0.1 + 0.2);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value !== 0.3;
      })

      const expectVal = precisionSumValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3800
     * @tc.name testFloat64ArrayFindLast2038
     * @tc.desc Verify findLast with float MAX_VALUE 3.4028235e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatMaxValue: number = 3.4028235e+38;
      const arr = new Float64Array([-32768, floatMaxValue, 0]);
      const result = arr.findLast((value: number): boolean => {
        return value > 1.0e+38;
      })

      const expectVal = floatMaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_3900
     * @tc.name testFloat64ArrayFindLast2039
     * @tc.desc Verify findLast with float MIN_VALUE 1.4e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatMinValue: number = 1.4e-45;
      const arr = new Float64Array([-2147483648, floatMinValue, 0]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0 && value < 1.0e-40;
      })

      const expectVal = floatMinValue;
      expect(result).assertEqual(expectVal);
      expect(result).assertEqual(floatMinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4000
     * @tc.name testFloat64ArrayFindLast2040
     * @tc.desc Verify findLast with single MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991.0;
      const arr = Float64Array.of(maxSafeInteger);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === maxSafeInteger;
      })

      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4100
     * @tc.name testFloat64ArrayFindLast2041
     * @tc.desc Verify findLast with single negative MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991.0;
      const arr = new Float64Array([minSafeInteger]);
      const result = arr.findLast((value: number): boolean => {
        return value === minSafeInteger;
      })

      const expectVal = minSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4200
     * @tc.name testFloat64ArrayFindLast2042
     * @tc.desc Verify findLast with byte boundary value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127.0;
      const arr = new Float64Array([-32768, int8MaxValue, 0]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === int8MaxValue;
      })

      const expectVal = int8MaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4300
     * @tc.name testFloat64ArrayFindLast2043
     * @tc.desc Verify findLast with byte boundary value negative 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128.0;
      const arr = new Float64Array([-2147483648, int8MinValue, 0]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === int8MinValue;
      })

      const expectVal = int8MinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4400
     * @tc.name testFloat64ArrayFindLast2044
     * @tc.desc Verify findLast with short boundary value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767.0;
      const arr = Float64Array.of(0.1, int16MaxValue, 0);
      const result = arr.findLast((value: number): boolean => {
        return value === int16MaxValue;
      })

      const expectVal = int16MaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4500
     * @tc.name testFloat64ArrayFindLast2045
     * @tc.desc Verify findLast with short boundary value negative 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768.0;
      const arr = new Float64Array([0.5, int16MinValue, 0.25]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === int16MinValue;
      })

      const expectVal = int16MinValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4600
     * @tc.name testFloat64ArrayFindLast2046
     * @tc.desc Verify findLast with MAX_SAFE_INTEGER plus 1 precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beyondSafeInteger: number = 9007199254740992.0;
      const arr = Float64Array.of(-32768, beyondSafeInteger, 0);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value > 9007199254740991.0;
      })

      const expectVal = beyondSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4700
     * @tc.name testFloat64ArrayFindLast2047
     * @tc.desc Verify findLast with hex literal value 0xFF equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValueFF, -1, 0]);
      const result = arr.findLast((value: number): boolean => {
        return value === 255.0;
      })

      const expectVal = hexValueFF;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4800
     * @tc.name testFloat64ArrayFindLast2048
     * @tc.desc Verify findLast with octal literal value 0o100 equals 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const octalValue: number = 0o100;
      const arr = Float64Array.of(0.1, octalValue, 0);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === 64.0;
      })

      const expectVal = octalValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_4900
     * @tc.name testFloat64ArrayFindLast2049
     * @tc.desc Verify findLast with binary literal value 0b111 equals 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue: number = 0b111;
      const arr = Float64Array.of(0.5, binaryValue, 0.25);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === 7.0;
      })

      const expectVal = binaryValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5000
     * @tc.name testFloat64ArrayFindLast2050
     * @tc.desc Verify findLast returns last element matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const values = new Float64Array([-32768, int8MaxValue, 0, int8MaxValue]);
      const actVal9 = values.findLast((value) => value === int8MaxValue);
      const expectVal = int8MaxValue;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5100
     * @tc.name testFloat64ArrayFindLast2051
     * @tc.desc Verify findLast returns single matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5.0;
      const values = new Float64Array([-2147483648, fiveValue, 0]);
      const actVal10 = values.findLast((value) => value > 4);
      const expectVal = fiveValue;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5200
     * @tc.name testFloat64ArrayFindLast2052
     * @tc.desc Verify findLast returns max safe integer when condition matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const values = new Float64Array([0.1, maxSafeInteger, 0]);
      const result = values.findLast((value) => value > 10);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5300
     * @tc.name testFloat64ArrayFindLast2053
     * @tc.desc Verify findLast returns positive element from single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1.0;
      const values = new Float64Array([oneValue]);
      const result = values.findLast((value) => value > 0);
      expect(result).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5400
     * @tc.name testFloat64ArrayFindLast2054
     * @tc.desc Verify findLast with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.25, 1.5, NaN);
      const result = values.findLast((value) => Number.isNaN(value));
      const actVal11 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5500
     * @tc.name testFloat64ArrayFindLast2055
     * @tc.desc Verify findLast with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const infinityValue: number = Infinity;
      const values = Float64Array.of(-32768, infinityValue, 0);
      const actVal12 = values.findLast((value) => value === infinityValue);
      const expectVal = infinityValue;
      expect(actVal12).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5600
     * @tc.name testFloat64ArrayFindLast2056
     * @tc.desc Verify findLast callback throws Error on checked element and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      try {
        values.findLast((value) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5700
     * @tc.name testFloat64ArrayFindLast2057
     * @tc.desc Verify findLast with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      const v = arr.findLast((e: number): boolean => e > 0x55);
      const expectVal = num170Pointzero;
      expect(v).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5800
     * @tc.name testFloat64ArrayFindLast2058
     * @tc.desc Verify findLast with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      const v = arr.findLast((e: number): boolean => e > 0b01010101);
      const expectVal = num170Pointzero;
      expect(v).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_5900
     * @tc.name testFloat64ArrayFindLast2059
     * @tc.desc Verify findLast with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.findLast((value: number): boolean => {
        return value !== value;
      })
      const actVal13 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_6000
     * @tc.name testFloat64ArrayFindLast2060
     * @tc.desc Verify findLast with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.findLast((value: number): boolean => {
        return value === Double.POSITIVE_INFINITY;
      })
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_6100
     * @tc.name testFloat64ArrayFindLast2061
     * @tc.desc Verify findLast with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.findLast((value: number): boolean => {
        return value > 1.0;
      })
      const expectVal = doubleMaxValue;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_6200
     * @tc.name testFloat64ArrayFindLast2062
     * @tc.desc Verify findLast reads modified value when callback changes earlier elements during backward iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Value: number = 999.0;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      // findLast iterates backward: index 4 → 3 → 2 → 1 → 0
      // At index 4 (5.0), modify index 1 from 2.0 to 999.0
      // findLast should use modified value 999.0 when it reaches index 1
      const result = arr.findLast((val: number, index: int): boolean => {
        if (index === 4) {
          arr.$_set(1, num999Value);
        }
        return val === 999.0;
      })
      const expectVal = num999Value;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2_6300
     * @tc.name testFloat64ArrayFindLast2063
     * @tc.desc Verify findLast on a large array of 1000 elements completes without timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i * 1.0);
      }
      const result = arr.findLast((val: number): boolean => val > 998.0);
      const expectVal = 999.0;
      expect(result).assertEqual(expectVal);
    });
  })
}
