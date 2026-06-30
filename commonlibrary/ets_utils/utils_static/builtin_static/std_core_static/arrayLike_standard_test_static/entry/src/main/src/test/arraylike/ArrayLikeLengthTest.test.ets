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
     * @tc.desc Verify length property on ArrayLike<string> backed by Array<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strArr = new Array<string>("a", "b", "c", "d")
      const strList: ArrayLike<string> = strArr
      expect(strList.length).assertEqual(4)
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
      const values = Array.create<int>(1, 99)
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
      bytes[127] = 33
      bytes[254] = 22
      const list: ArrayLike<double> = bytes
      let len = list.length
      expect(len).assertEqual(255)
      expect(list.$_get(0)).assertEqual(11)
      expect(list.$_get(127)).assertEqual(33)
      expect(list.$_get(len - 1)).assertEqual(22)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
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
      i32[2] = 30
      i32[4] = 50
      const list: ArrayLike<double> = i32
      let len = list.length
      expect(len).assertEqual(5)
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(2)).assertEqual(30)
      expect(list.$_get(len - 1)).assertEqual(50)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
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
      f32[1] = 2.0f
      f32[2] = 3.0f
      const list: ArrayLike<double> = f32
      let len = list.length
      expect(len).assertEqual(3)
      expect(list.$_get(0)).assertEqual(1.0f)
      expect(list.$_get(1)).assertEqual(2.0f)
      expect(list.$_get(len - 1)).assertEqual(3.0f)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
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
      u32[5] = 500
      u32[9] = 900
      const list: ArrayLike<double> = u32
      let len = list.length
      expect(len).assertEqual(10)
      expect(list.$_get(0)).assertEqual(100)
      expect(list.$_get(5)).assertEqual(500)
      expect(list.$_get(len - 1)).assertEqual(900)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
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
      const values = Array.create<int>(1, 7)
      const list: ArrayLike<int> = values
      expect(list.length).assertEqual(1)
      expect(list.length / 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0340
     * @tc.name testArrayLikeLength034
     * @tc.desc Verify three-element Uint32Array length and middle $_get are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32 = new Uint32Array(3)
      u32[0] = 7
      u32[1] = 8
      u32[2] = 9
      const list: ArrayLike<double> = u32
      let len = list.length
      expect(len).assertEqual(3)
      expect(list.$_get(0)).assertEqual(7)
      expect(list.$_get(1)).assertEqual(8)
      expect(list.$_get(len - 1)).assertEqual(9)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
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
      const list: ArrayLike<string> = Array.create<string>(1, hundredChars)
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
        expect(error.name).assertEqual('RangeError')
      }
      try {
        list[0]
        expect().assertFail()
      } catch (error) {
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
        expect(error.name).assertEqual('RangeError')
      }
      try {
        list[-1]
        expect().assertFail()
      } catch (error) {
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
      clamped[0] = 10
      clamped[1] = 128
      clamped[2] = 0
      clamped[3] = 255
      const list: ArrayLike<double> = clamped
      let len = list.length
      expect(len).assertEqual(4)
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertEqual(128)
      expect(list.$_get(2)).assertEqual(0)
      expect(list.$_get(len - 1)).assertEqual(255)
      try {
        list.$_get(len)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0450
     * @tc.name testArrayLikeLength045
     * @tc.desc Verify ArrayLike<string | null> length and $_get null slot are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<string | null>("a", null, "c")
      const list: ArrayLike<string | null> = values
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual("a")
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(list.length - 1)).assertEqual("c")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0460
     * @tc.name testArrayLikeLength046
     * @tc.desc Verify ArrayLike<int | null> length matches null element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | null>(100, null, 300)
      const list: ArrayLike<int | null> = values
      expect(list.length).assertEqual(3)
      expect(list.$_get(1)).assertEqual(null)
      for (let i = 0; i < list.length; i++) {
        expect(list.$_get(i)).assertEqual(values.$_get(i))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0470
     * @tc.name testArrayLikeLength047
     * @tc.desc Verify ArrayLike<int | null | undefined> length covers mixed nullish slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int | null | undefined>()
      arr.push(1)
      arr.push(null)
      arr.push(undefined)
      arr.push(4)
      const list: ArrayLike<int | null | undefined> = arr
      expect(list.length).assertEqual(4)
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
      expect(list.$_get(3)).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0480
     * @tc.name testArrayLikeLength048
     * @tc.desc Verify heterogeneous union ArrayLike length and $_get on each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | string | boolean | null>(1, "b", true, null)
      const list: ArrayLike<int | string | boolean | null> = values
      expect(list.length).assertEqual(4)
      expect(list.$_get(0)).assertEqual(1)
      expect(list.$_get(1)).assertEqual("b")
      expect(list.$_get(2)).assertEqual(true)
      expect(list.$_get(3)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0490
     * @tc.name testArrayLikeLength049
     * @tc.desc Verify union ArrayLike length includes explicit undefined element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<int | undefined>(10, undefined, 30)
      const list: ArrayLike<int | undefined> = values
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual(10)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0500
     * @tc.name testArrayLikeLength050
     * @tc.desc Verify ArrayLike<double | null | undefined> length and nullish $_get slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<double | null | undefined>()
      arr.push(3.3)
      arr.push(null)
      arr.push(undefined)
      const list: ArrayLike<double | null | undefined> = arr
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual(3.3)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0510
     * @tc.name testArrayLikeLength051
     * @tc.desc Verify ArrayLike<bigint | null> length matches bigint and null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<bigint | null>(5n, null, 15n)
      const list: ArrayLike<bigint | null> = values
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual(5n)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(list.length - 1)).assertEqual(15n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0520
     * @tc.name testArrayLikeLength052
     * @tc.desc Verify ArrayLike<long | null> length and $_get on null slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<long | null>(1000, null)
      const list: ArrayLike<long | null> = values
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(1000)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0530
     * @tc.name testArrayLikeLength053
     * @tc.desc Verify ArrayLike<char | null> length covers char and null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<char | null>(c'X', null)
      const list: ArrayLike<char | null> = values
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(c'X')
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0540
     * @tc.name testArrayLikeLength054
     * @tc.desc Verify ArrayLike<string | undefined> length includes explicit undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | undefined>()
      arr.push("first")
      arr.push(undefined)
      arr.push("last")
      const list: ArrayLike<string | undefined> = arr
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual("first")
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual("last")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0550
     * @tc.name testArrayLikeLength055
     * @tc.desc Verify ArrayLike<ArrayLikeLengthStatusEnum | undefined> length and undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeLengthStatusEnum | undefined>()
      arr.push(ArrayLikeLengthStatusEnum.SUCCESS)
      arr.push(undefined)
      arr.push(ArrayLikeLengthStatusEnum.FAIL)
      const list: ArrayLike<ArrayLikeLengthStatusEnum | undefined> = arr
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual(ArrayLikeLengthStatusEnum.SUCCESS)
      expect(list.$_get(1)).assertUndefined()
      expect(list.$_get(2)).assertEqual(ArrayLikeLengthStatusEnum.FAIL)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0560
     * @tc.name testArrayLikeLength056
     * @tc.desc Verify ArrayLike<Promise<int> | null> length and $_get on Promise slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promise = Promise.resolve(88)
      const values = new Array<Promise<int> | null>(promise, null)
      const list: ArrayLike<Promise<int> | null> = values
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(promise)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0570
     * @tc.name testArrayLikeLength057
     * @tc.desc Verify ArrayLike<Error | null> length and $_get preserve Error reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err = new Error("length")
      const values = new Array<Error | null>(err, null)
      const list: ArrayLike<Error | null> = values
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(err)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0580
     * @tc.name testArrayLikeLength058
     * @tc.desc Verify ArrayLike<boolean | null | undefined> length covers all nullish variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean | null | undefined>()
      arr.push(true)
      arr.push(null)
      arr.push(undefined)
      const list: ArrayLike<boolean | null | undefined> = arr
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual(true)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0590
     * @tc.name testArrayLikeLength059
     * @tc.desc Verify ArrayLike<Array<int> | null> length and nested array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<int>(8, 9)
      const values = new Array<Array<int> | null>(nested, null)
      const list: ArrayLike<Array<int> | null> = values
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(nested)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0600
     * @tc.name testArrayLikeLength060
     * @tc.desc Verify ArrayLike<Date | null> length and $_get on Date reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000)
      const values = new Array<Date | null>(date, null)
      const list: ArrayLike<Date | null> = values
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(date)
      expect(list.$_get(1)).assertEqual(null)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0610
     * @tc.name testArrayLikeLength061
     * @tc.desc Verify ArrayLike<Array<int> | undefined> length and undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<int>(7, 8)
      let arr = new Array<Array<int> | undefined>()
      arr.push(nested)
      arr.push(undefined)
      const list: ArrayLike<Array<int> | undefined> = arr
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(nested)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0620
     * @tc.name testArrayLikeLength062
     * @tc.desc Verify ArrayLike<RegExp | undefined> length and undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pattern = new RegExp('len')
      let arr = new Array<RegExp | undefined>()
      arr.push(pattern)
      arr.push(undefined)
      const list: ArrayLike<RegExp | undefined> = arr
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(pattern)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0630
     * @tc.name testArrayLikeLength063
     * @tc.desc Verify ArrayLike<Object | undefined> length and undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Object()
      let arr = new Array<Object | undefined>()
      arr.push(obj)
      arr.push(undefined)
      const list: ArrayLike<Object | undefined> = arr
      expect(list.length).assertEqual(2)
      expect(list.$_get(0)).assertEqual(obj)
      expect(list.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0640
     * @tc.name testArrayLikeLength064
     * @tc.desc Verify ArrayLike<ArrayLikeLengthStatusEnum | null | undefined> length and all nullish slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<ArrayLikeLengthStatusEnum | null | undefined>()
      arr.push(ArrayLikeLengthStatusEnum.SUCCESS)
      arr.push(null)
      arr.push(undefined)
      const list: ArrayLike<ArrayLikeLengthStatusEnum | null | undefined> = arr
      expect(list.length).assertEqual(3)
      expect(list.$_get(0)).assertEqual(ArrayLikeLengthStatusEnum.SUCCESS)
      expect(list.$_get(1)).assertEqual(null)
      expect(list.$_get(2)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_LENGTH_0650
     * @tc.name testArrayLikeLength065
     * @tc.desc Verify ArrayLike<double> length, $_get elements, and out-of-bounds access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeLength065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dblArr = new Array<double>(1.1, 2.2)
      const dblList: ArrayLike<double> = dblArr
      expect(dblList.length).assertEqual(2)
      expect(dblList.$_get(0)).assertEqual(1.1)
      expect(dblList.$_get(1)).assertEqual(2.2)
      try {
        dblList.$_get(2)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('RangeError')
      }
    });
  });
}
