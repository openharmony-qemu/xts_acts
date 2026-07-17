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

export default function BigInt64ArrayConstructor02Test(): void {
  describe('BigInt64ArrayConstructor02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testBigInt64ArrayConstructorTwo0100
     * @tc.desc Verify construction from an array preserves representative BigInt64 boundary values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let max = 9223372036854775807n;
      let arr = new BigInt64Array([min, -15n, 0n, 15n, max]);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(min);
      expect(arr.$_get(1)).assertEqual(-15n);
      expect(arr.$_get(2)).assertEqual(0n);
      expect(arr.$_get(3)).assertEqual(15n);
      expect(arr.$_get(4)).assertEqual(max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testBigInt64ArrayConstructorTwo0200
     * @tc.desc Verify an empty ArrayBuffer creates an empty view with zero offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new BigInt64Array(buf);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testBigInt64ArrayConstructorTwo0300
     * @tc.desc Verify an aligned ArrayBuffer is fully covered when byteOffset and length are omitted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(16);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testBigInt64ArrayConstructorTwo0400
     * @tc.desc Verify explicit undefined byteOffset and length cover the entire buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: BigInt64Array = new BigInt64Array(buf, undefined, undefined);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(32);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testBigInt64ArrayConstructorTwo0500
     * @tc.desc Verify undefined byteOffset defaults to zero when an explicit length is provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(40);
      let arr: BigInt64Array = new BigInt64Array(buf, undefined, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(24);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testBigInt64ArrayConstructorTwo0600
     * @tc.desc Verify undefined length uses all aligned bytes remaining after a nonzero byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(48);
      let arr: BigInt64Array = new BigInt64Array(buf, 16, undefined);
      expect(arr.length).assertEqual(4);
      expect(arr.byteLength).assertEqual(32);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testBigInt64ArrayConstructorTwo0700
     * @tc.desc Verify an unaligned byteOffset throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      try {
        new BigInt64Array(buf, 1, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testBigInt64ArrayConstructorTwo0800
     * @tc.desc Verify an explicit zero length creates an empty view on a nonempty buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: BigInt64Array = new BigInt64Array(buf, undefined, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testBigInt64ArrayConstructorTwo0900
     * @tc.desc Verify a zero-length view can start exactly at the end of the buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf, 8, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testBigInt64ArrayConstructorTwo1000
     * @tc.desc Verify a zero-length view with a nonzero aligned offset keeps the requested offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testBigInt64ArrayConstructorTwo1100
     * @tc.desc Verify an offset view can consume all remaining aligned bytes in a small buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(24);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1200
     * @tc.name testBigInt64ArrayConstructorTwo1200
     * @tc.desc Verify a one-element tail view shares writes with another view of the same buffer region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 24, 1);
      arr.$_set(0, 5n);
      let view = new BigInt64Array(buf, 24, 1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.byteOffset).assertEqual(24);
      expect(view.$_get(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1300
     * @tc.name testBigInt64ArrayConstructorTwo1300
     * @tc.desc Verify an explicit length can cover a complete 64-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 0, 8);
      expect(arr.length).assertEqual(8);
      expect(arr.byteLength).assertEqual(64);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1400
     * @tc.name testBigInt64ArrayConstructorTwo1400
     * @tc.desc Verify the maximum valid length after a 16-byte offset in a 64-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 16, 6);
      expect(arr.length).assertEqual(6);
      expect(arr.byteLength).assertEqual(48);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1500
     * @tc.name testBigInt64ArrayConstructorTwo1500
     * @tc.desc Verify an explicit maximum length can cover a complete 128-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(128);
      let arr = new BigInt64Array(buf, 0, 16);
      expect(arr.length).assertEqual(16);
      expect(arr.byteLength).assertEqual(128);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1600
     * @tc.name testBigInt64ArrayConstructorTwo1600
     * @tc.desc Verify the maximum valid length after an 8-byte offset in a 128-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(128);
      let arr = new BigInt64Array(buf, 8, 15);
      expect(arr.length).assertEqual(15);
      expect(arr.byteLength).assertEqual(120);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1700
     * @tc.name testBigInt64ArrayConstructorTwo1700
     * @tc.desc Verify the maximum valid length after a 24-byte offset in a 128-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(128);
      let arr = new BigInt64Array(buf, 24, 13);
      expect(arr.length).assertEqual(13);
      expect(arr.byteLength).assertEqual(104);
      expect(arr.byteOffset).assertEqual(24);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1800
     * @tc.name testBigInt64ArrayConstructorTwo1800
     * @tc.desc Verify an explicit maximum length can cover a complete 256-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(256);
      let arr = new BigInt64Array(buf, 0, 32);
      expect(arr.length).assertEqual(32);
      expect(arr.byteLength).assertEqual(256);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1900
     * @tc.name testBigInt64ArrayConstructorTwo1900
     * @tc.desc Verify the maximum valid length after an 8-byte offset in a 256-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(256);
      let arr = new BigInt64Array(buf, 8, 31);
      expect(arr.length).assertEqual(31);
      expect(arr.byteLength).assertEqual(248);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_2000
     * @tc.name testBigInt64ArrayConstructorTwo2000
     * @tc.desc Verify the maximum valid length after a 24-byte offset in a 256-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(256);
      let arr = new BigInt64Array(buf, 24, 29);
      expect(arr.length).assertEqual(29);
      expect(arr.byteLength).assertEqual(232);
      expect(arr.byteOffset).assertEqual(24);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_2100
     * @tc.name testBigInt64ArrayConstructorTwo2100
     * @tc.desc Verify a partial view on a large buffer has the requested size and shares writes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1024);
      let arr = new BigInt64Array(buf, 0, 32);
      arr.$_set(0, 5n);
      let view = new BigInt64Array(buf, 0, 1);
      expect(arr.length).assertEqual(32);
      expect(arr.byteLength).assertEqual(256);
      expect(arr.byteOffset).assertEqual(0);
      expect(view.$_get(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_2200
     * @tc.name testBigInt64ArrayConstructorTwo2200
     * @tc.desc Verify a large non-power-of-two length creates the requested partial view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1024);
      let arr = new BigInt64Array(buf, 0, 100);
      expect(arr.length).assertEqual(100);
      expect(arr.byteLength).assertEqual(800);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_2300
     * @tc.name testBigInt64ArrayConstructorTwo2300
     * @tc.desc Verify an explicit maximum length can cover a complete 1024-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1024);
      let arr = new BigInt64Array(buf, 0, 128);
      expect(arr.length).assertEqual(128);
      expect(arr.byteLength).assertEqual(1024);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_2400
     * @tc.name testBigInt64ArrayConstructorTwo2400
     * @tc.desc Verify the maximum valid length after an 8-byte offset in a 1024-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1024);
      let arr = new BigInt64Array(buf, 8, 127);
      expect(arr.length).assertEqual(127);
      expect(arr.byteLength).assertEqual(1016);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.buffer).assertEqual(buf);
    });

  });
}
