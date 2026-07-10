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
import Utils, { everyPred003 } from '../Util.test';

export default function Float64ArrayEveryTest(): void {
  describe('Float64ArrayEveryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0100
     * @tc.name testFloat64ArrayEvery001
     * @tc.desc Verify every with one parameter is a valid invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result: boolean = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0200
     * @tc.name testFloat64ArrayEvery002
     * @tc.desc Verify every with two-parameter callback value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0300
     * @tc.name testFloat64ArrayEvery003
     * @tc.desc Verify every with named function as predicate extracted outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.every(everyPred003);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0400
     * @tc.name testFloat64ArrayEvery004
     * @tc.desc Verify every returns true when predicate always returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return true;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0500
     * @tc.name testFloat64ArrayEvery005
     * @tc.desc Verify every returns false when predicate always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.every((value: number, index: int): boolean => {
        return false;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0600
     * @tc.name testFloat64ArrayEvery006
     * @tc.desc Verify every returns false when predicate returns false for some elements based on index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return index < 2;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0700
     * @tc.name testFloat64ArrayEvery007
     * @tc.desc Verify every treats 0 as false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result: boolean = arr.every((value: number): boolean => {
        return value !== 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0800
     * @tc.name testFloat64ArrayEvery008
     * @tc.desc Verify every treats non-zero number as true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 1);
      const allPositive = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value !== 0.0;
      })

      const expectVal = true;
      expect(allPositive).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_0900
     * @tc.name testFloat64ArrayEvery009
     * @tc.desc Verify every on empty array returns true vacuously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.every((value: number, index: int): boolean => {
        return false;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1000
     * @tc.name testFloat64ArrayEvery010
     * @tc.desc Verify every on empty array does not execute callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let called: boolean = false;
      arr.every((value: number): boolean => {
        called = true;
        return true;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1100
     * @tc.name testFloat64ArrayEvery011
     * @tc.desc Verify every returns true when all elements are positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 1.0]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1200
     * @tc.name testFloat64ArrayEvery012
     * @tc.desc Verify every returns true when all elements are negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-0.5, -1.5, -0.25]);
      const result = arr.every((value: number, index: int): boolean => {
        return value < 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1300
     * @tc.name testFloat64ArrayEvery013
     * @tc.desc Verify every returns true when all elements are zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.every((value: number): boolean => {
        return value === 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1400
     * @tc.name testFloat64ArrayEvery014
     * @tc.desc Verify every returns true when all are Infinity greater than any finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([positiveInfinity, positiveInfinity]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0e+308;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1500
     * @tc.name testFloat64ArrayEvery015
     * @tc.desc Verify every on all NaN elements using NaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([nanValue, nanValue, nanValue]);
      const result = arr.every((value: number, index: int): boolean => {
        return value !== value;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1600
     * @tc.name testFloat64ArrayEvery016
     * @tc.desc Verify every returns true when all values equal 5.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointFive: number = 5.5;
      const arr = new Float64Array([fivePointFive, fivePointFive, fivePointFive]);
      const result = arr.every((value: number): boolean => {
        return value === 5.5;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1700
     * @tc.name testFloat64ArrayEvery017
     * @tc.desc Verify every returns false when negative value is mixed with -0.0 and 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-0.0, -128, zeroValue]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value >= -0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1800
     * @tc.name testFloat64ArrayEvery018
     * @tc.desc Verify every returns false when first element fails predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_1900
     * @tc.name testFloat64ArrayEvery019
     * @tc.desc Verify every returns false when middle element fails predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2000
     * @tc.name testFloat64ArrayEvery020
     * @tc.desc Verify every returns false when last element fails predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, -0.25]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2100
     * @tc.name testFloat64ArrayEvery021
     * @tc.desc Verify every returns false when multiple elements fail predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2200
     * @tc.name testFloat64ArrayEvery022
     * @tc.desc Verify every returns false with NaN element using regular comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(1.0, nanValue, 2.0);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2300
     * @tc.name testFloat64ArrayEvery023
     * @tc.desc Verify every short-circuits on first failing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      let callCount: int = 0;
      const result = arr.every((value: number): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2400
     * @tc.name testFloat64ArrayEvery024
     * @tc.desc Verify every short-circuits on second failing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      let callCount: int = 0;
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2500
     * @tc.name testFloat64ArrayEvery025
     * @tc.desc Verify every visits all elements when last element fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      let callCount: int = 0;
      const result = arr.every((value: number, index: int): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2600
     * @tc.name testFloat64ArrayEvery026
     * @tc.desc Verify every visits all elements when all pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      let callCount: int = 0;
      const result = arr.every((value: number): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
      const expectVal2 = fiveValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2700
     * @tc.name testFloat64ArrayEvery027
     * @tc.desc Verify every short-circuits on single failing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-32768]);
      let callCount: int = 0;
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2800
     * @tc.name testFloat64ArrayEvery028
     * @tc.desc Verify every short-circuits at middle of large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyoneValue: number = 51;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      arr.$_set(50, -1.0);
      let callCount: int = 0;
      const result = arr.every((value: number, index: int): boolean => {
        callCount = callCount + 1;
        return value >= 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
      const expectVal2 = fiftyoneValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2900
     * @tc.name testFloat64ArrayEvery029
     * @tc.desc Verify every callback throws RangeError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.every((value: number): boolean => {
          throw new RangeError("test error");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3000
     * @tc.name testFloat64ArrayEvery030
     * @tc.desc Verify every callback throws TypeError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          throw new TypeError("test error");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3100
     * @tc.name testFloat64ArrayEvery031
     * @tc.desc Verify every callback throws Error and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.every((value: number, index: int): boolean => {
          throw new Error("test error");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3200
     * @tc.name testFloat64ArrayEvery032
     * @tc.desc Verify every callback throws Error on first element and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          if (index === 0) {
            throw new Error("first");
          }
          return true;
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3300
     * @tc.name testFloat64ArrayEvery033
     * @tc.desc Verify every callback throws Error on second element and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          if (index === 1) {
            throw new Error("second");
          }
          return true;
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3400
     * @tc.name testFloat64ArrayEvery034
     * @tc.desc Verify every callback throws Error on last element and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          if (index === 2) {
            throw new Error("third");
          }
          return true;
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3500
     * @tc.name testFloat64ArrayEvery035
     * @tc.desc Verify every on empty array does not execute callback that throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let threw: boolean = false;
      try {
        arr.every((value: number): boolean => {
          throw new Error("should not reach");
        })

      } catch (e) {
        threw = true;
      }
      const expectVal = false;
      expect(threw).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3600
     * @tc.name testFloat64ArrayEvery036
     * @tc.desc Verify every short-circuits before reaching element that would throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let callCount: int = 0;
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          callCount = callCount + 1;
          if (value > 0.0) {
            throw new Error("should not throw");
          }
          return false;
        })

      } catch (e) {
        // should not reach
      }
      const expectVal = oneValue;
      expect(callCount).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3700
     * @tc.name testFloat64ArrayEvery037
     * @tc.desc Verify every on single element that passes predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([42.0]);
      const result = arr.every((value: number, index: int): boolean => {
        return value === 42.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3800
     * @tc.name testFloat64ArrayEvery038
     * @tc.desc Verify every on single element that fails predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_3900
     * @tc.name testFloat64ArrayEvery039
     * @tc.desc Verify every on single NaN element using NaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value !== value;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4000
     * @tc.name testFloat64ArrayEvery040
     * @tc.desc Verify every on single Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([positiveInfinity]);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 1.0e+308;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4100
     * @tc.name testFloat64ArrayEvery041
     * @tc.desc Verify every on single 0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.0]);
      const result = arr.every((value: number): boolean => {
        return value === 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4200
     * @tc.name testFloat64ArrayEvery042
     * @tc.desc Verify every on two elements both passing returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4300
     * @tc.name testFloat64ArrayEvery043
     * @tc.desc Verify every on two elements one failing returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, -1.0]);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4400
     * @tc.name testFloat64ArrayEvery044
     * @tc.desc Verify every on 100 elements all passing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i + oneValue);
      }
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4500
     * @tc.name testFloat64ArrayEvery045
     * @tc.desc Verify every on 100 elements last one failing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i + oneValue);
      }
      arr.$_set(99, -1.0);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4600
     * @tc.name testFloat64ArrayEvery046
     * @tc.desc Verify every on 1000 elements middle one failing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        arr.$_set(i, i + oneValue);
      }
      arr.$_set(500, -1.0);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4700
     * @tc.name testFloat64ArrayEvery047
     * @tc.desc Verify every returns true for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.every((value: number): boolean => {
        return false;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4800
     * @tc.name testFloat64ArrayEvery048
     * @tc.desc Verify every does not modify original array content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const actVal1 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = arr.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal2).assertEqual(expectVal2);
      const actVal3 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal3).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_4900
     * @tc.name testFloat64ArrayEvery049
     * @tc.desc Verify every multiple calls produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const r1 = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const r2 = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = r2;
      expect(r1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5000
     * @tc.name testFloat64ArrayEvery050
     * @tc.desc Verify every callback throws SyntaxError and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          throw new SyntaxError("syntax");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("SyntaxError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5100
     * @tc.name testFloat64ArrayEvery051
     * @tc.desc Verify every works with thisArg bound using arrow function capturing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const threshold: double = 0.0;
      const result = arr.every((value: number, index: int): boolean => {
        return value > threshold;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5200
     * @tc.name testFloat64ArrayEvery052
     * @tc.desc Verify every callback receives value with floating point precision 0.1 plus 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1 + 0.2);
      const result = arr.every((value: number): boolean => {
        return value !== 0.3;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5300
     * @tc.name testFloat64ArrayEvery053
     * @tc.desc Verify every index reaches last element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninetynineValue: number = 99;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      let lastIndex: int = -1;
      arr.every((value: number, index: int, array: Float64Array): boolean => {
        lastIndex = index;
        return true;
      })

      const expectVal = ninetynineValue;
      expect(lastIndex).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5400
     * @tc.name testFloat64ArrayEvery054
     * @tc.desc Verify every callback array parameter is Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      let isFloat64: boolean = false;
      arr.every((value: number, index: int, array: Float64Array): boolean => {
        let obj: Object = array as Object;
        if (obj instanceof Float64Array) {
          isFloat64 = true;
        }
        return true;
      })

      const expectVal = true;
      expect(isFloat64).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5500
     * @tc.name testFloat64ArrayEvery055
     * @tc.desc Verify every on empty array returns boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result: boolean = arr.every((value: number, index: int): boolean => {
        return false;
      })

      let isBool: boolean = false;
      if (result === true || result === false) {
        isBool = true;
      }
      const expectVal = true;
      expect(isBool).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5600
     * @tc.name testFloat64ArrayEvery056
     * @tc.desc Verify every callback throws Error for string-error path and propagates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.every((value: number): boolean => {
          throw new Error("string error");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5700
     * @tc.name testFloat64ArrayEvery057
     * @tc.desc Verify every throws Error when predicate invocation fails due to undefined reference handled via try catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      try {
        arr.every((value: number, index: int, array: Float64Array): boolean => {
          throw new ReferenceError("undefined var");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("ReferenceError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5800
     * @tc.name testFloat64ArrayEvery058
     * @tc.desc Verify every callback throws EvalError propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      try {
        arr.every((value: number, index: int): boolean => {
          throw new EvalError("eval error");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("EvalError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_5900
     * @tc.name testFloat64ArrayEvery059
     * @tc.desc Verify every callback throws URIError propagation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      try {
        arr.every((value: number): boolean => {
          throw new URIError("uri error");
        })

        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("URIError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6000
     * @tc.name testFloat64ArrayEvery060
     * @tc.desc Verify every treats negative zero and positive zero as equal in comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value === 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6100
     * @tc.name testFloat64ArrayEvery061
     * @tc.desc Verify every with single element where element is negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([negativeInfinity]);
      const result = arr.every((value: number, index: int): boolean => {
        return value < 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6200
     * @tc.name testFloat64ArrayEvery062
     * @tc.desc Verify every with two elements where both are MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(numberMaxValue, numberMaxValue);
      const result = arr.every((value: number): boolean => {
        return value > 1.0e+308;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6300
     * @tc.name testFloat64ArrayEvery063
     * @tc.desc Verify every short-circuits correctly with negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = Float64Array.of(-2147483648, -1, 0);
      let callCount: int = 0;
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        callCount = callCount + 1;
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(callCount).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6400
     * @tc.name testFloat64ArrayEvery064
     * @tc.desc Verify every returns correct result when predicate compares with Infinity threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.every((value: number, index: int): boolean => {
        return value === Infinity;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6500
     * @tc.name testFloat64ArrayEvery065
     * @tc.desc Verify every returns true when all elements satisfy condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const actVal4 = values.every((value) => value > 0);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6600
     * @tc.name testFloat64ArrayEvery066
     * @tc.desc Verify every returns false when any element does not satisfy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const actVal5 = values.every((value) => value > 4);
      const expectVal = false;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6700
     * @tc.name testFloat64ArrayEvery067
     * @tc.desc Verify every with single element satisfying condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([2147483648]);
      const actVal6 = values.every((value) => value > 0);
      const expectVal = true;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6800
     * @tc.name testFloat64ArrayEvery068
     * @tc.desc Verify every with single element not satisfying condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1);
      const actVal7 = values.every((value) => value > 10);
      const expectVal = false;
      expect(actVal7).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_6900
     * @tc.name testFloat64ArrayEvery069
     * @tc.desc Verify every with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const values = new Float64Array([0.5, nanValue, 1.5]);
      const actVal8 = values.every((value) => value === value);
      const expectVal = false;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7000
     * @tc.name testFloat64ArrayEvery070
     * @tc.desc Verify every with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = new Float64Array([positiveInfinity, 1.0]);
      const actVal9 = values.every((value) => value > 0);
      const expectVal = true;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7100
     * @tc.name testFloat64ArrayEvery071
     * @tc.desc Verify every returns immediately after finding non-matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = new Float64Array([-2147483648, -1, 0]);
      let count = 0;
      values.every((value) => {
        count++;
        return value < 3;
      })

      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7200
     * @tc.name testFloat64ArrayEvery072
     * @tc.desc Verify every with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      const r = arr.every((v: number): boolean => v > 0x00);
      const expectVal = true;
      expect(r).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7300
     * @tc.name testFloat64ArrayEvery073
     * @tc.desc Verify every with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      const r = arr.every((v: number): boolean => v > 0b00000000);
      const expectVal = true;
      expect(r).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7400
     * @tc.name testFloat64ArrayEvery074
     * @tc.desc Verify every with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.every((value: number): boolean => {
        return Number.isNaN(value) || value > 0.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7500
     * @tc.name testFloat64ArrayEvery075
     * @tc.desc Verify every with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7600
     * @tc.name testFloat64ArrayEvery076
     * @tc.desc Verify every with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7700
     * @tc.name testFloat64ArrayEvery077
     * @tc.desc Verify every with scientific notation 1.0e-308 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0e-308, 2.0e-308]);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7800
     * @tc.name testFloat64ArrayEvery078
     * @tc.desc Verify every with scientific notation 1.0e+308 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.5e+308, 1.7e+308);
      const result = arr.every((value: number): boolean => {
        return value > 1.0e+307;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_7900
     * @tc.name testFloat64ArrayEvery079
     * @tc.desc Verify every returns true when all elements are Infinity and satisfy > 1e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = new Float64Array([positiveInfinity, positiveInfinity]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0e+308;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8000
     * @tc.name testFloat64ArrayEvery080
     * @tc.desc Verify every returns true when all elements are NaN and pass Number.isNaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const arr = new Float64Array([nanValue, nanValue, nanValue]);
      const result = arr.every((value: number, index: int): boolean => {
        return Number.isNaN(value);
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8100
     * @tc.name testFloat64ArrayEvery081
     * @tc.desc Verify every returns true when all elements are equal to the same value 5.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointfive: number = 5.5;
      const arr = Float64Array.of(fivePointfive, fivePointfive, fivePointfive);
      const result = arr.every((value: number): boolean => {
        return value === 5.5;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8200
     * @tc.name testFloat64ArrayEvery082
     * @tc.desc Verify every returns true with mixed -0.0 and 0.0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-0.0, 0.0, -0.0]);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value >= -0.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8300
     * @tc.name testFloat64ArrayEvery083
     * @tc.desc Verify every callback array parameter references the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      let sameRef: boolean = false;
      arr.every((value: number, index: int, array: Float64Array): boolean => {
        if ((array as Object) === (arr as Object)) {
          sameRef = true;
        }
        return true;
      })
      const expectVal = true;
      expect(sameRef).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8400
     * @tc.name testFloat64ArrayEvery084
     * @tc.desc Verify every callback array parameter length matches original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      let matchLen: boolean = false;
      arr.every((value: number, index: int, array: Float64Array): boolean => {
        if (array.length === arr.length) {
          matchLen = true;
        }
        return true;
      })
      const expectVal = true;
      expect(matchLen).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8500
     * @tc.name testFloat64ArrayEvery085
     * @tc.desc Verify every callback can modify original array through array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.every((value: number, index: int, array: Float64Array): boolean => {
        array.$_set(0, fillValue99);
        return false;
      })
      const actVal10 = arr.$_get(0);
      const expectVal = fillValue99;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_8600
     * @tc.name testFloat64ArrayEvery086
     * @tc.desc Verify every on single NaN element passes Number.isNaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const arr = Float64Array.of(nanValue);
      const result = arr.every((value: number): boolean => {
        return Number.isNaN(value);
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    });

  })
}
