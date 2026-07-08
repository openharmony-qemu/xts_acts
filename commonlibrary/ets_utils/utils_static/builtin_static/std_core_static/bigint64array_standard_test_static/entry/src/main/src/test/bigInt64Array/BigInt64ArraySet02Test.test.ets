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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

function didThrow(action: () => void): boolean {
  let caught = false;
  try {
    action();
  } catch (e) {
    caught = e !== null && e !== undefined;
  }
  return caught;
}

export default function BigInt64ArraySet0201Test(): void {
  describe('BigInt64ArraySet0201Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0010
     * @tc.name testBigInt64ArraySetTwo001
     * @tc.desc Verify set writes val=0n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 0n);
      let expected = 0n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0020
     * @tc.name testBigInt64ArraySetTwo002
     * @tc.desc Verify set writes val=77n at pos=length-1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      arr.set(arr.length - 1, 77n);
      let expected = 77n;
      expect(arr[arr.length - 1]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0030
     * @tc.name testBigInt64ArraySetTwo003
     * @tc.desc Verify set writes val=BigInt(10) at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, BigInt(10));
      let expected = BigInt(10);
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0040
     * @tc.name testBigInt64ArraySetTwo004
     * @tc.desc Verify set writes val=BigInt(0) at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, BigInt(0));
      let expected = BigInt(0);
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0050
     * @tc.name testBigInt64ArraySetTwo005
     * @tc.desc Verify set writes val=BigInt(-10) at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, BigInt(-10));
      let expected = BigInt(-10);
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0060
     * @tc.name testBigInt64ArraySetTwo006
     * @tc.desc Verify set writes val=4294967295n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 4294967295n);
      let expected = 4294967295n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0070
     * @tc.name testBigInt64ArraySetTwo007
     * @tc.desc Verify set writes val=4294967296n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 4294967296n);
      let expected = 4294967296n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0080
     * @tc.name testBigInt64ArraySetTwo008
     * @tc.desc Verify set writes val=-4294967296n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, -4294967296n);
      let expected = -4294967296n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0090
     * @tc.name testBigInt64ArraySetTwo009
     * @tc.desc Verify set writes val=-4294967297n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, -4294967297n);
      let expected = -4294967297n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0100
     * @tc.name testBigInt64ArraySetTwo010
     * @tc.desc Verify set writes val=(2n * 3n) at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, (2n * 3n));
      let expected = (2n * 3n);
      expect(arr[2]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0110
     * @tc.name testBigInt64ArraySetTwo011
     * @tc.desc Verify set writes val=(10n ** 2n) at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, (10n ** 2n));
      let expected = (10n ** 2n);
      expect(arr[1]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0120
     * @tc.name testBigInt64ArraySetTwo012
     * @tc.desc Verify set stores val=9223372036854775807n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0130
     * @tc.name testBigInt64ArraySetTwo013
     * @tc.desc Verify set stores val=9223372036854775807n at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, 9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0140
     * @tc.name testBigInt64ArraySetTwo014
     * @tc.desc Verify set stores val=-9223372036854775808n at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, -9223372036854775808n);
      expect(arr[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0150
     * @tc.name testBigInt64ArraySetTwo015
     * @tc.desc Verify set stores val=-9223372036854775808n at pos=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(3, -9223372036854775808n);
      expect(arr[3]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0160
     * @tc.name testBigInt64ArraySetTwo016
     * @tc.desc Verify set truncates val=9223372036854775808n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 9223372036854775808n);
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0170
     * @tc.name testBigInt64ArraySetTwo017
     * @tc.desc Verify set truncates val=9223372036854775809n at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, 9223372036854775809n);
      expect(arr[1]).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0180
     * @tc.name testBigInt64ArraySetTwo018
     * @tc.desc Verify set truncates val=-9223372036854775809n at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, -9223372036854775809n);
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0190
     * @tc.name testBigInt64ArraySetTwo019
     * @tc.desc Verify set truncates val=-9223372036854775810n at pos=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(3, -9223372036854775810n);
      expect(arr[3]).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0200
     * @tc.name testBigInt64ArraySetTwo020
     * @tc.desc Verify set truncates val=18446744073709551615n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 18446744073709551615n);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0210
     * @tc.name testBigInt64ArraySetTwo021
     * @tc.desc Verify set truncates val=18446744073709551616n at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, 18446744073709551616n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0220
     * @tc.name testBigInt64ArraySetTwo022
     * @tc.desc Verify set truncates val=-18446744073709551615n at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, -18446744073709551615n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0230
     * @tc.name testBigInt64ArraySetTwo023
     * @tc.desc Verify set truncates val=-18446744073709551616n at pos=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(3, -18446744073709551616n);
      expect(arr[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0240
     * @tc.name testBigInt64ArraySetTwo024
     * @tc.desc Verify set truncates val=27670116110564327423n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 27670116110564327423n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0250
     * @tc.name testBigInt64ArraySetTwo025
     * @tc.desc Verify set truncates val=-27670116110564327424n at pos=4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(4, -27670116110564327424n);
      expect(arr[4]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0260
     * @tc.name testBigInt64ArraySetTwo026
     * @tc.desc Verify set handles out-of-range pos=5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(5, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0270
     * @tc.name testBigInt64ArraySetTwo027
     * @tc.desc Verify set handles out-of-range pos=6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(6, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0280
     * @tc.name testBigInt64ArraySetTwo028
     * @tc.desc Verify set handles out-of-range pos=100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(100, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0290
     * @tc.name testBigInt64ArraySetTwo029
     * @tc.desc Verify set handles out-of-range pos=-1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-1, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0300
     * @tc.name testBigInt64ArraySetTwo030
     * @tc.desc Verify set handles out-of-range pos=-2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-2, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0310
     * @tc.name testBigInt64ArraySetTwo031
     * @tc.desc Verify set handles out-of-range pos=-5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-5, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0320
     * @tc.name testBigInt64ArraySetTwo032
     * @tc.desc Verify set handles out-of-range pos=2147483647.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(2147483647, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0330
     * @tc.name testBigInt64ArraySetTwo033
     * @tc.desc Verify set handles out-of-range pos=-2147483648.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-2147483648, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0340
     * @tc.name testBigInt64ArraySetTwo034
     * @tc.desc Verify set(arr) writes src=[] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0350
     * @tc.name testBigInt64ArraySetTwo035
     * @tc.desc Verify set(arr) writes src=[0n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [0n];
      target.set(src);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0360
     * @tc.name testBigInt64ArraySetTwo036
     * @tc.desc Verify set(arr) writes src=[1n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n];
      target.set(src);
      expect(target[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0370
     * @tc.name testBigInt64ArraySetTwo037
     * @tc.desc Verify set(arr) writes src=[-1n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-1n];
      target.set(src);
      expect(target[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0380
     * @tc.name testBigInt64ArraySetTwo038
     * @tc.desc Verify set(arr) writes src=[10n, 20n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [10n, 20n];
      target.set(src);
      expect(target[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0390
     * @tc.name testBigInt64ArraySetTwo039
     * @tc.desc Verify set(arr) writes src=[1n, 2n, 3n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      target.set(src);
      expect(target[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0400
     * @tc.name testBigInt64ArraySetTwo040
     * @tc.desc Verify set(arr) writes src=[1n, 2n, 3n, 4n, 5n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n, 2n, 3n, 4n, 5n];
      target.set(src);
      expect(target[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0410
     * @tc.name testBigInt64ArraySetTwo041
     * @tc.desc Verify set(arr) writes five zero values into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [0n, 0n, 0n, 0n, 0n];
      target.set(src);
      expect(target[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0420
     * @tc.name testBigInt64ArraySetTwo042
     * @tc.desc Verify set(arr) writes extreme values into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [
      9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n
      ];
      target.set(src);
      expect(target[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0430
     * @tc.name testBigInt64ArraySetTwo043
     * @tc.desc Verify set(arr) truncates src=[9223372036854775808n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [9223372036854775808n];
      target.set(src);
      expect(target[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0440
     * @tc.name testBigInt64ArraySetTwo044
     * @tc.desc Verify set(arr) truncates src=[-9223372036854775809n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-9223372036854775809n];
      target.set(src);
      expect(target[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0450
     * @tc.name testBigInt64ArraySetTwo045
     * @tc.desc Verify set(arr) writes computed source value 1n + 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n + 2n];
      target.set(src);
      expect(target[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0460
     * @tc.name testBigInt64ArraySetTwo046
     * @tc.desc Verify set(arr) writes computed source value 2n * 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [2n * 3n];
      target.set(src);
      expect(target[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0470
     * @tc.name testBigInt64ArraySetTwo047
     * @tc.desc Verify set(arr) writes computed source value 10n ** 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [10n ** 2n];
      target.set(src);
      expect(target[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0480
     * @tc.name testBigInt64ArraySetTwo048
     * @tc.desc Verify set(arr) writes empty source into target length 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0490
     * @tc.name testBigInt64ArraySetTwo049
     * @tc.desc Verify set(arr) writes single source into target length 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src: FixedArray<BigInt> = [1n];
      target.set(src);
      expect(target[0]).assertEqual(1n);
      expect(target[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0500
     * @tc.name testBigInt64ArraySetTwo050
     * @tc.desc Verify set(arr) truncates src=[18446744073709551615n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [18446744073709551615n];
      target.set(src);
      expect(target[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0510
     * @tc.name testBigInt64ArraySetTwo051
     * @tc.desc Verify set(arr) truncates src=[-18446744073709551615n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-18446744073709551615n];
      target.set(src);
      expect(target[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0520
     * @tc.name testBigInt64ArraySetTwo052
     * @tc.desc Verify set(arr) writes src=[9007199254740991n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [9007199254740991n];
      target.set(src);
      expect(target[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0530
     * @tc.name testBigInt64ArraySetTwo053
     * @tc.desc Verify set(arr) writes src=[-9007199254740991n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-9007199254740991n];
      target.set(src);
      expect(target[0]).assertEqual(-9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0540
     * @tc.name testBigInt64ArraySetTwo054
     * @tc.desc Verify set(arr) rejects or ignores src length 5 for target 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(4);
      target[0] = 9n;
      target[3] = 9n;
      let src: FixedArray<BigInt> = [1n, 2n, 3n, 4n, 5n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || (target[0] === 9n && target[3] === 9n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0550
     * @tc.name testBigInt64ArraySetTwo055
     * @tc.desc Verify set(arr) rejects or ignores src length 2 for target 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(1);
      target[0] = 9n;
      let src: FixedArray<BigInt> = [1n, 2n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || target[0] === 9n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0560
     * @tc.name testBigInt64ArraySetTwo056
     * @tc.desc Verify set(arr) rejects or ignores src length 1 for target 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src: FixedArray<BigInt> = [1n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || target.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0570
     * @tc.name testBigInt64ArraySetTwo057
     * @tc.desc Verify set(arr) rejects or ignores src length 3 for target 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(2);
      target[0] = 9n;
      target[1] = 9n;
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || (target[0] === 9n && target[1] === 9n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0580
     * @tc.name testBigInt64ArraySetTwo058
     * @tc.desc Verify set(arr) rejects or ignores src length 4 for target 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(3);
      target[0] = 9n;
      target[2] = 9n;
      let src: FixedArray<BigInt> = [1n, 2n, 3n, 4n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || (target[0] === 9n && target[2] === 9n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0590
     * @tc.name testBigInt64ArraySetTwo059
     * @tc.desc Verify set(arr) rejects or ignores src=[0n] for target 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src: FixedArray<BigInt> = [0n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || target.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0600
     * @tc.name testBigInt64ArraySetTwo060
     * @tc.desc Verify set(arr) handles target=0 with empty src.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0610
     * @tc.name testBigInt64ArraySetTwo061
     * @tc.desc Verify set(arr) handles target=1 with empty src.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(1);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0620
     * @tc.name testBigInt64ArraySetTwo062
     * @tc.desc Verify set copies empty BigInt64Array with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([]);
      target.set(src, 0);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0630
     * @tc.name testBigInt64ArraySetTwo063
     * @tc.desc Verify set copies src=[10n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n]);
      target.set(src, 0);
      expect(target[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0640
     * @tc.name testBigInt64ArraySetTwo064
     * @tc.desc Verify set copies src=[20n] with offset=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([20n]);
      target.set(src, 1);
      expect(target[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0650
     * @tc.name testBigInt64ArraySetTwo065
     * @tc.desc Verify set copies src=[30n] with offset=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([30n]);
      target.set(src, 2);
      expect(target[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0660
     * @tc.name testBigInt64ArraySetTwo066
     * @tc.desc Verify set copies src=[40n] with offset=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([40n]);
      target.set(src, 3);
      expect(target[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0670
     * @tc.name testBigInt64ArraySetTwo067
     * @tc.desc Verify set copies src=[50n] with offset=4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([50n]);
      target.set(src, 4);
      expect(target[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0680
     * @tc.name testBigInt64ArraySetTwo068
     * @tc.desc Verify set copies src=[1n, 2n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([1n, 2n]);
      target.set(src, 0);
      expect(target[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0690
     * @tc.name testBigInt64ArraySetTwo069
     * @tc.desc Verify set copies src=[10n, 20n, 30n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n, 30n]);
      target.set(src, 0);
      expect(target[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0700
     * @tc.name testBigInt64ArraySetTwo070
     * @tc.desc Verify set copies src=[10n, 20n, 30n] with offset=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n, 30n]);
      target.set(src, 1);
      expect(target[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0710
     * @tc.name testBigInt64ArraySetTwo071
     * @tc.desc Verify set copies src=[10n, 20n, 30n] with offset=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n, 30n]);
      target.set(src, 2);
      expect(target[4]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0720
     * @tc.name testBigInt64ArraySetTwo072
     * @tc.desc Verify set copies src=[1n, 2n, 3n, 4n, 5n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      target.set(src, 0);
      expect(target[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0730
     * @tc.name testBigInt64ArraySetTwo073
     * @tc.desc Verify set copies src=[1n] with offset=50 into target 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src = new BigInt64Array([1n]);
      target.set(src, 50);
      expect(target[50]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0740
     * @tc.name testBigInt64ArraySetTwo074
     * @tc.desc Verify set copies src=[2n] with offset=99 into target 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src = new BigInt64Array([2n]);
      target.set(src, 99);
      expect(target[99]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0750
     * @tc.name testBigInt64ArraySetTwo075
     * @tc.desc Verify set(index, value) returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let result = arr.set(0, 42n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0760
     * @tc.name testBigInt64ArraySetTwo076
     * @tc.desc Verify set(array) returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [10n, 20n];
      let result = target.set(src);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0770
     * @tc.name testBigInt64ArraySetTwo077
     * @tc.desc Verify set(src, offset) returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n]);
      let result = target.set(src, 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0780
     * @tc.name testBigInt64ArraySetTwo078
     * @tc.desc Verify set(index, value) on subarray view affects parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array(10);
      let sub = parent.subarray(2, 7);
      sub.set(0, 42n);
      expect(parent[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0790
     * @tc.name testBigInt64ArraySetTwo079
     * @tc.desc Verify set(index, value) on buffer offset view writes to correct memory position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let view = new BigInt64Array(buf, 8, 3);
      view.set(0, 99n);
      let check = new BigInt64Array(buf, 0, 4);
      expect(check[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0800
     * @tc.name testBigInt64ArraySetTwo080
     * @tc.desc Verify set(array) with subarray elements as source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = parent.subarray(1, 4);
      let src: FixedArray<BigInt> = [sub[0], sub[1], sub[2]];
      let target = new BigInt64Array(5);
      target.set(src);
      expect(target[0]).assertEqual(20n);
      expect(target[1]).assertEqual(30n);
      expect(target[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0810
     * @tc.name testBigInt64ArraySetTwo081
     * @tc.desc Verify set(src, offset) with subarray source and non-zero offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = parent.subarray(1, 4);
      let target = new BigInt64Array(10);
      target.set(sub, 3);
      expect(target[3]).assertEqual(20n);
      expect(target[4]).assertEqual(30n);
      expect(target[5]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0830
     * @tc.name testBigInt64ArraySetTwo083
     * @tc.desc Verify length is preserved after set(index, value).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let len = arr.length;
      arr.set(2, 99n);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0840
     * @tc.name testBigInt64ArraySetTwo084
     * @tc.desc Verify byteLength is preserved after set(array).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let byteLen = target.byteLength;
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      target.set(src);
      expect(target.byteLength).assertEqual(byteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0850
     * @tc.name testBigInt64ArraySetTwo085
     * @tc.desc Verify fill then set(index, value) overrides the filled value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(7n);
      arr.set(2, 42n);
      expect(arr[0]).assertEqual(7n);
      expect(arr[2]).assertEqual(42n);
      expect(arr[4]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0860
     * @tc.name testBigInt64ArraySetTwo086
     * @tc.desc Verify set(index, value) repeatedly on same index, last write wins.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, 10n);
      arr.set(2, 20n);
      arr.set(2, 30n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0870
     * @tc.name testBigInt64ArraySetTwo087
     * @tc.desc Verify set(array) with 100 elements writes all positions correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(200);
      let src: FixedArray<BigInt> = [];
      for (let i = 0; i < 100; i++) {
        src[i] = BigInt(i * 10);
      }
      target.set(src);
      expect(target[0]).assertEqual(0n);
      expect(target[50]).assertEqual(500n);
      expect(target[99]).assertEqual(990n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0880
     * @tc.name testBigInt64ArraySetTwo088
     * @tc.desc Verify set(src, offset) at exact boundary offset equals length minus src length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(10);
      let src = new BigInt64Array([1n, 2n, 3n]);
      target.set(src, 7);
      expect(target[7]).assertEqual(1n);
      expect(target[8]).assertEqual(2n);
      expect(target[9]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0890
     * @tc.name testBigInt64ArraySetTwo089
     * @tc.desc Verify set(array) with all negative values writes all positions correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(10);
      let src: FixedArray<BigInt> = [-10n, -20n, -30n, -40n, -50n, -60n, -70n, -80n, -90n, -100n];
      target.set(src);
      expect(target[0]).assertEqual(-10n);
      expect(target[4]).assertEqual(-50n);
      expect(target[9]).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0900
     * @tc.name testBigInt64ArraySetTwo090
     * @tc.desc Verify set(index, value) with MAX value at last valid index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      arr.set(9, 9223372036854775807n);
      expect(arr[9]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0910
     * @tc.name testBigInt64ArraySetTwo091
     * @tc.desc Verify shared buffer visibility, set through one view and read through another.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let view1 = new BigInt64Array(buf, 0, 3);
      let view2 = new BigInt64Array(buf, 0, 3);
      view1.set(0, 42n);
      view1.set(1, 84n);
      expect(view2[0]).assertEqual(42n);
      expect(view2[1]).assertEqual(84n);
    });

  });
}
