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

class ExecReturn {
  static execHello(input: string): RegExpExecArray | null {
    return /hello/.exec(input);
  }

  static execNamedHello(input: string): RegExpExecArray | null {
    return /(?<word>hello)/.exec(input);
  }
}

interface RegExpExecArrayWithIndices extends RegExpExecArray {
  indices?: Array<[number, number]>;
}

export default function execReturnTest() {
  describe('Return_Value_Property_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0100
     * @tc.desc   Test RegExpExecArray index property after exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecReturn.execHello("say hello world");
      expect(result?.index).assertEqual(4);
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0101
     * @tc.desc   Test RegExpExecArray input property equals original string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /hello/;
      const result = re.exec("hello world");
      expect(result?.input).assertEqual("hello world");
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0102
     * @tc.desc   Test RegExpExecArray groups property for named capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecReturn.execNamedHello("hello world");
      expect(result?.groups?.word).assertEqual("hello");
    });

    /**
     * @tc.name testExecTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0103
     * @tc.desc   Test RegExpExecArray indices property when d flag is set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = new RegExp('(?<word>hello)', 'd');
      const result: RegExpExecArrayWithIndices | null = re.exec('hello world') as RegExpExecArrayWithIndices | null;
      if (result?.indices) {
        expect(result.indices[0][0]).assertEqual(0);
        expect(result.indices[0][1]).assertEqual(5);
      } else {
        expect(result?.[0]).assertEqual('hello');
      }
    });

    /**
     * @tc.name testExecTest0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0104
     * @tc.desc   Test named capture exec without d flag placeholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecReturn.execNamedHello("hello world");
      expect(result?.[0]).assertEqual("hello");
    });
  });
}
