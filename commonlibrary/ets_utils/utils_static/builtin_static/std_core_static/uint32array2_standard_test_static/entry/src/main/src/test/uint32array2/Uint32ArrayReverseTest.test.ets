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

export default function uint32ArrayReverseOneTest(): void {
  describe('Uint32ArrayReverseOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0100
     * @tc.name testUint32ArrayReverseOne001
     * @tc.desc Verify reverse() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      const ret: Uint32Array = arr.reverse();
      expect(arr.length).assertEqual(0);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0200
     * @tc.name testUint32ArrayReverseOne002
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0300
     * @tc.name testUint32ArrayReverseOne003
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(22);
      expect(arr.$_get(1)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0400
     * @tc.name testUint32ArrayReverseOne004
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0500
     * @tc.name testUint32ArrayReverseOne005
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0600
     * @tc.name testUint32ArrayReverseOne006
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0700
     * @tc.name testUint32ArrayReverseOne007
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0800
     * @tc.name testUint32ArrayReverseOne008
     * @tc.desc Verify reverse() 1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295);
      arr.reverse();
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_0900
     * @tc.name testUint32ArrayReverseOne009
     * @tc.desc Verify reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1000
     * @tc.name testUint32ArrayReverseOne010
     * @tc.desc Verify uint32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1100
     * @tc.name testUint32ArrayReverseOne011
     * @tc.desc Verify 2147483647 int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1200
     * @tc.name testUint32ArrayReverseOne012
     * @tc.desc Verify 4294967296 2^32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967296);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1300
     * @tc.name testUint32ArrayReverseOne013
     * @tc.desc Verify -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1400
     * @tc.name testUint32ArrayReverseOne014
     * @tc.desc Verify -2147483648 int32.MIN 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1500
     * @tc.name testUint32ArrayReverseOne015
     * @tc.desc Verify 3.14 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3.14);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1600
     * @tc.name testUint32ArrayReverseOne016
     * @tc.desc Verify NaN 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(Number.NaN);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1700
     * @tc.name testUint32ArrayReverseOne017
     * @tc.desc Verify 9007199254740991 2^53-1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(9007199254740991);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1800
     * @tc.name testUint32ArrayReverseOne018
     * @tc.desc Verify 1e10 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1e10);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_1900
     * @tc.name testUint32ArrayReverseOne019
     * @tc.desc Verify 0o17 15 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0o17);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2000
     * @tc.name testUint32ArrayReverseOne020
     * @tc.desc Verify 0b1010 10 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0b1010);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2100
     * @tc.name testUint32ArrayReverseOne021
     * @tc.desc Verify 4294967294 MAX-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967294);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2200
     * @tc.name testUint32ArrayReverseOne022
     * @tc.desc Verify 1.999 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1.999);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2300
     * @tc.name testUint32ArrayReverseOne023
     * @tc.desc Verify 0.001 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0.001);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2400
     * @tc.name testUint32ArrayReverseOne024
     * @tc.desc Verify [0, 4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 4294967295);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2500
     * @tc.name testUint32ArrayReverseOne025
     * @tc.desc Verify [2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2600
     * @tc.name testUint32ArrayReverseOne026
     * @tc.desc Verify [4294967295, 4294967295] MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 4294967295);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2700
     * @tc.name testUint32ArrayReverseOne027
     * @tc.desc Verify [-1, -2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-1, -2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967294);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2800
     * @tc.name testUint32ArrayReverseOne028
     * @tc.desc Verify [NaN, Infinity] [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(Number.NaN, Number.POSITIVE_INFINITY);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_2900
     * @tc.name testUint32ArrayReverseOne029
     * @tc.desc Verify [3.14, 2.71] [3, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3.14, 2.71);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3000
     * @tc.name testUint32ArrayReverseOne030
     * @tc.desc Verify [2147483647, 2147483648]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647, 2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3100
     * @tc.name testUint32ArrayReverseOne031
     * @tc.desc Verify [1e10, 1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1e10, 1e9);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1000000000);
      expect(arr.$_get(1)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3200
     * @tc.name testUint32ArrayReverseOne032
     * @tc.desc Verify [0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3300
     * @tc.name testUint32ArrayReverseOne033
     * @tc.desc Verify [-2147483648, 2147483647]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-2147483648, 2147483647);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3400
     * @tc.name testUint32ArrayReverseOne034
     * @tc.desc Verify [0.999, 0.001] [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0.999, 0.001);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3500
     * @tc.name testUint32ArrayReverseOne035
     * @tc.desc Verify [4294967296, 4294967296] [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967296, 4294967296);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3600
     * @tc.name testUint32ArrayReverseOne036
     * @tc.desc Verify [9007199254740991, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(9007199254740991, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3700
     * @tc.name testUint32ArrayReverseOne037
     * @tc.desc Verify [0, 4294967295, 0] MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 4294967295, 0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3800
     * @tc.name testUint32ArrayReverseOne038
     * @tc.desc Verify [-1, 0, 1] [4294967295, 0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-1, 0, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_3900
     * @tc.name testUint32ArrayReverseOne039
     * @tc.desc Verify [1.1, 2.2, 3.3] [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1.1, 2.2, 3.3);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4000
     * @tc.name testUint32ArrayReverseOne040
     * @tc.desc Verify [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4100
     * @tc.name testUint32ArrayReverseOne041
     * @tc.desc Verify MAX [4294967295, 4294967295, 4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 4294967295, 4294967295);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4200
     * @tc.name testUint32ArrayReverseOne042
     * @tc.desc Verify [0, 1, 2] [2, 1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1, 2);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4300
     * @tc.name testUint32ArrayReverseOne043
     * @tc.desc Verify [1, 2, 3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 2, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4400
     * @tc.name testUint32ArrayReverseOne044
     * @tc.desc Verify [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4500
     * @tc.name testUint32ArrayReverseOne045
     * @tc.desc Verify [0, 4294967295, 0, 4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 4294967295, 0, 4294967295);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4600
     * @tc.name testUint32ArrayReverseOne046
     * @tc.desc Verify [1,2,3,4,5,6,7,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4700
     * @tc.name testUint32ArrayReverseOne047
     * @tc.desc Verify [1, 2, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 2, 1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4800
     * @tc.name testUint32ArrayReverseOne048
     * @tc.desc Verify reverse $_set 4294967296 2^32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      arr.$_set(0, 4294967296);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_4900
     * @tc.name testUint32ArrayReverseOne049
     * @tc.desc Verify reverse $_set NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      arr.$_set(0, Number.NaN);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5000
     * @tc.name testUint32ArrayReverseOne050
     * @tc.desc Verify reverse $_set out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      try {
        arr.$_set(100, 4294967295);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5100
     * @tc.name testUint32ArrayReverseOne051
     * @tc.desc Verify reverse $_get out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      try {
        arr.$_get(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5200
     * @tc.name testUint32ArrayReverseOne052
     * @tc.desc Verify reverse $_set number variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      const v: number = 200;
      arr.$_set(0, v);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5300
     * @tc.name testUint32ArrayReverseOne053
     * @tc.desc Verify reverse -1 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      arr.reverse();
      arr.$_set(1, -1);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5400
     * @tc.name testUint32ArrayReverseOne054
     * @tc.desc Verify reverse $_set 4294967295 $_get uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const ret: Uint32Array = arr.reverse();
      arr.$_set(1, 4294967295);
      arr.$_set(2, 4294967296);
      expect(arr.$_get(1)).assertEqual(4294967295);
      expect(arr.$_get(2)).assertEqual(0);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5500
     * @tc.name testUint32ArrayReverseOne055
     * @tc.desc Verify reverse $_set -2 wraps to 4294967294
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      arr.reverse();
      arr.$_set(0, -2);
      arr.reverse();
      expect(arr.$_get(2)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5600
     * @tc.name testUint32ArrayReverseOne056
     * @tc.desc Verify reverse() returns the same reference as the receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: Uint32Array = arr.reverse();
      expect(r === arr).assertTrue();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5700
     * @tc.name testUint32ArrayReverseOne057
      * @tc.desc Verify reverse() on a subarray view only reverses the view range and leaves the rest of the buffer
      *     unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = base.subarray(1, 4);
      view.reverse();
      expect(view.$_get(0)).assertEqual(4);
      expect(view.$_get(1)).assertEqual(3);
      expect(view.$_get(2)).assertEqual(2);
      expect(base.$_get(0)).assertEqual(1);
      expect(base.$_get(1)).assertEqual(4);
      expect(base.$_get(2)).assertEqual(3);
      expect(base.$_get(3)).assertEqual(2);
      expect(base.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REVERSE_5800
     * @tc.name testUint32ArrayReverseOne058
      * @tc.desc Verify reverse() mutates in place and returns self whereas toReversed() leaves the original unchanged
      *     and returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReverseOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const ret: Uint32Array = src.reverse();
      expect(ret === src).assertTrue();
      expect(src.$_get(0)).assertEqual(3);

      const other: Uint32Array = Uint32Array.of(1, 2, 3);
      const copy: Uint32Array = other.toReversed();
      expect(copy === other).assertFalse();
      expect(other.$_get(0)).assertEqual(1);
      expect(copy.$_get(0)).assertEqual(3);
    });

  });
}
