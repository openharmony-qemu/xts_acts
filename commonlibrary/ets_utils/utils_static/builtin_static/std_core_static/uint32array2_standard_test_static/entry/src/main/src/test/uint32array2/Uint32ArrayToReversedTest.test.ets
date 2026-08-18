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

export default function uint32ArrayToReversedOneTest(): void {
  describe('Uint32ArrayToReversedOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0100
     * @tc.name testUint32ArrayToReversedOne001
     * @tc.desc Verify toReversed() on single-element [0] returns identical [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0200
     * @tc.name testUint32ArrayToReversedOne002
     * @tc.desc Verify toReversed() on single-element [1] returns identical [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0300
     * @tc.name testUint32ArrayToReversedOne003
     * @tc.desc Verify uint32 4294967295,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0400
     * @tc.name testUint32ArrayToReversedOne004
     * @tc.desc Verify uint32 4294967294,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967294);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0500
     * @tc.name testUint32ArrayToReversedOne005
     * @tc.desc Verify int32 2147483647,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0600
     * @tc.name testUint32ArrayToReversedOne006
     * @tc.desc Verify int32 2147483648,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0700
     * @tc.name testUint32ArrayToReversedOne007
     * @tc.desc Verify toReversed() preserves element 256 unchanged in reversed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(256);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0800
     * @tc.name testUint32ArrayToReversedOne008
     * @tc.desc Verify toReversed() preserves element 65535 unchanged in reversed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(65535);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_0900
     * @tc.name testUint32ArrayToReversedOne009
     * @tc.desc Verify toReversed() preserves element 16777215 unchanged in reversed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(16777215);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1000
     * @tc.name testUint32ArrayToReversedOne010
     * @tc.desc Verify 2 30 1073741824,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1073741824);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1100
     * @tc.name testUint32ArrayToReversedOne011
     * @tc.desc Verify toReversed() on octal literal 0o17 preserves value 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0o17);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1200
     * @tc.name testUint32ArrayToReversedOne012
     * @tc.desc Verify toReversed() on octal literal 0o777 preserves value 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0o777);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1300
     * @tc.name testUint32ArrayToReversedOne013
     * @tc.desc Verify toReversed() on binary literal 0b1010 preserves value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b1010);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1400
     * @tc.name testUint32ArrayToReversedOne014
     * @tc.desc Verify 0b11110000, 240
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b11110000);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1500
     * @tc.name testUint32ArrayToReversedOne015
     * @tc.desc Verify toReversed() on exponent literal 1e3 preserves value 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1e3);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1600
     * @tc.name testUint32ArrayToReversedOne016
     * @tc.desc Verify toReversed() on exponent literal 2e2 preserves value 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2e2);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1700
     * @tc.name testUint32ArrayToReversedOne017
     * @tc.desc Verify 2 33 8589934592,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(8589934592);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1800
     * @tc.name testUint32ArrayToReversedOne018
     * @tc.desc Verify toReversed() on [-1] stores 2^32-1 (4294967295) in reversed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_1900
     * @tc.name testUint32ArrayToReversedOne019
     * @tc.desc Verify toReversed() on [-2] stores 2^32-2 (4294967294) in reversed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-2);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2000
     * @tc.name testUint32ArrayToReversedOne020
     * @tc.desc Verify int32 -2147483648, 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-2147483648);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2100
     * @tc.name testUint32ArrayToReversedOne021
     * @tc.desc Verify toReversed() on 3.14 stores truncated value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3.14);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2200
     * @tc.name testUint32ArrayToReversedOne022
     * @tc.desc Verify -3.14, 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-3.14);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2300
     * @tc.name testUint32ArrayToReversedOne023
     * @tc.desc Verify toReversed() on NaN stores 0 and preserves order in reversed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.NaN);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2400
     * @tc.name testUint32ArrayToReversedOne024
     * @tc.desc Verify 9007199254740991, 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9007199254740991);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2500
     * @tc.name testUint32ArrayToReversedOne025
     * @tc.desc Verify toReversed() on [1,2] returns new array [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2600
     * @tc.name testUint32ArrayToReversedOne026
     * @tc.desc Verify toReversed() on [2,1] returns new array [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2700
     * @tc.name testUint32ArrayToReversedOne027
     * @tc.desc Verify [4294967295,0],
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2800
     * @tc.name testUint32ArrayToReversedOne028
     * @tc.desc Verify toReversed() on [0,0] returns identical [0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_2900
     * @tc.name testUint32ArrayToReversedOne029
     * @tc.desc Verify [4294967295,4294967295],
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 4294967295);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3000
     * @tc.name testUint32ArrayToReversedOne030
     * @tc.desc Verify [-1,-2], [4294967294,4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-1, -2);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967294);
      expect(r.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3100
     * @tc.name testUint32ArrayToReversedOne031
     * @tc.desc Verify int32 [2147483647,2147483648],
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647, 2147483648);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2147483648);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3200
     * @tc.name testUint32ArrayToReversedOne032
     * @tc.desc Verify [4294967296,4294967295], [4294967295,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967296, 4294967295);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3300
     * @tc.name testUint32ArrayToReversedOne033
     * @tc.desc Verify [3,2,1], [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 2, 1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3400
     * @tc.name testUint32ArrayToReversedOne034
     * @tc.desc Verify toReversed() on [1,1,1] returns identical [1,1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 1, 1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3500
     * @tc.name testUint32ArrayToReversedOne035
     * @tc.desc Verify toReversed() on [0,0,0] returns identical [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3600
     * @tc.name testUint32ArrayToReversedOne036
     * @tc.desc Verify toReversed() on [1,2,1] palindrome returns identical [1,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3700
     * @tc.name testUint32ArrayToReversedOne037
     * @tc.desc Verify [0,1,4294967295], [4294967295,1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 4294967295);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3800
     * @tc.name testUint32ArrayToReversedOne038
     * @tc.desc Verify [4294967295,0,4294967295],
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0, 4294967295);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_3900
     * @tc.name testUint32ArrayToReversedOne039
     * @tc.desc Verify [0x100000000,-1,5], [5,4294967295,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0x100000000, -1, 5);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(4294967295);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4000
     * @tc.name testUint32ArrayToReversedOne040
     * @tc.desc Verify [NaN,Infinity,3.14], [3,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(Number.NaN, Number.POSITIVE_INFINITY, 3.14);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4100
     * @tc.name testUint32ArrayToReversedOne041
     * @tc.desc Verify [-1,-2,-3], [4294967293,4294967294,4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(-1, -2, -3);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(4294967293);
      expect(r.$_get(1)).assertEqual(4294967294);
      expect(r.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4200
     * @tc.name testUint32ArrayToReversedOne042
     * @tc.desc Verify [4294967295,0,1], [1,0,4294967295]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0, 1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4300
     * @tc.name testUint32ArrayToReversedOne043
     * @tc.desc Verify [0o1,0o2,0o3], [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0o1, 0o2, 0o3);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4400
     * @tc.name testUint32ArrayToReversedOne044
     * @tc.desc Verify [1e0,1e1,1e2], [100,10,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1e0, 1e1, 1e2);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4500
     * @tc.name testUint32ArrayToReversedOne045
     * @tc.desc Verify [1,2,3,4,5], [5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const r = arr.toReversed();
      expect(r.byteLength).assertEqual(20);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4600
     * @tc.name testUint32ArrayToReversedOne046
     * @tc.desc Verify [5,4,3,2,1], [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 4, 3, 2, 1);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4700
     * @tc.name testUint32ArrayToReversedOne047
     * @tc.desc Verify [1,2,3,4,5,6,7,8],
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      const r = arr.toReversed();
      expect(r.length).assertEqual(8);
      expect(r.$_get(0)).assertEqual(8);
      expect(r.$_get(3)).assertEqual(5);
      expect(r.$_get(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4800
     * @tc.name testUint32ArrayToReversedOne048
     * @tc.desc Verify [0,1,2,3,4,5,6,7,8,9], [9,8,7,6,5,4,3,2,1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(5)).assertEqual(4);
      expect(r.$_get(9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_4900
     * @tc.name testUint32ArrayToReversedOne049
     * @tc.desc Verify [1,0,1,0,1,0], [0,1,0,1,0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 0, 1, 0, 1, 0);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5000
     * @tc.name testUint32ArrayToReversedOne050
     * @tc.desc Verify [1,2,1,2], [2,1,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 1, 2);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5100
     * @tc.name testUint32ArrayToReversedOne051
     * @tc.desc Verify [1,2,3,4,5,6,7,8,9,10,11,12], [12,11,10,9,8,7,6,5,4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(12);
      expect(r.$_get(6)).assertEqual(6);
      expect(r.$_get(11)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5200
     * @tc.name testUint32ArrayToReversedOne052
     * @tc.desc Verify toReversed() on [0,99] returns [99,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i);
      }
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(99);
      expect(r.$_get(50)).assertEqual(49);
      expect(r.$_get(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5300
     * @tc.name testUint32ArrayToReversedOne053
     * @tc.desc Verify toReversed() on ten-element array filled with 4294967295 returns identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(10);
      for (let i = 0; i < 10; i++) {
        arr.$_set(i, 4294967295);
      }
      const r = arr.toReversed();
      expect(r.length).assertEqual(10);
      expect(r.$_get(0)).assertEqual(4294967295);
      expect(r.$_get(5)).assertEqual(4294967295);
      expect(r.$_get(9)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5400
     * @tc.name testUint32ArrayToReversedOne054
     * @tc.desc Verify byte to uint32 implicit conversion via $_set then toReversed preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      const v: byte = 10;
      arr.$_set(0, v);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5500
     * @tc.name testUint32ArrayToReversedOne055
     * @tc.desc Verify $_set ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      arr.$_set(2, 9);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(1)).assertEqual(8);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5600
     * @tc.name testUint32ArrayToReversedOne056
     * @tc.desc Verify toReversed , ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.toReversed().toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5700
     * @tc.name testUint32ArrayToReversedOne057
     * @tc.desc Verify toReversed() does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5800
     * @tc.name testUint32ArrayToReversedOne058
     * @tc.desc Verify toReversed() returns a Uint32Array instance with BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOREVERSED_5900
     * @tc.name testUint32ArrayToReversedOne059
     * @tc.desc Verify toReversed() returns a new array reference distinct from the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToReversedOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const r = arr.toReversed();
      expect(r === arr).assertFalse();
    });

  });
}
