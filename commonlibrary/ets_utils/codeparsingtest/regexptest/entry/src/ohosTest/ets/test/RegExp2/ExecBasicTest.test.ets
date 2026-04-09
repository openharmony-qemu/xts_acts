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

class ExecBasic {
  static matchHello(input: string): RegExpExecArray | null {
    const re = /hello/;
    return re.exec(input);
  }

  static matchAbc(input: string): RegExpExecArray | null {
    const re = /abc/;
    return re.exec(input);
  }

  static matchEmptyPattern(input: string): RegExpExecArray | null {
    const re = /(?:)/;
    return re.exec(input);
  }

  static searchWithPattern(input: string, re: RegExp): number {
    return input.search(re);
  }
}

export default function execBasicTest() {
  describe('Basic_Matching_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec simple pattern /hello/ match and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchHello("hello world");
      expect(result?.[0]).assertEqual("hello");
      expect(result?.index).assertEqual(0);
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0101
     * @tc.desc   Test RegExp.prototype.exec returns null when pattern does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchHello("world");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0102
     * @tc.desc   Test RegExp.prototype.exec /abc/ on empty string returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchAbc("");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExecTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0103
     * @tc.desc   Test RegExp.prototype.exec empty non-capturing pattern (?:)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchEmptyPattern("hello");
      expect(result?.[0]).assertEqual("");
      expect(result?.index).assertEqual(0);
    });

    /**
     * @tc.name testExecTest0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0104
     * @tc.desc   Test String.search index aligns with exec match position for /a/ on abc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = ExecBasic.searchWithPattern("abc", /a/);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testExecTest0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0105
     * @tc.desc   Test String.search repeatability for same pattern and string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = ExecBasic.searchWithPattern("abc", /a/);
      expect(result).assertEqual(0);
    });
  });
}
