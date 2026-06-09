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

enum ArrayLikeLengthStatusEnum {
  SUCCESS = 0,
  FAIL = 1,
  TIMEOUT = 2
}

export default function ArrayLikeLengthTest(): void {
  describe('ArrayLikeLengthTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0010
     * @tc.name testArrayLikeLength001
     * @tc.desc Verify length property readable via dot operator and assignable to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3)
      const list: ArrayLike<int> = values
      let len: int = list.length
      expect(len).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0020
     * @tc.name testArrayLikeLength002
     * @tc.desc Verify length property readable via variable reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = new Array<int>(10, 20, 30, 40)
      const list: ArrayLike<int> = arr
      let len = list.length
      expect(len).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0030
     * @tc.name testArrayLikeLength003
     * @tc.desc Verify ArrayLike length matches index iteration count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3)
      const list: ArrayLike<int> = values
      let count = 0
      for (let i = 0; i < list.length; i++) {
        expect(list.$_get(i)).assertEqual(values.$_get(i))
        count++
      }
      expect(count).assertEqual(3)
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0040
     * @tc.name testArrayLikeLength004
     * @tc.desc Verify empty ArrayLike length is 0 and Array.from produces empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>()
      const list: ArrayLike<int> = values
      expect(list.length).assertEqual(0)
      expect(Array.from<int>(list).length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0050
     * @tc.name testArrayLikeLength005
     * @tc.desc Verify length for different generic ArrayLike types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strArr = new Array<string>("a", "b", "c", "d")
      const strList: ArrayLike<string> = strArr
      expect(strList.length).assertEqual(4)

      const dblArr = new Array<double>(1.1, 2.2)
      const dblList: ArrayLike<double> = dblArr
      expect(dblList.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0060
     * @tc.name testArrayLikeLength006
     * @tc.desc Verify repeated length reads return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3)
      const list: ArrayLike<int> = values
      let len1 = list.length
      let len2 = list.length
      let len3 = list.length
      expect(len1).assertEqual(len2)
      expect(len2).assertEqual(len3)
      expect(len1).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0070
     * @tc.name testArrayLikeLength007
     * @tc.desc Verify length value matches upper bound of valid $_get index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3)
      const list: ArrayLike<int> = values
      let len: int = list.length
      expect(len).assertEqual(3)
      expect(list.$_get(len - 1)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0080
     * @tc.name testArrayLikeLength008
     * @tc.desc Verify first and last valid $_get indices via length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(10, 20, 30)
      const list: ArrayLike<int> = values
      let len = list.length
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(len - 1)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0090
     * @tc.name testArrayLikeLength009
     * @tc.desc Verify single-element ArrayLike length is 1 with index 0 valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(99)
      const list: ArrayLike<int> = values
      expect(list.length).assertEqual(1)
      expect(list.$_get(0)).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0100
     * @tc.name testArrayLikeLength010
     * @tc.desc Verify grown ArrayLike length matches index iteration count (100 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const targetLen = 100
      let largeArr = new Array<int>()
      for (let i = 0; i < targetLen; i++) {
        largeArr.push(i)
      }
      const list: ArrayLike<int> = largeArr
      let count = 0
      for (let i = 0; i < list.length; i++) {
        expect(list.$_get(i)).assertEqual(i)
        count++
      }
      expect(list.length).assertEqual(targetLen)
      expect(count).assertEqual(targetLen)
      expect(list.$_get(targetLen - 1)).assertEqual(targetLen - 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0110
     * @tc.name testArrayLikeLength011
     * @tc.desc Verify ArrayLike length with multiple undefined slots and $_get on each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | undefined>()
      arr.push(100)
      arr.push(undefined)
      arr.push(undefined)
      arr.push(300)
      const list: ArrayLike<int | undefined> = arr
      expect(list.length).assertEqual(4)
      expect(list.$_get(0)).assertEqual(100)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertUndefined()
      expect(list.$_get(3)).assertEqual(300)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0120
     * @tc.name testArrayLikeLength012
     * @tc.desc Verify index equal to length is out-of-bounds access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2, 3)
      const list: ArrayLike<int> = values
      let len = list.length
      try {
        let val = list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0130
     * @tc.name testArrayLikeLength013
     * @tc.desc Verify empty Array ArrayLike has length 0 and $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>()
      const list: ArrayLike<int> = values
      expect(list.length).assertEqual(0)
      try {
        list.$_get(0)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0140
     * @tc.name testArrayLikeLength014
     * @tc.desc Verify Uint8Array as ArrayLike length returns typed array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(255)
      bytes[0] = 11
      bytes[254] = 22
      const list: ArrayLike<double> = bytes
      let len = list.length
      expect(len).assertEqual(255)
      expect(list.$_get(0)).assertEqual(11)
      expect(list.$_get(len - 1)).assertEqual(22)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0150
     * @tc.name testArrayLikeLength015
     * @tc.desc Verify ArrayLike<boolean> length matches element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<boolean>(true, false, true)
      const list: ArrayLike<boolean> = values
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0160
     * @tc.name testArrayLikeLength016
     * @tc.desc Verify Float64Array as ArrayLike length returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(2)
      f64[0] = 1.5
      f64[1] = 2.5
      const list: ArrayLike<double> = f64
      let len = list.length
      expect(len).assertEqual(2)
      expect(list.$_get(0)).assertEqual(1.5)
      expect(list.$_get(len - 1)).assertEqual(2.5)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0170
     * @tc.name testArrayLikeLength017
     * @tc.desc Verify ArrayLike with Unicode string elements has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string>("\u4e2d\u6587", "\uD83D\uDE00", "")
      const list: ArrayLike<string> = values
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0180
     * @tc.name testArrayLikeLength018
     * @tc.desc Verify Int32Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(5)
      i32[0] = 10
      i32[4] = 50
      const list: ArrayLike<double> = i32
      let len = list.length
      expect(len).assertEqual(5)
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(len - 1)).assertEqual(50)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0190
     * @tc.name testArrayLikeLength019
     * @tc.desc Verify Float32Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(3)
      f32[0] = 1.0f
      f32[2] = 3.0f
      const list: ArrayLike<double> = f32
      let len = list.length
      expect(len).assertEqual(3)
      expect(list.$_get(0)).assertEqual(1.0f)
      expect(list.$_get(len - 1)).assertEqual(3.0f)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0200
     * @tc.name testArrayLikeLength020
     * @tc.desc Verify empty Int32Array as ArrayLike has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(0)
      const list: ArrayLike<double> = i32
      expect(list.length).assertEqual(0)
      try {
        list.$_get(0)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0210
     * @tc.name testArrayLikeLength021
     * @tc.desc Verify pop decreases ArrayLike length after prior growth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(0, 1, 2, 3, 4)
      const list: ArrayLike<int> = arr
      expect(list.length).assertEqual(5)
      arr.pop()
      arr.pop()
      expect(list.length).assertEqual(3)
      expect(list.$_get(2)).assertEqual(2)
      try {
        list.$_get(3)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0220
     * @tc.name testArrayLikeLength022
     * @tc.desc Verify ArrayLike<double> length matches double element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<double>(1.1, 2.2, 3.3)
      const list: ArrayLike<double> = values
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0230
     * @tc.name testArrayLikeLength023
     * @tc.desc Verify Int16Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array(4)
      i16[0] = 1
      i16[3] = 4
      const list: ArrayLike<double> = i16
      let len = list.length
      expect(len).assertEqual(4)
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(len - 1)).assertEqual(4)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0240
     * @tc.name testArrayLikeLength024
     * @tc.desc Verify ArrayLike<char> length matches char element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char>(c'a', c'b', c'c')
      const list: ArrayLike<char> = values
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0250
     * @tc.name testArrayLikeLength025
     * @tc.desc Verify ArrayLike<float> length matches float element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<float>(1.0f, 2.0f)
      const list: ArrayLike<float> = values
      expect(list.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0260
     * @tc.name testArrayLikeLength026
     * @tc.desc Verify Int8Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array(128)
      i8[0] = -1
      i8[127] = 127
      const list: ArrayLike<double> = i8
      let len = list.length
      expect(len).assertEqual(128)
      expect(list.$_get(0)).assertEqual(-1)
      expect(list.$_get(len - 1)).assertEqual(127)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0270
     * @tc.name testArrayLikeLength027
     * @tc.desc Verify empty Float32Array as ArrayLike has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(0)
      const list: ArrayLike<double> = f32
      expect(list.length).assertEqual(0)
      try {
        list.$_get(0)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0280
     * @tc.name testArrayLikeLength028
     * @tc.desc Verify ArrayLike<bigint> length matches bigint element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint>(1n, 2n, 3n)
      const list: ArrayLike<bigint> = values
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0290
     * @tc.name testArrayLikeLength029
     * @tc.desc Verify Uint32Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32 = new Uint32Array(10)
      u32[0] = 100
      u32[9] = 900
      const list: ArrayLike<double> = u32
      let len = list.length
      expect(len).assertEqual(10)
      expect(list.$_get(0)).assertEqual(100)
      expect(list.$_get(len - 1)).assertEqual(900)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0300
     * @tc.name testArrayLikeLength030
     * @tc.desc Verify Uint16Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array(65535)
      u16[0] = 1
      u16[65534] = 65534
      const list: ArrayLike<double> = u16
      let len = list.length
      expect(len).assertEqual(65535)
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(len - 1)).assertEqual(65534)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0310
     * @tc.name testArrayLikeLength031
     * @tc.desc Verify ArrayLike<long> length matches long element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long>(0, 1)
      const list: ArrayLike<long> = values
      expect(list.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0320
     * @tc.name testArrayLikeLength032
     * @tc.desc Verify empty Int16Array as ArrayLike has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array(0)
      const list: ArrayLike<double> = i16
      let len: int = list.length
      expect(len).assertEqual(0)
      expect(list.length).assertEqual(len)
      try {
        list.$_get(0)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0330
     * @tc.name testArrayLikeLength033
     * @tc.desc Verify single-element length 1 and int division length/2 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(7)
      const list: ArrayLike<int> = values
      expect(list.length).assertEqual(1)
      expect(list.length / 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0340
     * @tc.name testArrayLikeLength034
     * @tc.desc Verify Uint32Array as ArrayLike length returns element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32 = new Uint32Array(3)
      u32[0] = 7
      u32[2] = 9
      const list: ArrayLike<double> = u32
      let len = list.length
      expect(len).assertEqual(3)
      expect(list.$_get(0)).assertEqual(7)
      expect(list.$_get(len - 1)).assertEqual(9)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0350
     * @tc.name testArrayLikeLength035
     * @tc.desc Verify empty Uint8Array as ArrayLike has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(0)
      const list: ArrayLike<double> = bytes
      expect(list.length).assertEqual(0)
      try {
        list.$_get(0)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0360
     * @tc.name testArrayLikeLength036
     * @tc.desc Verify two-element ArrayLike length 2 and length/2 equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int>(1, 2)
      const list: ArrayLike<int> = values
      expect(list.length).assertEqual(2)
      expect(list.length / 2).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0370
     * @tc.name testArrayLikeLength037
     * @tc.desc Verify uninitialized Int32Array as ArrayLike has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3)
      i32[0] = 11
      i32[2] = 33
      const list: ArrayLike<double> = i32
      let len = list.length
      expect(len).assertEqual(3)
      expect(list.$_get(0)).assertEqual(11)
      expect(list.$_get(len - 1)).assertEqual(33)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0380
     * @tc.name testArrayLikeLength038
     * @tc.desc Verify hundred-character string ArrayLike has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredChars = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"
      const list: ArrayLike<string> = new Array<string>(hundredChars)
      expect(list.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0390
     * @tc.name testArrayLikeLength039
     * @tc.desc Verify custom ArrayLike length matches backing storage and bounds $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(7, 8, 9, 10))
      const list: ArrayLike<int> = custom
      expect(list.length).assertEqual(4)
      expect(list.$_get(0)).assertEqual(7)
      expect(list.$_get(list.length - 1)).assertEqual(10)
      try {
        list.$_get(list.length)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0400
     * @tc.name testArrayLikeLength040
     * @tc.desc Verify length-1000 ArrayLike Array.from copy length and last $_get index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const targetLen = 1000
      let largeArr = new Array<int>()
      for (let i = 0; i < targetLen; i++) {
        largeArr.push(i)
      }
      const list: ArrayLike<int> = largeArr
      expect(list.length).assertEqual(targetLen)
      expect(list.$_get(targetLen - 1)).assertEqual(targetLen - 1)
      const copied = Array.from<int>(list)
      expect(copied.length).assertEqual(targetLen)
      expect(copied[targetLen - 1]).assertEqual(list.$_get(targetLen - 1))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0410
     * @tc.name testArrayLikeLength041
     * @tc.desc Verify empty custom ArrayLike length 0 and $_get(0) or bracket [0] throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>())
      const list: ArrayLike<int> = custom
      expect(list.length).assertEqual(0)
      try {
        list.$_get(0)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
      try {
        list[0]
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0420
     * @tc.name testArrayLikeLength042
     * @tc.desc Verify custom ArrayLike $_get(-1) or bracket [-1] throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(1, 2, 3))
      const list: ArrayLike<int> = custom
      try {
        list.$_get(-1)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
      try {
        list[-1]
        expect().assertFail()
      } catch (error) {
        expect(error instanceof RangeError).assertTrue()
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0430
     * @tc.name testArrayLikeLength043
     * @tc.desc Verify ArrayLike with enum elements reports correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeLengthStatusEnum>(
        ArrayLikeLengthStatusEnum.SUCCESS,
        ArrayLikeLengthStatusEnum.FAIL,
        ArrayLikeLengthStatusEnum.TIMEOUT
      )
      const list: ArrayLike<ArrayLikeLengthStatusEnum> = values
      expect(list.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0440
     * @tc.name testArrayLikeLength044
     * @tc.desc Verify Uint8ClampedArray as ArrayLike reports correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const clamped = new Uint8ClampedArray(4)
      const list: ArrayLike<Number> = clamped
      expect(list.length).assertEqual(4)
    });

  });
}

