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
import Utils, { predFn002, extFn030, recPred032, CustomError004 } from '../Util.test';

export default function Float64ArrayFindLastTest(): void {
  describe('Float64ArrayFindLastTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0100
     * @tc.name testFloat64ArrayFindLast001
     * @tc.desc Verify findLast with int type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyValue: number = 30;
      const a: int = 10;
      const b: int = 20;
      const c: int = 30;
      const arr = new Float64Array([a, b, c]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value > 10;
      })

      const expectVal = thirtyValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0200
     * @tc.name testFloat64ArrayFindLast002
     * @tc.desc Verify findLast with float type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointfive: number = 3.5;
      const a: float = 1.5f;
      const b: float = 2.5f;
      const c: float = 3.5f;
      const arr = new Float64Array([a, b, c]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value > 1.5f;
      })

      const expectVal = threePointfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0300
     * @tc.name testFloat64ArrayFindLast003
     * @tc.desc Verify findLast with double type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expectedDoubleValue: number = 3.45678912;
      const a: double = 1.23456789;
      const b: double = 2.34567891;
      const c: double = 3.45678912;
      const arr = new Float64Array([a, b, c]);
      const result = arr.findLast((value: number): boolean => {
        return value > 2.0;
      })

      const expectVal = expectedDoubleValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0400
     * @tc.name testFloat64ArrayFindLast004
     * @tc.desc Verify findLast with arrow function predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0;
      })

      const expectVal = onePointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0500
     * @tc.name testFloat64ArrayFindLast005
     * @tc.desc Verify findLast with named function predicate from helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, twoValue]);
      const result = arr.findLast(predFn002);

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0600
     * @tc.name testFloat64ArrayFindLast006
     * @tc.desc Verify findLast with predicate always returning true returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return true;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0700
     * @tc.name testFloat64ArrayFindLast007
     * @tc.desc Verify findLast with predicate always returning false throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLast((value: number): boolean => {
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0800
     * @tc.name testFloat64ArrayFindLast008
     * @tc.desc Verify findLast treats boolean variable true as truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        let ret: boolean = true;
        return ret;
      })

      const expectVal = pointTwoFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_0900
     * @tc.name testFloat64ArrayFindLast009
     * @tc.desc Verify findLast with hexadecimal literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue100000: number = 0x100000;
      const hexValue200000: number = 0x200000;
      const hexValue300000: number = 0x300000;
      const arr = new Float64Array([hexValue100000, hexValue200000, hexValue300000]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return true;
      })

      const expectVal = hexValue300000;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1000
     * @tc.name testFloat64ArrayFindLast010
     * @tc.desc Verify findLast treats return Infinity as truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.findLast((value: number): boolean => {
        let inf: double = Infinity;
        return inf > 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1100
     * @tc.name testFloat64ArrayFindLast011
     * @tc.desc Verify findLast callback receives last element first searching backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      let firstVal: number = 0.0;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        firstVal = value;
        return true;
      })

      const expectVal = zeroValue;
      expect(firstVal).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1200
     * @tc.name testFloat64ArrayFindLast012
     * @tc.desc Verify findLast callback receives first element last when searching from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      let lastVal: number = 0.0;
      const result = arr.findLast((value: number, index: int): boolean => {
        lastVal = value;
        return index === 0;
      })

      const expectVal = pointOne;
      expect(lastVal).assertEqual(expectVal);
      const expectVal2 = pointOne;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1300
     * @tc.name testFloat64ArrayFindLast013
     * @tc.desc Verify findLast callback receives zero value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0.0;
      const arr = Float64Array.of(0.5, zeroValue, 0.25);
      let zeroVal: number = -1.0;
      const result = arr.findLast((value: number): boolean => {
        if (value === 0.0) {
          zeroVal = value;
          return true;
        }
        return false;
      })

      const expectVal = zeroValue;
      expect(zeroVal).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1400
     * @tc.name testFloat64ArrayFindLast014
     * @tc.desc Verify findLast callback receives NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, NaN, 0]);
      let nanVal: number = 0.0;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (value !== value) {
          nanVal = value;
          return true;
        }
        return false;
      })

      expect(nanVal === nanVal).assertFalse();
      expect(result === result).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1500
     * @tc.name testFloat64ArrayFindLast015
     * @tc.desc Verify findLast callback receives Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const infValue: number = Infinity;
      const arr = new Float64Array([-2147483648, -1, infValue]);
      let infVal: number = 0.0;
      const result = arr.findLast((value: number, index: int): boolean => {
        if (value === Infinity) {
          infVal = value;
          return true;
        }
        return false;
      })

      const expectVal = infValue;
      expect(infVal).assertEqual(expectVal);
      const expectVal2 = infValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1600
     * @tc.name testFloat64ArrayFindLast016
     * @tc.desc Verify findLast callback receives negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInfValue: number = -Infinity;
      const arr = Float64Array.of(0.1, 9007199254740991, negInfValue);
      let negInfVal: number = 0.0;
      const result = arr.findLast((value: number): boolean => {
        if (value === -Infinity) {
          negInfVal = value;
          return true;
        }
        return false;
      })

      const expectVal = negInfValue;
      expect(negInfVal).assertEqual(expectVal);
      const expectVal2 = negInfValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1700
     * @tc.name testFloat64ArrayFindLast017
     * @tc.desc Verify findLast callback index starts at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const twoValue: number = 2;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      let lastIdx: int = -1;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        lastIdx = index;
        return true;
      })

      const expectVal = twoValue;
      expect(lastIdx).assertEqual(expectVal);
      const expectVal2 = pointTwoFive;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1800
     * @tc.name testFloat64ArrayFindLast018
     * @tc.desc Verify findLast callback index reaches first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negativeOne: number = -1;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      let firstIdx: int = -1;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (index === 0) {
          firstIdx = index;
          return true;
        }
        return false;
      })

      const expectVal = zeroValue;
      expect(firstIdx).assertEqual(expectVal);
      const expectVal2 = int16MinValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_1900
     * @tc.name testFloat64ArrayFindLast019
     * @tc.desc Verify findLast callback index decrements from end to start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const fourValue: number = 4;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, 1, 2147483647);
      let idx0: int = -1;
      let idx4: int = -1;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (index === 4) {
          idx4 = index;
        }
        if (index === 0) {
          idx0 = index;
          return true;
        }
        return false;
      })

      const expectVal = fourValue;
      expect(idx4).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(idx0).assertEqual(expectVal2);
      const expectVal3 = int32MinValue;
      expect(result).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2000
     * @tc.name testFloat64ArrayFindLast020
     * @tc.desc Verify findLast on single element array gets index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const arr = new Float64Array([pointOne]);
      let singleIdx: int = -1;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        singleIdx = index;
        return true;
      })

      const expectVal = zeroValue;
      expect(singleIdx).assertEqual(expectVal);
      const expectVal2 = pointOne;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2100
     * @tc.name testFloat64ArrayFindLast021
     * @tc.desc Verify findLast callback array parameter has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive);
      let arrLen: int = 0;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        arrLen = array.length;
        return true;
      })

      const expectVal = threeValue;
      expect(arrLen).assertEqual(expectVal);
      const expectVal2 = pointTwoFive;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2200
     * @tc.name testFloat64ArrayFindLast022
     * @tc.desc Verify findLast callback can modify original array through array param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        array.$_set(0, num999Pointzero);
        return true;
      })

      const actVal1 = arr.$_get(0);
      const expectVal = num999Pointzero;
      expect(actVal1).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2300
     * @tc.name testFloat64ArrayFindLast023
     * @tc.desc Verify findLast on empty array callback not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let called: boolean = false;
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          called = true;
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      const expectVal = false;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2400
     * @tc.name testFloat64ArrayFindLast024
     * @tc.desc Verify findLast on empty array throws Error when no element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      try {
        arr.findLast((value: number, index: int): boolean => {
          return value > 0.0;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2500
     * @tc.name testFloat64ArrayFindLast025
     * @tc.desc Verify findLast on single element array invokes value-only callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne]);
      let valueSeen: boolean = false;
      const result = arr.findLast((value: number): boolean => {
        valueSeen = true;
        return true;
      })

      const expectVal = true;
      expect(valueSeen).assertEqual(expectVal);
      const expectVal2 = pointOne;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2600
     * @tc.name testFloat64ArrayFindLast026
     * @tc.desc Verify findLast on single element matching predicate returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === int32MinValue;
      })

      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2700
     * @tc.name testFloat64ArrayFindLast027
     * @tc.desc Verify findLast on single element not matching throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      try {
        arr.findLast((value: number, index: int): boolean => {
          return value > 100.0;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2800
     * @tc.name testFloat64ArrayFindLast028
     * @tc.desc Verify findLast on single NaN element using NaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue);
      const result = arr.findLast((value: number): boolean => {
        return value !== value;
      })

      expect(result === result).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_2900
     * @tc.name testFloat64ArrayFindLast029
     * @tc.desc Verify findLast finds last matching element with duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const int8MaxValue: number = 127;
      const arr = new Float64Array([int16MaxValue, int8MaxValue, 0, int8MaxValue, int16MaxValue]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === int8MaxValue;
      })

      const expectVal = int8MaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3000
     * @tc.name testFloat64ArrayFindLast030
     * @tc.desc Verify findLast finds unique qualifying first element from end search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue, -1, 0, 1, 2147483647]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === int32MinValue;
      })

      const expectVal = int32MinValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3100
     * @tc.name testFloat64ArrayFindLast031
     * @tc.desc Verify findLast returns last element when all qualify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.findLast((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3200
     * @tc.name testFloat64ArrayFindLast032
     * @tc.desc Verify findLast throws Error when none qualify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          return value > 100.0;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3300
     * @tc.name testFloat64ArrayFindLast033
     * @tc.desc Verify findLast finds last matching among duplicates at correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const int8MaxValue: number = 127;
      const threeValue: number = 3;
      const arr = new Float64Array([int16MaxValue, int8MaxValue, 0, int8MaxValue, int16MaxValue]);
      let foundIdx: int = -1;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (value === int8MaxValue) {
          foundIdx = index;
          return true;
        }
        return false;
      })

      const expectVal = threeValue;
      expect(foundIdx).assertEqual(expectVal);
      const expectVal2 = int8MaxValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3400
     * @tc.name testFloat64ArrayFindLast034
     * @tc.desc Verify findLast propagates RangeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.findLast((value: number, index: int): boolean => {
          throw new RangeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3500
     * @tc.name testFloat64ArrayFindLast035
     * @tc.desc Verify findLast propagates TypeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLast((value: number): boolean => {
          throw new TypeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3600
     * @tc.name testFloat64ArrayFindLast036
     * @tc.desc Verify findLast propagates Error from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3700
     * @tc.name testFloat64ArrayFindLast037
     * @tc.desc Verify findLast propagates CustomError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.findLast((value: number, index: int): boolean => {
          throw new CustomError004("custom");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3800
     * @tc.name testFloat64ArrayFindLast038
     * @tc.desc Verify findLast propagates Error thrown at first checked element last in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      try {
        arr.findLast((value: number): boolean => {
          if (value === zeroValue) {
            throw new Error("first checked");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_3900
     * @tc.name testFloat64ArrayFindLast039
     * @tc.desc Verify findLast propagates Error thrown at mid element while searching backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          if (index === 1) {
            throw new Error("mid");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4000
     * @tc.name testFloat64ArrayFindLast040
     * @tc.desc Verify findLast callback modifies external counter visiting all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      let counter: int = 0;
      const result = arr.findLast((value: number, index: int): boolean => {
        counter = counter + 1;
        return index === 0;
      })

      const expectVal = threeValue;
      expect(counter).assertEqual(expectVal);
      const expectVal2 = pointFive;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4100
     * @tc.name testFloat64ArrayFindLast041
     * @tc.desc Verify findLast callback visits elements in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      let val0: number = -1.0;
      let val1: number = -1.0;
      let val2: number = -1.0;
      let count: int = 0;
      try {
        arr.findLast((value: number): boolean => {
          if (count === 0) {
            val0 = value;
          } else if (count === 1) {
            val1 = value;
          } else {
            val2 = value;
          }
          count = count + 1;
          return false;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      const expectVal = zeroValue;
      expect(val0).assertEqual(expectVal);
      const expectVal2 = int8MinValue;
      expect(val1).assertEqual(expectVal2);
      const expectVal3 = int16MinValue;
      expect(val2).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4200
     * @tc.name testFloat64ArrayFindLast042
     * @tc.desc Verify findLast callback calls external function from helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3.0;
      const arr = new Float64Array([-2147483648, -1, threeValue]);
      let fnCalled: boolean = false;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (value === threeValue) {
          fnCalled = true;
        }
        return extFn030(value) > 4.0;
      })

      const expectVal = true;
      expect(fnCalled).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4300
     * @tc.name testFloat64ArrayFindLast043
     * @tc.desc Verify findLast with nested findLast call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = new Float64Array([0.1, 9007199254740991, 0, piValue, tinyNegativeValue]);
      let nestedResult: number = 0.0;
      const result = arr.findLast((value: number, index: int): boolean => {
        if (value === tinyNegativeValue) {
          nestedResult = arr.findLast((v: number, i: int, a: Float64Array): boolean => {
            return v > 2.0;
          })

          return true;
        }
        return false;
      })

      const expectVal = tinyNegativeValue;
      expect(result).assertEqual(expectVal);
      const expectVal2 = piValue;
      expect(nestedResult).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4400
     * @tc.name testFloat64ArrayFindLast044
     * @tc.desc Verify findLast with Double MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxDoubleValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(0.5, maxDoubleValue, 0.25);
      const result = arr.findLast((value: number): boolean => {
        return value === maxDoubleValue;
      })

      const expectVal = maxDoubleValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4500
     * @tc.name testFloat64ArrayFindLast045
     * @tc.desc Verify findLast with Double MIN_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minDoubleValue: number = 5e-324;
      const arr = new Float64Array([-32768, minDoubleValue, 0]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === minDoubleValue;
      })

      const expectVal = minDoubleValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4600
     * @tc.name testFloat64ArrayFindLast046
     * @tc.desc Verify findLast with MAX_SAFE_INTEGER element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = new Float64Array([-2147483648, maxSafeInteger, 0]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === maxSafeInteger;
      })

      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4700
     * @tc.name testFloat64ArrayFindLast047
     * @tc.desc Verify findLast with MIN_SAFE_INTEGER element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991;
      const arr = Float64Array.of(0.1, minSafeInteger, 0);
      const result = arr.findLast((value: number): boolean => {
        return value === minSafeInteger;
      })

      const expectVal = minSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4800
     * @tc.name testFloat64ArrayFindLast048
     * @tc.desc Verify findLast with scientific notation 1.0e+10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scientificValue: number = 1.0e+10;
      const arr = Float64Array.of(0.5, scientificValue, 0.25);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === scientificValue;
      })

      const expectVal = scientificValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_4900
     * @tc.name testFloat64ArrayFindLast049
     * @tc.desc Verify findLast with negative scientific notation -1.0e+10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeScientificValue: number = -1.0e+10;
      const arr = Float64Array.of(-32768, negativeScientificValue, 0);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === negativeScientificValue;
      })

      const expectVal = negativeScientificValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5000
     * @tc.name testFloat64ArrayFindLast050
     * @tc.desc Verify findLast throws Error when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.findLast((value: number): boolean => {
          return value > 100.0;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5100
     * @tc.name testFloat64ArrayFindLast051
     * @tc.desc Verify findLast returns NaN with NaN check and self-inequality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1, 9007199254740991, NaN, 0);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value !== value;
      })

      expect(result === result).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5200
     * @tc.name testFloat64ArrayFindLast052
     * @tc.desc Verify findLast returns Infinity and comparison works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const infinityValue: number = Infinity;
      const arr = new Float64Array([0.5, infinityValue, 0.25]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === infinityValue;
      })

      const expectVal = infinityValue;
      expect(result).assertEqual(expectVal);
      expect(result > 1.0e+308).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5300
     * @tc.name testFloat64ArrayFindLast053
     * @tc.desc Verify findLast does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      arr.findLast((value: number): boolean => {
        return value === zeroValue;
      })

      expect(arr.length).assertEqual(threeValue);
      const actVal2 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal3).assertEqual(expectVal2);
      const actVal4 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal4).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5400
     * @tc.name testFloat64ArrayFindLast054
     * @tc.desc Verify findLast on empty array throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      try {
        arr.findLast((value: number, index: int, array: Float64Array): boolean => {
          return value > 0.0;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5500
     * @tc.name testFloat64ArrayFindLast055
     * @tc.desc Verify findLast when callback throws original array is not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const threeValue: number = 3;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      try {
        arr.findLast((value: number, index: int): boolean => {
          throw new Error("test");
        })

      } catch (e) {
        // expected
      }
      expect(arr.length).assertEqual(threeValue);
      const actVal5 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5600
     * @tc.name testFloat64ArrayFindLast056
     * @tc.desc Verify findLast stops at first element checked when error thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      let checkedCount: int = 0;
      try {
        arr.findLast((value: number): boolean => {
          checkedCount = checkedCount + 1;
          throw new Error("stop");
        })

      } catch (e) {
        // expected
      }
      const expectVal = oneValue;
      expect(checkedCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5700
     * @tc.name testFloat64ArrayFindLast057
     * @tc.desc Verify findLast two-parameter overload with value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value > 1.0;
      })

      const expectVal = onePointFive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5800
     * @tc.name testFloat64ArrayFindLast058
     * @tc.desc Verify findLast single-parameter callback with value only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2.0;
      const arr = new Float64Array([-32768, -128, twoValue]);
      const result = arr.findLast((value: number): boolean => {
        return value > 1.0;
      })

      const expectVal = twoValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_5900
     * @tc.name testFloat64ArrayFindLast059
     * @tc.desc Verify findLast when all elements are same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = Float64Array.of(oneValue, oneValue, oneValue, oneValue);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === oneValue;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6000
     * @tc.name testFloat64ArrayFindLast060
     * @tc.desc Verify findLast when all elements are NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([nanValue, nanValue, nanValue]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value !== value;
      })

      expect(result === result).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6100
     * @tc.name testFloat64ArrayFindLast061
     * @tc.desc Verify findLast when all elements are 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0.0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.findLast((value: number): boolean => {
        return value === 0.0;
      })

      const expectVal = zeroValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6200
     * @tc.name testFloat64ArrayFindLast062
     * @tc.desc Verify findLast with alternating positive and negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([-32768, -128, 0, 127, int16MaxValue]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = int16MaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6300
     * @tc.name testFloat64ArrayFindLast063
     * @tc.desc Verify findLast with strictly increasing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value < 5.0;
      })

      const expectVal = oneValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6400
     * @tc.name testFloat64ArrayFindLast064
     * @tc.desc Verify findLast with negative zero -0.0 in callback receives and identifies correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, -0.0]);
      let foundNegZero: boolean = false;
      const result = arr.findLast((value: number): boolean => {
        if (value === 0.0 && 1.0 / value < 0.0) {
          foundNegZero = true;
          return true;
        }
        return false;
      })

      const expectVal = true;
      expect(foundNegZero).assertEqual(expectVal);
      expect(1.0 / result < 0.0).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6500
     * @tc.name testFloat64ArrayFindLast065
     * @tc.desc Verify findLast with MAX_VALUE in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxDoubleValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(0.5, maxDoubleValue, 0.25);
      let maxFound: boolean = false;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (value === maxDoubleValue) {
          maxFound = true;
          return true;
        }
        return false;
      })

      const expectVal = true;
      expect(maxFound).assertEqual(expectVal);
      const expectVal2 = maxDoubleValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6600
     * @tc.name testFloat64ArrayFindLast066
     * @tc.desc Verify findLast with MIN_VALUE in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minDoubleValue: number = 5e-324;
      const arr = new Float64Array([-32768, minDoubleValue, 0]);
      let minFound: boolean = false;
      const result = arr.findLast((value: number, index: int): boolean => {
        if (value === minDoubleValue) {
          minFound = true;
          return true;
        }
        return false;
      })

      const expectVal = true;
      expect(minFound).assertEqual(expectVal);
      const expectVal2 = minDoubleValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6700
     * @tc.name testFloat64ArrayFindLast067
     * @tc.desc Verify findLast with negative values from end search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.findLast((value: number): boolean => {
        return value < 0.0;
      })

      const expectVal = -1;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6800
     * @tc.name testFloat64ArrayFindLast068
     * @tc.desc Verify findLast with decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const decimalValue: number = 0.3;
      const arr = Float64Array.of(0.1, decimalValue, 0);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value === decimalValue;
      })

      const expectVal = decimalValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_6900
     * @tc.name testFloat64ArrayFindLast069
     * @tc.desc Verify findLast with scientific notation value in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scientificValue: number = 3.0e+0;
      const arr = Float64Array.of(0.5, 1.5, scientificValue);
      let sciFound: boolean = false;
      const result = arr.findLast((value: number, index: int): boolean => {
        if (value === scientificValue) {
          sciFound = true;
          return true;
        }
        return false;
      })

      const expectVal = true;
      expect(sciFound).assertEqual(expectVal);
      const expectVal2 = scientificValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7000
     * @tc.name testFloat64ArrayFindLast070
     * @tc.desc Verify findLast with large negative number -999999.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeNegativeValue: number = -999999.99;
      const arr = new Float64Array([-32768, largeNegativeValue, 0]);
      const result = arr.findLast((value: number): boolean => {
        return value === largeNegativeValue;
      })

      const expectVal = largeNegativeValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7100
     * @tc.name testFloat64ArrayFindLast071
     * @tc.desc Verify findLast with middle index callback parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      let midIdx: int = -1;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (index === 1) {
          midIdx = index;
          return true;
        }
        return false;
      })

      const expectVal = 1;
      expect(midIdx).assertEqual(expectVal);
      const expectVal2 = negativeOne;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7200
     * @tc.name testFloat64ArrayFindLast072
     * @tc.desc Verify findLast callback receives parameters on non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 1.5, zeroValue);
      let seen: boolean = false;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        seen = value === zeroValue && index === 2 && array.length === 3;
        return seen;
      })

      const expectVal = true;
      expect(seen).assertEqual(expectVal);
      const expectVal2 = zeroValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7300
     * @tc.name testFloat64ArrayFindLast073
     * @tc.desc Verify findLast callback array param content matches original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1.0;
      const twoValue: number = 2.0;
      const threeValue: number = 3.0;
      const arr = new Float64Array([oneValue, twoValue, threeValue]);
      let match: boolean = false;
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        if (array.$_get(0) === oneValue && array.$_get(1) === twoValue && array.$_get(2) === threeValue) {
          match = true;
          return true;
        }
        return false;
      })

      const expectVal = true;
      expect(match).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7400
     * @tc.name testFloat64ArrayFindLast074
     * @tc.desc Verify findLast single element Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const infinityValue: number = Infinity;
      const arr = new Float64Array([infinityValue]);
      const result = arr.findLast((value: number, index: int): boolean => {
        return value === infinityValue;
      })

      const expectVal = infinityValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7500
     * @tc.name testFloat64ArrayFindLast075
     * @tc.desc Verify findLast single element negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-0.0]);
      const result = arr.findLast((value: number): boolean => {
        return value === 0.0 && 1.0 / value < 0.0;
      })

      expect(1.0 / result < 0.0).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FINDLAST_7600
     * @tc.name testFloat64ArrayFindLast076
     * @tc.desc Verify findLast with mixed positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFindLast076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.findLast((value: number, index: int, array: Float64Array): boolean => {
        return value < 0.0;
      })

      const expectVal = negativeOne;
      expect(result).assertEqual(expectVal);
    })

  })
}
