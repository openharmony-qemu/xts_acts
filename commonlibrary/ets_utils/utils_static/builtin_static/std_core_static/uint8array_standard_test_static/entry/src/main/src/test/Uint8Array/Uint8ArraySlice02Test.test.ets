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

export default function Uint8ArraySlice02Test(): void {
  describe('Uint8ArraySlice02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0100
     * @tc.name testUint8ArraySlice001
     * @tc.desc Verify slice() on non-empty array returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice()
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0200
     * @tc.name testUint8ArraySlice002
     * @tc.desc Verify slice(0) returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0)
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0300
     * @tc.name testUint8ArraySlice003
     * @tc.desc Verify slice(0, length) returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, src.length)
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0400
     * @tc.name testUint8ArraySlice004
     * @tc.desc Verify slice(-length) with negative full-length returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-10)
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0500
     * @tc.name testUint8ArraySlice005
     * @tc.desc Verify slice(-3, -1) with negative index range returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-3, -1)
      expect(result.length).assertEqual(2)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0600
     * @tc.name testUint8ArraySlice006
     * @tc.desc Verify slice() on empty array returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const result: Uint8Array = src.slice()
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0700
     * @tc.name testUint8ArraySlice007
     * @tc.desc Verify slice(begin > end) with empty result returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(7, 3)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0800
     * @tc.name testUint8ArraySlice008
     * @tc.desc Verify slice(out-of-bounds begin) with empty result returns Uint8Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(100)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_0900
     * @tc.name testUint8ArraySlice009
     * @tc.desc Verify slice() full copy contains all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice()
      expect(result[0]).assertEqual(0)
      expect(result[9]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1000
     * @tc.name testUint8ArraySlice010
     * @tc.desc Verify slice(0) content matches original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0)
      expect(result[3]).assertEqual(3)
      expect(result[7]).assertEqual(7)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1100
     * @tc.name testUint8ArraySlice011
     * @tc.desc Verify slice(1) from index 1 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(1)
      expect(result[0]).assertEqual(1)
      expect(result[8]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1200
     * @tc.name testUint8ArraySlice012
     * @tc.desc Verify slice(0, 4) first 4 elements correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 4)
      expect(result[0]).assertEqual(0)
      expect(result[3]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1300
     * @tc.name testUint8ArraySlice013
     * @tc.desc Verify slice(3, 7) middle segment elements correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(3, 7)
      expect(result[0]).assertEqual(3)
      expect(result[3]).assertEqual(6)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1400
     * @tc.name testUint8ArraySlice014
     * @tc.desc Verify slice(-3) last 3 elements correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-3)
      expect(result[0]).assertEqual(7)
      expect(result[2]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1500
     * @tc.name testUint8ArraySlice015
     * @tc.desc Verify slice(-6, -2) negative index range elements correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-6, -2)
      expect(result[0]).assertEqual(4)
      expect(result[3]).assertEqual(7)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1600
     * @tc.name testUint8ArraySlice016
     * @tc.desc Verify slice(0, -3) removing last 3 elements correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, -3)
      expect(result[0]).assertEqual(0)
      expect(result[6]).assertEqual(6)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1700
     * @tc.name testUint8ArraySlice017
     * @tc.desc Verify slice(0, 1) contains only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 1)
      expect(result[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1800
     * @tc.name testUint8ArraySlice018
     * @tc.desc Verify slice(length-2, length) last 2 elements only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(8, 10)
      expect(result[0]).assertEqual(8)
      expect(result[1]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_1900
     * @tc.name testUint8ArraySlice019
     * @tc.desc Verify slice preserves uint8 boundary values 0/128/255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 128, 255)
      const result: Uint8Array = src.slice(0, 3)
      expect(result[0]).assertEqual(0)
      expect(result[2]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2000
     * @tc.name testUint8ArraySlice020
     * @tc.desc Verify slice preserves hex literals 0x80/0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0x00, 0x7F, 0x80, 0xFF)
      const result: Uint8Array = src.slice(1, 4)
      expect(result[0]).assertEqual(0x7F)
      expect(result[2]).assertEqual(0xFF)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2100
     * @tc.name testUint8ArraySlice021
     * @tc.desc Verify slice on single-element array returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(42)
      const result: Uint8Array = src.slice(0, 1)
      expect(result[0]).assertEqual(42)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2200
     * @tc.name testUint8ArraySlice022
     * @tc.desc Verify slice on two-element array returns correct elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(100, 200)
      const result: Uint8Array = src.slice(0, 2)
      expect(result[0]).assertEqual(100)
      expect(result[1]).assertEqual(200)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2300
     * @tc.name testUint8ArraySlice023
     * @tc.desc Verify slice(2, length) offset index alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(2, src.length)
      expect(result[0]).assertEqual(2)
      expect(result[7]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2400
     * @tc.name testUint8ArraySlice024
     * @tc.desc Verify slice(-length) negative full copy matches original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-10)
      expect(result[0]).assertEqual(0)
      expect(result[9]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2500
     * @tc.name testUint8ArraySlice025
     * @tc.desc Verify slice(100) out-of-bounds begin returns empty array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(100)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2600
     * @tc.name testUint8ArraySlice026
     * @tc.desc Verify slice(-100) negative out-of-bounds begin clamped to 0 full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-100)
      expect(result[0]).assertEqual(0)
      expect(result[9]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2700
     * @tc.name testUint8ArraySlice027
     * @tc.desc Verify slice(0, 0) zero range empty result length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 0)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2800
     * @tc.name testUint8ArraySlice028
     * @tc.desc Verify slice(5, 3) begin > end empty result length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(5, 3)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_2900
     * @tc.name testUint8ArraySlice029
     * @tc.desc Verify slice(length, length+5) end out-of-bounds empty result length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(10, 15)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3000
     * @tc.name testUint8ArraySlice030
     * @tc.desc Verify slice(length-1, length) returns last single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(9, 10)
      expect(result[0]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3100
     * @tc.name testUint8ArraySlice031
     * @tc.desc Verify slice includes uint8 max value 255 as element content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(255, 254, 253)
      const result: Uint8Array = src.slice(0, 2)
      expect(result[0]).assertEqual(255)
      expect(result[1]).assertEqual(254)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3200
     * @tc.name testUint8ArraySlice032
     * @tc.desc Verify slice mixed min 0 and max 255 correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 255, 128, 0, 255)
      const result: Uint8Array = src.slice(1, 4)
      expect(result[0]).assertEqual(255)
      expect(result[2]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3300
     * @tc.name testUint8ArraySlice033
     * @tc.desc Verify slice(0, 2) on hex sequence order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0x00, 0x01, 0x02, 0x03, 0x04)
      const result: Uint8Array = src.slice(0, 2)
      expect(result[0]).assertEqual(0x00)
      expect(result[1]).assertEqual(0x01)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3400
     * @tc.name testUint8ArraySlice034
     * @tc.desc Verify slice with element value 0 correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(3)
      src[0] = 0
      src[1] = 0
      src[2] = 0
      const result: Uint8Array = src.slice(0, 3)
      expect(result[0]).assertEqual(0)
      expect(result[2]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3500
     * @tc.name testUint8ArraySlice035
     * @tc.desc Verify slice includes mid value 127 correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(127, 128)
      const result: Uint8Array = src.slice()
      expect(result[0]).assertEqual(127)
      expect(result[1]).assertEqual(128)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3600
     * @tc.name testUint8ArraySlice036
     * @tc.desc Verify slice(1, length) from index 1 single positive index copy complete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(5, 10, 15, 20, 25)
      const result: Uint8Array = src.slice(1, src.length)
      expect(result[0]).assertEqual(10)
      expect(result[3]).assertEqual(25)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3700
     * @tc.name testUint8ArraySlice037
     * @tc.desc Verify slice() length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice()
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3800
     * @tc.name testUint8ArraySlice038
     * @tc.desc Verify slice(0) length equals original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0)
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_3900
     * @tc.name testUint8ArraySlice039
     * @tc.desc Verify slice(3) length is original length minus 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(3)
      expect(result.length).assertEqual(7)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4000
     * @tc.name testUint8ArraySlice040
     * @tc.desc Verify slice(0, 7) length is 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 7)
      expect(result.length).assertEqual(7)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4100
     * @tc.name testUint8ArraySlice041
     * @tc.desc Verify slice(-4) negative index length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-4)
      expect(result.length).assertEqual(4)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4200
     * @tc.name testUint8ArraySlice042
     * @tc.desc Verify slice(0, -3) negative end length is original minus 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, -3)
      expect(result.length).assertEqual(7)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4300
     * @tc.name testUint8ArraySlice043
     * @tc.desc Verify slice(-100) negative out-of-bounds begin clamped length equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-100)
      expect(result.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4400
     * @tc.name testUint8ArraySlice044
     * @tc.desc Verify slice() on empty array length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array()
      const result: Uint8Array = src.slice()
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4500
     * @tc.name testUint8ArraySlice045
     * @tc.desc Verify slice(length, length) length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(10, 10)
      expect(result.length).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4600
     * @tc.name testUint8ArraySlice046
     * @tc.desc Verify slice() byteLength equals original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice()
      expect(result.byteLength).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4700
     * @tc.name testUint8ArraySlice047
     * @tc.desc Verify slice(0, 5) byteLength is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 5)
      expect(result.byteLength).assertEqual(5)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4800
     * @tc.name testUint8ArraySlice048
     * @tc.desc Verify slice(4) byteLength is original minus 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(4)
      expect(result.byteLength).assertEqual(6)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_4900
     * @tc.name testUint8ArraySlice049
     * @tc.desc Verify slice(-3) negative index byteLength is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-3)
      expect(result.byteLength).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5000
     * @tc.name testUint8ArraySlice050
     * @tc.desc Verify slice(0, 0) empty result byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 0)
      expect(result.byteLength).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5100
     * @tc.name testUint8ArraySlice051
     * @tc.desc Verify slice(-100) negative out-of-bounds begin byteLength equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-100)
      expect(result.byteLength).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5200
     * @tc.name testUint8ArraySlice052
     * @tc.desc Verify slice(begin > end) empty result byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(7, 2)
      expect(result.byteLength).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5300
     * @tc.name testUint8ArraySlice053
     * @tc.desc Verify slice() does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice()
      expect(src.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5400
     * @tc.name testUint8ArraySlice054
     * @tc.desc Verify slice(0, 4) does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 4)
      expect(src.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5500
     * @tc.name testUint8ArraySlice055
     * @tc.desc Verify slice(3, 7) does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(3, 7)
      expect(src[0]).assertEqual(0)
      expect(src[9]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5600
     * @tc.name testUint8ArraySlice056
     * @tc.desc Verify slice(-3) does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-3)
      expect(src.length).assertEqual(10)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5700
     * @tc.name testUint8ArraySlice057
     * @tc.desc Verify slice(0, -3) does not modify original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, -3)
      expect(src[7]).assertEqual(7)
      expect(src[9]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5800
     * @tc.name testUint8ArraySlice058
     * @tc.desc Verify slice(100) out-of-bounds does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(100)
      expect(src.length).assertEqual(10)
      expect(src[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_5900
     * @tc.name testUint8ArraySlice059
     * @tc.desc Verify slice(7, 3) begin > end does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(7, 3)
      expect(src.length).assertEqual(10)
      expect(src[5]).assertEqual(5)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6000
     * @tc.name testUint8ArraySlice060
     * @tc.desc Verify slice(-100) negative out-of-bounds does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-100)
      expect(src.length).assertEqual(10)
      expect(src[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6100
     * @tc.name testUint8ArraySlice061
     * @tc.desc Verify slice(0, 0) zero range does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 0)
      expect(src.length).assertEqual(10)
      expect(src[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6200
     * @tc.name testUint8ArraySlice062
     * @tc.desc Verify slice() result buffer is not the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice()
      expect(result.buffer !== src.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6300
     * @tc.name testUint8ArraySlice063
     * @tc.desc Verify slice(0) result buffer is not the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0)
      expect(result.buffer !== src.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6400
     * @tc.name testUint8ArraySlice064
     * @tc.desc Verify slice(0, length) result buffer is not the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, src.length)
      expect(result.buffer !== src.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6500
     * @tc.name testUint8ArraySlice065
     * @tc.desc Verify slice(2, 5) partial result buffer is not the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(2, 5)
      expect(result.buffer !== src.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6600
     * @tc.name testUint8ArraySlice066
     * @tc.desc Verify slice(-3) negative index result buffer is not the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-3)
      expect(result.buffer !== src.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6700
     * @tc.name testUint8ArraySlice067
     * @tc.desc Verify slice(-6, -2) negative range result buffer is not the same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-6, -2)
      expect(result.buffer !== src.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6800
     * @tc.name testUint8ArraySlice068
     * @tc.desc Verify modifying result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, 5)
      result[0] = 99
      expect(src[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_6900
     * @tc.name testUint8ArraySlice069
     * @tc.desc Verify two slices from same source have different buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const r1: Uint8Array = src.slice(0, 3)
      const r2: Uint8Array = src.slice(3, 6)
      expect(r1.buffer !== r2.buffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7000
     * @tc.name testUint8ArraySlice070
     * @tc.desc Verify chained slice(1,5).slice(0,2) content correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const r1: Uint8Array = src.slice(1, 5)
      const r2: Uint8Array = r1.slice(0, 2)
      expect(r2.length).assertEqual(2)
      expect(r2[0]).assertEqual(1)
      expect(r2[1]).assertEqual(2)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7100
     * @tc.name testUint8ArraySlice071
     * @tc.desc Verify slice().slice() continuous copy content correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const r1: Uint8Array = src.slice()
      const r2: Uint8Array = r1.slice()
      expect(r2.length).assertEqual(10)
      expect(r2[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7200
     * @tc.name testUint8ArraySlice072
     * @tc.desc Verify slice empty result buffer is ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1)
      const result: Uint8Array = src.slice(5, 5)
      expect(result.buffer instanceof ArrayBuffer).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7300
     * @tc.name testUint8ArraySlice073
     * @tc.desc Verify slice full copy result byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, src.length)
      expect(result.byteOffset).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7400
     * @tc.name testUint8ArraySlice074
     * @tc.desc Verify slice(2) result byteOffset is 0 (new buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(2)
      expect(result.byteOffset).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7500
     * @tc.name testUint8ArraySlice075
     * @tc.desc Verify slice(-1) result byteLength is 1 and last element is 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(-1)
      expect(result.byteLength).assertEqual(1)
      expect(result[0]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SLICE02_7600
     * @tc.name testUint8ArraySlice076
     * @tc.desc Verify slice(0, -1) removing last element byteLength correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      const result: Uint8Array = src.slice(0, -1)
      expect(result.byteLength).assertEqual(9)
      expect(result[8]).assertEqual(8)
    })
  })
}
