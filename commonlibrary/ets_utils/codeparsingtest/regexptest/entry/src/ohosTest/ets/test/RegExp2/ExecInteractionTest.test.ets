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
import { regexpSymbolMatchAll, regexpSymbolSearch } from './RegExpHelper';

export default function execInteractionTest() {
  describe('Method_Interaction_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0100
     * @tc.desc   Test exec and test share lastIndex on same global RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /foo/g;
      const str: string = "foo foo";
      re.test(str);
      expect(re.lastIndex).assertEqual(3);
      const execResult = re.exec(str);
      expect(re.lastIndex).assertEqual(7);
      expect(execResult?.[0]).assertEqual("foo");
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0101
     * @tc.desc   Test exec results align with String.match for global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /foo/g;
      const str: string = "foo foo";
      const execResult1: RegExpExecArray | null = re.exec(str);
      const execResult2: RegExpExecArray | null = re.exec(str);
      re.lastIndex = 0;
      const matchResult: RegExpMatchArray | null = str.match(re);
      expect(execResult1?.[0]).assertEqual(matchResult?.[0]);
      expect(execResult2?.[0]).assertEqual(matchResult?.[1]);
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0102
     * @tc.desc   Test String.matchAll iterator yields same substrings as multiple exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /foo/g;
      const str: string = "foo foo";
      const matchAllIterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(re, str);
      const matchAllResults: RegExpMatchArray[] = Array.from(matchAllIterator);
      expect(matchAllResults.length).assertEqual(2);
      expect(matchAllResults[0][0]).assertEqual("foo");
      expect(matchAllResults[1][0]).assertEqual("foo");
    });

    /**
     * @tc.name testExecTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0103
     * @tc.desc   Test replace does not leave lastIndex mutated for non-global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /foo/;
      const str: string = "foo bar";
      const replaced: string = str.replace(re, "baz");
      expect(replaced).assertEqual("baz bar");
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExecTest0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0104
     * @tc.desc   Test exec match index equals RegExp @@search result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /hello/;
      const str: string = "say hello world";
      const execResult: RegExpExecArray | null = re.exec(str);
      const searchIndex: number = regexpSymbolSearch(re, str);
      expect(execResult?.index).assertEqual(searchIndex);
    });
  });
}
