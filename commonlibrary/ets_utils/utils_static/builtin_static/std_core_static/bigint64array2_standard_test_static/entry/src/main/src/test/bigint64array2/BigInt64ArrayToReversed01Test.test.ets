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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BigInt64ArrayToReversed01Test(): void {
  describe('BigInt64ArrayToReversed01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0010
     * @tc.name testBigInt64ArrayToReversedOne001
     * @tc.desc Verify toReversed on an empty BigInt64Array returns an array where OOB access throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([]);
      let rev = orig.toReversed();
      try {
        let v = rev[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0020
     * @tc.name testBigInt64ArrayToReversedOne002
     * @tc.desc Verify toReversed on an empty BigInt64Array returns an array with byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([]);
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0030
     * @tc.name testBigInt64ArrayToReversedOne003
     * @tc.desc Verify toReversed on an empty BigInt64Array returns an array with byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([]);
      let rev = orig.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0040
     * @tc.name testBigInt64ArrayToReversedOne004
     * @tc.desc Verify original empty BigInt64Array still throws RangeError on OOB access after toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([]);
      orig.toReversed();
      try {
        let v = orig[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0050
     * @tc.name testBigInt64ArrayToReversedOne005
     * @tc.desc Verify BigInt64Array.of() empty has no elements and toReversed result throws RangeError on OOB access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.of();
      let rev = orig.toReversed();
      try {
        let v = rev[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0060
     * @tc.name testBigInt64ArrayToReversedOne006
     * @tc.desc Verify new BigInt64Array(0) toReversed result throws RangeError on OOB access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(0);
      let rev = orig.toReversed();
      try {
        let v = rev[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0070
     * @tc.name testBigInt64ArrayToReversedOne007
     * @tc.desc Verify toReversed on a single-element array [0n] returns an array with the same element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0080
     * @tc.name testBigInt64ArrayToReversedOne008
     * @tc.desc Verify toReversed on array with negative values preserves correct values in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-3n, -1n, -2n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-2n);
      expect(rev[1]).assertEqual(-1n);
      expect(rev[2]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0090
     * @tc.name testBigInt64ArrayToReversedOne009
     * @tc.desc Verify toReversed on [MAX] preserves the BigInt64 maximum boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0100
     * @tc.name testBigInt64ArrayToReversedOne010
     * @tc.desc Verify toReversed on [MIN] preserves the BigInt64 minimum boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0110
     * @tc.name testBigInt64ArrayToReversedOne011
     * @tc.desc Verify toReversed on [-1n] preserves negative one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0120
     * @tc.name testBigInt64ArrayToReversedOne012
     * @tc.desc Verify toReversed on BigInt64Array.of(42n) preserves the value for of()-constructed source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.of(42n);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0130
     * @tc.name testBigInt64ArrayToReversedOne013
     * @tc.desc Verify toReversed on [100n] preserves the three-digit positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([100n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0140
     * @tc.name testBigInt64ArrayToReversedOne014
     * @tc.desc Verify writing to the reversed single-element array does not affect the original element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      expect(orig[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0150
     * @tc.name testBigInt64ArrayToReversedOne015
     * @tc.desc Verify writing to original after toReversed does not affect the reversed copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n]);
      let rev = orig.toReversed();
      orig[0] = 99n;
      expect(rev[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0160
     * @tc.name testBigInt64ArrayToReversedOne016
     * @tc.desc Verify single-element [MAX] write isolation: modifying rev does not change orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n]);
      let rev = orig.toReversed();
      rev[0] = 0n;
      expect(orig[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0170
     * @tc.name testBigInt64ArrayToReversedOne017
     * @tc.desc Verify single-element [MIN] write isolation: modifying rev does not change orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-9223372036854775808n]);
      let rev = orig.toReversed();
      rev[0] = 0n;
      expect(orig[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0180
     * @tc.name testBigInt64ArrayToReversedOne018
     * @tc.desc Verify single-element original length unchanged after toReversed and rev write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n]);
      let rev = orig.toReversed();
      rev[0] = 10n;
      expect(orig[0]).assertEqual(5n);
      expect(orig.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0190
     * @tc.name testBigInt64ArrayToReversedOne019
     * @tc.desc Verify single-element byteLength unchanged after toReversed and rev mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n]);
      let rev = orig.toReversed();
      rev[0] = 10n;
      expect(orig.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0200
     * @tc.name testBigInt64ArrayToReversedOne020
     * @tc.desc Verify toReversed on a two-element ascending array produces descending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(2n);
      expect(rev[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0210
     * @tc.name testBigInt64ArrayToReversedOne021
     * @tc.desc Verify toReversed on boundary pair [MAX,MIN] swaps correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
      expect(rev[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0220
     * @tc.name testBigInt64ArrayToReversedOne022
     * @tc.desc Verify toReversed on negative pair [-1n,-2n] swaps correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-1n, -2n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-2n);
      expect(rev[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0230
     * @tc.name testBigInt64ArrayToReversedOne023
     * @tc.desc Verify toReversed on a two-element zero-and-one array produces reversed element order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n, 1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0240
     * @tc.name testBigInt64ArrayToReversedOne024
     * @tc.desc Verify toReversed on mixed-sign pair [1n,-1n] swaps correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, -1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-1n);
      expect(rev[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0250
     * @tc.name testBigInt64ArrayToReversedOne025
     * @tc.desc Verify toReversed on two-element array returns elements in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(20n);
      expect(rev[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0260
     * @tc.name testBigInt64ArrayToReversedOne026
     * @tc.desc Verify writing rev[0] does not change orig[0] for a pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      expect(orig[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0270
     * @tc.name testBigInt64ArrayToReversedOne027
     * @tc.desc Verify modifying both rev elements does not affect either original element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      rev[1] = 88n;
      expect(orig[0]).assertEqual(10n);
      expect(orig[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0280
     * @tc.name testBigInt64ArrayToReversedOne028
     * @tc.desc Verify modifying orig after toReversed does not affect an already-created rev (snapshot semantics).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 6n]);
      let rev = orig.toReversed();
      orig[0] = 99n;
      expect(rev[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0290
     * @tc.name testBigInt64ArrayToReversedOne029
     * @tc.desc Verify toReversed() on an array with all identical values returns the same values in identical order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([7n, 7n, 7n, 7n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(7n);
      expect(rev[1]).assertEqual(7n);
      expect(rev[2]).assertEqual(7n);
      expect(rev[3]).assertEqual(7n);
      expect(orig[0]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0300
     * @tc.name testBigInt64ArrayToReversedOne030
     * @tc.desc Verify original byteLength is preserved after toReversed and rev mutation for a pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      expect(orig.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0310
     * @tc.name testBigInt64ArrayToReversedOne031
     * @tc.desc Verify toReversed reverses a three-element array without modifying the original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0320
     * @tc.name testBigInt64ArrayToReversedOne032
     * @tc.desc Verify toReversed on [MAX,0n,MIN] reverses all three boundary values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
      expect(rev[1]).assertEqual(0n);
      expect(rev[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0330
     * @tc.name testBigInt64ArrayToReversedOne033
     * @tc.desc Verify toReversed on [-1n,-2n,-3n] reverses all three negative values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-1n, -2n, -3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-3n);
      expect(rev[1]).assertEqual(-2n);
      expect(rev[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0340
     * @tc.name testBigInt64ArrayToReversedOne034
     * @tc.desc Verify toReversed on [0n,0n,0n] preserves all zero values at correct indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n, 0n, 0n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(0n);
      expect(rev[1]).assertEqual(0n);
      expect(rev[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0350
     * @tc.name testBigInt64ArrayToReversedOne035
     * @tc.desc Verify toReversed on [1n,1n,1n] preserves all identical values at correct reversed indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 1n, 1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(1n);
      expect(rev[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0360
     * @tc.name testBigInt64ArrayToReversedOne036
     * @tc.desc Verify writing rev[0] on three-element reversed array does not change orig[2].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      expect(orig[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0370
     * @tc.name testBigInt64ArrayToReversedOne037
     * @tc.desc Verify three-element toReversed returns elements in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 6n, 7n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(7n);
      expect(rev[1]).assertEqual(6n);
      expect(rev[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0380
     * @tc.name testBigInt64ArrayToReversedOne038
     * @tc.desc Verify toReversed returns a different object reference than the original (rev !== orig).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      expect(orig !== rev).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0390
     * @tc.name testBigInt64ArrayToReversedOne039
     * @tc.desc Verify two separate toReversed calls on the same source produce different object references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev1 = orig.toReversed();
      let rev2 = orig.toReversed();
      expect(rev1 !== rev2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0400
     * @tc.name testBigInt64ArrayToReversedOne040
     * @tc.desc Verify two independent reversed copies from the same source have independent values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev1 = orig.toReversed();
      let rev2 = orig.toReversed();
      rev1[0] = 99n;
      expect(rev2[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0410
     * @tc.name testBigInt64ArrayToReversedOne041
     * @tc.desc Verify toReversed result byteOffset is 0 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.of();
      let rev = orig.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0420
     * @tc.name testBigInt64ArrayToReversedOne042
     * @tc.desc Verify toReversed result byteLength equals length * 8 for a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0430
     * @tc.name testBigInt64ArrayToReversedOne043
     * @tc.desc Verify toReversed result byteLength equals length * 8 for a three-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0440
     * @tc.name testBigInt64ArrayToReversedOne044
     * @tc.desc Verify toReversed result buffer.byteLength equals rev.byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      expect(rev.buffer.byteLength).assertEqual(rev.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0450
     * @tc.name testBigInt64ArrayToReversedOne045
     * @tc.desc Verify toReversed result buffer is not the same reference as the original buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      expect(orig.buffer !== rev.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0460
     * @tc.name testBigInt64ArrayToReversedOne046
     * @tc.desc Verify toReversed on source with non-zero byteOffset produces result with byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let orig = new BigInt64Array(buf, 8, 2);
      orig[0] = 10n;
      orig[1] = 20n;
      let rev = orig.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0470
     * @tc.name testBigInt64ArrayToReversedOne047
     * @tc.desc Verify toReversed on source with non-zero byteOffset preserves values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let orig = new BigInt64Array(buf, 8, 2);
      orig[0] = 10n;
      orig[1] = 20n;
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(20n);
      expect(rev[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0480
     * @tc.name testBigInt64ArrayToReversedOne048
     * @tc.desc Verify toReversed result byteLength for source with non-zero byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let orig = new BigInt64Array(buf, 8, 3);
      orig[0] = 1n;
      orig[1] = 2n;
      orig[2] = 3n;
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0490
     * @tc.name testBigInt64ArrayToReversedOne049
     * @tc.desc Verify original byteOffset is preserved after toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let orig = new BigInt64Array(buf, 8, 2);
      orig[0] = 1n;
      orig[1] = 2n;
      orig.toReversed();
      expect(orig.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0500
     * @tc.name testBigInt64ArrayToReversedOne050
     * @tc.desc Verify modifying orig via index assignment after toReversed does not affect rev.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      orig[0] = 99n;
      expect(rev[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0510
     * @tc.name testBigInt64ArrayToReversedOne051
     * @tc.desc Verify modifying rev via index assignment does not affect orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      rev[1] = 99n;
      expect(orig[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0520
     * @tc.name testBigInt64ArrayToReversedOne052
     * @tc.desc Verify modifying orig buffer through Int8Array view does not affect rev.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      let i8 = new Int8Array(orig.buffer);
      i8[0] = 99;
      expect(rev[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0530
     * @tc.name testBigInt64ArrayToReversedOne053
     * @tc.desc Verify modifying rev buffer through Int8Array view does not affect orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      let i8 = new Int8Array(rev.buffer);
      i8[0] = 99;
      expect(orig[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0540
     * @tc.name testBigInt64ArrayToReversedOne054
     * @tc.desc Verify rev buffer is a new independent buffer (modify orig buffer bytes, rev unchanged).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n]);
      let rev = orig.toReversed();
      let origBytes = new Int8Array(orig.buffer);
      origBytes[0] = 127;
      expect(rev[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0550
     * @tc.name testBigInt64ArrayToReversedOne055
     * @tc.desc Verify original buffer byteLength is unchanged after toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      orig.toReversed();
      expect(orig.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0560
     * @tc.name testBigInt64ArrayToReversedOne056
     * @tc.desc Verify calling toReversed twice produces two results with independent buffers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev1 = orig.toReversed();
      let rev2 = orig.toReversed();
      expect(rev1.buffer !== rev2.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0570
     * @tc.name testBigInt64ArrayToReversedOne057
     * @tc.desc Verify original byteLength is preserved after toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      orig.toReversed();
      expect(orig.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0580
     * @tc.name testBigInt64ArrayToReversedOne058
     * @tc.desc Verify toReversed on a subarray correctly reverses the subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = orig.subarray(1, 4);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(4n);
      expect(rev[1]).assertEqual(3n);
      expect(rev[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0590
     * @tc.name testBigInt64ArrayToReversedOne059
     * @tc.desc Verify toReversed on a subarray returns byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = orig.subarray(1, 3);
      let rev = sub.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0600
     * @tc.name testBigInt64ArrayToReversedOne060
     * @tc.desc Verify toReversed on subarray does not affect the parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = orig.subarray(1, 4);
      let rev = sub.toReversed();
      rev[0] = 99n;
      expect(orig[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0610
     * @tc.name testBigInt64ArrayToReversedOne061
     * @tc.desc Verify modifying parent after subarray.toReversed does not affect the reversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = orig.subarray(1, 4);
      let rev = sub.toReversed();
      orig[1] = 99n;
      expect(rev[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0620
     * @tc.name testBigInt64ArrayToReversedOne062
     * @tc.desc Verify toReversed on a full-range subarray(0) correctly reverses all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let sub = orig.subarray(0);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(30n);
      expect(rev[1]).assertEqual(20n);
      expect(rev[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0630
     * @tc.name testBigInt64ArrayToReversedOne063
     * @tc.desc Verify toReversed on subarray(0,0) returns empty array with length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let sub = orig.subarray(0, 0);
      let rev = sub.toReversed();
      try {
        let v = rev[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0640
     * @tc.name testBigInt64ArrayToReversedOne064
     * @tc.desc Verify toReversed on subarray from middle to end preserves correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = orig.subarray(2);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(5n);
      expect(rev[1]).assertEqual(4n);
      expect(rev[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0650
     * @tc.name testBigInt64ArrayToReversedOne065
     * @tc.desc Verify toReversed on subarray of a byteOffset source preserves correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let orig = new BigInt64Array(buf, 8, 3);
      orig[0] = 10n;
      orig[1] = 20n;
      orig[2] = 30n;
      let sub = orig.subarray(1);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(30n);
      expect(rev[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0660
     * @tc.name testBigInt64ArrayToReversedOne066
     * @tc.desc Verify toReversed on a slice result correctly reverses the slice elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sli = orig.slice(1, 4);
      let rev = sli.toReversed();
      expect(rev[0]).assertEqual(4n);
      expect(rev[1]).assertEqual(3n);
      expect(rev[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0670
     * @tc.name testBigInt64ArrayToReversedOne067
     * @tc.desc Verify toReversed on slice result has byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let sli = orig.slice(1);
      let rev = sli.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0680
     * @tc.name testBigInt64ArrayToReversedOne068
     * @tc.desc Verify toReversed on slice result is independent of the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let sli = orig.slice(0);
      let rev = sli.toReversed();
      rev[0] = 99n;
      expect(orig[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0690
     * @tc.name testBigInt64ArrayToReversedOne069
     * @tc.desc Verify toReversed on empty slice result produces empty reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let sli = orig.slice(0, 0);
      let rev = sli.toReversed();
      try {
        let v = rev[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0700
     * @tc.name testBigInt64ArrayToReversedOne070
     * @tc.desc Verify toReversed on slice(-1) (last element) preserves the single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let sli = orig.slice(-1);
      let rev = sli.toReversed();
      expect(rev[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0710
     * @tc.name testBigInt64ArrayToReversedOne071
     * @tc.desc Verify toReversed applied twice restores the original two-element array order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed().toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0720
     * @tc.name testBigInt64ArrayToReversedOne072
     * @tc.desc Verify toReversed applied twice on three elements restores the original order at all positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let rev = orig.toReversed().toReversed();
      expect(rev[0]).assertEqual(10n);
      expect(rev[1]).assertEqual(20n);
      expect(rev[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0730
     * @tc.name testBigInt64ArrayToReversedOne073
     * @tc.desc Verify double toReversed on single-element array preserves the value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([42n]);
      let rev = orig.toReversed().toReversed();
      expect(rev[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0740
     * @tc.name testBigInt64ArrayToReversedOne074
     * @tc.desc Verify double toReversed on empty array returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([]);
      let rev = orig.toReversed().toReversed();
      try {
        let v = rev[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0750
     * @tc.name testBigInt64ArrayToReversedOne075
     * @tc.desc Verify double toReversed on boundary pair [MAX,MIN] restores original order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let rev = orig.toReversed().toReversed();
      expect(rev[0]).assertEqual(9223372036854775807n);
      expect(rev[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0760
     * @tc.name testBigInt64ArrayToReversedOne076
     * @tc.desc Verify double toReversed on five-element array restores original order (all positions verified).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed().toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(3n);
      expect(rev[3]).assertEqual(4n);
      expect(rev[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0770
     * @tc.name testBigInt64ArrayToReversedOne077
     * @tc.desc Verify the intermediate reversed array between double toReversed has correct length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let mid = orig.toReversed();
      let rev = mid.toReversed();
      expect(mid[0]).assertEqual(3n);
      expect(mid[2]).assertEqual(1n);
      expect(rev[0]).assertEqual(1n);
      expect(rev[2]).assertEqual(3n);
      expect(mid.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0780
     * @tc.name testBigInt64ArrayToReversedOne078
     * @tc.desc Verify toReversed on a five-element array mixing MAX, MIN, 0n, 1n, -1n reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-1n);
      expect(rev[1]).assertEqual(1n);
      expect(rev[2]).assertEqual(0n);
      expect(rev[3]).assertEqual(-9223372036854775808n);
      expect(rev[4]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0790
     * @tc.name testBigInt64ArrayToReversedOne079
     * @tc.desc Verify toReversed on new BigInt64Array(5) zero-filled array reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(5);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(0n);
      expect(rev[2]).assertEqual(0n);
      expect(rev[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0800
     * @tc.name testBigInt64ArrayToReversedOne080
     * @tc.desc Verify toReversed on alternating positive and negative values reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, -1n, 2n, -2n, 3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(-2n);
      expect(rev[2]).assertEqual(2n);
      expect(rev[3]).assertEqual(-1n);
      expect(rev[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0810
     * @tc.name testBigInt64ArrayToReversedOne081
     * @tc.desc Verify toReversed on array with near-boundary large positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 9223372036854775807n - 1n, 9223372036854775807n - 2n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(9223372036854775807n - 2n);
      expect(rev[1]).assertEqual(9223372036854775807n - 1n);
      expect(rev[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0820
     * @tc.name testBigInt64ArrayToReversedOne082
     * @tc.desc Verify toReversed on array with near-boundary large negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-9223372036854775808n, -9223372036854775808n + 1n, -9223372036854775808n + 2n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n + 2n);
      expect(rev[1]).assertEqual(-9223372036854775808n + 1n);
      expect(rev[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0830
     * @tc.name testBigInt64ArrayToReversedOne083
     * @tc.desc Verify toReversed on a 7-element array with repeated pattern [1n,2n,3n,1n,2n,3n,1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 1n, 2n, 3n, 1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(3n);
      expect(rev[2]).assertEqual(2n);
      expect(rev[6]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0840
     * @tc.name testBigInt64ArrayToReversedOne084
     * @tc.desc Verify toReversed on array with values in descending order produces ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(3n);
      expect(rev[3]).assertEqual(4n);
      expect(rev[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0850
     * @tc.name testBigInt64ArrayToReversedOne085
     * @tc.desc Verify toReversed on array with zero and non-zero mixed values [0n,100n,0n,200n,0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n, 100n, 0n, 200n, 0n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(0n);
      expect(rev[1]).assertEqual(200n);
      expect(rev[2]).assertEqual(0n);
      expect(rev[3]).assertEqual(100n);
      expect(rev[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0860
     * @tc.name testBigInt64ArrayToReversedOne086
     * @tc.desc Verify toReversed on 10-element ascending array produces correct reversed values via for loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      let allCorrect = true;
      for (let i = 0; i < 10; i++) {
        if (rev[i] !== BigInt(9 - i)) {
          allCorrect = false;
        }
      }
      expect(allCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0870
     * @tc.name testBigInt64ArrayToReversedOne087
     * @tc.desc Verify toReversed on 10-element ascending array has correct length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(9n);
      expect(rev[9]).assertEqual(0n);
      expect(rev.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0880
     * @tc.name testBigInt64ArrayToReversedOne088
     * @tc.desc Verify original 10-element array is unchanged after toReversed via for loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      orig.toReversed();
      let origUnchanged = true;
      for (let i = 0; i < 10; i++) {
        if (orig[i] !== BigInt(i)) {
          origUnchanged = false;
        }
      }
      expect(origUnchanged).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0890
     * @tc.name testBigInt64ArrayToReversedOne089
     * @tc.desc Verify write isolation on 10-element reversed array: modifying all rev elements does not affect orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      for (let i = 0; i < 10; i++) {
        rev[i] = 99n;
      }
      expect(orig[0]).assertEqual(0n);
      expect(orig[9]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0900
     * @tc.name testBigInt64ArrayToReversedOne090
     * @tc.desc Verify toReversed on 6-element (even-length) array produces correct reversed values via for loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let rev = orig.toReversed();
      let allCorrect = true;
      let expected = [60n, 50n, 40n, 30n, 20n, 10n];
      for (let i = 0; i < 6; i++) {
        if (rev[i] !== expected[i]) {
          allCorrect = false;
        }
      }
      expect(allCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0910
     * @tc.name testBigInt64ArrayToReversedOne091
     * @tc.desc Verify toReversed on 7-element (odd-length) array produces correct reversed values via for loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let rev = orig.toReversed();
      let allCorrect = true;
      let expected = [7n, 6n, 5n, 4n, 3n, 2n, 1n];
      for (let i = 0; i < 7; i++) {
        if (rev[i] !== expected[i]) {
          allCorrect = false;
        }
      }
      expect(allCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0920
     * @tc.name testBigInt64ArrayToReversedOne092
     * @tc.desc Verify toReversed on 15-element array has correct length, byteLength, and element at middle index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(15);
      for (let i = 0; i < 15; i++) {
        orig[i] = BigInt(i * 10);
      }
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(140n);
      expect(rev.byteLength).assertEqual(120);
      expect(rev[7]).assertEqual(70n);
      expect(rev[14]).assertEqual(0n);
      expect(rev.length).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0930
     * @tc.name testBigInt64ArrayToReversedOne093
     * @tc.desc Verify parent.toReversed() and subarray.toReversed() produce independent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = orig.subarray(1, 3);
      let parentRev = orig.toReversed();
      let subRev = sub.toReversed();
      expect(parentRev[0]).assertEqual(4n);
      expect(subRev[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0940
     * @tc.name testBigInt64ArrayToReversedOne094
     * @tc.desc Verify toReversed on subarray preserves byteOffset 0 in result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = orig.subarray(2, 5);
      let rev = sub.toReversed();
      expect(rev.byteOffset).assertEqual(0);
      expect(rev[0]).assertEqual(5n);
      expect(rev[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0950
     * @tc.name testBigInt64ArrayToReversedOne095
     * @tc.desc Verify modifying parent after subarray.toReversed does not affect subarray reversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = orig.subarray(1, 3);
      let rev = sub.toReversed();
      orig[1] = 99n;
      orig[2] = 88n;
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0960
     * @tc.name testBigInt64ArrayToReversedOne096
     * @tc.desc Verify chained toReversed on subarray of toReversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed();
      let sub = rev.subarray(1, 4);
      let subRev = sub.toReversed();
      expect(subRev[0]).assertEqual(2n);
      expect(subRev[1]).assertEqual(3n);
      expect(subRev[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0970
     * @tc.name testBigInt64ArrayToReversedOne097
     * @tc.desc Verify toReversed on subarray from byteOffset source has correct byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let orig = new BigInt64Array(buf, 8, 4);
      orig[0] = 10n;
      orig[1] = 20n;
      orig[2] = 30n;
      orig[3] = 40n;
      let sub = orig.subarray(1, 3);
      let rev = sub.toReversed();
      expect(rev.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0980
     * @tc.name testBigInt64ArrayToReversedOne098
     * @tc.desc Verify multiple subarrays from the same parent produce independent toReversed results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sub1 = orig.subarray(0, 3);
      let sub2 = orig.subarray(3, 6);
      let rev1 = sub1.toReversed();
      let rev2 = sub2.toReversed();
      expect(rev1[0]).assertEqual(3n);
      expect(rev2[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_0990
     * @tc.name testBigInt64ArrayToReversedOne099
     * @tc.desc Verify toReversed on subarray with single element (subarray(2,3)).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = orig.subarray(2, 3);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1000
     * @tc.name testBigInt64ArrayToReversedOne100
     * @tc.desc Verify deep write isolation: modifying all rev indices does not affect any orig elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      rev[1] = 99n;
      rev[2] = 99n;
      rev[3] = 99n;
      expect(orig[0]).assertEqual(1n);
      expect(orig[1]).assertEqual(2n);
      expect(orig[2]).assertEqual(3n);
      expect(orig[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1010
     * @tc.name testBigInt64ArrayToReversedOne101
     * @tc.desc Verify snapshot semantics: modifying orig after toReversed does not change previously created rev.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let rev = orig.toReversed();
      orig[0] = 99n;
      orig[1] = 88n;
      orig[2] = 77n;
      expect(rev[0]).assertEqual(30n);
      expect(rev[1]).assertEqual(20n);
      expect(rev[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1020
     * @tc.name testBigInt64ArrayToReversedOne102
     * @tc.desc Verify toReversed again on original after mutation produces a new snapshot with mutated values reversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev1 = orig.toReversed();
      orig[0] = 99n;
      let rev2 = orig.toReversed();
      expect(rev1[2]).assertEqual(1n);
      expect(rev2[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1030
     * @tc.name testBigInt64ArrayToReversedOne103
     * @tc.desc Verify triple buffer independence: orig, rev1, rev2 all have independent buffers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev1 = orig.toReversed();
      let rev2 = orig.toReversed();
      let allDistinct = (orig.buffer !== rev1.buffer) && (orig.buffer !== rev2.buffer) && (rev1.buffer !== rev2.buffer);
      expect(allDistinct).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1040
     * @tc.name testBigInt64ArrayToReversedOne104
     * @tc.desc Verify rev remains unchanged after repeated toReversed calls on the original source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 6n, 7n]);
      let rev = orig.toReversed();
      orig.toReversed();
      orig.toReversed();
      expect(rev[0]).assertEqual(7n);
      expect(rev[1]).assertEqual(6n);
      expect(rev[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1050
     * @tc.name testBigInt64ArrayToReversedOne105
     * @tc.desc Verify write to one rev does not affect another independently created rev from the same source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev1 = orig.toReversed();
      let rev2 = orig.toReversed();
      rev1[0] = 99n;
      rev1[1] = 88n;
      expect(rev2[0]).assertEqual(3n);
      expect(rev2[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1060
     * @tc.name testBigInt64ArrayToReversedOne106
     * @tc.desc Verify orig, rev1, and rev2 all have independent element values after cross-mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev1 = orig.toReversed();
      let rev2 = orig.toReversed();
      orig[0] = 100n;
      rev1[0] = 200n;
      rev2[0] = 300n;
      expect(orig[0]).assertEqual(100n);
      expect(rev1[0]).assertEqual(200n);
      expect(rev2[0]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1070
     * @tc.name testBigInt64ArrayToReversedOne107
     * @tc.desc Verify toReversed result buffer remains valid regardless of original buffer state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev.byteLength).assertEqual(24);
      expect(rev.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_ONE_1080
     * @tc.name testBigInt64ArrayToReversedOne108
     * @tc.desc Verify toReversed result values are accessible via DataView on the reversed buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([100n, 200n, 300n]);
      let rev = orig.toReversed();
      let dv = new DataView(rev.buffer);
      expect(dv.getBigInt64(0, true)).assertEqual(300n);
      expect(dv.getBigInt64(8, true)).assertEqual(200n);
      expect(dv.getBigInt64(16, true)).assertEqual(100n);
    });

  });
}
