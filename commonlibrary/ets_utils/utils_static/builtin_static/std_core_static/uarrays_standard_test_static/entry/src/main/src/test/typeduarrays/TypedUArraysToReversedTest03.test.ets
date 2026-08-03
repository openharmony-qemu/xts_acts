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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function reverseBigUint64ArrayValue(source: BigUint64Array): BigUint64Array {
  const result = new BigUint64Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint32ArrayValue(source: Uint32Array): Uint32Array {
  const result = new Uint32Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}

function reverseUint8ClampedArrayValue(source: Uint8ClampedArray): Uint8ClampedArray {
  const result = new Uint8ClampedArray(source.length);
  for (let i: number = 0; i < source.length; i++) {
    result[i.toInt()] = source[(source.length - 1 - i).toInt()];
  }
  return result;
}


export default function typedUArraysToReversedTest03(): void {
  describe('TypedUArraysToReversedTest03', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0100
     * @tc.name testTypedUArraysToReversedPart202_001
     * @tc.desc Verify Uint16Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32767, 65535]);
      const ret = reverseUint16ArrayValue(arr);
      const val0 = ret[0];
      expect(val0).assertEqual(65535);
      const val1 = ret[1];
      expect(val1).assertEqual(32767);
      const val2 = ret[2];
      expect(val2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0200
     * @tc.name testTypedUArraysToReversedPart202_002
     * @tc.desc Verify Uint32Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483647, 4294967295]);
      const ret = reverseUint32ArrayValue(arr);
      const val3 = ret[0];
      expect(val3).assertEqual(4294967295);
      const val4 = ret[1];
      expect(val4).assertEqual(2147483647);
      const val5 = ret[2];
      expect(val5).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0300
     * @tc.name testTypedUArraysToReversedPart202_003
     * @tc.desc Verify Uint8ClampedArray toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 127, 255]);
      const ret = reverseUint8ClampedArrayValue(arr);
      const val6 = ret[0];
      expect(val6).assertEqual(255);
      const val7 = ret[1];
      expect(val7).assertEqual(127);
      const val8 = ret[2];
      expect(val8).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0400
     * @tc.name testTypedUArraysToReversedPart202_004
     * @tc.desc Verify BigUint64Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 9223372036854775807n, BigInt('18446744073709551615')]);
      const ret = reverseBigUint64ArrayValue(arr);
      const val9 = ret[0];
      expect(val9).assertEqual(BigInt('18446744073709551615'));
      const val10 = ret[1];
      expect(val10).assertEqual(9223372036854775807n);
      const val11 = ret[2];
      expect(val11).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0500
     * @tc.name testTypedUArraysToReversedPart202_005
     * @tc.desc Verify Uint8Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x80, 0x01]);
      const ret = reverseUint8ArrayValue(arr);
      const val12 = ret[0];
      expect(val12).assertEqual(0x01);
      const val13 = ret[1];
      expect(val13).assertEqual(0x80);
      const val14 = ret[2];
      expect(val14).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0600
     * @tc.name testTypedUArraysToReversedPart202_006
     * @tc.desc Verify Uint16Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0xFFFF, 0x8000, 0x0001]);
      const ret = reverseUint16ArrayValue(arr);
      const val15 = ret[0];
      expect(val15).assertEqual(0x0001);
      const val16 = ret[1];
      expect(val16).assertEqual(0x8000);
      const val17 = ret[2];
      expect(val17).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0700
     * @tc.name testTypedUArraysToReversedPart202_007
     * @tc.desc Verify Uint32Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0xFFFFFFFF, 0x80000000, 0x00000001]);
      const ret = reverseUint32ArrayValue(arr);
      const val18 = ret[0];
      expect(val18).assertEqual(0x00000001);
      const val19 = ret[1];
      expect(val19).assertEqual(0x80000000);
      const val20 = ret[2];
      expect(val20).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0800
     * @tc.name testTypedUArraysToReversedPart202_008
     * @tc.desc Verify new Uint8Array(5) toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.length).assertEqual(5);
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_0900
     * @tc.name testTypedUArraysToReversedPart202_009
     * @tc.desc Verify new Uint8Array([1,2,3]) toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const ret = reverseUint8ArrayValue(arr);
      const val21 = ret[0];
      expect(val21).assertEqual(3);
      const val22 = ret[2];
      expect(val22).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_1000
     * @tc.name testTypedUArraysToReversedPart202_010
     * @tc.desc Verify new Uint8Array(buffer) toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf);
      arr[0] = 1;
      arr[1] = 2;
      const ret = reverseUint8ArrayValue(arr);
      const val0 = ret[6];
      expect(val0).assertEqual(2);
      const val1 = ret[7];
      expect(val1).assertEqual(1);
      const val2 = ret[0];
      expect(val2).assertEqual(0);
      const val3 = ret[3];
      expect(val3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_1100
     * @tc.name testTypedUArraysToReversedPart202_011
     * @tc.desc Verify new Uint8Array(buffer, 2, 3) toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 3);
      
      const ret = reverseUint8ArrayValue(arr);
      expect(ret.byteOffset).assertEqual(0);
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_1200
     * @tc.name testTypedUArraysToReversedPart202_012
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0]);
      const ret = reverseUint8ArrayValue(arr);
      const val23 = ret[0];
      expect(val23).assertEqual(0);
      const val24 = ret[3];
      expect(val24).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_1300
     * @tc.name testTypedUArraysToReversedPart202_013
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 7, 7, 7]);
      const ret = reverseUint8ArrayValue(arr);
      const val25 = ret[0];
      expect(val25).assertEqual(7);
      const val26 = ret[3];
      expect(val26).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED_PART202_1400
     * @tc.name testTypedUArraysToReversedPart202_014
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversedPart202_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 2, 1]);
      const ret = reverseUint8ArrayValue(arr);
      const val27 = ret[0];
      expect(val27).assertEqual(1);
      const val28 = ret[2];
      expect(val28).assertEqual(3);
      const val29 = ret[4];
      expect(val29).assertEqual(1);
    });

  });
}
