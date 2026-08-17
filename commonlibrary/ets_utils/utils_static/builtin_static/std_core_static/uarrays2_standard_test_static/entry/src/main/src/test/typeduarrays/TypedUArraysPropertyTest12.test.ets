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

export default function typedUArraysPropertyTest12(): void {
  describe('TypedUArraysPropertyTest12', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0100
     * @tc.name testTypedUArraysPropertyTestFileL001
     * @tc.desc Verify BYTES_PER_ELEMENT - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0200
     * @tc.name testTypedUArraysPropertyTestFileL002
     * @tc.desc Verify BYTES_PER_ELEMENT - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0300
     * @tc.name testTypedUArraysPropertyTestFileL003
     * @tc.desc Verify new Uint8Array(buffer, 0, 4) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 0, 4);
      expect(arr.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0400
     * @tc.name testTypedUArraysPropertyTestFileL004
     * @tc.desc Verify new Uint8Array(buffer, 2, 4) byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8Array(buf, 2, 4);
      expect(arr.byteOffset).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0500
     * @tc.name testTypedUArraysPropertyTestFileL005
     * @tc.desc Verify new Uint16Array(buffer, 0, 2) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf, 0, 2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0600
     * @tc.name testTypedUArraysPropertyTestFileL006
     * @tc.desc Verify new Uint16Array(buffer, 0, 2) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf, 0, 2);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0700
     * @tc.name testTypedUArraysPropertyTestFileL007
     * @tc.desc Verify new Uint16Array(buffer, 0, 2) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf, 0, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0800
     * @tc.name testTypedUArraysPropertyTestFileL008
     * @tc.desc Verify new Uint16Array(buffer, 2, 2) byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf, 2, 2);
      expect(arr.byteOffset).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_0900
     * @tc.name testTypedUArraysPropertyTestFileL009
     * @tc.desc Verify new Uint32Array(buffer, 0, 1) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 0, 1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_1000
     * @tc.name testTypedUArraysPropertyTestFileL010
     * @tc.desc Verify new Uint32Array(buffer, 0, 1) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 0, 1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_1100
     * @tc.name testTypedUArraysPropertyTestFileL011
     * @tc.desc Verify new Uint32Array(buffer, 0, 1) length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint32Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_1200
     * @tc.name testTypedUArraysPropertyTestFileL012
     * @tc.desc Verify new BigUint64Array(buffer, 0, 1) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf, 0, 1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_PROPERTYTEST12_1300
     * @tc.name testTypedUArraysPropertyTestFileL013
     * @tc.desc Verify new BigUint64Array(buffer, 0, 1) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysPropertyTestFileL013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new BigUint64Array(buf, 0, 1);
      expect(arr.byteLength).assertEqual(8);
    });


  });
}
