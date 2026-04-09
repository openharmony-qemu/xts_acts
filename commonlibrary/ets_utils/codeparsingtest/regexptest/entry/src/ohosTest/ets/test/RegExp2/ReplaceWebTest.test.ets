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
  webCanInstantiateRegExp,
  webDetectHasIndices,
  webSubclassReplaceUppercase,
  webSubclassReplaceLogging,
  webSubclassSpeciesGlobalReplace,
  webMultipleReplaceChain,
  webComplexEmailRedact,
  webSquareDigitsReplace,
  webEscapeHTML,
  webUnescapeHTML,
  webToHyphenCase,
  webToCamelCase,
  webFormatPhone,
  webMarkdownToHTML,
  webEscapeSQL,
  webNormalizePath,
  webFormatCurrency,
  webMaskEmail
} from './RegExpHelper';

export default function replaceWebTest() {
    describe('Web_Compatibility_Tests', () => {
      /**
       * @tc.name testReplaceTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0100
       * @tc.desc   Test Detect Lookbehind Support
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supportsLookbehind: boolean = webCanInstantiateRegExp('(?<=a)b');
        expect(typeof supportsLookbehind === 'boolean').assertTrue();
      });

      /**
       * @tc.name testReplaceTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0200
       * @tc.desc   Test Detect Unicode Property Support
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supportsUnicodeProperties: boolean = webCanInstantiateRegExp('\\p{L}', 'u');
        expect(typeof supportsUnicodeProperties === 'boolean').assertTrue();
      });

      /**
       * @tc.name testReplaceTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0300
       * @tc.desc   Test Detect dotAll Support
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supportsDotAll: boolean = webCanInstantiateRegExp('.', 's');
        expect(typeof supportsDotAll === 'boolean').assertTrue();
      });

      /**
       * @tc.name testReplaceTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0400
       * @tc.desc   Test Detect hasIndices Support
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supportsHasIndices: boolean = webDetectHasIndices();
        expect(typeof supportsHasIndices === 'boolean').assertTrue();
      });

      /**
       * @tc.name testReplaceTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0500
       * @tc.desc   Test Different Engine Behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '';
        const result = str.replace(/(?:)/, 'X');
        expect(result).assertEqual('X');
      });
    });

    describe('RegExp_Subclass_Tests', () => {
      /**
       * @tc.name testReplaceTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0600
       * @tc.desc   Test Override Symbol replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webSubclassReplaceUppercase()).assertEqual('X VALUE');
      });

      /**
       * @tc.name testReplaceTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0700
       * @tc.desc   Test Call Super Method
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webSubclassReplaceLogging()).assertEqual('X value');
      });

      /**
       * @tc.name testReplaceTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0800
       * @tc.desc   Test Symbol species Impact
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webSubclassSpeciesGlobalReplace()).assertEqual('X X');
      });
    });

    describe('Performance_Related_Scenarios', () => {
      /**
       * @tc.name testReplaceTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_0900
       * @tc.desc   Test Multiple Replace Operations
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webMultipleReplaceChain()).assertEqual('aonebtwocthree');
      });

      /**
       * @tc.name testReplaceTest0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1000
       * @tc.desc   Test Complex Regex Global Replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webComplexEmailRedact()).assertEqual('Email: [REDACTED], [REDACTED]');
      });

      /**
       * @tc.name testReplaceTest0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1100
       * @tc.desc   Test Complex Calculation In Function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webSquareDigitsReplace()).assertEqual('values: 1, 4, 9, 16, 25');
      });
    });

    describe('Practical_Application_Scenarios', () => {
      /**
       * @tc.name testReplaceTest0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1200
       * @tc.desc   Test HTML Escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const result = webEscapeHTML('<script>alert("XSS")</script>');
        expect(result).assertEqual('&lt;script&gt;alert(&quot;XSS&quot;)&lt;/script&gt;');
      });

      /**
       * @tc.name testReplaceTest0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1300
       * @tc.desc   Test HTML Unescape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const result = webUnescapeHTML('&lt;div&gt;');
        expect(result).assertEqual('<div>');
      });

      /**
       * @tc.name testReplaceTest0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1400
       * @tc.desc   Test CamelCase to Hyphen Case
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webToHyphenCase('borderTopColor')).assertEqual('border-top-color');
      });

      /**
       * @tc.name testReplaceTest0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1500
       * @tc.desc   Test Hyphen Case to CamelCase
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webToCamelCase('border-top-color')).assertEqual('borderTopColor');
      });

      /**
       * @tc.name testReplaceTest0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1600
       * @tc.desc   Test Phone Number Formatting
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webFormatPhone('1234567890')).assertEqual('(123) 456-7890');
      });

      /**
       * @tc.name testReplaceTest0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1700
       * @tc.desc   Test Date Format Conversion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const dateStr = '2023-12-25';
        const result = dateStr.replace(/(\d{4})-(\d{2})-(\d{2})/, '$3/$2/$1');
        expect(result).assertEqual('25/12/2023');
      });

      /**
       * @tc.name testReplaceTest0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1800
       * @tc.desc   Test URL Parameter Extraction And Replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const url = 'https://example.com/?name=John&age=30';
        const result = url.replace(/name=([^&]+)/, 'name=$1_Doe');
        expect(result).assertEqual('https://example.com/?name=John_Doe&age=30');
      });

      /**
       * @tc.name testReplaceTest0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_1900
       * @tc.desc   Test Markdown Format Conversion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */

      it('testReplaceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const result = webMarkdownToHTML('**bold** and *italic*');
        expect(result).assertEqual('<strong>bold</strong> and <em>italic</em>');
      });

      /**
       * @tc.name testReplaceTest0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_2000
       * @tc.desc   Test SQL Injection Protection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webEscapeSQL("It's a test")).assertEqual("It''s a test");
      });

      /**
       * @tc.name testReplaceTest0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_2100
       * @tc.desc   Test File Path Normalization
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webNormalizePath('C:\\Users\\test')).assertEqual('C:/Users/test');
      });

      /**
       * @tc.name testReplaceTest0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_2200
       * @tc.desc   Test Currency Formatting
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webFormatCurrency('Price: $1234.56')).assertEqual('Price: 1,234.56');
      });

      /**
       * @tc.name testReplaceTest0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_WEB_TEST_2300
       * @tc.desc   Test Sensitive Information Masking
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(webMaskEmail('john.doe@example.com')).assertEqual('j***@example.com');
      });
    });

}


