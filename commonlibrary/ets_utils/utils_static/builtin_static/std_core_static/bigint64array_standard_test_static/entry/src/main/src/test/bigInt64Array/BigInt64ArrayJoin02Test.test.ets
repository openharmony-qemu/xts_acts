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

export default function BigInt64ArrayJoin02Test(): void {
  describe('BigInt64ArrayJoin02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0010
     * @tc.name testBigInt64ArrayJoinTwo0010
     * @tc.desc Verify string type for empty array without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0020
     * @tc.name testBigInt64ArrayJoinTwo0020
     * @tc.desc Verify string type for empty array with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join("");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0030
     * @tc.name testBigInt64ArrayJoinTwo0030
     * @tc.desc Verify string type for empty array with char separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join(",");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0040
     * @tc.name testBigInt64ArrayJoinTwo0040
     * @tc.desc Verify string type for empty array with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join("😀");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0050
     * @tc.name testBigInt64ArrayJoinTwo0050
     * @tc.desc Verify string type for [1n] without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0060
     * @tc.name testBigInt64ArrayJoinTwo0060
     * @tc.desc Verify string type for [1n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join("");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0070
     * @tc.name testBigInt64ArrayJoinTwo0070
     * @tc.desc Verify string type for [1n] with char separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join(",");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0080
     * @tc.name testBigInt64ArrayJoinTwo0080
     * @tc.desc Verify string type for [1n] with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join("😀");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0090
     * @tc.name testBigInt64ArrayJoinTwo0090
     * @tc.desc Verify string type for [1n, 2n] without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0100
     * @tc.name testBigInt64ArrayJoinTwo0100
     * @tc.desc Verify string type for [1n, 2n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0110
     * @tc.name testBigInt64ArrayJoinTwo0110
     * @tc.desc Verify string type for [1n, 2n] with char separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join(",");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0120
     * @tc.name testBigInt64ArrayJoinTwo0120
     * @tc.desc Verify string type for [1n, 2n] with Chinese separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0120',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("测试");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0130
     * @tc.name testBigInt64ArrayJoinTwo0130
     * @tc.desc Verify string type for [1n, 2n] with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0130',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("😀");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0140
     * @tc.name testBigInt64ArrayJoinTwo0140
     * @tc.desc Verify string type for [1n, 2n, 3n] without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0140',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0150
     * @tc.name testBigInt64ArrayJoinTwo0150
     * @tc.desc Verify string type for [1n, 2n, 3n] with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0150',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("-");
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0160
     * @tc.name testBigInt64ArrayJoinTwo0160
     * @tc.desc Verify string type for negative bigint elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0160',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n, -2n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0170
     * @tc.name testBigInt64ArrayJoinTwo0170
     * @tc.desc Verify string type for maximum bigint element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0170',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0180
     * @tc.name testBigInt64ArrayJoinTwo0180
     * @tc.desc Verify string type for minimum bigint element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0180',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-9223372036854775808n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0190
     * @tc.name testBigInt64ArrayJoinTwo0190
     * @tc.desc Verify string type for zero bigint elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0190',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([0n, 0n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0200
     * @tc.name testBigInt64ArrayJoinTwo0200
     * @tc.desc Verify string type for hexadecimal bigint elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0210
     * @tc.name testBigInt64ArrayJoinTwo0210
     * @tc.desc Verify empty value for empty array without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0210',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join();
        expect(res).assertEqual("");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0220
     * @tc.name testBigInt64ArrayJoinTwo0220
     * @tc.desc Verify empty value for empty array with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0220',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join("");
        expect(res).assertEqual("");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0230
     * @tc.name testBigInt64ArrayJoinTwo0230
     * @tc.desc Verify empty value for empty array with comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0230',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join(",");
        expect(res).assertEqual("");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0240
     * @tc.name testBigInt64ArrayJoinTwo0240
     * @tc.desc Verify empty value for empty array with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0240',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join("😀");
        expect(res).assertEqual("");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0250
     * @tc.name testBigInt64ArrayJoinTwo0250
     * @tc.desc Verify value for [1n] without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0250',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join();
        expect(res).assertEqual("1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0260
     * @tc.name testBigInt64ArrayJoinTwo0260
     * @tc.desc Verify value for [1n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0260',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join("");
        expect(res).assertEqual("1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0270
     * @tc.name testBigInt64ArrayJoinTwo0270
     * @tc.desc Verify value for [1n] with comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0270',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join(",");
        expect(res).assertEqual("1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0280
     * @tc.name testBigInt64ArrayJoinTwo0280
     * @tc.desc Verify value for [1n] with char separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0280',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join("A");
        expect(res).assertEqual("1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0290
     * @tc.name testBigInt64ArrayJoinTwo0290
     * @tc.desc Verify value for [1n] with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0290',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join("😀");
        expect(res).assertEqual("1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0300
     * @tc.name testBigInt64ArrayJoinTwo0300
     * @tc.desc Verify value for [0n] without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([0n]);
        let res = arr.join();
        expect(res).assertEqual("0");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0310
     * @tc.name testBigInt64ArrayJoinTwo0310
     * @tc.desc Verify value for [-1n] without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0310',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n]);
        let res = arr.join();
        expect(res).assertEqual("-1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0320
     * @tc.name testBigInt64ArrayJoinTwo0320
     * @tc.desc Verify value for max bigint without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0320',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        let res = arr.join();
        expect(res).assertEqual("9223372036854775807");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0330
     * @tc.name testBigInt64ArrayJoinTwo0330
     * @tc.desc Verify value for min bigint without separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0330',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-9223372036854775808n]);
        let res = arr.join();
        expect(res).assertEqual("-9223372036854775808");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0340
     * @tc.name testBigInt64ArrayJoinTwo0340
     * @tc.desc Verify value for [1n, 2n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0340',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join();
        expect(res).assertEqual("1,2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0350
     * @tc.name testBigInt64ArrayJoinTwo0350
     * @tc.desc Verify value for [1n, 2n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0350',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("");
        expect(res).assertEqual("12");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0360
     * @tc.name testBigInt64ArrayJoinTwo0360
     * @tc.desc Verify value for [1n, 2n] with comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0360',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join(",");
        expect(res).assertEqual("1,2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0370
     * @tc.name testBigInt64ArrayJoinTwo0370
     * @tc.desc Verify value for [1n, 2n] with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0370',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("-");
        expect(res).assertEqual("1-2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0380
     * @tc.name testBigInt64ArrayJoinTwo0380
     * @tc.desc Verify value for [1n, 2n] with multi-char separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0380',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("++");
        expect(res).assertEqual("1++2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0390
     * @tc.name testBigInt64ArrayJoinTwo0390
     * @tc.desc Verify value for [1n, 2n] with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0390',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("😀");
        expect(res).assertEqual("1😀2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0400
     * @tc.name testBigInt64ArrayJoinTwo0400
     * @tc.desc Verify value for [1n, 2n] with Chinese separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("测试");
        expect(res).assertEqual("1测试2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0410
     * @tc.name testBigInt64ArrayJoinTwo0410
     * @tc.desc Verify value for [10n, 20n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0410',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let res = arr.join();
        expect(res).assertEqual("10,20");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0420
     * @tc.name testBigInt64ArrayJoinTwo0420
     * @tc.desc Verify value for [10n, 20n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0420',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let res = arr.join("");
        expect(res).assertEqual("1020");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0430
     * @tc.name testBigInt64ArrayJoinTwo0430
     * @tc.desc Verify value for [0n, 0n] with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0430',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([0n, 0n]);
        let res = arr.join("-");
        expect(res).assertEqual("0-0");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0440
     * @tc.name testBigInt64ArrayJoinTwo0440
     * @tc.desc Verify value for [-1n, -2n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0440',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n, -2n]);
        let res = arr.join("");
        expect(res).assertEqual("-1-2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0450
     * @tc.name testBigInt64ArrayJoinTwo0450
     * @tc.desc Verify value for [-1n, -2n] with comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0450',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n, -2n]);
        let res = arr.join(",");
        expect(res).assertEqual("-1,-2");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0460
     * @tc.name testBigInt64ArrayJoinTwo0460
     * @tc.desc Verify value for [max, 0n] with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0460',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 0n]);
        let res = arr.join("-");
        expect(res).assertEqual("9223372036854775807-0");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0470
     * @tc.name testBigInt64ArrayJoinTwo0470
     * @tc.desc Verify value for [min, 0n] with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0470',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-9223372036854775808n, 0n]);
        let res = arr.join("-");
        expect(res).assertEqual("-9223372036854775808-0");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0480
     * @tc.name testBigInt64ArrayJoinTwo0480
     * @tc.desc Verify value for [1n, 2n, 3n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0480',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join();
        expect(res).assertEqual("1,2,3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0490
     * @tc.name testBigInt64ArrayJoinTwo0490
     * @tc.desc Verify value for [1n, 2n, 3n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0490',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("");
        expect(res).assertEqual("123");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0500
     * @tc.name testBigInt64ArrayJoinTwo0500
     * @tc.desc Verify value for [1n, 2n, 3n] with comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join(",");
        expect(res).assertEqual("1,2,3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0510
     * @tc.name testBigInt64ArrayJoinTwo0510
     * @tc.desc Verify value for [1n, 2n, 3n] with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0510',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("-");
        expect(res).assertEqual("1-2-3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0520
     * @tc.name testBigInt64ArrayJoinTwo0520
     * @tc.desc Verify value for [1n, 2n, 3n] with space separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0520',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join(" ");
        expect(res).assertEqual("1 2 3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0530
     * @tc.name testBigInt64ArrayJoinTwo0530
     * @tc.desc Verify value for [1n, 2n, 3n, 4n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0530',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
        let res = arr.join("");
        expect(res).assertEqual("1234");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0540
     * @tc.name testBigInt64ArrayJoinTwo0540
     * @tc.desc Verify value for hex bigint array with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0540',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("");
        expect(res).assertEqual("123");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0550
     * @tc.name testBigInt64ArrayJoinTwo0550
     * @tc.desc Verify value for oct bigint array with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0550',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("-");
        expect(res).assertEqual("1-2-3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0560
     * @tc.name testBigInt64ArrayJoinTwo0560
     * @tc.desc Verify value for binary bigint array with underscore separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0560',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        // The original mindmap uses invalid binary bigint literals 0b2n and 0b3n.
        // Use equivalent decimal bigint values and keep the expected join result.
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("_");
        expect(res).assertEqual("1_2_3");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0570
     * @tc.name testBigInt64ArrayJoinTwo0570
     * @tc.desc Verify length for empty array with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0570',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join();
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0580
     * @tc.name testBigInt64ArrayJoinTwo0580
     * @tc.desc Verify length for empty array with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0580',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.join("😀");
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0590
     * @tc.name testBigInt64ArrayJoinTwo0590
     * @tc.desc Verify length for [1n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0590',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.join();
        expect(res.length).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0600
     * @tc.name testBigInt64ArrayJoinTwo0600
     * @tc.desc Verify length for [-1n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n]);
        let res = arr.join();
        expect(res.length).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0610
     * @tc.name testBigInt64ArrayJoinTwo0610
     * @tc.desc Verify length for max bigint with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0610',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        let res = arr.join();
        expect(res.length).assertEqual(19);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0620
     * @tc.name testBigInt64ArrayJoinTwo0620
     * @tc.desc Verify length for min bigint with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0620',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-9223372036854775808n]);
        let res = arr.join();
        expect(res.length).assertEqual(20);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0630
     * @tc.name testBigInt64ArrayJoinTwo0630
     * @tc.desc Verify length for [1n, 2n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0630',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join();
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0640
     * @tc.name testBigInt64ArrayJoinTwo0640
     * @tc.desc Verify length for [1n, 2n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0640',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("");
        expect(res.length).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0650
     * @tc.name testBigInt64ArrayJoinTwo0650
     * @tc.desc Verify length for [1n, 2n] with double hyphen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0650',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("--");
        expect(res.length).assertEqual(4);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0660
     * @tc.name testBigInt64ArrayJoinTwo0660
     * @tc.desc Verify length for [1n, 2n] with emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0660',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res = arr.join("😀");
        expect(res.length).assertEqual(4);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0670
     * @tc.name testBigInt64ArrayJoinTwo0670
     * @tc.desc Verify length for [10n, 20n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0670',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let res = arr.join("");
        expect(res.length).assertEqual(4);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0680
     * @tc.name testBigInt64ArrayJoinTwo0680
     * @tc.desc Verify length for [1000n, 2000n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0680',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1000n, 2000n]);
        let res = arr.join("");
        expect(res.length).assertEqual(8);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0690
     * @tc.name testBigInt64ArrayJoinTwo0690
     * @tc.desc Verify length for [1n, 2n, 3n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0690',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join();
        expect(res.length).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0700
     * @tc.name testBigInt64ArrayJoinTwo0700
     * @tc.desc Verify length for [1n, 2n, 3n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("");
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0710
     * @tc.name testBigInt64ArrayJoinTwo0710
     * @tc.desc Verify length for [1n, 2n, 3n] with double hyphen.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0710',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.join("--");
        expect(res.length).assertEqual(7);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0720
     * @tc.name testBigInt64ArrayJoinTwo0720
     * @tc.desc Verify length for hex bigint array with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0720',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([10n, 11n]);
        let res = arr.join();
        expect(res.length).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0730
     * @tc.name testBigInt64ArrayJoinTwo0730
     * @tc.desc Verify length for oct bigint array with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0730',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([8n, 16n]);
        let res = arr.join("");
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0740
     * @tc.name testBigInt64ArrayJoinTwo0740
     * @tc.desc Verify length for binary bigint array with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0740',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([2n, 3n]);
        let res = arr.join("-");
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0750
     * @tc.name testBigInt64ArrayJoinTwo0750
     * @tc.desc Verify length for [0n, 0n, 0n] with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0750',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([0n, 0n, 0n]);
        let res = arr.join();
        expect(res.length).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0760
     * @tc.name testBigInt64ArrayJoinTwo0760
     * @tc.desc Verify length for [0n, 0n, 0n] with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0760',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([0n, 0n, 0n]);
        let res = arr.join("");
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0770
     * @tc.name testBigInt64ArrayJoinTwo0770
     * @tc.desc Verify join keeps empty array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0770',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        arr.join();
        expect(arr.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0780
     * @tc.name testBigInt64ArrayJoinTwo0780
     * @tc.desc Verify join keeps empty array length unchanged with separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0780',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([]);
        arr.join("123");
        expect(arr.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0790
     * @tc.name testBigInt64ArrayJoinTwo0790
     * @tc.desc Verify join keeps [1n] length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0790',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        arr.join();
        expect(arr.length).assertEqual(1);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0800
     * @tc.name testBigInt64ArrayJoinTwo0800
     * @tc.desc Verify join keeps first element of [1n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        arr.join();
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0810
     * @tc.name testBigInt64ArrayJoinTwo0810
     * @tc.desc Verify join keeps first element of [1n] unchanged with separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0810',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n]);
        arr.join("-");
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0820
     * @tc.name testBigInt64ArrayJoinTwo0820
     * @tc.desc Verify join keeps [1n, 2n] length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0820',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        arr.join();
        expect(arr.length).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0830
     * @tc.name testBigInt64ArrayJoinTwo0830
     * @tc.desc Verify join keeps first element of [1n, 2n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0830',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        arr.join();
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0840
     * @tc.name testBigInt64ArrayJoinTwo0840
     * @tc.desc Verify join keeps second element of [1n, 2n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0840',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        arr.join();
        expect(arr[1]).assertEqual(2n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0850
     * @tc.name testBigInt64ArrayJoinTwo0850
     * @tc.desc Verify join keeps first element of [1n, 2n] unchanged with separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0850',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        arr.join("-");
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0860
     * @tc.name testBigInt64ArrayJoinTwo0860
     * @tc.desc Verify join keeps second element of [1n, 2n] unchanged with separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0860',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        arr.join("-");
        expect(arr[1]).assertEqual(2n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0870
     * @tc.name testBigInt64ArrayJoinTwo0870
     * @tc.desc Verify join keeps first element of [-1n, -2n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0870',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n, -2n]);
        arr.join("");
        expect(arr[0]).assertEqual(-1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0880
     * @tc.name testBigInt64ArrayJoinTwo0880
     * @tc.desc Verify join keeps second element of [-1n, -2n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0880',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-1n, -2n]);
        arr.join("");
        expect(arr[1]).assertEqual(-2n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0890
     * @tc.name testBigInt64ArrayJoinTwo0890
     * @tc.desc Verify join keeps max bigint element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0890',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        arr.join();
        expect(arr[0]).assertEqual(9223372036854775807n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0900
     * @tc.name testBigInt64ArrayJoinTwo0900
     * @tc.desc Verify join keeps min bigint element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([-9223372036854775808n]);
        arr.join();
        expect(arr[0]).assertEqual(-9223372036854775808n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0910
     * @tc.name testBigInt64ArrayJoinTwo0910
     * @tc.desc Verify join keeps [1n, 2n, 3n] length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0910',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.join();
        expect(arr.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0920
     * @tc.name testBigInt64ArrayJoinTwo0920
     * @tc.desc Verify join keeps first element of [1n, 2n, 3n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0920',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.join();
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0930
     * @tc.name testBigInt64ArrayJoinTwo0930
     * @tc.desc Verify join keeps second element of [1n, 2n, 3n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0930',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.join();
        expect(arr[1]).assertEqual(2n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0940
     * @tc.name testBigInt64ArrayJoinTwo0940
     * @tc.desc Verify join keeps third element of [1n, 2n, 3n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0940',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.join();
        expect(arr[2]).assertEqual(3n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0950
     * @tc.name testBigInt64ArrayJoinTwo0950
     * @tc.desc Verify join keeps first hex array element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0950',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.join();
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0960
     * @tc.name testBigInt64ArrayJoinTwo0960
     * @tc.desc Verify join keeps second oct array element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0960',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.join();
        expect(arr[1]).assertEqual(2n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0970
     * @tc.name testBigInt64ArrayJoinTwo0970
     * @tc.desc Verify value for 100 ones with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0970',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join();
        let expectedData: string[] = [];
        for(let i = 0; i < 100; i++) {
          expectedData.push("1");
        }
        expect(res).assertEqual(expectedData.join(","));
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0980
     * @tc.name testBigInt64ArrayJoinTwo0980
     * @tc.desc Verify length for 100 ones with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0980',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join();
        expect(res.length).assertEqual(199);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_0990
     * @tc.name testBigInt64ArrayJoinTwo0990
     * @tc.desc Verify value for 100 ones with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo0990',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join("");
        let expectedData: string[] = [];
        for(let i = 0; i < 100; i++) {
          expectedData.push("1");
        }
        expect(res).assertEqual(expectedData.join(""));
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1000
     * @tc.name testBigInt64ArrayJoinTwo1000
     * @tc.desc Verify length for 100 ones with empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join("");
        expect(res.length).assertEqual(100);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1010
     * @tc.name testBigInt64ArrayJoinTwo1010
     * @tc.desc Verify value for 100 ones with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join("-");
        let expectedData: string[] = [];
        for(let i = 0; i < 100; i++) {
          expectedData.push("1");
        }
        expect(res).assertEqual(expectedData.join("-"));
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1020
     * @tc.name testBigInt64ArrayJoinTwo1020
     * @tc.desc Verify length for 100 ones with hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join("-");
        expect(res.length).assertEqual(199);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1030
     * @tc.name testBigInt64ArrayJoinTwo1030
     * @tc.desc Verify length for 100 max bigint values with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(9223372036854775807n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join();
        expect(res.length).assertEqual(1999);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1040
     * @tc.name testBigInt64ArrayJoinTwo1040
     * @tc.desc Verify length for 100 min bigint values with default separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(-9223372036854775808n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join();
        expect(res.length).assertEqual(2099);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1050
     * @tc.name testBigInt64ArrayJoinTwo1050
     * @tc.desc Verify string type for large array join result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        let res = arr.join();
        expect(typeof res).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1060
     * @tc.name testBigInt64ArrayJoinTwo1060
     * @tc.desc Verify join keeps large array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        arr.join();
        expect(arr.length).assertEqual(100);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1070
     * @tc.name testBigInt64ArrayJoinTwo1070
     * @tc.desc Verify join keeps large array first element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        arr.join();
        expect(arr[0]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_TWO_1080
     * @tc.name testBigInt64ArrayJoinTwo1080
     * @tc.desc Verify join keeps large array last element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayJoinTwo1080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let data: bigint[] = [];
        for(let i = 0; i < 100; i++) {
          data.push(1n);
        }
        let arr = new BigInt64Array(data);
        arr.join();
        expect(arr[99]).assertEqual(1n);
      }
    );

  });
}
