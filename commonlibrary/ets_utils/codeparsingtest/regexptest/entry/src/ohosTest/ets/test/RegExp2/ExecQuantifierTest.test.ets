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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

class ExecQuantifier {
  static execGreedy(input: string): RegExpExecArray | null {
    return /a.*b/.exec(input);
  }

  static execNonGreedy(input: string): RegExpExecArray | null {
    return /a.*?b/.exec(input);
  }

  static execExact(input: string): RegExpExecArray | null {
    return /a{3}/.exec(input);
  }

  static execRange(input: string): RegExpExecArray | null {
    return /a{2,4}/.exec(input);
  }

  static execZeroOrMore(input: string): RegExpExecArray | null {
    return /a*b/.exec(input);
  }

  static execOneOrMore(input: string): RegExpExecArray | null {
    return /a+b/.exec(input);
  }
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function execQuantifierTest() {
  describe('Quantifier_Tests', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec greedy quantifier .*
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecQuantifier.execGreedy("a123b456b");
      expect(result?.[0]).assertEqual("a123b456b");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec non-greedy quantifier .*?
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecQuantifier.execNonGreedy("a123b456b");
      expect(result?.[0]).assertEqual("a123b");
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec fixed count quantifier a{3}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecQuantifier.execExact("aaab");
      expect(result?.[0]).assertEqual("aaa");
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec range quantifier a{2,4}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecQuantifier.execRange("aa");
      const result2 = ExecQuantifier.execRange("aaa");
      const result3 = ExecQuantifier.execRange("aaaa");
      expect(result1?.[0]).assertEqual("aa");
      expect(result2?.[0]).assertEqual("aaa");
      expect(result3?.[0]).assertEqual("aaaa");
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0500
     * @tc.desc   Test RegExp.prototype.exec zero-or-more quantifier a*
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecQuantifier.execZeroOrMore("b");
      const result2 = ExecQuantifier.execZeroOrMore("ab");
      const result3 = ExecQuantifier.execZeroOrMore("aaab");
      expect(result1?.[0]).assertEqual("b");
      expect(result2?.[0]).assertEqual("ab");
      expect(result3?.[0]).assertEqual("aaab");
    });

    /**
     * @tc.name testExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0600
     * @tc.desc   Test RegExp.prototype.exec one-or-more quantifier a+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecQuantifier.execOneOrMore("ab");
      const result2 = ExecQuantifier.execOneOrMore("aaab");
      expect(result1?.[0]).assertEqual("ab");
      expect(result2?.[0]).assertEqual("aaab");
    });
  });
}
