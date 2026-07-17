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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySetTest(): void {
  describe('Uint32ArraySetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0010
     * @tc.name testUint32ArraySetPartOne001
     * @tc.desc Verify arity=2 E byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      const v: byte = 10;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0020
     * @tc.name testUint32ArraySetPartOne002
     * @tc.desc Verify arity=2 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 42);
      expect(a.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0030
     * @tc.name testUint32ArraySetPartOne003
     * @tc.desc Verify arity=2 E uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      const v: byte = 127;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0040
     * @tc.name testUint32ArraySetPartOne004
     * @tc.desc Verify arity=2 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 3.14);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0050
     * @tc.name testUint32ArraySetPartOne005
     * @tc.desc Verify arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 2, 3);
      a.$_set(1, 99);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(99);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0060
     * @tc.name testUint32ArraySetPartOne006
     * @tc.desc Verify arity=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0070
     * @tc.name testUint32ArraySetPartOne007
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 7);
      expect(a.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0080
     * @tc.name testUint32ArraySetPartOne008
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(11, 22, 33);
      a.$_set(0, 100);
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(22);
      expect(a.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0090
     * @tc.name testUint32ArraySetPartOne009
     * @tc.desc Verify index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(5, 6, 7);
      a.$_set(1, 888);
      expect(a.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0100
     * @tc.name testUint32ArraySetPartOne010
     * @tc.desc Verify index=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(9, 8, 7);
      a.$_set(2, 555);
      expect(a.$_get(2)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0110
     * @tc.name testUint32ArraySetPartOne011
     * @tc.desc Verify index=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(10, 20, 30);
      try {
        a.$_set(3, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0120
     * @tc.name testUint32ArraySetPartOne012
     * @tc.desc Verify index=length+1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 2, 3, 4);
      try {
        a.$_set(5, 777);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0130
     * @tc.name testUint32ArraySetPartOne013
     * @tc.desc Verify index=length+100 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(100, 200);
      try {
        a.$_set(102, 5555);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(100);
      expect(a.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0140
     * @tc.name testUint32ArraySetPartOne014
     * @tc.desc Verify index=2147483647 int32.MAX no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(3, 6, 9);
      try {
        a.$_set(2147483647, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0150
     * @tc.name testUint32ArraySetPartOne015
     * @tc.desc Verify index=-1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(15, 25, 35);
      try {
        a.$_set(-1, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(15);
      expect(a.$_get(2)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0160
     * @tc.name testUint32ArraySetPartOne016
     * @tc.desc Verify index=-length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(101, 202, 303);
      try {
        a.$_set(-3, 404);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0170
     * @tc.name testUint32ArraySetPartOne017
     * @tc.desc Verify index=-length-1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(7, 8, 9, 10);
      try {
        a.$_set(-5, 9999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0180
     * @tc.name testUint32ArraySetPartOne018
     * @tc.desc Verify index=-2147483648 int32.MIN no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 2);
      try {
        a.$_set(-2147483648, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0190
     * @tc.name testUint32ArraySetPartOne019
     * @tc.desc Verify index=-2147483647 int32.MIN+1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(11, 22, 33);
      try {
        a.$_set(-2147483647, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0200
     * @tc.name testUint32ArraySetPartOne020
     * @tc.desc Verify index=0 length=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(0);
      try {
        a.$_set(0, 123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0210
     * @tc.name testUint32ArraySetPartOne021
     * @tc.desc Verify index=length-1 -1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(0);
      try {
        a.$_set(-1, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0220
     * @tc.name testUint32ArraySetPartOne022
     * @tc.desc Verify index=255 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(256);
      a.$_set(255, 4294967295);
      expect(a.$_get(255)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0230
     * @tc.name testUint32ArraySetPartOne023
     * @tc.desc Verify index=65535 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(65536);
      a.$_set(65535, 123456);
      expect(a.$_get(65535)).assertEqual(123456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0240
     * @tc.name testUint32ArraySetPartOne024
     * @tc.desc Verify index=65536 65536 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(65536);
      try {
        a.$_set(65536, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0250
     * @tc.name testUint32ArraySetPartOne025
     * @tc.desc Verify index=256 256 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(256);
      try {
        a.$_set(256, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(255)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0260
     * @tc.name testUint32ArraySetPartOne026
     * @tc.desc Verify index=100 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1000);
      a.$_set(100, 777);
      expect(a.$_get(100)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0270
     * @tc.name testUint32ArraySetPartOne027
     * @tc.desc Verify index=0 fill(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(7);
      a.$_set(0, 909);
      expect(a.$_get(0)).assertEqual(909);
      expect(a.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0280
     * @tc.name testUint32ArraySetPartOne028
     * @tc.desc Verify $_set(0, 222) -> a.$_get(0) = 222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 111);
      a.$_set(0, 222);
      expect(a.$_get(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0290
     * @tc.name testUint32ArraySetPartOne029
     * @tc.desc Verify index=0 index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 1, 1);
      a.$_set(0, 10);
      a.$_set(2, 30);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0300
     * @tc.name testUint32ArraySetPartOne030
     * @tc.desc Verify index byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const before = a.byteLength;
      a.$_set(1, 4294967295);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0310
     * @tc.name testUint32ArraySetPartOne031
     * @tc.desc Verify index length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(2, 4, 6);
      const before = a.length;
      a.$_set(0, 999);
      expect(a.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0320
     * @tc.name testUint32ArraySetPartOne032
     * @tc.desc Verify subarray index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 2, 3, 4);
      const v = a.subarray(1, 3);
      v.$_set(0, 50);
      expect(a.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0330
     * @tc.name testUint32ArraySetPartOne033
     * @tc.desc Verify index=9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(10000);
      a.$_set(9999, 4242);
      expect(a.$_get(9999)).assertEqual(4242);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0340
     * @tc.name testUint32ArraySetPartOne034
     * @tc.desc Verify index=1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(8, 9);
      a.$_set(1, 16);
      expect(a.$_get(1)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0350
     * @tc.name testUint32ArraySetPartOne035
     * @tc.desc Verify index=2 2 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(8, 9);
      try {
        a.$_set(2, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0360
     * @tc.name testUint32ArraySetPartOne036
     * @tc.desc Verify index=0 index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(20, 40);
      a.$_set(0, 5);
      expect(a.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0370
     * @tc.name testUint32ArraySetPartOne037
     * @tc.desc Verify $_set at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.$_set(1, 333);
      expect(a.at(1)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0380
     * @tc.name testUint32ArraySetPartOne038
     * @tc.desc Verify index=128 256 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(256);
      a.$_set(128, 65535);
      expect(a.$_get(128)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0390
     * @tc.name testUint32ArraySetPartOne039
     * @tc.desc Verify index=1023 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1024);
      a.$_set(1023, 1);
      expect(a.$_get(1023)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0400
     * @tc.name testUint32ArraySetPartOne040
     * @tc.desc Verify index=1024 1024 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1024);
      try {
        a.$_set(1024, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0410
     * @tc.name testUint32ArraySetPartOne041
     * @tc.desc Verify index=-1 1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(64);
      try {
        a.$_set(-1, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0420
     * @tc.name testUint32ArraySetPartOne042
     * @tc.desc Verify value=0 uint32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0430
     * @tc.name testUint32ArraySetPartOne043
     * @tc.desc Verify value=4294967295 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967295);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0440
     * @tc.name testUint32ArraySetPartOne044
     * @tc.desc Verify value=4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967296);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0450
     * @tc.name testUint32ArraySetPartOne045
     * @tc.desc Verify value=4294967297 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967297);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0460
     * @tc.name testUint32ArraySetPartOne046
     * @tc.desc Verify value=-1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -1);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0470
     * @tc.name testUint32ArraySetPartOne047
     * @tc.desc Verify value=-2 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -2);
      expect(a.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0480
     * @tc.name testUint32ArraySetPartOne048
     * @tc.desc Verify value=-4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -4294967296);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0490
     * @tc.name testUint32ArraySetPartOne049
     * @tc.desc Verify value=-4294967295 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -4294967295);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0500
     * @tc.name testUint32ArraySetPartOne050
     * @tc.desc Verify value=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0510
     * @tc.name testUint32ArraySetPartOne051
     * @tc.desc Verify value=Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0520
     * @tc.name testUint32ArraySetPartOne052
     * @tc.desc Verify value=-Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0530
     * @tc.name testUint32ArraySetPartOne053
     * @tc.desc Verify value=3.99 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 3.99);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0540
     * @tc.name testUint32ArraySetPartOne054
     * @tc.desc Verify value=-3.14 -3 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -3.14);
      expect(a.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0550
     * @tc.name testUint32ArraySetPartOne055
     * @tc.desc Verify value=2147483647 int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 2147483647);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0560
     * @tc.name testUint32ArraySetPartOne056
     * @tc.desc Verify value=2147483648 int32.MAX+1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 2147483648);
      expect(a.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0570
     * @tc.name testUint32ArraySetPartOne057
     * @tc.desc Verify value=-2147483648 int32.MIN 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -2147483648);
      expect(a.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0580
     * @tc.name testUint32ArraySetPartOne058
     * @tc.desc Verify value=-2147483647 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -2147483647);
      expect(a.$_get(0)).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0590
     * @tc.name testUint32ArraySetPartOne059
     * @tc.desc Verify value=0o37777777777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0o37777777777);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0600
     * @tc.name testUint32ArraySetPartOne060
     * @tc.desc Verify value=0o40000000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0o40000000000);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0610
     * @tc.name testUint32ArraySetPartOne061
     * @tc.desc Verify value=0b11111111111111111111111111111111 32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0b11111111111111111111111111111111);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0620
     * @tc.name testUint32ArraySetPartOne062
     * @tc.desc Verify value=0b100000000000000000000000000000000 33 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0b100000000000000000000000000000000);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0630
     * @tc.name testUint32ArraySetPartOne063
     * @tc.desc Verify value=1e9 1000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1e9);
      expect(a.$_get(0)).assertEqual(1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0640
     * @tc.name testUint32ArraySetPartOne064
     * @tc.desc Verify value=2e9 2000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 2e9);
      expect(a.$_get(0)).assertEqual(2000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0650
     * @tc.name testUint32ArraySetPartOne065
     * @tc.desc Verify value=1e10 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1e10);
      expect(a.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0660
     * @tc.name testUint32ArraySetPartOne066
     * @tc.desc Verify value=9007199254740991 MAX_SAFE_INTEGER 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 9007199254740991);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0670
     * @tc.name testUint32ArraySetPartOne067
     * @tc.desc Verify value=9007199254740992 MAX_SAFE_INTEGER+1 2^53 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 9007199254740992);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0680
     * @tc.name testUint32ArraySetPartOne068
     * @tc.desc Verify value=2.220446049250313e-16 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 2.220446049250313e-16);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0690
     * @tc.name testUint32ArraySetPartOne069
     * @tc.desc Verify value=5e-324 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 5e-324);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0700
     * @tc.name testUint32ArraySetPartOne070
     * @tc.desc Verify value=-0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0710
     * @tc.name testUint32ArraySetPartOne071
     * @tc.desc Verify value=0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0.5);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0720
     * @tc.name testUint32ArraySetPartOne072
     * @tc.desc Verify value=1.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1.5);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0730
     * @tc.name testUint32ArraySetPartOne073
     * @tc.desc Verify value=-0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -0.5);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0740
     * @tc.name testUint32ArraySetPartOne074
     * @tc.desc Verify value=-1.5 -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -1.5);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0750
     * @tc.name testUint32ArraySetPartOne075
     * @tc.desc Verify value=4294967295.99 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967295.99);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0760
     * @tc.name testUint32ArraySetPartOne076
     * @tc.desc Verify value=-2147483648.5 -2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -2147483648.5);
      expect(a.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0770
     * @tc.name testUint32ArraySetPartOne077
     * @tc.desc Verify value=2147483647.5 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 2147483647.5);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0780
     * @tc.name testUint32ArraySetPartOne078
     * @tc.desc Verify value byte 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      const v: byte = 0;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0790
     * @tc.name testUint32ArraySetPartOne079
     * @tc.desc Verify value byte -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      const v: byte = -1;
      a.$_set(0, v);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0800
     * @tc.name testUint32ArraySetPartOne080
     * @tc.desc Verify value=Math.PI 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, Math.PI);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0810
     * @tc.name testUint32ArraySetPartOne081
     * @tc.desc Verify value=Math.E 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, Math.E);
      expect(a.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0820
     * @tc.name testUint32ArraySetPartOne082
     * @tc.desc Verify value=1/3 0.333 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1 / 3);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0830
     * @tc.name testUint32ArraySetPartOne083
     * @tc.desc Verify value=-5 4294967291
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -5);
      expect(a.$_get(0)).assertEqual(4294967291);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0840
     * @tc.name testUint32ArraySetPartOne084
     * @tc.desc Verify value=4294967300 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967300);
      expect(a.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0850
     * @tc.name testUint32ArraySetPartOne085
     * @tc.desc Verify value=8589934591 2^33-1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 8589934591);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0860
     * @tc.name testUint32ArraySetPartOne086
     * @tc.desc Verify value=8589934592 2^33 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 8589934592);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0870
     * @tc.name testUint32ArraySetPartOne087
     * @tc.desc Verify value=1.999 2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1.999);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0880
     * @tc.name testUint32ArraySetPartOne088
     * @tc.desc Verify value=4294967294 uint32 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967294);
      expect(a.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0890
     * @tc.name testUint32ArraySetPartOne089
     * @tc.desc Verify value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0900
     * @tc.name testUint32ArraySetPartOne090
     * @tc.desc Verify value=255 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 255);
      expect(a.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0910
     * @tc.name testUint32ArraySetPartOne091
     * @tc.desc Verify value=65535 uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 65535);
      expect(a.$_get(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0920
     * @tc.name testUint32ArraySetPartOne092
     * @tc.desc Verify MAX MAX+1 MAX+2 -> 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967295);
      a.$_set(0, 4294967296);
      a.$_set(0, 4294967297);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0930
     * @tc.name testUint32ArraySetPartOne093
     * @tc.desc Verify $_set(0, 4294967296) -> a.$_get(0) = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967295);
      a.$_set(0, 4294967296);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0940
     * @tc.name testUint32ArraySetPartOne094
     * @tc.desc Verify 0 -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 0);
      a.$_set(0, -1);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0950
     * @tc.name testUint32ArraySetPartOne095
     * @tc.desc Verify $_set(1, -1) -> a.$_get(0) = 0; a.$_get(1) = 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.$_set(0, 4294967296);
      a.$_set(1, -1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0960
     * @tc.name testUint32ArraySetPartOne096
     * @tc.desc Verify 2^33 2^33-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.$_set(0, 8589934592);
      a.$_set(1, 8589934591);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0970
     * @tc.name testUint32ArraySetPartOne097
     * @tc.desc Verify $_set(2, 4294967296) -> a.$_get(0) = 0; a.$_get(1) = 0; a.$_get(2) = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.$_set(0, 4294967296);
      a.$_set(1, 4294967296);
      a.$_set(2, 4294967296);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0980
     * @tc.name testUint32ArraySetPartOne098
     * @tc.desc Verify 2^32 2^33 3*2^32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967296);
      a.$_set(0, 8589934592);
      a.$_set(0, 12884901888);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_0990
     * @tc.name testUint32ArraySetPartOne099
     * @tc.desc Verify -1 1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -1);
      a.$_set(0, 1);
      a.$_set(0, -1);
      expect(a.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_1000
     * @tc.name testUint32ArraySetPartOne100
     * @tc.desc Verify -2^32 -2^32+1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.$_set(0, -4294967296);
      a.$_set(1, -4294967295);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_1010
     * @tc.name testUint32ArraySetPartOne101
     * @tc.desc Verify $_set(0, 0) -> a.$_get(0) = 4294967295; a.$_get(0) = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 4294967295);
      expect(a.$_get(0)).assertEqual(4294967295);
      a.$_set(0, 0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_1020
     * @tc.name testUint32ArraySetPartOne102
     * @tc.desc Verify -2 2^32+k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, -2);
      a.$_set(0, 4294967298);
      expect(a.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_1030
     * @tc.name testUint32ArraySetPartOne103
     * @tc.desc Verify index=0 MAX-1 index=1 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.$_set(0, 4294967294);
      a.$_set(1, 4294967295);
      expect(a.$_get(0)).assertEqual(4294967294);
      expect(a.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_PARTONE_1040
     * @tc.name testUint32ArraySetPartOne104
     * @tc.desc Verify 1e15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetPartOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.$_set(0, 1e15);
      expect(a.$_get(0)).assertEqual(1e15 % 4294967296);
    });

  });
}
