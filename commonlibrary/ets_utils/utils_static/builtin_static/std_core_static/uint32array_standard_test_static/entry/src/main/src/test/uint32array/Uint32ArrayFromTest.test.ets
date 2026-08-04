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

export default function uint32ArrayFromTest(): void {
  describe('Uint32ArrayFromTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0010
     * @tc.name testUint32ArrayFromPartOne001
     * @tc.desc Verify from() arity 1 - from(FixedArray<int>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2, 3];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0020
     * @tc.name testUint32ArrayFromPartOne002
     * @tc.desc Verify from() FixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [];
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0030
     * @tc.name testUint32ArrayFromPartOne003
     * @tc.desc Verify from() FixedArray [5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [5];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(5);
      expect(values.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0040
     * @tc.name testUint32ArrayFromPartOne004
     * @tc.desc Verify from() FixedArray [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0050
     * @tc.name testUint32ArrayFromPartOne005
     * @tc.desc Verify from() 0 [0, 1, 2] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, 1, 2];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0060
     * @tc.name testUint32ArrayFromPartOne006
     * @tc.desc Verify from() int -1 uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-1];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0070
     * @tc.name testUint32ArrayFromPartOne007
     * @tc.desc Verify from() int -2 uint32 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-2];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0080
     * @tc.name testUint32ArrayFromPartOne008
     * @tc.desc Verify from() int -3 uint32 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-3];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0090
     * @tc.name testUint32ArrayFromPartOne009
     * @tc.desc Verify from() int -100 uint32 4294967196
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-100];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967196);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0100
     * @tc.name testUint32ArrayFromPartOne010
     * @tc.desc Verify from() int 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [2147483647];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0110
     * @tc.name testUint32ArrayFromPartOne011
     * @tc.desc Verify from() int -2147483648 uint32 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-2147483648];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0120
     * @tc.name testUint32ArrayFromPartOne012
     * @tc.desc Verify from() 0xFF (255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0xFF];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0130
     * @tc.name testUint32ArrayFromPartOne013
     * @tc.desc Verify from() 0o17 (15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0o17];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0140
     * @tc.name testUint32ArrayFromPartOne014
     * @tc.desc Verify from() 0b1010 (10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0b1010];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0150
     * @tc.name testUint32ArrayFromPartOne015
     * @tc.desc Verify from() 0x7F (127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0x7F];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0160
     * @tc.name testUint32ArrayFromPartOne016
     * @tc.desc Verify from() [7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [7, 7, 7];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(7);
      expect(values.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0170
     * @tc.name testUint32ArrayFromPartOne017
     * @tc.desc Verify from() [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, 0, 0];
      const values = Uint32Array.from(src);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0180
     * @tc.name testUint32ArrayFromPartOne018
     * @tc.desc Verify from() [0, -1, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, -1, 1];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0190
     * @tc.name testUint32ArrayFromPartOne019
     * @tc.desc Verify from() [1000, 0xFF, 0o17]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1000, 0xFF, 0o17];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(1000);
      expect(values.$_get(1)).assertEqual(255);
      expect(values.$_get(2)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0200
     * @tc.name testUint32ArrayFromPartOne020
     * @tc.desc Verify from() [2147483647, -2147483648]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [2147483647, -2147483648];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(2147483647);
      expect(values.$_get(1)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0210
     * @tc.name testUint32ArrayFromPartOne021
     * @tc.desc Verify from() [-1, -2, -3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-1, -2, -3];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967295);
      expect(values.$_get(1)).assertEqual(4294967294);
      expect(values.$_get(2)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0220
     * @tc.name testUint32ArrayFromPartOne022
     * @tc.desc Verify from() 12 FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(12);
      expect(values.$_get(11)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0230
     * @tc.name testUint32ArrayFromPartOne023
     * @tc.desc Verify from() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2, 3];
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0240
     * @tc.name testUint32ArrayFromPartOne024
     * @tc.desc Verify from() length FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30, 40];
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0250
     * @tc.name testUint32ArrayFromPartOne025
     * @tc.desc Verify from() byteLength length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2, 3];
      const values = Uint32Array.from(src);
      expect(values.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0260
     * @tc.name testUint32ArrayFromPartOne026
     * @tc.desc Verify from() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2];
      const values = Uint32Array.from(src);
      expect(values.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0270
     * @tc.name testUint32ArrayFromPartOne027
     * @tc.desc Verify from() from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2];
      const a = Uint32Array.from(src);
      const b = Uint32Array.from(src);
      a.$_set(0, 777);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0280
     * @tc.name testUint32ArrayFromPartOne028
     * @tc.desc Verify from() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0, 0x7FFFFFFF, -1];
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(2147483647);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0290
     * @tc.name testUint32ArrayFromPartOne029
     * @tc.desc Verify from() Uint32Array.of(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0300
     * @tc.name testUint32ArrayFromPartOne030
     * @tc.desc Verify from() Uint32Array.of(10, 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const values = Uint32Array.from(src);
      expect(values.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0310
     * @tc.name testUint32ArrayFromPartOne031
     * @tc.desc Verify from() Uint32Array.of(9, 9, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(9, 9, 9);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(9);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0320
     * @tc.name testUint32ArrayFromPartOne032
     * @tc.desc Verify from() [0, 4294967295, 2147483648]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295, 2147483648);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0330
     * @tc.name testUint32ArrayFromPartOne033
     * @tc.desc Verify from() [100, 200, 300]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300);
      const values = Uint32Array.from(src);
      expect(values.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0340
     * @tc.name testUint32ArrayFromPartOne034
     * @tc.desc Verify from() Uint32Array.of(3, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3, 1, 2);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(3);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0350
     * @tc.name testUint32ArrayFromPartOne035
     * @tc.desc Verify from() * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295);
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0360
     * @tc.name testUint32ArrayFromPartOne036
     * @tc.desc Verify from() max 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0370
     * @tc.name testUint32ArrayFromPartOne037
     * @tc.desc Verify from() values.length=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(100);
      expect(values.$_get(50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0380
     * @tc.name testUint32ArrayFromPartOne038
     * @tc.desc Verify from() Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const values = Uint32Array.from(src);
      expect(values[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0390
     * @tc.name testUint32ArrayFromPartOne039
     * @tc.desc Verify from() - (buffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const values = Uint32Array.from(src);
      values.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0400
     * @tc.name testUint32ArrayFromPartOne040
     * @tc.desc Verify from() - ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const values = Uint32Array.from(src);
      src.$_set(0, 888);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0410
     * @tc.name testUint32ArrayFromPartOne041
     * @tc.desc Verify from() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 5, 5);
      const values = Uint32Array.from(src);
      values.$_set(1, 0);
      expect(src.$_get(1)).assertEqual(5);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0420
     * @tc.name testUint32ArrayFromPartOne042
     * @tc.desc Verify from() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 2147483647, 4294967295);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(2147483647);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0430
     * @tc.name testUint32ArrayFromPartOne043
     * @tc.desc Verify from() 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [3.14];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0440
     * @tc.name testUint32ArrayFromPartOne044
     * @tc.desc Verify from() 2.999 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [2.999];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0450
     * @tc.name testUint32ArrayFromPartOne045
     * @tc.desc Verify from() 1e10 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [1e10];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0460
     * @tc.name testUint32ArrayFromPartOne046
     * @tc.desc Verify from() [0, -1, 4294967296]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [0, -1, 4294967296];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0470
     * @tc.name testUint32ArrayFromPartOne047
     * @tc.desc Verify from() [5.5, 5.5] [5, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [5.5, 5.5];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(5);
      expect(values.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0480
     * @tc.name testUint32ArrayFromPartOne048
     * @tc.desc Verify from() [0xFF, 0o17] [255, 15]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [0xFF, 0o17];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(255);
      expect(values.$_get(1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0490
     * @tc.name testUint32ArrayFromPartOne049
     * @tc.desc Verify from() 10 ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      const values = Uint32Array.from(source);
      expect(values.length).assertEqual(10);
      expect(values.$_get(9)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0500
     * @tc.name testUint32ArrayFromPartOne050
     * @tc.desc Verify from() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [0.0, 3.9, -1.0, 4294967296.0];
      const values = Uint32Array.from(source);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(4294967295);
      expect(values.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0510
     * @tc.name testUint32ArrayFromPartOne051
     * @tc.desc Verify from() ArrayLike<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const source: ArrayLike<number> = arr;
      const values = Uint32Array.from(source);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0520
     * @tc.name testUint32ArrayFromPartOne052
     * @tc.desc Verify from() ArrayLike<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [0];
      const source: ArrayLike<number> = arr;
      const values = Uint32Array.from(source);
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0530
     * @tc.name testUint32ArrayFromPartOne053
     * @tc.desc Verify from() arity 1 - from(Iterable<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      src.add(3.0);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0540
     * @tc.name testUint32ArrayFromPartOne054
     * @tc.desc Verify from() arity 2 - from(Iterable<number>, mapfn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      const values = Uint32Array.from(src, (value, index) => value + 1.0);
      expect(values.$_get(0)).assertEqual(2);
      expect(values.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0550
     * @tc.name testUint32ArrayFromPartOne055
     * @tc.desc Verify from() Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(42.0);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(42);
      expect(values.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0560
     * @tc.name testUint32ArrayFromPartOne056
     * @tc.desc Verify from() Set ( 3, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(3.0);
      src.add(1.0);
      src.add(2.0);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(3);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0570
     * @tc.name testUint32ArrayFromPartOne057
     * @tc.desc Verify from() Set - add 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(5.0);
      src.add(5.0);
      src.add(5.0);
      const values = Uint32Array.from(src);
      expect(values.length).assertEqual(1);
      expect(values.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0580
     * @tc.name testUint32ArrayFromPartOne058
     * @tc.desc Verify from() mapfn 1.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.5);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0590
     * @tc.name testUint32ArrayFromPartOne059
     * @tc.desc Verify from() mapfn 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(4294967296);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0600
     * @tc.name testUint32ArrayFromPartOne060
     * @tc.desc Verify from() mapfn -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(-1);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0610
     * @tc.name testUint32ArrayFromPartOne061
     * @tc.desc Verify from() mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(Number.NaN);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0620
     * @tc.name testUint32ArrayFromPartOne062
     * @tc.desc Verify from() mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(Number.POSITIVE_INFINITY);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0630
     * @tc.name testUint32ArrayFromPartOne063
     * @tc.desc Verify from() mapfn uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(4294967295);
      const values = Uint32Array.from(src);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0640
     * @tc.name testUint32ArrayFromPartOne064
     * @tc.desc Verify from() mapfn value + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(10.0);
      src.add(20.0);
      const values = Uint32Array.from(src, (value, index) => value + 1.0);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0650
     * @tc.name testUint32ArrayFromPartOne065
     * @tc.desc Verify from() mapfn 0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(10.0);
      src.add(20.0);
      const values = Uint32Array.from(src, (value, index) => 0);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0660
     * @tc.name testUint32ArrayFromPartOne066
     * @tc.desc Verify from() mapfn 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => 4294967296);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0670
     * @tc.name testUint32ArrayFromPartOne067
     * @tc.desc Verify from() mapfn -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => -1);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0680
     * @tc.name testUint32ArrayFromPartOne068
     * @tc.desc Verify from() mapfn 3.7 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => 3.7);
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0690
     * @tc.name testUint32ArrayFromPartOne069
     * @tc.desc Verify from() mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => Number.NaN);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0700
     * @tc.name testUint32ArrayFromPartOne070
     * @tc.desc Verify from() mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => Number.POSITIVE_INFINITY);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0710
     * @tc.name testUint32ArrayFromPartOne071
     * @tc.desc Verify from() mapfn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => -Number.POSITIVE_INFINITY);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0720
     * @tc.name testUint32ArrayFromPartOne072
     * @tc.desc Verify from() mapfn 0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => 0.999);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0730
     * @tc.name testUint32ArrayFromPartOne073
     * @tc.desc Verify from() mapfn 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => 4294967295);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0740
     * @tc.name testUint32ArrayFromPartOne074
     * @tc.desc Verify from() mapfn 1e10 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      const values = Uint32Array.from(src, (value, index) => 1e10);
      expect(values.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0750
     * @tc.name testUint32ArrayFromPartOne075
     * @tc.desc Verify from() mapfn index (value + index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(100.0);
      src.add(100.0);
      src.add(200.0);
      const values = Uint32Array.from(src, (value, index) => value + index);
      expect(values.$_get(0)).assertEqual(100);
      expect(values.$_get(1)).assertEqual(201);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0760
     * @tc.name testUint32ArrayFromPartOne076
     * @tc.desc Verify from() mapfn value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(99.0);
      src.add(88.0);
      src.add(77.0);
      const values = Uint32Array.from(src, (value, index) => index);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(1);
      expect(values.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0770
     * @tc.name testUint32ArrayFromPartOne077
     * @tc.desc Verify from() mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      src.add(3.0);
      let acc: number = 0;
      const values = Uint32Array.from(src, (value, index) => {
        acc = acc + value;
        return acc;
      });
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0780
     * @tc.name testUint32ArrayFromPartOne078
     * @tc.desc Verify from() Uint32Array ( mapfn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      const values = Uint32Array.from(src, (value, index) => value);
      expect(values[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0790
     * @tc.name testUint32ArrayFromPartOne079
     * @tc.desc Verify from() byteLength length * 4 ( mapfn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      src.add(3.0);
      const values = Uint32Array.from(src, (value, index) => value);
      expect(values.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0800
     * @tc.name testUint32ArrayFromPartOne080
     * @tc.desc Verify from() (mapfn )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(0.0);
      src.add(5.0);
      src.add(10.0);
      const values = Uint32Array.from(src, (value, index) => value + 100.0);
      expect(values.$_get(0)).assertEqual(100);
      expect(values.$_get(1)).assertEqual(105);
      expect(values.$_get(2)).assertEqual(110);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0810
     * @tc.name testUint32ArrayFromPartOne081
     * @tc.desc Verify from() mapfn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      try {
        Uint32Array.from(src, (value, index) => {
          throw new Error('mapfn error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0820
     * @tc.name testUint32ArrayFromPartOne082
     * @tc.desc Verify from() e.name='RangeError'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      try {
        Uint32Array.from(src, (value, index) => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0830
     * @tc.name testUint32ArrayFromPartOne083
     * @tc.desc Verify from() mapfn index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      src.add(3.0);
      try {
        Uint32Array.from(src, (value, index) => {
          if (index === 1) {
            throw new Error('stop at 1');
          }
          return value;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FROM_PARTONE_0840
     * @tc.name testUint32ArrayFromPartOne084
     * @tc.desc Verify from() from(from(Set))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFromPartOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      const first = Uint32Array.from(src);
      const second = Uint32Array.from(first);
      expect(second.$_get(0)).assertEqual(1);
      expect(second.$_get(1)).assertEqual(2);
      expect(second.length).assertEqual(2);
    });

  });
}
