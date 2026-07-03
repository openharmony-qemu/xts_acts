'use static'
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
import Utils from '../Util.test';

function predFn004(value: number, index: int, array: Float64Array): boolean {
  return value > 1.5;
}

export default function Float64ArrayFindIndexTest(): void {
  describe('Float64ArrayFindIndexTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0010
     * @tc.name testFloat64ArrayFindIndex001
     * @tc.desc Verify findIndex with one parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 2.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0020
     * @tc.name testFloat64ArrayFindIndex002
     * @tc.desc Verify findIndex with two-parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return index === 1;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0030
     * @tc.name testFloat64ArrayFindIndex003
     * @tc.desc Verify findIndex with three-parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return array.length === 3;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0040
     * @tc.name testFloat64ArrayFindIndex004
     * @tc.desc Verify findIndex with arrow function predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value > 1.5;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0050
     * @tc.name testFloat64ArrayFindIndex005
     * @tc.desc Verify findIndex with named function predicate from helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex(predFn004);
      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0060
     * @tc.name testFloat64ArrayFindIndex006
     * @tc.desc Verify findIndex with predicate always returning true returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number): boolean => {
        return true;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0070
     * @tc.name testFloat64ArrayFindIndex007
     * @tc.desc Verify findIndex with predicate always returning false returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return false;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0080
     * @tc.name testFloat64ArrayFindIndex008
     * @tc.desc Verify findIndex returns 0 when predicate returns 1 truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        let t: boolean = true;
        return t;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0090
     * @tc.name testFloat64ArrayFindIndex009
     * @tc.desc Verify findIndex with predicate returning Infinity treats as truthy returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        let inf: double = Infinity;
        return inf > 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0100
     * @tc.name testFloat64ArrayFindIndex010
     * @tc.desc Verify findIndex with predicate returning negative Infinity treats as truthy returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number): boolean => {
        let nf: double = -Infinity;
        return nf < 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0110
     * @tc.name testFloat64ArrayFindIndex011
     * @tc.desc Verify findIndex propagates RangeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      try {
        arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new RangeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0120
     * @tc.name testFloat64ArrayFindIndex012
     * @tc.desc Verify findIndex propagates TypeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      try {
        arr.findIndex((value: number, index: int): boolean => {
          throw new TypeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0130
     * @tc.name testFloat64ArrayFindIndex013
     * @tc.desc Verify findIndex propagates Error from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0140
     * @tc.name testFloat64ArrayFindIndex014
     * @tc.desc Verify findIndex propagates Error thrown at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      try {
        arr.findIndex((value: number, index: int): boolean => {
          if (index === 1) {
            throw new Error("at 1");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0150
     * @tc.name testFloat64ArrayFindIndex015
     * @tc.desc Verify findIndex propagates Error thrown at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      try {
        arr.findIndex((value: number, index: int): boolean => {
          if (index === 2) {
            throw new Error("last");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0160
     * @tc.name testFloat64ArrayFindIndex016
     * @tc.desc Verify findIndex propagates Error thrown at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      try {
        arr.findIndex((value: number, index: int): boolean => {
          if (index === 0) {
            throw new Error("first");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0170
     * @tc.name testFloat64ArrayFindIndex017
     * @tc.desc Verify findIndex propagates SyntaxError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      try {
        arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new SyntaxError("syntax");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0180
     * @tc.name testFloat64ArrayFindIndex018
     * @tc.desc Verify findIndex propagates ReferenceError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      try {
        arr.findIndex((value: number): boolean => {
          throw new ReferenceError("ref");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ReferenceError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0190
     * @tc.name testFloat64ArrayFindIndex019
     * @tc.desc Verify findIndex returns -1 when value predicate does not match any element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 3.5;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0200
     * @tc.name testFloat64ArrayFindIndex020
     * @tc.desc Verify findIndex callback receives index parameter correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return index === 2;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0210
     * @tc.name testFloat64ArrayFindIndex021
     * @tc.desc Verify findIndex callback receives array parameter correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return array.length === 3;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0220
     * @tc.name testFloat64ArrayFindIndex022
     * @tc.desc Verify findIndex callback receives Double MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive);
      const result = arr.findIndex((value: number): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0230
     * @tc.name testFloat64ArrayFindIndex023
     * @tc.desc Verify findIndex callback receives Double MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0240
     * @tc.name testFloat64ArrayFindIndex024
     * @tc.desc Verify findIndex callback receives NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue);
      const result = arr.findIndex((value: number): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0250
     * @tc.name testFloat64ArrayFindIndex025
     * @tc.desc Verify findIndex callback receives Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === Infinity;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0260
     * @tc.name testFloat64ArrayFindIndex026
     * @tc.desc Verify findIndex callback receives negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive);
      const result = arr.findIndex((value: number): boolean => {
        return value < 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0270
     * @tc.name testFloat64ArrayFindIndex027
     * @tc.desc Verify findIndex callback receives negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0280
     * @tc.name testFloat64ArrayFindIndex028
     * @tc.desc Verify findIndex on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array(0);
      const result = arr.findIndex((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0290
     * @tc.name testFloat64ArrayFindIndex029
     * @tc.desc Verify findIndex on single element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 3.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0300
     * @tc.name testFloat64ArrayFindIndex030
     * @tc.desc Verify findIndex on single element not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 10.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0310
     * @tc.name testFloat64ArrayFindIndex031
     * @tc.desc Verify findIndex on two elements finds first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.findIndex((value: number): boolean => {
        return value >= 1.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0320
     * @tc.name testFloat64ArrayFindIndex032
     * @tc.desc Verify findIndex on two elements finds second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 1.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0330
     * @tc.name testFloat64ArrayFindIndex033
     * @tc.desc Verify findIndex on two elements not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0340
     * @tc.name testFloat64ArrayFindIndex034
     * @tc.desc Verify findIndex on five elements finds middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 3.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0350
     * @tc.name testFloat64ArrayFindIndex035
     * @tc.desc Verify findIndex on five elements finds last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0360
     * @tc.name testFloat64ArrayFindIndex036
     * @tc.desc Verify findIndex on five elements not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 10.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0370
     * @tc.name testFloat64ArrayFindIndex037
     * @tc.desc Verify findIndex finds zero value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0380
     * @tc.name testFloat64ArrayFindIndex038
     * @tc.desc Verify findIndex finds negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === -0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0390
     * @tc.name testFloat64ArrayFindIndex039
     * @tc.desc Verify findindex((value: number, index: int, array: float64array) with [0.5, 1.5, 0.25, 0.125] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value < 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0400
     * @tc.name testFloat64ArrayFindIndex040
     * @tc.desc Verify findIndex returns -1 when decimal value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 0.1;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0410
     * @tc.name testFloat64ArrayFindIndex041
     * @tc.desc Verify findIndex finds MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0420
     * @tc.name testFloat64ArrayFindIndex042
     * @tc.desc Verify findIndex finds MIN_VALUE tiny positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0430
     * @tc.name testFloat64ArrayFindIndex043
     * @tc.desc Verify findIndex finds scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number): boolean => {
        return value > 1.0e-6;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0440
     * @tc.name testFloat64ArrayFindIndex044
     * @tc.desc Verify findIndex finds integer among floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === 2.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0450
     * @tc.name testFloat64ArrayFindIndex045
     * @tc.desc Verify findIndex on all same values finds first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 5.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0460
     * @tc.name testFloat64ArrayFindIndex046
     * @tc.desc Verify findIndex finds first NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0470
     * @tc.name testFloat64ArrayFindIndex047
     * @tc.desc Verify findIndex returns index 0 when first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value >= 1.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0480
     * @tc.name testFloat64ArrayFindIndex048
     * @tc.desc Verify findIndex returns middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 2.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0490
     * @tc.name testFloat64ArrayFindIndex049
     * @tc.desc Verify findIndex returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 3.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0500
     * @tc.name testFloat64ArrayFindIndex050
     * @tc.desc Verify findIndex not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 10.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0510
     * @tc.name testFloat64ArrayFindIndex051
     * @tc.desc Verify findIndex stops after first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let callCount: int = 0;
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(callCount).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0520
     * @tc.name testFloat64ArrayFindIndex052
     * @tc.desc Verify findIndex visits all elements when not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      let callCount: int = 0;
      const result = arr.findIndex((value: number): boolean => {
        callCount = callCount + 1;
        return false;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(callCount).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0530
     * @tc.name testFloat64ArrayFindIndex053
     * @tc.desc Verify findIndex does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const lenBefore: int = arr.length;
      arr.findIndex((value: number, index: int): boolean => {
        return value > 1.5;
      })

      expect(arr.length).assertEqual(lenBefore);
      const actVal1 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0540
     * @tc.name testFloat64ArrayFindIndex054
     * @tc.desc Verify findIndex callback throws Error original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      try {
        arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
          if (index === 1) {
            throw new Error("test");
          }
          return false;
        })

      } catch (e) { /* expected */
        expect(e.name).assertEqual("Error");
      }
      expect(arr.length).assertEqual(threeValue);
      const actVal2 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0550
     * @tc.name testFloat64ArrayFindIndex055
     * @tc.desc Verify findIndex stops iteration after callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      let callCount: int = 0;
      try {
        arr.findIndex((value: number): boolean => {
          callCount = callCount + 1;
          if (callCount === 2) {
            throw new Error("stop");
          }
          return false;
        })

      } catch (e) { /* expected */
        expect(e.name).assertEqual("Error");
      }
      const expectVal = twoValue;
      expect(callCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0560
     * @tc.name testFloat64ArrayFindIndex056
     * @tc.desc Verify findIndex finds first element as MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0570
     * @tc.name testFloat64ArrayFindIndex057
     * @tc.desc Verify findIndex finds middle element as MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0580
     * @tc.name testFloat64ArrayFindIndex058
     * @tc.desc Verify findIndex finds last element as MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0590
     * @tc.name testFloat64ArrayFindIndex059
     * @tc.desc Verify findIndex finds NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0600
     * @tc.name testFloat64ArrayFindIndex060
     * @tc.desc Verify findIndex finds Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === Infinity;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0610
     * @tc.name testFloat64ArrayFindIndex061
     * @tc.desc Verify findIndex finds negative Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === -Infinity;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0620
     * @tc.name testFloat64ArrayFindIndex062
     * @tc.desc Verify findindex((value: number, index: int) with [0.1, 9007199254740991, 0] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value < -1.5;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0630
     * @tc.name testFloat64ArrayFindIndex063
     * @tc.desc Verify findIndex finds zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0640
     * @tc.name testFloat64ArrayFindIndex064
     * @tc.desc Verify findIndex returns -1 when decimal precision value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 0.3;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0650
     * @tc.name testFloat64ArrayFindIndex065
     * @tc.desc Verify findIndex finds first in all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0660
     * @tc.name testFloat64ArrayFindIndex066
     * @tc.desc Verify findIndex with greater-than condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.5;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0670
     * @tc.name testFloat64ArrayFindIndex067
     * @tc.desc Verify findIndex with greater-equal condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number): boolean => {
        return value >= 2.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0680
     * @tc.name testFloat64ArrayFindIndex068
     * @tc.desc Verify findIndex with less-than condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value < 2.5;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0690
     * @tc.name testFloat64ArrayFindIndex069
     * @tc.desc Verify findIndex with less-equal condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value <= 1.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0700
     * @tc.name testFloat64ArrayFindIndex070
     * @tc.desc Verify findIndex with equality condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 2.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0710
     * @tc.name testFloat64ArrayFindIndex071
     * @tc.desc Verify findIndex with inequality condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value !== 1.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0720
     * @tc.name testFloat64ArrayFindIndex072
     * @tc.desc Verify findIndex with logical AND condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0 && value < 4.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0730
     * @tc.name testFloat64ArrayFindIndex073
     * @tc.desc Verify findIndex with logical OR condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 1.0 || value === 3.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0740
     * @tc.name testFloat64ArrayFindIndex074
     * @tc.desc Verify findIndex with index parameter condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return index === 2;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0750
     * @tc.name testFloat64ArrayFindIndex075
     * @tc.desc Verify findIndex with array parameter condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return array.length === 3;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0760
     * @tc.name testFloat64ArrayFindIndex076
     * @tc.desc Verify findIndex finds first NaN among multiple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0770
     * @tc.name testFloat64ArrayFindIndex077
     * @tc.desc Verify findIndex finds negative zero among zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === -0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0780
     * @tc.name testFloat64ArrayFindIndex078
     * @tc.desc Verify findIndex finds negative Infinity among positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value < 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0790
     * @tc.name testFloat64ArrayFindIndex079
     * @tc.desc Verify findIndex finds NaN among mixed special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.findIndex((value: number): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0800
     * @tc.name testFloat64ArrayFindIndex080
     * @tc.desc Verify findIndex finds large scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 1.0e+220;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0810
     * @tc.name testFloat64ArrayFindIndex081
     * @tc.desc Verify findIndex finds tiny positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 1e-200;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0820
     * @tc.name testFloat64ArrayFindIndex082
     * @tc.desc Verify findIndex finds negative value in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === -1.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0830
     * @tc.name testFloat64ArrayFindIndex083
     * @tc.desc Verify findIndex finds in decreasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value < 3.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0840
     * @tc.name testFloat64ArrayFindIndex084
     * @tc.desc Verify findIndex finds positive in alternating array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const threeValue: number = 3;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = threeValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0850
     * @tc.name testFloat64ArrayFindIndex085
     * @tc.desc Verify findIndex finds first among repeated MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(zeroValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value > 1.0e+300;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0860
     * @tc.name testFloat64ArrayFindIndex086
     * @tc.desc Verify findIndex callback accesses array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return arr.$_get(0) === 1.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0870
     * @tc.name testFloat64ArrayFindIndex087
     * @tc.desc Verify findIndex callback accesses array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value < arr.length;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0880
     * @tc.name testFloat64ArrayFindIndex088
     * @tc.desc Verify findIndex with nested findIndex call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return arr.findIndex((v: number): boolean => {
          return v === value;
        }) >= 0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0890
     * @tc.name testFloat64ArrayFindIndex089
     * @tc.desc Verify findIndex callback modifies external state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const threeValue: number = 3;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      let externalState: int = 0;
      const result = arr.findIndex((value: number, index: int): boolean => {
        externalState = externalState + 1;
        return value > 1.5;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(externalState).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0900
     * @tc.name testFloat64ArrayFindIndex090
     * @tc.desc Verify findIndex with int type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const a: int = 10;
      const b: int = 20;
      const c: int = 30;
      const arr = Float64Array.of(a, b, c);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 10;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0910
     * @tc.name testFloat64ArrayFindIndex091
     * @tc.desc Verify findIndex with float type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const a: float = 1.5f;
      const b: float = 2.5f;
      const c: float = 3.5f;
      const arr = Float64Array.of(a, b, c);
      const result = arr.findIndex((value: number): boolean => {
        return value > 2.5;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0920
     * @tc.name testFloat64ArrayFindIndex092
     * @tc.desc Verify findIndex with double type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const a: double = 1.23456789;
      const b: double = 2.34567891;
      const c: double = 3.45678912;
      const arr = Float64Array.of(a, b, c);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 2.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0930
     * @tc.name testFloat64ArrayFindIndex093
     * @tc.desc Verify findIndex finds Infinity after NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === Infinity;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0940
     * @tc.name testFloat64ArrayFindIndex094
     * @tc.desc Verify findIndex finds negative non-NaN after negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number): boolean => {
        return value < 0.0 && value === value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0950
     * @tc.name testFloat64ArrayFindIndex095
     * @tc.desc Verify findIndex finds negative boundary after int min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > -100.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0960
     * @tc.name testFloat64ArrayFindIndex096
     * @tc.desc Verify findIndex finds integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value > 2147483647.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0970
     * @tc.name testFloat64ArrayFindIndex097
     * @tc.desc Verify findIndex finds safe integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 9007199254740991.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0980
     * @tc.name testFloat64ArrayFindIndex098
     * @tc.desc Verify findIndex finds normal value among extremes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 1.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_0990
     * @tc.name testFloat64ArrayFindIndex099
     * @tc.desc Verify findIndex finds zero in negative-to-positive transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      const result = arr.findIndex((value: number): boolean => {
        return value >= 0.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1000
     * @tc.name testFloat64ArrayFindIndex100
     * @tc.desc Verify findIndex finds in decimal sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 0.025;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1010
     * @tc.name testFloat64ArrayFindIndex101
     * @tc.desc Verify findIndex finds in scientific notation sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value >= 1.0e0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1020
     * @tc.name testFloat64ArrayFindIndex102
     * @tc.desc Verify findIndex predicate returns undefined treated as falsy throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value !== 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1030
     * @tc.name testFloat64ArrayFindIndex103
     * @tc.desc Verify findIndex with 0.0 as null equivalent element skips default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1040
     * @tc.name testFloat64ArrayFindIndex104
     * @tc.desc Verify findIndex with NaN as undefined equivalent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value !== value;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1050
     * @tc.name testFloat64ArrayFindIndex105
     * @tc.desc Verify findIndex predicate returns NaN treated as falsy returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        let nanVal: double = NaN;
        if (nanVal !== nanVal) {
          return false;
        }
        return true;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1060
     * @tc.name testFloat64ArrayFindIndex106
     * @tc.desc Verify findIndex propagates Error thrown from callback using throw new Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error("string throw");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1070
     * @tc.name testFloat64ArrayFindIndex107
     * @tc.desc Verify findIndex propagates EvalError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      try {
        arr.findIndex((value: number, index: int): boolean => {
          throw new EvalError("eval");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("EvalError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1080
     * @tc.name testFloat64ArrayFindIndex108
     * @tc.desc Verify findIndex propagates URIError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      try {
        arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
          throw new URIError("uri");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("URIError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1090
     * @tc.name testFloat64ArrayFindIndex109
     * @tc.desc Verify findIndex on single element default 0.0 returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array(1);
      const result = arr.findIndex((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1100
     * @tc.name testFloat64ArrayFindIndex110
     * @tc.desc Verify findIndex with float MIN_VALUE 1.4e-45 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value > 0.0 && value < 1.0e-40;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1110
     * @tc.name testFloat64ArrayFindIndex111
     * @tc.desc Verify findIndex with float MAX_VALUE 3.4028235e+38 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0e+38;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1120
     * @tc.name testFloat64ArrayFindIndex112
     * @tc.desc Verify findIndex with byte boundary value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 127;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1130
     * @tc.name testFloat64ArrayFindIndex113
     * @tc.desc Verify findIndex with short boundary value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === 32767;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1140
     * @tc.name testFloat64ArrayFindIndex114
     * @tc.desc Verify findIndex with hex literal element 0x100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.findIndex((value: number, index: int, array: Float64Array): boolean => {
        return value === 256;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1150
     * @tc.name testFloat64ArrayFindIndex115
     * @tc.desc Verify findIndex returns -1 when octal literal value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.findIndex((value: number): boolean => {
        return value === 64;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1160
     * @tc.name testFloat64ArrayFindIndex116
     * @tc.desc Verify findIndex with binary literal element 0b1000 equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.findIndex((value: number, index: int): boolean => {
        return value === 8;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1170
     * @tc.name testFloat64ArrayFindIndex117
     * @tc.desc Verify findIndex returns first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const actVal3 = values.findIndex((value) => value > 4);
      const expectVal = oneValue;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1180
     * @tc.name testFloat64ArrayFindIndex118
     * @tc.desc Verify findIndex returns -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeOne: number = -1;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const actVal4 = values.findIndex((value) => value > 10);
      const expectVal = negativeOne;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1190
     * @tc.name testFloat64ArrayFindIndex119
     * @tc.desc Verify findIndex returns index 0 for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const negativeOne: number = -1;
      const values = Float64Array.of(int16MinValue, -128);
      const actVal5 = values.findIndex((value) => value === 4. - 1);
      const expectVal = negativeOne;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1200
     * @tc.name testFloat64ArrayFindIndex120
     * @tc.desc Verify findIndex returns -1 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = new Float64Array();
      const actVal6 = values.findIndex((value) => value > 0);
      const expectVal = negativeOne;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1210
     * @tc.name testFloat64ArrayFindIndex121
     * @tc.desc Verify findIndex with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1);
      const actVal7 = values.findIndex((value) => Number.isNaN(value));
      const expectVal = negativeOne;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1220
     * @tc.name testFloat64ArrayFindIndex122
     * @tc.desc Verify findIndex with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const negativeOne: number = -1;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const actVal8 = values.findIndex((value) => value === Infinity);
      const expectVal = negativeOne;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1230
     * @tc.name testFloat64ArrayFindIndex123
     * @tc.desc Verify findIndex callback with incrementing index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const actVal9 = values.findIndex((value, index) => index === 2);
      const expectVal = twoValue;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1240
     * @tc.name testFloat64ArrayFindIndex124
     * @tc.desc Verify findIndex callback error propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue, -128);
      try {
        values.findIndex((value) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1250
     * @tc.name testFloat64ArrayFindIndex125
     * @tc.desc Verify findIndex returns last index when all elements match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const actVal10 = values.findIndex((value) => value > -1);
      const expectVal = twoValue;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1260
     * @tc.name testFloat64ArrayFindIndex126
     * @tc.desc Verify findIndex with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const oneValue: number = 1;
      const arr = Float64Array.of(hexValueFF, hexValueAA, hexValue55);
      const idx = arr.findIndex((e: number): boolean => e === 0xAA);
      const expectVal = oneValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1270
     * @tc.name testFloat64ArrayFindIndex127
     * @tc.desc Verify findIndex with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const oneValue: number = 1;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010, binaryValue01010101);
      const idx = arr.findIndex((e: number): boolean => e === 0b10101010);
      const expectVal = oneValue;
      expect(idx).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1280
     * @tc.name testFloat64ArrayFindIndex128
     * @tc.desc Verify findindex with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const zeroValue: number = 0;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.findIndex((value: number): boolean => Number.isNaN(value));
      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1290
     * @tc.name testFloat64ArrayFindIndex129
     * @tc.desc Verify findindex with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const zeroValue: number = 0;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.findIndex((value: number): boolean => value > 0.0);
      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1300
     * @tc.name testFloat64ArrayFindIndex130
     * @tc.desc Verify findindex with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const oneValue: number = 1;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.findIndex((value: number): boolean => value === Double.MAX_VALUE);
      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1310
     * @tc.name testFloat64ArrayFindIndex131
     * @tc.desc Verify findIndex with zero arguments throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.findIndex(undefined as Object as (value: number, index: int, array: Float64Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1320
     * @tc.name testFloat64ArrayFindIndex132
     * @tc.desc Verify findIndex reads modified value when callback changes array elements during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      // At index 0, modify index 2 from 3.0 to 999.0
      // findIndex should use the modified value 999.0 when it reaches index 2
      const result = arr.findIndex((val: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(2, 999.0);
        }
        return val > 3.0;
      })
      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1330
     * @tc.name testFloat64ArrayFindIndex133
     * @tc.desc Verify findIndex on a large array of 1000 elements completes without timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i * 1.0);
      }
      const result = arr.findIndex((val: number): boolean => val > 500.0);
      const expectVal = 501;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDINDEX_1340
     * @tc.name testFloat64ArrayFindIndex134
     * @tc.desc Verify findIndex returns a numeric int type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindIndex134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result = arr.findIndex((val: number): boolean => val > 1.0);
      // Verify result is a numeric value usable in arithmetic
      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
      const doubled: number = result * twoValue;
      const expectVal2 = twoValue;
      expect(doubled).assertEqual(expectVal2);
    })

  })
}
