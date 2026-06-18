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
import Utils from './../Util.test';

/** int enum for $_get index enum-to-number conversion (conversions.md) */
enum ArrayLikeGetIndexEnum {
  FIRST = 0,
  MID = 2
}

/** int enum elements for ArrayLike element type coverage */
enum ArrayLikeStatusEnum {
  SUCCESS = 0,
  FAIL = 1,
  TIMEOUT = 2
}

/** string underlying-type enum (spec/enums.md) */
enum ArrayLikeStringEnum {
  OK = "SUCCESS",
  ERR = "FAIL"
}

/** double underlying-type enum (spec/enums.md) */
enum ArrayLikeScoreEnum: double {
  LOW = 1.0,
  HIGH = 99.99
}

export default function ArrayLikeGetTest(): void {
  describe('ArrayLikeGetTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0010
     * @tc.name testArrayLikeGet001
     * @tc.desc Verify $_get with valid indices returns all elements including index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const list: ArrayLike<double> = bytes
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertEqual(20)
      expect(list.$_get(2)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0020
     * @tc.name testArrayLikeGet002
     * @tc.desc Verify $_get with positive index returns middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(5)
      bytes[0] = 1
      bytes[1] = 2
      bytes[2] = 3
      bytes[3] = 4
      bytes[4] = 5
      const list: ArrayLike<double> = bytes
      let result = list.$_get(2)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0030
     * @tc.name testArrayLikeGet003
     * @tc.desc Verify $_get(length-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const list: ArrayLike<double> = bytes
      let result = list.$_get(list.length - 1)
      expect(result).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0040
     * @tc.name testArrayLikeGet004
     * @tc.desc Verify $_get with hexadecimal index 0x0A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(20)
      bytes[0x0A] = 99
      const list: ArrayLike<double> = bytes
      let result = list.$_get(0x0A)
      expect(result).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0050
     * @tc.name testArrayLikeGet005
     * @tc.desc Verify $_get with octal index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(20)
      bytes[0o12] = 77
      const list: ArrayLike<double> = bytes
      let result = list.$_get(0o12)
      expect(result).assertEqual(77)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0060
     * @tc.name testArrayLikeGet006
     * @tc.desc Verify $_get with binary index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(20)
      bytes[0b1010] = 55
      const list: ArrayLike<double> = bytes
      let result = list.$_get(0b1010)
      expect(result).assertEqual(55)
    });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0070
     * @tc.name testArrayLikeGet007
     * @tc.desc Verify $_get with int.MAX_VALUE index throws out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        let result = list.$_get(2147483647)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0080
     * @tc.name testArrayLikeGet008
     * @tc.desc Verify $_get with int.MIN_VALUE index throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        let result = list.$_get(-2147483648)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0090
     * @tc.name testArrayLikeGet009
     * @tc.desc Verify $_get with negative index -1 throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        let result = list.$_get(-1)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0100
     * @tc.name testArrayLikeGet010
     * @tc.desc Verify $_get with index equal to length throws out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        let result = list.$_get(3)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0110
     * @tc.name testArrayLikeGet011
     * @tc.desc Verify $_get with index much larger than length throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        let result = list.$_get(100)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0120
     * @tc.name testArrayLikeGet012
     * @tc.desc Verify $_get with hex index 0x100 throws out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        let result = list.$_get(0x100)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0130
     * @tc.name testArrayLikeGet013
     * @tc.desc Verify Uint8Array as ArrayLike<double> returns Number element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 100
      bytes[1] = 200
      const list: ArrayLike<double> = bytes
      let result: double = list.$_get(0)
      expect(result).assertEqual(100)
    });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0140
     * @tc.name testArrayLikeGet014
     * @tc.desc Verify Float32Array as ArrayLike<double> returns float elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(2)
      f32[0] = 3.14f
      f32[1] = -0.0
      const list: ArrayLike<double> = f32
      expect(list.$_get(0)).assertEqual(3.14f)
      expect(list.$_get(1)).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0150
     * @tc.name testArrayLikeGet015
     * @tc.desc Verify $_get(0) returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30)
      const list: ArrayLike<int> = values
      expect(list.$_get(0)).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0160
     * @tc.name testArrayLikeGet016
     * @tc.desc Verify $_get(length-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("a", "b", "c")
      const list: ArrayLike<string> = values
      expect(list.$_get(list.length - 1)).assertEqual("c")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0170
     * @tc.name testArrayLikeGet017
     * @tc.desc Verify $_get(0) on single-element array returns only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32 = new Int32Array(1)
      int32[0] = 42
      const list: ArrayLike<double> = int32
      expect(list.$_get(0)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0180
     * @tc.name testArrayLikeGet018
     * @tc.desc Verify $_get returns element value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 0
      bytes[1] = 0
      bytes[2] = 0
      const list: ArrayLike<double> = bytes
      expect(list.$_get(1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0190
     * @tc.name testArrayLikeGet019
     * @tc.desc Verify $_get returns Uint8Array max value 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(1)
      bytes[0] = 255
      const list: ArrayLike<double> = bytes
      expect(list.$_get(0)).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0200
     * @tc.name testArrayLikeGet020
     * @tc.desc Verify $_get returns negative element value from Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array(1)
      i8[0] = -128
      const list: ArrayLike<double> = i8
      expect(list.$_get(0)).assertEqual(-128)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0210
     * @tc.name testArrayLikeGet021
     * @tc.desc Verify $_get result is assignable to Number and returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(2)
      bytes[0] = 10
      bytes[1] = 20
      const list: ArrayLike<double> = bytes
      let result: double = list.$_get(0)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0220
     * @tc.name testArrayLikeGet022
     * @tc.desc Verify Int8Array as ArrayLike returns signed integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array(2)
      i8[0] = -128
      i8[1] = 127
      const list: ArrayLike<double> = i8
      expect(list.$_get(0)).assertEqual(-128)
      expect(list.$_get(1)).assertEqual(127)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0230
     * @tc.name testArrayLikeGet023
     * @tc.desc Verify Uint16Array as ArrayLike returns unsigned short integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array(2)
      u16[0] = 65535
      u16[1] = 0
      const list: ArrayLike<double> = u16
      expect(list.$_get(0)).assertEqual(65535)
      expect(list.$_get(1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0240
     * @tc.name testArrayLikeGet024
     * @tc.desc Verify Float64Array as ArrayLike returns double-precision float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(1)
      f64[0] = 1.7976931348623157E308
      const list: ArrayLike<double> = f64
      expect(list.$_get(0)).assertEqual(1.7976931348623157E308)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0250
     * @tc.name testArrayLikeGet025
     * @tc.desc Verify Int32Array boundary values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(2)
      i32[0] = 2147483647
      i32[1] = -2147483648
      const list: ArrayLike<double> = i32
      expect(list.$_get(0)).assertEqual(2147483647)
      expect(list.$_get(1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0260
     * @tc.name testArrayLikeGet026
     * @tc.desc Verify Float64Array NaN element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(1)
      f64[0] = Double.NaN
      const list: ArrayLike<double> = f64
      expect(isNaN(list.$_get(0))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0270
     * @tc.name testArrayLikeGet027
     * @tc.desc Verify Float64Array Infinity element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(1)
      f64[0] = Double.POSITIVE_INFINITY
      const list: ArrayLike<double> = f64
      expect(list.$_get(0)).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0280
     * @tc.name testArrayLikeGet028
     * @tc.desc Verify Float64Array negative Infinity element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(1)
      f64[0] = Double.NEGATIVE_INFINITY
      const list: ArrayLike<double> = f64
      expect(list.$_get(0)).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0290
     * @tc.name testArrayLikeGet029
     * @tc.desc Verify Float64Array negative zero element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(1)
      f64[0] = -0.0
      const list: ArrayLike<double> = f64
      expect(list.$_get(0)).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0300
     * @tc.name testArrayLikeGet030
     * @tc.desc Verify $_get with index 5 on length-3 array throws out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(5)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0310
     * @tc.name testArrayLikeGet031
     * @tc.desc Verify $_get with index much greater than length throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(10000)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0320
     * @tc.name testArrayLikeGet032
     * @tc.desc Verify $_get with index 1 on single-element array throws out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(1)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(1)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0330
     * @tc.name testArrayLikeGet033
     * @tc.desc Verify $_get with index -2 throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(-2)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0340
     * @tc.name testArrayLikeGet034
     * @tc.desc Verify $_get with index -100 throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(-100)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0350
     * @tc.name testArrayLikeGet035
     * @tc.desc Verify $_get with index 999 on single-element array throws out-of-bounds error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(1)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(999)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0360
     * @tc.name testArrayLikeGet036
     * @tc.desc Verify $_get accepts byte index with widening to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const list: ArrayLike<double> = bytes
      let idx: byte = 1
      expect(list.$_get(idx)).assertEqual(20)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0370
     * @tc.name testArrayLikeGet037
     * @tc.desc Verify try-catch captures out-of-bounds $_get exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      let caught = false
      try {
        list.$_get(100)
      } catch (error) {
        caught = true
        expect(error.name).assertEqual('RangeError')
      } finally {
        expect(caught).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0380
     * @tc.name testArrayLikeGet038
     * @tc.desc Verify try-catch captures negative index $_get exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      let caught = false
      try {
        list.$_get(-1)
      } catch (error) {
        caught = true
        expect(error.name).assertEqual('RangeError')
      } finally {
        expect(caught).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0390
     * @tc.name testArrayLikeGet039
     * @tc.desc Verify normal $_get access works after out-of-bounds call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(100)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      expect(list.$_get(0)).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0400
     * @tc.name testArrayLikeGet040
     * @tc.desc Verify normal $_get access works after multiple out-of-bounds calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      const list: ArrayLike<double> = bytes
      for (let i = 0; i < 5; i++) {
        try {
          list.$_get(100 + i)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual('RangeError')
        }
      }
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0410
     * @tc.name testArrayLikeGet041
     * @tc.desc Verify $_get accepts short index with widening to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const list: ArrayLike<double> = bytes
      let idx: short = 2
      expect(list.$_get(idx)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0420
     * @tc.name testArrayLikeGet042
     * @tc.desc Verify $_get with byte boundary index 127 returns last byte element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(128)
      bytes[127] = 88
      const list: ArrayLike<double> = bytes
      expect(list.$_get(127)).assertEqual(88)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0430
     * @tc.name testArrayLikeGet043
     * @tc.desc Verify $_get with short max hex index 0x7F on in-range array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(0x80)
      bytes[0x7F] = 66
      const list: ArrayLike<double> = bytes
      expect(list.$_get(0x7F)).assertEqual(66)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0440
     * @tc.name testArrayLikeGet044
     * @tc.desc Verify $_get with index length-2 returns second-from-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30, 40, 50)
      const list: ArrayLike<int> = values
      expect(list.$_get(list.length - 2)).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0450
     * @tc.name testArrayLikeGet045
     * @tc.desc Verify $_get returns Unicode string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\u4e2d\u6587", "Test123 \u6d4b\u8bd5")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("\u4e2d\u6587")
      expect(list.$_get(1)).assertEqual("Test123 \u6d4b\u8bd5")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0460
     * @tc.name testArrayLikeGet046
     * @tc.desc Verify $_get returns empty and whitespace string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("", " ", "\t", "\n")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("")
      expect(list.$_get(1)).assertEqual(" ")
      expect(list.$_get(2)).assertEqual("\t")
      expect(list.$_get(3)).assertEqual("\n")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0470
     * @tc.name testArrayLikeGet047
     * @tc.desc Verify $_get returns emoji and special symbol string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\uD83D\uDE00", "—", "-")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("\uD83D\uDE00")
      expect(list.$_get(1)).assertEqual("—")
      expect(list.$_get(2)).assertEqual("-")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0480
     * @tc.name testArrayLikeGet048
     * @tc.desc Verify $_get returns boolean elements from ArrayLike<boolean>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<boolean>(true, false)
      const list: ArrayLike<boolean> = values
      expect(list.$_get(0)).assertEqual(true)
      expect(list.$_get(1)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0490
     * @tc.name testArrayLikeGet049
     * @tc.desc Verify $_get returns double boundary and business values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double>(0.0, -0.0, 999999.99, Double.MIN_VALUE)
      const list: ArrayLike<double> = values
      expect(list.$_get(0)).assertEqual(0.0)
      expect(list.$_get(1)).assertEqual(-0.0)
      expect(list.$_get(2)).assertEqual(999999.99)
      expect(list.$_get(3)).assertEqual(Double.MIN_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0500
     * @tc.name testArrayLikeGet050
     * @tc.desc Verify Int16Array as ArrayLike returns short boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array(2)
      i16[0] = -32768
      i16[1] = 32767
      const list: ArrayLike<double> = i16
      expect(list.$_get(0)).assertEqual(-32768)
      expect(list.$_get(1)).assertEqual(32767)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0510
     * @tc.name testArrayLikeGet051
     * @tc.desc Verify Uint32Array as ArrayLike returns unsigned int max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32 = new Uint32Array(1)
      u32[0] = 4294967295
      const list: ArrayLike<double> = u32
      expect(list.$_get(0)).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0520
     * @tc.name testArrayLikeGet052
     * @tc.desc Verify $_get with near-int-max index 2147483646 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(2147483646)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0530
     * @tc.name testArrayLikeGet053
     * @tc.desc Verify Float32Array returns Float.MIN_VALUE element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(1)
      f32[0] = Float.MIN_VALUE
      const list: ArrayLike<double> = f32
      expect(list.$_get(0)).assertEqual(Float.MIN_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0540
     * @tc.name testArrayLikeGet054
     * @tc.desc Verify $_get returns int boundary elements 0 and -1 from ArrayLike<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(0, -1, 1000000)
      const list: ArrayLike<int> = values
      expect(list.$_get(0)).assertEqual(0)
      expect(list.$_get(1)).assertEqual(-1)
      expect(list.$_get(2)).assertEqual(1000000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0550
     * @tc.name testArrayLikeGet055
     * @tc.desc Verify $_get with index -32768 throws RangeError on small array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(-32768)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0560
     * @tc.name testArrayLikeGet056
     * @tc.desc Verify $_get with octal index 077 on in-range array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(100)
      bytes[63] = 11
      const list: ArrayLike<double> = bytes
      expect(list.$_get(0o77)).assertEqual(11)
    });
  });
}
