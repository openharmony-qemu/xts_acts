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

export default function BigInt64ArrayFrom01Test(): void {
  describe('BigInt64ArrayFrom01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0100
     * @tc.name testBigInt64ArrayFromOne0100
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [0n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0200
     * @tc.name testBigInt64ArrayFromOne0200
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [1n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0300
     * @tc.name testBigInt64ArrayFromOne0300
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [-1n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0400
     * @tc.name testBigInt64ArrayFromOne0400
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 255n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [255n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0500
     * @tc.name testBigInt64ArrayFromOne0500
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 256n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [256n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0600
     * @tc.name testBigInt64ArrayFromOne0600
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 65535n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [65535n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(65535n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0700
     * @tc.name testBigInt64ArrayFromOne0700
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 65536n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [65536n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(65536n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0800
     * @tc.name testBigInt64ArrayFromOne0800
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 4294967295n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [4294967295n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(4294967295n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_0900
     * @tc.name testBigInt64ArrayFromOne0900
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 4294967296n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [4294967296n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1000
     * @tc.name testBigInt64ArrayFromOne1000
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value 9223372036854775807n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [9223372036854775807n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1100
     * @tc.name testBigInt64ArrayFromOne1100
     * @tc.desc Verify BigInt64Array.from creates an array from a single-element array with value -9223372036854775808n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [-9223372036854775807n - 1n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1200
     * @tc.name testBigInt64ArrayFromOne1200
     * @tc.desc Verify BigInt64Array.from creates an empty array from an empty array input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1300
     * @tc.name testBigInt64ArrayFromOne1300
     * @tc.desc Verify BigInt64Array.from preserves values for mixed multi-element array combination 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [0n, -2n, 1n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(3);
      expect(act.$_get(0)).assertEqual(0n);
      expect(act.$_get(1)).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1400
     * @tc.name testBigInt64ArrayFromOne1400
     * @tc.desc Verify BigInt64Array.from preserves values for mixed multi-element array combination 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [2n, 9223372036854775807n, -2n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(3);
      expect(act.$_get(0)).assertEqual(2n);
      expect(act.$_get(1)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1500
     * @tc.name testBigInt64ArrayFromOne1500
     * @tc.desc Verify BigInt64Array.from preserves values for mixed multi-element array combination 11.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [31n, -9223372036854775807n - 1n, 32n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(3);
      expect(act.$_get(0)).assertEqual(31n);
      expect(act.$_get(1)).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1600
     * @tc.name testBigInt64ArrayFromOne1600
     * @tc.desc Verify BigInt64Array.from preserves values for mixed multi-element array combination 13.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [63n, 4294967296n, 64n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(3);
      expect(act.$_get(0)).assertEqual(63n);
      expect(act.$_get(1)).assertEqual(4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1700
     * @tc.name testBigInt64ArrayFromOne1700
     * @tc.desc Verify BigInt64Array.from preserves values for mixed multi-element array combination 14.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<bigint> = [64n, 4294967295n, 127n];
      let act = BigInt64Array.from(arr);
      expect(act.length).assertEqual(3);
      expect(act.$_get(0)).assertEqual(64n);
      expect(act.$_get(1)).assertEqual(4294967295n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1800
     * @tc.name testBigInt64ArrayFromOne1800
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_1900
     * @tc.name testBigInt64ArrayFromOne1900
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2000
     * @tc.name testBigInt64ArrayFromOne2000
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-1n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2100
     * @tc.name testBigInt64ArrayFromOne2100
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value 255n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([255n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2200
     * @tc.name testBigInt64ArrayFromOne2200
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value 256n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([256n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2300
     * @tc.name testBigInt64ArrayFromOne2300
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value 65535n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([65535n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(65535n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2400
     * @tc.name testBigInt64ArrayFromOne2400
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value 65536n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([65536n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(65536n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2500
     * @tc.name testBigInt64ArrayFromOne2500
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value
     * 4294967295n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([4294967295n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(4294967295n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2600
     * @tc.name testBigInt64ArrayFromOne2600
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value
     * 4294967296n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([4294967296n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2700
     * @tc.name testBigInt64ArrayFromOne2700
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value
     * 9223372036854775807n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([9223372036854775807n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2800
     * @tc.name testBigInt64ArrayFromOne2800
     * @tc.desc Verify BigInt64Array.from creates a new array from a single-element BigInt64Array with value
     * -9223372036854775808n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-9223372036854775807n - 1n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_2900
     * @tc.name testBigInt64ArrayFromOne2900
     * @tc.desc Verify BigInt64Array.from creates an empty array from an empty BigInt64Array source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array(0);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3000
     * @tc.name testBigInt64ArrayFromOne3000
     * @tc.desc Verify BigInt64Array.from preserves values for long BigInt64Array source branch 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(9);
      expect(act.$_get(0)).assertEqual(0n);
      expect(act.$_get(8)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3100
     * @tc.name testBigInt64ArrayFromOne3100
     * @tc.desc Verify BigInt64Array.from preserves values for long BigInt64Array source branch 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(9);
      expect(act.$_get(0)).assertEqual(1n);
      expect(act.$_get(8)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3200
     * @tc.name testBigInt64ArrayFromOne3200
     * @tc.desc Verify BigInt64Array.from preserves values for long BigInt64Array source branch 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-1n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(9);
      expect(act.$_get(0)).assertEqual(-1n);
      expect(act.$_get(8)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3300
     * @tc.name testBigInt64ArrayFromOne3300
     * @tc.desc Verify updating the source BigInt64Array does not affect the array created by BigInt64Array.from.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([100n, 200n]);
      let act = BigInt64Array.from(src);
      src.$_set(0, 999n);
      expect(act.$_get(0)).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3400
     * @tc.name testBigInt64ArrayFromOne3400
     * @tc.desc Verify updating the array created by BigInt64Array.from does not affect the source BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([300n, 400n]);
      let act = BigInt64Array.from(src);
      act.$_set(1, 888n);
      expect(src.$_get(1)).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3500
     * @tc.name testBigInt64ArrayFromOne3500
     * @tc.desc Verify BigInt64Array.from returns a distinct BigInt64Array instance with a different backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n]);
      let act = BigInt64Array.from(src);
      expect(act instanceof BigInt64Array).assertEqual(true);
      expect(src !== act).assertEqual(true);
      expect(src.buffer !== act.buffer).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3600
     * @tc.name testBigInt64ArrayFromOne3600
     * @tc.desc Verify BigInt64Array.from creates an array from ArrayLike input with single value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<bigint> = [0n] as ArrayLike<bigint>;
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3700
     * @tc.name testBigInt64ArrayFromOne3700
     * @tc.desc Verify BigInt64Array.from creates an array from ArrayLike input with single value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<bigint> = [1n] as ArrayLike<bigint>;
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_ONE_3800
     * @tc.name testBigInt64ArrayFromOne3800
     * @tc.desc Verify BigInt64Array.from creates an array from ArrayLike input with single value -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ArrayLike<bigint> = [-1n] as ArrayLike<bigint>;
      let act = BigInt64Array.from(src);
      expect(act.length).assertEqual(1);
      expect(act.$_get(0)).assertEqual(-1n);
    });

  });
}
