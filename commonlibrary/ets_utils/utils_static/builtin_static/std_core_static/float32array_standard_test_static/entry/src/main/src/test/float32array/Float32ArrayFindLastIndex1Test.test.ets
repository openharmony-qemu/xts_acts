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
import Utils from '../Util.test';

function isLarge(value: number, index: int, array: Float32Array): boolean {
  return value > 5.0;
}

function doubleVal(x: number): number {
  return x * 2.0;
}

export default function Float32ArrayFindLastIndex1Test(): void {
  describe('Float32ArrayFindLastIndex1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0100
     * @tc.name testFloat32ArrayFindLastIndexONE001
     * @tc.desc Verify predicate callback declaring 0 parameters can still match the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex(() => true)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0200
     * @tc.name testFloat32ArrayFindLastIndexONE002
     * @tc.desc Verify predicate callback declaring 1 parameter value matches by value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number) => value === -1.0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0300
     * @tc.name testFloat32ArrayFindLastIndexONE003
     * @tc.desc Verify predicate callback declaring 2 parameters value and index matches by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      expect(arr.findLastIndex((value: number, index: int) => index === 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0400
     * @tc.name testFloat32ArrayFindLastIndexONE004
     * @tc.desc Verify predicate callback declaring the full 3 parameters value/index/array for combined judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => array.length === 3 && value === 0b1010))
        .assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0500
     * @tc.name testFloat32ArrayFindLastIndexONE005
     * @tc.desc Verify predicate declares 3 parameters but only uses the value dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return value === -1.0;
      });
      expect(captured).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0600
     * @tc.name testFloat32ArrayFindLastIndexONE006
     * @tc.desc Verify predicate declares 3 parameters but only uses the index dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let capturedIdx = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedIdx = index;
        return index === 3;
      });
      expect(capturedIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0700
     * @tc.name testFloat32ArrayFindLastIndexONE007
     * @tc.desc Verify predicate declares 3 parameters but only uses the array dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedLen = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0800
     * @tc.name testFloat32ArrayFindLastIndexONE008
     * @tc.desc Verify predicate matches the first position by index===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => index === 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_0900
     * @tc.name testFloat32ArrayFindLastIndexONE009
     * @tc.desc Verify value parameter receives Float32Array.MAX the largest finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1000
     * @tc.name testFloat32ArrayFindLastIndexONE010
     * @tc.desc Verify value parameter receives Float32Array.MIN_NORMAL the smallest positive normalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1100
     * @tc.name testFloat32ArrayFindLastIndexONE011
     * @tc.desc Verify value parameter receives Float32Array.MIN_VALUE the smallest positive denormalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1200
     * @tc.name testFloat32ArrayFindLastIndexONE012
     * @tc.desc Verify value parameter receives the special value NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1300
     * @tc.name testFloat32ArrayFindLastIndexONE013
     * @tc.desc Verify value parameter receives positive infinity Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1400
     * @tc.name testFloat32ArrayFindLastIndexONE014
     * @tc.desc Verify value parameter receives negative infinity -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1500
     * @tc.name testFloat32ArrayFindLastIndexONE015
     * @tc.desc Verify value parameter receives positive zero +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      let captured = -1.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1600
     * @tc.name testFloat32ArrayFindLastIndexONE016
     * @tc.desc Verify value parameter receives negative zero -0 and distinguishes the sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      let captured = 1.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(1.0 / captured).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1700
     * @tc.name testFloat32ArrayFindLastIndexONE017
     * @tc.desc Verify value parameter receives the smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1800
     * @tc.name testFloat32ArrayFindLastIndexONE018
     * @tc.desc Verify value parameter receives 0.1 a typical precision-loss value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_1900
     * @tc.name testFloat32ArrayFindLastIndexONE019
     * @tc.desc Verify value parameter receives 0.2 a typical precision-loss value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2000
     * @tc.name testFloat32ArrayFindLastIndexONE020
     * @tc.desc Verify value parameter receives 0.3 a typical precision-loss value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2100
     * @tc.name testFloat32ArrayFindLastIndexONE021
     * @tc.desc Verify value parameter receives 1.1 a precision-truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2200
     * @tc.name testFloat32ArrayFindLastIndexONE022
     * @tc.desc Verify value parameter receives 1.0000001 a precision-truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2300
     * @tc.name testFloat32ArrayFindLastIndexONE023
     * @tc.desc Verify value parameter receives 2^24 the largest exact integer 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2400
     * @tc.name testFloat32ArrayFindLastIndexONE024
     * @tc.desc Verify value parameter receives the value 2^24+1 truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2500
     * @tc.name testFloat32ArrayFindLastIndexONE025
     * @tc.desc Verify value parameter receives 1.0e40 which overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2600
     * @tc.name testFloat32ArrayFindLastIndexONE026
     * @tc.desc Verify value parameter receives -1.0e40 which overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2700
     * @tc.name testFloat32ArrayFindLastIndexONE027
     * @tc.desc Verify value parameter receives 1.0e-46 which underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      let captured = -1.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2800
     * @tc.name testFloat32ArrayFindLastIndexONE028
     * @tc.desc Verify value parameter receives the integer -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_2900
     * @tc.name testFloat32ArrayFindLastIndexONE029
     * @tc.desc Verify value parameter receives the int maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3000
     * @tc.name testFloat32ArrayFindLastIndexONE030
     * @tc.desc Verify value parameter receives the int minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3100
     * @tc.name testFloat32ArrayFindLastIndexONE031
     * @tc.desc Verify value parameter receives scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3200
     * @tc.name testFloat32ArrayFindLastIndexONE032
     * @tc.desc Verify value parameter receives hexadecimal float 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3300
     * @tc.name testFloat32ArrayFindLastIndexONE033
     * @tc.desc Verify value parameter receives hexadecimal float 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3400
     * @tc.name testFloat32ArrayFindLastIndexONE034
     * @tc.desc Verify value parameter receives the octal literal 0o17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o17]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3500
     * @tc.name testFloat32ArrayFindLastIndexONE035
     * @tc.desc Verify value parameter receives the binary literal 0b101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b101]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3600
     * @tc.name testFloat32ArrayFindLastIndexONE036
     * @tc.desc Verify value parameter receives the large scientific notation number 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e10]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3700
     * @tc.name testFloat32ArrayFindLastIndexONE037
     * @tc.desc Verify value parameter receives the small negative scientific notation -1e-10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1e-10]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3800
     * @tc.name testFloat32ArrayFindLastIndexONE038
     * @tc.desc Verify value parameter receives the ordinary decimal 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([123.456]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_3900
     * @tc.name testFloat32ArrayFindLastIndexONE039
     * @tc.desc Verify value parameter receives the negative decimal -999.999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-999.999]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4000
     * @tc.name testFloat32ArrayFindLastIndexONE040
     * @tc.desc Verify value parameter receives the power of two 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4100
     * @tc.name testFloat32ArrayFindLastIndexONE041
     * @tc.desc Verify value parameter receives the power of two 0.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.25]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4200
     * @tc.name testFloat32ArrayFindLastIndexONE042
     * @tc.desc Verify value parameter receives the power of two 0.0625
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0625]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(0.0625);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4300
     * @tc.name testFloat32ArrayFindLastIndexONE043
     * @tc.desc Verify value parameter receives 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4400
     * @tc.name testFloat32ArrayFindLastIndexONE044
     * @tc.desc Verify value parameter receives -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4500
     * @tc.name testFloat32ArrayFindLastIndexONE045
     * @tc.desc Verify value parameter receives 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4600
     * @tc.name testFloat32ArrayFindLastIndexONE046
     * @tc.desc Verify value parameter receives 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4700
     * @tc.name testFloat32ArrayFindLastIndexONE047
     * @tc.desc Verify value parameter receives 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4800
     * @tc.name testFloat32ArrayFindLastIndexONE048
     * @tc.desc Verify value parameter receives scientific notation 1e-7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e-7]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_4900
     * @tc.name testFloat32ArrayFindLastIndexONE049
     * @tc.desc Verify value parameter receives scientific notation 1e7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e7]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(10000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5000
     * @tc.name testFloat32ArrayFindLastIndexONE050
     * @tc.desc Verify value parameter receives scientific notation 1e-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e-8]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5100
     * @tc.name testFloat32ArrayFindLastIndexONE051
     * @tc.desc Verify value parameter receives 1234567 an exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234567.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(1234567);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5200
     * @tc.name testFloat32ArrayFindLastIndexONE052
     * @tc.desc Verify value parameter receives 123456789 a beyond-precision integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([123456789.0]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5300
     * @tc.name testFloat32ArrayFindLastIndexONE053
     * @tc.desc Verify value parameter receives the super-large integer 9007199254740993
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9007199254740993]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5400
     * @tc.name testFloat32ArrayFindLastIndexONE054
     * @tc.desc Verify value parameter receives the 2^32 power 4294967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4294967296]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5500
     * @tc.name testFloat32ArrayFindLastIndexONE055
     * @tc.desc Verify value parameter receives the 2^31 power 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483648]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5600
     * @tc.name testFloat32ArrayFindLastIndexONE056
     * @tc.desc Verify value parameter receives the decimal literal 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100]);
      let captured = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = value;
        return false;
      });
      expect(captured).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5700
     * @tc.name testFloat32ArrayFindLastIndexONE057
     * @tc.desc Verify value parameter receives the MAX value at index 2 in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.4028234663852886e+38]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 2) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(2);
      expect(captured).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5800
     * @tc.name testFloat32ArrayFindLastIndexONE058
     * @tc.desc Verify value parameter receives NaN at index 1 in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 2.0]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (value !== value) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(1);
      expect(captured).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_5900
     * @tc.name testFloat32ArrayFindLastIndexONE059
     * @tc.desc Verify value parameter receives Infinity at index 2 in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, Infinity]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (value === Infinity) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(2);
      expect(captured).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6000
     * @tc.name testFloat32ArrayFindLastIndexONE060
     * @tc.desc Verify value parameter receives 0.1 at index 1 in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.1, 2.0]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 1) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(1);
      expect(captured).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6100
     * @tc.name testFloat32ArrayFindLastIndexONE061
     * @tc.desc Verify value parameter matches 16777216 by value in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 16777216, 2.0]);
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => value === 16777216);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6200
     * @tc.name testFloat32ArrayFindLastIndexONE062
     * @tc.desc Verify value parameter receives -0 at index 1 in a multi-element array and distinguishes the sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0, 2.0]);
      let captured = 1.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 1) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(1);
      expect(1.0 / captured).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6300
     * @tc.name testFloat32ArrayFindLastIndexONE063
     * @tc.desc Verify value parameter receives MIN_VALUE at index 2 in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 1.401298464324817e-45]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 2) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(2);
      expect(captured).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6400
     * @tc.name testFloat32ArrayFindLastIndexONE064
     * @tc.desc Verify value parameter receives 1e40 at index 1 in a multi-element array (overflows to Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0e40, 2.0]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 1) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(1);
      expect(captured).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6500
     * @tc.name testFloat32ArrayFindLastIndexONE065
     * @tc.desc Verify value parameter receives 123456789 at index 2 in a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 123456789.0]);
      let captured = 0.0;
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 2) {
          captured = value;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(2);
      expect(captured).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6600
     * @tc.name testFloat32ArrayFindLastIndexONE066
     * @tc.desc Verify index parameter is 2 when the last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let capturedIndex = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (value === 30.0) {
          capturedIndex = index;
          return true;
        }
        return false;
      });
      expect(capturedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6700
     * @tc.name testFloat32ArrayFindLastIndexONE067
     * @tc.desc Verify index parameter is 0 when the first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let capturedIndex = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (value === 10.0) {
          capturedIndex = index;
          return true;
        }
        return false;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6800
     * @tc.name testFloat32ArrayFindLastIndexONE068
     * @tc.desc Verify index parameter is 1 when a middle element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let capturedIndex = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (value === 0b10100) {
          capturedIndex = index;
          return true;
        }
        return false;
      });
      expect(capturedIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_6900
     * @tc.name testFloat32ArrayFindLastIndexONE069
     * @tc.desc Verify index parameter is 1 when the last element of a two-element array matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      let capturedIndex = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (value === 0b10100) {
          capturedIndex = index;
          return true;
        }
        return false;
      });
      expect(capturedIndex).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7000
     * @tc.name testFloat32ArrayFindLastIndexONE070
     * @tc.desc Verify index parameter is 0 when the single element of a single-element array matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([77.0]);
      let capturedIndex = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedIndex = index;
        return true;
      });
      expect(capturedIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7100
     * @tc.name testFloat32ArrayFindLastIndexONE071
     * @tc.desc Verify index parameter captures the index sequence traversed from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let firstIndex = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        firstIndex = index;
        return false;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7200
     * @tc.name testFloat32ArrayFindLastIndexONE072
     * @tc.desc Verify array parameter is the same reference as the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let captured = new Float32Array(0);
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        captured = array;
        return false;
      });
      expect(captured).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7300
     * @tc.name testFloat32ArrayFindLastIndexONE073
     * @tc.desc Verify array parameter length property is correct for a five-element static input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let capturedLen = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7400
     * @tc.name testFloat32ArrayFindLastIndexONE074
     * @tc.desc Verify array parameter byteLength property is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let capturedBL = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedBL = array.byteLength;
        return false;
      });
      expect(capturedBL).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7500
     * @tc.name testFloat32ArrayFindLastIndexONE075
     * @tc.desc Verify array parameter byteOffset property is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 8, 3);
      let capturedBO = -1;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedBO = array.byteOffset;
        return false;
      });
      expect(capturedBO).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7600
     * @tc.name testFloat32ArrayFindLastIndexONE076
     * @tc.desc Verify array parameter buffer property is the shared underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      let capturedBuf = new ArrayBuffer(0);
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        capturedBuf = array.buffer;
        return false;
      });
      expect(capturedBuf).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7700
     * @tc.name testFloat32ArrayFindLastIndexONE077
     * @tc.desc Verify predicate is passed as a named function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 6.0, 3.0, 8.0);
      expect(arr.findLastIndex(isLarge)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7800
     * @tc.name testFloat32ArrayFindLastIndexONE078
     * @tc.desc Verify predicate reads the external closure state threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threshold = 4.0;
      const arr = Float32Array.of(1.0, 5.0, 3.0, 6.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value > threshold)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_7900
     * @tc.name testFloat32ArrayFindLastIndexONE079
     * @tc.desc Verify predicate modifies the external counter state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8000
     * @tc.name testFloat32ArrayFindLastIndexONE080
     * @tc.desc Verify predicate internally nests a call to an external function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value === -1.0))
        .assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8100
     * @tc.name testFloat32ArrayFindLastIndexONE081
     * @tc.desc Verify predicate returns on the first match and captures the rightmost element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let firstSeen = 0.0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        firstSeen = value;
        return true;
      });
      expect(firstSeen).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8200
     * @tc.name testFloat32ArrayFindLastIndexONE082
     * @tc.desc Verify predicate matches a combined condition of index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => index % 2 === 0 && value > 15.0))
        .assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8300
     * @tc.name testFloat32ArrayFindLastIndexONE083
     * @tc.desc Verify predicate returns the last index when it returns true for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => true)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8400
     * @tc.name testFloat32ArrayFindLastIndexONE084
     * @tc.desc Verify predicate returns 0 when it returns true only for the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value === 0x10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8500
     * @tc.name testFloat32ArrayFindLastIndexONE085
     * @tc.desc Verify predicate returns the middle index when it returns true only for a middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value === 0b1010)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8600
     * @tc.name testFloat32ArrayFindLastIndexONE086
     * @tc.desc Verify predicate returns the rightmost matching index when it returns true for multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 2.0, 5.0, 3.0, 5.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value === 5.0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8700
     * @tc.name testFloat32ArrayFindLastIndexONE087
     * @tc.desc Verify predicate is not invoked for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let invoked = false;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        invoked = true;
        return false;
      });
      expect(invoked).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8800
     * @tc.name testFloat32ArrayFindLastIndexONE088
     * @tc.desc Verify predicate is invoked exactly once for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      let count = 0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_8900
     * @tc.name testFloat32ArrayFindLastIndexONE089
     * @tc.desc Verify predicate is invoked exactly twice for a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0]);
      let count = 0;
      arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_9000
     * @tc.name testFloat32ArrayFindLastIndexONE090
     * @tc.desc Verify predicate returns the rightmost matching index in an array of identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 9.0, 9.0, 9.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value === 9.0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_9100
     * @tc.name testFloat32ArrayFindLastIndexONE091
     * @tc.desc Verify predicate matches the rightmost position by negative value in an array containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, 2.0, -1.0, 4.0);
      expect(arr.findLastIndex((value: number, index: int, array: Float32Array) => value < 0.0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_9200
     * @tc.name testFloat32ArrayFindLastIndexONE092
     * @tc.desc Verify modifying a lower index while traversing from the end affects the later index matched by findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const idx = arr.findLastIndex((value: number, index: int, array: Float32Array) => {
        if (index === 2) {
          array.$_set(0, 9.0);
        }
        return value === 9.0;
      });
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXONE_9300
     * @tc.name testFloat32ArrayFindLastIndexONE093
     * @tc.desc Verify findLastIndex propagates predicate exceptions during reverse traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.findLastIndex((value: number): boolean => {
          if (value === 2.0) {
            throw new Error('stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

  });
}
