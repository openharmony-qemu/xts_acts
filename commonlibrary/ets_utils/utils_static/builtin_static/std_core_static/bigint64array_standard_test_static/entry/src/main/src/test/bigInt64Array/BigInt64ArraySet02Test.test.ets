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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0100
     * @tc.name testBigInt64ArraySetTwo0100
     * @tc.desc Verify set writes val=0n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 0n);
      let expected = 0n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0200
     * @tc.name testBigInt64ArraySetTwo0200
     * @tc.desc Verify set writes val=77n at pos=length-1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      arr.set(arr.length - 1, 77n);
      let expected = 77n;
      expect(arr[arr.length - 1]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0300
     * @tc.name testBigInt64ArraySetTwo0300
     * @tc.desc Verify set writes val=BigInt(10) at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, BigInt(10));
      let expected = BigInt(10);
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0400
     * @tc.name testBigInt64ArraySetTwo0400
     * @tc.desc Verify set writes val=BigInt(0) at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, BigInt(0));
      let expected = BigInt(0);
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0500
     * @tc.name testBigInt64ArraySetTwo0500
     * @tc.desc Verify set writes val=BigInt(-10) at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, BigInt(-10));
      let expected = BigInt(-10);
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0600
     * @tc.name testBigInt64ArraySetTwo0600
     * @tc.desc Verify set writes val=4294967295n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 4294967295n);
      let expected = 4294967295n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0700
     * @tc.name testBigInt64ArraySetTwo0700
     * @tc.desc Verify set writes val=4294967296n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 4294967296n);
      let expected = 4294967296n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0800
     * @tc.name testBigInt64ArraySetTwo0800
     * @tc.desc Verify set writes val=-4294967296n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, -4294967296n);
      let expected = -4294967296n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_0900
     * @tc.name testBigInt64ArraySetTwo0900
     * @tc.desc Verify set writes val=-4294967297n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, -4294967297n);
      let expected = -4294967297n;
      expect(arr[0]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1000
     * @tc.name testBigInt64ArraySetTwo1000
     * @tc.desc Verify set writes val=(2n * 3n) at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, (2n * 3n));
      let expected = (2n * 3n);
      expect(arr[2]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1100
     * @tc.name testBigInt64ArraySetTwo1100
     * @tc.desc Verify set writes val=(10n ** 2n) at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, (10n ** 2n));
      let expected = (10n ** 2n);
      expect(arr[1]).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1200
     * @tc.name testBigInt64ArraySetTwo1200
     * @tc.desc Verify set stores val=9223372036854775807n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1300
     * @tc.name testBigInt64ArraySetTwo1300
     * @tc.desc Verify set stores val=9223372036854775807n at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, 9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1400
     * @tc.name testBigInt64ArraySetTwo1400
     * @tc.desc Verify set stores val=-9223372036854775808n at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, -9223372036854775808n);
      expect(arr[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1500
     * @tc.name testBigInt64ArraySetTwo1500
     * @tc.desc Verify set stores val=-9223372036854775808n at pos=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(3, -9223372036854775808n);
      expect(arr[3]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1600
     * @tc.name testBigInt64ArraySetTwo1600
     * @tc.desc Verify set truncates val=9223372036854775808n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 9223372036854775808n);
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1700
     * @tc.name testBigInt64ArraySetTwo1700
     * @tc.desc Verify set truncates val=9223372036854775809n at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, 9223372036854775809n);
      expect(arr[1]).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1800
     * @tc.name testBigInt64ArraySetTwo1800
     * @tc.desc Verify set truncates val=-9223372036854775809n at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, -9223372036854775809n);
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_1900
     * @tc.name testBigInt64ArraySetTwo1900
     * @tc.desc Verify set truncates val=-9223372036854775810n at pos=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(3, -9223372036854775810n);
      expect(arr[3]).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2000
     * @tc.name testBigInt64ArraySetTwo2000
     * @tc.desc Verify set truncates val=18446744073709551615n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 18446744073709551615n);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2100
     * @tc.name testBigInt64ArraySetTwo2100
     * @tc.desc Verify set truncates val=18446744073709551616n at pos=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(1, 18446744073709551616n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2200
     * @tc.name testBigInt64ArraySetTwo2200
     * @tc.desc Verify set truncates val=-18446744073709551615n at pos=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, -18446744073709551615n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2300
     * @tc.name testBigInt64ArraySetTwo2300
     * @tc.desc Verify set truncates val=-18446744073709551616n at pos=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(3, -18446744073709551616n);
      expect(arr[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2400
     * @tc.name testBigInt64ArraySetTwo2400
     * @tc.desc Verify set truncates val=27670116110564327423n at pos=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(0, 27670116110564327423n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2500
     * @tc.name testBigInt64ArraySetTwo2500
     * @tc.desc Verify set truncates val=-27670116110564327424n at pos=4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(4, -27670116110564327424n);
      expect(arr[4]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2600
     * @tc.name testBigInt64ArraySetTwo2600
     * @tc.desc Verify set handles out-of-range pos=5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(5, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2700
     * @tc.name testBigInt64ArraySetTwo2700
     * @tc.desc Verify set handles out-of-range pos=6.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(6, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2800
     * @tc.name testBigInt64ArraySetTwo2800
     * @tc.desc Verify set handles out-of-range pos=100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(100, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_2900
     * @tc.name testBigInt64ArraySetTwo2900
     * @tc.desc Verify set handles out-of-range pos=-1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-1, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3000
     * @tc.name testBigInt64ArraySetTwo3000
     * @tc.desc Verify set handles out-of-range pos=-2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-2, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3100
     * @tc.name testBigInt64ArraySetTwo3100
     * @tc.desc Verify set handles out-of-range pos=-5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-5, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3200
     * @tc.name testBigInt64ArraySetTwo3200
     * @tc.desc Verify set handles out-of-range pos=2147483647.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(2147483647, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3300
     * @tc.name testBigInt64ArraySetTwo3300
     * @tc.desc Verify set handles out-of-range pos=-2147483648.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let caught = didThrow((): void => {
        arr.set(-2147483648, 10n);
      });
      expect(caught || (arr[0] === 0n && arr[4] === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3400
     * @tc.name testBigInt64ArraySetTwo3400
     * @tc.desc Verify set(arr) writes src=[] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3500
     * @tc.name testBigInt64ArraySetTwo3500
     * @tc.desc Verify set(arr) writes src=[0n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [0n];
      target.set(src);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3600
     * @tc.name testBigInt64ArraySetTwo3600
     * @tc.desc Verify set(arr) writes src=[1n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n];
      target.set(src);
      expect(target[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3700
     * @tc.name testBigInt64ArraySetTwo3700
     * @tc.desc Verify set(arr) writes src=[-1n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-1n];
      target.set(src);
      expect(target[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3800
     * @tc.name testBigInt64ArraySetTwo3800
     * @tc.desc Verify set(arr) writes src=[10n, 20n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [10n, 20n];
      target.set(src);
      expect(target[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_3900
     * @tc.name testBigInt64ArraySetTwo3900
     * @tc.desc Verify set(arr) writes src=[1n, 2n, 3n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      target.set(src);
      expect(target[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4000
     * @tc.name testBigInt64ArraySetTwo4000
     * @tc.desc Verify set(arr) writes src=[1n, 2n, 3n, 4n, 5n] into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n, 2n, 3n, 4n, 5n];
      target.set(src);
      expect(target[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4100
     * @tc.name testBigInt64ArraySetTwo4100
     * @tc.desc Verify set(arr) writes five zero values into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [0n, 0n, 0n, 0n, 0n];
      target.set(src);
      expect(target[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4200
     * @tc.name testBigInt64ArraySetTwo4200
     * @tc.desc Verify set(arr) writes extreme values into target length 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [
      9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n
      ];
      target.set(src);
      expect(target[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4300
     * @tc.name testBigInt64ArraySetTwo4300
     * @tc.desc Verify set(arr) truncates src=[9223372036854775808n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [9223372036854775808n];
      target.set(src);
      expect(target[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4400
     * @tc.name testBigInt64ArraySetTwo4400
     * @tc.desc Verify set(arr) truncates src=[-9223372036854775809n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-9223372036854775809n];
      target.set(src);
      expect(target[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4500
     * @tc.name testBigInt64ArraySetTwo4500
     * @tc.desc Verify set(arr) writes computed source value 1n + 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [1n + 2n];
      target.set(src);
      expect(target[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4600
     * @tc.name testBigInt64ArraySetTwo4600
     * @tc.desc Verify set(arr) writes computed source value 2n * 3n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [2n * 3n];
      target.set(src);
      expect(target[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4700
     * @tc.name testBigInt64ArraySetTwo4700
     * @tc.desc Verify set(arr) writes computed source value 10n ** 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [10n ** 2n];
      target.set(src);
      expect(target[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4800
     * @tc.name testBigInt64ArraySetTwo4800
     * @tc.desc Verify set(arr) writes empty source into target length 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_4900
     * @tc.name testBigInt64ArraySetTwo4900
     * @tc.desc Verify set(arr) writes single source into target length 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src: FixedArray<BigInt> = [1n];
      target.set(src);
      expect(target[0]).assertEqual(1n);
      expect(target[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5000
     * @tc.name testBigInt64ArraySetTwo5000
     * @tc.desc Verify set(arr) truncates src=[18446744073709551615n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [18446744073709551615n];
      target.set(src);
      expect(target[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5100
     * @tc.name testBigInt64ArraySetTwo5100
     * @tc.desc Verify set(arr) truncates src=[-18446744073709551615n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-18446744073709551615n];
      target.set(src);
      expect(target[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5200
     * @tc.name testBigInt64ArraySetTwo5200
     * @tc.desc Verify set(arr) writes src=[9007199254740991n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [9007199254740991n];
      target.set(src);
      expect(target[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5300
     * @tc.name testBigInt64ArraySetTwo5300
     * @tc.desc Verify set(arr) writes src=[-9007199254740991n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [-9007199254740991n];
      target.set(src);
      expect(target[0]).assertEqual(-9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5400
     * @tc.name testBigInt64ArraySetTwo5400
     * @tc.desc Verify set(arr) rejects or ignores src length 5 for target 4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5500
     * @tc.name testBigInt64ArraySetTwo5500
     * @tc.desc Verify set(arr) rejects or ignores src length 2 for target 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(1);
      target[0] = 9n;
      let src: FixedArray<BigInt> = [1n, 2n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || target[0] === 9n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5600
     * @tc.name testBigInt64ArraySetTwo5600
     * @tc.desc Verify set(arr) rejects or ignores src length 1 for target 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src: FixedArray<BigInt> = [1n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || target.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5700
     * @tc.name testBigInt64ArraySetTwo5700
     * @tc.desc Verify set(arr) rejects or ignores src length 3 for target 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5800
     * @tc.name testBigInt64ArraySetTwo5800
     * @tc.desc Verify set(arr) rejects or ignores src length 4 for target 3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_5900
     * @tc.name testBigInt64ArraySetTwo5900
     * @tc.desc Verify set(arr) rejects or ignores src=[0n] for target 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src: FixedArray<BigInt> = [0n];
      let caught = didThrow((): void => {
        target.set(src);
      });
      expect(caught || target.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6000
     * @tc.name testBigInt64ArraySetTwo6000
     * @tc.desc Verify set(arr) handles target=0 with empty src.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(0);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6100
     * @tc.name testBigInt64ArraySetTwo6100
     * @tc.desc Verify set(arr) handles target=1 with empty src.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(1);
      let src: FixedArray<BigInt> = [];
      target.set(src);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6200
     * @tc.name testBigInt64ArraySetTwo6200
     * @tc.desc Verify set copies empty BigInt64Array with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([]);
      target.set(src, 0);
      expect(target[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6300
     * @tc.name testBigInt64ArraySetTwo6300
     * @tc.desc Verify set copies src=[10n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n]);
      target.set(src, 0);
      expect(target[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6400
     * @tc.name testBigInt64ArraySetTwo6400
     * @tc.desc Verify set copies src=[20n] with offset=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([20n]);
      target.set(src, 1);
      expect(target[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6500
     * @tc.name testBigInt64ArraySetTwo6500
     * @tc.desc Verify set copies src=[30n] with offset=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([30n]);
      target.set(src, 2);
      expect(target[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6600
     * @tc.name testBigInt64ArraySetTwo6600
     * @tc.desc Verify set copies src=[40n] with offset=3.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([40n]);
      target.set(src, 3);
      expect(target[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6700
     * @tc.name testBigInt64ArraySetTwo6700
     * @tc.desc Verify set copies src=[50n] with offset=4.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([50n]);
      target.set(src, 4);
      expect(target[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6800
     * @tc.name testBigInt64ArraySetTwo6800
     * @tc.desc Verify set copies src=[1n, 2n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([1n, 2n]);
      target.set(src, 0);
      expect(target[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_6900
     * @tc.name testBigInt64ArraySetTwo6900
     * @tc.desc Verify set copies src=[10n, 20n, 30n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n, 30n]);
      target.set(src, 0);
      expect(target[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7000
     * @tc.name testBigInt64ArraySetTwo7000
     * @tc.desc Verify set copies src=[10n, 20n, 30n] with offset=1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n, 30n]);
      target.set(src, 1);
      expect(target[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7100
     * @tc.name testBigInt64ArraySetTwo7100
     * @tc.desc Verify set copies src=[10n, 20n, 30n] with offset=2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n, 30n]);
      target.set(src, 2);
      expect(target[4]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7200
     * @tc.name testBigInt64ArraySetTwo7200
     * @tc.desc Verify set copies src=[1n, 2n, 3n, 4n, 5n] with offset=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      target.set(src, 0);
      expect(target[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7300
     * @tc.name testBigInt64ArraySetTwo7300
     * @tc.desc Verify set copies src=[1n] with offset=50 into target 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src = new BigInt64Array([1n]);
      target.set(src, 50);
      expect(target[50]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7400
     * @tc.name testBigInt64ArraySetTwo7400
     * @tc.desc Verify set copies src=[2n] with offset=99 into target 100.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(100);
      let src = new BigInt64Array([2n]);
      target.set(src, 99);
      expect(target[99]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7500
     * @tc.name testBigInt64ArraySetTwo7500
     * @tc.desc Verify set(index, value) returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let result = arr.set(0, 42n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7600
     * @tc.name testBigInt64ArraySetTwo7600
     * @tc.desc Verify set(array) returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src: FixedArray<BigInt> = [10n, 20n];
      let result = target.set(src);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7700
     * @tc.name testBigInt64ArraySetTwo7700
     * @tc.desc Verify set(src, offset) returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let src = new BigInt64Array([10n, 20n]);
      let result = target.set(src, 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7800
     * @tc.name testBigInt64ArraySetTwo7800
     * @tc.desc Verify set(index, value) on subarray view affects parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array(10);
      let sub = parent.subarray(2, 7);
      sub.set(0, 42n);
      expect(parent[2]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_7900
     * @tc.name testBigInt64ArraySetTwo7900
     * @tc.desc Verify set(index, value) on buffer offset view writes to correct memory position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let view = new BigInt64Array(buf, 8, 3);
      view.set(0, 99n);
      let check = new BigInt64Array(buf, 0, 4);
      expect(check[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8000
     * @tc.name testBigInt64ArraySetTwo8000
     * @tc.desc Verify set(array) with subarray elements as source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8100
     * @tc.name testBigInt64ArraySetTwo8100
     * @tc.desc Verify set(src, offset) with subarray source and non-zero offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = parent.subarray(1, 4);
      let target = new BigInt64Array(10);
      target.set(sub, 3);
      expect(target[3]).assertEqual(20n);
      expect(target[4]).assertEqual(30n);
      expect(target[5]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8200
     * @tc.name testBigInt64ArraySetTwo8200
     * @tc.desc Verify length is preserved after set(index, value).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let len = arr.length;
      arr.set(2, 99n);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8300
     * @tc.name testBigInt64ArraySetTwo8300
     * @tc.desc Verify byteLength is preserved after set(array).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(5);
      let byteLen = target.byteLength;
      let src: FixedArray<BigInt> = [1n, 2n, 3n];
      target.set(src);
      expect(target.byteLength).assertEqual(byteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8400
     * @tc.name testBigInt64ArraySetTwo8400
     * @tc.desc Verify fill then set(index, value) overrides the filled value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(7n);
      arr.set(2, 42n);
      expect(arr[0]).assertEqual(7n);
      expect(arr[2]).assertEqual(42n);
      expect(arr[4]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8500
     * @tc.name testBigInt64ArraySetTwo8500
     * @tc.desc Verify set(index, value) repeatedly on same index, last write wins.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set(2, 10n);
      arr.set(2, 20n);
      arr.set(2, 30n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8600
     * @tc.name testBigInt64ArraySetTwo8600
     * @tc.desc Verify set(array) with 100 elements writes all positions correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8700
     * @tc.name testBigInt64ArraySetTwo8700
     * @tc.desc Verify set(src, offset) at exact boundary offset equals length minus src length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(10);
      let src = new BigInt64Array([1n, 2n, 3n]);
      target.set(src, 7);
      expect(target[7]).assertEqual(1n);
      expect(target[8]).assertEqual(2n);
      expect(target[9]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8800
     * @tc.name testBigInt64ArraySetTwo8800
     * @tc.desc Verify set(array) with all negative values writes all positions correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new BigInt64Array(10);
      let src: FixedArray<BigInt> = [-10n, -20n, -30n, -40n, -50n, -60n, -70n, -80n, -90n, -100n];
      target.set(src);
      expect(target[0]).assertEqual(-10n);
      expect(target[4]).assertEqual(-50n);
      expect(target[9]).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_8900
     * @tc.name testBigInt64ArraySetTwo8900
     * @tc.desc Verify set(index, value) with MAX value at last valid index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      arr.set(9, 9223372036854775807n);
      expect(arr[9]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_TWO_ZERO_ONE_9000
     * @tc.name testBigInt64ArraySetTwo9000
     * @tc.desc Verify shared buffer visibility, set through one view and read through another.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetTwo9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
