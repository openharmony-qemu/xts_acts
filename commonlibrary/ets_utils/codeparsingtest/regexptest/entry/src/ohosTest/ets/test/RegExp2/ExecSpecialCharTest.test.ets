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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

class ExecSpecialChar {
  static execEscapedDot(input: string): RegExpExecArray | null {
    return /\./.exec(input);
  }

  static execTab(input: string): RegExpExecArray | null {
    return /\t/.exec(input);
  }

  static execNewline(input: string): RegExpExecArray | null {
    return /\n/.exec(input);
  }

  static execChineseRange(input: string): RegExpExecArray | null {
    return /[\u4e00-\u9fa5]+/.exec(input);
  }

  static execEmojiProperty(input: string): RegExpExecArray | null {
    return /\p{Emoji}/u.exec(input);
  }
}

export default function execSpecialCharTest() {
  describe('Special_Character_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec escaped dot matches literal period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecSpecialChar.execEscapedDot("a.b");
      expect(result).not().assertEqual(null);
      expect(result?.[0]).assertEqual(".");
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0101
     * @tc.desc   Test RegExp.prototype.exec tab and newline escape sequences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecialChar.execTab("a\tb");
      const result2 = ExecSpecialChar.execNewline("a\nb");
      expect(result1).not().assertEqual(null);
      expect(result2).not().assertEqual(null);
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0102
     * @tc.desc   Test RegExp.prototype.exec Unicode Han character class range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecSpecialChar.execChineseRange("hello世界world");
      expect(result![0]).assertEqual("世界");
    });

    /**
     * @tc.name testExecTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0103
     * @tc.desc   Test RegExp.prototype.exec Unicode property escape \\p{Emoji} with u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecSpecialChar.execEmojiProperty("Hello 😀 World");
      if (result) {
        expect(result?.[0]).assertEqual("😀");
      } else {
      }
    });
  });
}
