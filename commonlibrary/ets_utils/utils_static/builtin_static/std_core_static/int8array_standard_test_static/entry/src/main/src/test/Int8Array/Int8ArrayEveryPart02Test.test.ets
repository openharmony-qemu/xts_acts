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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function int8ArrayEveryPart02Test(): void {
  describe('Int8ArrayEveryPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0100
     * @tc.name int8ArrayEveryPart02Test001
     * @tc.desc Verify every returns true when all elements pass predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0200
     * @tc.name int8ArrayEveryPart02Test002
     * @tc.desc Verify every returns false when all elements fail predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0300
     * @tc.name int8ArrayEveryPart02Test003
     * @tc.desc Verify every returns false short-circuit on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0400
     * @tc.name int8ArrayEveryPart02Test004
     * @tc.desc Verify every returns true for empty array (vacuous truth)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0500
     * @tc.name int8ArrayEveryPart02Test005
     * @tc.desc Verify every returns true with single truthy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0600
     * @tc.name int8ArrayEveryPart02Test006
     * @tc.desc Verify every returns false with single falsy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0700
     * @tc.name int8ArrayEveryPart02Test007
     * @tc.desc Verify every returns false when middle element fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0800
     * @tc.name int8ArrayEveryPart02Test008
     * @tc.desc Verify every returns true when callback always returns true with mixed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 0, INT8_MAX, -128]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0900
     * @tc.name int8ArrayEveryPart02Test009
     * @tc.desc Verify every returns false when callback always returns false (short-circuit on first)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1000
     * @tc.name int8ArrayEveryPart02Test010
     * @tc.desc Verify every element>= -128 with minValue -128 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e >= -128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1100
     * @tc.name int8ArrayEveryPart02Test011
     * @tc.desc Verify every element<=127 with maxValue 127 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e <= INT8_MAX);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1200
     * @tc.name int8ArrayEveryPart02Test012
     * @tc.desc Verify every element>0 with negative value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 2]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1300
     * @tc.name int8ArrayEveryPart02Test013
     * @tc.desc Verify every element>0 all positive returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1400
     * @tc.name int8ArrayEveryPart02Test014
     * @tc.desc Verify every element===0 all zero returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1500
     * @tc.name int8ArrayEveryPart02Test015
     * @tc.desc Verify every element===0 with non-zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 0]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1600
     * @tc.name int8ArrayEveryPart02Test016
     * @tc.desc Verify every element!=-128 with -128 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, 1]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e !== -128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1700
     * @tc.name int8ArrayEveryPart02Test017
     * @tc.desc Verify every callback receives index in ascending order from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let lastIdx: int = -1;
      let orderOk: boolean = true;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        if (i != lastIdx + 1) {
          orderOk = false;
        }
        lastIdx = i;
        return true;
      });
      expect(result).assertTrue();
      expect(orderOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1800
     * @tc.name int8ArrayEveryPart02Test018
     * @tc.desc Verify every callback receives correct array length 3 via parameter a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let aLenOk: boolean = true;
      const result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        if (a.length != 3) {
          aLenOk = false;
        }
        return true;
      });
      expect(result).assertTrue();
      expect(aLenOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1900
     * @tc.name int8ArrayEveryPart02Test019
     * @tc.desc Verify every index===0 only first element satisfies returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return i === 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2000
     * @tc.name int8ArrayEveryPart02Test020
     * @tc.desc Verify every callback receives a === arr with length 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let r1: int = a.length;
        let e1: int = 3;
        expect(r1).assertEqual(e1);
        expect(a).assertEqual(arr);
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2100
     * @tc.name int8ArrayEveryPart02Test021
     * @tc.desc Verify every expects 2 from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let result: boolean = arr.every((e: number, _i: int, a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        let r1: int = a.byteOffset;
        let e1: int = 2;
        expect(r1).assertEqual(e1);
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2200
     * @tc.name int8ArrayEveryPart02Test022
     * @tc.desc Verify every on empty new Int8Array(0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2300
     * @tc.name int8ArrayEveryPart02Test023
     * @tc.desc Verify every returns true for single element, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2400
     * @tc.name int8ArrayEveryPart02Test024
     * @tc.desc Verify every returns true and byteLength equals length, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2500
     * @tc.name int8ArrayEveryPart02Test025
     * @tc.desc Verify every returns true when all elements > -200, on new Int8Array([-128, 0, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > -200);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2600
     * @tc.name int8ArrayEveryPart02Test026
     * @tc.desc Verify every returns true when all elements < 200, on new Int8Array([-128, 0, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e < 200);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2700
     * @tc.name int8ArrayEveryPart02Test027
     * @tc.desc Verify every returns true when all elements >= 0, on new Int8Array([0, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2800
     * @tc.name int8ArrayEveryPart02Test028
     * @tc.desc Verify every returns true on non-zero offset view, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2900
     * @tc.name int8ArrayEveryPart02Test029
     * @tc.desc Verify every on subarray view returns true when all elements > 0, on new Int8Array([1, 2, 3, 4]) subarray(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      let result: boolean = view.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3000
     * @tc.name int8ArrayEveryPart02Test030
     * @tc.desc Verify every on view1 returns true when all elements > 0, on shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view1: Int8Array = new Int8Array(buf, 0, 2);
      let view2: Int8Array = new Int8Array(buf, 2, 2);
      view1.$_set(0, 1);
      view1.$_set(1, 2);
      view2.$_set(0, 3);
      view2.$_set(1, 4);
      let result: boolean = view1.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3100
     * @tc.name int8ArrayEveryPart02Test031
     * @tc.desc Verify every stops at first failing element, callback count is 1 and result false, on new Int8Array([0, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3200
     * @tc.name int8ArrayEveryPart02Test032
     * @tc.desc Verify every expects 3, on new Int8Array([1, 2, 0, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0, 4]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3300
     * @tc.name int8ArrayEveryPart02Test033
     * @tc.desc Verify every callback invoked 3 times, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3400
     * @tc.name int8ArrayEveryPart02Test034
     * @tc.desc Verify every expects 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: number = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3500
     * @tc.name int8ArrayEveryPart02Test035
     * @tc.desc Verify every expects 3, on new Int8Array([1, 2, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3600
     * @tc.name int8ArrayEveryPart02Test036
     * @tc.desc Verify every, on new Int8Array([1, 0, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3, 4]);
      let visited: boolean = false;
      const result: boolean = arr.every((e: number, i: int, _a: Int8Array): boolean => {
        if (i >= 2) {
          visited = true;
        }
        return e > 0;
      });
      expect(result).assertFalse();
      expect(visited).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3700
     * @tc.name int8ArrayEveryPart02Test037
     * @tc.desc Verify every returns false when element 0 is not > 0, on new Int8Array([1, 0, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3, 4]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3800
     * @tc.name int8ArrayEveryPart02Test038
     * @tc.desc Verify every returns false when element 0 fails predicate, on new Int8Array([1, 0, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3, 4]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3900
     * @tc.name int8ArrayEveryPart02Test039
     * @tc.desc Verify every returns false when element at index 1 is 0, on new Int8Array([1, 0, 99, 99])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 99, 99]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4000
     * @tc.name int8ArrayEveryPart02Test040
     * @tc.desc Verify every throws Error when callback throws, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4100
     * @tc.name int8ArrayEveryPart02Test041
     * @tc.desc Verify every throws Error from callback on view, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      try {
        const result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
          if (e < INT8_MIN || e > INT8_MAX) {
            return false;
          }
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4200
     * @tc.name int8ArrayEveryPart02Test042
     * @tc.desc Verify multiple every calls return consistent results (idempotence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      let r2: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4300
     * @tc.name int8ArrayEveryPart02Test043
     * @tc.desc Verify every returns true when single element (200 as byte = -56) matches predicate e === -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([200]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e === -56);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4400
     * @tc.name int8ArrayEveryPart02Test044
     * @tc.desc Verify every on fill(1) filled new Int8Array(100) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      arr.fill(1);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4500
     * @tc.name int8ArrayEveryPart02Test045
     * @tc.desc Verify every on fill(1) filled new Int8Array(100) with $_set(99, 0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      arr.fill(1);
      arr.$_set(99, 0);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4600
     * @tc.name int8ArrayEveryPart02Test046
     * @tc.desc Verify every returns true when all elements equal 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e === 7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4700
     * @tc.name int8ArrayEveryPart02Test047
     * @tc.desc Verify every returns false when no element satisfies e !== 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e !== 7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4800
     * @tc.name int8ArrayEveryPart02Test048
     * @tc.desc Verify every, on new Int8Array([0, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4900
     * @tc.name int8ArrayEveryPart02Test049
     * @tc.desc Verify every, on new Int8Array([0, -1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, INT8_MAX]);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => e >= 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5000
     * @tc.name int8ArrayEveryPart02Test050
     * @tc.desc Verify every, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((e: number, _i: int, _a: Int8Array): boolean => {
        if (e < INT8_MIN || e > INT8_MAX) {
          return false;
        }
        return false;
      });
      expect(result).assertTrue();
    });
  });
}
