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

export default function typedUArraysConstructorTest01(): void {
  describe('TypedUArraysConstructorTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0100
     * @tc.name testTypedUArraysConstructorTestFileA001
     * @tc.desc Verify constructor with length - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0200
     * @tc.name testTypedUArraysConstructorTestFileA002
     * @tc.desc Verify constructor with length - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0300
     * @tc.name testTypedUArraysConstructorTestFileA003
     * @tc.desc Verify constructor with length - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0400
     * @tc.name testTypedUArraysConstructorTestFileA004
     * @tc.desc Verify constructor with length - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0500
     * @tc.name testTypedUArraysConstructorTestFileA005
     * @tc.desc Verify constructor with length - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0600
     * @tc.name testTypedUArraysConstructorTestFileA006
     * @tc.desc Verify constructor with typed array - Uint8Array from Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array([1, 2, 3]);
      const arr = new Uint8Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0700
     * @tc.name testTypedUArraysConstructorTestFileA007
     * @tc.desc Verify constructor with typed array - Uint16Array from Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array([10, 20, 30]);
      const arr = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0800
     * @tc.name testTypedUArraysConstructorTestFileA008
     * @tc.desc Verify constructor with typed array - BigUint64Array from BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new BigUint64Array([100n, 200n, 300n]);
      const arr = new BigUint64Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100n);
      expect(arr[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_0900
     * @tc.name testTypedUArraysConstructorTestFileA009
     * @tc.desc Verify constructor with array - Uint8Array from number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_1000
     * @tc.name testTypedUArraysConstructorTestFileA010
     * @tc.desc Verify constructor with ArrayBuffer - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint8Array(buffer);
      expect(arr.length).assertEqual(8);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_1100
     * @tc.name testTypedUArraysConstructorTestFileA011
     * @tc.desc Verify constructor with ArrayBuffer offset - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer, 2, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_1200
     * @tc.name testTypedUArraysConstructorTestFileA012
     * @tc.desc Verify constructor with ArrayBuffer - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Uint32Array(buffer);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_CONSTRUCTOR_PART101_1300
     * @tc.name testTypedUArraysConstructorTestFileA013
     * @tc.desc Verify constructor with ArrayBuffer offset length - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysConstructorTestFileA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(24);
      const arr = new BigUint64Array(buffer, 8, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(8);
    });
  });
}
