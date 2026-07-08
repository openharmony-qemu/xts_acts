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

export default function BigInt64ArrayCopyWithin01Test(): void {
  describe('BigInt64ArrayCopyWithin01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0010
     * @tc.name testBigInt64ArrayCopyWithinOne0010
     * @tc.desc Verify `arr.copyWithin(2, 6)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[2]` equals `6n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `9n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[6]` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(2, 6);
        expect(arr[2]).assertEqual(6n);
        expect(arr[5]).assertEqual(9n);
        expect(arr[6]).assertEqual(6n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0020
     * @tc.name testBigInt64ArrayCopyWithinOne0020
     * @tc.desc Verify `arr.copyWithin(2, 6, 8)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[2]` equals `6n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[3]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[4]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(2, 6, 8);
        expect(arr[2]).assertEqual(6n);
        expect(arr[3]).assertEqual(7n);
        expect(arr[4]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0030
     * @tc.name testBigInt64ArrayCopyWithinOne0030
     * @tc.desc Verify `arr.copyWithin(0, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0040
     * @tc.name testBigInt64ArrayCopyWithinOne0040
     * @tc.desc Verify `arr.copyWithin(1, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `9n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(1, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(9n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0050
     * @tc.name testBigInt64ArrayCopyWithinOne0050
     * @tc.desc Verify `arr.copyWithin(3, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(3, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0060
     * @tc.name testBigInt64ArrayCopyWithinOne0060
     * @tc.desc Verify `arr.copyWithin(5, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(5, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0070
     * @tc.name testBigInt64ArrayCopyWithinOne0070
     * @tc.desc Verify `arr.copyWithin(8, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(8, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(6n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0080
     * @tc.name testBigInt64ArrayCopyWithinOne0080
     * @tc.desc Verify `arr.copyWithin(9, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(9, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0090
     * @tc.name testBigInt64ArrayCopyWithinOne0090
     * @tc.desc Verify `arr.copyWithin(10, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(10, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0100
     * @tc.name testBigInt64ArrayCopyWithinOne0100
     * @tc.desc Verify `arr.copyWithin(11, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(11, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0110
     * @tc.name testBigInt64ArrayCopyWithinOne0110
     * @tc.desc Verify `arr.copyWithin(100, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(100, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0120
     * @tc.name testBigInt64ArrayCopyWithinOne0120
     * @tc.desc Verify `arr.copyWithin(2147483647, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(2147483647, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0130
     * @tc.name testBigInt64ArrayCopyWithinOne0130
     * @tc.desc Verify `arr.copyWithin(-1, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-1, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0140
     * @tc.name testBigInt64ArrayCopyWithinOne0140
     * @tc.desc Verify `arr.copyWithin(-3, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `7n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-3, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(7n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0150
     * @tc.name testBigInt64ArrayCopyWithinOne0150
     * @tc.desc Verify `arr.copyWithin(-5, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-5, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0160
     * @tc.name testBigInt64ArrayCopyWithinOne0160
     * @tc.desc Verify `arr.copyWithin(-8, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `8n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-8, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(8n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0170
     * @tc.name testBigInt64ArrayCopyWithinOne0170
     * @tc.desc Verify `arr.copyWithin(-9, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `9n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-9, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(9n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0180
     * @tc.name testBigInt64ArrayCopyWithinOne0180
     * @tc.desc Verify `arr.copyWithin(-10, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-10, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0190
     * @tc.name testBigInt64ArrayCopyWithinOne0190
     * @tc.desc Verify `arr.copyWithin(-11, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-11, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0200
     * @tc.name testBigInt64ArrayCopyWithinOne0200
     * @tc.desc Verify `arr.copyWithin(-100, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-100, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0210
     * @tc.name testBigInt64ArrayCopyWithinOne0210
     * @tc.desc Verify `arr.copyWithin(-2147483648, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-2147483648, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0220
     * @tc.name testBigInt64ArrayCopyWithinOne0220
     * @tc.desc Verify `arr.copyWithin(0x0, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0x0, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0230
     * @tc.name testBigInt64ArrayCopyWithinOne0230
     * @tc.desc Verify `arr.copyWithin(0x1, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `9n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0x1, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(9n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0240
     * @tc.name testBigInt64ArrayCopyWithinOne0240
     * @tc.desc Verify `arr.copyWithin(0x3, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0x3, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0250
     * @tc.name testBigInt64ArrayCopyWithinOne0250
     * @tc.desc Verify `arr.copyWithin(0xa, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0xa, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0260
     * @tc.name testBigInt64ArrayCopyWithinOne0260
     * @tc.desc Verify `arr.copyWithin(0o0, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0o0, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0270
     * @tc.name testBigInt64ArrayCopyWithinOne0270
     * @tc.desc Verify `arr.copyWithin(0o2, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `8n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0o2, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(8n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0280
     * @tc.name testBigInt64ArrayCopyWithinOne0280
     * @tc.desc Verify `arr.copyWithin(0o7, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `7n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0o7, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(7n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0290
     * @tc.name testBigInt64ArrayCopyWithinOne0290
     * @tc.desc Verify `arr.copyWithin(0o12, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0o12, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0300
     * @tc.name testBigInt64ArrayCopyWithinOne0300
     * @tc.desc Verify `arr.copyWithin(0b0, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0b0, 5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0310
     * @tc.name testBigInt64ArrayCopyWithinOne0310
     * @tc.desc Verify `arr.copyWithin(0b1, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `9n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0b1, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(9n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0320
     * @tc.name testBigInt64ArrayCopyWithinOne0320
     * @tc.desc Verify `arr.copyWithin(0b11, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0b11, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0330
     * @tc.name testBigInt64ArrayCopyWithinOne0330
     * @tc.desc Verify `arr.copyWithin(0b1010, 5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0b1010, 5, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0340
     * @tc.name testBigInt64ArrayCopyWithinOne0340
     * @tc.desc Verify `arr.copyWithin(0, 0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0350
     * @tc.name testBigInt64ArrayCopyWithinOne0350
     * @tc.desc Verify `arr.copyWithin(0, 1, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `1n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `6n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 1, 10);
        expect(arr[0]).assertEqual(1n);
        expect(arr[5]).assertEqual(6n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0360
     * @tc.name testBigInt64ArrayCopyWithinOne0360
     * @tc.desc Verify `arr.copyWithin(0, 3, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `3n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `8n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 3, 10);
        expect(arr[0]).assertEqual(3n);
        expect(arr[5]).assertEqual(8n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0370
     * @tc.name testBigInt64ArrayCopyWithinOne0370
     * @tc.desc Verify `arr.copyWithin(0, 8, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `8n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 8, 10);
        expect(arr[0]).assertEqual(8n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0380
     * @tc.name testBigInt64ArrayCopyWithinOne0380
     * @tc.desc Verify `arr.copyWithin(0, 9, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `9n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 9, 10);
        expect(arr[0]).assertEqual(9n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0390
     * @tc.name testBigInt64ArrayCopyWithinOne0390
     * @tc.desc Verify `arr.copyWithin(0, 10, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 10, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0400
     * @tc.name testBigInt64ArrayCopyWithinOne0400
     * @tc.desc Verify `arr.copyWithin(0, 11, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 11, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0410
     * @tc.name testBigInt64ArrayCopyWithinOne0410
     * @tc.desc Verify `arr.copyWithin(0, 100, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 100, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0420
     * @tc.name testBigInt64ArrayCopyWithinOne0420
     * @tc.desc Verify `arr.copyWithin(0, 2147483647, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2147483647, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0430
     * @tc.name testBigInt64ArrayCopyWithinOne0430
     * @tc.desc Verify `arr.copyWithin(0, -1, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `9n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -1, 10);
        expect(arr[0]).assertEqual(9n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0440
     * @tc.name testBigInt64ArrayCopyWithinOne0440
     * @tc.desc Verify `arr.copyWithin(0, -3, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `7n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -3, 10);
        expect(arr[0]).assertEqual(7n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0450
     * @tc.name testBigInt64ArrayCopyWithinOne0450
     * @tc.desc Verify `arr.copyWithin(0, -5, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -5, 10);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0460
     * @tc.name testBigInt64ArrayCopyWithinOne0460
     * @tc.desc Verify `arr.copyWithin(0, -8, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -8, 10);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0470
     * @tc.name testBigInt64ArrayCopyWithinOne0470
     * @tc.desc Verify `arr.copyWithin(0, -9, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `1n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `6n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -9, 10);
        expect(arr[0]).assertEqual(1n);
        expect(arr[5]).assertEqual(6n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0480
     * @tc.name testBigInt64ArrayCopyWithinOne0480
     * @tc.desc Verify `arr.copyWithin(0, -10, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -10, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0490
     * @tc.name testBigInt64ArrayCopyWithinOne0490
     * @tc.desc Verify `arr.copyWithin(0, -11, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -11, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0500
     * @tc.name testBigInt64ArrayCopyWithinOne0500
     * @tc.desc Verify `arr.copyWithin(0, -100, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -100, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0510
     * @tc.name testBigInt64ArrayCopyWithinOne0510
     * @tc.desc Verify `arr.copyWithin(0, -2147483648, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -2147483648, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0520
     * @tc.name testBigInt64ArrayCopyWithinOne0520
     * @tc.desc Verify `arr.copyWithin(0, 0x0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0x0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0530
     * @tc.name testBigInt64ArrayCopyWithinOne0530
     * @tc.desc Verify `arr.copyWithin(0, 0x1, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `1n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `6n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0x1, 10);
        expect(arr[0]).assertEqual(1n);
        expect(arr[5]).assertEqual(6n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0540
     * @tc.name testBigInt64ArrayCopyWithinOne0540
     * @tc.desc Verify `arr.copyWithin(0, 0x3, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `3n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `8n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0x3, 10);
        expect(arr[0]).assertEqual(3n);
        expect(arr[5]).assertEqual(8n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0550
     * @tc.name testBigInt64ArrayCopyWithinOne0550
     * @tc.desc Verify `arr.copyWithin(0, 0xa, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0xa, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0560
     * @tc.name testBigInt64ArrayCopyWithinOne0560
     * @tc.desc Verify `arr.copyWithin(0, 0o0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0o0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0570
     * @tc.name testBigInt64ArrayCopyWithinOne0570
     * @tc.desc Verify `arr.copyWithin(0, 0o2, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0o2, 10);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0580
     * @tc.name testBigInt64ArrayCopyWithinOne0580
     * @tc.desc Verify `arr.copyWithin(0, 0o7, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `7n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0o7, 10);
        expect(arr[0]).assertEqual(7n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0590
     * @tc.name testBigInt64ArrayCopyWithinOne0590
     * @tc.desc Verify `arr.copyWithin(0, 0o12, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0o12, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0600
     * @tc.name testBigInt64ArrayCopyWithinOne0600
     * @tc.desc Verify `arr.copyWithin(0, 0b0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0b0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0610
     * @tc.name testBigInt64ArrayCopyWithinOne0610
     * @tc.desc Verify `arr.copyWithin(0, 0b1, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `1n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `6n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0b1, 10);
        expect(arr[0]).assertEqual(1n);
        expect(arr[5]).assertEqual(6n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0620
     * @tc.name testBigInt64ArrayCopyWithinOne0620
     * @tc.desc Verify `arr.copyWithin(0, 0b11, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `3n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `8n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0b11, 10);
        expect(arr[0]).assertEqual(3n);
        expect(arr[5]).assertEqual(8n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0630
     * @tc.name testBigInt64ArrayCopyWithinOne0630
     * @tc.desc Verify `arr.copyWithin(0, 0b1010, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 0b1010, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0640
     * @tc.name testBigInt64ArrayCopyWithinOne0640
     * @tc.desc Verify `arr.copyWithin(0, 2, 0)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0650
     * @tc.name testBigInt64ArrayCopyWithinOne0650
     * @tc.desc Verify `arr.copyWithin(0, 2, 1)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 1);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0660
     * @tc.name testBigInt64ArrayCopyWithinOne0660
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0670
     * @tc.name testBigInt64ArrayCopyWithinOne0670
     * @tc.desc Verify `arr.copyWithin(0, 2, 5)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 5);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0680
     * @tc.name testBigInt64ArrayCopyWithinOne0680
     * @tc.desc Verify `arr.copyWithin(0, 2, 8)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 8);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0690
     * @tc.name testBigInt64ArrayCopyWithinOne0690
     * @tc.desc Verify `arr.copyWithin(0, 2, 9)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 9);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0700
     * @tc.name testBigInt64ArrayCopyWithinOne0700
     * @tc.desc Verify `arr.copyWithin(0, 2, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 10);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0710
     * @tc.name testBigInt64ArrayCopyWithinOne0710
     * @tc.desc Verify `arr.copyWithin(0, 2, 11)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 11);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0720
     * @tc.name testBigInt64ArrayCopyWithinOne0720
     * @tc.desc Verify `arr.copyWithin(0, 2, 100)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 100);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0730
     * @tc.name testBigInt64ArrayCopyWithinOne0730
     * @tc.desc Verify `arr.copyWithin(0, 2, 2147483647)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 2147483647);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0740
     * @tc.name testBigInt64ArrayCopyWithinOne0740
     * @tc.desc Verify `arr.copyWithin(0, 2, -1)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -1);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0750
     * @tc.name testBigInt64ArrayCopyWithinOne0750
     * @tc.desc Verify `arr.copyWithin(0, 2, -3)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -3);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0760
     * @tc.name testBigInt64ArrayCopyWithinOne0760
     * @tc.desc Verify `arr.copyWithin(0, 2, -5)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -5);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0770
     * @tc.name testBigInt64ArrayCopyWithinOne0770
     * @tc.desc Verify `arr.copyWithin(0, 2, -8)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -8);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0780
     * @tc.name testBigInt64ArrayCopyWithinOne0780
     * @tc.desc Verify `arr.copyWithin(0, 2, -9)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -9);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0790
     * @tc.name testBigInt64ArrayCopyWithinOne0790
     * @tc.desc Verify `arr.copyWithin(0, 2, -10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0800
     * @tc.name testBigInt64ArrayCopyWithinOne0800
     * @tc.desc Verify `arr.copyWithin(0, 2, -11)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -11);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0810
     * @tc.name testBigInt64ArrayCopyWithinOne0810
     * @tc.desc Verify `arr.copyWithin(0, 2, -100)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -100);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0820
     * @tc.name testBigInt64ArrayCopyWithinOne0820
     * @tc.desc Verify `arr.copyWithin(0, 2, -2147483648)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, -2147483648);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0830
     * @tc.name testBigInt64ArrayCopyWithinOne0830
     * @tc.desc Verify `arr.copyWithin(0, 2, 0x0)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0x0);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0840
     * @tc.name testBigInt64ArrayCopyWithinOne0840
     * @tc.desc Verify `arr.copyWithin(0, 2, 0x1)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0x1);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0850
     * @tc.name testBigInt64ArrayCopyWithinOne0850
     * @tc.desc Verify `arr.copyWithin(0, 2, 0x3)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0x3);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0860
     * @tc.name testBigInt64ArrayCopyWithinOne0860
     * @tc.desc Verify `arr.copyWithin(0, 2, 0xa)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0xa);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0870
     * @tc.name testBigInt64ArrayCopyWithinOne0870
     * @tc.desc Verify `arr.copyWithin(0, 2, 0o0)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0o0);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0880
     * @tc.name testBigInt64ArrayCopyWithinOne0880
     * @tc.desc Verify `arr.copyWithin(0, 2, 0o2)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0o2);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0890
     * @tc.name testBigInt64ArrayCopyWithinOne0890
     * @tc.desc Verify `arr.copyWithin(0, 2, 0o7)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0o7);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0900
     * @tc.name testBigInt64ArrayCopyWithinOne0900
     * @tc.desc Verify `arr.copyWithin(0, 2, 0o12)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0o12);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0910
     * @tc.name testBigInt64ArrayCopyWithinOne0910
     * @tc.desc Verify `arr.copyWithin(0, 2, 0b0)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0b0);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0920
     * @tc.name testBigInt64ArrayCopyWithinOne0920
     * @tc.desc Verify `arr.copyWithin(0, 2, 0b1)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0b1);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0930
     * @tc.name testBigInt64ArrayCopyWithinOne0930
     * @tc.desc Verify `arr.copyWithin(0, 2, 0b11)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0b11);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0940
     * @tc.name testBigInt64ArrayCopyWithinOne0940
     * @tc.desc Verify `arr.copyWithin(0, 2, 0b1010)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `2n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `7n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 2, 0b1010);
        expect(arr[0]).assertEqual(2n);
        expect(arr[5]).assertEqual(7n);
        expect(arr[9]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0950
     * @tc.name testBigInt64ArrayCopyWithinOne0950
     * @tc.desc Verify `arr.copyWithin(5, 0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `0n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(5, 0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(0n);
        expect(arr[9]).assertEqual(4n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0960
     * @tc.name testBigInt64ArrayCopyWithinOne0960
     * @tc.desc Verify `arr.copyWithin(0, 7, 15)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `7n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 7, 15);
        expect(arr[0]).assertEqual(7n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0970
     * @tc.name testBigInt64ArrayCopyWithinOne0970
     * @tc.desc Verify `arr.copyWithin(-2, 0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-2, 0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(1n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0980
     * @tc.name testBigInt64ArrayCopyWithinOne0980
     * @tc.desc Verify `arr.copyWithin(15, 0, 5)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(15, 0, 5);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_0990
     * @tc.name testBigInt64ArrayCopyWithinOne0990
     * @tc.desc Verify `arr.copyWithin(8, 1, 5)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `2n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(8, 1, 5);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(2n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_1000
     * @tc.name testBigInt64ArrayCopyWithinOne1000
     * @tc.desc Verify `arr.copyWithin(-15, 0, 5)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(-15, 0, 5);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_1010
     * @tc.name testBigInt64ArrayCopyWithinOne1010
     * @tc.desc Verify `arr.copyWithin(0, 5, 2)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, 5, 2);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_1020
     * @tc.name testBigInt64ArrayCopyWithinOne1020
     * @tc.desc Verify `arr.copyWithin(0, -5, -2)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `5n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -5, -2);
        expect(arr[0]).assertEqual(5n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(9n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_1030
     * @tc.name testBigInt64ArrayCopyWithinOne1030
     * @tc.desc Verify `arr.copyWithin(4, 0, 10)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `1n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(4, 0, 10);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(1n);
        expect(arr[9]).assertEqual(5n);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_ONE_1040
     * @tc.name testBigInt64ArrayCopyWithinOne1040
     * @tc.desc Verify `arr.copyWithin(9, 0, 3)` produces a result where `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[0]` equals `0n`, `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[5]` equals `5n`, and `new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8, ...])[9]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinOne1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(9, 0, 3);
        expect(arr[0]).assertEqual(0n);
        expect(arr[5]).assertEqual(5n);
        expect(arr[9]).assertEqual(0n);
        expect(arr.length).assertEqual(10);
      });

  });
}
