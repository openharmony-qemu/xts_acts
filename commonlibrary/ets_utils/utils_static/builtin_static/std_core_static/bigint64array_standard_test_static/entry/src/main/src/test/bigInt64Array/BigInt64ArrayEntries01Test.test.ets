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
import Utils from './../Util.test';

export default function BigInt64ArrayEntries01Test(): void {
  describe('BigInt64ArrayEntries01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0100
     * @tc.name testBigInt64ArrayEntriesOne0100
     * @tc.desc Verify `for (let val of arr.entries()) { count++; } expect(count).assertEqual(0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        let count = 0;
        for (let val of arr.entries()) {
        count++;
        }
        expect(count).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0200
     * @tc.name testBigInt64ArrayEntriesOne0200
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(0n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0300
     * @tc.name testBigInt64ArrayEntriesOne0300
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-0n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(0n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0400
     * @tc.name testBigInt64ArrayEntriesOne0400
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(1n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(1n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0500
     * @tc.name testBigInt64ArrayEntriesOne0500
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(1000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1000n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(1000n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0600
     * @tc.name testBigInt64ArrayEntriesOne0600
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-1000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1000n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-1000n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0700
     * @tc.name testBigInt64ArrayEntriesOne0700
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(32767n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([32767n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(32767n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0800
     * @tc.name testBigInt64ArrayEntriesOne0800
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-32768n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-32768n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-32768n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_0900
     * @tc.name testBigInt64ArrayEntriesOne0900
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(65535n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([65535n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(65535n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1000
     * @tc.name testBigInt64ArrayEntriesOne1000
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-65536n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-65536n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-65536n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1100
     * @tc.name testBigInt64ArrayEntriesOne1100
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(100000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100000n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(100000n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1200
     * @tc.name testBigInt64ArrayEntriesOne1200
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-100000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-100000n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-100000n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1300
     * @tc.name testBigInt64ArrayEntriesOne1300
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(2147483647n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([2147483647n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(2147483647n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1400
     * @tc.name testBigInt64ArrayEntriesOne1400
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-2147483648n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-2147483648n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-2147483648n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1500
     * @tc.name testBigInt64ArrayEntriesOne1500
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(4294967295n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([4294967295n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(4294967295n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1600
     * @tc.name testBigInt64ArrayEntriesOne1600
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-4294967296n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-4294967296n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-4294967296n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1700
     * @tc.name testBigInt64ArrayEntriesOne1700
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(10000000000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10000000000n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(10000000000n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1800
     * @tc.name testBigInt64ArrayEntriesOne1800
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-10000000000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-10000000000n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-10000000000n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_1900
     * @tc.name testBigInt64ArrayEntriesOne1900
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(9007199254740991n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9007199254740991n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(9007199254740991n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2000
     * @tc.name testBigInt64ArrayEntriesOne2000
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-9007199254740991n); count++; } expect(count).assertEqua...` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9007199254740991n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-9007199254740991n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2100
     * @tc.name testBigInt64ArrayEntriesOne2100
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(9223372036854775807n); count++; } expect(count).assertEq...` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(9223372036854775807n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2200
     * @tc.name testBigInt64ArrayEntriesOne2200
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-9223372036854775808n); count++; } expect(count).assertE...` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-9223372036854775807n - 1n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2300
     * @tc.name testBigInt64ArrayEntriesOne2300
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0x123456789n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([4886718345n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(4886718345n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2400
     * @tc.name testBigInt64ArrayEntriesOne2400
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0x123456789n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-4886718345n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-4886718345n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2500
     * @tc.name testBigInt64ArrayEntriesOne2500
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0o7n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(7n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2600
     * @tc.name testBigInt64ArrayEntriesOne2600
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0o7n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-7n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-7n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2700
     * @tc.name testBigInt64ArrayEntriesOne2700
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0o10n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([8n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(8n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2800
     * @tc.name testBigInt64ArrayEntriesOne2800
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0o10n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-8n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-8n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_2900
     * @tc.name testBigInt64ArrayEntriesOne2900
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0o77n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([63n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(63n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3000
     * @tc.name testBigInt64ArrayEntriesOne3000
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0o100n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-64n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-64n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3100
     * @tc.name testBigInt64ArrayEntriesOne3100
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0o777n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([511n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(511n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3200
     * @tc.name testBigInt64ArrayEntriesOne3200
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0o1000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-512n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-512n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3300
     * @tc.name testBigInt64ArrayEntriesOne3300
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0b1n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-1n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3400
     * @tc.name testBigInt64ArrayEntriesOne3400
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0b10n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([2n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(2n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3500
     * @tc.name testBigInt64ArrayEntriesOne3500
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0b10n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-2n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-2n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3600
     * @tc.name testBigInt64ArrayEntriesOne3600
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0b11n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([3n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(3n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3700
     * @tc.name testBigInt64ArrayEntriesOne3700
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0b11n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-3n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-3n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3800
     * @tc.name testBigInt64ArrayEntriesOne3800
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0b1111n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(15n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_3900
     * @tc.name testBigInt64ArrayEntriesOne3900
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0b10000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-16n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-16n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4000
     * @tc.name testBigInt64ArrayEntriesOne4000
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(0b11111111n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([255n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(255n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4100
     * @tc.name testBigInt64ArrayEntriesOne4100
     * @tc.desc Verify `for (let val of arr.entries()) { expect(val[0]).assertEqual(0); expect(val[1]).assertEqual(-0b100000000n); count++; } expect(count).assertEqual(1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-256n]);
        let count = 0;
        for (let val of arr.entries()) {
        expect(val[0]).assertEqual(0);
        expect(val[1]).assertEqual(-256n);
        count++;
        }
        expect(count).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4200
     * @tc.name testBigInt64ArrayEntriesOne4200
     * @tc.desc Verify `[...arr.entries()]` produces a result where `entriesArray.length` equals `2`, `entriesArray[0][0]` equals `0`, and `entriesArray[0][1]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let entriesArray = [...arr.entries()];
        expect(entriesArray.length).assertEqual(2);
        expect(entriesArray[0][0]).assertEqual(0);
        expect(entriesArray[0][1]).assertEqual(1n);
        expect(entriesArray[1][0]).assertEqual(1);
        expect(entriesArray[1][1]).assertEqual(2n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4300
     * @tc.name testBigInt64ArrayEntriesOne4300
     * @tc.desc Verify `[...arr.entries()]` produces a result where `entriesArray.length` equals `2`, `entriesArray[0][0]` equals `0`, and `entriesArray[0][1]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n]);
        let entriesArray = [...arr.entries()];
        expect(entriesArray.length).assertEqual(2);
        expect(entriesArray[0][0]).assertEqual(0);
        expect(entriesArray[0][1]).assertEqual(0n);
        expect(entriesArray[1][0]).assertEqual(1);
        expect(entriesArray[1][1]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4400
     * @tc.name testBigInt64ArrayEntriesOne4400
     * @tc.desc Verify `[...arr.entries()]` produces a result where `entriesArray.length` equals `2`, `entriesArray[0][0]` equals `0`, and `entriesArray[0][1]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n]);
        let entriesArray = [...arr.entries()];
        expect(entriesArray.length).assertEqual(2);
        expect(entriesArray[0][0]).assertEqual(0);
        expect(entriesArray[0][1]).assertEqual(-1n);
        expect(entriesArray[1][0]).assertEqual(1);
        expect(entriesArray[1][1]).assertEqual(-2n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4500
     * @tc.name testBigInt64ArrayEntriesOne4500
     * @tc.desc Verify `[...arr.entries()]` produces a result where `entriesArray.length` equals `2`, `entriesArray[0][0]` equals `0`, and `entriesArray[0][1]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let entriesArray = [...arr.entries()];
        expect(entriesArray.length).assertEqual(2);
        expect(entriesArray[0][0]).assertEqual(0);
        expect(entriesArray[0][1]).assertEqual(9223372036854775807n);
        expect(entriesArray[1][0]).assertEqual(1);
        expect(entriesArray[1][1]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4600
     * @tc.name testBigInt64ArrayEntriesOne4600
     * @tc.desc Verify `Array.from(arr.entries())` produces a result where `entriesArray.length` equals `3`, `entriesArray[0][1]` equals `0x1n`, and `entriesArray[2][1]` equals `0x3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let entriesArray = Array.from(arr.entries());
        expect(entriesArray.length).assertEqual(3);
        expect(entriesArray[0][1]).assertEqual(1n);
        expect(entriesArray[2][1]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4700
     * @tc.name testBigInt64ArrayEntriesOne4700
     * @tc.desc Verify `arr.entries()` produces a result where `iterator.next().done` is false, `iterator.next().value[0]` equals `0`, and `iterator.next().value[1]` equals `0o1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        let iterator = arr.entries();
        let step1 = iterator.next();
        expect(step1.done).assertEqual(false);
        let value = step1.value as [number, bigint];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_ONE_4800
     * @tc.name testBigInt64ArrayEntriesOne4800
     * @tc.desc Verify `arr.entries()` produces a result where `iterator.next().done` is true, `iterator.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesOne4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let iterator = arr.entries();
        iterator.next();
        let step2 = iterator.next();
        expect(step2.done).assertEqual(true);
        expect(step2.value).assertUndefined();
      });

  });
}
