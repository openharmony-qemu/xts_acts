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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringValueOf2Test(): void {
  describe('StringValueOf2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0100
     * @tc.name testValueOf001
     * @tc.desc Verify String valueOf result toString equals original content, instanceof String is true, and typeof is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strObj: String = new String("ArkTS");
      let result: String = strObj.valueOf();
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0200
     * @tc.name testValueOf002
     * @tc.desc Verify valueOf result charAt returns correct characters at multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      expect(str.valueOf().charAt(0)).assertEqual(c'A');
      expect(str.valueOf().charAt(1)).assertEqual(c'r');
      expect(str.valueOf().charAt(4)).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0300
     * @tc.name testValueOf003
     * @tc.desc Verify multiple valueOf calls produce consistent toString results for idempotency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let vo1: String = str.valueOf();
      let ts1: String = str.toString();
      let vo2: String = str.valueOf();
      let ts2: String = str.toString();
      expect(vo1.toString()).assertEqual(ts1.toString());
      expect(vo2.toString()).assertEqual(ts2.toString());
      expect(vo1.toString()).assertEqual(vo2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0400
     * @tc.name testValueOf004
     * @tc.desc Verify valueOf toString length equals getLength for cross-method consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("PropVO");
      let result: String = str.valueOf();
      expect(result.toString().length).assertEqual(result.getLength());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0500
     * @tc.name testValueOf005
     * @tc.desc Verify valueOf with 1000-character string preserves full content and correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = "a".repeat(500);
      let content: string = base + "b".repeat(500);
      let str: String = new String(content);
      let result: String = str.valueOf();
      expect(result.getLength()).assertEqual(1000);
      expect(result.startsWith(new String("aaaa"))).assertTrue();
      expect(result.endsWith(new String("bbbb"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0600
     * @tc.name testValueOf006
     * @tc.desc Verify valueOf result with emoji preserves surrogate pair and correct code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀");
      let result: String = str.valueOf();
      expect(result.getLength()).assertEqual(2);
      let cp: number = result.codePointAt(0)!;
      expect(cp).assertEqual(0x1F600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0700
     * @tc.name testValueOf007
     * @tc.desc Verify valueOf result with mixed ASCII Chinese and emoji preserves all content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Hi 世界 😀");
      let result: String = str.valueOf();
      expect(result.contains(new String("世界"), 0)).assertTrue();
      expect(result.contains(new String("😀"), 0)).assertTrue();
      expect(result.startsWith(new String("Hi"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0800
     * @tc.name testValueOf008
     * @tc.desc Verify valueOf on default-constructed String returns empty string with isEmpty true, getLength zero and equals empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String();
      let result: String = str.valueOf();
      expect(result.isEmpty()).assertTrue();
      expect(result.getLength()).assertEqual(0);
      expect(result.toString()).assertEqual("");
      expect(result.equals(new String(""))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_0900
     * @tc.name testValueOf009
     * @tc.desc Verify valueOf on copy-constructed String from another String preserves original content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: String = new String("SourceStr");
      let copy: String = new String(original);
      let result: String = copy.valueOf();
      expect(result.toString()).assertEqual("SourceStr");
      expect(result.getLength()).assertEqual(9);
      expect(result.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_1000
     * @tc.name testValueOf010
     * @tc.desc Verify valueOf preserves embedded null character without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\0b\0c");
      let result: String = str.valueOf();
      expect(result.getLength()).assertEqual(5);
      expect(result.charCodeAt(0)).assertEqual(97);
      expect(result.charCodeAt(1)).assertEqual(0);
      expect(result.charCodeAt(3)).assertEqual(0);
      expect(result.charCodeAt(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_1100
     * @tc.name testValueOf011
     * @tc.desc Verify valueOf on whitespace-only string preserves all spaces unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("     ");
      let result: String = str.valueOf();
      expect(result.getLength()).assertEqual(5);
      expect(result.toString()).assertEqual("     ");
      expect(result.isEmpty()).assertFalse();
      expect(result.trim().isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF2_1200
     * @tc.name testValueOf012
     * @tc.desc Verify valueOf on Japanese string returns original content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "こんにちは";
      let result: string = str.valueOf();
      expect(result).assertEqual("こんにちは");
    });
  });

}