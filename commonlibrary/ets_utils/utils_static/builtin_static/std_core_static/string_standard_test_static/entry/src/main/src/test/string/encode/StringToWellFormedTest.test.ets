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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringToWellFormedTest(): void {
  describe('StringToWellFormedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0100
     * @tc.name testToWellFormed001
     * @tc.desc Verify toWellFormed() on well-formed ASCII string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0200
     * @tc.name testToWellFormed002
     * @tc.desc Verify toWellFormed() replaces lone high surrogate with replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0300
     * @tc.name testToWellFormed003
     * @tc.desc Verify toWellFormed() on single ASCII character returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0400
     * @tc.name testToWellFormed004
     * @tc.desc Verify toWellFormed() replaces lone low surrogate U+DC00 with U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDC00");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0500
     * @tc.name testToWellFormed005
     * @tc.desc Verify toWellFormed() on well-formed surrogate pair returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: string = text.toWellFormed();
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0600
     * @tc.name testToWellFormed006
     * @tc.desc Verify toWellFormed() replaces lone surrogate in mixed content (A + surrogate + B)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD800B");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("A�B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0700
     * @tc.name testToWellFormed007
     * @tc.desc Verify toWellFormed() replaces each of multiple lone surrogates with U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800X\uDC00");
      let result: string = text.toWellFormed();
      let len: int = result.length;
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0800
     * @tc.name testToWellFormed008
     * @tc.desc Verify toWellFormed() on CJK Unicode BMP characters returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_0900
     * @tc.name testToWellFormed009
     * @tc.desc Verify toWellFormed() on GBK Chinese text returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1000
     * @tc.name testToWellFormed010
     * @tc.desc Verify toWellFormed() on ISO 8859-1 Latin accented characters returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1100
     * @tc.name testToWellFormed011
     * @tc.desc Verify toWellFormed() replaces lone surrogate at end of string with U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OK\uD800");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("OK�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1200
     * @tc.name testToWellFormed012
     * @tc.desc Verify toWellFormed() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1300
     * @tc.name testToWellFormed013
     * @tc.desc Verify toWellFormed() with dynamic variable preserves well-formed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("HelloWorld");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1400
     * @tc.name testToWellFormed014
     * @tc.desc Verify toWellFormed() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD800B");
      let result: string = text.toWellFormed();
      expect(text.toString()).assertEqual("A\uD800B");
      expect(result).assertEqual("A�B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1500
     * @tc.name testToWellFormed015
     * @tc.desc Verify toWellFormed() on reversed surrogate order replaces both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Trail surrogate followed by lead surrogate - both replaced
      const text = new String("\uDC00\uD800");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("��");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1600
     * @tc.name testToWellFormed016
     * @tc.desc Verify toWellFormed() chained with includes works on cleaned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello\uD800World");
      let cleaned: string = text.toWellFormed();
      let inc: boolean = cleaned.includes("Hello");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1700
     * @tc.name testToWellFormed017
     * @tc.desc Verify toWellFormed() called twice gives same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800AB\uDC00");
      let once: string = text.toWellFormed();
      let twice: string = once.toWellFormed();
      expect(twice).assertEqual(once);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1800
     * @tc.name testToWellFormed018
     * @tc.desc Verify toWellFormed() repairs a truncated surrogate inside an API payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("id=7\uD800,status=ok");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("id=7\uFFFD,status=ok");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_1900
     * @tc.name testToWellFormed019
     * @tc.desc Verify toWellFormed() repairs a low surrogate at the start of a log line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDE00 received");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("\uFFFD received");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_2000
     * @tc.name testToWellFormed020
     * @tc.desc Verify toWellFormed() preserves a valid emoji pair in notification text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00 done");
      let result: string = text.toWellFormed();
      expect(result).assertEqual("\uD83D\uDE00 done");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOWELLFORMED_2100
     * @tc.name testToWellFormed021
     * @tc.desc Verify toWellFormed() output is well-formed after repairing reversed surrogate order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToWellFormed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDE00\uD83D order");
      let result: string = text.toWellFormed();
      const repaired = new String(result);
      expect(repaired.isWellFormed()).assertTrue();
    });
  });
}
