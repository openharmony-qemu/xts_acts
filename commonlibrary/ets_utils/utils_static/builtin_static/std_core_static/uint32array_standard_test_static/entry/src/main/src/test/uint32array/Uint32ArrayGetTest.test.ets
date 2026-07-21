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
export default function uint32ArrayGetTest(): void {
  describe('Uint32ArrayGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0100
     * @tc.name testUint32ArrayGetPartOne001
     * @tc.desc Verify arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20);
      const r: number = values[0];
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0200
     * @tc.name testUint32ArrayGetPartOne002
     * @tc.desc Verify arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(99);
      const r: number = values[0];
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0300
     * @tc.name testUint32ArrayGetPartOne003
     * @tc.desc Verify index=2147483647 (int32.MAX) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20);
      try {
        values[2147483647];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0400
     * @tc.name testUint32ArrayGetPartOne004
     * @tc.desc Verify index=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      try {
        values[-1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0500
     * @tc.name testUint32ArrayGetPartOne005
     * @tc.desc Verify index=4-1 (4 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: number = values[4 - 1];
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0600
     * @tc.name testUint32ArrayGetPartOne006
     * @tc.desc Verify index=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      try {
        values[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0700
     * @tc.name testUint32ArrayGetPartOne007
     * @tc.desc Verify index=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(99);
      try {
        values[1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0800
     * @tc.name testUint32ArrayGetPartOne008
     * @tc.desc Verify 65535 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(65535);
      values[0] = 42;
      const r: number = values[0];
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_0900
     * @tc.name testUint32ArrayGetPartOne009
     * @tc.desc Verify 65535 index=65535 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(65535);
      try {
        values[65535];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1000
     * @tc.name testUint32ArrayGetPartOne010
     * @tc.desc Verify 100 index=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(100);
      values[99] = 8;
      const r: number = values[99];
      expect(r).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1100
     * @tc.name testUint32ArrayGetPartOne011
     * @tc.desc Verify 100 index=100 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(100);
      try {
        values[100];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1200
     * @tc.name testUint32ArrayGetPartOne012
     * @tc.desc Verify index=0 0 (uint32.MIN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0);
      const r: number = values[0];
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1300
     * @tc.name testUint32ArrayGetPartOne013
     * @tc.desc Verify index=0 4294967295 (uint32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967295);
      const r: number = values[0];
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1400
     * @tc.name testUint32ArrayGetPartOne014
     * @tc.desc Verify index=0 0x80000000 (int32 +1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0x80000000);
      const r: number = values[0];
      expect(r).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1500
     * @tc.name testUint32ArrayGetPartOne015
     * @tc.desc Verify index=0 2147483647 (int32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(2147483647);
      const r: number = values[0];
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1600
     * @tc.name testUint32ArrayGetPartOne016
     * @tc.desc Verify index=0 1 (uint32.MIN+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1);
      const r: number = values[0];
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1700
     * @tc.name testUint32ArrayGetPartOne017
     * @tc.desc Verify index=0 4294967294 (uint32.MAX-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(4294967294);
      const r: number = values[0];
      expect(r).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1800
     * @tc.name testUint32ArrayGetPartOne018
     * @tc.desc Verify index=0 0 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 4294967295);
      const a: number = values[0];
      const b: number = values[1];
      expect(a).assertEqual(0);
      expect(b).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_1900
     * @tc.name testUint32ArrayGetPartOne019
     * @tc.desc Verify 2 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(11, 22);
      const r: number = values[0];
      expect(r).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2000
     * @tc.name testUint32ArrayGetPartOne020
     * @tc.desc Verify 2 index=2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(11, 22);
      try {
        values[2];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2100
     * @tc.name testUint32ArrayGetPartOne021
     * @tc.desc Verify 3 index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 6, 7);
      const r: number = values[2];
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2200
     * @tc.name testUint32ArrayGetPartOne022
     * @tc.desc Verify 3 index=3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(5, 6, 7);
      try {
        values[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2300
     * @tc.name testUint32ArrayGetPartOne023
     * @tc.desc Verify $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20);
      values[0] = 100;
      const r: number = values[0];
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2400
     * @tc.name testUint32ArrayGetPartOne024
     * @tc.desc Verify $_set $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values[2] = 999;
      const r: number = values[values.length - 1];
      expect(r).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2500
     * @tc.name testUint32ArrayGetPartOne025
     * @tc.desc Verify [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(42, 43);
      const r1: number = values[0];
      const r2: number = values[0];
      expect(r1).assertEqual(42);
      expect(r2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2600
     * @tc.name testUint32ArrayGetPartOne026
     * @tc.desc Verify [0] [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(11, 22);
      const r0: number = values[0];
      const r1: number = values[1];
      expect(r0).assertEqual(11);
      expect(r1).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2700
     * @tc.name testUint32ArrayGetPartOne027
     * @tc.desc Verify subarray [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const sub: Uint32Array = values.subarray(1, 3);
      const r: number = sub[0];
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2800
     * @tc.name testUint32ArrayGetPartOne028
     * @tc.desc Verify subarray [2] RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const sub: Uint32Array = values.subarray(1, 3);
      try {
        sub[2];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_2900
     * @tc.name testUint32ArrayGetPartOne029
     * @tc.desc Verify subarray buffer $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const sub: Uint32Array = values.subarray(0, 2);
      values[0] = 888;
      const r: number = sub[0];
      expect(r).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_3000
     * @tc.name testUint32ArrayGetPartOne030
     * @tc.desc Verify index=0xA (16 10) 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(12);
      values[10] = 111;
      const r: number = values[0xA];
      expect(r).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_GET_PARTONE_3100
     * @tc.name testUint32ArrayGetPartOne031
     * @tc.desc Verify [0] $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayGetPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3);
      const a: number = values[0];
      const b: number = values[values.length - 1];
      expect(a).assertEqual(1);
      expect(b).assertEqual(3);
    });

  });
}
