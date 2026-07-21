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


export default function typedUArraysToReversedTest05(): void {
  describe('TypedUArraysToReversedTest05', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_0100
     * @tc.name testTypedUArraysToReversed01001
     * @tc.desc Verify toReversed 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4300
     * @tc.name testTypedUArraysToReversed01043
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const r1 = reverseBigUint64ArrayValue(arr);
      const r2 = reverseBigUint64ArrayValue(arr);
      const val44 = r1[0];
      expect(val44).assertEqual(3n);
      const val45 = r2[0];
      expect(val45).assertEqual(3n);
      const val46 = arr[0];
      expect(val46).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4400
     * @tc.name testTypedUArraysToReversed01044
     * @tc.desc Verify toReversed 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2]);
      let result = reverseUint8ArrayValue(arr);
      const val47 = result[0];
      expect(val47).assertEqual(2);
      const val48 = result[2];
      expect(val48).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4500
     * @tc.name testTypedUArraysToReversed01045
     * @tc.desc Verify toReversed 255 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 128, 0]);
      let result = reverseUint8ArrayValue(arr);
      const val49 = result[0];
      expect(val49).assertEqual(0);
      const val50 = result[1];
      expect(val50).assertEqual(128);
      const val51 = result[2];
      expect(val51).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4600
     * @tc.name testTypedUArraysToReversed01046
     * @tc.desc Verify toReversed Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0]);
      let result = reverseUint16ArrayValue(arr);
      const val52 = result[0];
      expect(val52).assertEqual(0);
      const val53 = result[1];
      expect(val53).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4700
     * @tc.name testTypedUArraysToReversed01047
     * @tc.desc Verify toReversed Uint32Array 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0]);
      let result = reverseUint32ArrayValue(arr);
      const val54 = result[0];
      expect(val54).assertEqual(0);
      const val55 = result[1];
      expect(val55).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4800
     * @tc.name testTypedUArraysToReversed01048
     * @tc.desc Verify toReversed Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 128, 0]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val56 = result[0];
      expect(val56).assertEqual(0);
      const val57 = result[1];
      expect(val57).assertEqual(128);
      const val58 = result[2];
      expect(val58).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_4900
     * @tc.name testTypedUArraysToReversed01049
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val59 = result[0];
      expect(val59).assertEqual(0n);
      const val60 = result[1];
      expect(val60).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5000
     * @tc.name testTypedUArraysToReversed01050
     * @tc.desc Verify toReversed BigUint64Array BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n, 300n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val61 = result[0];
      expect(val61).assertEqual(300n);
      const val62 = result[1];
      expect(val62).assertEqual(200n);
      const val63 = result[2];
      expect(val63).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5100
     * @tc.name testTypedUArraysToReversed01051
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = reverseUint8ArrayValue(arr);
      const val64 = result[2];
      expect(val64).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5200
     * @tc.name testTypedUArraysToReversed01052
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val65 = result[2];
      expect(val65).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5300
     * @tc.name testTypedUArraysToReversed01053
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40]);
      let result = reverseUint16ArrayValue(arr);
      const val66 = result[0];
      expect(val66).assertEqual(40);
      const val67 = result[1];
      expect(val67).assertEqual(30);
      const val68 = result[2];
      expect(val68).assertEqual(20);
      const val69 = result[3];
      expect(val69).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5400
     * @tc.name testTypedUArraysToReversed01054
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400]);
      let result = reverseUint32ArrayValue(arr);
      const val70 = result[0];
      expect(val70).assertEqual(400);
      const val71 = result[3];
      expect(val71).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5500
     * @tc.name testTypedUArraysToReversed01055
     * @tc.desc Verify toReversed Uint8Array 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
      let result = reverseUint8ArrayValue(arr);
      const val72 = result[0];
      expect(val72).assertEqual(9);
      const val73 = result[5];
      expect(val73).assertEqual(4);
      const val74 = result[9];
      expect(val74).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5600
     * @tc.name testTypedUArraysToReversed01056
     * @tc.desc Verify toReversed BigUint64Array 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val75 = result[0];
      expect(val75).assertEqual(9n);
      const val76 = result[5];
      expect(val76).assertEqual(4n);
      const val77 = result[9];
      expect(val77).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5700
     * @tc.name testTypedUArraysToReversed01057
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 128]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val78 = result[0];
      expect(val78).assertEqual(128);
      const val79 = result[1];
      expect(val79).assertEqual(255);
      const val80 = result[2];
      expect(val80).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5800
     * @tc.name testTypedUArraysToReversed01058
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = reverseUint8ArrayValue(arr);
      const val81 = result[0];
      expect(val81).assertEqual(5);
      const val82 = result[1];
      expect(val82).assertEqual(4);
      const val83 = result[3];
      expect(val83).assertEqual(2);
      const val84 = result[4];
      expect(val84).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_5900
     * @tc.name testTypedUArraysToReversed01059
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val85 = result[0];
      expect(val85).assertEqual(5n);
      const val86 = result[4];
      expect(val86).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6000
     * @tc.name testTypedUArraysToReversed01060
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4]);
      let result = reverseUint8ArrayValue(arr);
      for (let i = 1; i < result.length; i++) {
        expect(result[i.toInt()] < result[i - 1]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6100
     * @tc.name testTypedUArraysToReversed01061
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = reverseBigUint64ArrayValue(arr);
      for (let i = 1; i < result.length; i++) {
        expect(result[i.toInt()] < result[i - 1]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6200
     * @tc.name testTypedUArraysToReversed01062
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 5, 5, 5, 5]);
      let result = reverseUint8ArrayValue(arr);
      const val87 = result[0];
      expect(val87).assertEqual(5);
      const val88 = result[4];
      expect(val88).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6300
     * @tc.name testTypedUArraysToReversed01063
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 5n, 5n, 5n, 5n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val89 = result[0];
      expect(val89).assertEqual(5n);
      const val90 = result[4];
      expect(val90).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6400
     * @tc.name testTypedUArraysToReversed01064
     * @tc.desc Verify toReversed toReversed reverse Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const reversed = reverseUint8ArrayValue(arr);
      const val91 = arr[0];
      expect(val91).assertEqual(1);
      const val92 = arr[2];
      expect(val92).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6500
     * @tc.name testTypedUArraysToReversed01065
     * @tc.desc Verify toReversed Uint8ClampedArray Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([10, 20, 30, 40]);
      const arr2 = new Uint8Array([10, 20, 30, 40]);
      const r1 = reverseUint8ClampedArrayValue(arr1);
      const r2 = reverseUint8ArrayValue(arr2);
      const val93 = r1[0];
      expect(val93).assertEqual(r2[0]);
      const val94 = r1[3];
      expect(val94).assertEqual(r2[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6600
     * @tc.name testTypedUArraysToReversed01066
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5, 6]);
      let result = reverseUint16ArrayValue(arr);
      const val95 = result[0];
      expect(val95).assertEqual(6);
      const val96 = result[1];
      expect(val96).assertEqual(5);
      const val97 = result[2];
      expect(val97).assertEqual(4);
      const val98 = result[3];
      expect(val98).assertEqual(3);
      const val99 = result[4];
      expect(val99).assertEqual(2);
      const val100 = result[5];
      expect(val100).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6700
     * @tc.name testTypedUArraysToReversed01067
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([111, 222, 333, 444]);
      let result = reverseUint32ArrayValue(arr);
      const val101 = result[0];
      expect(val101).assertEqual(444);
      const val102 = result[1];
      expect(val102).assertEqual(333);
      const val103 = result[2];
      expect(val103).assertEqual(222);
      const val104 = result[3];
      expect(val104).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6800
     * @tc.name testTypedUArraysToReversed01068
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 4, 1, 5, 9, 2, 6]);
      let result = reverseUint8ArrayValue(arr);
      const val105 = result[0];
      expect(val105).assertEqual(6);
      const val106 = result[1];
      expect(val106).assertEqual(2);
      const val107 = result[2];
      expect(val107).assertEqual(9);
      const val108 = result[3];
      expect(val108).assertEqual(5);
      const val109 = result[7];
      expect(val109).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_6900
     * @tc.name testTypedUArraysToReversed01069
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 4n, 1n, 5n, 9n, 2n, 6n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val110 = result[0];
      expect(val110).assertEqual(6n);
      const val111 = result[7];
      expect(val111).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7000
     * @tc.name testTypedUArraysToReversed01070
     * @tc.desc Verify toReversed Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([99]);
      let result = reverseUint8ArrayValue(arr);
      const val112 = result[0];
      expect(val112).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7100
     * @tc.name testTypedUArraysToReversed01071
     * @tc.desc Verify toReversed Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([555]);
      let result = reverseUint16ArrayValue(arr);
      const val113 = result[0];
      expect(val113).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7200
     * @tc.name testTypedUArraysToReversed01072
     * @tc.desc Verify toReversed BigUint64Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([100n, 200n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val114 = result[0];
      expect(val114).assertEqual(200n);
      const val115 = result[1];
      expect(val115).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7300
     * @tc.name testTypedUArraysToReversed01073
     * @tc.desc Verify toReversed Uint8ClampedArray 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([50, 100]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val116 = result[0];
      expect(val116).assertEqual(100);
      const val117 = result[1];
      expect(val117).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7400
     * @tc.name testTypedUArraysToReversed01074
     * @tc.desc Verify toReversed Uint8Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([7, 8, 9]);
      let result = reverseUint8ArrayValue(arr);
      const val118 = result[0];
      expect(val118).assertEqual(9);
      const val119 = result[1];
      expect(val119).assertEqual(8);
      const val120 = result[2];
      expect(val120).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7500
     * @tc.name testTypedUArraysToReversed01075
     * @tc.desc Verify toReversed Uint32Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300]);
      let result = reverseUint32ArrayValue(arr);
      const val121 = result[0];
      expect(val121).assertEqual(300);
      const val122 = result[2];
      expect(val122).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7600
     * @tc.name testTypedUArraysToReversed01076
     * @tc.desc Verify toReversed Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 50, 100, 150, 200, 255]);
      let result = reverseUint8ClampedArrayValue(arr);
      const val123 = result[0];
      expect(val123).assertEqual(255);
      const val124 = result[1];
      expect(val124).assertEqual(200);
      const val125 = result[4];
      expect(val125).assertEqual(50);
      const val126 = result[5];
      expect(val126).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7700
     * @tc.name testTypedUArraysToReversed01077
     * @tc.desc Verify toReversed Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = reverseUint16ArrayValue(arr);
      const val127 = result[0];
      expect(val127).assertEqual(65535);
      const val128 = result[1];
      expect(val128).assertEqual(32768);
      const val129 = result[2];
      expect(val129).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7800
     * @tc.name testTypedUArraysToReversed01078
     * @tc.desc Verify toReversed Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 2147483648, 4294967295]);
      let result = reverseUint32ArrayValue(arr);
      const val130 = result[0];
      expect(val130).assertEqual(4294967295);
      const val131 = result[1];
      expect(val131).assertEqual(2147483648);
      const val132 = result[2];
      expect(val132).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_7900
     * @tc.name testTypedUArraysToReversed01079
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, BigInt('9223372036854775808'), BigInt('18446744073709551615')]);
      let result = reverseBigUint64ArrayValue(arr);
      const val133 = result[0];
      expect(val133).assertEqual(BigInt('18446744073709551615'));
      const val134 = result[1];
      expect(val134).assertEqual(BigInt('9223372036854775808'));
      const val135 = result[2];
      expect(val135).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_8000
     * @tc.name testTypedUArraysToReversed01080
     * @tc.desc Verify toReversed Uint8Array toReversed toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40]);
      let result = reverseUint8ArrayValue(arr);
      const val136 = result[0];
      expect(val136).assertEqual(40);
      const val137 = result[1];
      expect(val137).assertEqual(30);
      const val138 = result[2];
      expect(val138).assertEqual(20);
      const val139 = result[3];
      expect(val139).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_8100
     * @tc.name testTypedUArraysToReversed01081
     * @tc.desc Verify toReversed Uint16Array toReversed toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3]);
      let result = reverseUint16ArrayValue(arr);
      const val140 = result[0];
      expect(val140).assertEqual(3);
      const val141 = result[2];
      expect(val141).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_8200
     * @tc.name testTypedUArraysToReversed01082
     * @tc.desc Verify toReversed BigUint64Array toReversed toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let result = reverseBigUint64ArrayValue(arr);
      const val142 = result[0];
      expect(val142).assertEqual(4n);
      const val143 = result[3];
      expect(val143).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_8300
     * @tc.name testTypedUArraysToReversed01083
     * @tc.desc Verify toReversed Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = reverseUint8ArrayValue(arr);
      const val144 = result[0];
      expect(val144).assertEqual(arr[4]);
      const val145 = result[1];
      expect(val145).assertEqual(arr[3]);
      const val146 = result[3];
      expect(val146).assertEqual(arr[1]);
      const val147 = result[4];
      expect(val147).assertEqual(arr[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOREVERSED01_8400
     * @tc.name testTypedUArraysToReversed01084
     * @tc.desc Verify toReversed BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToReversed01084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let result = reverseBigUint64ArrayValue(arr);
      for (let i = 0; i < arr.length; i++) {
        const val148 = result[i.toInt()];
        expect(val148).assertEqual(arr[arr.length - 1 - i]);
      }
    });
  });
}
