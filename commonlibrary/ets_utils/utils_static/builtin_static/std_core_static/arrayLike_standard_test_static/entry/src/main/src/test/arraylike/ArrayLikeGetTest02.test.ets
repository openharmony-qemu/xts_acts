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
import { CustomIntArrayLike } from './CustomArrayLike';

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

export default function ArrayLikeGetTest02(): void {
  describe('ArrayLikeGetTest02', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0570
     * @tc.name testArrayLikeGet057
     * @tc.desc Verify $_get returns Object elements from ArrayLike<Object>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj0 = new Object()
      const obj1 = new Object()
      const values = new Array<Object>(obj0, obj1)
      const list: ArrayLike<Object> = values
      expect(list.$_get(0)).assertEqual(obj0)
      expect(list.$_get(1)).assertEqual(obj1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0580
     * @tc.name testArrayLikeGet058
     * @tc.desc Verify $_get returns float elements from ArrayLike<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<float>(1.5f, -99.99f, 0.0f)
      const list: ArrayLike<float> = values
      expect(list.$_get(0)).assertEqual(1.5f)
      expect(list.$_get(1)).assertEqual(-99.99f)
      expect(list.$_get(2)).assertEqual(0.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0590
     * @tc.name testArrayLikeGet059
     * @tc.desc Verify $_get returns business-format string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("13800138000", "test@example.com", "2026-03-05")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("13800138000")
      expect(list.$_get(1)).assertEqual("test@example.com")
      expect(list.$_get(2)).assertEqual("2026-03-05")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0600
     * @tc.name testArrayLikeGet060
     * @tc.desc Verify $_get returns carriage-return and CRLF string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\r", "\r\n", "line\r\nbreak")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("\r")
      expect(list.$_get(1)).assertEqual("\r\n")
      expect(list.$_get(2)).assertEqual("line\r\nbreak")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0610
     * @tc.name testArrayLikeGet061
     * @tc.desc Verify Float32Array NaN element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(1)
      f32[0] = Float.NaN
      const list: ArrayLike<double> = f32
      expect(isNaN(list.$_get(0))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0620
     * @tc.name testArrayLikeGet062
     * @tc.desc Verify Float32Array positive Infinity element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(1)
      f32[0] = Float.POSITIVE_INFINITY
      const list: ArrayLike<double> = f32
      expect(list.$_get(0)).assertEqual(Float.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0630
     * @tc.name testArrayLikeGet063
     * @tc.desc Verify $_get with hex index 0xFF on length-256 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(256)
      bytes[0xFF] = 42
      const list: ArrayLike<double> = bytes
      expect(list.$_get(0xFF)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0640
     * @tc.name testArrayLikeGet064
     * @tc.desc Verify $_get with index -128 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(-128)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0650
     * @tc.name testArrayLikeGet065
     * @tc.desc Verify Float32Array scientific notation element via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(1)
      f32[0] = 1.0e3f
      const list: ArrayLike<double> = f32
      expect(list.$_get(0)).assertEqual(1000.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0660
     * @tc.name testArrayLikeGet066
     * @tc.desc Verify $_get with short max index 32767 throws RangeError on small array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(32767)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0670
     * @tc.name testArrayLikeGet067
     * @tc.desc Verify $_get traverses all indices with byte loop variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(5)
      bytes[0] = 1
      bytes[1] = 2
      bytes[2] = 3
      bytes[3] = 4
      bytes[4] = 5
      const list: ArrayLike<double> = bytes
      for (let i: byte = 0; i < 5; i++) {
        expect(list.$_get(i)).assertEqual(i + 1)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0680
     * @tc.name testArrayLikeGet068
     * @tc.desc Verify $_get returns multilanguage mixed string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("テスト", "테스트", "Test 測試", "АБВГД")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("テスト")
      expect(list.$_get(1)).assertEqual("테스트")
      expect(list.$_get(2)).assertEqual("Test 測試")
      expect(list.$_get(3)).assertEqual("АБВГД")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0690
     * @tc.name testArrayLikeGet069
     * @tc.desc Verify $_get returns Float32 negative Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(1)
      f32[0] = Float.NEGATIVE_INFINITY
      const list: ArrayLike<double> = f32
      expect(list.$_get(0)).assertEqual(Float.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0700
     * @tc.name testArrayLikeGet070
     * @tc.desc Verify $_get returns char elements from ArrayLike<char>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char>(c'A', c'0', c'\u4e2d')
      const list: ArrayLike<char> = values
      expect(list.$_get(0)).assertEqual(c'A')
      expect(list.$_get(1)).assertEqual(c'0')
      expect(list.$_get(2)).assertEqual(c'\u4e2d')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0710
     * @tc.name testArrayLikeGet071
     * @tc.desc Verify $_get accepts int enum index via enumeration-to-numeric conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30)
      const list: ArrayLike<int> = values
      expect(list.$_get(ArrayLikeGetIndexEnum.FIRST)).assertEqual(10)
      expect(list.$_get(ArrayLikeGetIndexEnum.MID)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0720
     * @tc.name testArrayLikeGet072
     * @tc.desc Verify $_get traverses indices with short loop variable widening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(100, 200, 300)
      const list: ArrayLike<int> = values
      for (let i: short = 0; i < 3; i++) {
        expect(list.$_get(i)).assertEqual((i + 1) * 100)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0730
     * @tc.name testArrayLikeGet073
     * @tc.desc Verify $_get returns int enum elements from ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeStatusEnum>(
        ArrayLikeStatusEnum.SUCCESS,
        ArrayLikeStatusEnum.FAIL,
        ArrayLikeStatusEnum.TIMEOUT
      )
      const list: ArrayLike<ArrayLikeStatusEnum> = values
      expect(list.$_get(0)).assertEqual(ArrayLikeStatusEnum.SUCCESS)
      expect(list.$_get(1)).assertEqual(ArrayLikeStatusEnum.FAIL)
      expect(list.$_get(2)).assertEqual(ArrayLikeStatusEnum.TIMEOUT)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0740
     * @tc.name testArrayLikeGet074
     * @tc.desc Verify $_get returns Int8Array hex and signed boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array(3)
      i8[0] = 0x0A
      i8[1] = -1
      i8[2] = 127
      const list: ArrayLike<double> = i8
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertEqual(-1)
      expect(list.$_get(2)).assertEqual(127)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0750
     * @tc.name testArrayLikeGet075
     * @tc.desc Verify $_get returns special-character and hex-format string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("!@#$%^&*()", "0x123", "0b1010")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("!@#$%^&*()")
      expect(list.$_get(1)).assertEqual("0x123")
      expect(list.$_get(2)).assertEqual("0b1010")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0760
     * @tc.name testArrayLikeGet076
     * @tc.desc Verify $_get with int expression index 1+1 returns third element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3, 4)
      const list: ArrayLike<int> = values
      expect(list.$_get(1 + 1)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0770
     * @tc.name testArrayLikeGet077
     * @tc.desc Verify $_get returns bigint elements from ArrayLike<bigint>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint>(0n, 1n, 9223372036854775807n)
      const list: ArrayLike<bigint> = values
      expect(list.$_get(0)).assertEqual(0n)
      expect(list.$_get(1)).assertEqual(1n)
      expect(list.$_get(2)).assertEqual(9223372036854775807n)
    });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0780
     * @tc.name testArrayLikeGet078
     * @tc.desc Verify $_get with index -32767 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(-32767)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0790
     * @tc.name testArrayLikeGet079
     * @tc.desc Verify $_get returns string enum elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeStringEnum>(
        ArrayLikeStringEnum.OK,
        ArrayLikeStringEnum.ERR
      )
      const list: ArrayLike<ArrayLikeStringEnum> = values
      expect(list.$_get(0)).assertEqual(ArrayLikeStringEnum.OK)
      expect(list.$_get(1)).assertEqual(ArrayLikeStringEnum.ERR)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0800
     * @tc.name testArrayLikeGet080
     * @tc.desc Verify $_get with int division index length/2 returns middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30, 40, 50)
      const list: ArrayLike<int> = values
      let mid: int = list.length / 2
      expect(mid).assertEqual(2)
      expect(list.$_get(mid)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0810
     * @tc.name testArrayLikeGet081
     * @tc.desc Verify $_get returns char boundary elements null char and max char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char>(c'\u0000', c'\uffff')
      const list: ArrayLike<char> = values
      expect(list.$_get(0)).assertEqual(c'\u0000')
      expect(list.$_get(1)).assertEqual(c'\uffff')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0820
     * @tc.name testArrayLikeGet082
     * @tc.desc Verify $_get returns zero-width space string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\u200B", "visible")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual("\u200B")
      expect(list.$_get(1)).assertEqual("visible")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0830
     * @tc.name testArrayLikeGet083
     * @tc.desc Verify $_get returns long elements from ArrayLike<long>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long>(100, 9223372036854775806)
      const list: ArrayLike<long> = values
      expect(list.$_get(0)).assertEqual(100)
      expect(list.$_get(1)).assertEqual(9223372036854775806)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0840
     * @tc.name testArrayLikeGet084
     * @tc.desc Verify $_get returns bigint min and max boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint>(-9223372036854775808n, 9223372036854775807n)
      const list: ArrayLike<bigint> = values
      expect(list.$_get(0)).assertEqual(-9223372036854775808n)
      expect(list.$_get(1)).assertEqual(9223372036854775807n)
    });

        /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0850
     * @tc.name testArrayLikeGet085
     * @tc.desc Verify $_get returns Uint16Array max unsigned short element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array(1)
      u16[0] = 65535
      const list: ArrayLike<double> = u16
      expect(list.$_get(0)).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0860
     * @tc.name testArrayLikeGet086
     * @tc.desc Verify $_get returns Array Number wrapper int boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double>(2147483647, -2147483648)
      const list: ArrayLike<double> = values
      expect(list.$_get(0)).assertEqual(2147483647)
      expect(list.$_get(1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0870
     * @tc.name testArrayLikeGet087
     * @tc.desc Verify $_get with index 2*1+0 (evaluates to 2) returns third element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(99, 100, 101)
      const list: ArrayLike<int> = values
      expect(list.$_get(2 * 1 + 0)).assertEqual(101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0880
     * @tc.name testArrayLikeGet088
     * @tc.desc Verify $_get with length/2 index 0 on single-element array via int division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(42)
      const list: ArrayLike<int> = values
      let idx: int = list.length / 2
      expect(idx).assertEqual(0)
      expect(list.$_get(idx)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0890
     * @tc.name testArrayLikeGet089
     * @tc.desc Verify $_get returns Float64Array decimal and scientific notation elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(2)
      f64[0] = 9.0
      f64[1] = 1.0e6
      const list: ArrayLike<double> = f64
      expect(list.$_get(0)).assertEqual(9.0)
      expect(list.$_get(1)).assertEqual(1000000.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0900
     * @tc.name testArrayLikeGet090
     * @tc.desc Verify $_get reads back Int32Array elements assigned via hex octal binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3)
      i32[0] = 0x1234
      i32[1] = 0o123
      i32[2] = 0b1010
      const list: ArrayLike<double> = i32
      expect(list.$_get(0)).assertEqual(0x1234)
      expect(list.$_get(1)).assertEqual(83)
      expect(list.$_get(2)).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0910
     * @tc.name testArrayLikeGet091
     * @tc.desc Verify $_get returns escaped backslash string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>(" 测试 \\ 转义符", "\\n", "\\\\")
      const list: ArrayLike<string> = values
      expect(list.$_get(0)).assertEqual(" 测试 \\ 转义符")
      expect(list.$_get(1)).assertEqual("\\n")
      expect(list.$_get(2)).assertEqual("\\\\")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0920
     * @tc.name testArrayLikeGet092
     * @tc.desc Verify $_get returns long min and max boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long>(-9223372036854775808, 9223372036854775807)
      const list: ArrayLike<long> = values
      expect(list.$_get(0)).assertEqual(-9223372036854775808)
      expect(list.$_get(1)).assertEqual(9223372036854775807)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0930
     * @tc.name testArrayLikeGet093
     * @tc.desc Verify $_get with int enum index on three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(111, 222, 333)
      const list: ArrayLike<int> = values
      expect(list.$_get(ArrayLikeGetIndexEnum.FIRST)).assertEqual(111)
      expect(list.$_get(ArrayLikeGetIndexEnum.MID)).assertEqual(333)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0940
     * @tc.name testArrayLikeGet094
     * @tc.desc Verify $_get returns double scientific notation 1.0e3 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double>(1.0e3, -888.88)
      const list: ArrayLike<double> = values
      expect(list.$_get(0)).assertEqual(1000.0)
      expect(list.$_get(1)).assertEqual(-888.88)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0950
     * @tc.name testArrayLikeGet095
     * @tc.desc Verify $_get with length/2 index 1 on two-element array via int division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20)
      const list: ArrayLike<int> = values
      let idx: int = list.length / 2
      expect(idx).assertEqual(1)
      expect(list.$_get(idx)).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0960
     * @tc.name testArrayLikeGet096
     * @tc.desc Verify $_get returns default zero elements from uninitialized Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3)
      const list: ArrayLike<double> = i32
      expect(list.$_get(0)).assertEqual(0)
      expect(list.$_get(1)).assertEqual(0)
      expect(list.$_get(2)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0970
     * @tc.name testArrayLikeGet097
     * @tc.desc Verify $_get returns double enum elements from ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeScoreEnum>(
        ArrayLikeScoreEnum.LOW,
        ArrayLikeScoreEnum.HIGH
      )
      const list: ArrayLike<ArrayLikeScoreEnum> = values
      expect(list.$_get(0)).assertEqual(ArrayLikeScoreEnum.LOW)
      expect(list.$_get(1)).assertEqual(ArrayLikeScoreEnum.HIGH)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0980
     * @tc.name testArrayLikeGet098
     * @tc.desc Verify $_get returns Float32 negative zero and Float.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(2)
      f32[0] = -0.0f
      f32[1] = Float.MAX_VALUE
      const list: ArrayLike<double> = f32
      expect(list.$_get(0)).assertEqual(-0.0f)
      expect(list.$_get(1)).assertEqual(Float.MAX_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_0990
     * @tc.name testArrayLikeGet099
     * @tc.desc Verify $_get returns hundred-character string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredChars = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"
      const values = new Array<string>(hundredChars)
      const list: ArrayLike<string> = values
      expect(list.$_get(0).length).assertEqual(100)
      expect(list.$_get(0)).assertEqual(hundredChars)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1000
     * @tc.name testArrayLikeGet100
     * @tc.desc Verify Array.from string elements match ArrayLike $_get results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<string> = new Array<string>("a", "\u4e2d", "z")
      const copied = Array.from<string>(source)
      expect(copied.length).assertEqual(source.length)
      for (let i = 0; i < source.length; i++) {
        expect(copied[i]).assertEqual(source.$_get(i))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1010
     * @tc.name testArrayLikeGet101
     * @tc.desc Verify Array.from Number elements match TypedArray $_get results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 1
      bytes[1] = 2
      bytes[2] = 3
      const source: ArrayLike<double> = bytes
      const copied = Array.from<double>(source)
      expect(copied.length).assertEqual(3)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(source.$_get(1))
      expect(copied[2]).assertEqual(source.$_get(2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1020
     * @tc.name testArrayLikeGet102
     * @tc.desc Verify $_get returns undefined for explicit undefined element slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | undefined>()
      arr.push(10)
      arr.push(undefined)
      arr.push(30)
      const list: ArrayLike<int | undefined> = arr
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1030
     * @tc.name testArrayLikeGet103
     * @tc.desc Verify $_get with index 65535 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      const list: ArrayLike<double> = bytes
      try {
        list.$_get(65535)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1040
     * @tc.name testArrayLikeGet104
     * @tc.desc Verify custom ArrayLike $_get returns elements and throws RangeError when OOB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(100, 200, 300))
      const list: ArrayLike<int> = custom
      expect(list.$_get(0)).assertEqual(100)
      expect(list.$_get(1)).assertEqual(200)
      expect(list.$_get(2)).assertEqual(300)
      try {
        list.$_get(3)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1050
     * @tc.name testArrayLikeGet105
     * @tc.desc Verify bracket index on Array<int> ArrayLike desugars to $_get and returns same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30)
      const list: ArrayLike<int> = values
      expect(list[0]).assertEqual(list.$_get(0))
      expect(list[1]).assertEqual(list.$_get(1))
      expect(list[2]).assertEqual(list.$_get(2))
      expect(list[0]).assertEqual(10)
      expect(list[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1060
     * @tc.name testArrayLikeGet106
     * @tc.desc Verify out-of-bounds bracket index on Array<int> ArrayLike (incl. runtime negative) and $_get throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: ArrayLike<int> = new Array<int>(1, 2, 3)
      try {
        list[3]
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      try {
        list.$_get(3)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      let negIndex: int = 1
      negIndex = negIndex - 2
      try {
        list[negIndex]
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      try {
        list.$_get(-1)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1070
     * @tc.name testArrayLikeGet107
     * @tc.desc Verify bracket index on custom ArrayLike desugars to $_get for valid indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(100, 200, 300))
      const customList: ArrayLike<int> = custom
      expect(customList[0]).assertEqual(customList.$_get(0))
      expect(customList[1]).assertEqual(customList.$_get(1))
      expect(customList[2]).assertEqual(customList.$_get(2))
      expect(customList[0]).assertEqual(100)
      expect(customList[2]).assertEqual(300)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1080
     * @tc.name testArrayLikeGet108
     * @tc.desc Verify $_get returns long numeric string element unchanged from ArrayLike<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const idCard = "310101199001011234"
      const list: ArrayLike<string> = new Array<string>(idCard)
      expect(list.$_get(0)).assertEqual(idCard)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1090
     * @tc.name testArrayLikeGet109
     * @tc.desc Verify $_get returns HTML string element unchanged from ArrayLike<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xss = "<script>alert(1)</script>"
      const list: ArrayLike<string> = new Array<string>(xss)
      expect(list.$_get(0)).assertEqual(xss)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1100
     * @tc.name testArrayLikeGet110
     * @tc.desc Verify $_get returns double element 123.456 from ArrayLike<double>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: ArrayLike<double> = new Array<double>(123.456)
      expect(list.$_get(0)).assertEqual(123.456)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1110
     * @tc.name testArrayLikeGet111
     * @tc.desc Verify $_get returns null and empty string elements from ArrayLike<string | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string | null>("visible", null, "")
      const list: ArrayLike<string | null> = values
      expect(list.$_get(0)).assertEqual("visible")
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1120
     * @tc.name testArrayLikeGet112
     * @tc.desc Verify $_get accepts long index converted via toInt for ArrayLike access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 11
      bytes[1] = 22
      bytes[2] = 33
      const list: ArrayLike<double> = bytes
      let idx: long = 1
      expect(list.$_get(idx.toInt())).assertEqual(22)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1130
     * @tc.name testArrayLikeGet113
     * @tc.desc Verify $_get returns clamped Uint8ClampedArray element as ArrayLike<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const clamped = new Uint8ClampedArray(2)
      clamped[0] = 300
      clamped[1] = 128
      const list: ArrayLike<Number> = clamped
      expect(list.$_get(0)).assertEqual(255)
      expect(list.$_get(1)).assertEqual(128)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1140
     * @tc.name testArrayLikeGet114
     * @tc.desc Verify $_get returns null element from ArrayLike<int | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | null>(1, null, 3)
      const list: ArrayLike<int | null> = values
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1150
     * @tc.name testArrayLikeGet115
     * @tc.desc Verify $_get returns undefined element from ArrayLike<string | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | undefined>()
      arr.push("head")
      arr.push(undefined)
      arr.push("tail")
      const list: ArrayLike<string | undefined> = arr
      expect(list.$_get(0)).assertEqual("head")
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual("tail")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1160
     * @tc.name testArrayLikeGet116
     * @tc.desc Verify $_get returns null and undefined from ArrayLike<int | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | null | undefined>()
      arr.push(10)
      arr.push(null)
      arr.push(undefined)
      arr.push(40)
      const list: ArrayLike<int | null | undefined> = arr
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
      expect(list.$_get(3)).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1170
     * @tc.name testArrayLikeGet117
     * @tc.desc Verify $_get returns int and string elements from ArrayLike<int | string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | string>(42, "text", 0)
      const list: ArrayLike<int | string> = values
      expect(list.$_get(0)).assertEqual(42)
      expect(list.$_get(1)).assertEqual("text")
      expect(list.$_get(2)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1180
     * @tc.name testArrayLikeGet118
     * @tc.desc Verify $_get returns heterogeneous union elements int string boolean null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | string | boolean | null>(1, "a", true, null)
      const list: ArrayLike<int | string | boolean | null> = values
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(1)).assertEqual("a")
      expect(list.$_get(2)).assertEqual(true)
      expect(list.$_get(3)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1190
     * @tc.name testArrayLikeGet119
     * @tc.desc Verify $_get returns undefined for explicit undefined element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | undefined>(1, undefined, 3)
      const list: ArrayLike<int | undefined> = values
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1200
     * @tc.name testArrayLikeGet120
     * @tc.desc Verify $_get returns null element from ArrayLike<boolean | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<boolean | null>(true, null, false)
      const list: ArrayLike<boolean | null> = values
      expect(list.$_get(0)).assertEqual(true)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1210
     * @tc.name testArrayLikeGet121
     * @tc.desc Verify $_get returns Object and null from ArrayLike<Object | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object()
      const values = new Array<Object | null>(obj, null)
      const list: ArrayLike<Object | null> = values
      expect(list.$_get(0)).assertEqual(obj)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1220
     * @tc.name testArrayLikeGet122
     * @tc.desc Verify bracket index on ArrayLike<int | null | undefined> matches $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | null | undefined>()
      arr.push(5)
      arr.push(null)
      arr.push(undefined)
      const list: ArrayLike<int | null | undefined> = arr
      expect(list[0]).assertEqual(list.$_get(0))
      expect(list[1]).assertEqual(list.$_get(1))
      expect(list[2]).assertEqual(list.$_get(2))
      expect(list[0]).assertEqual(5)
      expect(list[1]).assertEqual(null)
      expect(list[2]).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1230
     * @tc.name testArrayLikeGet123
     * @tc.desc Verify Array.from preserves null and undefined from union ArrayLike elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | null | undefined>()
      arr.push(1)
      arr.push(null)
      arr.push(undefined)
      const source: ArrayLike<int | null | undefined> = arr
      const copied = Array.from<int | null | undefined>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(source.$_get(1))
      expect(copied[2]).assertEqual(source.$_get(2))
      expect(copied[1]).assertEqual(null)
      expect(copied[2]).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1240
     * @tc.name testArrayLikeGet124
     * @tc.desc Verify $_get returns double null and undefined from ArrayLike<double | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<double | null | undefined>()
      arr.push(1.5)
      arr.push(null)
      arr.push(undefined)
      arr.push(-0.0)
      const list: ArrayLike<double | null | undefined> = arr
      expect(list.$_get(0)).assertEqual(1.5)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
      expect(list.$_get(3)).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1250
     * @tc.name testArrayLikeGet125
     * @tc.desc Verify $_get returns bigint and null from ArrayLike<bigint | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint | null>(100n, null, 9223372036854775807n)
      const list: ArrayLike<bigint | null> = values
      expect(list.$_get(0)).assertEqual(100n)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(9223372036854775807n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1260
     * @tc.name testArrayLikeGet126
     * @tc.desc Verify $_get returns bigint null and undefined from ArrayLike<bigint | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint | null | undefined>()
      arr.push(0n)
      arr.push(null)
      arr.push(undefined)
      const list: ArrayLike<bigint | null | undefined> = arr
      expect(list.$_get(0)).assertEqual(0n)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1270
     * @tc.name testArrayLikeGet127
     * @tc.desc Verify $_get returns float and undefined from ArrayLike<float | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<float | undefined>()
      arr.push(3.14f)
      arr.push(undefined)
      arr.push(-99.99f)
      const list: ArrayLike<float | undefined> = arr
      expect(list.$_get(0)).assertEqual(3.14f)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(-99.99f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1280
     * @tc.name testArrayLikeGet128
     * @tc.desc Verify $_get returns long and null from ArrayLike<long | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long | null>(100, null, 9223372036854775806)
      const list: ArrayLike<long | null> = values
      expect(list.$_get(0)).assertEqual(100)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(9223372036854775806)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1290
     * @tc.name testArrayLikeGet129
     * @tc.desc Verify $_get returns char and null from ArrayLike<char | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char | null>(c'A', null, c'\u4e2d')
      const list: ArrayLike<char | null> = values
      expect(list.$_get(0)).assertEqual(c'A')
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(c'\u4e2d')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1300
     * @tc.name testArrayLikeGet130
     * @tc.desc Verify $_get returns string int and null from ArrayLike<string | int | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string | int | null>("id", 42, null)
      const list: ArrayLike<string | int | null> = values
      expect(list.$_get(0)).assertEqual("id")
      expect(list.$_get(1)).assertEqual(42)
      expect(list.$_get(2)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1310
     * @tc.name testArrayLikeGet131
     * @tc.desc Verify $_get returns double and string from ArrayLike<double | string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double | string>(9.9, "nine", 0.0)
      const list: ArrayLike<double | string> = values
      expect(list.$_get(0)).assertEqual(9.9)
      expect(list.$_get(1)).assertEqual("nine")
      expect(list.$_get(2)).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1320
     * @tc.name testArrayLikeGet132
     * @tc.desc Verify $_get returns enum and null from ArrayLike<ArrayLikeStatusEnum | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeStatusEnum | null>(
        ArrayLikeStatusEnum.SUCCESS,
        null,
        ArrayLikeStatusEnum.TIMEOUT
      )
      const list: ArrayLike<ArrayLikeStatusEnum | null> = values
      expect(list.$_get(0)).assertEqual(ArrayLikeStatusEnum.SUCCESS)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(ArrayLikeStatusEnum.TIMEOUT)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1330
     * @tc.name testArrayLikeGet133
     * @tc.desc Verify $_get returns enum and undefined from ArrayLike<ArrayLikeStatusEnum | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeStatusEnum | undefined>()
      arr.push(ArrayLikeStatusEnum.SUCCESS)
      arr.push(undefined)
      arr.push(ArrayLikeStatusEnum.FAIL)
      const list: ArrayLike<ArrayLikeStatusEnum | undefined> = arr
      expect(list.$_get(0)).assertEqual(ArrayLikeStatusEnum.SUCCESS)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(ArrayLikeStatusEnum.FAIL)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1340
     * @tc.name testArrayLikeGet134
     * @tc.desc Verify $_get returns string enum and undefined from ArrayLike<ArrayLikeStringEnum | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeStringEnum | undefined>()
      arr.push(ArrayLikeStringEnum.OK)
      arr.push(undefined)
      arr.push(ArrayLikeStringEnum.ERR)
      const list: ArrayLike<ArrayLikeStringEnum | undefined> = arr
      expect(list.$_get(0)).assertEqual(ArrayLikeStringEnum.OK)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(ArrayLikeStringEnum.ERR)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1350
     * @tc.name testArrayLikeGet135
     * @tc.desc Verify $_get returns double enum and null from ArrayLike<ArrayLikeScoreEnum | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeScoreEnum | null>(
        ArrayLikeScoreEnum.LOW,
        null,
        ArrayLikeScoreEnum.HIGH
      )
      const list: ArrayLike<ArrayLikeScoreEnum | null> = values
      expect(list.$_get(0)).assertEqual(ArrayLikeScoreEnum.LOW)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertEqual(ArrayLikeScoreEnum.HIGH)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1360
     * @tc.name testArrayLikeGet136
     * @tc.desc Verify $_get returns Promise and null from ArrayLike<Promise<int> | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise = Promise.resolve(42)
      const values = new Array<Promise<int> | null>(promise, null)
      const list: ArrayLike<Promise<int> | null> = values
      expect(list.$_get(0)).assertEqual(promise)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1370
     * @tc.name testArrayLikeGet137
     * @tc.desc Verify $_get returns Promise and undefined from ArrayLike<Promise<int> | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise = Promise.resolve(7)
      let arr = new Array<Promise<int> | undefined>()
      arr.push(promise)
      arr.push(undefined)
      const list: ArrayLike<Promise<int> | undefined> = arr
      expect(list.$_get(0)).assertEqual(promise)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1380
     * @tc.name testArrayLikeGet138
     * @tc.desc Verify $_get returns Error and null from ArrayLike<Error | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("test")
      const values = new Array<Error | null>(err, null)
      const list: ArrayLike<Error | null> = values
      expect(list.$_get(0)).assertEqual(err)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1390
     * @tc.name testArrayLikeGet139
     * @tc.desc Verify $_get returns RegExp and null from ArrayLike<RegExp | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pattern = new RegExp('abc', 'g')
      const values = new Array<RegExp | null>(pattern, null)
      const list: ArrayLike<RegExp | null> = values
      expect(list.$_get(0)).assertEqual(pattern)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1400
     * @tc.name testArrayLikeGet140
     * @tc.desc Verify $_get returns boolean null and undefined from ArrayLike<boolean | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean | null | undefined>()
      arr.push(true)
      arr.push(null)
      arr.push(undefined)
      arr.push(false)
      const list: ArrayLike<boolean | null | undefined> = arr
      expect(list.$_get(0)).assertEqual(true)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
      expect(list.$_get(3)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1410
     * @tc.name testArrayLikeGet141
     * @tc.desc Verify $_get returns callable function and null from ArrayLike<(() => int) | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): int => { return 99 }
      const values = new Array<(() => int) | null>(fn, null)
      const list: ArrayLike<(() => int) | null> = values
      const got = list.$_get(0)
      expect(got).assertEqual(fn)
      if (got != null) {
        expect(got()).assertEqual(99)
      }
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1420
     * @tc.name testArrayLikeGet142
     * @tc.desc Verify $_get returns nested Array and null from ArrayLike<Array<int> | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<int>(1, 2, 3)
      const values = new Array<Array<int> | null>(nested, null)
      const list: ArrayLike<Array<int> | null> = values
      expect(list.$_get(0)).assertEqual(nested)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1430
     * @tc.name testArrayLikeGet143
     * @tc.desc Verify $_get returns Date and null from ArrayLike<Date | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000)
      const values = new Array<Date | null>(date, null)
      const list: ArrayLike<Date | null> = values
      expect(list.$_get(0)).assertEqual(date)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1440
     * @tc.name testArrayLikeGet144
     * @tc.desc Verify $_get returns Date and undefined from ArrayLike<Date | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0)
      let arr = new Array<Date | undefined>()
      arr.push(date)
      arr.push(undefined)
      const list: ArrayLike<Date | undefined> = arr
      expect(list.$_get(0)).assertEqual(date)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1450
     * @tc.name testArrayLikeGet145
     * @tc.desc Verify $_get returns nested Array and undefined from ArrayLike<Array<int> | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<int>(4, 5, 6)
      let arr = new Array<Array<int> | undefined>()
      arr.push(nested)
      arr.push(undefined)
      const list: ArrayLike<Array<int> | undefined> = arr
      expect(list.$_get(0)).assertEqual(nested)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1460
     * @tc.name testArrayLikeGet146
     * @tc.desc Verify $_get returns RegExp and undefined from ArrayLike<RegExp | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pattern = new RegExp('test')
      let arr = new Array<RegExp | undefined>()
      arr.push(pattern)
      arr.push(undefined)
      const list: ArrayLike<RegExp | undefined> = arr
      expect(list.$_get(0)).assertEqual(pattern)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1470
     * @tc.name testArrayLikeGet147
     * @tc.desc Verify $_get returns Error and undefined from ArrayLike<Error | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("undef")
      let arr = new Array<Error | undefined>()
      arr.push(err)
      arr.push(undefined)
      const list: ArrayLike<Error | undefined> = arr
      expect(list.$_get(0)).assertEqual(err)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1480
     * @tc.name testArrayLikeGet148
     * @tc.desc Verify $_get returns Object and undefined from ArrayLike<Object | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object()
      let arr = new Array<Object | undefined>()
      arr.push(obj)
      arr.push(undefined)
      const list: ArrayLike<Object | undefined> = arr
      expect(list.$_get(0)).assertEqual(obj)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1490
     * @tc.name testArrayLikeGet149
     * @tc.desc Verify $_get returns bigint and undefined from ArrayLike<bigint | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint | undefined>()
      arr.push(99n)
      arr.push(undefined)
      arr.push(100n)
      const list: ArrayLike<bigint | undefined> = arr
      expect(list.$_get(0)).assertEqual(99n)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(100n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1500
     * @tc.name testArrayLikeGet150
     * @tc.desc Verify $_get returns long and undefined from ArrayLike<long | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<long | undefined>()
      arr.push(500)
      arr.push(undefined)
      const list: ArrayLike<long | undefined> = arr
      expect(list.$_get(0)).assertEqual(500)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1510
     * @tc.name testArrayLikeGet151
     * @tc.desc Verify $_get returns enum null and undefined from ArrayLike<ArrayLikeStatusEnum | null | undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeStatusEnum | null | undefined>()
      arr.push(ArrayLikeStatusEnum.SUCCESS)
      arr.push(null)
      arr.push(undefined)
      arr.push(ArrayLikeStatusEnum.TIMEOUT)
      const list: ArrayLike<ArrayLikeStatusEnum | null | undefined> = arr
      expect(list.$_get(0)).assertEqual(ArrayLikeStatusEnum.SUCCESS)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
      expect(list.$_get(3)).assertEqual(ArrayLikeStatusEnum.TIMEOUT)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1520
     * @tc.name testArrayLikeGet152
     * @tc.desc Verify $_get returns Date string and null from ArrayLike<Date | string | null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1234567890000)
      const values = new Array<Date | string | null>(date, "2026-06-10", null)
      const list: ArrayLike<Date | string | null> = values
      expect(list.$_get(0)).assertEqual(date)
      expect(list.$_get(1)).assertEqual("2026-06-10")
      expect(list.$_get(2)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1530
     * @tc.name testArrayLikeGet153
     * @tc.desc Verify bracket index on Uint8Array ArrayLike desugars to $_get and returns same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const typed: ArrayLike<double> = bytes
      expect(typed[1]).assertEqual(typed.$_get(1))
      expect(typed[1]).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1540
     * @tc.name testArrayLikeGet154
     * @tc.desc Verify out-of-bounds bracket index on Uint8Array ArrayLike (incl. runtime negative) and $_get throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const typed: ArrayLike<double> = bytes
      let negIndex: int = 1
      negIndex = negIndex - 2
      try {
        typed[negIndex]
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      try {
        typed.$_get(-1)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_1550
     * @tc.name testArrayLikeGet155
     * @tc.desc Verify out-of-bounds bracket index on custom ArrayLike (incl. negative) and $_get throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGet155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(5, 6))
      const customList: ArrayLike<int> = custom
      try {
        customList[2]
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      try {
        customList.$_get(2)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      try {
        customList[-1]
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
      try {
        customList.$_get(-1)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });
  });
}
