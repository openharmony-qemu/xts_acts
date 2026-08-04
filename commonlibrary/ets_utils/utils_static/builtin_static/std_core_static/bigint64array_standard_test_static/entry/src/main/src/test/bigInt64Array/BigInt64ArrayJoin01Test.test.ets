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

export default function BigInt64ArrayJoin01Test(): void {
  describe('BigInt64ArrayJoin01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0100
     * @tc.name testBigInt64ArrayJoin0100
     * @tc.desc Verify join uses the default comma separator when no parameter is passed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let act = arr.join();
      expect(act).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0200
     * @tc.name testBigInt64ArrayJoin0200
     * @tc.desc Verify join uses the provided single separator parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let act = arr.join("-");
      expect(act).assertEqual("1-2-3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0300
     * @tc.name testBigInt64ArrayJoin0300
     * @tc.desc Verify join concatenates values with an empty string separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let act = arr.join("");
      expect(act).assertEqual("102030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0400
     * @tc.name testBigInt64ArrayJoin0400
     * @tc.desc Verify join uses a single space separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let act = arr.join(" ");
      expect(act).assertEqual("1 2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0500
     * @tc.name testBigInt64ArrayJoin0500
     * @tc.desc Verify join uses a double space separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let act = arr.join("  ");
      expect(act).assertEqual("5  10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0600
     * @tc.name testBigInt64ArrayJoin0600
     * @tc.desc Verify join uses an explicit comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let act = arr.join(",");
      expect(act).assertEqual("-1,-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0700
     * @tc.name testBigInt64ArrayJoin0700
     * @tc.desc Verify join uses a comma and space separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let act = arr.join(", ");
      expect(act).assertEqual("1, 2, 3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0800
     * @tc.name testBigInt64ArrayJoin0800
     * @tc.desc Verify join uses a semicolon separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let act = arr.join(";");
      expect(act).assertEqual("100;200");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_0900
     * @tc.name testBigInt64ArrayJoin0900
     * @tc.desc Verify join joins positive values with a hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 9n]);
      let act = arr.join("-");
      expect(act).assertEqual("8-9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1000
     * @tc.name testBigInt64ArrayJoin1000
     * @tc.desc Verify join joins negative values with a hyphen separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-8n, -9n]);
      let act = arr.join("-");
      expect(act).assertEqual("-8--9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1100
     * @tc.name testBigInt64ArrayJoin1100
     * @tc.desc Verify join uses an underscore separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let act = arr.join("_");
      expect(act).assertEqual("0_0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1200
     * @tc.name testBigInt64ArrayJoin1200
     * @tc.desc Verify join uses a period separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([192n, 168n, 1n, 1n]);
      let act = arr.join(".");
      expect(act).assertEqual("192.168.1.1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1300
     * @tc.name testBigInt64ArrayJoin1300
     * @tc.desc Verify join uses a vertical bar separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n]);
      let act = arr.join("|");
      expect(act).assertEqual("1|3|5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1400
     * @tc.name testBigInt64ArrayJoin1400
     * @tc.desc Verify join uses a tilde separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n]);
      let act = arr.join("~");
      expect(act).assertEqual("2~4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1500
     * @tc.name testBigInt64ArrayJoin1500
     * @tc.desc Verify join uses a hash separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n, 88n]);
      let act = arr.join("#");
      expect(act).assertEqual("99#88");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1600
     * @tc.name testBigInt64ArrayJoin1600
     * @tc.desc Verify join uses a star-slash separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n, 9n]);
      let act = arr.join("*/");
      expect(act).assertEqual("7*/8*/9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1700
     * @tc.name testBigInt64ArrayJoin1700
     * @tc.desc Verify join uses a newline separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let act = arr.join("\n");
      expect(act).assertEqual("1\n2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1800
     * @tc.name testBigInt64ArrayJoin1800
     * @tc.desc Verify join uses a tab separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let act = arr.join("\t");
      expect(act).assertEqual("-1\t-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_1900
     * @tc.name testBigInt64ArrayJoin1900
     * @tc.desc Verify join uses a carriage return and newline separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let act = arr.join("\r\n");
      expect(act).assertEqual("10\r\n20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2000
     * @tc.name testBigInt64ArrayJoin2000
     * @tc.desc Verify join uses a backspace separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      let act = arr.join("\b");
      expect(act).assertEqual("3\b4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2100
     * @tc.name testBigInt64ArrayJoin2100
     * @tc.desc Verify join uses a vertical tab separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      let act = arr.join("\v");
      expect(act).assertEqual("5\v6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2200
     * @tc.name testBigInt64ArrayJoin2200
     * @tc.desc Verify join uses a form feed separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      let act = arr.join("\f");
      expect(act).assertEqual("7\f8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2300
     * @tc.name testBigInt64ArrayJoin2300
     * @tc.desc Verify join uses a null character separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 10n]);
      let act = arr.join("\0");
      expect(act).assertEqual("9" + "\0" + "10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2400
     * @tc.name testBigInt64ArrayJoin2400
     * @tc.desc Verify join uses a zero-width space separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 12n]);
      let act = arr.join("​");
      expect(act).assertEqual("11​12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2500
     * @tc.name testBigInt64ArrayJoin2500
     * @tc.desc Verify join uses a single Chinese character separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let act = arr.join("and");
      expect(act).assertEqual("1and2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2600
     * @tc.name testBigInt64ArrayJoin2600
     * @tc.desc Verify join uses a Chinese phrase separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let act = arr.join("link");
      expect(act).assertEqual("-1link-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2700
     * @tc.name testBigInt64ArrayJoin2700
     * @tc.desc Verify join uses a Chinese enumeration comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n, 5n]);
      let act = arr.join("/");
      expect(act).assertEqual("3/4/5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2800
     * @tc.name testBigInt64ArrayJoin2800
     * @tc.desc Verify join uses a full-width Chinese comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n, 7n]);
      let act = arr.join(", ");
      expect(act).assertEqual("6, 7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_2900
     * @tc.name testBigInt64ArrayJoin2900
     * @tc.desc Verify join uses mixed Chinese punctuation and spaces as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 9n]);
      let act = arr.join(" and ");
      expect(act).assertEqual("8 and 9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3000
     * @tc.name testBigInt64ArrayJoin3000
     * @tc.desc Verify join uses a traditional Chinese phrase separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n]);
      let act = arr.join("test");
      expect(act).assertEqual("10test11");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3100
     * @tc.name testBigInt64ArrayJoin3100
     * @tc.desc Verify join uses a simple emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let act = arr.join("🚀");
      expect(act).assertEqual("1🚀2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3200
     * @tc.name testBigInt64ArrayJoin3200
     * @tc.desc Verify join uses a face emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      let act = arr.join("😊");
      expect(act).assertEqual("3😊4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3300
     * @tc.name testBigInt64ArrayJoin3300
     * @tc.desc Verify join uses a flag emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let act = arr.join("🇨🇳");
      expect(act).assertEqual("-1🇨🇳-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3400
     * @tc.name testBigInt64ArrayJoin3400
     * @tc.desc Verify join uses a ZWJ family emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      let act = arr.join("👨‍👩‍👧");
      expect(act).assertEqual("5👨‍👩‍👧6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3500
     * @tc.name testBigInt64ArrayJoin3500
     * @tc.desc Verify join uses a skin-tone emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      let act = arr.join("👍🏻");
      expect(act).assertEqual("7👍🏻8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3600
     * @tc.name testBigInt64ArrayJoin3600
     * @tc.desc Verify join uses multiple emoji characters as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 10n]);
      let act = arr.join("🌈✨");
      expect(act).assertEqual("9🌈✨10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3700
     * @tc.name testBigInt64ArrayJoin3700
     * @tc.desc Verify join uses a keycap emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 12n]);
      let act = arr.join("1️⃣");
      expect(act).assertEqual("111️⃣12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3800
     * @tc.name testBigInt64ArrayJoin3800
     * @tc.desc Verify join uses a mixed Chinese and emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      let act = arr.join("a🍔b");
      expect(act).assertEqual("0a🍔b1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_3900
     * @tc.name testBigInt64ArrayJoin3900
     * @tc.desc Verify join uses a spaced emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n]);
      let act = arr.join(" 🚀 ");
      expect(act).assertEqual("2 🚀 3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4000
     * @tc.name testBigInt64ArrayJoin4000
     * @tc.desc Verify join uses a separator string with length ten.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sep = "a".repeat(10);
      let act = arr.join(sep);
      expect(act).assertEqual("1aaaaaaaaaa2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4100
     * @tc.name testBigInt64ArrayJoin4100
     * @tc.desc Verify join uses a separator string with length fifty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let sep = "b".repeat(50);
      let act = arr.join(sep);
      expect(act).assertEqual("-1" + sep + "-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4200
     * @tc.name testBigInt64ArrayJoin4200
     * @tc.desc Verify join uses a separator string with length one hundred.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sep = "C".repeat(100);
      let act = arr.join(sep);
      expect(act).assertEqual("10" + sep + "20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4300
     * @tc.name testBigInt64ArrayJoin4300
     * @tc.desc Verify join uses a separator string with length two hundred fifty-six.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      let sep = "D".repeat(256);
      let act = arr.join(sep);
      expect(act).assertEqual("5" + sep + "6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4400
     * @tc.name testBigInt64ArrayJoin4400
     * @tc.desc Verify join uses a separator string with length five hundred.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      let sep = "e".repeat(500);
      let act = arr.join(sep);
      expect(act).assertEqual("0" + sep + "1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4500
     * @tc.name testBigInt64ArrayJoin4500
     * @tc.desc Verify join uses a separator string with length one thousand.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9n, 9n]);
      let sep = "F".repeat(1000);
      let act = arr.join(sep);
      expect(act).assertEqual("-9" + sep + "9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4600
     * @tc.name testBigInt64ArrayJoin4600
     * @tc.desc Verify join uses the string zero as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let act = arr.join("0");
      expect(act).assertEqual("102");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4700
     * @tc.name testBigInt64ArrayJoin4700
     * @tc.desc Verify join uses the string one as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      let act = arr.join("1");
      expect(act).assertEqual("314");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4800
     * @tc.name testBigInt64ArrayJoin4800
     * @tc.desc Verify join uses the string negative one as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      let act = arr.join("-1");
      expect(act).assertEqual("5-16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_4900
     * @tc.name testBigInt64ArrayJoin4900
     * @tc.desc Verify join uses a repeated digit string as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      let act = arr.join("999999");
      expect(act).assertEqual("79999998");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5000
     * @tc.name testBigInt64ArrayJoin5000
     * @tc.desc Verify join uses the string NaN as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let act = arr.join("NaN");
      expect(act).assertEqual("-1NaN-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5100
     * @tc.name testBigInt64ArrayJoin5100
     * @tc.desc Verify join uses the string Infinity as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let act = arr.join("Infinity");
      expect(act).assertEqual("0Infinity0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5200
     * @tc.name testBigInt64ArrayJoin5200
     * @tc.desc Verify join uses the string negative Infinity as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n]);
      let act = arr.join("-Infinity");
      expect(act).assertEqual("1-Infinity3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5300
     * @tc.name testBigInt64ArrayJoin5300
     * @tc.desc Verify join uses the string true as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n]);
      let act = arr.join("true");
      expect(act).assertEqual("2true4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5400
     * @tc.name testBigInt64ArrayJoin5400
     * @tc.desc Verify join uses the string false as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-3n, -4n]);
      let act = arr.join("false");
      expect(act).assertEqual("-3false-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5500
     * @tc.name testBigInt64ArrayJoin5500
     * @tc.desc Verify join uses the string null as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 7n]);
      let act = arr.join("null");
      expect(act).assertEqual("5null7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5600
     * @tc.name testBigInt64ArrayJoin5600
     * @tc.desc Verify join uses the string undefined as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n, 8n]);
      let act = arr.join("undefined");
      expect(act).assertEqual("6undefined8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5700
     * @tc.name testBigInt64ArrayJoin5700
     * @tc.desc Verify join returns an empty string for an empty array with a comma separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let act = arr.join(",");
      expect(act).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5800
     * @tc.name testBigInt64ArrayJoin5800
     * @tc.desc Verify join returns an empty string for an empty array with an emoji separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let act = arr.join("🇨🇳");
      expect(act).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_5900
     * @tc.name testBigInt64ArrayJoin5900
     * @tc.desc Verify join returns an empty string for an empty array with a long separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let sep = "a".repeat(200);
      let act = arr.join(sep);
      expect(act).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6000
     * @tc.name testBigInt64ArrayJoin6000
     * @tc.desc Verify join ignores the separator for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n]);
      let act = arr.join("==>");
      expect(act).assertEqual("88");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6100
     * @tc.name testBigInt64ArrayJoin6100
     * @tc.desc Verify join ignores a long separator for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-99n]);
      let sep = "X".repeat(500);
      let act = arr.join(sep);
      expect(act).assertEqual("-99");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6200
     * @tc.name testBigInt64ArrayJoin6200
     * @tc.desc Verify join handles the maximum positive value with an empty separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 1n]);
      let act = arr.join("");
      expect(act).assertEqual("92233720368547758071");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6300
     * @tc.name testBigInt64ArrayJoin6300
     * @tc.desc Verify join handles maximum and minimum boundary values with a Chinese separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let act = arr.join("and");
      expect(act).assertEqual("9223372036854775807and-9223372036854775808");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6400
     * @tc.name testBigInt64ArrayJoin6400
     * @tc.desc Verify join handles the minimum value and zero with an underscore separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n]);
      let act = arr.join("_");
      expect(act).assertEqual("-9223372036854775808_0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6500
     * @tc.name testBigInt64ArrayJoin6500
     * @tc.desc Verify join handles two zero values with the string zero separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let act = arr.join("0");
      expect(act).assertEqual("000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6600
     * @tc.name testBigInt64ArrayJoin6600
     * @tc.desc Verify join on a long array matches Array.from(arr).join("-").
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let act = arr.join("-");
      expect(act).assertEqual(Array.from(arr).join("-"));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6700
     * @tc.name testBigInt64ArrayJoin6700
     * @tc.desc Verify join on a longer array uses an emoji separator consistently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
      let act = arr.join("🚀");
      expect(act).assertEqual("1🚀2🚀3🚀4🚀5🚀6🚀7🚀8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6800
     * @tc.name testBigInt64ArrayJoin6800
     * @tc.desc Verify join handles repeated values with a space separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -1n, -1n, -1n]);
      let act = arr.join(" ");
      expect(act).assertEqual("-1 -1 -1 -1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_JOIN_ONE_6900
     * @tc.name testBigInt64ArrayJoin6900
     * @tc.desc Verify join uses the literal backslash-n string as the separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayJoin6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n, 12n]);
      let act = arr.join("\\n");
      expect(act).assertEqual("10\\n11\\n12");
    });
  });
}
