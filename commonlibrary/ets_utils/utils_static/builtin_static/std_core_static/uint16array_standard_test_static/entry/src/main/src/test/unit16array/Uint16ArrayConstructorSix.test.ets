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

export default function uint16ArrayConstructor302Test(): void {
  describe('Uint16ArrayConstructor302Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0100
     * @tc.name testUint16ArrayConstructor302_001
     * @tc.desc Verify 10 buffer, byteOffset=2, length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        const arr: Uint16Array = new Uint16Array(buf, 2, 4);
        expect(arr.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0200
     * @tc.name testUint16ArrayConstructor302_002
     * @tc.desc Verify length*2+byteOffset buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 0, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0300
     * @tc.name testUint16ArrayConstructor302_003
     * @tc.desc Verify byteOffset=2, length=2 4 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 2, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0400
     * @tc.name testUint16ArrayConstructor302_004
     * @tc.desc Verify byteOffset=0, length=6 10 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 0, 6);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0500
     * @tc.name testUint16ArrayConstructor302_005
     * @tc.desc Verify byteOffset=8, length=2 10 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 8, 2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0600
     * @tc.name testUint16ArrayConstructor302_006
     * @tc.desc Verify byteOffset=6, length=3 10 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 6, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0700
     * @tc.name testUint16ArrayConstructor302_007
     * @tc.desc Verify byteOffset=10, length=1 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 10, 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0800
     * @tc.name testUint16ArrayConstructor302_008
     * @tc.desc Verify byteOffset -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, -2, 3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_0900
     * @tc.name testUint16ArrayConstructor302_009
     * @tc.desc Verify length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 0, -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1000
     * @tc.name testUint16ArrayConstructor302_010
     * @tc.desc Verify length -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(10);
        try {
          const arr: Uint16Array = new Uint16Array(buf, 0, -5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1100
     * @tc.name testUint16ArrayConstructor302_011
     * @tc.desc Verify byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.byteLength).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1200
     * @tc.name testUint16ArrayConstructor302_012
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1300
     * @tc.name testUint16ArrayConstructor302_013
     * @tc.desc Verify BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1400
     * @tc.name testUint16ArrayConstructor302_014
     * @tc.desc Verify the buffer-backed value is a Uint16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        const buf: ArrayBuffer = new ArrayBuffer(6);
        const arr: Uint16Array = new Uint16Array(buf, 0, 3);
        expect(arr instanceof Uint16Array).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1500
     * @tc.name testUint16ArrayConstructor302_015
     * @tc.desc Verify constructor with buffer, byteOffset, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, 2, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1600
     * @tc.name testUint16ArrayConstructor302_016
     * @tc.desc Verify constructor with buffer and non-aligned byteOffset (1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        const arr: Uint16Array = new Uint16Array(buf, 1, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1700
     * @tc.name testUint16ArrayConstructor302_017
     * @tc.desc Verify constructor with buffer and byteOffset=0, length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const arr: Uint16Array = new Uint16Array(buf, 0, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(2);
      arr[0] = 65535;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1800
     * @tc.name testUint16ArrayConstructor302_018
     * @tc.desc Verify constructor with buffer and byteOffset=4, length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const arr1: Uint16Array = new Uint16Array(buf, 0, 3);
      arr1.set([100, 200, 300]);
      const arr2: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(arr2.at(0)).assertEqual(200);
      expect(arr2.at(1)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_1900
     * @tc.name testUint16ArrayConstructor302_019
     * @tc.desc Verify constructor with empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint16Array = new Uint16Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR302_2000
     * @tc.name testUint16ArrayConstructor302_020
     * @tc.desc Verify constructor with byteOffset=NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor302_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Uint16Array = new Uint16Array(buf, Number.NaN, 3);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(3);
    });

  });
}
