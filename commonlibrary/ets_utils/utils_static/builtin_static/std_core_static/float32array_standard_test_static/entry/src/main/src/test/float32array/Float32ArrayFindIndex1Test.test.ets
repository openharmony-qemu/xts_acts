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

function isFive(value: number, index: int, array: Float32Array): boolean {
  return value === 5.0;
}

function buildErr(): Error {
  return new Error("nested-build");
}

function isEvenValue(v: number): boolean {
  return v === 2.0 || v === 4.0;
}

export default function Float32ArrayFindIndex1Test(): void {
  describe('Float32ArrayFindIndex1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0010
     * @tc.name testFloat32ArrayFindIndexONE001
     * @tc.desc Verify passing an arrow predicate with arity 1 finds the middle element and returns its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === -1.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0020
     * @tc.name testFloat32ArrayFindIndexONE002
     * @tc.desc Verify passing an arrow predicate with arity 1 finds the first element and returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(7.0, 8.0, 9.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 7.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0030
     * @tc.name testFloat32ArrayFindIndexONE003
     * @tc.desc Verify passing an arrow predicate with arity 1 finds the last element and returns the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(7.0, 8.0, 9.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 9.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0040
     * @tc.name testFloat32ArrayFindIndexONE004
     * @tc.desc Verify passing a top-level named function reference as the predicate with arity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.0, 4.0, 5.0);
      const idx: number = arr.findIndex(isFive);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0050
     * @tc.name testFloat32ArrayFindIndexONE005
     * @tc.desc Verify passing a const-declared predicate expression with arity 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pred: (value: number, index: int, array: Float32Array) => boolean =
        (value: number, index: int, array: Float32Array) => value === -1.0;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex(pred);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0060
     * @tc.name testFloat32ArrayFindIndexONE006
     * @tc.desc Verify passing a block-body predicate with multiple statements with arity 1 returns the matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        const target: number = 20.0;
        return value === target;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0070
     * @tc.name testFloat32ArrayFindIndexONE007
     * @tc.desc Verify the value parameter is the current element value and the predicate matches the first one by value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 2.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0080
     * @tc.name testFloat32ArrayFindIndexONE008
     * @tc.desc Verify the value parameter ignores index and array and matches only by value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 6.0, 7.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 6.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0090
     * @tc.name testFloat32ArrayFindIndexONE009
     * @tc.desc Verify when the index parameter equals 0 the predicate returns true yielding index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(11.0, 22.0, 33.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0100
     * @tc.name testFloat32ArrayFindIndexONE010
     * @tc.desc Verify when the index parameter equals length-1 the predicate returns true yielding the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(11.0, 22.0, 33.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0110
     * @tc.name testFloat32ArrayFindIndexONE011
     * @tc.desc Verify when the index parameter equals a middle value the predicate returns true yielding the middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(11.0, 22.0, 33.0, 44.0, 55.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === 3);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0120
     * @tc.name testFloat32ArrayFindIndexONE012
     * @tc.desc Verify when the index parameter is greater than 2 the predicate returns true yielding the first satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index > 2);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0130
     * @tc.name testFloat32ArrayFindIndexONE013
     * @tc.desc Verify when the index parameter is even the predicate returns true yielding index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index % 2 === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0140
     * @tc.name testFloat32ArrayFindIndexONE014
     * @tc.desc Verify when the array parameter length equals 5 the predicate returns true yielding index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => array.length === 5);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0150
     * @tc.name testFloat32ArrayFindIndexONE015
     * @tc.desc Verify the array parameter is the same reference as the original array and the predicate returns true yielding index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => array === arr);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0160
     * @tc.name testFloat32ArrayFindIndexONE016
     * @tc.desc Verify when the value read by index from the array parameter equals the value parameter it returns the matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => array.$_get(index) === value &&
          value === 30.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0170
     * @tc.name testFloat32ArrayFindIndexONE017
     * @tc.desc Verify the three parameters are jointly evaluated: value greater than 2 and index less than 4 and length greater than 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => value > 2.0 && index < 4 && array.length > 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0180
     * @tc.name testFloat32ArrayFindIndexONE018
     * @tc.desc Verify the predicate ignores all parameters and always returns false yielding -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => false);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0190
     * @tc.name testFloat32ArrayFindIndexONE019
     * @tc.desc Verify the predicate ignores all parameters and always returns true yielding index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => true);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0200
     * @tc.name testFloat32ArrayFindIndexONE020
     * @tc.desc Verify the index parameter increases in sequence and the last visible value is length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seen: number = -1;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        seen = index;
        return false;
      });
      expect(idx).assertEqual(-1);
      expect(seen).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0210
     * @tc.name testFloat32ArrayFindIndexONE021
     * @tc.desc Verify the predicate stops iteration as soon as it first returns true and the side effect count equals the match position plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: number = 0;
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        counter = counter + 1;
        return value === 3.0;
      });
      expect(idx).assertEqual(2);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0220
     * @tc.name testFloat32ArrayFindIndexONE022
     * @tc.desc Verify the predicate returns false for all elements yielding -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > 2000000);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0230
     * @tc.name testFloat32ArrayFindIndexONE023
     * @tc.desc Verify the predicate returns true for all elements yielding index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > -2);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0240
     * @tc.name testFloat32ArrayFindIndexONE024
     * @tc.desc Verify the predicate returns true only for the last element yielding the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === -1.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0250
     * @tc.name testFloat32ArrayFindIndexONE025
     * @tc.desc Verify the predicate evaluates greater-than-threshold and returns the first satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.5, 2.5, 3.5);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > 2.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0260
     * @tc.name testFloat32ArrayFindIndexONE026
     * @tc.desc Verify the predicate evaluates less-than-threshold and returns the first satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 4.0, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value < 4.5);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0270
     * @tc.name testFloat32ArrayFindIndexONE027
     * @tc.desc Verify the predicate evaluates strict-equals to the boundary value and returns the matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0b1010);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0280
     * @tc.name testFloat32ArrayFindIndexONE028
     * @tc.desc Verify the predicate evaluates not-equals to the boundary value and returns the first not-equal index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 5.0, 5.0, 6.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value !== 5.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0290
     * @tc.name testFloat32ArrayFindIndexONE029
     * @tc.desc Verify the predicate throws a RangeError when value is greater than 3 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (value > 3.0) {
            throw new RangeError("overflow");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0300
     * @tc.name testFloat32ArrayFindIndexONE030
     * @tc.desc Verify the predicate throws a TypeError when index equals 0 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (index === 0) {
            throw new TypeError("bad index");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0310
     * @tc.name testFloat32ArrayFindIndexONE031
     * @tc.desc Verify the predicate throws an Error when index equals 2 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (index === 2) {
            throw new Error("middle");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0320
     * @tc.name testFloat32ArrayFindIndexONE032
     * @tc.desc Verify the predicate throws a SyntaxError when value is less than 0 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -2.0, 3.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (value < 0) {
            throw new SyntaxError("neg");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0330
     * @tc.name testFloat32ArrayFindIndexONE033
     * @tc.desc Verify the predicate throws a RangeError when the last element index equals length-1 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (index === array.length - 1) {
            throw new RangeError("last");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0340
     * @tc.name testFloat32ArrayFindIndexONE034
     * @tc.desc Verify the predicate throws a URIError when index equals 1 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (index === 1) {
            throw new URIError("uri");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("URIError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0350
     * @tc.name testFloat32ArrayFindIndexONE035
     * @tc.desc Verify the predicate throws an EvalError when value is greater than 5 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 6.0, 7.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (value > 5.0) {
            throw new EvalError("eval");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("EvalError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0360
     * @tc.name testFloat32ArrayFindIndexONE036
     * @tc.desc Verify the predicate throws a ReferenceError when index equals 2 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (index === 2) {
            throw new ReferenceError("ref");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ReferenceError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0370
     * @tc.name testFloat32ArrayFindIndexONE037
     * @tc.desc Verify the predicate throws an Error with a custom message when value equals 2.0 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (value === 0b1010) {
            throw new Error("custom-msg");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("custom-msg");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0380
     * @tc.name testFloat32ArrayFindIndexONE038
     * @tc.desc Verify the predicate throws a RangeError when index equals 3 and it propagates after a partial match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          calls = calls + 1;
          if (index === 3) {
            throw new RangeError("at3");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0390
     * @tc.name testFloat32ArrayFindIndexONE039
     * @tc.desc Verify the predicate throws a nested-constructed Error when value equals 1.0 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (value === 1.0) {
            throw buildErr();
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("nested-build");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0400
     * @tc.name testFloat32ArrayFindIndexONE040
     * @tc.desc Verify the predicate throws a TypeError when array.length equals 3 and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (array.length === 3) {
            throw new TypeError("len3");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0410
     * @tc.name testFloat32ArrayFindIndexONE041
     * @tc.desc Verify the predicate throws a RangeError when value is NaN and it propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, NaN, 3.0);
      try {
        arr.findIndex((value: number, index: int, array: Float32Array) => {
          if (value !== value) {
            throw new RangeError("nan");
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0420
     * @tc.name testFloat32ArrayFindIndexONE042
     * @tc.desc Verify findIndex on an empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => true);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0430
     * @tc.name testFloat32ArrayFindIndexONE043
     * @tc.desc Verify a single-element array with no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(42.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0440
     * @tc.name testFloat32ArrayFindIndexONE044
     * @tc.desc Verify a multi-element array with all not matching returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > 10.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0450
     * @tc.name testFloat32ArrayFindIndexONE045
     * @tc.desc Verify the predicate finds a nonexistent large value and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 999.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0460
     * @tc.name testFloat32ArrayFindIndexONE046
     * @tc.desc Verify the predicate searching by strict-equals to NaN always returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, NaN, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === NaN);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0470
     * @tc.name testFloat32ArrayFindIndexONE047
     * @tc.desc Verify the predicate finds nonexistent Infinity and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Infinity);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0480
     * @tc.name testFloat32ArrayFindIndexONE048
     * @tc.desc Verify finding a negative value in an all-positive array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value < -2);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0490
     * @tc.name testFloat32ArrayFindIndexONE049
     * @tc.desc Verify the predicate finds a value greater than the maximum element and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 5.0, 9.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > 9.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0500
     * @tc.name testFloat32ArrayFindIndexONE050
     * @tc.desc Verify the predicate searching with index equal to length never matches and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === array.length);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0510
     * @tc.name testFloat32ArrayFindIndexONE051
     * @tc.desc Verify searching by the negative-zero feature in an all-positive-zero array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, 0.0, 0.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => 1.0 / value === -Infinity);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0520
     * @tc.name testFloat32ArrayFindIndexONE052
     * @tc.desc Verify a subnormal number is not equal to zero and the predicate finding zero returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.401298464324817e-45);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0530
     * @tc.name testFloat32ArrayFindIndexONE053
     * @tc.desc Verify the predicate searching with a negative index never matches and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index < 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0540
     * @tc.name testFloat32ArrayFindIndexONE054
     * @tc.desc Verify the array contains the maximum finite value of Float32 and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 3.4028234663852886e+38, 2.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => value === 3.4028234663852886e+38);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0550
     * @tc.name testFloat32ArrayFindIndexONE055
     * @tc.desc Verify the array contains the smallest positive normal number of Float32 and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.1754943508222875e-38, 2.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => value === 1.1754943508222875e-38);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0560
     * @tc.name testFloat32ArrayFindIndexONE056
     * @tc.desc Verify the array contains the smallest positive subnormal number and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.401298464324817e-45, 2.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => value === 1.401298464324817e-45);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0570
     * @tc.name testFloat32ArrayFindIndexONE057
     * @tc.desc Verify the array contains the smallest finite negative value and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -3.4028234663852886e+38, 2.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => value === -3.4028234663852886e+38);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0580
     * @tc.name testFloat32ArrayFindIndexONE058
     * @tc.desc Verify the array contains NaN and the predicate matches by reflexive inequality returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, NaN, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value !== value);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0590
     * @tc.name testFloat32ArrayFindIndexONE059
     * @tc.desc Verify the array contains positive infinity and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, Infinity, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Infinity);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0600
     * @tc.name testFloat32ArrayFindIndexONE060
     * @tc.desc Verify the array contains negative infinity and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -Infinity, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === -Infinity);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0610
     * @tc.name testFloat32ArrayFindIndexONE061
     * @tc.desc Verify the array contains positive zero and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 0.0, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0620
     * @tc.name testFloat32ArrayFindIndexONE062
     * @tc.desc Verify the array contains negative zero and the predicate matches by reciprocal evaluation returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -0.0, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => 1.0 / value === -Infinity);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0630
     * @tc.name testFloat32ArrayFindIndexONE063
     * @tc.desc Verify the array contains positive zero and negative zero and the predicate matches by strict-equals to zero returning the first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, -0.0, 0.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0640
     * @tc.name testFloat32ArrayFindIndexONE064
     * @tc.desc Verify the array contains 0.1 0.2 0.3 and the predicate matches 0.1 returning the first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1, 0.2, 0.3);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Math.fround(0.1));
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0650
     * @tc.name testFloat32ArrayFindIndexONE065
     * @tc.desc Verify the array contains 0.1 and 0.2 and the predicate matches by not-equal to 0.1 returning the 0.2 index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1, 0.2);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value !== Math.fround(0.1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0660
     * @tc.name testFloat32ArrayFindIndexONE066
     * @tc.desc Verify the array contains the exact integer 2 to the 24th power and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 16777216.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 16777216.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0670
     * @tc.name testFloat32ArrayFindIndexONE067
     * @tc.desc Verify the array contains 2 to the 24th power plus one truncated and the predicate matches by the truncated value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 16777217.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 16777216.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0680
     * @tc.name testFloat32ArrayFindIndexONE068
     * @tc.desc Verify the array contains 2 to the 24th power plus one truncated and the predicate matches by the original value returning -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 16777217.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 16777217.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0690
     * @tc.name testFloat32ArrayFindIndexONE069
     * @tc.desc Verify the array contains 1.0e40 which overflows to positive infinity and the predicate matches infinity returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.0e40, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Infinity);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0700
     * @tc.name testFloat32ArrayFindIndexONE070
     * @tc.desc Verify the array contains -1.0e40 which underflows to negative infinity and the predicate matches negative infinity returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -1.0e40, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === -Infinity);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0710
     * @tc.name testFloat32ArrayFindIndexONE071
     * @tc.desc Verify the array contains 1.0e-46 which underflows to positive zero and the predicate matches zero returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.0e-46, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0720
     * @tc.name testFloat32ArrayFindIndexONE072
     * @tc.desc Verify the array contains scientific notation 1.0e3 and the predicate matches 1000.0 returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e3, 2.0, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 1.0e3);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0730
     * @tc.name testFloat32ArrayFindIndexONE073
     * @tc.desc Verify the array contains the hexadecimal literal 0x10 and the predicate matches by the hexadecimal literal returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 2.0, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0x10);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0740
     * @tc.name testFloat32ArrayFindIndexONE074
     * @tc.desc Verify the array contains the int maximum value 2147483647 and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2147483647.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 2147483648);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0750
     * @tc.name testFloat32ArrayFindIndexONE075
     * @tc.desc Verify the array contains the int minimum value -2147483648 and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -2147483648.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === -2147483648);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0760
     * @tc.name testFloat32ArrayFindIndexONE076
     * @tc.desc Verify the array contains the precision-truncated value 1.0000001 and the predicate matches by the stored value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.0000001, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 1.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0770
     * @tc.name testFloat32ArrayFindIndexONE077
     * @tc.desc Verify the array contains 1.1 and the predicate matches by value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.5, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 1.5);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0780
     * @tc.name testFloat32ArrayFindIndexONE078
     * @tc.desc Verify the array contains multiple NaN and the predicate matches by reflexive inequality returning the first NaN index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(NaN, 1.0, NaN);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value !== value);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0790
     * @tc.name testFloat32ArrayFindIndexONE079
     * @tc.desc Verify the array contains multiple positive infinities and the predicate matches returning the first infinity index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Infinity, 1.0, Infinity);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Infinity);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0800
     * @tc.name testFloat32ArrayFindIndexONE080
     * @tc.desc Verify the array contains a very small positive value and the predicate matches by interval evaluation returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 1.401298464324817e-45, 2.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => value > -2 && value < 1.0e-30);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0810
     * @tc.name testFloat32ArrayFindIndexONE081
     * @tc.desc Verify the array is all the same value and the predicate matches by value returning index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 5.0, 5.0, 5.0, 5.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 5.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0820
     * @tc.name testFloat32ArrayFindIndexONE082
     * @tc.desc Verify the array is all the same value and the predicate matches with index equal to 2 returning index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 5.0, 5.0, 5.0, 5.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0830
     * @tc.name testFloat32ArrayFindIndexONE083
     * @tc.desc Verify a hundred-element array predicate matches the last element returning the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i * 1.0);
      }
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 99.0);
      expect(idx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0840
     * @tc.name testFloat32ArrayFindIndexONE084
     * @tc.desc Verify a hundred-element array predicate matches with index equal to 50 returning the middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i * 1.0);
      }
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === 50);
      expect(idx).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0850
     * @tc.name testFloat32ArrayFindIndexONE085
     * @tc.desc Verify the array contains positive and negative values and the predicate matches the first negative value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.0, -1.0, -2.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value < 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0860
     * @tc.name testFloat32ArrayFindIndexONE086
     * @tc.desc Verify the array contains positive and negative values and the predicate matches the first positive value returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-3.0, -1.0, 2.0, -4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > 0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0870
     * @tc.name testFloat32ArrayFindIndexONE087
     * @tc.desc Verify the array's first element is zero and the predicate matches zero returning index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, 1.0, 2.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 0.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0880
     * @tc.name testFloat32ArrayFindIndexONE088
     * @tc.desc Verify the array contains positive infinity and NaN and the predicate prioritizes matching positive infinity returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Infinity, NaN, 1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === Infinity);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0890
     * @tc.name testFloat32ArrayFindIndexONE089
     * @tc.desc Verify the array contains duplicate values and the predicate matches by value returning the first occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(8.0, 9.0, 8.0, 9.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === 9.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0900
     * @tc.name testFloat32ArrayFindIndexONE090
     * @tc.desc Verify the array contains negative values and the predicate matches by absolute value greater than 5 returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -6.0, 3.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => (value < -2 ? -value : value) > 5.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0910
     * @tc.name testFloat32ArrayFindIndexONE091
     * @tc.desc Verify the predicate reads an outer closure variable to decide the match returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: number = 0b1010;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value === target);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0920
     * @tc.name testFloat32ArrayFindIndexONE092
     * @tc.desc Verify the predicate reads an outer closure index variable to decide the match returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wantIndex: number = 2;
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => index === wantIndex);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0930
     * @tc.name testFloat32ArrayFindIndexONE093
     * @tc.desc Verify the predicate accumulates an external count in the callback and matches the third position returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        count = count + 1;
        return count === 3;
      });
      expect(idx).assertEqual(2);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0940
     * @tc.name testFloat32ArrayFindIndexONE094
     * @tc.desc Verify the predicate appends values to an external array in the callback and matches the last element returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traced: number[] = [];
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        traced.push(value);
        return value === -1.0;
      });
      expect(idx).assertEqual(2);
      expect(traced.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0950
     * @tc.name testFloat32ArrayFindIndexONE095
     * @tc.desc Verify the predicate calls a top-level helper function returning a boolean to decide the matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => isEvenValue(value));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0960
     * @tc.name testFloat32ArrayFindIndexONE096
     * @tc.desc Verify the predicate flips an external boolean flag in the callback and returns its index after matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        if (value === 0b1010) {
          flag = true;
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(1);
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0970
     * @tc.name testFloat32ArrayFindIndexONE097
     * @tc.desc Verify the predicate accumulates element values in the callback and matches when the accumulation exceeds the threshold returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0.0;
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        sum = sum + value;
        return sum > 5.0;
      });
      expect(idx).assertEqual(2);
      expect(sum).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0980
     * @tc.name testFloat32ArrayFindIndexONE098
     * @tc.desc Verify the predicate records the maximum index in the callback and matches the last element returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIndex: number = -1;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        if (index > maxIndex) {
          maxIndex = index;
        }
        return value === -1.0;
      });
      expect(idx).assertEqual(2);
      expect(maxIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_0990
     * @tc.name testFloat32ArrayFindIndexONE099
     * @tc.desc Verify the predicate matches the first element exceeding the threshold by an outer closure threshold constant returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threshold: number = 2.5;
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value > threshold);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1000
     * @tc.name testFloat32ArrayFindIndexONE100
     * @tc.desc Verify the predicate decides whether to match by an outer closure boolean switch returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const enable: boolean = true;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => enable && value === 0b1010);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1010
     * @tc.name testFloat32ArrayFindIndexONE101
     * @tc.desc Verify the predicate never matches with the outer closure boolean turned off returning -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const enable: boolean = false;
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => enable && value === 0b1010);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1020
     * @tc.name testFloat32ArrayFindIndexONE102
     * @tc.desc Verify the predicate limits by an external count in the callback so only the first two may match returning -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let budget: number = 2;
      const arr: Float32Array = Float32Array.of(5.0, 5.0, 5.0, 9.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        if (budget <= 0) {
          return false;
        }
        budget = budget - 1;
        return value === 9.0;
      });
      expect(idx).assertEqual(-1);
      expect(budget).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1030
     * @tc.name testFloat32ArrayFindIndexONE103
     * @tc.desc Verify the predicate reads the outer array length in the callback and matches the index returning its value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const external: number[] = [10.0, 20.0, 30.0];
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number =
        arr.findIndex((value: number, index: int, array: Float32Array) => index === external.length - 1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1040
     * @tc.name testFloat32ArrayFindIndexONE104
     * @tc.desc Verify the predicate matches the first element less than the threshold by an outer closure negative threshold returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negThreshold: number = -1.5;
      const arr: Float32Array = Float32Array.of(1.0, -2.0, 3.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value < negThreshold);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1050
     * @tc.name testFloat32ArrayFindIndexONE105
     * @tc.desc Verify the predicate matches by the product of value and index in the callback returning its index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => value * index === 12.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1060
     * @tc.name testFloat32ArrayFindIndexONE106
     * @tc.desc Verify modifying a later element in the predicate affects the later index matched by findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const idx: number = arr.findIndex((value: number, index: int, array: Float32Array) => {
        if (index === 0) {
          array.$_set(2, 9.0);
        }
        return value === 9.0;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_INDEXONE_1070
     * @tc.name testFloat32ArrayFindIndexONE107
     * @tc.desc Verify findIndex propagates predicate exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindIndexONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.findIndex((value: number): boolean => {
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
