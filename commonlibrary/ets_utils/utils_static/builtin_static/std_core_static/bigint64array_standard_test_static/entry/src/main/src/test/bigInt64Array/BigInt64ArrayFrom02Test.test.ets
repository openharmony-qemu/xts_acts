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

export default function BigInt64ArrayFrom02Test(): void {
  describe('BigInt64ArrayFrom02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0100
     * @tc.name testBigInt64ArrayFromTwo0100
     * @tc.desc Verify from Set returns a BigInt64Array of length 0 for empty input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      let arr = BigInt64Array.from(s);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0200
     * @tc.name testBigInt64ArrayFromTwo0200
     * @tc.desc Verify from Set preserves the single element 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(0n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0300
     * @tc.name testBigInt64ArrayFromTwo0300
     * @tc.desc Verify from Set treats -0n as 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(-0n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0400
     * @tc.name testBigInt64ArrayFromTwo0400
     * @tc.desc Verify from Set preserves 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(1n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0500
     * @tc.name testBigInt64ArrayFromTwo0500
     * @tc.desc Verify from Set preserves -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(-1n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0600
     * @tc.name testBigInt64ArrayFromTwo0600
     * @tc.desc Verify from Set preserves the maximum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(9223372036854775807n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0700
     * @tc.name testBigInt64ArrayFromTwo0700
     * @tc.desc Verify from Set preserves the minimum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(-9223372036854775807n - 1n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0800
     * @tc.name testBigInt64ArrayFromTwo0800
     * @tc.desc Verify from Set wraps the positive overflow value to the negative boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(9223372036854775807n + 1n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_0900
     * @tc.name testBigInt64ArrayFromTwo0900
     * @tc.desc Verify from Set wraps the negative overflow value to the positive boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(-(9223372036854775807n + 2n));
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1000
     * @tc.name testBigInt64ArrayFromTwo1000
     * @tc.desc Verify from Set truncates the unsigned 64-bit maximum to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(18446744073709551615n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1100
     * @tc.name testBigInt64ArrayFromTwo1100
     * @tc.desc Verify from Set deduplicates repeated equal BigInt values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(5n);
      s.add(5n);
      let arr = BigInt64Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1200
     * @tc.name testBigInt64ArrayFromTwo1200
     * @tc.desc Verify from Set preserves insertion order for 2n and 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(2n);
      s.add(1n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1300
     * @tc.name testBigInt64ArrayFromTwo1300
     * @tc.desc Verify from Set keeps the expected length for multiple distinct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(10n);
      s.add(20n);
      s.add(30n);
      let arr = BigInt64Array.from(s);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1400
     * @tc.name testBigInt64ArrayFromTwo1400
     * @tc.desc Verify from Set reports byteLength as element count times 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(100n);
      s.add(200n);
      let arr = BigInt64Array.from(s);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1500
     * @tc.name testBigInt64ArrayFromTwo1500
     * @tc.desc Verify from Set reports a byteOffset of 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(300n);
      let arr = BigInt64Array.from(s);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1600
     * @tc.name testBigInt64ArrayFromTwo1600
     * @tc.desc Verify from Set throws RangeError for out-of-bounds $_get access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(100n);
      let arr = BigInt64Array.from(s);
      try {
        arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1700
     * @tc.name testBigInt64ArrayFromTwo1700
     * @tc.desc Verify from Set returns the stored value for valid $_get access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(500n);
      let arr = BigInt64Array.from(s);
      expect(arr.$_get(0)).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1800
     * @tc.name testBigInt64ArrayFromTwo1800
     * @tc.desc Verify from Set reflects deletion before conversion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(10n);
      s.add(20n);
      s.delete(10n);
      let arr = BigInt64Array.from(s);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_1900
     * @tc.name testBigInt64ArrayFromTwo1900
     * @tc.desc Verify from Set preserves mixed boundary and normal elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(9223372036854775807n);
      s.add(0n);
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2000
     * @tc.name testBigInt64ArrayFromTwo2000
     * @tc.desc Verify from Set truncates positive and negative overflow values together.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      s.add(9223372036854775807n + 1n);
      s.add(-(9223372036854775807n + 2n));
      let arr = BigInt64Array.from(s);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2100
     * @tc.name testBigInt64ArrayFromTwo2100
     * @tc.desc Verify from Set creates an object value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      let arr = BigInt64Array.from(s);
      expect(typeof arr).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2200
     * @tc.name testBigInt64ArrayFromTwo2200
     * @tc.desc Verify from Set throws RangeError for out-of-bounds read on an empty result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<BigInt>();
      let arr = BigInt64Array.from(s);
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2300
     * @tc.name testBigInt64ArrayFromTwo2300
     * @tc.desc Verify from Array returns a BigInt64Array of length 0 for empty input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<BigInt>();
      let arr = BigInt64Array.from(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2400
     * @tc.name testBigInt64ArrayFromTwo2400
     * @tc.desc Verify from Array preserves the single element 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [0n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2500
     * @tc.name testBigInt64ArrayFromTwo2500
     * @tc.desc Verify from Array treats -0n as 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [-0n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2600
     * @tc.name testBigInt64ArrayFromTwo2600
     * @tc.desc Verify from Array preserves 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [1n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2700
     * @tc.name testBigInt64ArrayFromTwo2700
     * @tc.desc Verify from Array preserves -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [-1n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2800
     * @tc.name testBigInt64ArrayFromTwo2800
     * @tc.desc Verify from Array preserves the maximum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [9223372036854775807n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_2900
     * @tc.name testBigInt64ArrayFromTwo2900
     * @tc.desc Verify from Array preserves the minimum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [-9223372036854775807n - 1n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3000
     * @tc.name testBigInt64ArrayFromTwo3000
     * @tc.desc Verify from Array wraps the positive overflow value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [9223372036854775807n + 1n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3100
     * @tc.name testBigInt64ArrayFromTwo3100
     * @tc.desc Verify from Array wraps the negative overflow value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [-9223372036854775809n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3200
     * @tc.name testBigInt64ArrayFromTwo3200
     * @tc.desc Verify from Array truncates the unsigned 64-bit maximum to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [18446744073709551615n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3300
     * @tc.name testBigInt64ArrayFromTwo3300
     * @tc.desc Verify from Array preserves the large binary positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [2147483647n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(2147483647n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3400
     * @tc.name testBigInt64ArrayFromTwo3400
     * @tc.desc Verify from Array keeps duplicate elements without deduplication.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [5n, 5n];
      let arr = BigInt64Array.from(src);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3500
     * @tc.name testBigInt64ArrayFromTwo3500
     * @tc.desc Verify from Array preserves source order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [2n, 1n];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3600
     * @tc.name testBigInt64ArrayFromTwo3600
     * @tc.desc Verify from Array.of preserves multiple inserted elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<BigInt>(10n, 20n, 30n);
      let arr = BigInt64Array.from(src);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3700
     * @tc.name testBigInt64ArrayFromTwo3700
     * @tc.desc Verify from Array reports the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [100n, 200n];
      let arr = BigInt64Array.from(src);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3800
     * @tc.name testBigInt64ArrayFromTwo3800
     * @tc.desc Verify from Array reports a byteOffset of 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [300n];
      let arr = BigInt64Array.from(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_3900
     * @tc.name testBigInt64ArrayFromTwo3900
     * @tc.desc Verify from Array keeps the created result unchanged after source mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [10n, 20n];
      let arr = BigInt64Array.from(src);
      src[0] = 99n;
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4000
     * @tc.name testBigInt64ArrayFromTwo4000
     * @tc.desc Verify from Array keeps the source unchanged after target mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [10n, 20n];
      let arr = BigInt64Array.from(src);
      arr[0] = 99n;
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4100
     * @tc.name testBigInt64ArrayFromTwo4100
     * @tc.desc Verify from Array throws RangeError for out-of-bounds $_get access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [100n];
      let arr = BigInt64Array.from(src);
      try {
        arr.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4200
     * @tc.name testBigInt64ArrayFromTwo4200
     * @tc.desc Verify from Array truncates positive and negative overflow values together.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [9223372036854775807n + 1n, -(9223372036854775807n + 2n)];
      let arr = BigInt64Array.from(src);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4300
     * @tc.name testBigInt64ArrayFromTwo4300
     * @tc.desc Verify from Array creates an object value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = [10n];
      let arr = BigInt64Array.from(src);
      expect(typeof arr).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4400
     * @tc.name testBigInt64ArrayFromTwo4400
     * @tc.desc Verify mapfn converts Array<number> values to BigInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(10);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return BigInt(v); });
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4500
     * @tc.name testBigInt64ArrayFromTwo4500
     * @tc.desc Verify mapfn converts Array<string> values to BigInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<string>("20");
      let arr =
        BigInt64Array.from(src, (v: string, k: number): BigInt => { return BigInt(v); });
      expect(arr[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4600
     * @tc.name testBigInt64ArrayFromTwo4600
     * @tc.desc Verify mapfn converts Array<boolean> values to BigInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<boolean>(true, false);
      let arr = BigInt64Array.from(
        src,
        (v: boolean, k: number): BigInt => { return v ? 1n : 0n; }
      );
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4700
     * @tc.name testBigInt64ArrayFromTwo4700
     * @tc.desc Verify mapfn keeps an empty Array<number> result empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>();
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return BigInt(v); });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4800
     * @tc.name testBigInt64ArrayFromTwo4800
     * @tc.desc Verify mapfn always returns 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1, 2);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return 0n; });
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_4900
     * @tc.name testBigInt64ArrayFromTwo4900
     * @tc.desc Verify mapfn always returns 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(3, 4);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return 1n; });
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5000
     * @tc.name testBigInt64ArrayFromTwo5000
     * @tc.desc Verify mapfn always returns -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(5, 6);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return -1n; });
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5100
     * @tc.name testBigInt64ArrayFromTwo5100
     * @tc.desc Verify mapfn returns the maximum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return 9223372036854775807n; }
      );
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5200
     * @tc.name testBigInt64ArrayFromTwo5200
     * @tc.desc Verify mapfn returns the minimum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return -9223372036854775807n - 1n; }
      );
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5300
     * @tc.name testBigInt64ArrayFromTwo5300
     * @tc.desc Verify mapfn returns the positive overflow value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return 9223372036854775807n + 1n; }
      );
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5400
     * @tc.name testBigInt64ArrayFromTwo5400
     * @tc.desc Verify mapfn returns the negative overflow value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return -(9223372036854775807n + 2n); }
      );
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5500
     * @tc.name testBigInt64ArrayFromTwo5500
     * @tc.desc Verify mapfn returns the unsigned 64-bit maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return 18446744073709551615n; }
      );
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5600
     * @tc.name testBigInt64ArrayFromTwo5600
     * @tc.desc Verify mapfn converts values by using only index k.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(100, 200, 300);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return BigInt(k); }
      );
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5700
     * @tc.name testBigInt64ArrayFromTwo5700
     * @tc.desc Verify mapfn combines v and k in the conversion result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(10, 20);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return BigInt(v + k); }
      );
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5800
     * @tc.name testBigInt64ArrayFromTwo5800
     * @tc.desc Verify mapfn propagates an Error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      try {
        BigInt64Array.from(
          src,
          (v: number, k: number): BigInt => {
            throw new Error("ERR");
          }
        );
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_5900
     * @tc.name testBigInt64ArrayFromTwo5900
     * @tc.desc Verify mapfn uses external closure state for accumulation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0n;
      let src = Array.of<number>(1, 1, 1);
      let arr = BigInt64Array.from(src, (v: number, k: number): BigInt => {
        sum += 1n;
        return sum;
      });
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6000
     * @tc.name testBigInt64ArrayFromTwo6000
     * @tc.desc Verify mapfn returns BigInt(v) * 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(5);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return BigInt(v) * 2n; }
      );
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6100
     * @tc.name testBigInt64ArrayFromTwo6100
     * @tc.desc Verify mapfn parses the hexadecimal string input 0x10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<string>("0x10");
      let arr =
        BigInt64Array.from(src, (v: string, k: number): BigInt => { return BigInt(v); });
      expect(arr[0]).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6200
     * @tc.name testBigInt64ArrayFromTwo6200
     * @tc.desc Verify mapfn parses the signed negative string input -15.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<string>("-15");
      let arr =
        BigInt64Array.from(src, (v: string, k: number): BigInt => { return BigInt(v); });
      expect(arr[0]).assertEqual(-15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6300
     * @tc.name testBigInt64ArrayFromTwo6300
     * @tc.desc Verify mapfn selects different constants by condition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1, 2, 3);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return k % 2 === 0 ? 0n : 10n; }
      );
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6400
     * @tc.name testBigInt64ArrayFromTwo6400
     * @tc.desc Verify mapfn result reports the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1, 2);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return 1n; });
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6500
     * @tc.name testBigInt64ArrayFromTwo6500
     * @tc.desc Verify mapfn result reports a byteOffset of 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1, 2, 3);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return 100n; });
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6600
     * @tc.name testBigInt64ArrayFromTwo6600
     * @tc.desc Verify mapfn builds values from a large decimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return BigInt("9223372036854775807"); }
      );
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6700
     * @tc.name testBigInt64ArrayFromTwo6700
     * @tc.desc Verify mapfn returns the shift expression 1n << 10n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return 1n << 10n; }
      );
      expect(arr[0]).assertEqual(1024n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6800
     * @tc.name testBigInt64ArrayFromTwo6800
     * @tc.desc Verify mapfn returns the overflowed negative shift expression.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return -(1n << 64n); }
      );
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_6900
     * @tc.name testBigInt64ArrayFromTwo6900
     * @tc.desc Verify mapfn returns the bitwise not of BigInt(v).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(1);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return ~BigInt(v); }
      );
      expect(arr[0]).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_7000
     * @tc.name testBigInt64ArrayFromTwo7000
     * @tc.desc Verify mapfn returns BigInt(v) modulo 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(10);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return BigInt(v) % 3n; }
      );
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_7100
     * @tc.name testBigInt64ArrayFromTwo7100
     * @tc.desc Verify mapfn returns integer division BigInt(v) / 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(5);
      let arr = BigInt64Array.from(
        src,
        (v: number, k: number): BigInt => { return BigInt(v) / 2n; }
      );
      expect(arr[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_7200
     * @tc.name testBigInt64ArrayFromTwo7200
     * @tc.desc Verify mapfn converts Number.MAX_SAFE_INTEGER exactly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(Number.MAX_SAFE_INTEGER);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return BigInt(v); });
      expect(arr[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_TWO_7300
     * @tc.name testBigInt64ArrayFromTwo7300
     * @tc.desc Verify mapfn converts Number.MIN_SAFE_INTEGER exactly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFromTwo7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Array.of<number>(Number.MIN_SAFE_INTEGER);
      let arr =
        BigInt64Array.from(src, (v: number, k: number): BigInt => { return BigInt(v); });
      expect(arr[0]).assertEqual(-9007199254740991n);
    });

  });
}
