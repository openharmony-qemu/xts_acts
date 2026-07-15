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

function keepPositive(val: number, index: int, array: Float32Array): boolean {
  return val > 0;
}

export default function Float32ArrayFilter1Test(): void {
  describe('Float32ArrayFilter1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0100
     * @tc.name testFloat32ArrayFilterONE001
     * @tc.desc Verify filter passes a fn single argument (correct arity) and returns the filtering result normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > 1.5;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0200
     * @tc.name testFloat32ArrayFilterONE002
     * @tc.desc Verify filter is chained twice, the two input streams are chained correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > 1.0;
      }).filter((val: number, index: int, array: Float32Array) => {
        return val < 4.0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0300
     * @tc.name testFloat32ArrayFilterONE003
     * @tc.desc Verify fn is an arrow function returning true, all elements are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return true;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0400
     * @tc.name testFloat32ArrayFilterONE004
     * @tc.desc Verify fn is an arrow function returning false, all elements are excluded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return false;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0500
     * @tc.name testFloat32ArrayFilterONE005
     * @tc.desc Verify fn is a plain function expression, filtering by exact value match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const fn = (val: number, index: int, array: Float32Array): boolean => {
        return val === 0b1010;
      };
      const result = arr.filter(fn);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0600
     * @tc.name testFloat32ArrayFilterONE006
     * @tc.desc Verify fn is a top-level named function reference, filtering positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, 2.0, -3.0]);
      const result = arr.filter(keepPositive);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0700
     * @tc.name testFloat32ArrayFilterONE007
     * @tc.desc Verify fn predicate val > threshold, filtering by value magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 9.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > 4.0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0800
     * @tc.name testFloat32ArrayFilterONE008
     * @tc.desc Verify fn predicate val === specified value, matching duplicate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val === 2.0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_0900
     * @tc.name testFloat32ArrayFilterONE009
     * @tc.desc Verify fn predicate index === 0, keeping only the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return index === 0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1000
     * @tc.name testFloat32ArrayFilterONE010
     * @tc.desc Verify fn predicate index % 2 === 0, keeping even indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return index % 2 === 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1100
     * @tc.name testFloat32ArrayFilterONE011
     * @tc.desc Verify fn predicate Number.isNaN(val), keeping NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 3.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return Number.isNaN(val);
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1200
     * @tc.name testFloat32ArrayFilterONE012
     * @tc.desc Verify fn predicate val !== val (NaN self-check), keeping all NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 2.0, NaN]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val !== val;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1300
     * @tc.name testFloat32ArrayFilterONE013
     * @tc.desc Verify fn reads the external state threshold variable as the filtering threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const threshold: number = 10.0;
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > threshold;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1400
     * @tc.name testFloat32ArrayFilterONE014
     * @tc.desc Verify fn modifies an external counter, side effect accumulates the call count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let count: number = 0;
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        count = count + 1;
        return val > 2.0;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1500
     * @tc.name testFloat32ArrayFilterONE015
     * @tc.desc Verify fn predicate val > 0, mixed positive/zero/negative values keep only positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2.0, 0.0, 3.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > 0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1600
     * @tc.name testFloat32ArrayFilterONE016
     * @tc.desc Verify fn predicate val < 0, keeping all negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2.0, 0.0, -3.0, 4.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val < 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1700
     * @tc.name testFloat32ArrayFilterONE017
     * @tc.desc Verify fn predicate Math.abs(val) === Infinity, keeping infinities
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, 1.0, -Infinity]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return Math.abs(val) === Infinity;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1800
     * @tc.name testFloat32ArrayFilterONE018
     * @tc.desc Verify fn predicate val === 0, both positive zero and negative zero match (0 === -0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.0, -0.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val === 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_1900
     * @tc.name testFloat32ArrayFilterONE019
     * @tc.desc Verify val = Float32.MAX (3.4028234663852886e+38) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2000
     * @tc.name testFloat32ArrayFilterONE020
     * @tc.desc Verify val = Float32.MIN_NORMAL (1.1754943508222875e-38) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2100
     * @tc.name testFloat32ArrayFilterONE021
     * @tc.desc Verify val = Float32.MIN_VALUE (1.401298464324817e-45) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2200
     * @tc.name testFloat32ArrayFilterONE022
     * @tc.desc Verify val = NaN is correctly passed to the callback, asserted as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2300
     * @tc.name testFloat32ArrayFilterONE023
     * @tc.desc Verify val = +Infinity is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2400
     * @tc.name testFloat32ArrayFilterONE024
     * @tc.desc Verify val = -Infinity is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2500
     * @tc.name testFloat32ArrayFilterONE025
     * @tc.desc Verify val = +0 is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      let captured: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2600
     * @tc.name testFloat32ArrayFilterONE026
     * @tc.desc Verify val = -0 is correctly passed to the callback, distinguishing negative zero via reciprocal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      let captured: number = 1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(1 / captured).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2700
     * @tc.name testFloat32ArrayFilterONE027
     * @tc.desc Verify val = -Float32.MAX (-3.4028234663852886e+38) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2800
     * @tc.name testFloat32ArrayFilterONE028
     * @tc.desc Verify val = 0.1 (float32 precision truncation value) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_2900
     * @tc.name testFloat32ArrayFilterONE029
     * @tc.desc Verify val = 0.2 (float32 precision truncation value) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3000
     * @tc.name testFloat32ArrayFilterONE030
     * @tc.desc Verify val = 0.3 (float32 precision truncation value) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3100
     * @tc.name testFloat32ArrayFilterONE031
     * @tc.desc Verify val = 1.1 (precision truncation value) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3200
     * @tc.name testFloat32ArrayFilterONE032
     * @tc.desc Verify val = 1.0000001 (precision truncation value) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3300
     * @tc.name testFloat32ArrayFilterONE033
     * @tc.desc Verify val = 16777216 (2^24 maximum exact integer) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3400
     * @tc.name testFloat32ArrayFilterONE034
     * @tc.desc Verify val = 16777217 (2^24+1) is truncated to 16777216 and passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3500
     * @tc.name testFloat32ArrayFilterONE035
     * @tc.desc Verify val = 16777215 (2^24-1 exactly representable) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777215]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3600
     * @tc.name testFloat32ArrayFilterONE036
     * @tc.desc Verify val = 1.0e40 overflows to +Infinity and is passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3700
     * @tc.name testFloat32ArrayFilterONE037
     * @tc.desc Verify val = -1.0e40 overflows to -Infinity and is passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3800
     * @tc.name testFloat32ArrayFilterONE038
     * @tc.desc Verify val = 1.0e-46 underflows to 0 and is passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      let captured: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_3900
     * @tc.name testFloat32ArrayFilterONE039
     * @tc.desc Verify val = -1 is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4000
     * @tc.name testFloat32ArrayFilterONE040
     * @tc.desc Verify val = 1 is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4100
     * @tc.name testFloat32ArrayFilterONE041
     * @tc.desc Verify val = 2147483647 (int boundary) is truncated to 2147483648 and passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4200
     * @tc.name testFloat32ArrayFilterONE042
     * @tc.desc Verify val = -2147483648 (int negative boundary, power of 2 exactly representable) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4300
     * @tc.name testFloat32ArrayFilterONE043
     * @tc.desc Verify val = 1.0e3 (scientific notation) = 1000 is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4400
     * @tc.name testFloat32ArrayFilterONE044
     * @tc.desc Verify val = 9.0 (hexadecimal float) = 9.125 is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4500
     * @tc.name testFloat32ArrayFilterONE045
     * @tc.desc Verify val = 16 (decimal) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4600
     * @tc.name testFloat32ArrayFilterONE046
     * @tc.desc Verify val = 255 (decimal) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([255]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4700
     * @tc.name testFloat32ArrayFilterONE047
     * @tc.desc Verify val = 1.0e-38 (subnormal near min normal boundary) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-38]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4800
     * @tc.name testFloat32ArrayFilterONE048
     * @tc.desc Verify val = Math.PI (irrational precision truncation) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Math.PI]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_4900
     * @tc.name testFloat32ArrayFilterONE049
     * @tc.desc Verify val = Math.E (irrational precision truncation) passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Math.E]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5000
     * @tc.name testFloat32ArrayFilterONE050
     * @tc.desc Verify val = 1.5 (exactly representable in binary) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5100
     * @tc.name testFloat32ArrayFilterONE051
     * @tc.desc Verify val = -0.5 (exactly representable in binary) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.5]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5200
     * @tc.name testFloat32ArrayFilterONE052
     * @tc.desc Verify val = 65536 (2^16) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([65536]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5300
     * @tc.name testFloat32ArrayFilterONE053
     * @tc.desc Verify val = 4294967296 (2^32 power exactly representable) is correctly passed to the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4294967296]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5400
     * @tc.name testFloat32ArrayFilterONE054
     * @tc.desc Verify val = Number.MAX_SAFE_INTEGER (9007199254740991) is heavily truncated by float32, passed to the callback equals the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9007199254740991]);
      let captured: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = val;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5500
     * @tc.name testFloat32ArrayFilterONE055
     * @tc.desc Verify single-element array index = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      let captured: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = index;
        return false;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5600
     * @tc.name testFloat32ArrayFilterONE056
     * @tc.desc Verify multi-element array index sequence last value is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const captured: number[] = [];
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured.push(index);
        return false;
      });
      expect(captured[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5700
     * @tc.name testFloat32ArrayFilterONE057
     * @tc.desc Verify last element index = length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let captured: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = index;
        return false;
      });
      expect(captured).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5800
     * @tc.name testFloat32ArrayFilterONE058
     * @tc.desc Verify large array (100 elements) last index = 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      let captured: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured = index;
        return false;
      });
      expect(captured).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_5900
     * @tc.name testFloat32ArrayFilterONE059
     * @tc.desc Verify first callback index = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let firstIndex: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        if (firstIndex === -1) {
          firstIndex = index;
        }
        return false;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6000
     * @tc.name testFloat32ArrayFilterONE060
     * @tc.desc Verify index sequence first item is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const captured: number[] = [];
      arr.filter((val: number, index: int, array: Float32Array) => {
        captured.push(index);
        return false;
      });
      expect(captured[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6100
     * @tc.name testFloat32ArrayFilterONE061
     * @tc.desc Verify array parameter length matches the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedLen: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6200
     * @tc.name testFloat32ArrayFilterONE062
     * @tc.desc Verify array parameter first element is readable and equals the original array first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      let capturedFirst: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        capturedFirst = array[0];
        return false;
      });
      expect(capturedFirst).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6300
     * @tc.name testFloat32ArrayFilterONE063
     * @tc.desc Verify array parameter byteLength equals element count x 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let capturedBytes: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        capturedBytes = array.byteLength;
        return false;
      });
      expect(capturedBytes).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6400
     * @tc.name testFloat32ArrayFilterONE064
     * @tc.desc Verify array parameter length is also correct for large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(50);
      let capturedLen: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6500
     * @tc.name testFloat32ArrayFilterONE065
     * @tc.desc Verify array parameter is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let isF32 = false;
      arr.filter((val: number, index: int, array: Float32Array) => {
        isF32 = array instanceof Float32Array;
        return false;
      });
      expect(isF32).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6600
     * @tc.name testFloat32ArrayFilterONE066
     * @tc.desc Verify array parameter last element is readable and equals the original array last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 9.0]);
      let capturedLast: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        capturedLast = array[array.length - 1];
        return false;
      });
      expect(capturedLast).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6700
     * @tc.name testFloat32ArrayFilterONE067
     * @tc.desc Verify array parameter byteOffset equals the original array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedOffset: number = -1;
      arr.filter((val: number, index: int, array: Float32Array) => {
        capturedOffset = array.byteOffset;
        return false;
      });
      expect(capturedOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6800
     * @tc.name testFloat32ArrayFilterONE068
     * @tc.desc Verify empty array callback executes 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      let called: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        called = called + 1;
        return true;
      });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_6900
     * @tc.name testFloat32ArrayFilterONE069
     * @tc.desc Verify single-element array callback executes 1 time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      let called: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        called = called + 1;
        return true;
      });
      expect(called).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7000
     * @tc.name testFloat32ArrayFilterONE070
     * @tc.desc Verify all-same-value array all match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val === 5.0;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7100
     * @tc.name testFloat32ArrayFilterONE071
     * @tc.desc Verify all elements satisfy the predicate (always-true condition) and all are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > -2;
      });
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7200
     * @tc.name testFloat32ArrayFilterONE072
     * @tc.desc Verify all elements do not satisfy the predicate, all are excluded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > 100;
      });
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7300
     * @tc.name testFloat32ArrayFilterONE073
     * @tc.desc Verify alternating keep/exclude (odd indices)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return index % 2 === 1;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7400
     * @tc.name testFloat32ArrayFilterONE074
     * @tc.desc Verify large array of 100 elements keeps only the first 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return index < 10;
      });
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7500
     * @tc.name testFloat32ArrayFilterONE075
     * @tc.desc Verify mixed positive/negative values keep only negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, 2.0, -3.0, 4.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val < 0;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7600
     * @tc.name testFloat32ArrayFilterONE076
     * @tc.desc Verify mixed special values NaN/Infinity/0 keep only finite values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, 0, -Infinity]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return Number.isFinite(val);
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7700
     * @tc.name testFloat32ArrayFilterONE077
     * @tc.desc Verify mixed radix literal collection filtered by value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0x10, 0o17, 0b1010]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val > 12;
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7800
     * @tc.name testFloat32ArrayFilterONE078
     * @tc.desc Verify only the middle element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 1.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val === 5.0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_7900
     * @tc.name testFloat32ArrayFilterONE079
     * @tc.desc Verify first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 1.0, 1.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val === 9.0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8000
     * @tc.name testFloat32ArrayFilterONE080
     * @tc.desc Verify last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0, 9.0]);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        return val === 9.0;
      });
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8100
     * @tc.name testFloat32ArrayFilterONE081
     * @tc.desc Verify fn throws RangeError at the first element, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          throw new RangeError('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8200
     * @tc.name testFloat32ArrayFilterONE082
     * @tc.desc Verify fn throws TypeError at the middle element, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          if (index === 1) {
            throw new TypeError('mid');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8300
     * @tc.name testFloat32ArrayFilterONE083
     * @tc.desc Verify fn throws RangeError at the last element, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          if (index === 2) {
            throw new RangeError('last');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8400
     * @tc.name testFloat32ArrayFilterONE084
     * @tc.desc Verify fn throws Error and the message is preserved, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          throw new Error('boom-msg');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom-msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8500
     * @tc.name testFloat32ArrayFilterONE085
     * @tc.desc Verify empty array and fn would throw, the callback is not executed so no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      let called: number = 0;
      arr.filter((val: number, index: int, array: Float32Array) => {
        called = called + 1;
        throw new Error('x');
      });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8600
     * @tc.name testFloat32ArrayFilterONE086
     * @tc.desc Verify fn throws RangeError when val is NaN, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          if (Number.isNaN(val)) {
            throw new RangeError('nan');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8700
     * @tc.name testFloat32ArrayFilterONE087
     * @tc.desc Verify fn throws SyntaxError, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          throw new SyntaxError('syn');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8800
     * @tc.name testFloat32ArrayFilterONE088
     * @tc.desc Verify fn reads external state then exceeds the threshold and throws RangeError, propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const limit: number = 2;
      try {
        arr.filter((val: number, index: int, array: Float32Array) => {
          if (val > limit) {
            throw new RangeError('over');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERONE_8900
     * @tc.name testFloat32ArrayFilterONE089
     * @tc.desc Verify modifying a later element in the predicate affects whether that later value is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.filter((val: number, index: int, array: Float32Array) => {
        if (index === 0) {
          array.$_set(2, 9.0);
        }
        return val === 9.0;
      });
      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(9);
    });

  });
}
