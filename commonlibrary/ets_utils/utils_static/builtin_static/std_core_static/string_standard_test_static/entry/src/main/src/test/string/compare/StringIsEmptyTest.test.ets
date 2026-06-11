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

export default function StringIsEmptyTest(): void {
  describe('StringIsEmptyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0100
     * @tc.name testIsEmpty001
     * @tc.desc Verify isEmpty() returns true for no-arg constructed empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      expect(text.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0200
     * @tc.name testIsEmpty002
     * @tc.desc Verify isEmpty() returns true for explicitly empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      expect(text.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0300
     * @tc.name testIsEmpty003
     * @tc.desc Verify isEmpty() returns false for single ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0400
     * @tc.name testIsEmpty004
     * @tc.desc Verify isEmpty() returns false for whitespace-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0500
     * @tc.name testIsEmpty005
     * @tc.desc Verify isEmpty() on C0 control tab-only string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0600
     * @tc.name testIsEmpty006
     * @tc.desc Verify isEmpty() on C0 control newline-only string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0700
     * @tc.name testIsEmpty007
     * @tc.desc Verify isEmpty() on C0 control NUL character string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\0");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0800
     * @tc.name testIsEmpty008
     * @tc.desc Verify isEmpty() on CJK Unicode BMP character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0900
     * @tc.name testIsEmpty009
     * @tc.desc Verify isEmpty() on emoji character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1000
     * @tc.name testIsEmpty010
     * @tc.desc Verify isEmpty() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("");
      let empty: boolean = text.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1100
     * @tc.name testIsEmpty011
     * @tc.desc Verify isEmpty() on single space returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String(" ");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1200
     * @tc.name testIsEmpty012
     * @tc.desc Verify isEmpty() on mixed whitespace tab plus space plus newline returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t \n");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1300
     * @tc.name testIsEmpty013
     * @tc.desc Verify whitespace-only after trim isEmpty returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      let afterTrim: string = text.trim();
      const text1 = new String(afterTrim);
      let empty: boolean = text1.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1400
     * @tc.name testIsEmpty014
     * @tc.desc Verify isEmpty() returns true for a substring-derived empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "X";
      const text = new String(raw.substring(1));
      expect(text.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1500
     * @tc.name testIsEmpty015
     * @tc.desc Verify isEmpty() on single ISO 8859-1 Latin-1 character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u00E9");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1600
     * @tc.name testIsEmpty016
     * @tc.desc Verify isEmpty() on long string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(1000));
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1700
     * @tc.name testIsEmpty017
     * @tc.desc Verify isEmpty() on substring result that is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let sub: string = text.substring(1, 1);
      const text2 = new String(sub);
      let empty: boolean = text2.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1800
     * @tc.name testIsEmpty018
     * @tc.desc Verify isEmpty() deterministically returns false for non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      expect(text.isEmpty()).assertFalse();
      expect(text.getLength() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1900
     * @tc.name testIsEmpty019
     * @tc.desc Verify isEmpty() after trim on whitespace-only becomes empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t\n\r ");
      let trimmed: string = text.trim();
      const text3 = new String(trimmed);
      let empty: boolean = text3.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2000
     * @tc.name testIsEmpty020
     * @tc.desc Verify isEmpty() after substring that results in empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let sub: string = text.substring(2, 2);
      const text4 = new String(sub);
      let empty: boolean = text4.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2100
     * @tc.name testIsEmpty021
     * @tc.desc Verify isEmpty() on result after repeat(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: string = text.repeat(0);
      const text5 = new String(result);
      let empty: boolean = text5.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2200
     * @tc.name testIsEmpty022
     * @tc.desc Verify isEmpty() after split with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let parts: String[] = text.split(",");
      expect(parts.length).assertEqual(1);
      expect(parts[0].isEmpty()).assertTrue();
    });
  });
}
