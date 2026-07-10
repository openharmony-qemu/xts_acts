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

export default function typedUArraysSortTest04(): void {
  describe('TypedUArraysSortTest04', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_0100
     * @tc.name testTypedUArraysSortPart201_001
     * @tc.desc Verify sort typeof object Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const ret = arr.sort();
      const val26 = ret[0];
      expect(val26).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5100
     * @tc.name testTypedUArraysSortPart201_051
     * @tc.desc Verify sort compareFunction ret[1] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const ret = arr.sort();
      const val27 = ret[1];
      expect(val27).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5200
     * @tc.name testTypedUArraysSortPart201_052
     * @tc.desc Verify sort compareFunction ret[2] BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const ret = arr.sort();
      const val28 = ret[2];
      expect(val28).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5300
     * @tc.name testTypedUArraysSortPart201_053
     * @tc.desc Verify sort length 3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.sort()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5400
     * @tc.name testTypedUArraysSortPart201_054
     * @tc.desc Verify sort length 3 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = expect(arr.sort()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5500
     * @tc.name testTypedUArraysSortPart201_055
     * @tc.desc Verify sort length 3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5600
     * @tc.name testTypedUArraysSortPart201_056
     * @tc.desc Verify sort length 3 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.sort()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5700
     * @tc.name testTypedUArraysSortPart201_057
     * @tc.desc Verify sort length length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.sort()).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5800
     * @tc.name testTypedUArraysSortPart201_058
     * @tc.desc Verify sort length length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = expect(arr.sort()).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_5900
     * @tc.name testTypedUArraysSortPart201_059
     * @tc.desc Verify sort length length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6000
     * @tc.name testTypedUArraysSortPart201_060
     * @tc.desc Verify sort length length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.sort()).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6100
     * @tc.name testTypedUArraysSortPart201_061
     * @tc.desc Verify sort compareFunction length 3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = arr.sort();
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6200
     * @tc.name testTypedUArraysSortPart201_062
     * @tc.desc Verify sort compareFunction length 3 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = arr.sort();
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6300
     * @tc.name testTypedUArraysSortPart201_063
     * @tc.desc Verify sort compareFunction length 3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = arr.sort();
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6400
     * @tc.name testTypedUArraysSortPart201_064
     * @tc.desc Verify sort compareFunction length 3 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = arr.sort();
      expect(ret.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6500
     * @tc.name testTypedUArraysSortPart201_065
     * @tc.desc Verify sort byteLength 6 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.sort()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6600
     * @tc.name testTypedUArraysSortPart201_066
     * @tc.desc Verify sort byteLength 12 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = expect(arr.sort()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6700
     * @tc.name testTypedUArraysSortPart201_067
     * @tc.desc Verify sort byteLength 3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6800
     * @tc.name testTypedUArraysSortPart201_068
     * @tc.desc Verify sort byteLength 24 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.sort()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_6900
     * @tc.name testTypedUArraysSortPart201_069
     * @tc.desc Verify sort byteLength byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.sort()).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7000
     * @tc.name testTypedUArraysSortPart201_070
     * @tc.desc Verify sort byteLength byteLength Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = expect(arr.sort()).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7100
     * @tc.name testTypedUArraysSortPart201_071
     * @tc.desc Verify sort byteLength byteLength Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7200
     * @tc.name testTypedUArraysSortPart201_072
     * @tc.desc Verify sort byteLength byteLength BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.sort()).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7300
     * @tc.name testTypedUArraysSortPart201_073
     * @tc.desc Verify sort compareFunction byteLength 6 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = arr.sort();
      expect(ret.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7400
     * @tc.name testTypedUArraysSortPart201_074
     * @tc.desc Verify sort compareFunction byteLength 12 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = arr.sort();
      expect(ret.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7500
     * @tc.name testTypedUArraysSortPart201_075
     * @tc.desc Verify sort compareFunction byteLength 3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = arr.sort();
      expect(ret.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7600
     * @tc.name testTypedUArraysSortPart201_076
     * @tc.desc Verify sort compareFunction byteLength 24 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = arr.sort();
      expect(ret.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7700
     * @tc.name testTypedUArraysSortPart201_077
     * @tc.desc Verify sort Uint16Array compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = arr.sort();
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7800
     * @tc.name testTypedUArraysSortPart201_078
     * @tc.desc Verify sort Uint32Array compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = arr.sort();
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_7900
     * @tc.name testTypedUArraysSortPart201_079
     * @tc.desc Verify sort Uint8ClampedArray compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = arr.sort();
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8000
     * @tc.name testTypedUArraysSortPart201_080
     * @tc.desc Verify sort BigUint64Array compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = arr.sort();
      expect(ret === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8100
     * @tc.name testTypedUArraysSortPart201_081
     * @tc.desc Verify sort buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint16Array(buf);
      
      const ret = expect(arr.sort()).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8200
     * @tc.name testTypedUArraysSortPart201_082
     * @tc.desc Verify sort buffer Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Uint32Array(buf);
      
      const ret = expect(arr.sort()).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8300
     * @tc.name testTypedUArraysSortPart201_083
     * @tc.desc Verify sort buffer Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      
      const ret = expect(arr.sort()).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8400
     * @tc.name testTypedUArraysSortPart201_084
     * @tc.desc Verify sort buffer BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new BigUint64Array(buf);
      
      const ret = expect(arr.sort()).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8500
     * @tc.name testTypedUArraysSortPart201_085
     * @tc.desc Verify sort byteOffset Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint16Array(buf, 4, 3);
      
      const ret = expect(arr.sort()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8600
     * @tc.name testTypedUArraysSortPart201_086
     * @tc.desc Verify sort byteOffset Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint32Array(buf, 8, 3);
      
      const ret = expect(arr.sort()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8700
     * @tc.name testTypedUArraysSortPart201_087
     * @tc.desc Verify sort byteOffset Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 4, 3);
      
      const ret = expect(arr.sort()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8800
     * @tc.name testTypedUArraysSortPart201_088
     * @tc.desc Verify sort byteOffset BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(64);
      const arr = new BigUint64Array(buf, 16, 3);
      
      const ret = expect(arr.sort()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_8900
     * @tc.name testTypedUArraysSortPart201_089
     * @tc.desc Verify sort BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9000
     * @tc.name testTypedUArraysSortPart201_090
     * @tc.desc Verify sort BYTES_PER_ELEMENT Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = expect(arr.sort()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9100
     * @tc.name testTypedUArraysSortPart201_091
     * @tc.desc Verify sort BYTES_PER_ELEMENT Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9200
     * @tc.name testTypedUArraysSortPart201_092
     * @tc.desc Verify sort BYTES_PER_ELEMENT BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.sort()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9300
     * @tc.name testTypedUArraysSortPart201_093
     * @tc.desc Verify sort constructor Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.sort()).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9400
     * @tc.name testTypedUArraysSortPart201_094
     * @tc.desc Verify sort constructor Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = expect(arr.sort()).assertEqual('Uint32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9500
     * @tc.name testTypedUArraysSortPart201_095
     * @tc.desc Verify sort constructor Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = expect(arr.sort()).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9600
     * @tc.name testTypedUArraysSortPart201_096
     * @tc.desc Verify sort constructor BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.sort()).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9700
     * @tc.name testTypedUArraysSortPart201_097
     * @tc.desc Verify sort Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = arr.sort();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9800
     * @tc.name testTypedUArraysSortPart201_098
     * @tc.desc Verify sort Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([3000000000, 1000000000, 2000000000]);
      const ret = arr.sort();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_9900
     * @tc.name testTypedUArraysSortPart201_099
     * @tc.desc Verify sort Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      const ret = arr.sort();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1000
     * @tc.name testTypedUArraysSortPart201_100
     * @tc.desc Verify toSorted length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.toSorted()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1100
     * @tc.name testTypedUArraysSortPart201_101
     * @tc.desc Verify toSorted length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.toSorted()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1200
     * @tc.name testTypedUArraysSortPart201_102
     * @tc.desc Verify toSorted byteLength Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.toSorted()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1300
     * @tc.name testTypedUArraysSortPart201_103
     * @tc.desc Verify toSorted byteLength BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.toSorted()).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1400
     * @tc.name testTypedUArraysSortPart201_104
     * @tc.desc Verify toSorted BYTES_PER_ELEMENT Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = expect(arr.toSorted()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1500
     * @tc.name testTypedUArraysSortPart201_105
     * @tc.desc Verify toSorted constructor Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = expect(arr.toSorted()).assertEqual('Uint16Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1600
     * @tc.name testTypedUArraysSortPart201_106
     * @tc.desc Verify toSorted constructor BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = expect(arr.toSorted()).assertEqual('BigUint64Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1700
     * @tc.name testTypedUArraysSortPart201_107
     * @tc.desc Verify toSorted Uint16Array returns different object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([300, 100, 200]);
      const ret = arr.toSorted();
      expect(ret === arr).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART201_1800
     * @tc.name testTypedUArraysSortPart201_108
     * @tc.desc Verify toSorted BigUint64Array returns different object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart201_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([3n, 1n, 2n]);
      const ret = arr.toSorted();
      expect(ret === arr).assertEqual(false);
    });

  });
}
