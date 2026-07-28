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

export default function BigInt64ArrayFill03Test(): void {
  describe('BigInt64ArrayFill03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0100
     * @tc.name testBigInt64ArrayFillThree0100
     * @tc.desc Verify `arr.fill(88n, 4, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 1);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0200
     * @tc.name testBigInt64ArrayFillThree0200
     * @tc.desc Verify `arr.fill(88n, 4, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 2);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0300
     * @tc.name testBigInt64ArrayFillThree0300
     * @tc.desc Verify `arr.fill(88n, 4, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 4);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0400
     * @tc.name testBigInt64ArrayFillThree0400
     * @tc.desc Verify `arr.fill(88n, 4, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 4 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0500
     * @tc.name testBigInt64ArrayFillThree0500
     * @tc.desc Verify `arr.fill(88n, 4, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 4 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0600
     * @tc.name testBigInt64ArrayFillThree0600
     * @tc.desc Verify `arr.fill(88n, 4, -1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, -1);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0700
     * @tc.name testBigInt64ArrayFillThree0700
     * @tc.desc Verify `arr.fill(88n, 4, -2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, -2);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0800
     * @tc.name testBigInt64ArrayFillThree0800
     * @tc.desc Verify `arr.fill(88n, 4, -4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, -4);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_0900
     * @tc.name testBigInt64ArrayFillThree0900
     * @tc.desc Verify `arr.fill(88n, 4, -5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, -5);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1000
     * @tc.name testBigInt64ArrayFillThree1000
     * @tc.desc Verify `arr.fill(88n, 4, -6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, -6);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1100
     * @tc.name testBigInt64ArrayFillThree1100
     * @tc.desc Verify `arr.fill(88n, 4, 0x3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 0x3);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1200
     * @tc.name testBigInt64ArrayFillThree1200
     * @tc.desc Verify `arr.fill(88n, 4, 0b100)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, 4, 0b100);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1300
     * @tc.name testBigInt64ArrayFillThree1300
     * @tc.desc Verify `arr.fill(88n, -1, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 0);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1400
     * @tc.name testBigInt64ArrayFillThree1400
     * @tc.desc Verify `arr.fill(88n, -1, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 1);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1500
     * @tc.name testBigInt64ArrayFillThree1500
     * @tc.desc Verify `arr.fill(88n, -1, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 2);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1600
     * @tc.name testBigInt64ArrayFillThree1600
     * @tc.desc Verify `arr.fill(88n, -1, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 4);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1700
     * @tc.name testBigInt64ArrayFillThree1700
     * @tc.desc Verify `arr.fill(88n, -1, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 4 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1800
     * @tc.name testBigInt64ArrayFillThree1800
     * @tc.desc Verify `arr.fill(88n, -1, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 4 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_1900
     * @tc.name testBigInt64ArrayFillThree1900
     * @tc.desc Verify `arr.fill(88n, -1, -1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, -1);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2000
     * @tc.name testBigInt64ArrayFillThree2000
     * @tc.desc Verify `arr.fill(88n, -1, -2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, -2);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2100
     * @tc.name testBigInt64ArrayFillThree2100
     * @tc.desc Verify `arr.fill(88n, -1, -4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, -4);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2200
     * @tc.name testBigInt64ArrayFillThree2200
     * @tc.desc Verify `arr.fill(88n, -1, -5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, -5);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2300
     * @tc.name testBigInt64ArrayFillThree2300
     * @tc.desc Verify `arr.fill(88n, -1, -6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, -6);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2400
     * @tc.name testBigInt64ArrayFillThree2400
     * @tc.desc Verify `arr.fill(88n, -1, 0x3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 0x3);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2500
     * @tc.name testBigInt64ArrayFillThree2500
     * @tc.desc Verify `arr.fill(88n, -1, 0b100)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -1, 0b100);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2600
     * @tc.name testBigInt64ArrayFillThree2600
     * @tc.desc Verify `arr.fill(88n, -4, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 0);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2700
     * @tc.name testBigInt64ArrayFillThree2700
     * @tc.desc Verify `arr.fill(88n, -4, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 1);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2800
     * @tc.name testBigInt64ArrayFillThree2800
     * @tc.desc Verify `arr.fill(88n, -4, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 2);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 2) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_2900
     * @tc.name testBigInt64ArrayFillThree2900
     * @tc.desc Verify `arr.fill(88n, -4, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 4);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3000
     * @tc.name testBigInt64ArrayFillThree3000
     * @tc.desc Verify `arr.fill(88n, -4, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3100
     * @tc.name testBigInt64ArrayFillThree3100
     * @tc.desc Verify `arr.fill(88n, -4, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 5) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3200
     * @tc.name testBigInt64ArrayFillThree3200
     * @tc.desc Verify `arr.fill(88n, -4, -1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, -1);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3300
     * @tc.name testBigInt64ArrayFillThree3300
     * @tc.desc Verify `arr.fill(88n, -4, -2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, -2);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 3) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3400
     * @tc.name testBigInt64ArrayFillThree3400
     * @tc.desc Verify `arr.fill(88n, -4, -4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, -4);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3500
     * @tc.name testBigInt64ArrayFillThree3500
     * @tc.desc Verify `arr.fill(88n, -4, -5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, -5);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3600
     * @tc.name testBigInt64ArrayFillThree3600
     * @tc.desc Verify `arr.fill(88n, -4, -6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, -6);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3700
     * @tc.name testBigInt64ArrayFillThree3700
     * @tc.desc Verify `arr.fill(88n, -4, 0x3)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 0x3);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 3) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3800
     * @tc.name testBigInt64ArrayFillThree3800
     * @tc.desc Verify `arr.fill(88n, -4, 0b100)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -4, 0b100);
      for (let i = 0; i < 5; i++) {
        if (i >= 1 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_3900
     * @tc.name testBigInt64ArrayFillThree3900
     * @tc.desc Verify `arr.fill(88n, -6, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -6, 0);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_4000
     * @tc.name testBigInt64ArrayFillThree4000
     * @tc.desc Verify `arr.fill(88n, -6, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -6, 1);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 1) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_4100
     * @tc.name testBigInt64ArrayFillThree4100
     * @tc.desc Verify `arr.fill(88n, -6, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -6, 2);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 2) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_4200
     * @tc.name testBigInt64ArrayFillThree4200
     * @tc.desc Verify `arr.fill(88n, -6, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -6, 4);
      for (let i = 0; i < 5; i++) {
        if (i >= 0 && i < 4) {
          expect(arr[i]).assertEqual(88n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_4300
     * @tc.name testBigInt64ArrayFillThree4300
     * @tc.desc Verify `arr.fill(88n, -6, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -6, 5);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(88n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_THREE_4400
     * @tc.name testBigInt64ArrayFillThree4400
     * @tc.desc Verify `arr.fill(88n, -6, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillThree4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(88n, -6, 6);
      for (let i = 0; i < 5; i++) {
        expect(arr[i]).assertEqual(88n);
      }
    });

  });
}
