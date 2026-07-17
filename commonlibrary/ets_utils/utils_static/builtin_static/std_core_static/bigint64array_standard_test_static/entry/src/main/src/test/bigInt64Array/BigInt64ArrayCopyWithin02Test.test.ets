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

export default function BigInt64ArrayCopyWithin02Test(): void {
  describe('BigInt64ArrayCopyWithin02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0010
     * @tc.name testBigInt64ArrayCopyWithinTwo0010
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `typeof arr.copyWithin(1, 0)` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.copyWithin(1, 0);
        expect(typeof res).assertEqual('object');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0020
     * @tc.name testBigInt64ArrayCopyWithinTwo0020
     * @tc.desc Verify `arr.copyWithin(1, 0)` returns the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.copyWithin(1, 0);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0030
     * @tc.name testBigInt64ArrayCopyWithinTwo0030
     * @tc.desc Verify `arr.copyWithin(1, 0)` equals `arr`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.copyWithin(1, 0);
        expect(res).assertEqual(arr);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0040
     * @tc.name testBigInt64ArrayCopyWithinTwo0040
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res === arr` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.copyWithin(1, 0);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0050
     * @tc.name testBigInt64ArrayCopyWithinTwo0050
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.byteLength` equals `oldLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let oldLen = arr.byteLength;
        let res = arr.copyWithin(1, 0);
        expect(res.byteLength).assertEqual(oldLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0060
     * @tc.name testBigInt64ArrayCopyWithinTwo0060
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.length` equals `oldLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let oldLen = arr.length;
        let res = arr.copyWithin(1, 0);
        expect(res.length).assertEqual(oldLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0070
     * @tc.name testBigInt64ArrayCopyWithinTwo0070
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.buffer` equals `oldBuf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let oldBuf = arr.buffer;
        let res = arr.copyWithin(1, 0);
        expect(res.buffer).assertEqual(oldBuf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0080
     * @tc.name testBigInt64ArrayCopyWithinTwo0080
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let oldOffset = arr.byteOffset;
        let res = arr.copyWithin(1, 0);
        expect(res.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0090
     * @tc.name testBigInt64ArrayCopyWithinTwo0090
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `typeof arr.copyWithin(2, 1)` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let res = arr.copyWithin(2, 1);
        expect(typeof res).assertEqual('object');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0100
     * @tc.name testBigInt64ArrayCopyWithinTwo0100
     * @tc.desc Verify `arr.copyWithin(2, 1)` returns the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let res = arr.copyWithin(2, 1);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0110
     * @tc.name testBigInt64ArrayCopyWithinTwo0110
     * @tc.desc Verify `arr.copyWithin(2, 1)` equals `arr`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let res = arr.copyWithin(2, 1);
        expect(res).assertEqual(arr);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0120
     * @tc.name testBigInt64ArrayCopyWithinTwo0120
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `res === arr` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let res = arr.copyWithin(2, 1);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0130
     * @tc.name testBigInt64ArrayCopyWithinTwo0130
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `res.byteLength` equals `oldLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let oldLen = arr.byteLength;
        let res = arr.copyWithin(2, 1);
        expect(res.byteLength).assertEqual(oldLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0140
     * @tc.name testBigInt64ArrayCopyWithinTwo0140
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `res.length` equals `oldLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let oldLen = arr.length;
        let res = arr.copyWithin(2, 1);
        expect(res.length).assertEqual(oldLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0150
     * @tc.name testBigInt64ArrayCopyWithinTwo0150
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `res.buffer` equals `oldBuf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let oldBuf = arr.buffer;
        let res = arr.copyWithin(2, 1);
        expect(res.buffer).assertEqual(oldBuf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0160
     * @tc.name testBigInt64ArrayCopyWithinTwo0160
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `res.byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
        let oldOffset = arr.byteOffset;
        let res = arr.copyWithin(2, 1);
        expect(res.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0170
     * @tc.name testBigInt64ArrayCopyWithinTwo0170
     * @tc.desc Verify a negative target copies the source range into the final two positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        arr.copyWithin(-2, 0, 3);
        expect(arr.join()).assertEqual('1,2,1,2');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0180
     * @tc.name testBigInt64ArrayCopyWithinTwo0180
     * @tc.desc Verify copyWithin is a no-op when start and end resolve to the same index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 6n, 7n]);
        let res = arr.copyWithin(1, 2, 2);
        expect(res === arr).assertTrue();
        expect(arr.join()).assertEqual('5,6,7');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0190
     * @tc.name testBigInt64ArrayCopyWithinTwo0190
     * @tc.desc Verify a target greater than the array length leaves all elements unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([8n, 9n, 10n]);
        arr.copyWithin(2147483647, 0, 2);
        expect(arr.join()).assertEqual('8,9,10');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0200
     * @tc.name testBigInt64ArrayCopyWithinTwo0200
     * @tc.desc Verify a negative end excludes the last element from the copied source range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
        let res = arr.copyWithin(0, 2, -1);
        expect(arr.join()).assertEqual('3,4,3,4,5');
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0210
     * @tc.name testBigInt64ArrayCopyWithinTwo0210
     * @tc.desc Verify copyWithin on a one-element array keeps its value and byte length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([11n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(11n);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0220
     * @tc.name testBigInt64ArrayCopyWithinTwo0220
     * @tc.desc Verify copyWithin on an empty array remains empty when end is omitted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        arr.copyWithin(0, 0);
        expect(arr.length).assertEqual(0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0230
     * @tc.name testBigInt64ArrayCopyWithinTwo0230
     * @tc.desc Verify backward overlap copies values from the original source positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
        let oldBuf = arr.buffer;
        arr.copyWithin(1, 0, 4);
        expect(arr.join()).assertEqual('1,1,2,3,4');
        expect(arr.buffer).assertEqual(oldBuf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0240
     * @tc.name testBigInt64ArrayCopyWithinTwo0240
     * @tc.desc Verify copyWithin mutates only the selected non-zero-offset view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(40);
        let root = new BigInt64Array(buffer);
        root.set([10n, 20n, 30n, 40n, 50n]);
        let view = new BigInt64Array(buffer, 8, 3);
        view.copyWithin(0, 1);
        expect(view.byteOffset).assertEqual(8);
        expect(root.join()).assertEqual('10,30,40,40,50');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0250
     * @tc.name testBigInt64ArrayCopyWithinTwo0250
     * @tc.desc Verify omitting end copies the final two elements to the start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(0, -2);
        expect(arr.join()).assertEqual('8,9,7,8,9');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0260
     * @tc.name testBigInt64ArrayCopyWithinTwo0260
     * @tc.desc Verify forward overlap preserves the original source sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(0, 1, 5);
        expect(arr.join()).assertEqual('20,30,40,50,50');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0270
     * @tc.name testBigInt64ArrayCopyWithinTwo0270
     * @tc.desc Verify an extreme negative start is clamped to the array start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([3n, 4n, 5n, 6n]);
        arr.copyWithin(2, -2147483648, 1);
        expect(arr.join()).assertEqual('3,4,3,6');
        expect(arr[2]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0280
     * @tc.name testBigInt64ArrayCopyWithinTwo0280
     * @tc.desc Verify chained copyWithin calls use the result of the preceding mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
        let res = arr.copyWithin(0, 3).copyWithin(3, 0, 2);
        expect(res === arr).assertTrue();
        expect(arr.join()).assertEqual('4,5,3,4,5');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0290
     * @tc.name testBigInt64ArrayCopyWithinTwo0290
     * @tc.desc Verify a truncated copy on a view keeps the view byte length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(48);
        let root = new BigInt64Array(buffer);
        root.set([1n, 2n, 3n, 4n, 5n, 6n]);
        let view = new BigInt64Array(buffer, 16, 3);
        view.copyWithin(2, 0, 3);
        expect(view.byteLength).assertEqual(24);
        expect(root.join()).assertEqual('1,2,3,4,3,6');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0300
     * @tc.name testBigInt64ArrayCopyWithinTwo0300
     * @tc.desc Verify a full-range self-copy keeps both the length and contents unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-3n, 0n, 3n, 6n]);
        arr.copyWithin(0, 0, arr.length);
        expect(arr.length).assertEqual(4);
        expect(arr.join()).assertEqual('-3,0,3,6');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0310
     * @tc.name testBigInt64ArrayCopyWithinTwo0310
     * @tc.desc Verify copyWithin on a subarray updates the shared parent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let root = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        let view = root.subarray(1, 4);
        let oldBuf = root.buffer;
        view.copyWithin(1, 0, 2);
        expect(view.buffer).assertEqual(oldBuf);
        expect(root.join()).assertEqual('10,20,20,30,50');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0320
     * @tc.name testBigInt64ArrayCopyWithinTwo0320
     * @tc.desc Verify an extreme no-op on a view preserves its offset and parent contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let root = new BigInt64Array([7n, 8n, 9n, 10n]);
        let view = root.subarray(1, 3);
        view.copyWithin(2147483647, -2147483648, 1);
        expect(view.byteOffset).assertEqual(8);
        expect(root.join()).assertEqual('7,8,9,10');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0330
     * @tc.name testBigInt64ArrayCopyWithinTwo0330
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `typeof arr.copyWithin(1, 0)` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let res = arr.copyWithin(1, 0);
        expect(typeof res).assertEqual('object');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0340
     * @tc.name testBigInt64ArrayCopyWithinTwo0340
     * @tc.desc Verify `arr.copyWithin(1, 0)` returns the source array for boundary bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let res = arr.copyWithin(1, 0);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0350
     * @tc.name testBigInt64ArrayCopyWithinTwo0350
     * @tc.desc Verify `arr.copyWithin(1, 0)` equals `arr`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let res = arr.copyWithin(1, 0);
        expect(res).assertEqual(arr);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0360
     * @tc.name testBigInt64ArrayCopyWithinTwo0360
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res === arr` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let res = arr.copyWithin(1, 0);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0370
     * @tc.name testBigInt64ArrayCopyWithinTwo0370
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.byteLength` equals `oldLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let oldLen = arr.byteLength;
        let res = arr.copyWithin(1, 0);
        expect(res.byteLength).assertEqual(oldLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0380
     * @tc.name testBigInt64ArrayCopyWithinTwo0380
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.length` equals `oldLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let oldLen = arr.length;
        let res = arr.copyWithin(1, 0);
        expect(res.length).assertEqual(oldLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0390
     * @tc.name testBigInt64ArrayCopyWithinTwo0390
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.buffer` equals `oldBuf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let oldBuf = arr.buffer;
        let res = arr.copyWithin(1, 0);
        expect(res.buffer).assertEqual(oldBuf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0400
     * @tc.name testBigInt64ArrayCopyWithinTwo0400
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `res.byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        let oldOffset = arr.byteOffset;
        let res = arr.copyWithin(1, 0);
        expect(res.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0410
     * @tc.name testBigInt64ArrayCopyWithinTwo0410
     * @tc.desc Verify chained copyWithin calls return the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        let res = arr.copyWithin(1, 0).copyWithin(0, 1);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0420
     * @tc.name testBigInt64ArrayCopyWithinTwo0420
     * @tc.desc Verify `arr.copyWithin(1, 0).fill(88n, 0, 1)` produces a result where `res[0]` equals `88n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        let res = arr.copyWithin(1, 0).fill(88n, 0, 1);
        expect(res[0]).assertEqual(88n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0430
     * @tc.name testBigInt64ArrayCopyWithinTwo0430
     * @tc.desc Verify `arr.copyWithin(1, 0).length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        let len = arr.copyWithin(1, 0).length;
        expect(len).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0440
     * @tc.name testBigInt64ArrayCopyWithinTwo0440
     * @tc.desc Verify `arr.copyWithin(1, 0).reverse()` produces a result where `res.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        let res = arr.copyWithin(1, 0).reverse();
        expect(res.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0450
     * @tc.name testBigInt64ArrayCopyWithinTwo0450
     * @tc.desc Verify chained copyWithin calls return the source array for negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-5n, -6n, -7n, -8n]);
        let res = arr.copyWithin(2, 1).copyWithin(1, 2);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0460
     * @tc.name testBigInt64ArrayCopyWithinTwo0460
     * @tc.desc Verify `arr.copyWithin(2, 1).fill(88n, 0, 1)` produces a result where `res[0]` equals `88n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-5n, -6n, -7n, -8n]);
        let res = arr.copyWithin(2, 1).fill(88n, 0, 1);
        expect(res[0]).assertEqual(88n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0470
     * @tc.name testBigInt64ArrayCopyWithinTwo0470
     * @tc.desc Verify `arr.copyWithin(2, 1).length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-5n, -6n, -7n, -8n]);
        let len = arr.copyWithin(2, 1).length;
        expect(len).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0480
     * @tc.name testBigInt64ArrayCopyWithinTwo0480
     * @tc.desc Verify `arr.copyWithin(2, 1).reverse()` produces a result where `res.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-5n, -6n, -7n, -8n]);
        let res = arr.copyWithin(2, 1).reverse();
        expect(res.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0490
     * @tc.name testBigInt64ArrayCopyWithinTwo0490
     * @tc.desc Verify chained copyWithin calls return the source array for positive values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
        let res = arr.copyWithin(0, 2).copyWithin(2, 0);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0500
     * @tc.name testBigInt64ArrayCopyWithinTwo0500
     * @tc.desc Verify `arr.copyWithin(0, 2).fill(88n, 0, 1)` produces a result where `res[0]` equals `88n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
        let res = arr.copyWithin(0, 2).fill(88n, 0, 1);
        expect(res[0]).assertEqual(88n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0510
     * @tc.name testBigInt64ArrayCopyWithinTwo0510
     * @tc.desc Verify `arr.copyWithin(0, 2).length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
        let len = arr.copyWithin(0, 2).length;
        expect(len).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0520
     * @tc.name testBigInt64ArrayCopyWithinTwo0520
     * @tc.desc Verify `arr.copyWithin(0, 2).reverse()` produces a result where `res.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
        let res = arr.copyWithin(0, 2).reverse();
        expect(res.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0530
     * @tc.name testBigInt64ArrayCopyWithinTwo0530
     * @tc.desc Verify chained copyWithin calls return the source array for repeated values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 0n, 1n]);
        let res = arr.copyWithin(3, 0).copyWithin(0, 3);
        expect(res === arr).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0540
     * @tc.name testBigInt64ArrayCopyWithinTwo0540
     * @tc.desc Verify `arr.copyWithin(3, 0).fill(88n, 0, 1)` produces a result where `res[0]` equals `88n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 0n, 1n]);
        let res = arr.copyWithin(3, 0).fill(88n, 0, 1);
        expect(res[0]).assertEqual(88n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0550
     * @tc.name testBigInt64ArrayCopyWithinTwo0550
     * @tc.desc Verify `arr.copyWithin(3, 0).length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 0n, 1n]);
        let len = arr.copyWithin(3, 0).length;
        expect(len).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0560
     * @tc.name testBigInt64ArrayCopyWithinTwo0560
     * @tc.desc Verify `arr.copyWithin(3, 0).reverse()` produces a result where `res.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n, 0n, 1n]);
        let res = arr.copyWithin(3, 0).reverse();
        expect(res.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0570
     * @tc.name testBigInt64ArrayCopyWithinTwo0570
     * @tc.desc Verify `arr2.copyWithin(0, 1, 2)` updates the shared buffer to `[2n, 2n, 3n, 4n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr1 = new BigInt64Array(buf, 0, 4);
        arr1[0] = 1n;
        arr1[1] = 2n;
        arr1[2] = 3n;
        arr1[3] = 4n;
        let arr2 = new BigInt64Array(buf, 0, 4);
        arr2.copyWithin(0, 1, 2);
        expect(arr1[0]).assertEqual(2n);
        expect(arr1[1]).assertEqual(2n);
        expect(arr1[2]).assertEqual(3n);
        expect(arr1[3]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0580
     * @tc.name testBigInt64ArrayCopyWithinTwo0580
     * @tc.desc Verify `arr64.copyWithin(0, 1, 2)` updates the shared buffer to `[30n, 30n, 0n, 0n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr8 = new Int8Array(buf);
        let arr64 = new BigInt64Array(buf, 0, 4);
        arr64[0] = 15n;
        arr64[1] = 30n;
        arr64.copyWithin(0, 1, 2);
        let result = new BigInt64Array(arr8.buffer, 0, 4);
        expect(result[0]).assertEqual(30n);
        expect(result[1]).assertEqual(30n);
        expect(result[2]).assertEqual(0n);
        expect(result[3]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0590
     * @tc.name testBigInt64ArrayCopyWithinTwo0590
     * @tc.desc Verify `arr2.copyWithin(0, 0, 1)` preserves `[2n, 3n, 4n]` when source and target start match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr1 = new BigInt64Array(buf, 0, 4);
        arr1[0] = 1n;
        arr1[1] = 2n;
        arr1[2] = 3n;
        arr1[3] = 4n;
        let arr2 = new BigInt64Array(buf, 8, 3);
        arr2.copyWithin(0, 0, 1);
        expect(arr2[0]).assertEqual(2n);
        expect(arr2[1]).assertEqual(3n);
        expect(arr2[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0600
     * @tc.name testBigInt64ArrayCopyWithinTwo0600
     * @tc.desc Verify `arr64.copyWithin(0, 0, 1)` preserves `[15n, 30n, 0n]` when source and target start match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr8 = new Int8Array(buf);
        let arr64 = new BigInt64Array(buf, 8, 3);
        arr64[0] = 15n;
        arr64[1] = 30n;
        arr64.copyWithin(0, 0, 1);
        let result = new BigInt64Array(arr8.buffer, 8, 3);
        expect(result[0]).assertEqual(15n);
        expect(result[1]).assertEqual(30n);
        expect(result[2]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0610
     * @tc.name testBigInt64ArrayCopyWithinTwo0610
     * @tc.desc Verify `arr2.copyWithin(0, 0, 2)` preserves `[3n, 4n]` when source and target ranges match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr1 = new BigInt64Array(buf, 0, 4);
        arr1[0] = 1n;
        arr1[1] = 2n;
        arr1[2] = 3n;
        arr1[3] = 4n;
        let arr2 = new BigInt64Array(buf, 16, 2);
        arr2.copyWithin(0, 0, 2);
        expect(arr2[0]).assertEqual(3n);
        expect(arr2[1]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0620
     * @tc.name testBigInt64ArrayCopyWithinTwo0620
     * @tc.desc Verify `arr64.copyWithin(0, 0, 2)` preserves `[15n, 30n]` when source and target ranges match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr8 = new Int8Array(buf);
        let arr64 = new BigInt64Array(buf, 16, 2);
        arr64[0] = 15n;
        arr64[1] = 30n;
        arr64.copyWithin(0, 0, 2);
        let result = new BigInt64Array(arr8.buffer, 16, 2);
        expect(result[0]).assertEqual(15n);
        expect(result[1]).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0630
     * @tc.name testBigInt64ArrayCopyWithinTwo0630
     * @tc.desc Verify `arr2.copyWithin(0, 0, 2)` preserves `[1n, 2n]` when source and target ranges match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr1 = new BigInt64Array(buf, 0, 4);
        arr1[0] = 1n;
        arr1[1] = 2n;
        arr1[2] = 3n;
        arr1[3] = 4n;
        let arr2 = new BigInt64Array(buf, 0, 2);
        arr2.copyWithin(0, 0, 2);
        expect(arr2[0]).assertEqual(1n);
        expect(arr2[1]).assertEqual(2n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0640
     * @tc.name testBigInt64ArrayCopyWithinTwo0640
     * @tc.desc Verify `arr64.copyWithin(0, 0, 2)` preserves `[15n, 30n]` when source and target ranges match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr8 = new Int8Array(buf);
        let arr64 = new BigInt64Array(buf, 0, 2);
        arr64[0] = 15n;
        arr64[1] = 30n;
        arr64.copyWithin(0, 0, 2);
        let result = new BigInt64Array(arr8.buffer, 0, 2);
        expect(result[0]).assertEqual(15n);
        expect(result[1]).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0650
     * @tc.name testBigInt64ArrayCopyWithinTwo0650
     * @tc.desc Verify `arr2.copyWithin(0, 1, 2)` updates the shared buffer view to `[3n, 3n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr1 = new BigInt64Array(buf, 0, 4);
        arr1[0] = 1n;
        arr1[1] = 2n;
        arr1[2] = 3n;
        arr1[3] = 4n;
        let arr2 = new BigInt64Array(buf, 8, 2);
        arr2.copyWithin(0, 1, 2);
        expect(arr2[0]).assertEqual(3n);
        expect(arr2[1]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0660
     * @tc.name testBigInt64ArrayCopyWithinTwo0660
     * @tc.desc Verify `arr64.copyWithin(0, 1, 2)` updates the shared buffer view to `[30n, 30n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr8 = new Int8Array(buf);
        let arr64 = new BigInt64Array(buf, 8, 2);
        arr64[0] = 15n;
        arr64[1] = 30n;
        arr64.copyWithin(0, 1, 2);
        let result = new BigInt64Array(arr8.buffer, 8, 2);
        expect(result[0]).assertEqual(30n);
        expect(result[1]).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0670
     * @tc.name testBigInt64ArrayCopyWithinTwo0670
     * @tc.desc Verify `arr.copyWithin(2, 0, 3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        arr.copyWithin(2, 0, 3);
        let expectedArr = new BigInt64Array([1n, 2n, 1n, 2n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0680
     * @tc.name testBigInt64ArrayCopyWithinTwo0680
     * @tc.desc Verify `arr.copyWithin(3, 0, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 6n, 7n, 8n]);
        arr.copyWithin(3, 0, 4);
        let expectedArr = new BigInt64Array([5n, 6n, 7n, 5n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0690
     * @tc.name testBigInt64ArrayCopyWithinTwo0690
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        arr.copyWithin(2, 0, 2);
        let expectedArr = new BigInt64Array([10n, 20n, 10n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0700
     * @tc.name testBigInt64ArrayCopyWithinTwo0700
     * @tc.desc Verify `arr.copyWithin(10, 0, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        arr.copyWithin(10, 0, 2);
        let expectedArr = new BigInt64Array([10n, 20n, 30n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0710
     * @tc.name testBigInt64ArrayCopyWithinTwo0710
     * @tc.desc Verify `arr.copyWithin(0, 5, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(0, 5, 6);
        let expectedArr = new BigInt64Array([1n, 2n, 3n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0720
     * @tc.name testBigInt64ArrayCopyWithinTwo0720
     * @tc.desc Verify `arr.copyWithin(-1, 0, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(-1, 0, 5);
        let expectedArr = new BigInt64Array([1n, 2n, 1n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0730
     * @tc.name testBigInt64ArrayCopyWithinTwo0730
     * @tc.desc Verify `arr.copyWithin(-5, 1, 3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(-5, 1, 3);
        let expectedArr = new BigInt64Array([2n, 3n, 3n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0740
     * @tc.name testBigInt64ArrayCopyWithinTwo0740
     * @tc.desc Verify `arr.copyWithin(0, -10, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(0, -10, 2);
        let expectedArr = new BigInt64Array([1n, 2n, 3n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0750
     * @tc.name testBigInt64ArrayCopyWithinTwo0750
     * @tc.desc Verify `arr.copyWithin(1, 0, 10)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n]);
        arr.copyWithin(1, 0, 10);
        let expectedArr = new BigInt64Array([-1n, -1n, -2n]);
        for(let i=0;
        i<arr.length;
        i++) {;
        expect(arr[i]).assertEqual(expectedArr[i]);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0760
     * @tc.name testBigInt64ArrayCopyWithinTwo0760
     * @tc.desc Verify `arr.copyWithin(2)` keeps the array length equal to `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        arr.copyWithin(2);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0770
     * @tc.name testBigInt64ArrayCopyWithinTwo0770
     * @tc.desc Verify `arr.copyWithin(3)` keeps the array length equal to `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 6n, 7n, 8n]);
        arr.copyWithin(3);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0780
     * @tc.name testBigInt64ArrayCopyWithinTwo0780
     * @tc.desc Verify `arr.copyWithin(2)` keeps the array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        arr.copyWithin(2);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0790
     * @tc.name testBigInt64ArrayCopyWithinTwo0790
     * @tc.desc Verify `arr.copyWithin(10)` keeps the array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        arr.copyWithin(10);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0800
     * @tc.name testBigInt64ArrayCopyWithinTwo0800
     * @tc.desc Verify `arr.copyWithin(0)` keeps the array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(0);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0810
     * @tc.name testBigInt64ArrayCopyWithinTwo0810
     * @tc.desc Verify `arr.copyWithin(-1)` keeps the array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(-1);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0820
     * @tc.name testBigInt64ArrayCopyWithinTwo0820
     * @tc.desc Verify `arr.copyWithin(-5)` keeps the array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(-5);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0830
     * @tc.name testBigInt64ArrayCopyWithinTwo0830
     * @tc.desc Verify `arr.copyWithin(1)` keeps the array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n]);
        arr.copyWithin(1);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0840
     * @tc.name testBigInt64ArrayCopyWithinTwo0840
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([9223372036854775807n, 2n, 3n])[2]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0850
     * @tc.name testBigInt64ArrayCopyWithinTwo0850
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, 9223372036854775807n])[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 9223372036854775807n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0860
     * @tc.name testBigInt64ArrayCopyWithinTwo0860
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([9223372036854775807n, 2n, 3n, 4n])[1]` equals `9223372036854775807n`, `new BigInt64Array([9223372036854775807n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([9223372036854775807n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(9223372036854775807n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0870
     * @tc.name testBigInt64ArrayCopyWithinTwo0870
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, 9223372036854775807n, 3n, 4n])[0]` equals `9223372036854775807n`, `new BigInt64Array([1n, 9223372036854775807n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, 9223372036854775807n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 9223372036854775807n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(9223372036854775807n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0880
     * @tc.name testBigInt64ArrayCopyWithinTwo0880
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([9223372036854775807n, 92233720368, ...])[2]` equals `9223372036854775807n`, `new BigInt64Array([9223372036854775807n, 92233720368, ...])[3]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(9223372036854775807n);
        expect(arr[3]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0890
     * @tc.name testBigInt64ArrayCopyWithinTwo0890
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([9223372036854775807n])[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0900
     * @tc.name testBigInt64ArrayCopyWithinTwo0900
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([-9223372036854775808n, 2n, 3n])[2]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0910
     * @tc.name testBigInt64ArrayCopyWithinTwo0910
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, -9223372036854775808n])[0]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, -9223372036854775807n - 1n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0920
     * @tc.name testBigInt64ArrayCopyWithinTwo0920
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([-9223372036854775808n, 2n, 3n, 4n])[1]` equals `-9223372036854775808n`, `new BigInt64Array([-9223372036854775808n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([-9223372036854775808n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(-9223372036854775807n - 1n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0930
     * @tc.name testBigInt64ArrayCopyWithinTwo0930
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, -9223372036854775808n, 3n, 4n])[0]` equals `-9223372036854775808n`, `new BigInt64Array([1n, -9223372036854775808n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, -9223372036854775808n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -9223372036854775807n - 1n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0940
     * @tc.name testBigInt64ArrayCopyWithinTwo0940
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([-9223372036854775808n, -922337203, ...])[2]` equals `-9223372036854775808n`, `new BigInt64Array([-9223372036854775808n, -922337203, ...])[3]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -9223372036854775807n - 1n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
        expect(arr[3]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0950
     * @tc.name testBigInt64ArrayCopyWithinTwo0950
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([-9223372036854775808n])[0]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0960
     * @tc.name testBigInt64ArrayCopyWithinTwo0960
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([0n, 2n, 3n])[2]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0970
     * @tc.name testBigInt64ArrayCopyWithinTwo0970
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, 0n])[0]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 0n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0980
     * @tc.name testBigInt64ArrayCopyWithinTwo0980
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([0n, 2n, 3n, 4n])[1]` equals `0n`, `new BigInt64Array([0n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([0n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(0n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_0990
     * @tc.name testBigInt64ArrayCopyWithinTwo0990
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, 0n, 3n, 4n])[0]` equals `0n`, `new BigInt64Array([1n, 0n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, 0n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 0n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(0n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1000
     * @tc.name testBigInt64ArrayCopyWithinTwo1000
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([0n, 0n, 1n, 1n])[2]` equals `0n`, `new BigInt64Array([0n, 0n, 1n, 1n])[3]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(0n);
        expect(arr[3]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1010
     * @tc.name testBigInt64ArrayCopyWithinTwo1010
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([0n])[0]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1020
     * @tc.name testBigInt64ArrayCopyWithinTwo1020
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([1n, 2n, 3n])[2]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1030
     * @tc.name testBigInt64ArrayCopyWithinTwo1030
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, 1n])[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 1n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1040
     * @tc.name testBigInt64ArrayCopyWithinTwo1040
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([1n, 2n, 3n, 4n])[1]` equals `1n`, `new BigInt64Array([1n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([1n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(1n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1050
     * @tc.name testBigInt64ArrayCopyWithinTwo1050
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, 1n, 3n, 4n])[0]` equals `1n`, `new BigInt64Array([1n, 1n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, 1n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 1n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(1n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1060
     * @tc.name testBigInt64ArrayCopyWithinTwo1060
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([1n, 1n, 1n, 1n])[2]` equals `1n`, `new BigInt64Array([1n, 1n, 1n, 1n])[3]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 1n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(1n);
        expect(arr[3]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1070
     * @tc.name testBigInt64ArrayCopyWithinTwo1070
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([1n])[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1080
     * @tc.name testBigInt64ArrayCopyWithinTwo1080
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([-1n, 2n, 3n])[2]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1090
     * @tc.name testBigInt64ArrayCopyWithinTwo1090
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, -1n])[0]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, -1n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1100
     * @tc.name testBigInt64ArrayCopyWithinTwo1100
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([-1n, 2n, 3n, 4n])[1]` equals `-1n`, `new BigInt64Array([-1n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([-1n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(-1n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1110
     * @tc.name testBigInt64ArrayCopyWithinTwo1110
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, -1n, 3n, 4n])[0]` equals `-1n`, `new BigInt64Array([1n, -1n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, -1n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -1n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1120
     * @tc.name testBigInt64ArrayCopyWithinTwo1120
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([-1n, -1n, 1n, 1n])[2]` equals `-1n`, `new BigInt64Array([-1n, -1n, 1n, 1n])[3]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -1n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(-1n);
        expect(arr[3]).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1130
     * @tc.name testBigInt64ArrayCopyWithinTwo1130
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([-1n])[0]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1140
     * @tc.name testBigInt64ArrayCopyWithinTwo1140
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([0xABCDEF1234n, 2n, 3n])[2]` equals `0xABCDEF1234n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([737894404660n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(737894404660n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1150
     * @tc.name testBigInt64ArrayCopyWithinTwo1150
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, 0xABCDEF1234n])[0]` equals `0xABCDEF1234n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 737894404660n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(737894404660n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1160
     * @tc.name testBigInt64ArrayCopyWithinTwo1160
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([0xABCDEF1234n, 2n, 3n, 4n])[1]` equals `0xABCDEF1234n`, `new BigInt64Array([0xABCDEF1234n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([0xABCDEF1234n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([737894404660n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(737894404660n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1170
     * @tc.name testBigInt64ArrayCopyWithinTwo1170
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, 0xABCDEF1234n, 3n, 4n])[0]` equals `0xABCDEF1234n`, `new BigInt64Array([1n, 0xABCDEF1234n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, 0xABCDEF1234n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 737894404660n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(737894404660n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1180
     * @tc.name testBigInt64ArrayCopyWithinTwo1180
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([0xABCDEF1234n, 0xABCDEF1234n, 1n, 1n])[2]` equals `0xABCDEF1234n`, `new BigInt64Array([0xABCDEF1234n, 0xABCDEF1234n, 1n, 1n])[3]` equals `0xABCDEF1234n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([737894404660n, 737894404660n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(737894404660n);
        expect(arr[3]).assertEqual(737894404660n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1190
     * @tc.name testBigInt64ArrayCopyWithinTwo1190
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([0xABCDEF1234n])[0]` equals `0xABCDEF1234n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([737894404660n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(737894404660n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1200
     * @tc.name testBigInt64ArrayCopyWithinTwo1200
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([0b101010101n, 2n, 3n])[2]` equals `0b101010101n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([341n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(341n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1210
     * @tc.name testBigInt64ArrayCopyWithinTwo1210
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, 0b101010101n])[0]` equals `0b101010101n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 341n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(341n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1220
     * @tc.name testBigInt64ArrayCopyWithinTwo1220
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([0b101010101n, 2n, 3n, 4n])[1]` equals `0b101010101n`, `new BigInt64Array([0b101010101n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([0b101010101n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([341n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(341n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1230
     * @tc.name testBigInt64ArrayCopyWithinTwo1230
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, 0b101010101n, 3n, 4n])[0]` equals `0b101010101n`, `new BigInt64Array([1n, 0b101010101n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, 0b101010101n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 341n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(341n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1240
     * @tc.name testBigInt64ArrayCopyWithinTwo1240
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([0b101010101n, 0b101010101n, 1n, 1n])[2]` equals `0b101010101n`, `new BigInt64Array([0b101010101n, 0b101010101n, 1n, 1n])[3]` equals `0b101010101n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([341n, 341n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(341n);
        expect(arr[3]).assertEqual(341n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1250
     * @tc.name testBigInt64ArrayCopyWithinTwo1250
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([0b101010101n])[0]` equals `0b101010101n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([341n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(341n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1260
     * @tc.name testBigInt64ArrayCopyWithinTwo1260
     * @tc.desc Verify `arr.copyWithin(2, 0, 1)` produces a result where `new BigInt64Array([0o76543210n, 2n, 3n])[2]` equals `0o76543210n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([16434824n, 2n, 3n]);
        arr.copyWithin(2, 0, 1);
        expect(arr[2]).assertEqual(16434824n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1270
     * @tc.name testBigInt64ArrayCopyWithinTwo1270
     * @tc.desc Verify `arr.copyWithin(0, 2, 3)` produces a result where `new BigInt64Array([1n, 2n, 0o76543210n])[0]` equals `0o76543210n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 16434824n]);
        arr.copyWithin(0, 2, 3);
        expect(arr[0]).assertEqual(16434824n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1280
     * @tc.name testBigInt64ArrayCopyWithinTwo1280
     * @tc.desc Verify `arr.copyWithin(1, 0, 3)` produces a result where `new BigInt64Array([0o76543210n, 2n, 3n, 4n])[1]` equals `0o76543210n`, `new BigInt64Array([0o76543210n, 2n, 3n, 4n])[2]` equals `2n`, and `new BigInt64Array([0o76543210n, 2n, 3n, 4n])[3]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([16434824n, 2n, 3n, 4n]);
        arr.copyWithin(1, 0, 3);
        expect(arr[1]).assertEqual(16434824n);
        expect(arr[2]).assertEqual(2n);
        expect(arr[3]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1290
     * @tc.name testBigInt64ArrayCopyWithinTwo1290
     * @tc.desc Verify `arr.copyWithin(0, 1, 4)` produces a result where `new BigInt64Array([1n, 0o76543210n, 3n, 4n])[0]` equals `0o76543210n`, `new BigInt64Array([1n, 0o76543210n, 3n, 4n])[1]` equals `3n`, and `new BigInt64Array([1n, 0o76543210n, 3n, 4n])[2]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 16434824n, 3n, 4n]);
        arr.copyWithin(0, 1, 4);
        expect(arr[0]).assertEqual(16434824n);
        expect(arr[1]).assertEqual(3n);
        expect(arr[2]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1300
     * @tc.name testBigInt64ArrayCopyWithinTwo1300
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([0o76543210n, 0o76543210n, 1n, 1n])[2]` equals `0o76543210n`, `new BigInt64Array([0o76543210n, 0o76543210n, 1n, 1n])[3]` equals `0o76543210n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([16434824n, 16434824n, 1n, 1n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[2]).assertEqual(16434824n);
        expect(arr[3]).assertEqual(16434824n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1310
     * @tc.name testBigInt64ArrayCopyWithinTwo1310
     * @tc.desc Verify `arr.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([0o76543210n])[0]` equals `0o76543210n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([16434824n]);
        arr.copyWithin(0, 0, 1);
        expect(arr[0]).assertEqual(16434824n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1320
     * @tc.name testBigInt64ArrayCopyWithinTwo1320
     * @tc.desc Verify `arr.copyWithin(1, 0, 2)` updates the array to `[10n, 10n, 20n, 40n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(1, 0, 2);
        expect(arr[0]).assertEqual(10n);
        expect(arr[1]).assertEqual(10n);
        expect(arr[2]).assertEqual(20n);
        expect(arr[3]).assertEqual(40n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1330
     * @tc.name testBigInt64ArrayCopyWithinTwo1330
     * @tc.desc Verify `arr.copyWithin(1, 0, 2)` updates the array to `[-1n, -1n, -2n, -4n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(1, 0, 2);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(-1n);
        expect(arr[2]).assertEqual(-2n);
        expect(arr[3]).assertEqual(-4n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1340
     * @tc.name testBigInt64ArrayCopyWithinTwo1340
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` updates the array to `[10n, 20n, 10n, 20n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[0]).assertEqual(10n);
        expect(arr[1]).assertEqual(20n);
        expect(arr[2]).assertEqual(10n);
        expect(arr[3]).assertEqual(20n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1350
     * @tc.name testBigInt64ArrayCopyWithinTwo1350
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` updates the array to `[-1n, -2n, -1n, -2n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(2, 0, 2);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(-2n);
        expect(arr[2]).assertEqual(-1n);
        expect(arr[3]).assertEqual(-2n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1360
     * @tc.name testBigInt64ArrayCopyWithinTwo1360
     * @tc.desc Verify `arr.copyWithin(0, 1, 3)` updates the array to `[20n, 30n, 30n, 40n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(0, 1, 3);
        expect(arr[0]).assertEqual(20n);
        expect(arr[1]).assertEqual(30n);
        expect(arr[2]).assertEqual(30n);
        expect(arr[3]).assertEqual(40n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1370
     * @tc.name testBigInt64ArrayCopyWithinTwo1370
     * @tc.desc Verify `arr.copyWithin(0, 1, 3)` updates the array to `[-2n, -3n, -3n, -4n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(0, 1, 3);
        expect(arr[0]).assertEqual(-2n);
        expect(arr[1]).assertEqual(-3n);
        expect(arr[2]).assertEqual(-3n);
        expect(arr[3]).assertEqual(-4n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1380
     * @tc.name testBigInt64ArrayCopyWithinTwo1380
     * @tc.desc Verify `arr.copyWithin(0, 2, 4)` updates the array to `[30n, 40n, 30n, 40n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(0, 2, 4);
        expect(arr[0]).assertEqual(30n);
        expect(arr[1]).assertEqual(40n);
        expect(arr[2]).assertEqual(30n);
        expect(arr[3]).assertEqual(40n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1390
     * @tc.name testBigInt64ArrayCopyWithinTwo1390
     * @tc.desc Verify `arr.copyWithin(0, 2, 4)` updates the array to `[-3n, -4n, -3n, -4n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(0, 2, 4);
        expect(arr[0]).assertEqual(-3n);
        expect(arr[1]).assertEqual(-4n);
        expect(arr[2]).assertEqual(-3n);
        expect(arr[3]).assertEqual(-4n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1400
     * @tc.name testBigInt64ArrayCopyWithinTwo1400
     * @tc.desc Verify `arr.copyWithin(3, 0, 1)` updates the array to `[10n, 20n, 30n, 10n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(3, 0, 1);
        expect(arr[0]).assertEqual(10n);
        expect(arr[1]).assertEqual(20n);
        expect(arr[2]).assertEqual(30n);
        expect(arr[3]).assertEqual(10n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1410
     * @tc.name testBigInt64ArrayCopyWithinTwo1410
     * @tc.desc Verify `arr.copyWithin(3, 0, 1)` updates the array to `[-1n, -2n, -3n, -1n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(3, 0, 1);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(-2n);
        expect(arr[2]).assertEqual(-3n);
        expect(arr[3]).assertEqual(-1n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1420
     * @tc.name testBigInt64ArrayCopyWithinTwo1420
     * @tc.desc Verify `arr.copyWithin(1, 1, 3)` preserves `[10n, 20n, 30n, 40n, 50n]` when source and target start match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(1, 1, 3);
        expect(arr[0]).assertEqual(10n);
        expect(arr[1]).assertEqual(20n);
        expect(arr[2]).assertEqual(30n);
        expect(arr[3]).assertEqual(40n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1430
     * @tc.name testBigInt64ArrayCopyWithinTwo1430
     * @tc.desc Verify `arr.copyWithin(1, 1, 3)` preserves `[-1n, -2n, -3n, -4n, -5n]` when source and target start match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(1, 1, 3);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(-2n);
        expect(arr[2]).assertEqual(-3n);
        expect(arr[3]).assertEqual(-4n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1440
     * @tc.name testBigInt64ArrayCopyWithinTwo1440
     * @tc.desc Verify `arr.copyWithin(2, 3, 5)` updates the array to `[10n, 20n, 40n, 50n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(2, 3, 5);
        expect(arr[0]).assertEqual(10n);
        expect(arr[1]).assertEqual(20n);
        expect(arr[2]).assertEqual(40n);
        expect(arr[3]).assertEqual(50n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1450
     * @tc.name testBigInt64ArrayCopyWithinTwo1450
     * @tc.desc Verify `arr.copyWithin(2, 3, 5)` updates the array to `[-1n, -2n, -4n, -5n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(2, 3, 5);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(-2n);
        expect(arr[2]).assertEqual(-4n);
        expect(arr[3]).assertEqual(-5n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1460
     * @tc.name testBigInt64ArrayCopyWithinTwo1460
     * @tc.desc Verify `arr.copyWithin(1, 4, 5)` updates the array to `[10n, 50n, 30n, 40n, 50n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(1, 4, 5);
        expect(arr[0]).assertEqual(10n);
        expect(arr[1]).assertEqual(50n);
        expect(arr[2]).assertEqual(30n);
        expect(arr[3]).assertEqual(40n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1470
     * @tc.name testBigInt64ArrayCopyWithinTwo1470
     * @tc.desc Verify `arr.copyWithin(1, 4, 5)` updates the array to `[-1n, -5n, -3n, -4n, -5n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
        arr.copyWithin(1, 4, 5);
        expect(arr[0]).assertEqual(-1n);
        expect(arr[1]).assertEqual(-5n);
        expect(arr[2]).assertEqual(-3n);
        expect(arr[3]).assertEqual(-4n);
        expect(arr[4]).assertEqual(-5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1480
     * @tc.name testBigInt64ArrayCopyWithinTwo1480
     * @tc.desc Verify `arr.copyWithin(0, 0, 0)` produces a result where `new BigInt64Array([1n, 2n])[0]` equals `old_0`, `new BigInt64Array([1n, 2n])[1]` equals `old_1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let old_0 = arr[0];
        let old_1 = arr[1];
        arr.copyWithin(0, 0, 0);
        expect(arr[0]).assertEqual(old_0);
        expect(arr[1]).assertEqual(old_1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1490
     * @tc.name testBigInt64ArrayCopyWithinTwo1490
     * @tc.desc Verify `arr.copyWithin(1, 1, 1)` produces a result where `new BigInt64Array([1n, 2n])[0]` equals `old_0`, `new BigInt64Array([1n, 2n])[1]` equals `old_1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let old_0 = arr[0];
        let old_1 = arr[1];
        arr.copyWithin(1, 1, 1);
        expect(arr[0]).assertEqual(old_0);
        expect(arr[1]).assertEqual(old_1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1500
     * @tc.name testBigInt64ArrayCopyWithinTwo1500
     * @tc.desc Verify `arr.copyWithin(0, 2, 1)` produces a result where `new BigInt64Array([1n, 2n])[0]` equals `old_0`, `new BigInt64Array([1n, 2n])[1]` equals `old_1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let old_0 = arr[0];
        let old_1 = arr[1];
        arr.copyWithin(0, 2, 1);
        expect(arr[0]).assertEqual(old_0);
        expect(arr[1]).assertEqual(old_1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1510
     * @tc.name testBigInt64ArrayCopyWithinTwo1510
     * @tc.desc Verify `arr.copyWithin(-1, -1, -2)` produces a result where `new BigInt64Array([1n, 2n])[0]` equals `old_0`, `new BigInt64Array([1n, 2n])[1]` equals `old_1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let old_0 = arr[0];
        let old_1 = arr[1];
        arr.copyWithin(-1, -1, -2);
        expect(arr[0]).assertEqual(old_0);
        expect(arr[1]).assertEqual(old_1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_TWO_1520
     * @tc.name testBigInt64ArrayCopyWithinTwo1520
     * @tc.desc Verify `arr.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([1n, 2n])[0]` equals `old_0`, `new BigInt64Array([1n, 2n])[1]` equals `old_1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinTwo1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let old_0 = arr[0];
        let old_1 = arr[1];
        arr.copyWithin(2, 0, 2);
        expect(arr[0]).assertEqual(old_0);
        expect(arr[1]).assertEqual(old_1);
      });

  });
}
