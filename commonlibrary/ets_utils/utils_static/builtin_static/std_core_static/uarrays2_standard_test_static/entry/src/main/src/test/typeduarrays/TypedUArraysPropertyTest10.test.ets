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

export default function typedUArraysPropertyTest10(): void {
  describe('TypedUArraysPropertyTest10', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0100
     * @tc.name testTypedUArraysPropertyTestFileJ001
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0200
     * @tc.name testTypedUArraysPropertyTestFileJ002
     * @tc.desc Verify byteOffset byteLength buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint8Array(buf, 8, 16);
      const total = arr.byteOffset + arr.byteLength;
      expect(total <= buf.byteLength).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0300
     * @tc.name testTypedUArraysPropertyTestFileJ003
     * @tc.desc Verify buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 7, 1);
      expect(arr.byteOffset).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0400
     * @tc.name testTypedUArraysPropertyTestFileJ004
     * @tc.desc Verify buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr1 = new Uint8Array(buf, 0);
      const arr2 = new Uint8Array(buf, 8);
      expect(arr1.byteOffset).assertEqual(0);
      expect(arr2.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0500
     * @tc.name testTypedUArraysPropertyTestFileJ005
     * @tc.desc Verify Uint8Array byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0600
     * @tc.name testTypedUArraysPropertyTestFileJ006
     * @tc.desc Verify Uint16Array byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0700
     * @tc.name testTypedUArraysPropertyTestFileJ007
     * @tc.desc Verify Uint32Array byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0800
     * @tc.name testTypedUArraysPropertyTestFileJ008
     * @tc.desc Verify BigUint64Array byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(1);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_0900
     * @tc.name testTypedUArraysPropertyTestFileJ009
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const original = arr.byteLength;
      expect(original).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1000
     * @tc.name testTypedUArraysPropertyTestFileJ010
     * @tc.desc Verify byteLength Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1100
     * @tc.name testTypedUArraysPropertyTestFileJ011
     * @tc.desc Verify offset length byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint8Array(buf, 4, 6);
      expect(arr.byteLength).assertEqual(6 * Uint8Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1200
     * @tc.name testTypedUArraysPropertyTestFileJ012
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1024);
      expect(arr.byteLength).assertEqual(1024 * Uint16Array.BYTES_PER_ELEMENT);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1300
     * @tc.name testTypedUArraysPropertyTestFileJ013
     * @tc.desc Verify length byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint16Array(buf, 0, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1400
     * @tc.name testTypedUArraysPropertyTestFileJ014
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10000);
      expect(arr.length).assertEqual(10000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1500
     * @tc.name testTypedUArraysPropertyTestFileJ015
     * @tc.desc Verify length non-negative for zero-length array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1600
     * @tc.name testTypedUArraysPropertyTestFileJ016
     * @tc.desc Verify length non-negative for Uint16Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST10_1700
     * @tc.name testTypedUArraysPropertyTestFileJ017
     * @tc.desc Verify length non-negative for large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileJ017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(10000);
      expect(arr.length).assertEqual(10000);
    });


  });
}
