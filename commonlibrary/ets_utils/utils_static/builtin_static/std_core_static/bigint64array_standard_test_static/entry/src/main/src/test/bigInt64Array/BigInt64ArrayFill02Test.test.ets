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

export default function BigInt64ArrayFill02Test(): void {
  describe('BigInt64ArrayFill02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0100
     * @tc.name testBigInt64ArrayFillTwo0100
     * @tc.desc Verify `arr.fill(-99n, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-99n, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 5) {
          expect(arr[i]).assertEqual(-99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0200
     * @tc.name testBigInt64ArrayFillTwo0200
     * @tc.desc Verify `arr.fill(99n, -1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, -1);
      for (let i = 0; i < 5; i++) {
        if (i >= 4) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0300
     * @tc.name testBigInt64ArrayFillTwo0300
     * @tc.desc Verify `arr.fill(99n, -2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, -2);
      for (let i = 0; i < 5; i++) {
        if (i >= 3) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0400
     * @tc.name testBigInt64ArrayFillTwo0400
     * @tc.desc Verify `arr.fill(99n, -4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, -4);
      for (let i = 0; i < 5; i++) {
        if (i >= 1) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0500
     * @tc.name testBigInt64ArrayFillTwo0500
     * @tc.desc Verify `arr.fill(99n, -5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, -5);
      for (let i = 0; i < 5; i++) {
        if (i >= 0) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0600
     * @tc.name testBigInt64ArrayFillTwo0600
     * @tc.desc Verify `arr.fill(99n, -6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, -6);
      for (let i = 0; i < 5; i++) {
        if (i >= 0) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0700
     * @tc.name testBigInt64ArrayFillTwo0700
     * @tc.desc Verify `arr.fill(99n, 0x2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 0x2);
      for (let i = 0; i < 5; i++) {
        if (i >= 2) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0800
     * @tc.name testBigInt64ArrayFillTwo0800
     * @tc.desc Verify `arr.fill(99n, 0o3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 0o3);
      for (let i = 0; i < 5; i++) {
        if (i >= 3) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_0900
     * @tc.name testBigInt64ArrayFillTwo0900
     * @tc.desc Verify `arr.fill(88n, 0, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 0);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1000
     * @tc.name testBigInt64ArrayFillTwo1000
     * @tc.desc Verify `arr.fill(88n, 0, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 1);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 1) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1100
     * @tc.name testBigInt64ArrayFillTwo1100
     * @tc.desc Verify `arr.fill(88n, 0, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 2);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 2) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1200
     * @tc.name testBigInt64ArrayFillTwo1200
     * @tc.desc Verify `arr.fill(88n, 0, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 4);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1300
     * @tc.name testBigInt64ArrayFillTwo1300
     * @tc.desc Verify `arr.fill(88n, 0, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1400
     * @tc.name testBigInt64ArrayFillTwo1400
     * @tc.desc Verify `arr.fill(88n, 0, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1500
     * @tc.name testBigInt64ArrayFillTwo1500
     * @tc.desc Verify `arr.fill(88n, 0, -1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, -1);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1600
     * @tc.name testBigInt64ArrayFillTwo1600
     * @tc.desc Verify `arr.fill(88n, 0, -2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, -2);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 3) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1700
     * @tc.name testBigInt64ArrayFillTwo1700
     * @tc.desc Verify `arr.fill(88n, 0, -4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, -4);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 1) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1800
     * @tc.name testBigInt64ArrayFillTwo1800
     * @tc.desc Verify `arr.fill(88n, 0, -5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, -5);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_1900
     * @tc.name testBigInt64ArrayFillTwo1900
     * @tc.desc Verify `arr.fill(88n, 0, -6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, -6);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2000
     * @tc.name testBigInt64ArrayFillTwo2000
     * @tc.desc Verify `arr.fill(88n, 0, 0x3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 0x3);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 3) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2100
     * @tc.name testBigInt64ArrayFillTwo2100
     * @tc.desc Verify `arr.fill(88n, 0, 0b100)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 0, 0b100);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2200
     * @tc.name testBigInt64ArrayFillTwo2200
     * @tc.desc Verify `arr.fill(88n, 2, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 0);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2300
     * @tc.name testBigInt64ArrayFillTwo2300
     * @tc.desc Verify `arr.fill(88n, 2, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 1);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 1) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2400
     * @tc.name testBigInt64ArrayFillTwo2400
     * @tc.desc Verify `arr.fill(88n, 2, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 2);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 2) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2500
     * @tc.name testBigInt64ArrayFillTwo2500
     * @tc.desc Verify `arr.fill(88n, 2, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 4);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2600
     * @tc.name testBigInt64ArrayFillTwo2600
     * @tc.desc Verify `arr.fill(88n, 2, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2700
     * @tc.name testBigInt64ArrayFillTwo2700
     * @tc.desc Verify `arr.fill(88n, 2, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2800
     * @tc.name testBigInt64ArrayFillTwo2800
     * @tc.desc Verify `arr.fill(88n, 2, -1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, -1);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_2900
     * @tc.name testBigInt64ArrayFillTwo2900
     * @tc.desc Verify `arr.fill(88n, 2, -2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, -2);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 3) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_3000
     * @tc.name testBigInt64ArrayFillTwo3000
     * @tc.desc Verify `arr.fill(88n, 2, -4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, -4);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 1) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_3100
     * @tc.name testBigInt64ArrayFillTwo3100
     * @tc.desc Verify `arr.fill(88n, 2, -5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, -5);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_3200
     * @tc.name testBigInt64ArrayFillTwo3200
     * @tc.desc Verify `arr.fill(88n, 2, -6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, -6);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_3300
     * @tc.name testBigInt64ArrayFillTwo3300
     * @tc.desc Verify `arr.fill(88n, 2, 0x3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 0x3);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 3) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_3400
     * @tc.name testBigInt64ArrayFillTwo3400
     * @tc.desc Verify `arr.fill(88n, 2, 0b100)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 2, 0b100);
      for (let i = 0; i < 5; i++) {
        if (i >= 2 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_TWO_3500
     * @tc.name testBigInt64ArrayFillTwo3500
     * @tc.desc Verify `arr.fill(88n, 4, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 0);
      for (let i = 0; i < 5; i++) {
        if (i >= 4 && i < 0) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

  });
}
