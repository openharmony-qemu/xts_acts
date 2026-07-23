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

export default function uint16ArrayConstructor08Test(): void {
  describe('Uint16ArrayConstructor08Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0001
     * @tc.name testUint16ArrayConstructorEight001
     * @tc.desc Verify byteOffset=2, length=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 2);
      expect(dst.length).assertEqual(5);
      expect(dst.byteOffset).assertEqual(2);
      expect(dst.byteLength).assertEqual(10);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0002
     * @tc.name testUint16ArrayConstructorEight002
     * @tc.desc Verify byteOffset=0, length=5 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let dst: Uint16Array = new Uint16Array(buf, 0, 5);
      expect(dst.length).assertEqual(5);
      expect(dst.byteLength).assertEqual(10);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0003
     * @tc.name testUint16ArrayConstructorEight003
     * @tc.desc Verify byteOffset=4, length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 4, 2);
      expect(dst.length).assertEqual(2);
      expect(dst.byteOffset).assertEqual(4);
      expect(dst.byteLength).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0004
     * @tc.name testUint16ArrayConstructorEight004
     * @tc.desc Verify byteOffset=2, length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 2, 3);
      expect(dst.length).assertEqual(3);
      expect(dst.byteLength).assertEqual(6);
      expect(dst.byteOffset + dst.byteLength).assertEqual(8);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0005
     * @tc.name testUint16ArrayConstructorEight005
     * @tc.desc Verify byteOffset=0, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 0);
      expect(dst.length).assertEqual(0);
      expect(dst.byteLength).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0006
     * @tc.name testUint16ArrayConstructorEight006
     * @tc.desc Verify byteOffset=4, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 4, 0);
      expect(dst.length).assertEqual(0);
      expect(dst.byteOffset).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0007
     * @tc.name testUint16ArrayConstructorEight007
     * @tc.desc Verify byteOffset=2, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 2, 0);
      expect(dst.length).assertEqual(0);
      expect(dst.byteOffset).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0008
     * @tc.name testUint16ArrayConstructorEight008
     * @tc.desc Verify byteOffset=0, length=2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      dst[0] = 123;
      dst[1] = 456;
      let view: DataView = new DataView(buf);
      expect(view.getUint16(0)).assertEqual(31488);
      expect(view.getUint16(2)).assertEqual(51201);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0009
     * @tc.name testUint16ArrayConstructorEight009
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 3);
      expect(dst.length).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0010
     * @tc.name testUint16ArrayConstructorEight010
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(dst.byteLength).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0011
     * @tc.name testUint16ArrayConstructorEight011
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 4, 1);
      expect(dst.byteOffset).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0012
     * @tc.name testUint16ArrayConstructorEight012
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(dst.buffer).assertEqual(buf);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0013
     * @tc.name testUint16ArrayConstructorEight013
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      let view: DataView = new DataView(buf);
      view.setUint16(0, 999);
      expect(dst.at(0)).assertEqual(59139);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0014
     * @tc.name testUint16ArrayConstructorEight014
     * @tc.desc Verify buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 4, 2);
      expect(dst.buffer.byteLength).assertEqual(12);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0015
     * @tc.name testUint16ArrayConstructorEight015
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      dst.$_set(0, 777);
      expect(dst.$_get(0)).assertEqual(777);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0016
     * @tc.name testUint16ArrayConstructorEight016
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      dst[0] = 333;
      expect(dst.at(0)).assertEqual(333);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0017
     * @tc.name testUint16ArrayConstructorEight017
     * @tc.desc Verify byteOffset=7 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 7, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0018
     * @tc.name testUint16ArrayConstructorEight018
     * @tc.desc Verify byteOffset=9 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 9, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0019
     * @tc.name testUint16ArrayConstructorEight019
     * @tc.desc Verify byteOffset 6 with length 2 exceeds the buffer and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 6, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0020
     * @tc.name testUint16ArrayConstructorEight020
     * @tc.desc Verify byteOffset=0, length=5 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0021
     * @tc.name testUint16ArrayConstructorEight021
     * @tc.desc Verify byteOffset=0x2 hex, length=0x2 hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 0x2, 0x2);
      expect(dst.byteOffset).assertEqual(2);
      expect(dst.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0022
     * @tc.name testUint16ArrayConstructorEight022
     * @tc.desc Verify byteOffset=0o2 octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 0o2, 3);
      expect(dst.byteOffset).assertEqual(2);
      expect(dst.length).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0023
     * @tc.name testUint16ArrayConstructorEight023
     * @tc.desc Verify byteOffset=8, length=0 at buffer end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 8, 0);
      expect(dst.byteOffset).assertEqual(8);
      expect(dst.length).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0024
     * @tc.name testUint16ArrayConstructorEight024
     * @tc.desc Verify two views share the same buffer and changes reflect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Uint16Array = new Uint16Array(buf, 0, 2);
      let view2: Uint16Array = new Uint16Array(buf, 4, 2);
      view1[0] = 1111;
      view1[1] = 2222;
      expect(view2.buffer).assertEqual(view1.buffer);
      let view3: Uint16Array = new Uint16Array(buf, 0, 4);
      expect(view3[0]).assertEqual(1111);
      expect(view3[1]).assertEqual(2222);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0025
     * @tc.name testUint16ArrayConstructorEight025
     * @tc.desc Verify at() negative index on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 2, 4);
      dst[0] = 100;
      dst[1] = 200;
      dst[2] = 300;
      dst[3] = 400;
      expect(dst.at(-1)).assertEqual(400);
      expect(dst.at(-4)).assertEqual(100);
      expect(dst.at(-5)).assertUndefined();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_EIGHT_0026
     * @tc.name testUint16ArrayConstructorEight026
     * @tc.desc Verify $_set and $_get on non-zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorEight026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 4, 3);
      dst.$_set(0, 555);
      dst.$_set(1, 666);
      dst.$_set(2, 777);
      expect(dst.$_get(0)).assertEqual(555);
      expect(dst.$_get(1)).assertEqual(666);
      expect(dst.$_get(2)).assertEqual(777);
    });

  });
}
