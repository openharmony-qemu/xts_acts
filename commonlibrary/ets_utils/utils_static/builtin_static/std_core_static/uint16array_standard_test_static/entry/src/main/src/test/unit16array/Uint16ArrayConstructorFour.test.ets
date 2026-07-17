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

export default function uint16ArrayConstructor04Test(): void {
  describe('Uint16ArrayConstructor04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0001
     * @tc.name testUint16ArrayConstructorFour001
     * @tc.desc Verify byteOffset 1.9 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 1.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0002
     * @tc.name testUint16ArrayConstructorFour002
     * @tc.desc Verify byteOffset 0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0.5);
      expect(arr.byteOffset).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0003
     * @tc.name testUint16ArrayConstructorFour003
     * @tc.desc Verify byteOffset NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, Number.NaN);
      expect(arr.byteOffset).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0004
     * @tc.name testUint16ArrayConstructorFour004
     * @tc.desc Verify byteOffset Infinity RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint16Array = new Uint16Array(buf, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0005
     * @tc.name testUint16ArrayConstructorFour005
     * @tc.desc Verify byteOffset -Infinity RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint16Array = new Uint16Array(buf, -Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0006
     * @tc.name testUint16ArrayConstructorFour006
     * @tc.desc Verify byteOffset 0x2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0x2);
      expect(arr.byteOffset).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0007
     * @tc.name testUint16ArrayConstructorFour007
     * @tc.desc Verify byteOffset 0b10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0b10);
      expect(arr.byteOffset).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0008
     * @tc.name testUint16ArrayConstructorFour008
     * @tc.desc Verify byteOffset 0o2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0o2);
      expect(arr.byteOffset).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0009
     * @tc.name testUint16ArrayConstructorFour009
     * @tc.desc Verify byteOffset=2 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2.0);
      expect(arr.length).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0010
     * @tc.name testUint16ArrayConstructorFour010
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.buffer).assertEqual(buf);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0011
     * @tc.name testUint16ArrayConstructorFour011
     * @tc.desc Verify byteOffset=8 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 8.0);
      expect(arr.byteLength).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0012
     * @tc.name testUint16ArrayConstructorFour012
     * @tc.desc Verify byteOffset=2 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2.0);
      expect(arr.byteLength).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0013
     * @tc.name testUint16ArrayConstructorFour013
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0014
     * @tc.name testUint16ArrayConstructorFour014
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0.0);
      expect(arr.at(1)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0015
     * @tc.name testUint16ArrayConstructorFour015
     * @tc.desc Verify 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 4.0);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0016
     * @tc.name testUint16ArrayConstructorFour016
     * @tc.desc Verify byteOffset=-2 (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Uint16Array = new Uint16Array(buf, -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0017
     * @tc.name testUint16ArrayConstructorFour017
     * @tc.desc Verify byteOffset=0x4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf, 0x4);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0018
     * @tc.name testUint16ArrayConstructorFour018
     * @tc.desc Verify byteOffset=2.999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 2.999999);
      expect(arr.byteOffset).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0019
     * @tc.name testUint16ArrayConstructorFour019
     * @tc.desc Verify constructor with buffer and byteOffset=0 on empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0020
     * @tc.name testUint16ArrayConstructorFour020
     * @tc.desc Verify Uint16Array constructor two identical buffer views share writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let first: Uint16Array = new Uint16Array(buffer);
            let second: Uint16Array = new Uint16Array(buffer);
            first[2] = 42;
            expect(second.at(2)).assertEqual(42);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0021
     * @tc.name testUint16ArrayConstructorFour021
     * @tc.desc Verify Uint16Array constructor overlapping buffer views share their overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let first: Uint16Array = new Uint16Array(buffer, 0, 3);
            let second: Uint16Array = new Uint16Array(buffer, 2, 3);
            first[1] = 77;
            expect(second.at(0)).assertEqual(77);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0022
     * @tc.name testUint16ArrayConstructorFour022
     * @tc.desc Verify Uint16Array constructor adjacent buffer views do not overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let first: Uint16Array = new Uint16Array(buffer, 0, 2);
            let second: Uint16Array = new Uint16Array(buffer, 4, 2);
            first[1] = 55;
            expect(second.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0023
     * @tc.name testUint16ArrayConstructorFour023
     * @tc.desc Verify Uint16Array constructor last aligned byte offset creates an empty tail view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let view: Uint16Array = new Uint16Array(buffer, 8);
            expect(view.length).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0024
     * @tc.name testUint16ArrayConstructorFour024
     * @tc.desc Verify Uint16Array constructor last aligned element offset creates a one-element view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let view: Uint16Array = new Uint16Array(buffer, 6, 1);
            expect(view.length).assertEqual(1);
            expect(view.byteOffset).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0025
     * @tc.name testUint16ArrayConstructorFour025
     * @tc.desc Verify Uint16Array constructor explicit zero length at a middle offset is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let view: Uint16Array = new Uint16Array(buffer, 4, 0);
            expect(view.length).assertEqual(0);
            expect(view.byteOffset).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0026
     * @tc.name testUint16ArrayConstructorFour026
     * @tc.desc Verify Uint16Array constructor explicit length exactly consumes the buffer remainder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
            let view: Uint16Array = new Uint16Array(buffer, 4, 3);
            expect(view.byteLength).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0027
     * @tc.name testUint16ArrayConstructorFour027
     * @tc.desc Verify Uint16Array constructor misaligned offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            try { new Uint16Array(buffer, 1); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('RangeError'); }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0028
     * @tc.name testUint16ArrayConstructorFour028
     * @tc.desc Verify Uint16Array constructor offset beyond buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            try { new Uint16Array(buffer, 10); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('RangeError'); }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0029
     * @tc.name testUint16ArrayConstructorFour029
     * @tc.desc Verify Uint16Array constructor length beyond the buffer remainder throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            try { new Uint16Array(buffer, 4, 3); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('RangeError'); }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0030
     * @tc.name testUint16ArrayConstructorFour030
     * @tc.desc Verify Uint16Array constructor failed misaligned construction leaves existing view unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            let existing: Uint16Array = new Uint16Array(buffer);
            existing[0] = 12;
            try {
              new Uint16Array(buffer, 1);
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('RangeError');
            }
            expect(existing.at(0)).assertEqual(12);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0031
     * @tc.name testUint16ArrayConstructorFour031
     * @tc.desc Verify Uint16Array constructor failed oversized construction leaves buffer length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
            try {
              new Uint16Array(buffer, 0, 5);
              expect().assertFail();
            } catch (e) {
              expect(e.name).assertEqual('RangeError');
            }
            expect(buffer.byteLength).assertEqual(8);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0032
     * @tc.name testUint16ArrayConstructorFour032
     * @tc.desc Verify Uint16Array constructor copy construction preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let copy: Uint16Array = new Uint16Array(source);
            expect(copy.at(0)).assertEqual(1);
            expect(copy.at(2)).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0033
     * @tc.name testUint16ArrayConstructorFour033
     * @tc.desc Verify Uint16Array constructor copy construction creates independent storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let copy: Uint16Array = new Uint16Array(source);
            copy[0] = 9;
            expect(source.at(0)).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0034
     * @tc.name testUint16ArrayConstructorFour034
     * @tc.desc Verify Uint16Array constructor source mutation after copy construction does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let copy: Uint16Array = new Uint16Array(source);
            source[1] = 8;
            expect(copy.at(1)).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0035
     * @tc.name testUint16ArrayConstructorFour035
     * @tc.desc Verify Uint16Array constructor array construction converts negative values to Uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [-1.0, -2.0];
            let result: Uint16Array = new Uint16Array(source);
            expect(result.at(0)).assertEqual(65535);
            expect(result.at(1)).assertEqual(65534);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0036
     * @tc.name testUint16ArrayConstructorFour036
     * @tc.desc Verify Uint16Array constructor array construction converts values above maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [65536.0, 65537.0];
            let result: Uint16Array = new Uint16Array(source);
            expect(result.at(0)).assertEqual(0);
            expect(result.at(1)).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0037
     * @tc.name testUint16ArrayConstructorFour037
     * @tc.desc Verify Uint16Array constructor array construction truncates fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [1.9, 2.9];
            let result: Uint16Array = new Uint16Array(source);
            expect(result.at(0)).assertEqual(1);
            expect(result.at(1)).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0038
     * @tc.name testUint16ArrayConstructorFour038
     * @tc.desc Verify Uint16Array constructor empty array construction produces zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
            let result: Uint16Array = new Uint16Array(source);
            expect(result.length).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0039
     * @tc.name testUint16ArrayConstructorFour039
     * @tc.desc Verify Uint16Array constructor buffer view metadata reflects offset and explicit length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
            let view: Uint16Array = new Uint16Array(buffer, 2, 4);
            expect(view.byteOffset).assertEqual(2);
            expect(view.byteLength).assertEqual(8);
            expect(view.length).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0040
     * @tc.name testUint16ArrayConstructorFour040
     * @tc.desc Verify copy construction from an offset view copies only the visible range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let source: Uint16Array = new Uint16Array(backing.buffer, 2, 2);
      let copy: Uint16Array = new Uint16Array(source);
      backing[1] = 99;
      expect(copy.length).assertEqual(2);
      expect(copy.byteOffset).assertEqual(0);
      expect(copy.at(0)).assertEqual(20);
      expect(copy.at(1)).assertEqual(30);
      copy[0] = 88;
      expect(source.at(0)).assertEqual(99);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_FOUR_0041
     * @tc.name testUint16ArrayConstructorFour041
     * @tc.desc Verify implicit construction from an odd-sized buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(9);
      try {
        new Uint16Array(buffer);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
