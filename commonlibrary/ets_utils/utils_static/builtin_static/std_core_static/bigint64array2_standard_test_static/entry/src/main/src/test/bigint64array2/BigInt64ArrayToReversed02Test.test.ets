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

export default function BigInt64ArrayToReversed02Test(): void {
  describe('BigInt64ArrayToReversed02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0010
     * @tc.name testBigInt64ArrayToReversedTwo001
     * @tc.desc Verify toReversed on [1n,2n,3n,4n,5n,6n] reverses all six positions correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(6n);
      expect(rev[1]).assertEqual(5n);
      expect(rev[2]).assertEqual(4n);
      expect(rev[3]).assertEqual(3n);
      expect(rev[4]).assertEqual(2n);
      expect(rev[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0020
     * @tc.name testBigInt64ArrayToReversedTwo002
     * @tc.desc Verify toReversed on [MAX,MAX-1n,MIN+1n,MIN] near-boundary quad reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 9223372036854775807n - 1n, -9223372036854775808n + 1n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
      expect(rev[1]).assertEqual(-9223372036854775808n + 1n);
      expect(rev[2]).assertEqual(9223372036854775807n - 1n);
      expect(rev[3]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0030
     * @tc.name testBigInt64ArrayToReversedTwo003
     * @tc.desc Verify toReversed on three-element array preserves original element values unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      orig.toReversed();
      expect(orig[0]).assertEqual(1n);
      expect(orig[1]).assertEqual(2n);
      expect(orig[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0040
     * @tc.name testBigInt64ArrayToReversedTwo004
     * @tc.desc Verify three-element reversed array has byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      expect(rev.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0050
     * @tc.name testBigInt64ArrayToReversedTwo005
     * @tc.desc Verify toReversed on [MAX,MAX-1n,0n,MIN+1n,MIN] reverses boundary five correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 9223372036854775807n - 1n, 0n, -9223372036854775808n + 1n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
      expect(rev[1]).assertEqual(-9223372036854775808n + 1n);
      expect(rev[2]).assertEqual(0n);
      expect(rev[3]).assertEqual(9223372036854775807n - 1n);
      expect(rev[4]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0060
     * @tc.name testBigInt64ArrayToReversedTwo006
     * @tc.desc Verify toReversed on five-element array reverses the element order correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(50n);
      expect(rev[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0070
     * @tc.name testBigInt64ArrayToReversedTwo007
     * @tc.desc Verify toReversed on five-element array has byteLength 40.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.of(1n, 2n, 3n, 4n, 5n);
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0080
     * @tc.name testBigInt64ArrayToReversedTwo008
     * @tc.desc Verify original five-element array unchanged after toReversed (all 5 positions).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      orig.toReversed();
      expect(orig[0]).assertEqual(10n);
      expect(orig[1]).assertEqual(20n);
      expect(orig[2]).assertEqual(30n);
      expect(orig[3]).assertEqual(40n);
      expect(orig[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0090
     * @tc.name testBigInt64ArrayToReversedTwo009
     * @tc.desc Verify write isolation for five-element reversed array: modifying rev[0] and rev[4] does not affect orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed();
      rev[0] = 99n;
      rev[4] = 88n;
      expect(orig[0]).assertEqual(1n);
      expect(orig[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0100
     * @tc.name testBigInt64ArrayToReversedTwo010
     * @tc.desc Verify toReversed on negative five-element array [-5n,-4n,-3n,-2n,-1n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-5n, -4n, -3n, -2n, -1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-1n);
      expect(rev[1]).assertEqual(-2n);
      expect(rev[2]).assertEqual(-3n);
      expect(rev[3]).assertEqual(-4n);
      expect(rev[4]).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0110
     * @tc.name testBigInt64ArrayToReversedTwo011
     * @tc.desc Verify toReversed on array with alternating positive/negative values reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, -20n, 30n, -40n, 50n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(50n);
      expect(rev[1]).assertEqual(-40n);
      expect(rev[2]).assertEqual(30n);
      expect(rev[3]).assertEqual(-20n);
      expect(rev[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0120
     * @tc.name testBigInt64ArrayToReversedTwo012
     * @tc.desc Verify toReversed on 10-element ascending array has correct middle element value at index 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0130
     * @tc.name testBigInt64ArrayToReversedTwo013
     * @tc.desc Verify toReversed on 10-element array preserves correct middle element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i * 10);
      }
      let rev = orig.toReversed();
      expect(rev[5]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0140
     * @tc.name testBigInt64ArrayToReversedTwo014
     * @tc.desc Verify toReversed on 10-element array has byteLength 80.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0150
     * @tc.name testBigInt64ArrayToReversedTwo015
     * @tc.desc Verify original 10-element array is unchanged after toReversed (first and last).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      orig.toReversed();
      expect(orig[0]).assertEqual(0n);
      expect(orig[9]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0160
     * @tc.name testBigInt64ArrayToReversedTwo016
     * @tc.desc Verify write isolation for 10-element reversed array: modifying rev does not affect orig.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      rev[0] = 99n;
      expect(orig[0]).assertEqual(0n);
      expect(orig[9]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0170
     * @tc.name testBigInt64ArrayToReversedTwo017
     * @tc.desc Verify toReversed twice on 10-element array restores all elements via programmatic check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let restored = orig.toReversed().toReversed();
      let allMatch = true;
      for (let i = 0; i < 10; i++) {
        if (restored[i] !== BigInt(i)) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0180
     * @tc.name testBigInt64ArrayToReversedTwo018
     * @tc.desc Verify toReversed on 50-element ascending array has correct length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(49n);
      expect(rev[49]).assertEqual(0n);
      expect(rev.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0190
     * @tc.name testBigInt64ArrayToReversedTwo019
     * @tc.desc Verify toReversed on subarray preserves subarray boundary and reverses elements within range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = orig.subarray(1, 4);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(40n);
      expect(rev[1]).assertEqual(30n);
      expect(rev[2]).assertEqual(20n);
      expect(orig[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0200
     * @tc.name testBigInt64ArrayToReversedTwo020
     * @tc.desc Verify toReversed on 50-element array has byteLength 400.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0210
     * @tc.name testBigInt64ArrayToReversedTwo021
     * @tc.desc Verify toReversed on 100-element ascending array has correct length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(99n);
      expect(rev[99]).assertEqual(0n);
      expect(rev.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0220
     * @tc.name testBigInt64ArrayToReversedTwo022
     * @tc.desc Verify toReversed on array with step pattern values reverses to correct descending step order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(20);
      for (let i = 0; i < 20; i++) {
        orig[i] = BigInt(i * 5);
      }
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(95n);
      expect(rev[10]).assertEqual(45n);
      expect(rev[19]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0230
     * @tc.name testBigInt64ArrayToReversedTwo023
     * @tc.desc Verify toReversed on 100-element array has byteLength 800.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev.byteLength).assertEqual(800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0240
     * @tc.name testBigInt64ArrayToReversedTwo024
     * @tc.desc Verify toReversed on 100-element array preserves middle element value at index 50.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        orig[i] = BigInt(i);
      }
      let rev = orig.toReversed();
      expect(rev[50]).assertEqual(49n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0250
     * @tc.name testBigInt64ArrayToReversedTwo025
     * @tc.desc Verify original 100-element array unchanged after toReversed (first, middle, last).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        orig[i] = BigInt(i);
      }
      orig.toReversed();
      expect(orig[0]).assertEqual(0n);
      expect(orig[50]).assertEqual(50n);
      expect(orig[99]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0260
     * @tc.name testBigInt64ArrayToReversedTwo026
     * @tc.desc Verify double toReversed on 20-element array restores original order (programmatic check).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(20);
      for (let i = 0; i < 20; i++) {
        orig[i] = BigInt(i);
      }
      let restored = orig.toReversed().toReversed();
      let allMatch = true;
      for (let i = 0; i < 20; i++) {
        if (restored[i] !== BigInt(i)) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0270
     * @tc.name testBigInt64ArrayToReversedTwo027
     * @tc.desc Verify double toReversed on 50-element array restores original order (check key positions).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        orig[i] = BigInt(i);
      }
      let restored = orig.toReversed().toReversed();
      expect(restored[0]).assertEqual(0n);
      expect(restored[25]).assertEqual(25n);
      expect(restored[49]).assertEqual(49n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0280
     * @tc.name testBigInt64ArrayToReversedTwo028
     * @tc.desc Verify double toReversed on [MAX,0n,MIN] three-element edge array restores order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let restored = orig.toReversed().toReversed();
      expect(restored[0]).assertEqual(9223372036854775807n);
      expect(restored[1]).assertEqual(0n);
      expect(restored[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0290
     * @tc.name testBigInt64ArrayToReversedTwo029
     * @tc.desc Verify double toReversed on 5-element array with mixed boundary values restores order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      let restored = orig.toReversed().toReversed();
      expect(restored[0]).assertEqual(9223372036854775807n);
      expect(restored[1]).assertEqual(-9223372036854775808n);
      expect(restored[2]).assertEqual(0n);
      expect(restored[3]).assertEqual(1n);
      expect(restored[4]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0300
     * @tc.name testBigInt64ArrayToReversedTwo030
     * @tc.desc Verify double toReversed preserves length for 10-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let restored = orig.toReversed().toReversed();
      expect(restored[0]).assertEqual(0n);
      expect(restored[9]).assertEqual(9n);
      expect(restored.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0310
     * @tc.name testBigInt64ArrayToReversedTwo031
     * @tc.desc Verify double toReversed preserves byteLength for 10-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        orig[i] = BigInt(i);
      }
      let restored = orig.toReversed().toReversed();
      expect(restored.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0320
     * @tc.name testBigInt64ArrayToReversedTwo032
     * @tc.desc Verify double toReversed intermediate (single-reversed) array has correct reversed values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let mid = orig.toReversed();
      let restored = mid.toReversed();
      expect(mid[0]).assertEqual(5n);
      expect(mid[4]).assertEqual(1n);
      expect(restored[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0330
     * @tc.name testBigInt64ArrayToReversedTwo033
     * @tc.desc Verify double toReversed on 8-element array with all negative values restores order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-8n, -7n, -6n, -5n, -4n, -3n, -2n, -1n]);
      let restored = orig.toReversed().toReversed();
      expect(restored[0]).assertEqual(-8n);
      expect(restored[3]).assertEqual(-5n);
      expect(restored[7]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0340
     * @tc.name testBigInt64ArrayToReversedTwo034
     * @tc.desc Verify triple toReversed on [1n,2n,3n] is equivalent to single toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let single = orig.toReversed();
      let triple = orig.toReversed().toReversed().toReversed();
      expect(triple[0]).assertEqual(single[0]);
      expect(triple[1]).assertEqual(single[1]);
      expect(triple[2]).assertEqual(single[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0350
     * @tc.name testBigInt64ArrayToReversedTwo035
     * @tc.desc Verify triple toReversed on empty array returns empty array with length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([]);
      let triple = orig.toReversed().toReversed().toReversed();
      try {
        let v = triple[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(triple.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0360
     * @tc.name testBigInt64ArrayToReversedTwo036
     * @tc.desc Verify triple toReversed on single-element [42n] preserves the value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([42n]);
      let triple = orig.toReversed().toReversed().toReversed();
      expect(triple[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0370
     * @tc.name testBigInt64ArrayToReversedTwo037
     * @tc.desc Verify triple toReversed on boundary pair [MAX,MIN] is equivalent to single toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let single = orig.toReversed();
      let triple = orig.toReversed().toReversed().toReversed();
      expect(triple[0]).assertEqual(-9223372036854775808n);
      expect(triple[1]).assertEqual(9223372036854775807n);
      expect(triple[0]).assertEqual(single[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0380
     * @tc.name testBigInt64ArrayToReversedTwo038
     * @tc.desc Verify triple toReversed preserves length and byteLength for 5-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let triple = orig.toReversed().toReversed().toReversed();
      expect(triple[0]).assertEqual(5n);
      expect(triple[4]).assertEqual(1n);
      expect(triple.length).assertEqual(5);
      expect(triple.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0390
     * @tc.name testBigInt64ArrayToReversedTwo039
     * @tc.desc Verify triple toReversed on 7-element array preserves byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n]);
      let triple = orig.toReversed().toReversed().toReversed();
      expect(triple.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0400
     * @tc.name testBigInt64ArrayToReversedTwo040
     * @tc.desc Verify toReversed on a with()-modified array reflects the with() change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let modified = orig.with(0, 99n);
      let rev = modified.toReversed();
      expect(rev[2]).assertEqual(99n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0410
     * @tc.name testBigInt64ArrayToReversedTwo041
     * @tc.desc Verify with() after toReversed works correctly on the reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      let modified = rev.with(0, 99n);
      expect(modified[0]).assertEqual(99n);
      expect(modified[1]).assertEqual(2n);
      expect(modified[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0420
     * @tc.name testBigInt64ArrayToReversedTwo042
     * @tc.desc Verify original array unaffected by chaining toReversed and with.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      rev.with(1, 99n);
      expect(orig[0]).assertEqual(1n);
      expect(orig[1]).assertEqual(2n);
      expect(orig[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0430
     * @tc.name testBigInt64ArrayToReversedTwo043
     * @tc.desc Verify with() replacing an element before toReversed produces correct reversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n]);
      let modified = orig.with(1, 99n);
      let rev = modified.toReversed();
      expect(rev[0]).assertEqual(40n);
      expect(rev[2]).assertEqual(99n);
      expect(rev[3]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0440
     * @tc.name testBigInt64ArrayToReversedTwo044
     * @tc.desc Verify toReversed().with() chain on 5-element array preserves independence from source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let result = orig.toReversed().with(2, 99n);
      expect(result[0]).assertEqual(5n);
      expect(result[2]).assertEqual(99n);
      expect(orig[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0450
     * @tc.name testBigInt64ArrayToReversedTwo045
     * @tc.desc Verify with() on boundary index 0 of reversed array modifies first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let rev = orig.toReversed();
      let result = rev.with(0, 999n);
      expect(result[0]).assertEqual(999n);
      expect(result[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0460
     * @tc.name testBigInt64ArrayToReversedTwo046
     * @tc.desc Verify with() on last index of reversed array modifies last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let rev = orig.toReversed();
      let result = rev.with(2, 999n);
      expect(result[2]).assertEqual(999n);
      expect(result[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0470
     * @tc.name testBigInt64ArrayToReversedTwo047
     * @tc.desc Verify slice() after toReversed produces correct sub-array from reversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed();
      let sli = rev.slice(1, 4);
      expect(sli[0]).assertEqual(4n);
      expect(sli[1]).assertEqual(3n);
      expect(sli[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0480
     * @tc.name testBigInt64ArrayToReversedTwo048
     * @tc.desc Verify slice().toReversed() is independent of the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sli = orig.slice(0, 2);
      let rev = sli.toReversed();
      orig[0] = 99n;
      expect(rev[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0490
     * @tc.name testBigInt64ArrayToReversedTwo049
     * @tc.desc Verify toReversed().slice() with edge values preserves correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n]);
      let rev = orig.toReversed();
      let sli = rev.slice(-2);
      expect(sli[0]).assertEqual(20n);
      expect(sli[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0500
     * @tc.name testBigInt64ArrayToReversedTwo050
     * @tc.desc Verify toReversed on full slice() is equivalent to directly calling toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let revDirect = orig.toReversed();
      let revViaSlice = orig.slice().toReversed();
      expect(revDirect[0]).assertEqual(revViaSlice[0]);
      expect(revDirect[1]).assertEqual(revViaSlice[1]);
      expect(revDirect[2]).assertEqual(revViaSlice[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0510
     * @tc.name testBigInt64ArrayToReversedTwo051
     * @tc.desc Verify slice(1,3).toReversed() on 4-element array produces correct 2-element reversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n]);
      let result = orig.slice(1, 3).toReversed();
      expect(result[0]).assertEqual(30n);
      expect(result[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0520
     * @tc.name testBigInt64ArrayToReversedTwo052
     * @tc.desc Verify subarray() after toReversed on 6-element array produces correct sub-range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let rev = orig.toReversed();
      let sub = rev.subarray(2, 5);
      expect(sub[0]).assertEqual(4n);
      expect(sub[1]).assertEqual(3n);
      expect(sub[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0530
     * @tc.name testBigInt64ArrayToReversedTwo053
     * @tc.desc Verify toReversed().subarray() from middle of reversed array has correct content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let rev = orig.toReversed();
      let sub = rev.subarray(1, 4);
      expect(sub[0]).assertEqual(40n);
      expect(sub[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0540
     * @tc.name testBigInt64ArrayToReversedTwo054
     * @tc.desc Verify subarray on byteOffset source → toReversed preserves byteOffset 0 in result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let orig = new BigInt64Array(buf, 8, 3);
      orig[0] = 10n;
      orig[1] = 20n;
      orig[2] = 30n;
      let sub = orig.subarray(0);
      let rev = sub.toReversed();
      expect(rev.byteOffset).assertEqual(0);
      expect(rev[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0550
     * @tc.name testBigInt64ArrayToReversedTwo055
     * @tc.desc Verify toReversed after toSorted on unsorted array produces reverse-sorted order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([3n, 1n, 2n]);
      let sorted = orig.toSorted();
      let rev = sorted.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0560
     * @tc.name testBigInt64ArrayToReversedTwo056
     * @tc.desc Verify toSorted after toReversed on descending array produces ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      let rev = orig.toReversed();
      let sorted = rev.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0570
     * @tc.name testBigInt64ArrayToReversedTwo057
     * @tc.desc Verify toReversed and toSorted are independent (orig unchanged after both).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([3n, 1n, 2n]);
      orig.toReversed();
      orig.toSorted();
      expect(orig[0]).assertEqual(3n);
      expect(orig[1]).assertEqual(1n);
      expect(orig[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0580
     * @tc.name testBigInt64ArrayToReversedTwo058
     * @tc.desc Verify sort() on reversed array modifies it in place correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 3n, 1n, 4n, 2n]);
      let rev = orig.toReversed();
      rev.sort();
      expect(rev[0]).assertEqual(1n);
      expect(rev[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0590
     * @tc.name testBigInt64ArrayToReversedTwo059
     * @tc.desc Verify toReversed on manually sorted array produces reverse order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(5n);
      expect(rev[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0600
     * @tc.name testBigInt64ArrayToReversedTwo060
     * @tc.desc Verify toSorted().toReversed() on array with negative values produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([-1n, -3n, -2n, -5n, -4n]);
      let result = orig.toSorted().toReversed();
      expect(result[0]).assertEqual(-1n);
      expect(result[1]).assertEqual(-2n);
      expect(result[4]).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0610
     * @tc.name testBigInt64ArrayToReversedTwo061
     * @tc.desc Verify toReversed on a fill()-modified array reflects fill changes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(5);
      orig.fill(7n);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(7n);
      expect(rev[4]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0620
     * @tc.name testBigInt64ArrayToReversedTwo062
     * @tc.desc Verify fill() on a reversed array works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = orig.toReversed();
      rev.fill(99n, 1, 3);
      expect(rev[0]).assertEqual(4n);
      expect(rev[1]).assertEqual(99n);
      expect(rev[2]).assertEqual(99n);
      expect(rev[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0630
     * @tc.name testBigInt64ArrayToReversedTwo063
     * @tc.desc Verify fill() on reversed array does not affect original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      rev.fill(99n);
      expect(orig[0]).assertEqual(1n);
      expect(orig[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0640
     * @tc.name testBigInt64ArrayToReversedTwo064
     * @tc.desc Verify copyWithin on reversed array copies elements correctly within the reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = orig.toReversed();
      rev.copyWithin(0, 2);
      expect(rev[0]).assertEqual(2n);
      expect(rev[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0650
     * @tc.name testBigInt64ArrayToReversedTwo065
     * @tc.desc Verify copyWithin on reversed array does not affect original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n]);
      let rev = orig.toReversed();
      rev.copyWithin(1, 0, 2);
      expect(orig[0]).assertEqual(10n);
      expect(orig[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0660
     * @tc.name testBigInt64ArrayToReversedTwo066
     * @tc.desc Verify toReversed on a copyWithin-modified array reflects copyWithin changes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      orig.copyWithin(0, 2);
      let rev = orig.toReversed();
      expect(rev[3]).assertEqual(3n);
      expect(rev[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0670
     * @tc.name testBigInt64ArrayToReversedTwo067
     * @tc.desc Verify fill(0n) on reversed boundary-value array works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 1n, -1n]);
      let rev = orig.toReversed();
      rev.fill(0n);
      expect(rev[0]).assertEqual(0n);
      expect(rev[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0680
     * @tc.name testBigInt64ArrayToReversedTwo068
     * @tc.desc Verify copyWithin(0,1) on reversed 5-element array shifts elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed();
      rev.copyWithin(0, 1);
      expect(rev[0]).assertEqual(4n);
      expect(rev[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0690
     * @tc.name testBigInt64ArrayToReversedTwo069
     * @tc.desc Verify set() on a reversed array modifies it correctly while preserving unset elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = orig.toReversed();
      rev.set([99n, 88n], 1);
      expect(rev[0]).assertEqual(4n);
      expect(rev[1]).assertEqual(99n);
      expect(rev[2]).assertEqual(88n);
      expect(rev[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0700
     * @tc.name testBigInt64ArrayToReversedTwo070
     * @tc.desc Verify set() on reversed array does not affect original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let rev = orig.toReversed();
      rev.set([99n]);
      expect(orig[0]).assertEqual(10n);
      expect(orig[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0710
     * @tc.name testBigInt64ArrayToReversedTwo071
     * @tc.desc Verify toReversed after set() reflects the set changes in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      orig.set([99n, 88n], 1);
      let rev = orig.toReversed();
      expect(rev[2]).assertEqual(99n);
      expect(rev[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0720
     * @tc.name testBigInt64ArrayToReversedTwo072
     * @tc.desc Verify set() with BigInt64Array source on reversed array works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let rev = orig.toReversed();
      let src = new BigInt64Array([100n, 200n]);
      rev.set(src, 2);
      expect(rev[2]).assertEqual(100n);
      expect(rev[3]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0730
     * @tc.name testBigInt64ArrayToReversedTwo073
     * @tc.desc Verify set() at offset 0 of reversed array replaces first elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let rev = orig.toReversed();
      rev.set([999n]);
      expect(rev[0]).assertEqual(999n);
      expect(rev[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0740
     * @tc.name testBigInt64ArrayToReversedTwo074
     * @tc.desc Verify set() at end of reversed array appends/replaces last elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n]);
      let rev = orig.toReversed();
      rev.set([999n], 3);
      expect(rev[3]).assertEqual(999n);
      expect(rev[0]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0750
     * @tc.name testBigInt64ArrayToReversedTwo075
     * @tc.desc Verify toReversed on BigInt64Array.from([1n,2n,3n]) reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.from([1n, 2n, 3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0760
     * @tc.name testBigInt64ArrayToReversedTwo076
     * @tc.desc Verify toReversed on new BigInt64Array(4) zero-filled array has all zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(4);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(0n);
      expect(rev[1]).assertEqual(0n);
      expect(rev[2]).assertEqual(0n);
      expect(rev[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0770
     * @tc.name testBigInt64ArrayToReversedTwo077
     * @tc.desc Verify toReversed on BigInt64Array.of() with 5 elements has correct length and first/last values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.of(10n, 20n, 30n, 40n, 50n);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(50n);
      expect(rev[4]).assertEqual(10n);
      expect(rev.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0780
     * @tc.name testBigInt64ArrayToReversedTwo078
     * @tc.desc Verify toReversed on BigInt64Array.from() with boundary values preserves them.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.from([9223372036854775807n, 0n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[2]).assertEqual(9223372036854775807n);
      expect(rev[1]).assertEqual(0n);
      expect(rev[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0790
     * @tc.name testBigInt64ArrayToReversedTwo079
     * @tc.desc Verify toReversed on BigInt64Array.from() with mapping function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = BigInt64Array.from([1n, 2n, 3n], (x: bigint) => x * 2n);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(6n);
      expect(rev[1]).assertEqual(4n);
      expect(rev[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0800
     * @tc.name testBigInt64ArrayToReversedTwo080
     * @tc.desc Verify DataView setInt64 on original buffer does not affect reversed result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let rev = orig.toReversed();
      let dv = new DataView(orig.buffer);
      dv.setBigInt64(0, 99n, true);
      expect(rev[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0810
     * @tc.name testBigInt64ArrayToReversedTwo081
     * @tc.desc Verify Uint8Array view of original buffer shows original byte layout after toReversed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      orig.toReversed();
      let u8 = new Uint8Array(orig.buffer);
      expect(u8[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0820
     * @tc.name testBigInt64ArrayToReversedTwo082
     * @tc.desc Verify Int16Array modification of original buffer does not affect reversed values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n]);
      let rev = orig.toReversed();
      let i16 = new Int16Array(orig.buffer);
      i16[0] = 999;
      expect(rev[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0830
     * @tc.name testBigInt64ArrayToReversedTwo083
     * @tc.desc Verify toReversed on 6-element array mixing MAX and MIN at ends reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 1n, 2n, 3n, 4n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
      expect(rev[1]).assertEqual(4n);
      expect(rev[4]).assertEqual(1n);
      expect(rev[5]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0840
     * @tc.name testBigInt64ArrayToReversedTwo084
     * @tc.desc Verify toReversed on 8-element array with alternating MAX/MIN pattern reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(-9223372036854775808n);
      expect(rev[1]).assertEqual(9223372036854775807n);
      expect(rev[6]).assertEqual(-9223372036854775808n);
      expect(rev[7]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0850
     * @tc.name testBigInt64ArrayToReversedTwo085
     * @tc.desc Verify toReversed on 4-element array with sequential hex-like values [0n,16n,32n,48n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n, 16n, 32n, 48n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(48n);
      expect(rev[1]).assertEqual(32n);
      expect(rev[2]).assertEqual(16n);
      expect(rev[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0860
     * @tc.name testBigInt64ArrayToReversedTwo086
     * @tc.desc Verify toReversed on 6-element array with squared values [1n,4n,9n,16n,25n,36n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 4n, 9n, 16n, 25n, 36n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(36n);
      expect(rev[1]).assertEqual(25n);
      expect(rev[4]).assertEqual(4n);
      expect(rev[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0870
     * @tc.name testBigInt64ArrayToReversedTwo087
     * @tc.desc Verify toReversed on 8-element array with powers of 2 reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 4n, 8n, 16n, 32n, 64n, 128n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(128n);
      expect(rev[3]).assertEqual(16n);
      expect(rev[7]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0880
     * @tc.name testBigInt64ArrayToReversedTwo088
     * @tc.desc Verify toReversed on array with paired equal values [1n,1n,2n,2n,3n,3n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 1n, 2n, 2n, 3n, 3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(3n);
      expect(rev[2]).assertEqual(2n);
      expect(rev[3]).assertEqual(2n);
      expect(rev[4]).assertEqual(1n);
      expect(rev[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0890
     * @tc.name testBigInt64ArrayToReversedTwo089
     * @tc.desc Verify toReversed on [0n,1n,0n,1n,0n,1n] alternating zero/one pattern reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n, 1n, 0n, 1n, 0n, 1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(0n);
      expect(rev[4]).assertEqual(1n);
      expect(rev[5]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0900
     * @tc.name testBigInt64ArrayToReversedTwo090
     * @tc.desc Verify toReversed on palindromic array [1n,2n,3n,2n,1n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 2n, 1n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(1n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(3n);
      expect(rev[3]).assertEqual(2n);
      expect(rev[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0910
     * @tc.name testBigInt64ArrayToReversedTwo091
     * @tc.desc Verify toReversed on array with repeating triple pattern [1n,2n,3n,1n,2n,3n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 1n, 2n, 3n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(3n);
      expect(rev[1]).assertEqual(2n);
      expect(rev[2]).assertEqual(1n);
      expect(rev[3]).assertEqual(3n);
      expect(rev[4]).assertEqual(2n);
      expect(rev[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0920
     * @tc.name testBigInt64ArrayToReversedTwo092
     * @tc.desc Verify toReversed on array with step pattern [0n,10n,20n,30n,40n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([0n, 10n, 20n, 30n, 40n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(40n);
      expect(rev[2]).assertEqual(20n);
      expect(rev[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0930
     * @tc.name testBigInt64ArrayToReversedTwo093
     * @tc.desc Verify toReversed on array with single differing middle element [5n,5n,99n,5n,5n] reverses correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([5n, 5n, 99n, 5n, 5n]);
      let rev = orig.toReversed();
      expect(rev[0]).assertEqual(5n);
      expect(rev[1]).assertEqual(5n);
      expect(rev[2]).assertEqual(99n);
      expect(rev[3]).assertEqual(5n);
      expect(rev[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0940
     * @tc.name testBigInt64ArrayToReversedTwo094
     * @tc.desc Verify toReversed().slice().toReversed() chain restores slice order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let result = orig.toReversed().slice(1, 4).toReversed();
      expect(result[0]).assertEqual(2n);
      expect(result[1]).assertEqual(3n);
      expect(result[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0950
     * @tc.name testBigInt64ArrayToReversedTwo095
     * @tc.desc Verify toReversed().with().toReversed() chain preserves value correctness.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n]);
      let result = orig.toReversed().with(1, 99n).toReversed();
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(99n);
      expect(result[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0960
     * @tc.name testBigInt64ArrayToReversedTwo096
     * @tc.desc Verify toReversed().subarray().toReversed() chain preserves values from original sub-range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let result = orig.toReversed().subarray(1, 4).toReversed();
      expect(result[0]).assertEqual(20n);
      expect(result[1]).assertEqual(30n);
      expect(result[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0970
     * @tc.name testBigInt64ArrayToReversedTwo097
     * @tc.desc Verify subarray().toReversed().with() chain on 6-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let result = orig.subarray(1, 5).toReversed().with(0, 99n);
      expect(result[0]).assertEqual(99n);
      expect(result[1]).assertEqual(4n);
      expect(result[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0980
     * @tc.name testBigInt64ArrayToReversedTwo098
     * @tc.desc Verify toReversed().fill().toReversed() chain works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([1n, 2n, 3n, 4n]);
      let result = orig.toReversed().fill(0n, 1, 3).toReversed();
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(0n);
      expect(result[2]).assertEqual(0n);
      expect(result[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_0990
     * @tc.name testBigInt64ArrayToReversedTwo099
     * @tc.desc Verify deep chain toReversed().set().toReversed() with boundary values preserves independence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let step1 = orig.toReversed();
      step1.set([99n], 1);
      let result = step1.toReversed();
      expect(result[0]).assertEqual(9223372036854775807n);
      expect(result[1]).assertEqual(99n);
      expect(result[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_1000
     * @tc.name testBigInt64ArrayToReversedTwo100
     * @tc.desc Verify for-of iteration over toReversed result yields elements in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let result = arr.toReversed();
      let vals: bigint[] = [];
      for (let v of result) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(40n);
      expect(vals[1]).assertEqual(30n);
      expect(vals[2]).assertEqual(20n);
      expect(vals[3]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_REVERSED_TWO_1010
     * @tc.name testBigInt64ArrayToReversedTwo101
     * @tc.desc Verify values() iterator on toReversed result yields elements in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToReversedTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.toReversed();
      let iter = result.values();
      expect(iter.next().value).assertEqual(5n);
      expect(iter.next().value).assertEqual(4n);
      expect(iter.next().value).assertEqual(3n);
      expect(iter.next().value).assertEqual(2n);
      expect(iter.next().value).assertEqual(1n);
    });

  });
}
