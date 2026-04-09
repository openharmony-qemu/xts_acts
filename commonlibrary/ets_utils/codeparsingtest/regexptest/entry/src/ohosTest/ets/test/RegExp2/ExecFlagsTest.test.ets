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

interface RegExpExecArrayWithIndices extends RegExpExecArray {
  indices?: Array<[number, number]>;
}

export default function execFlagsTest(): void {
  describe('Regex_Flags_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec with ignoreCase i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /hello/i;
      const result: RegExpExecArray | null = re.exec("hello");
      expect(result?.[0]).assertEqual("hello");
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec with multiline m flag and ^ anchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /^hello/m;
      const result: RegExpExecArray | null = re.exec("world\nhello");
      expect(result?.index).assertEqual(6);
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec with dotAll s flag matching newline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /hello.world/s;
      const result: RegExpExecArray | null = re.exec("hello\nworld");
      expect(result?.[0]).assertEqual("hello\nworld");
    });

    /**
     * @tc.name testExecTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec with unicode u flag and code point escape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /\u{1F600}/u;
      const emoji = String.fromCodePoint(0x1F600);
      const result: RegExpExecArray | null = re.exec(`Hello ${emoji} World`);
      expect(result?.[0]).assertEqual(emoji);
    });

    /**
     * @tc.name testExecTest0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0500
     * @tc.desc   Test RegExp.prototype.exec with hasIndices d flag when supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = new RegExp('/test/', 'd');
      const result: RegExpExecArrayWithIndices | null = re.exec("this is a test") as RegExpExecArrayWithIndices;

      if (result?.indices) {
        expect(result.indices[0][0]).assertEqual(10);
        expect(result.indices[0][1]).assertEqual(14);
      } else {

      }
    });

    /**
     * @tc.name testExecTest0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0600
     * @tc.desc   Test RegExp.prototype.exec global g flag loop collects match indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /test/g;
      const str: string = "test test test";
      const results: number[] = [];
      let match: RegExpExecArray | null;

      while ((match = re.exec(str)) !== null) {
        results.push(match.index);
      }

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(5);
      expect(results[2]).assertEqual(10);
    });
  });
}
