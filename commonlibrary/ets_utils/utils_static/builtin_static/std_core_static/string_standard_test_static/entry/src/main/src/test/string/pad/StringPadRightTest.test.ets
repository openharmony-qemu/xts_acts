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

export default function StringPadRightTest(): void {
  describe('StringPadRightTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0100
     * @tc.name testPadRight001
     * @tc.desc Verify padRight() pads string on right with specified char to target length
     */
    it('testPadRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let result: String = text.padRight(c'0', 5);
      expect(result.toString()).assertEqual("42000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0200
     * @tc.name testPadRight002
     * @tc.desc Verify padRight() when string already reaches or exceeds target length returns original
     */
    it('testPadRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.padRight(c'*', 3);
      expect(result.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0300
     * @tc.name testPadRight003
     * @tc.desc Verify padRight() with punctuation char as padChar
     */
    it('testPadRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col");
      let result: String = text.padRight(c' ', 5);
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0400
     * @tc.name testPadRight004
     * @tc.desc Verify padRight() with GBK Chinese char as padChar
     */
    it('testPadRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("标题");
      let result: String = text.padRight(c'。', 4);
      expect(result.toString()).assertEqual("标题。。");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0500
     * @tc.name testPadRight005
     * @tc.desc Verify padRight() with empty string pads fully
     */
    it('testPadRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.padRight(c'-', 3);
      expect(result.toString()).assertEqual("---");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0600
     * @tc.name testPadRight006
     * @tc.desc Verify padRight() with dynamic variables
     */
    it('testPadRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let len: int = 3;
      let pad: char = c'=';
      let result: String = text.padRight(pad, len);
      expect(result.toString()).assertEqual("X==");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0700
     * @tc.name testPadRight007
     * @tc.desc Verify padRight() with targetLength 0 returns original
     */
    it('testPadRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.padRight(c'0', 0);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0800
     * @tc.name testPadRight008
     * @tc.desc Verify padRight() with negative targetLength returns original
     */
    it('testPadRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padRight(c'0', -1);
      expect(result.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0900
     * @tc.name testPadRight009
     * @tc.desc Verify padRight() does not modify original string
     */
    it('testPadRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padRight(c'0', 5);
      expect(text.toString()).assertEqual("AB");
      expect(result.toString()).assertEqual("AB000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1000
     * @tc.name testPadRight010
     * @tc.desc Verify padRight() result length equals targetLength
     */
    it('testPadRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padRight(c'0', 5);
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1100
     * @tc.name testPadRight011
     * @tc.desc Verify padRight() with targetLength equal to string length returns original
     */
    it('testPadRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.padRight(c'*', 3);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1200
     * @tc.name testPadRight012
     * @tc.desc Verify padRight() on empty string creates padding-only result
     */
    it('testPadRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.padRight(c'*', 3);
      expect(result.toString()).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1300
     * @tc.name testPadRight013
     * @tc.desc Verify padRight() preserves ISO 8859-1 Latin-1 source content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Caf\u00E9");
      let result: String = text.padRight(c'-', 6);
      expect(result.toString()).assertEqual("Caf\u00E9--");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1400
     * @tc.name testPadRight014
     * @tc.desc Verify padRight() can use a Unicode BMP char as padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.padRight(c'\u4E2D', 3);
      expect(result.toString()).assertEqual("A\u4E2D\u4E2D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1500
     * @tc.name testPadRight015
     * @tc.desc Verify padRight() can use tab as a C0 control padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let result: String = text.padRight(c'\t', 3);
      expect(result.toString()).assertEqual("X\t\t");
    });
  });
}
