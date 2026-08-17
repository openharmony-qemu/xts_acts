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
import Utils from '../Util.test';

export default function typedUArraysSlicePartTest01(): void {
  describe('TypedUArraysSlicePartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0010
     * @tc.name testTypedUArraysSlicePartTestFileA001
     * @tc.desc Verify slice - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val7 = result[0];
      expect(val7).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0020
     * @tc.name testTypedUArraysSlicePartTestFileA002
     * @tc.desc Verify slice - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val8 = result[0];
      expect(val8).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0030
     * @tc.name testTypedUArraysSlicePartTestFileA003
     * @tc.desc Verify slice - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val9 = result[0];
      expect(val9).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0040
     * @tc.name testTypedUArraysSlicePartTestFileA004
     * @tc.desc Verify slice - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val10 = result[0];
      expect(val10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0050
     * @tc.name testTypedUArraysSlicePartTestFileA005
     * @tc.desc Verify slice - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      const val11 = result[0];
      expect(val11).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0060
     * @tc.name testTypedUArraysSlicePartTestFileA006
     * @tc.desc Verify slice 1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val12 = result[0];
      expect(val12).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0070
     * @tc.name testTypedUArraysSlicePartTestFileA007
     * @tc.desc Verify slice 1 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val13 = result[0];
      expect(val13).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0080
     * @tc.name testTypedUArraysSlicePartTestFileA008
     * @tc.desc Verify slice 1 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val14 = result[0];
      expect(val14).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0090
     * @tc.name testTypedUArraysSlicePartTestFileA009
     * @tc.desc Verify slice 1 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val15 = result[0];
      expect(val15).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0100
     * @tc.name testTypedUArraysSlicePartTestFileA010
     * @tc.desc Verify slice 1 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1);
      expect(result.length).assertEqual(4);
      const val16 = result[0];
      expect(val16).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0110
     * @tc.name testTypedUArraysSlicePartTestFileA011
     * @tc.desc Verify slice 0 empty Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0120
     * @tc.name testTypedUArraysSlicePartTestFileA012
     * @tc.desc Verify slice 0 empty Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0130
     * @tc.name testTypedUArraysSlicePartTestFileA013
     * @tc.desc Verify slice 0 empty Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0140
     * @tc.name testTypedUArraysSlicePartTestFileA014
     * @tc.desc Verify slice empty Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.slice();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0150
     * @tc.name testTypedUArraysSlicePartTestFileA015
     * @tc.desc Verify slice empty BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.slice();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0160
     * @tc.name testTypedUArraysSlicePartTestFileA016
     * @tc.desc Verify slice -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val17 = result[0];
      expect(val17).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0170
     * @tc.name testTypedUArraysSlicePartTestFileA017
     * @tc.desc Verify slice -1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val18 = result[0];
      expect(val18).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0180
     * @tc.name testTypedUArraysSlicePartTestFileA018
     * @tc.desc Verify slice -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val19 = result[0];
      expect(val19).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0190
     * @tc.name testTypedUArraysSlicePartTestFileA019
     * @tc.desc Verify slice -1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val20 = result[0];
      expect(val20).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0200
     * @tc.name testTypedUArraysSlicePartTestFileA020
     * @tc.desc Verify slice -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      const val21 = result[0];
      expect(val21).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0210
     * @tc.name testTypedUArraysSlicePartTestFileA021
     * @tc.desc Verify slice 0 3 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val22 = result[0];
      expect(val22).assertEqual(1);
      const val23 = result[2];
      expect(val23).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0220
     * @tc.name testTypedUArraysSlicePartTestFileA022
     * @tc.desc Verify slice 0 3 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val24 = result[0];
      expect(val24).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0230
     * @tc.name testTypedUArraysSlicePartTestFileA023
     * @tc.desc Verify slice 0 3 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val25 = result[0];
      expect(val25).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0240
     * @tc.name testTypedUArraysSlicePartTestFileA024
     * @tc.desc Verify slice 0 3 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val26 = result[0];
      expect(val26).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0250
     * @tc.name testTypedUArraysSlicePartTestFileA025
     * @tc.desc Verify slice 0 3 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val27 = result[0];
      expect(val27).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0260
     * @tc.name testTypedUArraysSlicePartTestFileA026
     * @tc.desc Verify slice 1 4 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val28 = result[0];
      expect(val28).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0270
     * @tc.name testTypedUArraysSlicePartTestFileA027
     * @tc.desc Verify slice 1 4 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val29 = result[0];
      expect(val29).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0280
     * @tc.name testTypedUArraysSlicePartTestFileA028
     * @tc.desc Verify slice 1 4 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val30 = result[0];
      expect(val30).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0290
     * @tc.name testTypedUArraysSlicePartTestFileA029
     * @tc.desc Verify slice 1 4 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val31 = result[0];
      expect(val31).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0300
     * @tc.name testTypedUArraysSlicePartTestFileA030
     * @tc.desc Verify slice 1 4 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      const val32 = result[0];
      expect(val32).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0310
     * @tc.name testTypedUArraysSlicePartTestFileA031
     * @tc.desc Verify slice -2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val33 = result[0];
      expect(val33).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0320
     * @tc.name testTypedUArraysSlicePartTestFileA032
     * @tc.desc Verify slice -2 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val34 = result[0];
      expect(val34).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0330
     * @tc.name testTypedUArraysSlicePartTestFileA033
     * @tc.desc Verify slice -2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val35 = result[0];
      expect(val35).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0340
     * @tc.name testTypedUArraysSlicePartTestFileA034
     * @tc.desc Verify slice -2 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val36 = result[0];
      expect(val36).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0350
     * @tc.name testTypedUArraysSlicePartTestFileA035
     * @tc.desc Verify slice -2 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      const val37 = result[0];
      expect(val37).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0360
     * @tc.name testTypedUArraysSlicePartTestFileA036
     * @tc.desc Verify slice -3 -1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val38 = result[0];
      expect(val38).assertEqual(3);
      const val39 = result[1];
      expect(val39).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0370
     * @tc.name testTypedUArraysSlicePartTestFileA037
     * @tc.desc Verify slice -3 -1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val40 = result[0];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0380
     * @tc.name testTypedUArraysSlicePartTestFileA038
     * @tc.desc Verify slice -3 -1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val41 = result[0];
      expect(val41).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0390
     * @tc.name testTypedUArraysSlicePartTestFileA039
     * @tc.desc Verify slice 1 1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0400
     * @tc.name testTypedUArraysSlicePartTestFileA040
     * @tc.desc Verify slice 1 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0410
     * @tc.name testTypedUArraysSlicePartTestFileA041
     * @tc.desc Verify slice 1 1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0420
     * @tc.name testTypedUArraysSlicePartTestFileA042
     * @tc.desc Verify slice 1 0 Uint32Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0430
     * @tc.name testTypedUArraysSlicePartTestFileA043
     * @tc.desc Verify slice 1 0 Uint8ClampedArray end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0440
     * @tc.name testTypedUArraysSlicePartTestFileA044
     * @tc.desc Verify slice 100 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0450
     * @tc.name testTypedUArraysSlicePartTestFileA045
     * @tc.desc Verify start=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0460
     * @tc.name testTypedUArraysSlicePartTestFileA046
     * @tc.desc Verify start=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.slice(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0470
     * @tc.name testTypedUArraysSlicePartTestFileA047
     * @tc.desc Verify end=1 start=0 Uint8Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val62 = result[0];
      expect(val62).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0480
     * @tc.name testTypedUArraysSlicePartTestFileA048
     * @tc.desc Verify end=2 start=0 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      const val63 = result[0];
      expect(val63).assertEqual(1);
      const val64 = result[1];
      expect(val64).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0490
     * @tc.name testTypedUArraysSlicePartTestFileA049
     * @tc.desc Verify end=5 start=0 Uint8Array 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val67 = result[0];
      expect(val67).assertEqual(1);
      const val68 = result[4];
      expect(val68).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0500
     * @tc.name testTypedUArraysSlicePartTestFileA050
     * @tc.desc Verify end=0 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0510
     * @tc.name testTypedUArraysSlicePartTestFileA051
     * @tc.desc Verify end=1 start=0 Uint16Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val69 = result[0];
      expect(val69).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0520
     * @tc.name testTypedUArraysSlicePartTestFileA052
     * @tc.desc Verify end=3 start=0 Uint16Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val70 = result[0];
      expect(val70).assertEqual(1);
      const val71 = result[2];
      expect(val71).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0530
     * @tc.name testTypedUArraysSlicePartTestFileA053
     * @tc.desc Verify end=1 start=0 Uint32Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val72 = result[0];
      expect(val72).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0540
     * @tc.name testTypedUArraysSlicePartTestFileA054
     * @tc.desc Verify end=3 start=0 Uint32Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val73 = result[0];
      expect(val73).assertEqual(1);
      const val74 = result[2];
      expect(val74).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0550
     * @tc.name testTypedUArraysSlicePartTestFileA055
     * @tc.desc Verify end=1 start=0 Uint8ClampedArray 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val75 = result[0];
      expect(val75).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0560
     * @tc.name testTypedUArraysSlicePartTestFileA056
     * @tc.desc Verify end=3 start=0 Uint8ClampedArray 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val76 = result[0];
      expect(val76).assertEqual(1);
      const val77 = result[2];
      expect(val77).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0570
     * @tc.name testTypedUArraysSlicePartTestFileA057
     * @tc.desc Verify end=1 start=0 BigUint64Array 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val78 = result[0];
      expect(val78).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0580
     * @tc.name testTypedUArraysSlicePartTestFileA058
     * @tc.desc Verify end=3 start=0 BigUint64Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      const val79 = result[0];
      expect(val79).assertEqual(1n);
      const val80 = result[2];
      expect(val80).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0590
     * @tc.name testTypedUArraysSlicePartTestFileA059
     * @tc.desc Verify end=-1 start=0 Uint8Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val81 = result[0];
      expect(val81).assertEqual(1);
      const val82 = result[3];
      expect(val82).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0600
     * @tc.name testTypedUArraysSlicePartTestFileA060
     * @tc.desc Verify end=-2 start=0 Uint8Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -2);
      expect(result.length).assertEqual(3);
      const val83 = result[0];
      expect(val83).assertEqual(1);
      const val84 = result[2];
      expect(val84).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0610
     * @tc.name testTypedUArraysSlicePartTestFileA061
     * @tc.desc Verify end=-3 start=0 Uint8Array length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -3);
      expect(result.length).assertEqual(2);
      const val85 = result[0];
      expect(val85).assertEqual(1);
      const val86 = result[1];
      expect(val86).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0620
     * @tc.name testTypedUArraysSlicePartTestFileA062
     * @tc.desc Verify end=-5 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0630
     * @tc.name testTypedUArraysSlicePartTestFileA063
     * @tc.desc Verify end=-6 start=0 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0640
     * @tc.name testTypedUArraysSlicePartTestFileA064
     * @tc.desc Verify end=-1 start=0 Uint16Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val87 = result[0];
      expect(val87).assertEqual(1);
      const val88 = result[3];
      expect(val88).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0650
     * @tc.name testTypedUArraysSlicePartTestFileA065
     * @tc.desc Verify end=-2 start=0 Uint16Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -2);
      expect(result.length).assertEqual(3);
      const val89 = result[0];
      expect(val89).assertEqual(1);
      const val90 = result[2];
      expect(val90).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0660
     * @tc.name testTypedUArraysSlicePartTestFileA066
     * @tc.desc Verify end=-1 start=0 Uint32Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val91 = result[0];
      expect(val91).assertEqual(1);
      const val92 = result[3];
      expect(val92).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0670
     * @tc.name testTypedUArraysSlicePartTestFileA067
     * @tc.desc Verify end=-1 start=0 BigUint64Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      const val93 = result[0];
      expect(val93).assertEqual(1n);
      const val94 = result[3];
      expect(val94).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0680
     * @tc.name testTypedUArraysSlicePartTestFileA068
     * @tc.desc Verify end=length+1 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 6);
      expect(result.length).assertEqual(5);
      const val97 = result[0];
      expect(val97).assertEqual(1);
      const val98 = result[4];
      expect(val98).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0690
     * @tc.name testTypedUArraysSlicePartTestFileA069
     * @tc.desc Verify end=100 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, 100);
      expect(result.length).assertEqual(3);
      const val99 = result[0];
      expect(val99).assertEqual(1);
      const val100 = result[2];
      expect(val100).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0700
     * @tc.name testTypedUArraysSlicePartTestFileA070
     * @tc.desc Verify end=Number.MAX_SAFE_INTEGER Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(0, 2147483647);
      expect(result.length).assertEqual(3);
      const val101 = result[0];
      expect(val101).assertEqual(1);
      const val102 = result[2];
      expect(val102).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0710
     * @tc.name testTypedUArraysSlicePartTestFileA071
     * @tc.desc Verify end=length Uint16Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val103 = result[0];
      expect(val103).assertEqual(1);
      const val104 = result[4];
      expect(val104).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0720
     * @tc.name testTypedUArraysSlicePartTestFileA072
     * @tc.desc Verify end=length Uint32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val105 = result[0];
      expect(val105).assertEqual(1);
      const val106 = result[4];
      expect(val106).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0730
     * @tc.name testTypedUArraysSlicePartTestFileA073
     * @tc.desc Verify end=length Uint8ClampedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val107 = result[0];
      expect(val107).assertEqual(1);
      const val108 = result[4];
      expect(val108).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0740
     * @tc.name testTypedUArraysSlicePartTestFileA074
     * @tc.desc Verify end=length BigUint64Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 5);
      expect(result.length).assertEqual(5);
      const val109 = result[0];
      expect(val109).assertEqual(1n);
      const val110 = result[4];
      expect(val110).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0750
     * @tc.name testTypedUArraysSlicePartTestFileA075
     * @tc.desc Verify end=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0760
     * @tc.name testTypedUArraysSlicePartTestFileA076
     * @tc.desc Verify end=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(0);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0770
     * @tc.name testTypedUArraysSlicePartTestFileA077
     * @tc.desc Verify end=1 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val111 = result[0];
      expect(val111).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0780
     * @tc.name testTypedUArraysSlicePartTestFileA078
     * @tc.desc Verify end=1 start=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([42n]);
      let result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      const val112 = result[0];
      expect(val112).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0790
     * @tc.name testTypedUArraysSlicePartTestFileA079
     * @tc.desc Verify end=0 start=1 Uint8Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0800
     * @tc.name testTypedUArraysSlicePartTestFileA080
     * @tc.desc Verify end=2 start=3 Uint8Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0810
     * @tc.name testTypedUArraysSlicePartTestFileA081
     * @tc.desc Verify end=2 start=3 Uint16Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0820
     * @tc.name testTypedUArraysSlicePartTestFileA082
     * @tc.desc Verify end=2 start=3 BigUint64Array end start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(3, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0830
     * @tc.name testTypedUArraysSlicePartTestFileA083
     * @tc.desc Verify start=0 end=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0840
     * @tc.name testTypedUArraysSlicePartTestFileA084
     * @tc.desc Verify start=0 end=0 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0850
     * @tc.name testTypedUArraysSlicePartTestFileA085
     * @tc.desc Verify start=2 end=2 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0860
     * @tc.name testTypedUArraysSlicePartTestFileA086
     * @tc.desc Verify start=2 end=2 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0870
     * @tc.name testTypedUArraysSlicePartTestFileA087
     * @tc.desc Verify start=-1 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-1, -1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0880
     * @tc.name testTypedUArraysSlicePartTestFileA088
     * @tc.desc Verify start=-2 end=-1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-2, -1);
      expect(result.length).assertEqual(1);
      const val113 = result[0];
      expect(val113).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0890
     * @tc.name testTypedUArraysSlicePartTestFileA089
     * @tc.desc Verify start=-3 end=-1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3, -1);
      expect(result.length).assertEqual(2);
      const val116 = result[0];
      expect(val116).assertEqual(3);
      const val117 = result[1];
      expect(val117).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0900
     * @tc.name testTypedUArraysSlicePartTestFileA090
     * @tc.desc Verify start=-2 end=-1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(-2, -1);
      expect(result.length).assertEqual(1);
      const val118 = result[0];
      expect(val118).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0910
     * @tc.name testTypedUArraysSlicePartTestFileA091
     * @tc.desc Verify slice 1 - start=2 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val12 = result[0];
      expect(val12).assertEqual(3);
      const val13 = result[2];
      expect(val13).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0920
     * @tc.name testTypedUArraysSlicePartTestFileA092
     * @tc.desc Verify slice 1 - start=2 Uint16Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val14 = result[0];
      expect(val14).assertEqual(3);
      const val15 = result[2];
      expect(val15).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0930
     * @tc.name testTypedUArraysSlicePartTestFileA093
     * @tc.desc Verify slice 1 - start=2 Uint32Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val16 = result[0];
      expect(val16).assertEqual(3);
      const val17 = result[2];
      expect(val17).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0940
     * @tc.name testTypedUArraysSlicePartTestFileA094
     * @tc.desc Verify slice 1 - start=2 Uint8ClampedArray 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val18 = result[0];
      expect(val18).assertEqual(3);
      const val19 = result[2];
      expect(val19).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0950
     * @tc.name testTypedUArraysSlicePartTestFileA095
     * @tc.desc Verify slice 1 - start=2 BigUint64Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val20 = result[0];
      expect(val20).assertEqual(3n);
      const val21 = result[2];
      expect(val21).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0960
     * @tc.name testTypedUArraysSlicePartTestFileA096
     * @tc.desc Verify start=2 Uint8Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val34 = result[0];
      expect(val34).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0970
     * @tc.name testTypedUArraysSlicePartTestFileA097
     * @tc.desc Verify start=3 Uint8Array 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(3);
      expect(result.length).assertEqual(2);
      const val35 = result[0];
      expect(val35).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0980
     * @tc.name testTypedUArraysSlicePartTestFileA098
     * @tc.desc Verify start=4 Uint8Array 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(4);
      expect(result.length).assertEqual(1);
      const val36 = result[0];
      expect(val36).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_0990
     * @tc.name testTypedUArraysSlicePartTestFileA099
     * @tc.desc Verify start=2 Uint16Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val38 = result[0];
      expect(val38).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1000
     * @tc.name testTypedUArraysSlicePartTestFileA100
     * @tc.desc Verify start=2 Uint32Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val40 = result[0];
      expect(val40).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1010
     * @tc.name testTypedUArraysSlicePartTestFileA101
     * @tc.desc Verify start=2 Uint8ClampedArray 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val42 = result[0];
      expect(val42).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1020
     * @tc.name testTypedUArraysSlicePartTestFileA102
     * @tc.desc Verify start=2 BigUint64Array 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      const val44 = result[0];
      expect(val44).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1030
     * @tc.name testTypedUArraysSlicePartTestFileA103
     * @tc.desc Verify start=-3 Uint8Array length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-3);
      expect(result.length).assertEqual(3);
      const val48 = result[0];
      expect(val48).assertEqual(3);
      const val49 = result[2];
      expect(val49).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1040
     * @tc.name testTypedUArraysSlicePartTestFileA104
     * @tc.desc Verify start=-5 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-5);
      expect(result.length).assertEqual(5);
      const val50 = result[0];
      expect(val50).assertEqual(1);
      const val51 = result[4];
      expect(val51).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1050
     * @tc.name testTypedUArraysSlicePartTestFileA105
     * @tc.desc Verify start=-6 Uint8Array 0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(-6);
      expect(result.length).assertEqual(5);
      const val52 = result[0];
      expect(val52).assertEqual(1);
      const val53 = result[4];
      expect(val53).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1060
     * @tc.name testTypedUArraysSlicePartTestFileA106
     * @tc.desc Verify start=length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1070
     * @tc.name testTypedUArraysSlicePartTestFileA107
     * @tc.desc Verify start=length+1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.slice(6);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1080
     * @tc.name testTypedUArraysSlicePartTestFileA108
     * @tc.desc Verify start=Number.MAX_SAFE_INTEGER Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      let result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1090
     * @tc.name testTypedUArraysSlicePartTestFileA109
     * @tc.desc Verify start=length Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.slice(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1100
     * @tc.name testTypedUArraysSlicePartTestFileA110
     * @tc.desc Verify start=length Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.slice(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1110
     * @tc.name testTypedUArraysSlicePartTestFileA111
     * @tc.desc Verify start=length Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.slice(5);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SLICEPARTTEST01_1120
     * @tc.name testTypedUArraysSlicePartTestFileA112
     * @tc.desc Verify start=length BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSlicePartTestFileA112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.slice(5);
      expect(result.length).assertEqual(0);
    });
  });
}
