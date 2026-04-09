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
import {
  extreme17_1CustomSymbolReplaceObject,
  extreme17_2RegexpSymbolReplaceDirectCall,
  extreme17_3ParameterOrderVerification,
  extreme18_1RecursiveReplacement,
  extreme18_2ConditionalReplacement,
  extreme18_3AccumulativeReplacement,
  extreme18_4ContextAwareReplacement,
  extreme18_5LookupTableReplacement
} from './RegExpHelper';

export default function replaceExtremeTest() {

    describe('Symbol_replace_Custom_Behavior', () => {
      /**
       * @tc.name testReplaceTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0100
       * @tc.desc   Test Custom_Symbol_replace_Object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme17_1CustomSymbolReplaceObject()).assertEqual('olleH!');
      });

      /**
       * @tc.name testReplaceTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0101
       * @tc.desc   Test RegExp_Symbol_replace_Direct_Call
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */

      it('testReplaceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme17_2RegexpSymbolReplaceDirectCall()).assertEqual('Hello There, There!');
      });

      /**
       * @tc.name testReplaceTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0102
       * @tc.desc   Test Parameter_Order_Verification
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme17_3ParameterOrderVerification()).assertTrue();
      });
    });

    describe('Advanced_Scenario_Tests', () => {
      /**
       * @tc.name testReplaceTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0103
       * @tc.desc   Test Recursive_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_1RecursiveReplacement()).assertEqual('abc');
      });

      /**
       * @tc.name testReplaceTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0104
       * @tc.desc   Test Conditional_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_2ConditionalReplacement()).assertEqual('item10, item20, item30');
      });

      /**
       * @tc.name testReplaceTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0105
       * @tc.desc   Test Accumulative_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_3AccumulativeReplacement()).assertEqual('a1 b2 c3 d4 e5');
      });

      /**
       * @tc.name testReplaceTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0106
       * @tc.desc   Test Context_Aware_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_4ContextAwareReplacement()).assertEqual('HELLO world hi universe');
      });

      /**
       * @tc.name testReplaceTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0107
       * @tc.desc   Test Lookup_Table_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(extreme18_5LookupTableReplacement()).assertEqual('dog bird cat');
      });
    });

    describe('Boundary_Case_Extension_Tests', () => {
      /**
       * @tc.name testReplaceTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0108
       * @tc.desc   Test Extreme_Quantifier_Value
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(1000);
        const regex = /a{1000}/;
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('X');
      });

      /**
       * @tc.name testReplaceTest0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0109
       * @tc.desc   Test Many_Capture_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let pattern = '';
        for (let i = 0; i < 50; i++) {
          pattern += '(\\w)';
        }
        const regex = new RegExp(`^${pattern}$`);
        const str = 'a'.repeat(50);
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('X');
      });

      /**
       * @tc.name testReplaceTest0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0110
       * @tc.desc   Test Deeply_Nested_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = /(((a)))/;
        const str = 'a';
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('X');
      });

      /**
       * @tc.name testReplaceTest0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0111
       * @tc.desc   Test Zero_Match_Loop_Guard
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test';
        const regex = /(?=)/g;
        const result = str.replace(regex, 'X');
        expect(result).assertEqual('XtXeXsXtX');
      });

      /**
       * @tc.name testReplaceTest0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0112
       * @tc.desc   Test Special_Unicode_Combination
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'e\u0301';
        const result1 = str.replace(/^./u, 'X');
        const result2 = str.replace(/^\S/u, 'X');
        expect(result1).assertEqual('X\u0301');
        expect(result2).assertEqual('X\u0301');
      });
    });

    describe('String_Parameter_Extension_Tests', () => {
      /**
       * @tc.name testReplaceTest0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0113
       * @tc.desc   Test String_Pattern_Auto_Escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a.b.c';
        const result = str.replace('.', '_');
        expect(result).assertEqual('a_b.c');
      });

      /**
       * @tc.name testReplaceTest0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0114
       * @tc.desc   Test String_Pattern_Limitations
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'John Smith';
        const result = str.replace('(\\w+)\\s(\\w+)', '$2, $1');
        expect(result).assertEqual('John Smith');
      });

      /**
       * @tc.name testReplaceTest0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTREME_TEST_0115
       * @tc.desc   Test String_Pattern_vs_Regex_Pattern_Comparison
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test';
        const result1 = str.replace('test', 'X');
        const result2 = str.replace(/test/, 'X');
        const result3 = str.replace(/test/g, 'X');
        expect(result1).assertEqual('X test');
        expect(result2).assertEqual('X test');
        expect(result3).assertEqual('X X');
      });
    });

}

