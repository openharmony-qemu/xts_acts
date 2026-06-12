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

export default function StringPadLeftTest(): void {
  describe('StringPadLeftTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0100
     * @tc.name testPadLeft001
     * @tc.desc Verify padLeft() pads string on left with specified char to target length
     */
    it('testPadLeft001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let result: String = text.padLeft(c'0', 5);
      expect(result.toString()).assertEqual("00042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0200
     * @tc.name testPadLeft002
     * @tc.desc Verify padLeft() when string already reaches or exceeds target length returns original
     */
    it('testPadLeft002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.padLeft(c'*', 3);
      expect(result.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0300
     * @tc.name testPadLeft003
     * @tc.desc Verify padLeft() with CJK char as padChar
     */
    it('testPadLeft003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("测试");
      let result: String = text.padLeft(c'！', 4);
      expect(result.toString()).assertEqual("！！测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0400
     * @tc.name testPadLeft004
     * @tc.desc Verify padLeft() with GBK Chinese char as padChar
     */
    it('testPadLeft004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("标题");
      let result: String = text.padLeft(c'#', 4);
      expect(result.toString()).assertEqual("##标题");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0500
     * @tc.name testPadLeft005
     * @tc.desc Verify padLeft() with empty string pads fully
     */
    it('testPadLeft005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.padLeft(c'-', 3);
      expect(result.toString()).assertEqual("---");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0600
     * @tc.name testPadLeft006
     * @tc.desc Verify padLeft() with dynamic variables
     */
    it('testPadLeft006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("7");
      let len: int = 3;
      let pad: char = c'^';
      let result: String = text.padLeft(pad, len);
      expect(result.toString()).assertEqual("^^7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0700
     * @tc.name testPadLeft007
     * @tc.desc Verify padLeft() with targetLength 0 returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.padLeft(c'0', 0);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0800
     * @tc.name testPadLeft008
     * @tc.desc Verify padLeft() with negative targetLength returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padLeft(c'0', -1);
      expect(result.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_0900
     * @tc.name testPadLeft009
     * @tc.desc Verify padLeft() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padLeft(c'0', 5);
      expect(text.toString()).assertEqual("AB");
      expect(result.toString()).assertEqual("000AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1000
     * @tc.name testPadLeft010
     * @tc.desc Verify padLeft() result length equals targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padLeft(c'0', 5);
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1100
     * @tc.name testPadLeft011
     * @tc.desc Verify padLeft() formats an order number to fixed width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orderId = new String("57");
      let result: String = orderId.padLeft(c'0', 6);
      expect(result.toString()).assertEqual("000057");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1200
     * @tc.name testPadLeft012
     * @tc.desc Verify padLeft() with targetLength equal to string length returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.padLeft(c'*', 3);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1300
     * @tc.name testPadLeft013
     * @tc.desc Verify padLeft() aligns a signed balance in a fixed-width report column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const balance = new String("-42");
      let result: String = balance.padLeft(c' ', 6);
      expect(result.toString()).assertEqual("   -42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1400
     * @tc.name testPadLeft014
     * @tc.desc Verify padLeft() can use a Unicode BMP char as padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.padLeft(c'\u4E2D', 3);
      expect(result.toString()).assertEqual("\u4E2D\u4E2DA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1500
     * @tc.name testPadLeft015
     * @tc.desc Verify padLeft() can use tab as a C0 control padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let result: String = text.padLeft(c'\t', 3);
      expect(result.toString()).assertEqual("\t\tX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1600
     * @tc.name testPadLeft016
     * @tc.desc Verify padLeft() formats a day-of-month field to two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const day = new String("9");
      let result: String = day.padLeft(c'0', 2);
      expect(result.toString()).assertEqual("09");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1700
     * @tc.name testPadLeft017
     * @tc.desc Verify padLeft() formats a numeric permission token to fixed width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mode = new String("755");
      let result: String = mode.padLeft(c'0', 4);
      expect(result.toString()).assertEqual("0755");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT_1800
     * @tc.name testPadLeft018
     * @tc.desc Verify padLeft() can use NUL as a C0 control padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadLeft018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.padLeft(c'\0', 3);
      expect(result.getLength()).assertEqual(3);
      expect(result.charCodeAt(0)).assertEqual(0);
    });
  });
}
