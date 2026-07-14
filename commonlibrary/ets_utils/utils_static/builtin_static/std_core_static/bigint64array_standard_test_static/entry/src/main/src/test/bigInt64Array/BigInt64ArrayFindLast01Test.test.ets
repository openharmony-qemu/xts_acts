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

export default function BigInt64ArrayFindLast01Test(): void {
  describe('BigInt64ArrayFindLast01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0100
     * @tc.name testBigInt64ArrayFindLastOne0100
     * @tc.desc Verify findLast supports a predicate with zero parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.findLast(() => true);
      expect(res).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0200
     * @tc.name testBigInt64ArrayFindLastOne0200
     * @tc.desc Verify findLast supports a predicate with one parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.findLast(v => v === 10n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0300
     * @tc.name testBigInt64ArrayFindLastOne0300
     * @tc.desc Verify callback indices decrease monotonically until the first element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let visited: int[] = [];
      let res = arr.findLast((_v: bigint, index: int): boolean => {
        visited.push(index);
        return index === 0;
      });
      expect(visited.join(',')).assertEqual('3,2,1,0');
      expect(String(res)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0400
     * @tc.name testBigInt64ArrayFindLastOne0400
     * @tc.desc Verify a callback on an offset view receives the view byte length and shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let root = new BigInt64Array(buffer);
      root.set([10n, 20n, 30n, 40n, 50n]);
      let arr = new BigInt64Array(buffer, 8, 3);
      let observedByteLength = 0;
      let sharedBuffer = false;
      let res = arr.findLast((_v: bigint, index: int, array: BigInt64Array): boolean => {
        observedByteLength = array.byteLength;
        sharedBuffer = array.buffer === buffer;
        return index === array.length - 1;
      });
      expect(observedByteLength).assertEqual(24);
      expect(sharedBuffer).assertTrue();
      expect(String(res)).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0500
     * @tc.name testBigInt64ArrayFindLastOne0500
     * @tc.desc Verify findLast stops immediately when the last element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let calls = 0;
      let res = arr.findLast(v => {
        calls++;
        return v === 30n;
      });
      expect(res).assertEqual(30n);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0600
     * @tc.name testBigInt64ArrayFindLastOne0600
     * @tc.desc Verify findLast stops after a middle element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let calls = 0;
      let res = arr.findLast(v => {
        calls++;
        return v === 20n;
      });
      expect(res).assertEqual(20n);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0700
     * @tc.name testBigInt64ArrayFindLastOne0700
     * @tc.desc Verify findLast reaches the first element when it is the match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let calls = 0;
      let res = arr.findLast(v => {
        calls++;
        return v === 10n;
      });
      expect(res).assertEqual(10n);
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0800
     * @tc.name testBigInt64ArrayFindLastOne0800
     * @tc.desc Verify findLast traverses all elements and throws Error when no
     * match is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let calls = 0;
      try {
        arr.findLast(v => {
          calls++;
          return v === 40n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_0900
     * @tc.name testBigInt64ArrayFindLastOne0900
     * @tc.desc Verify findLast visits indices in strictly descending order and
     * throws Error when no match is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let order = '';
      try {
        arr.findLast((v, i) => {
          order += i.toString();
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(order).assertEqual('210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1000
     * @tc.name testBigInt64ArrayFindLastOne1000
     * @tc.desc Verify findLast matches a decimal predicate against a hexadecimal value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n]);
      let res = arr.findLast(v => v === 500n);
      expect(res).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1100
     * @tc.name testBigInt64ArrayFindLastOne1100
     * @tc.desc Verify findLast throws Error for an empty array when predicate
     * returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      try {
        arr.findLast(v => true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1200
     * @tc.name testBigInt64ArrayFindLastOne1200
     * @tc.desc Verify findLast throws Error when no element matches in a long
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n, 0n]);
      try {
        arr.findLast(v => v !== 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1300
     * @tc.name testBigInt64ArrayFindLastOne1300
     * @tc.desc Verify findLast matches a trailing 0n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 0n]);
      let res = arr.findLast(v => v === 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1400
     * @tc.name testBigInt64ArrayFindLastOne1400
     * @tc.desc Verify findLast matches a leading 0n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 100n]);
      let res = arr.findLast(v => v === 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1500
     * @tc.name testBigInt64ArrayFindLastOne1500
     * @tc.desc Verify reverse traversal stops at a selected interior index and leaves the source unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let visited: int[] = [];
      let res = arr.findLast((_v: bigint, index: int): boolean => {
        visited.push(index);
        return index === 1;
      });
      expect(visited.join(',')).assertEqual('3,2,1');
      expect(String(res)).assertEqual('20');
      expect(arr.join()).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1600
     * @tc.name testBigInt64ArrayFindLastOne1600
     * @tc.desc Verify findLast matches a middle 0n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 0n, 100n]);
      let res = arr.findLast(v => v === 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1700
     * @tc.name testBigInt64ArrayFindLastOne1700
     * @tc.desc Verify findLast matches a trailing 1n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 1n]);
      let res = arr.findLast(v => v === 1n);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1800
     * @tc.name testBigInt64ArrayFindLastOne1800
     * @tc.desc Verify findLast matches a trailing -1n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -1n]);
      let res = arr.findLast(v => v === -1n);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_1900
     * @tc.name testBigInt64ArrayFindLastOne1900
     * @tc.desc Verify findLast matches a trailing 9223372036854775807n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 9223372036854775807n]);
      let res = arr.findLast(v => v === 9223372036854775807n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2000
     * @tc.name testBigInt64ArrayFindLastOne2000
     * @tc.desc Verify findLast matches a trailing -9223372036854775808n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -9223372036854775807n - 1n]);
      let res = arr.findLast(v => v === -9223372036854775807n - 1n);
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2100
     * @tc.name testBigInt64ArrayFindLastOne2100
     * @tc.desc Verify findLast matches a trailing 9223372036854775806n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 9223372036854775806n]);
      let res = arr.findLast(v => v === 9223372036854775806n);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2200
     * @tc.name testBigInt64ArrayFindLastOne2200
     * @tc.desc Verify findLast matches a trailing -9223372036854775807n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -9223372036854775807n]);
      let res = arr.findLast(v => v === -9223372036854775807n);
      expect(res).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2300
     * @tc.name testBigInt64ArrayFindLastOne2300
     * @tc.desc Verify findLast matches a trailing 255n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 255n]);
      let res = arr.findLast(v => v === 255n);
      expect(res).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2400
     * @tc.name testBigInt64ArrayFindLastOne2400
     * @tc.desc Verify findLast matches a trailing -256n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -256n]);
      let res = arr.findLast(v => v === -256n);
      expect(res).assertEqual(-256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2500
     * @tc.name testBigInt64ArrayFindLastOne2500
     * @tc.desc Verify findLast matches a trailing 65535n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 65535n]);
      let res = arr.findLast(v => v === 65535n);
      expect(res).assertEqual(65535n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2600
     * @tc.name testBigInt64ArrayFindLastOne2600
     * @tc.desc Verify findLast matches a trailing -65536n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -65536n]);
      let res = arr.findLast(v => v === -65536n);
      expect(res).assertEqual(-65536n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2700
     * @tc.name testBigInt64ArrayFindLastOne2700
     * @tc.desc Verify findLast matches a trailing 4294967295n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 4294967295n]);
      let res = arr.findLast(v => v === 4294967295n);
      expect(res).assertEqual(4294967295n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2800
     * @tc.name testBigInt64ArrayFindLastOne2800
     * @tc.desc Verify findLast matches a trailing -4294967296n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -4294967296n]);
      let res = arr.findLast(v => v === -4294967296n);
      expect(res).assertEqual(-4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_2900
     * @tc.name testBigInt64ArrayFindLastOne2900
     * @tc.desc Verify findLast matches a trailing 100000000n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 100000000n]);
      let res = arr.findLast(v => v === 100000000n);
      expect(res).assertEqual(100000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_ONE_3000
     * @tc.name testBigInt64ArrayFindLastOne3000
     * @tc.desc Verify findLast matches a trailing -100000000n value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, -100000000n]);
      let res = arr.findLast(v => v === -100000000n);
      expect(res).assertEqual(-100000000n);
    });
  });
}
