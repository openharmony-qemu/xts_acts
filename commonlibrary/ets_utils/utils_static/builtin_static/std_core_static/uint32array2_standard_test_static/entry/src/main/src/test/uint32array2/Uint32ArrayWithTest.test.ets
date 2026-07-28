'use static';
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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayWithOneTest(): void {
  describe('Uint32ArrayWithOneTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0100
     * @tc.name testUint32ArrayWithOne001
     * @tc.desc Verify with(1, byteVal) replaces element at index 1 with byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 30;
      const r = src.with(1, v);
      expect(r.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0200
     * @tc.name testUint32ArrayWithOne002
     * @tc.desc Verify with(0, byteVal) replaces element at index 0 on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7);
      const v: byte = 9;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0300
     * @tc.name testUint32ArrayWithOne003
     * @tc.desc Verify with(2, v) replaces element at last index of length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const v: byte = 77;
      const r = src.with(2, v);
      expect(r.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0400
     * @tc.name testUint32ArrayWithOne004
     * @tc.desc Verify with(0, v) replaces first element on length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const v: byte = 100;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0500
     * @tc.name testUint32ArrayWithOne005
     * @tc.desc Verify with(2, v) replaces middle element on length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const v: byte = 33;
      const r = src.with(2, v);
      expect(r.$_get(2)).assertEqual(33);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0600
     * @tc.name testUint32ArrayWithOne006
     * @tc.desc Verify with(4, v) replaces last element on length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const v: byte = 55;
      const r = src.with(4, v);
      expect(r.$_get(4)).assertEqual(55);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0700
     * @tc.name testUint32ArrayWithOne007
     * @tc.desc Verify with(0, v) replaces first element on length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      const v: byte = 7;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0800
     * @tc.name testUint32ArrayWithOne008
     * @tc.desc Verify with(99, v) replaces last element on length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      const v: byte = 13;
      const r = src.with(99, v);
      expect(r.$_get(99)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_0900
     * @tc.name testUint32ArrayWithOne009
     * @tc.desc Verify with(-1, v) on length-3 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const v: number = 40;
      const index: int = -1;
      try {
        src.with(index, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1000
     * @tc.name testUint32ArrayWithOne010
     * @tc.desc Verify with(-1, v) on single-element array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const v: number = 19;
      const index: int = -1;
      try {
        src.with(index, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1100
     * @tc.name testUint32ArrayWithOne011
     * @tc.desc Verify with(-length, v) on length-100 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      const v: number = 21;
      const index: int = -100;
      try {
        src.with(index, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1200
     * @tc.name testUint32ArrayWithOne012
     * @tc.desc Verify with(length, v) on length-3 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const v: byte = 1;
      try {
        src.with(3, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1300
     * @tc.name testUint32ArrayWithOne013
     * @tc.desc Verify with(1, v) on single-element array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const v: byte = 1;
      try {
        src.with(1, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1400
     * @tc.name testUint32ArrayWithOne014
     * @tc.desc Verify with(0, v) on empty array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const v: byte = 1;
      try {
        src.with(0, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1500
     * @tc.name testUint32ArrayWithOne015
     * @tc.desc Verify with(length, v) on length-2 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 1;
      try {
        src.with(2, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1600
     * @tc.name testUint32ArrayWithOne016
     * @tc.desc Verify with(-length-2, v) on length-3 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const v: byte = 1;
      try {
        src.with(-5, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1700
     * @tc.name testUint32ArrayWithOne017
     * @tc.desc Verify with(int32 MIN, v) throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const v: byte = 1;
      try {
        src.with(-3, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1800
     * @tc.name testUint32ArrayWithOne018
     * @tc.desc Verify with(-2, v) on single-element array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const v: byte = 1;
      try {
        src.with(-2, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_1900
     * @tc.name testUint32ArrayWithOne019
     * @tc.desc Verify with(-1, v) on empty array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const v: byte = 1;
      try {
        src.with(-1, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2000
     * @tc.name testUint32ArrayWithOne020
     * @tc.desc Verify with(0, byte 0) stores 0 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 0;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2100
     * @tc.name testUint32ArrayWithOne021
     * @tc.desc Verify with(0, byte 13) returns copy with element 13 and leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 13;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(13);
      expect(src.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2200
     * @tc.name testUint32ArrayWithOne022
     * @tc.desc Verify with(0, byte 127) stores 127 verified via at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 127;
      const r = src.with(0, v);
      expect(r.at(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2300
     * @tc.name testUint32ArrayWithOne023
     * @tc.desc Verify with(1, byte 100) stores 100 at index 1 verified via at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 100;
      const r = src.with(1, v);
      expect(r.at(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2400
     * @tc.name testUint32ArrayWithOne024
     * @tc.desc Verify value=byte -2 wraps to uint32 4294967294 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = -2;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2500
     * @tc.name testUint32ArrayWithOne025
     * @tc.desc Verify with(0, byte -127) wraps to uint32 4294967169
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = -127;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(4294967169);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2600
     * @tc.name testUint32ArrayWithOne026
     * @tc.desc Verify with(0, byte -128) wraps to uint32 4294967168
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = -128;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(4294967168);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2700
     * @tc.name testUint32ArrayWithOne027
     * @tc.desc Verify with(0, Int.toByte(200)) wraps to uint32 4294967240
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = Int.toByte(200);
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(4294967240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2800
     * @tc.name testUint32ArrayWithOne028
     * @tc.desc Verify with(0, Int.toByte(255)) wraps to uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = Int.toByte(255);
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_2900
     * @tc.name testUint32ArrayWithOne029
     * @tc.desc Verify with(0, Int.toByte(300)) wraps byte to 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = Int.toByte(300);
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3000
     * @tc.name testUint32ArrayWithOne030
     * @tc.desc Verify with(0, Int.toByte(-129)) wraps byte to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = Int.toByte(-129);
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3100
     * @tc.name testUint32ArrayWithOne031
     * @tc.desc Verify with(0, byte 0o17) stores decimal 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 0o17;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(0o17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3200
     * @tc.name testUint32ArrayWithOne032
     * @tc.desc Verify with(1, byte 0) preserves other zero elements and length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0);
      const v: byte = 0;
      const r = src.with(1, v);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3300
     * @tc.name testUint32ArrayWithOne033
     * @tc.desc Verify with(0, byte 5) leaves duplicated element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 5, 5);
      const v: byte = 5;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3400
     * @tc.name testUint32ArrayWithOne034
     * @tc.desc Verify with(0, byte 0) replaces first element while uint32 MAX at index 1 remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295, 4294967295);
      const v: byte = 0;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3500
     * @tc.name testUint32ArrayWithOne035
     * @tc.desc Verify with(1, byte 9) replaces middle element and leaves index 0 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0, 0);
      const v: byte = 9;
      const r = src.with(1, v);
      expect(r.$_get(1)).assertEqual(9);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3600
     * @tc.name testUint32ArrayWithOne036
     * @tc.desc Verify with(0, byte 1) replaces sole element on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0);
      const v: byte = 1;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3700
     * @tc.name testUint32ArrayWithOne037
     * @tc.desc Verify with() result length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4, 5);
      const v: byte = 9;
      const r = src.with(2, v);
      expect(r.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3800
     * @tc.name testUint32ArrayWithOne038
     * @tc.desc Verify with() result BYTES_PER_ELEMENT equals 4 for Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 9;
      const r = src.with(0, v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_3900
     * @tc.name testUint32ArrayWithOne039
     * @tc.desc Verify with() result byteOffset equals 0 for standalone typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 9;
      const r = src.with(0, v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4000
     * @tc.name testUint32ArrayWithOne040
     * @tc.desc Verify with() returns copy with element at index replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22, 33, 44);
      const v: byte = 99;
      const r = src.with(2, v);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(99);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4100
     * @tc.name testUint32ArrayWithOne041
     * @tc.desc Verify chained with(0,a).with(2,b) applies both replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const a: byte = 10;
      const b: byte = 20;
      const r = src.with(0, a).with(2, b);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4200
     * @tc.name testUint32ArrayWithOne042
     * @tc.desc Verify chained with() on same index keeps the last written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const a: byte = 10;
      const b: byte = 20;
      const r = src.with(1, a).with(1, b);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4300
     * @tc.name testUint32ArrayWithOne043
     * @tc.desc Verify toString() on with() result renders '1,7,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 7;
      const r = src.with(1, v);
      expect(r.toString()).assertEqual('1,7,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4400
     * @tc.name testUint32ArrayWithOne044
     * @tc.desc Verify join('|') on with() result renders '1|7|3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 7;
      const r = src.with(1, v);
      expect(r.join('|')).assertEqual('1|7|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4500
     * @tc.name testUint32ArrayWithOne045
     * @tc.desc Verify valueOf() on with() result returns typed array with replaced element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 7;
      const r = src.with(1, v);
      expect(r.valueOf().$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4600
     * @tc.name testUint32ArrayWithOne046
     * @tc.desc Verify with() result is writable via $_set independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 7;
      const r = src.with(1, v);
      expect(r.$_get(1)).assertEqual(7);
      r.$_set(0, 100);
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4700
     * @tc.name testUint32ArrayWithOne047
     * @tc.desc Verify with(0, v) on single-element array length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5);
      const v: byte = 9;
      const r = src.with(0, v);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4800
     * @tc.name testUint32ArrayWithOne048
     * @tc.desc Verify with(-1, b) on with() result throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const a: number = 10;
      const b: number = 20;
      const r1 = src.with(0, a);
      try {
        r1.with(-1, b);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_4900
     * @tc.name testUint32ArrayWithOne049
     * @tc.desc Verify with() result byteLength equals 16 for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const v: byte = 9;
      const r = src.with(0, v);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5000
     * @tc.name testUint32ArrayWithOne050
     * @tc.desc Verify with() returns copy replacing $_get(0) and does not mutate source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 99;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(99);
      expect(src.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5100
     * @tc.name testUint32ArrayWithOne051
     * @tc.desc Verify with() does not mutate source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20, 30);
      const v: byte = 99;
      src.with(1, v);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5200
     * @tc.name testUint32ArrayWithOne052
     * @tc.desc Verify with() does not mutate source verified via at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 99;
      src.with(0, v);
      expect(src.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5300
     * @tc.name testUint32ArrayWithOne053
     * @tc.desc Verify $_set on with() result does not propagate to source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 99;
      const r = src.with(0, v);
      r.$_set(1, 100);
      expect(src.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5400
     * @tc.name testUint32ArrayWithOne054
     * @tc.desc Verify with() returns a copy independent of original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 99;
      const r = src.with(0, v);
      src.$_set(0, 5);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5500
     * @tc.name testUint32ArrayWithOne055
     * @tc.desc Verify with() does not mutate source toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 99;
      src.with(1, v);
      expect(src.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5600
     * @tc.name testUint32ArrayWithOne056
     * @tc.desc Verify with() does not resize source buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 99;
      src.with(1, v);
      expect(src.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5700
     * @tc.name testUint32ArrayWithOne057
     * @tc.desc Verify with() does not mutate source elements at other indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22, 33);
      const v: byte = 99;
      src.with(1, v);
      expect(src.$_get(0)).assertEqual(11);
      expect(src.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5800
     * @tc.name testUint32ArrayWithOne058
     * @tc.desc Verify with(102, v) beyond length-2 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 1;
      try {
        src.with(102, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_5900
     * @tc.name testUint32ArrayWithOne059
     * @tc.desc Verify with(-length-1, v) on length-2 array throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const v: byte = 1;
      try {
        src.with(-3, v);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6000
     * @tc.name testUint32ArrayWithOne060
     * @tc.desc Verify with(1, byte 0) stores 0 at index 1 and index 0 remains 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(99, 99);
      const v: byte = 0;
      const r = src.with(1, v);
      expect(r.at(1)).assertEqual(0);
      expect(r.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6100
     * @tc.name testUint32ArrayWithOne061
     * @tc.desc Verify with(0, byte -1) wraps to uint32 MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 0);
      const v: byte = -1;
      const r = src.with(0, v);
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6200
     * @tc.name testUint32ArrayWithOne062
     * @tc.desc Verify with(0, byte 1) stores 1 at index 0 verified via at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 99);
      const v: byte = 1;
      const r = src.with(0, v);
      expect(r.at(0)).assertEqual(1);
      expect(r.at(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6300
     * @tc.name testUint32ArrayWithOne063
     * @tc.desc Verify with() on offset view returns result with byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 4, 2);
      const v: byte = 7;
      const r = view.with(0, v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6400
     * @tc.name testUint32ArrayWithOne064
     * @tc.desc Verify with(0, v) on offset view returns replaced copy and leaves view unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 4, 2);
      view.$_set(0, 5);
      const v: byte = 7;
      const r = view.with(0, v);
      expect(r.$_get(0)).assertEqual(7);
      expect(view.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6500
     * @tc.name testUint32ArrayWithOne065
     * @tc.desc Verify subarray(0,2) on with() result reflects replaced element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const v: byte = 9;
      const r = src.with(0, v);
      const sub = r.subarray(0, 2);
      expect(sub.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6600
     * @tc.name testUint32ArrayWithOne066
     * @tc.desc Verify slice(0,2) on with() result is independent of subsequent $_set on parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3, 4);
      const v: byte = 9;
      const r = src.with(0, v);
      const s = r.slice(0, 2);
      r.$_set(0, 0);
      expect(s.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6700
     * @tc.name testUint32ArrayWithOne067
     * @tc.desc Verify with() result buffer.byteLength equals 12 for length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const v: byte = 9;
      const r = src.with(0, v);
      expect(r.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_WITH_6800
     * @tc.name testUint32ArrayWithOne068
     * @tc.desc Verify chained with() on with() result is independent of parent $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayWithOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const a: byte = 10;
      const r1 = src.with(0, a);
      const b: byte = 20;
      const r2 = r1.with(1, b);
      r1.$_set(0, 0);
      expect(r2.$_get(0)).assertEqual(10);
    });

  });
}
