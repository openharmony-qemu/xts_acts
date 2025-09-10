/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'

export default function RegExpTest() {
  describe('RegExpTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number REGEXP_TEST_001
     * @tc.name regexpTest001
     * @tc.desc The regular equivalence between literals and constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('regexpTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const literalReg = /ab+c/;
      const constructorReg = new RegExp("ab+c");
      expect(literalReg.test("abbc")).assertEqual(constructorReg.test("abbc"));
    })

    /**
     * @tc.number REGEXP_TEST_002
     * @tc.name regexpTest002
     * @tc.desc The constructor dynamically generates regular expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('regexpTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const simpleReg = /abc/;
      expect(simpleReg.test("abc")).assertEqual(true);
    })
    /**

     @tc.number REGEXP_TEST_003
     @tc.name regexpTest003
     @tc.desc Simple pattern matches the exact characters that exist
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const simpleReg = /abc/;
      expect(simpleReg.test("abc")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_004
     @tc.name regexpTest004
     @tc.desc The simple mode does not match characters containing Spaces
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const simpleReg = /abc/;
      expect(simpleReg.test("ab c")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_005
     @tc.name regexpTest005
     @tc.desc After escaping *, match a*b
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const escapeReg = /a\*b/;
      expect(escapeReg.test("a*b")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_006
     @tc.name regexpTest006
     @tc.desc After escaping *, it does not match ab
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const escapeReg = /a\*b/;
      expect(escapeReg.test("ab")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_007
     @tc.name regexpTest007
     @tc.desc After escaping the backslash, match C:\
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const escapeReg = /C:\\/;
      expect(escapeReg.test("C:\\")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_008
     @tc.name regexpTest008
     @tc.desc Escaping the backslash does not match C:/
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const escapeReg = /C:\\/;
      expect(escapeReg.test("C:/")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_009
     @tc.name regexpTest009
     @tc.desc The previous element is allowed to appear 0 times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const starReg = /ab*c/;
      expect(starReg.test("ac")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_010
     @tc.name regexpTest010
     @tc.desc *The previous element is allowed to appear once
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const starReg = /ab*c/;
      expect(starReg.test("abc")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_011
     @tc.name regexpTest011
     @tc.desc * Allow the previous element to appear multiple times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const starReg = /ab*c/;
      expect(starReg.test("abbbc")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_012
     @tc.name regexpTest012
     @tc.desc + The previous element is allowed to appear once
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const plusReg = /a+/;
      expect(plusReg.test("a")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_013
     @tc.name regexpTest013
     @tc.desc + Allow the previous element to appear multiple times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const plusReg = /a+/;
      expect(plusReg.test("aaaa")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_014
     @tc.name regexpTest014
     @tc.desc + The previous element is not allowed to appear 0 times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const plusReg = /a+/;
      expect(plusReg.test("")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_015
     @tc.name regexpTest015
     @tc.desc ? The previous element is allowed to appear 0 times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const questionReg = /a?b/;
      expect(questionReg.test("b")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_016
     @tc.name regexpTest016
     @tc.desc ? The previous element is allowed to appear once
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const questionReg = /a?b/;
      expect(questionReg.test("ab")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_017
     @tc.name regexpTest017
     @tc.desc {2,3} The lower limit of matching times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const rangeReg = /a{2,3}/;
      expect(rangeReg.test("aa")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_018
     @tc.name regexpTest018
     @tc.desc {2,3} Upper limit of matching times
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const rangeReg = /a{2,3}/;
      expect(rangeReg.test("aaa")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_019
     @tc.name regexpTest019
     @tc.desc {2,3} The number of times does not match below the lower limit
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const rangeReg = /a{2,3}/;
      expect(rangeReg.test("a")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_020
     @tc.name regexpTest020
     @tc.desc The preemptive assertion matches x followed by y
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const lookaheadReg = /Jack(?=Sprat)/;
      expect(lookaheadReg.test("JackSprat")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_021
     @tc.name regexpTest021
     @tc.desc The prior assertion does not match that x is not followed by y
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const lookaheadReg = /Jack(?=Sprat)/;
      expect(lookaheadReg.test("JackFrost")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_022
     @tc.name regexpTest022
     @tc.desc The subsequent assertion matches that x is preceded by y
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const lookbehindReg = /(?<=Jack)Sprat/;
      expect(lookbehindReg.test("JackSprat")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_023
     @tc.name regexpTest023
     @tc.desc The subsequent assertion does not match that x is not preceded by y
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const lookbehindReg = /(?<=Jack)Sprat/;
      expect(lookbehindReg.test("TomSprat")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_024
     @tc.name regexpTest024
     @tc.desc Positive and negative search matching
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const negLookaheadReg = /\d+(?!\.)/;
      expect(negLookaheadReg.exec("3.141")![0]).assertEqual("141");
    })

    /**

     @tc.number REGEXP_TEST_025
     @tc.name regexpTest025
     @tc.desc \d Match numbers
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(/\d/.test("123")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_026
     @tc.name regexpTest026
     @tc.desc \d Non-matching numbers
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(/\d/.test("abc")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_027
     @tc.name regexpTest027
     @tc.desc \s Unmatched blank
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(/\s/.test(" ")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_028
     @tc.name regexpTest028
     @tc.desc \s Mismatch is non-blank
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(/\s/.test("a")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_029
     @tc.name regexpTest029
     @tc.desc The capture group matches the backreference
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const groupReg = /(foo) (bar) \1 \2/;
      expect(groupReg.test("foo bar foo bar")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_030
     @tc.name regexpTest030
     @tc.desc The capture group does not match the backreference
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const groupReg = /(foo) (bar) \1 \2/;
      expect(groupReg.test("foo bar baz bar")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_031
     @tc.name regexpTest031
     @tc.desc In replace, $n references are used for grouping
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const replaceStr = "bar foo".replace(/(...) (...)/, "$2 $1");
      expect(replaceStr).assertEqual("foo bar");
    })

    /**

     @tc.number REGEXP_TEST_032
     @tc.name regexpTest032
     @tc.desc ^Match the beginning
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(/^A/.test("An apple")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_033
     @tc.name regexpTest033
     @tc.desc ^ does not match a non-beginning
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(/^A/.test("an A")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_034
     @tc.name regexpTest034
     @tc.desc Ignore the case flag i for matching
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseInsensitiveReg = /abc/i;
      expect(caseInsensitiveReg.test("ABC")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_035
     @tc.name regexpTest035
     @tc.desc The global flag g matches all results
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const globalReg = /a/g;
      expect("aaa".match(globalReg)!.length).assertEqual(3);
    })

    /**

     @tc.number REGEXP_TEST_036
     @tc.name regexpTest036
     @tc.desc The viscous mode (y) starts matching from lastIndex
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /hello/y;
      re.lastIndex = 4;
      expect(re.test("abc hello")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_037
     @tc.name regexpTest037
     @tc.desc The sticky mode (y) does not match the lastIndex position
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /hello/y;
      re.lastIndex = 7;
      expect(re.test("abc hello")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_038
     @tc.name regexpTest038
     @tc.desc matchAll return all matching and capture groups
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /(\d+)/g;
      const str = "123 456";
      const matches = Array.from(str.matchAll(re));
      expect(matches.length).assertEqual(2);
    })

    /**

     @tc.number REGEXP_TEST_039
     @tc.name regexpTest039
     @tc.desc The capture group content of matchAll is correct
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /(\d+)/g;
      const str = "123 456";
      const matches = Array.from(str.matchAll(re));
      expect(matches[0][1]).assertEqual("123");
    })

    /**

     @tc.number REGEXP_TEST_040
     @tc.name regexpTest040
     @tc.desc exec iterates and matches in global mode
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /a/g;
      const str = "aaa";
      re.exec(str);
      expect(re.lastIndex).assertEqual(1);
    })

    /**

     @tc.number REGEXP_TEST_041
     @tc.name regexpTest041
     @tc.desc In non-global mode, exec does not update lastIndex
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /a/;
      const str = "aaa";
      re.exec(str);
      expect(re.lastIndex).assertEqual(0);
    })

    /**

     @tc.number REGEXP_TEST_042
     @tc.name regexpTest042
     @tc.desc The character set [] matches characters within the range
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /[abc]/;
      expect(re.test("b")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_043
     @tc.name regexpTest043
     @tc.desc The reverse character set [^] matches characters outside the range
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /[^abc]/;
      expect(re.test("d")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_044
     @tc.name regexpTest044
     @tc.desc The character range [a-z] matches lowercase letters
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /[a-z]/;
      expect(re.test("x")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_045
     @tc.name regexpTest045
     @tc.desc Logical or matches multiple options
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /apple|banana/;
      expect(re.test("banana")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_046
     @tc.name regexpTest046
     @tc.desc Non-capture group (?) :) Do not capture sub-matches
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /(?:foo)(bar)/;
      const result = re.exec("foobar");
      expect(result!.length).assertEqual(2);
    })

    /**

     @tc.number REGEXP_TEST_047
     @tc.name regexpTest047
     @tc.desc \b matches the word boundary
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /\bword\b/;
      expect(re.test("test word test")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_048
     @tc.name regexpTest048
     @tc.desc \B matches non-word boundaries
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /\Bword\B/;
      expect(re.test("swordsmith")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_049
     @tc.name regexpTest049
     @tc.desc Greedy quantifiers match the longest possibility
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /a.+/;
      expect(re.exec("abcde")![0]).assertEqual("abcde");
    })

    /**

     @tc.number REGEXP_TEST_050
     @tc.name regexpTest050
     @tc.desc Non-greedy quantifiers match the shortest possible
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /a.+?/;
      expect(re.exec("abcde")![0]).assertEqual("ab");
    })

    /**

     @tc.number REGEXP_TEST_051
     @tc.name regexpTest051
     @tc.desc search returns the correct matching index
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const str = "hello world";
      expect(str.search(/world/)).assertEqual(6);
    })

    /**

     @tc.number REGEXP_TEST_052
     @tc.name regexpTest052
     @tc.desc search returns -1 when there is no match
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const str = "hello world";
      expect(str.search(/foo/)).assertEqual(-1);
    })

    /**

     @tc.number REGEXP_TEST_053
     @tc.name regexpTest053
     @tc.desc split splits strings based on regular expressions
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const str = "a,b,c";
      expect(str.split(/,/).length).assertEqual(3);
    })

    /**

     @tc.number REGEXP_TEST_054
     @tc.name regexpTest054
     @tc.desc Reverse negative search (?) <! y)x
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /(?<!-)\d+/;
      expect(re.test("123")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_055
     @tc.name regexpTest055
     @tc.desc Reverse negative search for situations where there is no match
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /^(?<!-)\d+/;
      expect(re.test("-123")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_056
     @tc.name regexpTest056
     @tc.desc In multi-line mode (m), ^ matches the beginning of each line
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /^hello/m;
      expect(re.test("hello\nhello")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_057
     @tc.name regexpTest057
     @tc.desc In multi-line mode (m), $matches the end of each line
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /world$/m;
      expect(re.test("hello world\nworld")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_058
     @tc.name regexpTest058
     @tc.desc The dotAll mode (s) enables. Match the newline character
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /a.b/s;
      expect(re.test("a\nb")).assertEqual(true);
    })

    /**

     @tc.number REGEXP_TEST_059
     @tc.name regexpTest059
     @tc.desc In non-Dotall mode. The newline character does not match
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /a.b/;
      expect(re.test("a\nb")).assertEqual(false);
    })

    /**

     @tc.number REGEXP_TEST_060
     @tc.name regexpTest060
     @tc.desc Unicode mode (u) supports extended characters
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 1
     */
    it('regexpTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const re = /\u{1F60A}/u;
      expect(re.test("😊")).assertEqual(true);
    })

  })
}
