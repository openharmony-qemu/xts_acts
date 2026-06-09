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

enum ArrayLikeGetLenStatusEnum {
  SUCCESS = 0,
  FAIL = 1
}

export default function ArrayLikeGetLenTest(): void {
  describe('ArrayLikeGetLenTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0010
     * @tc.name testArrayLikeGetLength001
     * @tc.desc Verify Array.from copy length matches ArrayLike length and $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<int> = new Array<int>(1, 2, 3)
      const copied = Array.from<int>(source)
      expect(source.length).assertEqual(3)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[2]).assertEqual(source.$_get(2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0020
     * @tc.name testArrayLikeGetLength002
     * @tc.desc Verify multi-element ArrayLike<long> length matches last $_get index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<long> = new Array<long>(100, 200, 300, 400)
      expect(source.length).assertEqual(4)
      expect(source.$_get(source.length - 1)).assertEqual(400)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0030
     * @tc.name testArrayLikeGetLength003
     * @tc.desc Verify length matches element count for different ArrayLike sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: ArrayLike<int> = new Array<int>(1, 2)
      const arr2: ArrayLike<int> = new Array<int>(10, 20, 30, 40, 50)
      expect(arr1.length).assertEqual(2)
      expect(arr2.length).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0040
     * @tc.name testArrayLikeGetLength004
     * @tc.desc Verify Array.from uses length to determine traversal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<int> = new Array<int>(4, 5, 6)
      const copied = Array.from<int>(source)
      expect(copied.length).assertEqual(3)
      expect(copied[0]).assertEqual(4)
      expect(copied[1]).assertEqual(5)
      expect(copied[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0050
     * @tc.name testArrayLikeGetLength005
     * @tc.desc Verify pop keeps length and $_get consistent with Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30, 40, 50)
      const source: ArrayLike<int> = arr
      expect(source.length).assertEqual(5)
      arr.pop()
      arr.pop()
      expect(source.length).assertEqual(3)
      expect(source.$_get(2)).assertEqual(30)
      expect(Array.from<int>(source).length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0060
     * @tc.name testArrayLikeGetLength006
     * @tc.desc Verify reading elements does not change ArrayLike length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<int> = new Array<int>(4, 5, 6)
      let before: int = source.length
      expect(before).assertEqual(3)
      expect(source.$_get(0)).assertEqual(4)
      expect(source.length).assertEqual(before)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0070
     * @tc.name testArrayLikeGetLength007
     * @tc.desc Verify ArrayLike<double> length returns correct Number element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<double> = new Array<double>(1.0, 2.0)
      expect(source.length).assertEqual(2)
      expect(source.$_get(0)).assertEqual(1.0)
      expect(source.$_get(1)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0080
     * @tc.name testArrayLikeGetLength008
     * @tc.desc Verify ArrayLike<Object> length returns correct Object element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new Object()
      const obj2 = new Object()
      const obj3 = new Object()
      const source: ArrayLike<Object> = new Array<Object>(obj1, obj2, obj3)
      expect(source.length).assertEqual(3)
      expect(source.$_get(0)).assertEqual(obj1)
      expect(source.$_get(2)).assertEqual(obj3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0090
     * @tc.name testArrayLikeGetLength009
     * @tc.desc Verify different generic ArrayLike objects return correct independent length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intArr: ArrayLike<int> = new Array<int>(1, 2)
      const strArr: ArrayLike<string> = new Array<string>("x", "y", "z")
      expect(intArr.length).assertEqual(2)
      expect(strArr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0100
     * @tc.name testArrayLikeGetLength010
     * @tc.desc Verify Uint8Array length and $_get(0) are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 99
      const source: ArrayLike<double> = bytes
      expect(source.length).assertEqual(3)
      expect(source.$_get(0)).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0110
     * @tc.name testArrayLikeGetLength011
     * @tc.desc Verify ArrayLike<boolean> length matches $_get accessible count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<boolean> = new Array<boolean>(true, false)
      expect(source.length).assertEqual(2)
      expect(source.$_get(0)).assertEqual(true)
      expect(source.$_get(1)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0120
     * @tc.name testArrayLikeGetLength012
     * @tc.desc Verify Int32Array length matches sequential $_get index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(3)
      i32[0] = 10
      i32[1] = 20
      i32[2] = 30
      const source: ArrayLike<double> = i32
      let len: int = source.length
      expect(len).assertEqual(3)
      for (let i = 0; i < len; i++) {
        expect(source.$_get(i)).assertEqual((i + 1) * 10)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0130
     * @tc.name testArrayLikeGetLength013
     * @tc.desc Verify Float32Array length and $_get return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f32 = new Float32Array(2)
      f32[0] = 3.14f
      f32[1] = -0.0f
      const source: ArrayLike<double> = f32
      expect(source.length).assertEqual(2)
      expect(source.$_get(0)).assertEqual(3.14f)
      expect(source.$_get(1)).assertEqual(-0.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0140
     * @tc.name testArrayLikeGetLength014
     * @tc.desc Verify ArrayLike<char> length and $_get are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<char> = new Array<char>(c'X', c'Y')
      expect(source.length).assertEqual(2)
      expect(source.$_get(1)).assertEqual(c'Y')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0150
     * @tc.name testArrayLikeGetLength015
     * @tc.desc Verify string ArrayLike length-1 index via $_get returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<string> = new Array<string>("first", "last")
      let lastIdx: int = source.length - 1
      expect(source.$_get(lastIdx)).assertEqual("last")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0160
     * @tc.name testArrayLikeGetLength016
     * @tc.desc Verify Int8Array length matches $_get index range 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i8 = new Int8Array(2)
      i8[0] = -128
      i8[1] = 127
      const source: ArrayLike<double> = i8
      expect(source.length).assertEqual(2)
      expect(source.$_get(0)).assertEqual(-128)
      expect(source.$_get(source.length - 1)).assertEqual(127)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0170
     * @tc.name testArrayLikeGetLength017
     * @tc.desc Verify ArrayLike<bigint> length and $_get last index are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<bigint> = new Array<bigint>(10n, 20n)
      expect(source.length).assertEqual(2)
      expect(source.$_get(source.length - 1)).assertEqual(20n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0180
     * @tc.name testArrayLikeGetLength018
     * @tc.desc Verify Uint16Array length and $_get return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u16 = new Uint16Array(2)
      u16[0] = 0
      u16[1] = 65535
      const source: ArrayLike<double> = u16
      expect(source.length).assertEqual(2)
      expect(source.$_get(1)).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0190
     * @tc.name testArrayLikeGetLength019
     * @tc.desc Verify ArrayLike<long> length and $_get are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<long> = new Array<long>(1000, 2000, 3000)
      expect(source.length).assertEqual(3)
      expect(source.$_get(2)).assertEqual(3000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0200
     * @tc.name testArrayLikeGetLength020
     * @tc.desc Verify ArrayLike<float> length matches $_get element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<float> = new Array<float>(0.5f, 1.5f, 2.5f)
      expect(source.length).assertEqual(3)
      expect(source.$_get(1)).assertEqual(1.5f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0210
     * @tc.name testArrayLikeGetLength021
     * @tc.desc Verify single-element ArrayLike length/2 index accesses first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<int> = new Array<int>(88)
      let idx: int = source.length / 2
      expect(source.length).assertEqual(1)
      expect(idx).assertEqual(0)
      expect(source.$_get(idx)).assertEqual(88)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0220
     * @tc.name testArrayLikeGetLength022
     * @tc.desc Verify Float64Array length and $_get return float element 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(1)
      f64[0] = 9.0
      const source: ArrayLike<double> = f64
      expect(source.length).assertEqual(1)
      expect(source.$_get(0)).assertEqual(9.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0230
     * @tc.name testArrayLikeGetLength023
     * @tc.desc Verify string ArrayLike length matches hex-format string element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<string> = new Array<string>("0x123", "0123", "0b1010")
      expect(source.length).assertEqual(3)
      expect(source.$_get(2)).assertEqual("0b1010")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0240
     * @tc.name testArrayLikeGetLength024
     * @tc.desc Verify Array.from long elements match ArrayLike $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<long> = new Array<long>(100, 200, 300)
      const copied = Array.from<long>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[2]).assertEqual(source.$_get(2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0250
     * @tc.name testArrayLikeGetLength025
     * @tc.desc Verify Array.from bigint elements match ArrayLike $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<bigint> = new Array<bigint>(10n, 20n)
      const copied = Array.from<bigint>(source)
      expect(copied.length).assertEqual(2)
      expect(copied[1]).assertEqual(source.$_get(1))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0260
     * @tc.name testArrayLikeGetLength026
     * @tc.desc Verify two-element ArrayLike length/2 index accesses last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<int> = new Array<int>(5, 9)
      let idx: int = source.length / 2
      expect(source.length).assertEqual(2)
      expect(source.$_get(idx)).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0270
     * @tc.name testArrayLikeGetLength027
     * @tc.desc Verify Int32Array default zeros match length and $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32 = new Int32Array(2)
      const source: ArrayLike<double> = i32
      expect(source.length).assertEqual(2)
      expect(source.$_get(0)).assertEqual(0)
      expect(source.$_get(1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0280
     * @tc.name testArrayLikeGetLength028
     * @tc.desc Verify custom ArrayLike length, $_get, and Array.from stay consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const custom = new CustomIntArrayLike(new Array<int>(11, 22, 33))
      const source: ArrayLike<int> = custom
      expect(source.length).assertEqual(3)
      expect(source.$_get(1)).assertEqual(22)
      const copied = Array.from<int>(source)
      expect(copied.length).assertEqual(source.length)
      for (let i = 0; i < source.length; i++) {
        expect(copied[i]).assertEqual(source.$_get(i))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0290
     * @tc.name testArrayLikeGetLength029
     * @tc.desc Verify Int16Array length, $_get, and Array.from stay consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i16 = new Int16Array(3)
      i16[0] = -100
      i16[1] = 0
      i16[2] = 32767
      const source: ArrayLike<double> = i16
      expect(source.length).assertEqual(3)
      expect(source.$_get(2)).assertEqual(32767)
      const copied = Array.from<double>(source)
      expect(copied.length).assertEqual(source.length)
      for (let i = 0; i < source.length; i++) {
        expect(copied[i]).assertEqual(source.$_get(i))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0300
     * @tc.name testArrayLikeGetLength030
     * @tc.desc Verify Uint32Array length, $_get, and Array.from stay consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32 = new Uint32Array(2)
      u32[0] = 0
      u32[1] = 4294967295
      const source: ArrayLike<double> = u32
      expect(source.length).assertEqual(2)
      expect(source.$_get(1)).assertEqual(4294967295)
      const copied = Array.from<double>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(source.$_get(1))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0310
     * @tc.name testArrayLikeGetLength031
     * @tc.desc Verify Array.from<boolean> copy matches ArrayLike length and $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<boolean> = new Array<boolean>(true, false, true)
      const copied = Array.from<boolean>(source)
      expect(copied.length).assertEqual(source.length)
      for (let i = 0; i < source.length; i++) {
        expect(copied[i]).assertEqual(source.$_get(i))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0320
     * @tc.name testArrayLikeGetLength032
     * @tc.desc Verify Array.from<char> copy matches ArrayLike length and $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<char> = new Array<char>(c'A', c'B', c'C')
      const copied = Array.from<char>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[2]).assertEqual(source.$_get(2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0330
     * @tc.name testArrayLikeGetLength033
     * @tc.desc Verify Array.from<Object> preserves references from ArrayLike $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj0 = new Object()
      const obj1 = new Object()
      const source: ArrayLike<Object> = new Array<Object>(obj0, obj1)
      const copied = Array.from<Object>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(source.$_get(1))
      expect(copied[0]).assertEqual(obj0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0340
     * @tc.name testArrayLikeGetLength034
     * @tc.desc Verify Array.from<float> copy matches ArrayLike length and $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<float> = new Array<float>(0.0f, 3.14f, -99.99f)
      const copied = Array.from<float>(source)
      expect(copied.length).assertEqual(source.length)
      for (let i = 0; i < source.length; i++) {
        expect(copied[i]).assertEqual(source.$_get(i))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0350
     * @tc.name testArrayLikeGetLength035
     * @tc.desc Verify Array.from<double> copy matches ArrayLike length and $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<double> = new Array<double>(0.0, 1.0e3, Double.MIN_VALUE)
      const copied = Array.from<double>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(1000.0)
      expect(copied[2]).assertEqual(source.$_get(2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0360
     * @tc.name testArrayLikeGetLength036
     * @tc.desc Verify Array.from<string> copy matches ArrayLike length and $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<string> = new Array<string>("", "\u4e2d\u6587", "13800138000")
      const copied = Array.from<string>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual("")
      expect(copied[1]).assertEqual(source.$_get(1))
      expect(copied[2]).assertEqual("13800138000")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0370
     * @tc.name testArrayLikeGetLength037
     * @tc.desc Verify Uint8Array length, $_get, and Array.from match API doc example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes = new Uint8Array(3)
      bytes[0] = 10
      bytes[1] = 20
      bytes[2] = 30
      const source: ArrayLike<double> = bytes
      expect(source.length).assertEqual(3)
      expect(source.$_get(1)).assertEqual(20)
      const copied = Array.from<double>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(10)
      expect(copied[1]).assertEqual(source.$_get(1))
      expect(copied[2]).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0380
     * @tc.name testArrayLikeGetLength038
     * @tc.desc Verify Float64Array NaN and Infinity elements survive Array.from copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64 = new Float64Array(2)
      f64[0] = Double.NaN
      f64[1] = Double.POSITIVE_INFINITY
      const source: ArrayLike<double> = f64
      expect(source.length).assertEqual(2)
      const copied = Array.from<double>(source)
      expect(copied.length).assertEqual(source.length)
      expect(isNaN(copied[0])).assertTrue()
      expect(isNaN(source.$_get(0))).assertTrue()
      expect(copied[1]).assertEqual(Double.POSITIVE_INFINITY)
      expect(copied[1]).assertEqual(source.$_get(1))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0390
     * @tc.name testArrayLikeGetLength039
     * @tc.desc Verify push keeps length, $_get, and Array.from consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30)
      const source: ArrayLike<int> = arr
      expect(source.length).assertEqual(3)
      arr.push(40, 50)
      expect(source.length).assertEqual(5)
      expect(source.$_get(4)).assertEqual(50)
      const copied = Array.from<int>(source)
      expect(copied.length).assertEqual(5)
      expect(copied[4]).assertEqual(source.$_get(4))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0400
     * @tc.name testArrayLikeGetLength040
     * @tc.desc Verify shift keeps length, $_get, and Array.from consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<int>(10, 20, 30, 40)
      const source: ArrayLike<int> = arr
      expect(source.length).assertEqual(4)
      arr.shift()
      arr.shift()
      expect(source.length).assertEqual(2)
      expect(source.$_get(0)).assertEqual(30)
      expect(source.$_get(1)).assertEqual(40)
      const copied = Array.from<int>(source)
      expect(copied.length).assertEqual(2)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(source.$_get(1))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0410
     * @tc.name testArrayLikeGetLength041
     * @tc.desc Verify Uint8ClampedArray length, $_get, and Array.from stay consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const clamped = new Uint8ClampedArray(3)
      clamped[0] = 300
      clamped[1] = 0
      clamped[2] = 200
      const source: ArrayLike<Number> = clamped
      expect(source.length).assertEqual(3)
      expect(source.$_get(0)).assertEqual(255)
      const copied = Array.from<Number>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[2]).assertEqual(source.$_get(2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAYLIKE_GET_LENGTH_0420
     * @tc.name testArrayLikeGetLength042
     * @tc.desc Verify enum ArrayLike length and Array.from copy preserve elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLikeGetLength042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<ArrayLikeGetLenStatusEnum>(
        ArrayLikeGetLenStatusEnum.SUCCESS,
        ArrayLikeGetLenStatusEnum.FAIL
      )
      const source: ArrayLike<ArrayLikeGetLenStatusEnum> = values
      expect(source.length).assertEqual(2)
      expect(source.$_get(1)).assertEqual(ArrayLikeGetLenStatusEnum.FAIL)
      const copied = Array.from<ArrayLikeGetLenStatusEnum>(source)
      expect(copied.length).assertEqual(source.length)
      expect(copied[0]).assertEqual(source.$_get(0))
      expect(copied[1]).assertEqual(source.$_get(1))
    });

  });
}
