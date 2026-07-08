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

export default function BigInt64ArrayAt03Test(): void {
  describe('BigInt64ArrayAt03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0100
     * @tc.name testBigInt64ArrayAtThree0100
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr.at(0)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        expect(arr.at(0)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0200
     * @tc.name testBigInt64ArrayAtThree0200
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr.at(-1)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        expect(arr.at(-1)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0300
     * @tc.name testBigInt64ArrayAtThree0300
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr.at(2147483647)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        expect(arr.at(2147483647)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0400
     * @tc.name testBigInt64ArrayAtThree0400
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr.at(-2147483648)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        expect(arr.at(-2147483648)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0500
     * @tc.name testBigInt64ArrayAtThree0500
     * @tc.desc Verify `new BigInt64Array([0n])` produces a result where `arr.at(1)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        expect(arr.at(1)).assertEqual(undefined);
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0600
     * @tc.name testBigInt64ArrayAtThree0600
     * @tc.desc Verify `new BigInt64Array([0n])` produces a result where `arr.at(-2)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        expect(arr.at(-2)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0700
     * @tc.name testBigInt64ArrayAtThree0700
     * @tc.desc Verify `new BigInt64Array([0n])` produces a result where `arr.at(1000)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        expect(arr.at(1000)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0800
     * @tc.name testBigInt64ArrayAtThree0800
     * @tc.desc Verify `new BigInt64Array([0n])` produces a result where `arr.at(-1000)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        expect(arr.at(-1000)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_0900
     * @tc.name testBigInt64ArrayAtThree0900
     * @tc.desc Verify `new BigInt64Array([10n, 20n])` produces a result where `arr.at(2)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        expect(arr.at(2)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1000
     * @tc.name testBigInt64ArrayAtThree1000
     * @tc.desc Verify `new BigInt64Array([10n, 20n])` produces a result where `arr.at(99999)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        expect(arr.at(99999)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1100
     * @tc.name testBigInt64ArrayAtThree1100
     * @tc.desc Verify `new BigInt64Array([10n, 20n])` produces a result where `arr.at(-3)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        expect(arr.at(-3)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1200
     * @tc.name testBigInt64ArrayAtThree1200
     * @tc.desc Verify `new BigInt64Array([10n, 20n])` produces a result where `arr.at(-99999)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        expect(arr.at(-99999)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1300
     * @tc.name testBigInt64ArrayAtThree1300
     * @tc.desc Verify `new BigInt64Array([111n])` produces a result where `typeof arr.at(0)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([111n]);
        expect(typeof arr.at(0)).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1400
     * @tc.name testBigInt64ArrayAtThree1400
     * @tc.desc Verify `new BigInt64Array([111n])` produces a result where `typeof arr.at(5)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([111n]);
        expect(typeof arr.at(5)).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1500
     * @tc.name testBigInt64ArrayAtThree1500
     * @tc.desc Verify `new BigInt64Array([111n])` produces a result where `typeof arr.at(-5)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([111n]);
        expect(typeof arr.at(-5)).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1600
     * @tc.name testBigInt64ArrayAtThree1600
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array([77n, 88n]).length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([77n, 88n]);
        arr.at(0);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1700
     * @tc.name testBigInt64ArrayAtThree1700
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array([77n, 88n])[0]` equals `77n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([77n, 88n]);
        arr.at(0);
        arr.at(-1);
        expect(arr[0]).assertEqual(77n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1800
     * @tc.name testBigInt64ArrayAtThree1800
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr.at(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        arr[0] = 5n;
        expect(arr.at(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_1900
     * @tc.name testBigInt64ArrayAtThree1900
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr.at(-1)` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        arr[0] = 6n;
        expect(arr.at(-1)).assertEqual(6n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_2000
     * @tc.name testBigInt64ArrayAtThree2000
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n])` produces a result where `arr.at(1)` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr[1] = 99n;
        expect(arr.at(1)).assertEqual(99n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_2100
     * @tc.name testBigInt64ArrayAtThree2100
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n])` produces a result where `arr.at(-2)` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr[1] = 99n;
        expect(arr.at(-2)).assertEqual(99n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_2200
     * @tc.name testBigInt64ArrayAtThree2200
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr.at(5)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        arr[5] = 99n;
        expect(arr.at(5)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_2300
     * @tc.name testBigInt64ArrayAtThree2300
     * @tc.desc Verify `new BigInt64Array(new ArrayBuffer(16))` produces a result where `arr.at(0)` equals `55n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(new ArrayBuffer(16));
        arr[0] = 55n;
        expect(arr.at(0)).assertEqual(55n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_THREE_2400
     * @tc.name testBigInt64ArrayAtThree2400
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `new BigInt64Array(buf, 8, 2).at(0)` equals `333n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtThree2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr1 = new BigInt64Array(buf);
        let arr2 = new BigInt64Array(buf, 8, 2);
        arr1[1] = 333n;
        expect(arr2.at(0)).assertEqual(333n);
      });
  });
}
