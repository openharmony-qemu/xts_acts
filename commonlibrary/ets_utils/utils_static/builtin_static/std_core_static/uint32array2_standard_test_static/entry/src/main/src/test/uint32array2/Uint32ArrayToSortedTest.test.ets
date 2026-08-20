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

export default function uint32ArrayToSortedOneTest(): void {
  describe('Uint32ArrayToSortedOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0100
     * @tc.name testUint32ArrayToSortedOne001
     * @tc.desc Verify toSorted() returns ascending sorted array for [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(3, 1, 2).toSorted();
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0200
     * @tc.name testUint32ArrayToSortedOne002
     * @tc.desc Verify toSorted() returns ascending sorted array for [50,10,30,20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(50, 10, 30, 20).toSorted();
      expect(result.$_get(0)).assertEqual(10);
      expect(result.$_get(1)).assertEqual(20);
      expect(result.$_get(2)).assertEqual(30);
      expect(result.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0300
     * @tc.name testUint32ArrayToSortedOne003
     * @tc.desc Verify toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Uint32Array(0).toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0400
     * @tc.name testUint32ArrayToSortedOne004
     * @tc.desc Verify toSorted() preserves uint32 MIN value 0 for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0).toSorted();
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0500
     * @tc.name testUint32ArrayToSortedOne005
     * @tc.desc Verify toSorted() preserves uint32 MAX value 4294967295 for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295).toSorted();
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0600
     * @tc.name testUint32ArrayToSortedOne006
     * @tc.desc Verify 2147483647(int32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(2147483647).toSorted();
      expect(result.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0700
     * @tc.name testUint32ArrayToSortedOne007
     * @tc.desc Verify toSorted() for input 4294967296 wraps to 0 (uint32 overflow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967296).toSorted();
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0800
     * @tc.name testUint32ArrayToSortedOne008
     * @tc.desc Verify toSorted() for input -1 converts to 4294967295 (uint32 two's complement)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(-1).toSorted();
      expect(result.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_0900
     * @tc.name testUint32ArrayToSortedOne009
     * @tc.desc Verify toSorted() does not mutate the original array with non-uniform values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = Uint32Array.of(5, 3, 4);
      original.toSorted();
      expect(original.$_get(0)).assertEqual(5);
      expect(original.$_get(1)).assertEqual(3);
      expect(original.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1000
     * @tc.name testUint32ArrayToSortedOne010
     * @tc.desc Verify toSorted() returns [0,4294967295] for input [0,4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0, 4294967295).toSorted();
      expect(result.join(',')).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1100
     * @tc.name testUint32ArrayToSortedOne011
     * @tc.desc Verify [4294967295, 0] , 0,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295, 0).toSorted();
      expect(result.join(',')).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1200
     * @tc.name testUint32ArrayToSortedOne012
     * @tc.desc Verify [4294967296, 0] 4294967296 0, 0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967296, 0).toSorted();
      expect(result.join(',')).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1300
     * @tc.name testUint32ArrayToSortedOne013
     * @tc.desc Verify [-1, 0] -1 4294967295, 0,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(-1, 0).toSorted();
      expect(result.join(',')).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1400
     * @tc.name testUint32ArrayToSortedOne014
     * @tc.desc Verify [3.14, 1] 3.14 3, 1,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(3.14, 1).toSorted();
      expect(result.join(',')).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1500
     * @tc.name testUint32ArrayToSortedOne015
     * @tc.desc Verify [NaN, 5] NaN 0, 0,5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(Number.NaN, 5).toSorted();
      expect(result.join(',')).assertEqual('0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1600
     * @tc.name testUint32ArrayToSortedOne016
     * @tc.desc Verify [2147483647, 2147483648] int32.MAX ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(2147483647, 2147483648).toSorted();
      expect(result.join(',')).assertEqual('2147483647,2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1700
     * @tc.name testUint32ArrayToSortedOne017
     * @tc.desc Verify [-2147483648, 0] int32.MIN 2147483648, 0,2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(-2147483648, 0).toSorted();
      expect(result.join(',')).assertEqual('0,2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1800
     * @tc.name testUint32ArrayToSortedOne018
     * @tc.desc Verify [9007199254740991, 0] 2^53-1 uint32.MAX, 0,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(9007199254740991, 0).toSorted();
      expect(result.join(',')).assertEqual('0,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_1900
     * @tc.name testUint32ArrayToSortedOne019
     * @tc.desc Verify [0, -0] -0 0, 0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0, -0).toSorted();
      expect(result.join(',')).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2000
     * @tc.name testUint32ArrayToSortedOne020
     * @tc.desc Verify [4294967294, 4294967295] MAX-1 MAX ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967294, 4294967295).toSorted();
      expect(result.join(',')).assertEqual('4294967294,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2100
     * @tc.name testUint32ArrayToSortedOne021
     * @tc.desc Verify [0, 4294967295, 2147483648] , 0,2147483648,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0, 4294967295, 2147483648).toSorted();
      expect(result.join(',')).assertEqual('0,2147483648,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2200
     * @tc.name testUint32ArrayToSortedOne022
     * @tc.desc Verify [4294967295, 0, 2147483648] , 0,2147483648,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295, 0, 2147483648).toSorted();
      expect(result.join(',')).assertEqual('0,2147483648,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2300
     * @tc.name testUint32ArrayToSortedOne023
     * @tc.desc Verify [0o10, 0o7, 0o12] 7,8,10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0o10, 0o7, 0o12).toSorted();
      expect(result.join(',')).assertEqual('7,8,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2400
     * @tc.name testUint32ArrayToSortedOne024
     * @tc.desc Verify [0b101, 0b11, 0b1000] 3,5,8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0b101, 0b11, 0b1000).toSorted();
      expect(result.join(',')).assertEqual('3,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2500
     * @tc.name testUint32ArrayToSortedOne025
     * @tc.desc Verify [1e0, 1e1, 1e2] 1,10,100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(1e0, 1e1, 1e2).toSorted();
      expect(result.join(',')).assertEqual('1,10,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2600
     * @tc.name testUint32ArrayToSortedOne026
     * @tc.desc Verify [4294967295, 4294967296, 4294967297] MAX,0,1, 0,1,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295, 4294967296, 4294967297).toSorted();
      expect(result.join(',')).assertEqual('0,1,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2700
     * @tc.name testUint32ArrayToSortedOne027
     * @tc.desc Verify [-2, -1, 0] 4294967294,4294967295,0, 0,4294967294,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(-2, -1, 0).toSorted();
      expect(result.join(',')).assertEqual('0,4294967294,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2800
     * @tc.name testUint32ArrayToSortedOne028
     * @tc.desc Verify [NaN, Infinity, -Infinity, 0] 0, 0,0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0).toSorted();
      expect(result.join(',')).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_2900
     * @tc.name testUint32ArrayToSortedOne029
     * @tc.desc Verify [3.99, 3.01, 3.5] 3, 3,3,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(3.99, 3.01, 3.5).toSorted();
      expect(result.join(',')).assertEqual('3,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3000
     * @tc.name testUint32ArrayToSortedOne030
     * @tc.desc Verify [10, 9, 100] ( ), 9,10,100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(10, 9, 100).toSorted();
      expect(result.join(',')).assertEqual('9,10,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3100
     * @tc.name testUint32ArrayToSortedOne031
     * @tc.desc Verify [2, 10, 1] 1,2,10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(2, 10, 1).toSorted();
      expect(result.join(',')).assertEqual('1,2,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3200
     * @tc.name testUint32ArrayToSortedOne032
     * @tc.desc Verify [1000000, 1, 999] 1,999,1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(1000000, 1, 999).toSorted();
      expect(result.join(',')).assertEqual('1,999,1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3300
     * @tc.name testUint32ArrayToSortedOne033
     * @tc.desc Verify [255, 0xFF, 0o377, 0b11111111] 255, 255,255,255,255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(255, 0xFF, 0o377, 0b11111111).toSorted();
      expect(result.join(',')).assertEqual('255,255,255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3400
     * @tc.name testUint32ArrayToSortedOne034
     * @tc.desc Verify [0x10, 16, 0o20] 16, 16,16,16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0x10, 16, 0o20).toSorted();
      expect(result.join(',')).assertEqual('16,16,16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3500
     * @tc.name testUint32ArrayToSortedOne035
     * @tc.desc Verify [1e21, 0] 1e21 uint32, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(1e21, 0).toSorted();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(3735027712);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3600
     * @tc.name testUint32ArrayToSortedOne036
     * @tc.desc Verify [4294967295, 0, 2147483648, 2147483647] , 0,2147483647,2147483648,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295, 0, 2147483648, 2147483647).toSorted();
      expect(result.join(',')).assertEqual('0,2147483647,2147483648,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3700
     * @tc.name testUint32ArrayToSortedOne037
     * @tc.desc Verify [-3, -2, -1] , 4294967293,4294967294,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(-3, -2, -1).toSorted();
      expect(result.join(',')).assertEqual('4294967293,4294967294,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3800
     * @tc.name testUint32ArrayToSortedOne038
     * @tc.desc Verify [0.5, 1.5, 2.5] 0,1,2, 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0.5, 1.5, 2.5).toSorted();
      expect(result.join(',')).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_3900
     * @tc.name testUint32ArrayToSortedOne039
     * @tc.desc Verify [4294967295, 1, 0] , 0,1,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295, 1, 0).toSorted();
      expect(result.join(',')).assertEqual('0,1,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4000
     * @tc.name testUint32ArrayToSortedOne040
     * @tc.desc Verify [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(1, 2, 3, 4, 5).toSorted();
      expect(result.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4100
     * @tc.name testUint32ArrayToSortedOne041
     * @tc.desc Verify [5,4,3,2,1] 1,2,3,4,5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(5, 4, 3, 2, 1).toSorted();
      expect(result.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4200
     * @tc.name testUint32ArrayToSortedOne042
     * @tc.desc Verify [1,2,3,2,1] 1,1,2,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(1, 2, 3, 2, 1).toSorted();
      expect(result.join(',')).assertEqual('1,1,2,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4300
     * @tc.name testUint32ArrayToSortedOne043
     * @tc.desc Verify [2,2,2,1,1] 1,1,2,2,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(2, 2, 2, 1, 1).toSorted();
      expect(result.join(',')).assertEqual('1,1,2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4400
     * @tc.name testUint32ArrayToSortedOne044
     * @tc.desc Verify [0,0,0,0] 0,0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(0, 0, 0, 0).toSorted();
      expect(result.join(',')).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4500
     * @tc.name testUint32ArrayToSortedOne045
     * @tc.desc Verify [4294967295, 4294967295, 0] 0,4294967295,4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(4294967295, 4294967295, 0).toSorted();
      expect(result.join(',')).assertEqual('0,4294967295,4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4600
     * @tc.name testUint32ArrayToSortedOne046
     * @tc.desc Verify [4294967295, 0] toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = Uint32Array.of(4294967295, 0);
      const result = original.toSorted();
      expect(result.$_get(0)).assertEqual(0);
      expect(result.$_get(1)).assertEqual(4294967295);
      expect(original.$_get(0)).assertEqual(4294967295);
      expect(original.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4700
     * @tc.name testUint32ArrayToSortedOne047
     * @tc.desc Verify toSorted() [4294967295,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = Uint32Array.of(4294967295, 0);
      const result = original.toSorted();
      result.$_set(1, 1);
      expect(original.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4800
     * @tc.name testUint32ArrayToSortedOne048
     * @tc.desc Verify 1000 , toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large = new Uint32Array(1000);
      for (let i = 0; i < 1000; i++) {
        large.$_set(i, 999 - i);
      }
      const sorted = large.toSorted();
      expect(sorted.length).assertEqual(1000);
      expect(sorted.$_get(0)).assertEqual(0);
      expect(sorted.$_get(499)).assertEqual(499);
      expect(sorted.$_get(500)).assertEqual(500);
      expect(sorted.$_get(999)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_4900
     * @tc.name testUint32ArrayToSortedOne049
     * @tc.desc Verify uint32.MAX , toSorted() MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr.$_set(0, 4294967295);
      arr.$_set(1, 3);
      arr.$_set(2, 1);
      arr.$_set(3, 4);
      arr.$_set(4, 2);
      const sorted = arr.toSorted();
      expect(sorted.$_get(0)).assertEqual(1);
      expect(sorted.$_get(1)).assertEqual(2);
      expect(sorted.$_get(2)).assertEqual(3);
      expect(sorted.$_get(3)).assertEqual(4);
      expect(sorted.$_get(4)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_5000
     * @tc.name testUint32ArrayToSortedOne050
     * @tc.desc Verify toSorted().toSorted() 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(3, 1, 2).toSorted().toSorted();
      expect(result.length).assertEqual(3);
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSORTED_5100
     * @tc.name testUint32ArrayToSortedOne051
     * @tc.desc Verify toReversed().toSorted() 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToSortedOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Uint32Array.of(3, 1, 2).toReversed().toSorted();
      expect(result.join(',')).assertEqual('1,2,3');
    });

  });
}
