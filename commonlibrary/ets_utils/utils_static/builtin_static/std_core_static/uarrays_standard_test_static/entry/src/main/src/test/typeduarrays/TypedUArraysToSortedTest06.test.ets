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

'use static';

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

// AUTO_TYPED_ARRAY_HELPERS_START
function sortUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

// AUTO_TYPED_ARRAY_HELPERS_END

export default function typedUArraysToSortedTest06(): void {
  describe('TypedUArraysToSortedTest06', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0010
     * @tc.name testTypedUArraysToSortedPart302_001
     * @tc.desc Verify Number.MAX_VALUE Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0020
     * @tc.name testTypedUArraysToSortedPart302_002
     * @tc.desc Verify true Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0030
     * @tc.name testTypedUArraysToSortedPart302_003
     * @tc.desc Verify false Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0040
     * @tc.name testTypedUArraysToSortedPart302_004
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0050
     * @tc.name testTypedUArraysToSortedPart302_005
     * @tc.desc Verify TypeError Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0060
     * @tc.name testTypedUArraysToSortedPart302_006
     * @tc.desc Verify ReferenceError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0070
     * @tc.name testTypedUArraysToSortedPart302_007
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0080
     * @tc.name testTypedUArraysToSortedPart302_008
     * @tc.desc Verify length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val0 = ret[0];
      expect(val0).assertEqual(1);
      const val1 = ret[2];
      expect(val1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0090
     * @tc.name testTypedUArraysToSortedPart302_009
     * @tc.desc Verify length+1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val2 = ret[0];
      expect(val2).assertEqual(1);
      const val3 = ret[2];
      expect(val3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0100
     * @tc.name testTypedUArraysToSortedPart302_010
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0110
     * @tc.name testTypedUArraysToSortedPart302_011
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0120
     * @tc.name testTypedUArraysToSortedPart302_012
     * @tc.desc Verify undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let toggle = false;
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0130
     * @tc.name testTypedUArraysToSortedPart302_013
     * @tc.desc Verify NaN 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let toggle2 = false;
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0140
     * @tc.name testTypedUArraysToSortedPart302_014
     * @tc.desc Verify Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val4 = ret[0];
      expect(val4).assertEqual(1);
      const val5 = ret[2];
      expect(val5).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0150
     * @tc.name testTypedUArraysToSortedPart302_015
     * @tc.desc Verify Number.EPSILON Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0160
     * @tc.name testTypedUArraysToSortedPart302_016
     * @tc.desc Verify Number.EPSILON Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0170
     * @tc.name testTypedUArraysToSortedPart302_017
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let callCount2 = 0;
      const ret = sortUint8ArrayValue(arr);
      expect(callCount2).assertEqual(0);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0180
     * @tc.name testTypedUArraysToSortedPart302_018
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let callCount3 = 0;
      const ret = sortUint8ArrayValue(arr);
      expect(callCount3).assertEqual(0);
      const val6 = ret[0];
      expect(val6).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0190
     * @tc.name testTypedUArraysToSortedPart302_019
     * @tc.desc Verify undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let count = 0;
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0200
     * @tc.name testTypedUArraysToSortedPart302_020
     * @tc.desc Verify null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let count2 = 0;
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0210
     * @tc.name testTypedUArraysToSortedPart302_021
     * @tc.desc Verify Number.MAX_SAFE_INTEGER+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0220
     * @tc.name testTypedUArraysToSortedPart302_022
     * @tc.desc Verify Number.MAX_SAFE_INTEGER-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0230
     * @tc.name testTypedUArraysToSortedPart302_023
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val7 = ret[0];
      expect(val7).assertEqual(1);
      const val8 = ret[2];
      expect(val8).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0240
     * @tc.name testTypedUArraysToSortedPart302_024
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val9 = ret[0];
      expect(val9).assertEqual(1);
      const val10 = ret[2];
      expect(val10).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0250
     * @tc.name testTypedUArraysToSortedPart302_025
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val11 = ret[0];
      expect(val11).assertEqual(1);
      const val12 = ret[2];
      expect(val12).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0260
     * @tc.name testTypedUArraysToSortedPart302_026
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8Array(buf, 4, 3);

      const ret = sortUint8ArrayValue(arr);
      const val13 = ret[0];
      expect(val13).assertEqual(0);
      const val14 = ret[2];
      expect(val14).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0270
     * @tc.name testTypedUArraysToSortedPart302_027
     * @tc.desc Verify name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val15 = ret[0];
      expect(val15).assertEqual(1);
      const val16 = ret[2];
      expect(val16).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0280
     * @tc.name testTypedUArraysToSortedPart302_028
     * @tc.desc Verify BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([3, 1, 2]);
      const ret = sortUint16ArrayValue(arr);
      const val17 = ret[0];
      expect(val17).assertEqual(1);
      const val18 = ret[2];
      expect(val18).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0290
     * @tc.name testTypedUArraysToSortedPart302_029
     * @tc.desc Verify constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val19 = ret[0];
      expect(val19).assertEqual(1);
      const val20 = ret[2];
      expect(val20).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0300
     * @tc.name testTypedUArraysToSortedPart302_030
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val21 = ret[0];
      expect(val21).assertEqual(1);
      const val22 = ret[2];
      expect(val22).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0310
     * @tc.name testTypedUArraysToSortedPart302_031
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val23 = ret[0];
      expect(val23).assertEqual(1);
      const val24 = ret[2];
      expect(val24).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0320
     * @tc.name testTypedUArraysToSortedPart302_032
     * @tc.desc Verify ArrayBuffer.isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val25 = ret[0];
      expect(val25).assertEqual(1);
      const val26 = ret[2];
      expect(val26).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0330
     * @tc.name testTypedUArraysToSortedPart302_033
     * @tc.desc Verify entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val27 = ret[0];
      expect(val27).assertEqual(1);
      const val28 = ret[2];
      expect(val28).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0340
     * @tc.name testTypedUArraysToSortedPart302_034
     * @tc.desc Verify keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val29 = ret[0];
      expect(val29).assertEqual(1);
      const val30 = ret[2];
      expect(val30).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0350
     * @tc.name testTypedUArraysToSortedPart302_035
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val31 = ret[0];
      expect(val31).assertEqual(1);
      const val32 = ret[2];
      expect(val32).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0360
     * @tc.name testTypedUArraysToSortedPart302_036
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val33 = ret[0];
      expect(val33).assertEqual(1);
      const val34 = ret[2];
      expect(val34).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0370
     * @tc.name testTypedUArraysToSortedPart302_037
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val35 = ret[0];
      expect(val35).assertEqual(1);
      const val36 = ret[2];
      expect(val36).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0380
     * @tc.name testTypedUArraysToSortedPart302_038
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val37 = ret[0];
      expect(val37).assertEqual(1);
      const val38 = ret[2];
      expect(val38).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0390
     * @tc.name testTypedUArraysToSortedPart302_039
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val39 = ret[0];
      expect(val39).assertEqual(1);
      const val40 = ret[2];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0400
     * @tc.name testTypedUArraysToSortedPart302_040
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val41 = ret[0];
      expect(val41).assertEqual(1);
      const val42 = ret[2];
      expect(val42).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0410
     * @tc.name testTypedUArraysToSortedPart302_041
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0420
     * @tc.name testTypedUArraysToSortedPart302_042
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val43 = ret[0];
      expect(val43).assertEqual(1);
      const val44 = ret[2];
      expect(val44).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0430
     * @tc.name testTypedUArraysToSortedPart302_043
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val45 = ret[0];
      expect(val45).assertEqual(1);
      const val46 = ret[2];
      expect(val46).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0440
     * @tc.name testTypedUArraysToSortedPart302_044
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val47 = ret[0];
      expect(val47).assertEqual(1);
      const val48 = ret[2];
      expect(val48).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0450
     * @tc.name testTypedUArraysToSortedPart302_045
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val49 = ret[0];
      expect(val49).assertEqual(1);
      const val50 = ret[2];
      expect(val50).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0460
     * @tc.name testTypedUArraysToSortedPart302_046
     * @tc.desc Verify reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val51 = ret[0];
      expect(val51).assertEqual(1);
      const val52 = ret[2];
      expect(val52).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0470
     * @tc.name testTypedUArraysToSortedPart302_047
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val53 = ret[0];
      expect(val53).assertEqual(1);
      const val54 = ret[2];
      expect(val54).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0480
     * @tc.name testTypedUArraysToSortedPart302_048
     * @tc.desc Verify toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val55 = ret[0];
      expect(val55).assertEqual(1);
      const val56 = ret[2];
      expect(val56).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0490
     * @tc.name testTypedUArraysToSortedPart302_049
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0500
     * @tc.name testTypedUArraysToSortedPart302_050
     * @tc.desc Verify copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0510
     * @tc.name testTypedUArraysToSortedPart302_051
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0520
     * @tc.name testTypedUArraysToSortedPart302_052
     * @tc.desc Verify Uint8Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 2);
      const ret = sortUint8ArrayValue(arr);
      const val = ret[0];
      expect(val).assertEqual(1);
      const val2 = ret[2];
      expect(val2).assertEqual(3);
    });
  });
}
