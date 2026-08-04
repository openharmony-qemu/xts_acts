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
import Utils from './../Util.test';

export default function BigInt64ArrayFind03Test(): void {
  describe('BigInt64ArrayFind03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0100
     * @tc.name testBigInt64ArrayFindThree0100
     * @tc.desc Verify find locates `0n` when the callback uses value and index parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      let res = arr.find((v: bigint, idx: int) => idx === 0 && v === 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0200
     * @tc.name testBigInt64ArrayFindThree0200
     * @tc.desc Verify find locates `1n` when the callback uses only the value parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.find((v: bigint) => v === 1n);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0300
     * @tc.name testBigInt64ArrayFindThree0300
     * @tc.desc Verify find locates `1n` when the callback uses value and index parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.find((v: bigint, idx: int) => idx === 0 && v === 1n);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0400
     * @tc.name testBigInt64ArrayFindThree0400
     * @tc.desc Verify find locates `-1n` when the callback uses only the value parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.find((v: bigint) => v === -1n);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0500
     * @tc.name testBigInt64ArrayFindThree0500
     * @tc.desc Verify find locates `-1n` when the callback uses value and index parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.find((v: bigint, idx: int) => idx === 0 && v === -1n);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0600
     * @tc.name testBigInt64ArrayFindThree0600
     * @tc.desc Verify find stops at the first maximum boundary match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 9223372036854775807n]);
      let calls = 0;
      let res = arr.find((v: bigint): boolean => {
        calls++;
        return v === 9223372036854775807n;
      });
      expect(res).assertEqual(9223372036854775807n);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0700
     * @tc.name testBigInt64ArrayFindThree0700
     * @tc.desc Verify find can select the later maximum boundary value by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 1n, 9223372036854775807n]);
      let res = arr.find((v: bigint, idx: int) => idx === 2 && v === 9223372036854775807n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0800
     * @tc.name testBigInt64ArrayFindThree0800
     * @tc.desc Verify find stops at the first minimum boundary match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n, 5n, -9223372036854775807n - 1n]);
      let calls = 0;
      let res = arr.find((v: bigint): boolean => {
        calls++;
        return v === -9223372036854775807n - 1n;
      });
      expect(res).assertEqual(-9223372036854775807n - 1n);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_0900
     * @tc.name testBigInt64ArrayFindThree0900
     * @tc.desc Verify find can use the callback array parameter to match a boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -9223372036854775807n - 1n, 0n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array): boolean => {
        return idx > 0 && a[idx + 1] === 0n && v === -9223372036854775807n - 1n;
      });
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1000
     * @tc.name testBigInt64ArrayFindThree1000
     * @tc.desc Verify find returns `5n` for the first matching occurrence in repeated values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 5n, 3n, 5n, 5n, 4n]);
      let count = 0;
      let res = arr.find((v: bigint) => {
        if (v === 5n) count++;
        return v === 5n && count === 1;
      });
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1100
     * @tc.name testBigInt64ArrayFindThree1100
     * @tc.desc Verify find can identify a later duplicate by inspecting its preceding array element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 5n, 2n]);
      let res = arr.find((v: bigint, idx: int, array: BigInt64Array): boolean => {
        return idx > 0 && v === 5n && array[idx - 1] === 1n;
      });
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1200
     * @tc.name testBigInt64ArrayFindThree1200
     * @tc.desc Verify find uses view-relative indices when repeated values are searched in a subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new BigInt64Array([9n, 5n, 1n, 5n, 7n]);
      let arr = root.subarray(1, 4);
      let res = arr.find((v: bigint, idx: int): boolean => {
        return idx === arr.length - 1 && v === 5n;
      });
      expect(res).assertEqual(5n);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1300
     * @tc.name testBigInt64ArrayFindThree1300
     * @tc.desc Verify find returns undefined when the predicate waits for a fourth `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 5n, 3n, 5n, 5n, 4n]);
      let count = 0;
      let res = arr.find((v: bigint) => {
        if (v === 5n) count++;
        return v === 5n && count === 4;
      });
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1400
     * @tc.name testBigInt64ArrayFindThree1400
     * @tc.desc Verify find returns undefined when the predicate waits for a fifth `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 5n, 3n, 5n, 5n, 4n]);
      let count = 0;
      let res = arr.find((v: bigint) => {
        if (v === 5n) count++;
        return v === 5n && count === 5;
      });
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1500
     * @tc.name testBigInt64ArrayFindThree1500
     * @tc.desc Verify updating each visited element to max during find changes the array and yields undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        a.$_set(idx, 9223372036854775807n);
        return false;
      });
      expect(res).assertUndefined();
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1600
     * @tc.name testBigInt64ArrayFindThree1600
     * @tc.desc Verify updating each visited element to min during find changes the array and yields undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        a.$_set(idx, -9223372036854775807n - 1n);
        return false;
      });
      expect(res).assertUndefined();
      expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1700
     * @tc.name testBigInt64ArrayFindThree1700
     * @tc.desc Verify updating each visited element to `0n` during find changes the array and yields undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        a.$_set(idx, 0n);
        return false;
      });
      expect(res).assertUndefined();
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1800
     * @tc.name testBigInt64ArrayFindThree1800
     * @tc.desc Verify updating each visited element to `1n` during find changes the array and yields undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        a.$_set(idx, 1n);
        return false;
      });
      expect(res).assertUndefined();
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_1900
     * @tc.name testBigInt64ArrayFindThree1900
     * @tc.desc Verify nested find returns `1n` when the inner result makes `v1 + r2` equal `21n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([10n, 20n]);
      let res = arr1.find((v1: bigint) => {
        let r2 = arr2.find((v2: bigint) => v2 === 20n);
        if (r2 !== undefined) {
          return (v1 + r2) === 21n;
        }
        return false;
      });
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_2000
     * @tc.name testBigInt64ArrayFindThree2000
     * @tc.desc Verify nested find returns `2n` when the inner result makes `v1 + r2` equal `22n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([10n, 20n]);
      let res = arr1.find((v1: bigint) => {
        let r2 = arr2.find((v2: bigint) => v2 === 20n);
        if (r2 !== undefined) {
          return (v1 + r2) === 22n;
        }
        return false;
      });
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_2100
     * @tc.name testBigInt64ArrayFindThree2100
     * @tc.desc Verify external state with even parity locates `10n` when `step` is `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n, 12n, 13n, 14n, 15n, 16n]);
      let step = 0n;
      let res = arr.find((v: bigint) => (v % 2n) === (step % 2n));
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_THREE_2200
     * @tc.name testBigInt64ArrayFindThree2200
     * @tc.desc Verify external state with odd parity locates `11n` when `step` is `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindThree2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n, 12n, 13n, 14n, 15n, 16n]);
      let step = 1n;
      let res = arr.find((v: bigint) => (v % 2n) === (step % 2n));
      expect(res).assertEqual(11n);
    });
  });
}
