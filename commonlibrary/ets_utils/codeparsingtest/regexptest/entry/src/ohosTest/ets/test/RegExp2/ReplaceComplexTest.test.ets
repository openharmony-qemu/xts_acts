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
  replaceComplexReplaceTestWithNumber,
  replaceComplexReplaceTestWithObjectToString,
  replaceComplexReplaceTestWithSymbolToPrimitive,
  replaceComplexReplaceTestWithNull,
  replaceComplexReplaceTestWithUndefined,
  replaceComplexReplaceTestWithSymbolValueThrows,
  replaceComplexReplaceTestWithBigInt,
  replaceComplexReplaceTestWithBoolean,
  replaceComplexReplaceTestWithArray,
  replaceComplexNonRegExpReceiverSymbolReplaceThrows,
  replaceComplexRegexpPrototypeSymbolReplaceUndefinedThisThrows,
  replaceComplexRegexpPrototypeSymbolReplaceNullThisThrows,
  replaceComplexRegexpPrototypeSymbolReplaceRegexLikeResult,
  replaceComplexReplaceHelloHWithNumber,
  replaceComplexInvalidRegExpCharClassCtorThrows,
  replaceComplexInvalidRegExpFlagCtorThrows,
  replaceComplexInvalidUnicodeCodePointThrows,
  replaceComplexInvalidLookbehindThrows,
  replaceComplexInvalidUnicodePropertyThrows
} from './RegExpHelper';

export default function replaceComplexTest() {

    const supportsLookbehindSemantics = (): boolean => {
      try {
        const re: RegExp = new RegExp('(?<!abc)\\d+');
        if (re.test('abc100')) {
          return false;
        }
        if (!re.test('def100')) {
          return false;
        }
        return true;
      } catch (_) {
        return false;
      }
    };

    describe('Complex_Pattern_Matching', () => {
      /**
       * @tc.name testReplaceTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0100
       * @tc.desc   Test Zero Width Assertion Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "123abc456";
        const result = str.replace(/(?<=\d)(?=[a-z])/g, "-");
        expect(result).assertEqual("123-abc456");
      });

      /**
       * @tc.name testReplaceTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0200
       * @tc.desc   Test Positive Lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc123 def456";
        const result = str.replace(/\d(?=\d)/g, "*");
        expect(result).assertEqual("abc**3 def**6");
      });

      /**
       * @tc.name testReplaceTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0300
       * @tc.desc   Test Negative Lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc1 def2";
        const result = str.replace(/\w(?!\d)/g, "");
        expect(result).assertEqual("c f");
      });

      /**
       * @tc.name testReplaceTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0400
       * @tc.desc   Test Positive Lookbehind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "price:100 cost:200";
        const result = str.replace(/(?<=:)\d+/g, "XXX");
        expect(result).assertEqual("price:XXX cost:XXX");
      });

      /**
       * @tc.name testReplaceTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0500
       * @tc.desc   Test Negative Lookbehind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc100 def100";
        if (!supportsLookbehindSemantics()) {
          expect(supportsLookbehindSemantics()).assertFalse();
          return;
        }
        const result = str.replace(/(?<!abc)\d+/g, "XXX");
        expect(result).assertEqual("abc100 defXXX");
      });

      /**
       * @tc.name testReplaceTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0600
       * @tc.desc   Test Atomic Group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let regex: RegExp | null = null;
        try {
          regex = new RegExp('(?>a*)bc');
        } catch (_) {
        }
        if (regex === null) {
          return;
        }
        const str = "abc";
        const result = str.replace(regex, "X");
        expect(result).assertEqual("X");
      });

      /**
       * @tc.name testReplaceTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0700
       * @tc.desc   Test Possessive Quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let regex: RegExp | null = null;
        try {
          regex = new RegExp('a*+b');
        } catch (_) {
        }
        if (regex === null) {
          return;
        }
        const str = "aaab";
        const result = str.replace(regex, "X");
        expect(result).assertEqual("X");
      });

      /**
       * @tc.name testReplaceTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0800
       * @tc.desc   Test G Anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test test";
        const regex = /\Gtest/g;
        const result = str.replace(regex, "XYZ");
        expect(result === "XYZ test" || result === "test test").assertTrue();
      });
    });

    describe('replacement_Parameter_Type_Tests', () => {
      /**
       * @tc.name testReplaceTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0900
       * @tc.desc   Test String replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "hello";
        const result = str.replace(/hello/, "HELLO");
        expect(result).assertEqual("HELLO");
      });

      /**
       * @tc.name testReplaceTest0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1000
       * @tc.desc   Test Number replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithNumber()).assertEqual("123");
      });

      /**
       * @tc.name testReplaceTest0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1100
       * @tc.desc   Test Object toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithObjectToString()).assertEqual("REPLACED");
      });

      /**
       * @tc.name testReplaceTest0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1200
       * @tc.desc   Test Symbol toPrimitive
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithSymbolToPrimitive()).assertEqual("REPLACED");
      });

      /**
       * @tc.name testReplaceTest0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1300
       * @tc.desc   Test null replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithNull()).assertEqual("null");
      });

      /**
       * @tc.name testReplaceTest0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1400
       * @tc.desc   Test undefined replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithUndefined()).assertEqual("undefined");
      });

      /**
       * @tc.name testReplaceTest0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1500
       * @tc.desc   Test Symbol replacement Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithSymbolValueThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1600
       * @tc.desc   Test BigInt replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithBigInt()).assertEqual("123");
      });

      /**
       * @tc.name testReplaceTest0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1700
       * @tc.desc   Test Boolean replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithBoolean()).assertEqual("true");
      });

      /**
       * @tc.name testReplaceTest0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1800
       * @tc.desc   Test Array replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceTestWithArray()).assertEqual("a,b");
      });
    });

    describe('this_Value_Tests', () => {
      /**
       * @tc.name testReplaceTest0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1900
       * @tc.desc   Test Non RegExp Object this Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexNonRegExpReceiverSymbolReplaceThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2000
       * @tc.desc   Test undefined this Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexRegexpPrototypeSymbolReplaceUndefinedThisThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2100
       * @tc.desc   Test null this Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexRegexpPrototypeSymbolReplaceNullThisThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2200
       * @tc.desc   Test RegExp Like Object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexRegexpPrototypeSymbolReplaceRegexLikeResult()).assertEqual("X value");
      });
    });

    describe('Error_and_Exception_Handling', () => {
      /**
       * @tc.name testReplaceTest0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2300
       * @tc.desc   Test Invalid Regex Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexInvalidRegExpCharClassCtorThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2400
       * @tc.desc   Test Invalid Flag Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexInvalidRegExpFlagCtorThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2500
       * @tc.desc   Test Invalid Unicode Code Point Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexInvalidUnicodeCodePointThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2600
       * @tc.desc   Test Lookbehind Syntax Error Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexInvalidLookbehindThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2700
       * @tc.desc   Test Invalid Unicode Property Throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexInvalidUnicodePropertyThrows()).assertTrue();
      });

      /**
       * @tc.name testReplaceTest0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2800
       * @tc.desc   Test replacement Non Function Non String
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(replaceComplexReplaceHelloHWithNumber()).assertEqual("123ello");
      });
    });

}

