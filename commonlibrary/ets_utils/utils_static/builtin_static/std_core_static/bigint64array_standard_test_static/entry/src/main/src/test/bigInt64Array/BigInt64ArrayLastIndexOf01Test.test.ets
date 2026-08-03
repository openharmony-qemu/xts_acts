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
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BigInt64ArrayLastIndexOf01Test(): void {
  describe('BigInt64ArrayLastIndexOf01Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0010
     * @tc.name testBigInt64ArrayLastIndexOfOne0010
     * @tc.desc Verify lastIndexOf returns 2 when searching for 1n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 1n
      ]);
      expect(arr.lastIndexOf(1n)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0020
     * @tc.name testBigInt64ArrayLastIndexOfOne0020
     * @tc.desc Verify lastIndexOf returns 0 when searching for 0n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(0n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0030
     * @tc.name testBigInt64ArrayLastIndexOfOne0030
     * @tc.desc Verify lastIndexOf returns 8 when searching for 1n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(1n)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0040
     * @tc.name testBigInt64ArrayLastIndexOfOne0040
     * @tc.desc Verify lastIndexOf returns 2 when searching for -1n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(-1n)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0050
     * @tc.name testBigInt64ArrayLastIndexOfOne0050
     * @tc.desc Verify lastIndexOf returns 3 when searching for 9223372036854775807n with default
     *          fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0060
     * @tc.name testBigInt64ArrayLastIndexOfOne0060
     * @tc.desc Verify lastIndexOf returns 4 when searching for -9223372036854775808n with default
     *          fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0070
     * @tc.name testBigInt64ArrayLastIndexOfOne0070
     * @tc.desc Verify lastIndexOf returns 5 when searching for 10n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(10n)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0080
     * @tc.name testBigInt64ArrayLastIndexOfOne0080
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0xBn with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(11n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0090
     * @tc.name testBigInt64ArrayLastIndexOfOne0090
     * @tc.desc Verify lastIndexOf returns -1 when searching for 3n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(3n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0100
     * @tc.name testBigInt64ArrayLastIndexOfOne0100
     * @tc.desc Verify lastIndexOf returns -1 when searching for 9223372036854775806n with default
     *          fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(9223372036854775806n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0110
     * @tc.name testBigInt64ArrayLastIndexOfOne0110
     * @tc.desc Verify lastIndexOf returns -1 when searching for -9223372036854775807n with
     *          default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        0n, 1n, -1n, 9223372036854775807n, -9223372036854775808n, 10n, 8n, 5n, 1n, 2n
      ]);
      expect(arr.lastIndexOf(-9223372036854775807n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0120
     * @tc.name testBigInt64ArrayLastIndexOfOne0120
     * @tc.desc Verify lastIndexOf returns 4 when searching for 1n from index 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, 100)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0130
     * @tc.name testBigInt64ArrayLastIndexOfOne0130
     * @tc.desc Verify lastIndexOf returns 4 when searching for 1n from index 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0140
     * @tc.name testBigInt64ArrayLastIndexOfOne0140
     * @tc.desc Verify lastIndexOf returns 2 when searching for 1n from index 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0150
     * @tc.name testBigInt64ArrayLastIndexOfOne0150
     * @tc.desc Verify lastIndexOf returns 0 when searching for 1n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0160
     * @tc.name testBigInt64ArrayLastIndexOfOne0160
     * @tc.desc Verify lastIndexOf returns 4 when searching for 1n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0170
     * @tc.name testBigInt64ArrayLastIndexOfOne0170
     * @tc.desc Verify lastIndexOf returns 2 when searching for 1n from index -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, -2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0180
     * @tc.name testBigInt64ArrayLastIndexOfOne0180
     * @tc.desc Verify lastIndexOf returns 0 when searching for 1n from index -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0190
     * @tc.name testBigInt64ArrayLastIndexOfOne0190
     * @tc.desc Verify lastIndexOf returns -1 when searching for 1n from index -6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(1n, -6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0200
     * @tc.name testBigInt64ArrayLastIndexOfOne0200
     * @tc.desc Verify lastIndexOf returns 1 when searching for 0n from index 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(0n, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0210
     * @tc.name testBigInt64ArrayLastIndexOfOne0210
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(0n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0220
     * @tc.name testBigInt64ArrayLastIndexOfOne0220
     * @tc.desc Verify lastIndexOf returns 3 when searching for 0n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(0n, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0230
     * @tc.name testBigInt64ArrayLastIndexOfOne0230
     * @tc.desc Verify lastIndexOf returns 1 when searching for 0n from index -3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(0n, -3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0240
     * @tc.name testBigInt64ArrayLastIndexOfOne0240
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0n from index -5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(0n, -5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0250
     * @tc.name testBigInt64ArrayLastIndexOfOne0250
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0n from index -100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 0n, 1n, 0n, 1n
      ]);
      expect(arr.lastIndexOf(0n, -100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0260
     * @tc.name testBigInt64ArrayLastIndexOfOne0260
     * @tc.desc Verify lastIndexOf returns 4 when searching for 9223372036854775807n from index
     *          1000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, 1000)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0270
     * @tc.name testBigInt64ArrayLastIndexOfOne0270
     * @tc.desc Verify lastIndexOf returns 4 when searching for 9223372036854775807n from index 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0280
     * @tc.name testBigInt64ArrayLastIndexOfOne0280
     * @tc.desc Verify lastIndexOf returns 2 when searching for 9223372036854775807n from index 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0290
     * @tc.name testBigInt64ArrayLastIndexOfOne0290
     * @tc.desc Verify lastIndexOf returns 0 when searching for 9223372036854775807n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0300
     * @tc.name testBigInt64ArrayLastIndexOfOne0300
     * @tc.desc Verify lastIndexOf returns 4 when searching for 9223372036854775807n from index
     *          -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0310
     * @tc.name testBigInt64ArrayLastIndexOfOne0310
     * @tc.desc Verify lastIndexOf returns 2 when searching for 9223372036854775807n from index
     *          -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, -2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0320
     * @tc.name testBigInt64ArrayLastIndexOfOne0320
     * @tc.desc Verify lastIndexOf returns 0 when searching for 9223372036854775807n from index
     *          -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0330
     * @tc.name testBigInt64ArrayLastIndexOfOne0330
     * @tc.desc Verify lastIndexOf returns -1 when searching for 9223372036854775807n from index
     *          -1000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(9223372036854775807n, -1000)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0340
     * @tc.name testBigInt64ArrayLastIndexOfOne0340
     * @tc.desc Verify lastIndexOf returns 3 when searching for -9223372036854775808n from index
     *          1000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, 1000)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0350
     * @tc.name testBigInt64ArrayLastIndexOfOne0350
     * @tc.desc Verify lastIndexOf returns 3 when searching for -9223372036854775808n from index
     *          3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0360
     * @tc.name testBigInt64ArrayLastIndexOfOne0360
     * @tc.desc Verify lastIndexOf returns 1 when searching for -9223372036854775808n from index
     *          2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0370
     * @tc.name testBigInt64ArrayLastIndexOfOne0370
     * @tc.desc Verify lastIndexOf returns -1 when searching for -9223372036854775808n from index
     *          0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0380
     * @tc.name testBigInt64ArrayLastIndexOfOne0380
     * @tc.desc Verify lastIndexOf returns 3 when searching for -9223372036854775808n from index
     *          -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0390
     * @tc.name testBigInt64ArrayLastIndexOfOne0390
     * @tc.desc Verify lastIndexOf returns 1 when searching for -9223372036854775808n from index
     *          -3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, -3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0400
     * @tc.name testBigInt64ArrayLastIndexOfOne0400
     * @tc.desc Verify lastIndexOf returns -1 when searching for -9223372036854775808n from index
     *          -5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, -5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0410
     * @tc.name testBigInt64ArrayLastIndexOfOne0410
     * @tc.desc Verify lastIndexOf returns -1 when searching for -9223372036854775808n from index
     *          -1000.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n,
        9223372036854775807n
      ]);
      expect(arr.lastIndexOf(-9223372036854775808n, -1000)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0420
     * @tc.name testBigInt64ArrayLastIndexOfOne0420
     * @tc.desc Verify lastIndexOf returns 4 when searching for 16n from index 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, 100)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0430
     * @tc.name testBigInt64ArrayLastIndexOfOne0430
     * @tc.desc Verify lastIndexOf returns 3 when searching for 16n from index 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0440
     * @tc.name testBigInt64ArrayLastIndexOfOne0440
     * @tc.desc Verify lastIndexOf returns 0 when searching for 16n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0450
     * @tc.name testBigInt64ArrayLastIndexOfOne0450
     * @tc.desc Verify lastIndexOf returns 4 when searching for 16n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0460
     * @tc.name testBigInt64ArrayLastIndexOfOne0460
     * @tc.desc Verify lastIndexOf returns 2 when searching for 16n from index -3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, -3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0470
     * @tc.name testBigInt64ArrayLastIndexOfOne0470
     * @tc.desc Verify lastIndexOf returns 0 when searching for 16n from index -5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, -5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0480
     * @tc.name testBigInt64ArrayLastIndexOfOne0480
     * @tc.desc Verify lastIndexOf returns -1 when searching for 16n from index -6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, -6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0490
     * @tc.name testBigInt64ArrayLastIndexOfOne0490
     * @tc.desc Verify lastIndexOf returns -1 when searching for 16n from index -100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(16n, -100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0500
     * @tc.name testBigInt64ArrayLastIndexOfOne0500
     * @tc.desc Verify lastIndexOf returns -1 when searching for 17n from index 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(17n, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0510
     * @tc.name testBigInt64ArrayLastIndexOfOne0510
     * @tc.desc Verify lastIndexOf returns -1 when searching for 17n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(17n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0520
     * @tc.name testBigInt64ArrayLastIndexOfOne0520
     * @tc.desc Verify lastIndexOf returns -1 when searching for 17n from index -3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(17n, -3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0530
     * @tc.name testBigInt64ArrayLastIndexOfOne0530
     * @tc.desc Verify lastIndexOf returns -1 when searching for 17n from index -10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        16n, 16n, 16n, 16n, 16n
      ]);
      expect(arr.lastIndexOf(17n, -10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0540
     * @tc.name testBigInt64ArrayLastIndexOfOne0540
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.lastIndexOf(0n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0550
     * @tc.name testBigInt64ArrayLastIndexOfOne0550
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.lastIndexOf(0n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0560
     * @tc.name testBigInt64ArrayLastIndexOfOne0560
     * @tc.desc Verify lastIndexOf returns -1 when searching for 0n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.lastIndexOf(0n, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0570
     * @tc.name testBigInt64ArrayLastIndexOfOne0570
     * @tc.desc Verify lastIndexOf returns 0 when searching for 2n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(2n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0580
     * @tc.name testBigInt64ArrayLastIndexOfOne0580
     * @tc.desc Verify lastIndexOf returns 0 when searching for 2n from index 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(2n, 10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0590
     * @tc.name testBigInt64ArrayLastIndexOfOne0590
     * @tc.desc Verify lastIndexOf returns 0 when searching for 2n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(2n, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0600
     * @tc.name testBigInt64ArrayLastIndexOfOne0600
     * @tc.desc Verify lastIndexOf returns 0 when searching for 2n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(2n, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0610
     * @tc.name testBigInt64ArrayLastIndexOfOne0610
     * @tc.desc Verify lastIndexOf returns -1 when searching for 2n from index -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(2n, -2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0620
     * @tc.name testBigInt64ArrayLastIndexOfOne0620
     * @tc.desc Verify lastIndexOf returns -1 when searching for 2n from index -10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(2n, -10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0630
     * @tc.name testBigInt64ArrayLastIndexOfOne0630
     * @tc.desc Verify lastIndexOf returns -1 when searching for 3n with default fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(3n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0640
     * @tc.name testBigInt64ArrayLastIndexOfOne0640
     * @tc.desc Verify lastIndexOf returns -1 when searching for 3n from index 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(3n, 10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0650
     * @tc.name testBigInt64ArrayLastIndexOfOne0650
     * @tc.desc Verify lastIndexOf returns -1 when searching for 3n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(3n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0660
     * @tc.name testBigInt64ArrayLastIndexOfOne0660
     * @tc.desc Verify lastIndexOf returns -1 when searching for 3n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(3n, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0670
     * @tc.name testBigInt64ArrayLastIndexOfOne0670
     * @tc.desc Verify lastIndexOf returns -1 when searching for 3n from index -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        2n
      ]);
      expect(arr.lastIndexOf(3n, -2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0680
     * @tc.name testBigInt64ArrayLastIndexOfOne0680
     * @tc.desc Verify lastIndexOf returns 4 when searching for 5n from index 9.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, 9)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0690
     * @tc.name testBigInt64ArrayLastIndexOfOne0690
     * @tc.desc Verify lastIndexOf returns 4 when searching for 5n from index 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0700
     * @tc.name testBigInt64ArrayLastIndexOfOne0700
     * @tc.desc Verify lastIndexOf returns -1 when searching for 5n from index 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, 3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0710
     * @tc.name testBigInt64ArrayLastIndexOfOne0710
     * @tc.desc Verify lastIndexOf returns -1 when searching for 5n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0720
     * @tc.name testBigInt64ArrayLastIndexOfOne0720
     * @tc.desc Verify lastIndexOf returns 4 when searching for 5n from index -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0730
     * @tc.name testBigInt64ArrayLastIndexOfOne0730
     * @tc.desc Verify lastIndexOf returns -1 when searching for 5n from index -10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, -10)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_ONE_0740
     * @tc.name testBigInt64ArrayLastIndexOfOne0740
     * @tc.desc Verify lastIndexOf returns -1 when searching for 5n from index -11.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfOne0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      expect(arr.lastIndexOf(5n, -11)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0750
     * @tc.name testBigInt64ArrayLastIndexOfTwo0750
     * @tc.desc Verify lastIndexOf returns a value of type int for a single-element match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.lastIndexOf(1n);
      expect(typeof res).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0760
     * @tc.name testBigInt64ArrayLastIndexOfTwo0760
     * @tc.desc Verify length remains 0 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.lastIndexOf(99n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0770
     * @tc.name testBigInt64ArrayLastIndexOfTwo0770
     * @tc.desc Verify length remains 0 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.lastIndexOf(1n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0780
     * @tc.name testBigInt64ArrayLastIndexOfTwo0780
     * @tc.desc Verify length remains 1 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(99n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0790
     * @tc.name testBigInt64ArrayLastIndexOfTwo0790
     * @tc.desc Verify length remains 1 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(1n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0800
     * @tc.name testBigInt64ArrayLastIndexOfTwo0800
     * @tc.desc Verify length remains 2 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.lastIndexOf(99n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0810
     * @tc.name testBigInt64ArrayLastIndexOfTwo0810
     * @tc.desc Verify length remains 2 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.lastIndexOf(1n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0820
     * @tc.name testBigInt64ArrayLastIndexOfTwo0820
     * @tc.desc Verify length remains 10 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      arr.lastIndexOf(99n);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0830
     * @tc.name testBigInt64ArrayLastIndexOfTwo0830
     * @tc.desc Verify length remains 10 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      arr.lastIndexOf(1n);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0840
     * @tc.name testBigInt64ArrayLastIndexOfTwo0840
     * @tc.desc Verify byteLength remains 0 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.lastIndexOf(99n);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0850
     * @tc.name testBigInt64ArrayLastIndexOfTwo0850
     * @tc.desc Verify byteLength remains 0 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.lastIndexOf(1n);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0860
     * @tc.name testBigInt64ArrayLastIndexOfTwo0860
     * @tc.desc Verify byteLength remains 8 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(99n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0870
     * @tc.name testBigInt64ArrayLastIndexOfTwo0870
     * @tc.desc Verify byteLength remains 8 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(1n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0880
     * @tc.name testBigInt64ArrayLastIndexOfTwo0880
     * @tc.desc Verify byteLength remains 80 after finding missing value 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      arr.lastIndexOf(99n);
      expect(arr.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0890
     * @tc.name testBigInt64ArrayLastIndexOfTwo0890
     * @tc.desc Verify byteLength remains 80 after finding element 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      arr.lastIndexOf(1n);
      expect(arr.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0900
     * @tc.name testBigInt64ArrayLastIndexOfTwo0900
     * @tc.desc Verify the first element remains unchanged after finding missing value 99n in an array of length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(99n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0910
     * @tc.name testBigInt64ArrayLastIndexOfTwo0910
     * @tc.desc Verify the first element remains unchanged after finding element 1n in an array of length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0920
     * @tc.name testBigInt64ArrayLastIndexOfTwo0920
     * @tc.desc Verify the first element remains unchanged after finding missing value 99n in an array of length 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.lastIndexOf(99n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0930
     * @tc.name testBigInt64ArrayLastIndexOfTwo0930
     * @tc.desc Verify the first element remains unchanged after finding element 1n in an array of length 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.lastIndexOf(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0940
     * @tc.name testBigInt64ArrayLastIndexOfTwo0940
     * @tc.desc Verify the first element remains unchanged after finding missing value 99n in an array of length 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      arr.lastIndexOf(99n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0950
     * @tc.name testBigInt64ArrayLastIndexOfTwo0950
     * @tc.desc Verify the first element remains unchanged after finding element 1n in an array of length 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n
      ]);
      arr.lastIndexOf(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0960
     * @tc.name testBigInt64ArrayLastIndexOfTwo0960
     * @tc.desc Verify the buffer reference remains unchanged after a matching lookup for 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let buf = arr.buffer;
      arr.lastIndexOf(1n);
      expect(arr.buffer === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0970
     * @tc.name testBigInt64ArrayLastIndexOfTwo0970
     * @tc.desc Verify the buffer reference remains unchanged after an unmatched lookup for 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let buf = arr.buffer;
      arr.lastIndexOf(3n);
      expect(arr.buffer === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0980
     * @tc.name testBigInt64ArrayLastIndexOfTwo0980
     * @tc.desc Verify the buffer reference remains unchanged after a lookup with a negative fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let buf = arr.buffer;
      arr.lastIndexOf(1n, -1);
      expect(arr.buffer === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_0990
     * @tc.name testBigInt64ArrayLastIndexOfTwo0990
     * @tc.desc Verify byteOffset remains unchanged after a matching lookup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(new ArrayBuffer(32), 8, 2);
      let off = arr.byteOffset;
      arr.lastIndexOf(0n);
      expect(arr.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1000
     * @tc.name testBigInt64ArrayLastIndexOfTwo1000
     * @tc.desc Verify byteOffset remains unchanged after an unmatched lookup on a subview.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(new ArrayBuffer(32), 16, 2);
      let off = arr.byteOffset;
      arr.lastIndexOf(99n);
      expect(arr.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1010
     * @tc.name testBigInt64ArrayLastIndexOfTwo1010
     * @tc.desc Verify byteOffset remains unchanged after an unmatched lookup with a negative fromIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(new ArrayBuffer(32), 8, 2);
      let off = arr.byteOffset;
      arr.lastIndexOf(1n, -1);
      expect(arr.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1020
     * @tc.name testBigInt64ArrayLastIndexOfTwo1020
     * @tc.desc Verify the first byte of the underlying buffer remains unchanged after a matching lookup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let int8 = new Int8Array(arr.buffer);
      let orig = Array.from(int8);
      arr.lastIndexOf(1n);
      expect(int8[0]).assertEqual(orig[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1030
     * @tc.name testBigInt64ArrayLastIndexOfTwo1030
     * @tc.desc Verify a middle byte of the underlying buffer remains unchanged after an unmatched lookup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let int8 = new Int8Array(arr.buffer);
      let orig = Array.from(int8);
      arr.lastIndexOf(9n);
      expect(int8[7]).assertEqual(orig[7]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1040
     * @tc.name testBigInt64ArrayLastIndexOfTwo1040
     * @tc.desc Verify the buffer reference stays stable after multiple invocations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let buf = arr.buffer;
      arr.lastIndexOf(1n);
      arr.lastIndexOf(2n);
      arr.lastIndexOf(3n);
      expect(arr.buffer === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1050
     * @tc.name testBigInt64ArrayLastIndexOfTwo1050
     * @tc.desc Verify the object still passes instanceof BigInt64Array after a matching lookup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(1n);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_TWO_1060
     * @tc.name testBigInt64ArrayLastIndexOfTwo1060
     * @tc.desc Verify the object still passes instanceof BigInt64Array after an unmatched lookup.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.lastIndexOf(9n);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1070
     * @tc.name testBigInt64ArrayLastIndexOfThree1070
     * @tc.desc Verify lastIndexOf finds the trailing match in a length-100 array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[50] = 5n;
      arr[99] = 5n;
      expect(arr.lastIndexOf(5n)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1080
     * @tc.name testBigInt64ArrayLastIndexOfThree1080
     * @tc.desc Verify fromIndex 80 returns the middle match in a length-100 array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[50] = 5n;
      arr[99] = 5n;
      expect(arr.lastIndexOf(5n, 80)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1090
     * @tc.name testBigInt64ArrayLastIndexOfThree1090
     * @tc.desc Verify fromIndex 40 returns -1 when the match lies after the search range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[50] = 5n;
      arr[99] = 5n;
      expect(arr.lastIndexOf(5n, 40)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1100
     * @tc.name testBigInt64ArrayLastIndexOfThree1100
     * @tc.desc Verify alternating values return index 4 for 1n from index 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(1n, 5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1110
     * @tc.name testBigInt64ArrayLastIndexOfThree1110
     * @tc.desc Verify alternating values return index 2 for 1n from index 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(1n, 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1120
     * @tc.name testBigInt64ArrayLastIndexOfThree1120
     * @tc.desc Verify alternating values return index 0 for 1n from index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(1n, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1130
     * @tc.name testBigInt64ArrayLastIndexOfThree1130
     * @tc.desc Verify alternating values return index 5 for 2n from index 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(2n, 5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1140
     * @tc.name testBigInt64ArrayLastIndexOfThree1140
     * @tc.desc Verify alternating values return index 3 for 2n from index 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(2n, 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1150
     * @tc.name testBigInt64ArrayLastIndexOfThree1150
     * @tc.desc Verify alternating values return index 1 for 2n from index 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(2n, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1160
     * @tc.name testBigInt64ArrayLastIndexOfThree1160
     * @tc.desc Verify alternating values return -1 for 2n from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(2n, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1170
     * @tc.name testBigInt64ArrayLastIndexOfThree1170
     * @tc.desc Verify negative fromIndex -1 returns index 4 for 1n in alternating values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(1n, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1180
     * @tc.name testBigInt64ArrayLastIndexOfThree1180
     * @tc.desc Verify negative fromIndex -3 returns index 2 for 1n in alternating values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(1n, -3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1190
     * @tc.name testBigInt64ArrayLastIndexOfThree1190
     * @tc.desc Verify negative fromIndex -5 returns index 0 for 1n in alternating values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n, 2n, 1n, 2n]);
      expect(arr.lastIndexOf(1n, -5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1200
     * @tc.name testBigInt64ArrayLastIndexOfThree1200
     * @tc.desc Verify repeated 0n values return index 2 with fromIndex -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      expect(arr.lastIndexOf(0n, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1210
     * @tc.name testBigInt64ArrayLastIndexOfThree1210
     * @tc.desc Verify repeated 0n values return index 1 with fromIndex -2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      expect(arr.lastIndexOf(0n, -2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1220
     * @tc.name testBigInt64ArrayLastIndexOfThree1220
     * @tc.desc Verify repeated 0n values return index 0 with fromIndex -3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      expect(arr.lastIndexOf(0n, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1230
     * @tc.name testBigInt64ArrayLastIndexOfThree1230
     * @tc.desc Verify repeated 0n values return -1 with fromIndex -4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      expect(arr.lastIndexOf(0n, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1240
     * @tc.name testBigInt64ArrayLastIndexOfThree1240
     * @tc.desc Verify searching for the maximum int64 value does not modify the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      arr.lastIndexOf(9223372036854775807n);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1250
     * @tc.name testBigInt64ArrayLastIndexOfThree1250
     * @tc.desc Verify searching for the minimum int64 value does not modify the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      arr.lastIndexOf(-9223372036854775808n);
      expect(arr[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1260
     * @tc.name testBigInt64ArrayLastIndexOfThree1260
     * @tc.desc Verify lastIndexOf finds a value near the maximum int64 boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      expect(arr.lastIndexOf(9223372036854775806n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1270
     * @tc.name testBigInt64ArrayLastIndexOfThree1270
     * @tc.desc Verify lastIndexOf finds a value near the minimum int64 boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      expect(arr.lastIndexOf(-9223372036854775807n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_LAST_INDEX_OF_THREE_1280
     * @tc.name testBigInt64ArrayLastIndexOfThree1280
     * @tc.desc Verify fromIndex 0 returns -1 when the target appears only after the search start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayLastIndexOfThree1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n]);
      expect(arr.lastIndexOf(2n, 0)).assertEqual(-1);
    });
  });
}
