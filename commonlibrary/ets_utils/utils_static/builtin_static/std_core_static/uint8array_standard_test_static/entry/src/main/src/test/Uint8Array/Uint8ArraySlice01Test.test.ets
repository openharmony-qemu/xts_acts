'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test'

export default function Uint8ArraySlice01Test(): void {
  describe('Uint8ArraySlice01Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0100
     * @tc.name testUint8ArraySlice001
     * @tc.desc Verify slice with no arguments returns a copy of the entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(1, 2, 3)
      const res: Uint8Array = src.slice()
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(1)
      expect(res[2]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0200
     * @tc.name testUint8ArraySlice002
     * @tc.desc Verify slice with only begin parameter slice(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(1, 2, 3)
      const res: Uint8Array = src.slice(2)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0300
     * @tc.name testUint8ArraySlice003
     * @tc.desc Verify slice with both begin and end parameters slice(1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5)
      const res: Uint8Array = src.slice(1, 4)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(2)
      expect(res[2]).assertEqual(4)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0400
     * @tc.name testUint8ArraySlice004
     * @tc.desc Verify slice with begin=0 returns all elements from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0500
     * @tc.name testUint8ArraySlice005
     * @tc.desc Verify slice with begin=1 returns elements from index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(1)
      expect(res.length).assertEqual(4)
      expect(res[0]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0600
     * @tc.name testUint8ArraySlice006
     * @tc.desc Verify slice with begin=3 returns elements from index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(3)
      expect(res.length).assertEqual(2)
      expect(res[0]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0700
     * @tc.name testUint8ArraySlice007
     * @tc.desc Verify slice with begin=4 returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(4)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0800
     * @tc.name testUint8ArraySlice008
     * @tc.desc Verify slice with begin=length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(5)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_0900
     * @tc.name testUint8ArraySlice009
     * @tc.desc Verify slice with begin greater than length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(6)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1000
     * @tc.name testUint8ArraySlice010
     * @tc.desc Verify slice with begin=100 large positive returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(100)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1100
     * @tc.name testUint8ArraySlice011
     * @tc.desc Verify slice with begin=-1 returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-1)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1200
     * @tc.name testUint8ArraySlice012
     * @tc.desc Verify slice with begin=-2 returns the last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-2)
      expect(res.length).assertEqual(2)
      expect(res[0]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1300
     * @tc.name testUint8ArraySlice013
     * @tc.desc Verify slice with begin=-3 returns the last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-3)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1400
     * @tc.name testUint8ArraySlice014
     * @tc.desc Verify slice with begin=-4 returns the last four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-4)
      expect(res.length).assertEqual(4)
      expect(res[0]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1500
     * @tc.name testUint8ArraySlice015
     * @tc.desc Verify slice with begin=-5 equals begin=0 returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-5)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1600
     * @tc.name testUint8ArraySlice016
     * @tc.desc Verify slice with begin=-6 less than -length clamps to 0 returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-6)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1700
     * @tc.name testUint8ArraySlice017
     * @tc.desc Verify slice with begin=-100 large negative clamps to 0 returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-100)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1800
     * @tc.name testUint8ArraySlice018
     * @tc.desc Verify slice with begin=0 on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const res: Uint8Array = src.slice(0)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_1900
     * @tc.name testUint8ArraySlice019
     * @tc.desc Verify slice with begin=0 on single-element array returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(99)
      const res: Uint8Array = src.slice(0)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(99)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2000
     * @tc.name testUint8ArraySlice020
     * @tc.desc Verify slice with begin=-1 on single-element array returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(99)
      const res: Uint8Array = src.slice(-1)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(99)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2100
     * @tc.name testUint8ArraySlice021
     * @tc.desc Verify slice with begin=-1 on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const res: Uint8Array = src.slice(-1)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2200
     * @tc.name testUint8ArraySlice022
     * @tc.desc Verify slice with begin=5 on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const res: Uint8Array = src.slice(5)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2300
     * @tc.name testUint8ArraySlice023
     * @tc.desc Verify slice with begin=-100 on empty array returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const res: Uint8Array = src.slice(-100)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2400
     * @tc.name testUint8ArraySlice024
     * @tc.desc Verify slice with begin=0x00 hex literal equals begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0x00)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2500
     * @tc.name testUint8ArraySlice025
     * @tc.desc Verify slice with begin=0b000 binary literal equals begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0b000)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2600
     * @tc.name testUint8ArraySlice026
     * @tc.desc Verify slice with begin=0o00 octal literal equals begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0o00)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2700
     * @tc.name testUint8ArraySlice027
     * @tc.desc Verify slice with end=0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 0)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2800
     * @tc.name testUint8ArraySlice028
     * @tc.desc Verify slice with end=1 returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 1)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_2900
     * @tc.name testUint8ArraySlice029
     * @tc.desc Verify slice with end=2 returns first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 2)
      expect(res.length).assertEqual(2)
      expect(res[0]).assertEqual(10)
      expect(res[1]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3000
     * @tc.name testUint8ArraySlice030
     * @tc.desc Verify slice with end=3 returns first three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 3)
      expect(res.length).assertEqual(3)
      expect(res[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3100
     * @tc.name testUint8ArraySlice031
     * @tc.desc Verify slice with end=4 returns first four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 4)
      expect(res.length).assertEqual(4)
      expect(res[3]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3200
     * @tc.name testUint8ArraySlice032
     * @tc.desc Verify slice with end=length returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 5)
      expect(res.length).assertEqual(5)
      expect(res[4]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3300
     * @tc.name testUint8ArraySlice033
     * @tc.desc Verify slice with end greater than length clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 6)
      expect(res.length).assertEqual(5)
      expect(res[4]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3400
     * @tc.name testUint8ArraySlice034
     * @tc.desc Verify slice with end=100 large positive clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 100)
      expect(res.length).assertEqual(5)
      expect(res[4]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3500
     * @tc.name testUint8ArraySlice035
     * @tc.desc Verify slice with end=-1 excludes the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -1)
      expect(res.length).assertEqual(4)
      expect(res[3]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3600
     * @tc.name testUint8ArraySlice036
     * @tc.desc Verify slice with end=-2 excludes the last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -2)
      expect(res.length).assertEqual(3)
      expect(res[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3700
     * @tc.name testUint8ArraySlice037
     * @tc.desc Verify slice with end=-3 excludes the last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -3)
      expect(res.length).assertEqual(2)
      expect(res[1]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3800
     * @tc.name testUint8ArraySlice038
     * @tc.desc Verify slice with end=-4 excludes the last four elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -4)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_3900
     * @tc.name testUint8ArraySlice039
     * @tc.desc Verify slice with end=-length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -5)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4000
     * @tc.name testUint8ArraySlice040
     * @tc.desc Verify slice with end less than -length clamps to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -6)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4100
     * @tc.name testUint8ArraySlice041
     * @tc.desc Verify slice with end=-100 large negative clamps to 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -100)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4200
     * @tc.name testUint8ArraySlice042
     * @tc.desc Verify slice with end less than begin (begin=1, end=0) returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(1, 0)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4300
     * @tc.name testUint8ArraySlice043
     * @tc.desc Verify slice with end less than begin (begin=3, end=1) returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(3, 1)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4400
     * @tc.name testUint8ArraySlice044
     * @tc.desc Verify slice with end equals begin returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(2, 2)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4500
     * @tc.name testUint8ArraySlice045
     * @tc.desc Verify slice with begin=1 and end=4 returns middle three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(1, 4)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(20)
      expect(res[2]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4600
     * @tc.name testUint8ArraySlice046
     * @tc.desc Verify slice with begin=2 and end=5 returns last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(2, 5)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(30)
      expect(res[2]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4700
     * @tc.name testUint8ArraySlice047
     * @tc.desc Verify slice with end=0x03 hex literal equals end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 0x03)
      expect(res.length).assertEqual(3)
      expect(res[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4800
     * @tc.name testUint8ArraySlice048
     * @tc.desc Verify slice with end=0b011 binary literal equals end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 0b011)
      expect(res.length).assertEqual(3)
      expect(res[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_4900
     * @tc.name testUint8ArraySlice049
     * @tc.desc Verify slice with end=0o03 octal literal equals end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 0o03)
      expect(res.length).assertEqual(3)
      expect(res[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5000
     * @tc.name testUint8ArraySlice050
     * @tc.desc Verify slice with begin=-4 and end=-1 returns middle three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-4, -1)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(20)
      expect(res[2]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5100
     * @tc.name testUint8ArraySlice051
     * @tc.desc Verify slice with begin=-5 and end=-2 excludes last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-5, -2)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(10)
      expect(res[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5200
     * @tc.name testUint8ArraySlice052
     * @tc.desc Verify slice with begin=-5 and end=-1 returns all except last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-5, -1)
      expect(res.length).assertEqual(4)
      expect(res[3]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5300
     * @tc.name testUint8ArraySlice053
     * @tc.desc Verify slice with begin=-2 and end=-5 (negative begin > negative end) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-2, -5)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5400
     * @tc.name testUint8ArraySlice054
     * @tc.desc Verify slice with begin=-3 and end=-3 (negative begin equals negative end) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-3, -3)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5500
     * @tc.name testUint8ArraySlice055
     * @tc.desc Verify slice with begin=-2 and end=-1 returns single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-2, -1)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5600
     * @tc.name testUint8ArraySlice056
     * @tc.desc Verify slice with begin=-3 and end=4 mixed negative/positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-3, 4)
      expect(res.length).assertEqual(2)
      expect(res[0]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5700
     * @tc.name testUint8ArraySlice057
     * @tc.desc Verify slice with begin=-4 and end=5 returns elements from index 1 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-4, 5)
      expect(res.length).assertEqual(4)
      expect(res[0]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5800
     * @tc.name testUint8ArraySlice058
     * @tc.desc Verify slice with begin=-5 and end=5 returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-5, 5)
      expect(res.length).assertEqual(5)
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_5900
     * @tc.name testUint8ArraySlice059
     * @tc.desc Verify slice with begin=-1 and end=0 (negative begin > positive end) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-1, 0)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6000
     * @tc.name testUint8ArraySlice060
     * @tc.desc Verify slice with begin=1 and end=-1 returns middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(1, -1)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(20)
      expect(res[2]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6100
     * @tc.name testUint8ArraySlice061
     * @tc.desc Verify slice with begin=2 and end=-2 returns middle single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(2, -2)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6200
     * @tc.name testUint8ArraySlice062
     * @tc.desc Verify slice with begin=3 and end=-3 (positive begin > effective end) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(3, -3)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6300
     * @tc.name testUint8ArraySlice063
     * @tc.desc Verify slice with begin=-4 and end=-0 (negative zero) equals slice(0,0) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-4, -0)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6400
     * @tc.name testUint8ArraySlice064
     * @tc.desc Verify slice with begin=0xFF hex literal returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0xFF)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6500
     * @tc.name testUint8ArraySlice065
     * @tc.desc Verify slice with begin=-0x01 hex negative equals slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-0x01)
      expect(res.length).assertEqual(1)
      expect(res[0]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6600
     * @tc.name testUint8ArraySlice066
     * @tc.desc Verify Uint8Array slice() result is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30)
      const res: Uint8Array = src.slice()
      expect(res).not().assertNull()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6700
     * @tc.name testUint8ArraySlice067
     * @tc.desc Verify slice() returns new array independent from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30)
      const res: Uint8Array = src.slice()
      src[0] = 99
      expect(res[0]).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6800
     * @tc.name testUint8ArraySlice068
     * @tc.desc Verify slice(1, 3) result length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(1, 3)
      expect(res.length).assertEqual(2)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_6900
     * @tc.name testUint8ArraySlice069
     * @tc.desc Verify slice(0, 5) length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, 5)
      expect(res.length).assertEqual(5)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7000
     * @tc.name testUint8ArraySlice070
     * @tc.desc Verify slice(-2) result length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-2)
      expect(res.length).assertEqual(2)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7100
     * @tc.name testUint8ArraySlice071
     * @tc.desc Verify slice(0, -2) result length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(0, -2)
      expect(res.length).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7200
     * @tc.name testUint8ArraySlice072
     * @tc.desc Verify slice(-5) length is 5 equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice(-5)
      expect(res.length).assertEqual(5)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7300
     * @tc.name testUint8ArraySlice073
     * @tc.desc Verify slice() values match source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50)
      const res: Uint8Array = src.slice()
      expect(res[0]).assertEqual(10)
      expect(res[4]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7400
     * @tc.name testUint8ArraySlice074
     * @tc.desc Verify slice with begin greater than length does not throw and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30)
      const res: Uint8Array = src.slice(100)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7500
     * @tc.name testUint8ArraySlice075
     * @tc.desc Verify slice(-100) does not throw and clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30)
      const res: Uint8Array = src.slice(-100)
      expect(res.length).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7600
     * @tc.name testUint8ArraySlice076
     * @tc.desc Verify slice(0, -100) does not throw and handles gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30)
      const res: Uint8Array = src.slice(0, -100)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7700
     * @tc.name testUint8ArraySlice077
     * @tc.desc Verify slice with begin > end does not throw and returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(10, 20, 30)
      const res: Uint8Array = src.slice(5, 2)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7800
     * @tc.name testUint8ArraySlice078
     * @tc.desc Verify slice on empty array does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const res: Uint8Array = src.slice(0, 0)
      expect(res.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_7900
     * @tc.name testUint8ArraySlice079
     * @tc.desc Verify slice copies boundary values 0, 127, 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 127, 255)
      const res: Uint8Array = src.slice()
      expect(res[0]).assertEqual(0)
      expect(res[1]).assertEqual(127)
      expect(res[2]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_8000
     * @tc.name testUint8ArraySlice080
     * @tc.desc Verify slice(0, 3) on all-zero array copies correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 0, 0)
      const res: Uint8Array = src.slice(0, 3)
      expect(res.length).assertEqual(3)
      expect(res[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_8100
     * @tc.name testUint8ArraySlice081
     * @tc.desc Verify slice(1, 3) on all-255 array copies correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(255, 255, 255, 255)
      const res: Uint8Array = src.slice(1, 3)
      expect(res.length).assertEqual(2)
      expect(res[0]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_8200
     * @tc.name testUint8ArraySlice082
     * @tc.desc Verify slice on same-value array correctly takes last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(42, 42, 42)
      const res: Uint8Array = src.slice(-2)
      expect(res.length).assertEqual(2)
      expect(res[0]).assertEqual(42)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_8300
     * @tc.name testUint8ArraySlice083
     * @tc.desc Verify slice() on array of 100 elements returns length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(100)
      for (let i: int = 0; i < 100; i++) {
        src[i] = i
      }
      const res: Uint8Array = src.slice()
      expect(res.length).assertEqual(100)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_8400
     * @tc.name testUint8ArraySlice084
     * @tc.desc Verify slice(50, 100) on large array returns second half
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(100)
      for (let i: int = 0; i < 100; i++) {
        src[i] = i
      }
      const res: Uint8Array = src.slice(50, 100)
      expect(res.length).assertEqual(50)
      expect(res[0]).assertEqual(50)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE01_8500
     * @tc.name testUint8ArraySlice085
     * @tc.desc Verify slice(-50) on large array returns last 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(100)
      for (let i: int = 0; i < 100; i++) {
        src[i] = i
      }
      const res: Uint8Array = src.slice(-50)
      expect(res.length).assertEqual(50)
      expect(res[0]).assertEqual(50)
    })
  })
}