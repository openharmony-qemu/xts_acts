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

export default function typedUArraysSubarrayTest04(): void {
  describe('TypedUArraysSubarrayTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_9900
     * @tc.name testTypedUArraysSubarrayPart104_050
     * @tc.desc Verify subarray 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.subarray(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10000
     * @tc.name testTypedUArraysSubarrayPart104_051
     * @tc.desc Verify begin=1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.subarray(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10100
     * @tc.name testTypedUArraysSubarrayPart104_052
     * @tc.desc Verify begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.subarray(0);
      expect(result.length).assertEqual(1);
      const val59 = result[0];
      expect(val59).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10200
     * @tc.name testTypedUArraysSubarrayPart104_053
     * @tc.desc Verify begin=0 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([42]);
      let result = arr.subarray(0);
      expect(result.length).assertEqual(1);
      const val60 = result[0];
      expect(val60).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10300
     * @tc.name testTypedUArraysSubarrayPart104_054
     * @tc.desc Verify begin=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      const val61 = result[0];
      expect(val61).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10400
     * @tc.name testTypedUArraysSubarrayPart104_055
     * @tc.desc Verify begin=-1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.subarray(-1);
      expect(result.length).assertEqual(1);
      const val62 = result[0];
      expect(val62).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10500
     * @tc.name testTypedUArraysSubarrayPart104_056
     * @tc.desc Verify begin=0x00 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x00);
      expect(result.length).assertEqual(5);
      const val63 = result[0];
      expect(val63).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10600
     * @tc.name testTypedUArraysSubarrayPart104_057
     * @tc.desc Verify begin=0x02 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x02);
      expect(result.length).assertEqual(3);
      const val64 = result[0];
      expect(val64).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10700
     * @tc.name testTypedUArraysSubarrayPart104_058
     * @tc.desc Verify begin=0x01 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x01);
      expect(result.length).assertEqual(4);
      const val65 = result[0];
      expect(val65).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10800
     * @tc.name testTypedUArraysSubarrayPart104_059
     * @tc.desc Verify begin=0x03 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x03);
      expect(result.length).assertEqual(2);
      const val66 = result[0];
      expect(val66).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_10900
     * @tc.name testTypedUArraysSubarrayPart104_060
     * @tc.desc Verify begin=0x02 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(0x02);
      expect(result.length).assertEqual(3);
      const val67 = result[0];
      expect(val67).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11000
     * @tc.name testTypedUArraysSubarrayPart104_061
     * @tc.desc Verify begin=0x01 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x01);
      expect(result.length).assertEqual(4);
      const val68 = result[0];
      expect(val68).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11100
     * @tc.name testTypedUArraysSubarrayPart104_062
     * @tc.desc Verify begin=0x00 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x00);
      expect(result.length).assertEqual(5);
      const val69 = result[0];
      expect(val69).assertEqual(1);
      const val70 = result[4];
      expect(val70).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11200
     * @tc.name testTypedUArraysSubarrayPart104_063
     * @tc.desc Verify begin=0x05 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x05);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11300
     * @tc.name testTypedUArraysSubarrayPart104_064
     * @tc.desc Verify begin=0x06 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0x06);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11400
     * @tc.name testTypedUArraysSubarrayPart104_065
     * @tc.desc Verify begin=0x02 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.subarray(0x02);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11500
     * @tc.name testTypedUArraysSubarrayPart104_066
     * @tc.desc Verify begin=0x01 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.subarray(0x01);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11600
     * @tc.name testTypedUArraysSubarrayPart104_067
     * @tc.desc Verify begin=0x01 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([42]);
      let result = arr.subarray(0x01);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11700
     * @tc.name testTypedUArraysSubarrayPart104_068
     * @tc.desc Verify begin=0x00 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.subarray(0x00);
      expect(result.length).assertEqual(1);
      const val71 = result[0];
      expect(val71).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11800
     * @tc.name testTypedUArraysSubarrayPart104_069
     * @tc.desc Verify begin=0x00 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.subarray(0x00);
      expect(result.length).assertEqual(1);
      const val72 = result[0];
      expect(val72).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_11900
     * @tc.name testTypedUArraysSubarrayPart104_070
     * @tc.desc Verify end=1 begin=0 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val73 = result[0];
      expect(val73).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12000
     * @tc.name testTypedUArraysSubarrayPart104_071
     * @tc.desc Verify end=2 begin=0 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 2);
      expect(result.length).assertEqual(2);
      const val74 = result[0];
      expect(val74).assertEqual(1);
      const val75 = result[1];
      expect(val75).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12100
     * @tc.name testTypedUArraysSubarrayPart104_072
     * @tc.desc Verify end=3 begin=0 Uint8Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 3);
      expect(result.length).assertEqual(3);
      const val76 = result[0];
      expect(val76).assertEqual(1);
      const val77 = result[2];
      expect(val77).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12200
     * @tc.name testTypedUArraysSubarrayPart104_073
     * @tc.desc Verify end=5 begin=0 Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 5);
      expect(result.length).assertEqual(5);
      const val78 = result[0];
      expect(val78).assertEqual(1);
      const val79 = result[4];
      expect(val79).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12300
     * @tc.name testTypedUArraysSubarrayPart104_074
     * @tc.desc Verify end=0 begin=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12400
     * @tc.name testTypedUArraysSubarrayPart104_075
     * @tc.desc Verify end=1 begin=0 Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val80 = result[0];
      expect(val80).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12500
     * @tc.name testTypedUArraysSubarrayPart104_076
     * @tc.desc Verify end=3 begin=0 Uint16Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 3);
      expect(result.length).assertEqual(3);
      const val81 = result[0];
      expect(val81).assertEqual(1);
      const val82 = result[2];
      expect(val82).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12600
     * @tc.name testTypedUArraysSubarrayPart104_077
     * @tc.desc Verify end=1 begin=0 Uint32Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val83 = result[0];
      expect(val83).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12700
     * @tc.name testTypedUArraysSubarrayPart104_078
     * @tc.desc Verify end=3 begin=0 Uint32Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 3);
      expect(result.length).assertEqual(3);
      const val84 = result[0];
      expect(val84).assertEqual(1);
      const val85 = result[2];
      expect(val85).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12800
     * @tc.name testTypedUArraysSubarrayPart104_079
     * @tc.desc Verify end=1 begin=0 Uint8ClampedArray 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val86 = result[0];
      expect(val86).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_12900
     * @tc.name testTypedUArraysSubarrayPart104_080
     * @tc.desc Verify end=3 begin=0 Uint8ClampedArray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 3);
      expect(result.length).assertEqual(3);
      const val87 = result[0];
      expect(val87).assertEqual(1);
      const val88 = result[2];
      expect(val88).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13000
     * @tc.name testTypedUArraysSubarrayPart104_081
     * @tc.desc Verify end=1 begin=0 BigUint64Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(0, 1);
      expect(result.length).assertEqual(1);
      const val89 = result[0];
      expect(val89).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13100
     * @tc.name testTypedUArraysSubarrayPart104_082
     * @tc.desc Verify end=3 begin=0 BigUint64Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(0, 3);
      expect(result.length).assertEqual(3);
      const val90 = result[0];
      expect(val90).assertEqual(1n);
      const val91 = result[2];
      expect(val91).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13200
     * @tc.name testTypedUArraysSubarrayPart104_083
     * @tc.desc Verify end=-1 begin=0 Uint8Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -1);
      expect(result.length).assertEqual(4);
      const val92 = result[0];
      expect(val92).assertEqual(1);
      const val93 = result[3];
      expect(val93).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13300
     * @tc.name testTypedUArraysSubarrayPart104_084
     * @tc.desc Verify end=-2 begin=0 Uint8Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -2);
      expect(result.length).assertEqual(3);
      const val94 = result[0];
      expect(val94).assertEqual(1);
      const val95 = result[2];
      expect(val95).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13400
     * @tc.name testTypedUArraysSubarrayPart104_085
     * @tc.desc Verify end=-3 begin=0 Uint8Array length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -3);
      expect(result.length).assertEqual(2);
      const val96 = result[0];
      expect(val96).assertEqual(1);
      const val97 = result[1];
      expect(val97).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13500
     * @tc.name testTypedUArraysSubarrayPart104_086
     * @tc.desc Verify end=-5 begin=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13600
     * @tc.name testTypedUArraysSubarrayPart104_087
     * @tc.desc Verify end=-6 begin=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13700
     * @tc.name testTypedUArraysSubarrayPart104_088
     * @tc.desc Verify end=-1 begin=0 Uint16Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -1);
      expect(result.length).assertEqual(4);
      const val98 = result[0];
      expect(val98).assertEqual(1);
      const val99 = result[3];
      expect(val99).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13800
     * @tc.name testTypedUArraysSubarrayPart104_089
     * @tc.desc Verify end=-2 begin=0 Uint16Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -2);
      expect(result.length).assertEqual(3);
      const val100 = result[0];
      expect(val100).assertEqual(1);
      const val101 = result[2];
      expect(val101).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_13900
     * @tc.name testTypedUArraysSubarrayPart104_090
     * @tc.desc Verify end=-1 begin=0 Uint32Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, -1);
      expect(result.length).assertEqual(4);
      const val102 = result[0];
      expect(val102).assertEqual(1);
      const val103 = result[3];
      expect(val103).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14000
     * @tc.name testTypedUArraysSubarrayPart104_091
     * @tc.desc Verify end=-1 begin=0 BigUint64Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(0, -1);
      expect(result.length).assertEqual(4);
      const val104 = result[0];
      expect(val104).assertEqual(1n);
      const val105 = result[3];
      expect(val105).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14100
     * @tc.name testTypedUArraysSubarrayPart104_092
     * @tc.desc Verify end=length begin=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 5);
      expect(result.length).assertEqual(5);
      const val106 = result[0];
      expect(val106).assertEqual(1);
      const val107 = result[4];
      expect(val107).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14200
     * @tc.name testTypedUArraysSubarrayPart104_093
     * @tc.desc Verify end=length+1 begin=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 6);
      expect(result.length).assertEqual(5);
      const val108 = result[0];
      expect(val108).assertEqual(1);
      const val109 = result[4];
      expect(val109).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14300
     * @tc.name testTypedUArraysSubarrayPart104_094
     * @tc.desc Verify end=100 begin=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.subarray(0, 100);
      expect(result.length).assertEqual(3);
      const val110 = result[0];
      expect(val110).assertEqual(1);
      const val111 = result[2];
      expect(val111).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14400
     * @tc.name testTypedUArraysSubarrayPart104_095
     * @tc.desc Verify end=Number.MAX_SAFE_INTEGER begin=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.subarray(0, Number.MAX_SAFE_INTEGER.toInt());
      expect(result.length).assertEqual(3);
      const val112 = result[0];
      expect(val112).assertEqual(1);
      const val113 = result[2];
      expect(val113).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14500
     * @tc.name testTypedUArraysSubarrayPart104_096
     * @tc.desc Verify end=length begin=0 Uint16Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 5);
      expect(result.length).assertEqual(5);
      const val114 = result[0];
      expect(val114).assertEqual(1);
      const val115 = result[4];
      expect(val115).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14600
     * @tc.name testTypedUArraysSubarrayPart104_097
     * @tc.desc Verify end=length begin=0 Uint32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 5);
      expect(result.length).assertEqual(5);
      const val116 = result[0];
      expect(val116).assertEqual(1);
      const val117 = result[4];
      expect(val117).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14700
     * @tc.name testTypedUArraysSubarrayPart104_098
     * @tc.desc Verify end=length begin=0 Uint8ClampedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.subarray(0, 5);
      expect(result.length).assertEqual(5);
      const val118 = result[0];
      expect(val118).assertEqual(1);
      const val119 = result[4];
      expect(val119).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_14800
     * @tc.name testTypedUArraysSubarrayPart104_099
     * @tc.desc Verify end=length begin=0 BigUint64Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.subarray(0, 5);
      expect(result.length).assertEqual(5);
      const val120 = result[0];
      expect(val120).assertEqual(1n);
      const val121 = result[4];
      expect(val121).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_100
     * @tc.desc Verify Uint8Array slice 1 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      const val122 = result[0];
      expect(val122).assertEqual(20);
      const val123 = result[1];
      expect(val123).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_101
     * @tc.desc Verify Uint16Array slice 0 to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      const val124 = result[0];
      expect(val124).assertEqual(10);
      const val125 = result[1];
      expect(val125).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_102
     * @tc.desc Verify Uint32Array slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([10, 20, 30, 40, 50]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val126 = result[0];
      expect(val126).assertEqual(20);
      const val127 = result[2];
      expect(val127).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_103
     * @tc.desc Verify Uint8ClampedArray slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val128 = result[0];
      expect(val128).assertEqual(20);
      const val129 = result[2];
      expect(val129).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_104
     * @tc.desc Verify BigUint64Array slice 1 to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val130 = result[0];
      expect(val130).assertEqual(20n);
      const val131 = result[2];
      expect(val131).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_105
     * @tc.desc Verify Uint8Array slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30, 40, 50]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val132 = result[0];
      expect(val132).assertEqual(40);
      const val133 = result[1];
      expect(val133).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_106
     * @tc.desc Verify BigUint64Array slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val134 = result[0];
      expect(val134).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_107
     * @tc.desc Verify Uint8Array reverse mutates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.reverse();
      expect(result.length).assertEqual(3);
      const val135 = result[0];
      expect(val135).assertEqual(30);
      const val136 = result[1];
      expect(val136).assertEqual(20);
      const val137 = result[2];
      expect(val137).assertEqual(10);
      const val138 = arr[0];
      expect(val138).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_108
     * @tc.desc Verify Uint16Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.reverse();
      expect(result.length).assertEqual(3);
      const val139 = result[0];
      expect(val139).assertEqual(30);
      const val140 = result[1];
      expect(val140).assertEqual(20);
      const val141 = result[2];
      expect(val141).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_5900
     * @tc.name testTypedUArraysSubarrayPart104_109
     * @tc.desc Verify BigUint64Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.reverse();
      expect(result.length).assertEqual(3);
      const val142 = result[0];
      expect(val142).assertEqual(30n);
      const val143 = result[1];
      expect(val143).assertEqual(20n);
      const val144 = result[2];
      expect(val144).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_110
     * @tc.desc Verify Uint8Array toReversed non-mutating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([10, 20, 30]);
      let result = arr.toReversed();
      expect(result.length).assertEqual(3);
      const val145 = result[0];
      expect(val145).assertEqual(30);
      const val146 = result[1];
      expect(val146).assertEqual(20);
      const val147 = result[2];
      expect(val147).assertEqual(10);
      const val148 = arr[0];
      expect(val148).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_111
     * @tc.desc Verify BigUint64Array toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      let result = arr.toReversed();
      expect(result.length).assertEqual(3);
      const val149 = result[0];
      expect(val149).assertEqual(30n);
      const val150 = result[1];
      expect(val150).assertEqual(20n);
      const val151 = result[2];
      expect(val151).assertEqual(10n);
      const val152 = arr[0];
      expect(val152).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_112
     * @tc.desc Verify Uint8Array sort descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([30, 10, 20]);
      let result = arr.sort();
      expect(result.length).assertEqual(3);
      const val153 = result[0];
      expect(val153).assertEqual(10);
      const val154 = result[1];
      expect(val154).assertEqual(20);
      const val155 = result[2];
      expect(val155).assertEqual(30);
      const val156 = arr[0];
      expect(val156).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_113
     * @tc.desc Verify Uint16Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([30, 10, 20]);
      let result = arr.sort();
      expect(result.length).assertEqual(3);
      const val157 = result[0];
      expect(val157).assertEqual(10);
      const val158 = result[1];
      expect(val158).assertEqual(20);
      const val159 = result[2];
      expect(val159).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_114
     * @tc.desc Verify BigUint64Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([30n, 10n, 20n]);
      let result = arr.sort();
      expect(result.length).assertEqual(3);
      const val160 = result[0];
      expect(val160).assertEqual(10n);
      const val161 = result[1];
      expect(val161).assertEqual(20n);
      const val162 = result[2];
      expect(val162).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_115
     * @tc.desc Verify Uint8Array toSorted non-mutating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([30, 10, 20]);
      let result = arr.toSorted();
      expect(result.length).assertEqual(3);
      const val163 = result[0];
      expect(val163).assertEqual(10);
      const val164 = result[1];
      expect(val164).assertEqual(20);
      const val165 = result[2];
      expect(val165).assertEqual(30);
      const val166 = arr[0];
      expect(val166).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SUBARRAY_PART104_6000
     * @tc.name testTypedUArraysSubarrayPart104_116
     * @tc.desc Verify BigUint64Array toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSubarrayPart104_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([30n, 10n, 20n]);
      let result = arr.toSorted();
      expect(result.length).assertEqual(3);
      const val167 = result[0];
      expect(val167).assertEqual(10n);
      const val168 = result[1];
      expect(val168).assertEqual(20n);
      const val169 = result[2];
      expect(val169).assertEqual(30n);
      const val170 = arr[0];
      expect(val170).assertEqual(30n);
    });
  });
}
