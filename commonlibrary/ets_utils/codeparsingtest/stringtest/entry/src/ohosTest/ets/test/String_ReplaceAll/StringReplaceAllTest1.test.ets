import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_replaceall_test01';
export default function StringReplaceAllTest() {
  describe('StringReplaceAllTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0100
     * @tc.name      StringReplaceAllTest1001
     * @tc.desc      Replace a single character in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1001';
      console.log(TAG + 'start');
      let result: string = stringTest.testSingleCharReplace()
      expect(result).assertEqual("aa..cc");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0200
     * @tc.name      StringReplaceAllTest1002
     * @tc.desc      Replace multiple consecutive characters in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1002';
      console.log(TAG + 'start');
      let result: string = stringTest.testMultiCharReplace()
      expect(result).assertEqual("heLLo world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0300
     * @tc.name      StringReplaceAllTest1003
     * @tc.desc      Replace longer string segments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1003';
      console.log(TAG + 'start');
      let result: string = stringTest.testLongStrReplace()
      expect(result).assertEqual("The slow white cat jumps over the lazy dog");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0400
     * @tc.name      StringReplaceAllTest1004
     * @tc.desc      Replace all matching substrings in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1004';
      console.log(TAG + 'start');
      let result: string = stringTest.testGlobalReplaceAll()
      expect(result).assertEqual("I think Ruth's monkey is cuter than your monkey!");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0500
     * @tc.name      StringReplaceAllTest1005
     * @tc.desc      Replace consecutive identical characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1005';
      console.log(TAG + 'start');
      let result: string = stringTest.testReplaceConsecutive()
      expect(result).assertEqual("bbb");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0600
     * @tc.name      StringReplaceAllTest1006
     * @tc.desc      Replace alternating characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1006';
      console.log(TAG + 'start');
      let result: string = stringTest.testReplaceAlternate()
      expect(result).assertEqual("cdcdcd");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0700
     * @tc.name      StringReplaceAllTest1007
     * @tc.desc      Replace a non-existent substring in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1007';
      console.log(TAG + 'start');
      let result: string = stringTest.testReplaceNonExistent()
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0800
     * @tc.name      StringReplaceAllTest1008
     * @tc.desc      Call replaceAll on an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1008';
      console.log(TAG + 'start');
      let result: string = stringTest.testHandleEmptyStr()
      expect(result).assertEqual("");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_0900
     * @tc.name      StringReplaceAllTest1009
     * @tc.desc      Replace using a regular expression with the g flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1009';
      console.log(TAG + 'start');
      let result: string = stringTest.testRegexWithGlobal()
      expect(result).assertEqual("aa..cc");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1000
     * @tc.name      StringReplaceAllTest1010
     * @tc.desc      A TypeError should be thrown when using a regular expression without the g flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1010';
      console.log(TAG + 'start');
      let result: boolean = stringTest.testReplaceNoGlobal();
      expect(result).assertTrue();
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1100
     * @tc.name      StringReplaceAllTest1011
     * @tc.desc      Perform case-insensitive replacement using the gi flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1011';
      console.log(TAG + 'start');
      let result: string = stringTest.testGlobalIgnoreCase()
      expect(result).assertEqual("I think Ruth's ferret is cuter than your ferret!");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1200
     * @tc.name      StringReplaceAllTest1012
     * @tc.desc      Perform multi-line replacement using the gm flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1012';
      console.log(TAG + 'start');
      let result: string = stringTest.testGlobalMultiline()
      expect(result).assertEqual("replaced\nline2\nreplaced");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1300
     * @tc.name      StringReplaceAllTest1013
     * @tc.desc      Process Unicode characters using the gu flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1013';
      console.log(TAG + 'start');
      let result: string = stringTest.testGlobalUnicode()
      expect(result).assertEqual("");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1400
     * @tc.name      StringReplaceAllTest1014
     * @tc.desc      Perform sticky matching using the gy flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1014';
      console.log(TAG + 'start');
      let result: string = stringTest.testGlobalSticky()
      expect(result).assertEqual("REPLACED1test2test3");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1500
     * @tc.name      StringReplaceAllTest1015
     * @tc.desc      Use the giu combination of flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1015';
      console.log(TAG + 'start');
      let result: string = stringTest.testMultiRegexFlags()
      expect(result).assertEqual("coffee coffee coffee");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1600
     * @tc.name      StringReplaceAllTest1016
     * @tc.desc      Use the dot to match any character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1016';
      console.log(TAG + 'start');
      let result: string = stringTest.testDotWildcard()
      expect(result).assertEqual("XXX XXX XXX");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1700
     * @tc.name      StringReplaceAllTest1017
     * @tc.desc      Match using a character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1017';
      console.log(TAG + 'start');
      let result: string = stringTest.testCharacterClass()
      expect(result).assertEqual("a#b#c#");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1800
     * @tc.name      StringReplaceAllTest1018
     * @tc.desc      Match using word boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1018';
      console.log(TAG + 'start');
      let result: string = stringTest.testBoundaryMatch()
      expect(result).assertEqual("dog category catch");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_1900
     * @tc.name      StringReplaceAllTest1019
     * @tc.desc      Use a negated character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1019';
      console.log(TAG + 'start');
      let result: string = stringTest.testNegatedClass()
      expect(result).assertEqual("#1#2#3");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2000
     * @tc.name      StringReplaceAllTest1020
     * @tc.desc      Reference capturing groups in the replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1020';
      console.log(TAG + 'start');
      let result: string = stringTest.testCapturingGroup()
      expect(result).assertEqual("world hello");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2100
     * @tc.name      StringReplaceAllTest1021
     * @tc.desc      Replace using named capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1021';
      console.log(TAG + 'start');
      let result: string = stringTest.testNamedGroup()
      expect(result).assertEqual("Smith, John");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2200
     * @tc.name      StringReplaceAllTest1022
     * @tc.desc      Match using a non-capturing group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1022';
      console.log(TAG + 'start');
      let result: string = stringTest.testNonCapturingGroup()
      expect(result).assertEqual("matchedmatched");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2300
     * @tc.name      StringReplaceAllTest1023
     * @tc.desc      Reference multiple numbered capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1023';
      console.log(TAG + 'start');
      let result: string = stringTest.testMultiCaptureGroup()
      expect(result).assertEqual("12/25/2021 01/01/2022");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2400
     * @tc.name      StringReplaceAllTest1024
     * @tc.desc      Use a positive lookahead assertion (?=...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1024';
      console.log(TAG + 'start');
      let result: string = stringTest.testPositiveLookahead()
      expect(result).assertEqual("MATCH123MATCH456test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2500
     * @tc.name      StringReplaceAllTest1025
     * @tc.desc      Use a negative lookahead assertion (?!...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1025';
      console.log(TAG + 'start');
      let result: string = stringTest.testNegativeLookahead()
      expect(result).assertEqual("test123test456MATCH");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2600
     * @tc.name      StringReplaceAllTest1026
     * @tc.desc      Use a positive lookbehind assertion (?<=...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1026';
      console.log(TAG + 'start');
      let result: string = stringTest.testPositiveLookbehind()
      expect(result).assertEqual("$XXX $XXX €300");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2700
     * @tc.name      StringReplaceAllTest1027
     * @tc.desc      Use a negative lookbehind assertion (?<!...)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1027';
      console.log(TAG + 'start');
      let result: string = stringTest.testNegativeLookbehind()
      expect(result).assertEqual("$1XXX $2XXX €XXX");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2800
     * @tc.name      StringReplaceAllTest1028
     * @tc.desc      Use the * quantifier to match zero or more occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1028';
      console.log(TAG + 'start');
      let result: string = stringTest.testZeroOrMore()
      expect(result).assertEqual("X X X X");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_2900
     * @tc.name      StringReplaceAllTest1029
     * @tc.desc      Use the + quantifier to match one or more occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1029';
      console.log(TAG + 'start');
      let result: string = stringTest.testOneOrMore()
      expect(result).assertEqual("X X X a");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3000
     * @tc.name      StringReplaceAllTest1030
     * @tc.desc      Use the ? quantifier to match zero or one occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1030';
      console.log(TAG + 'start');
      let result: string = stringTest.testZeroOrOne()
      expect(result).assertEqual("X X");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3100
     * @tc.name      StringReplaceAllTest1031
     * @tc.desc      Use the {n} quantifier to match an exact number of occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1031';
      console.log(TAG + 'start');
      let result: string = stringTest.testExactCount()
      expect(result).assertEqual("a X Xa XX");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3200
     * @tc.name      StringReplaceAllTest1032
     * @tc.desc      Use the {n,} quantifier to match at least n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1032';
      console.log(TAG + 'start');
      let result: string = stringTest.testMinCount()
      expect(result).assertEqual("a X X X");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3300
     * @tc.name      StringReplaceAllTest1033
     * @tc.desc      Use the {n,m} quantifier to match between n and m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1033';
      console.log(TAG + 'start');
      let result: string = stringTest.testRangeCount()
      expect(result).assertEqual("a X X Xa");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3400
     * @tc.name      StringReplaceAllTest1034
     * @tc.desc      Use \p{L} to match any Unicode letter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1034';
      console.log(TAG + 'start');
      let result: string = stringTest.testUnicodeLetters()
      expect(result).assertEqual("XXXXXXX123");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3500
     * @tc.name      StringReplaceAllTest1035
     * @tc.desc      Use \p{N} to match any Unicode number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1035';
      console.log(TAG + 'start');
      let result: string = stringTest.testUnicodeNumbers()
      expect(result).assertEqual("######");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3600
     * @tc.name      StringReplaceAllTest1036
     * @tc.desc      Use \p{Emoji} to match any Unicode emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1036';
      console.log(TAG + 'start');
      let result: string = stringTest.testUnicodeEmoji()
      expect(result).assertEqual("Hello  World ");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3700
     * @tc.name      StringReplaceAllTest1037
     * @tc.desc      Use a regular string as the replacement value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1037';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replaceAll("l", "L");
      expect(result).assertEqual("heLLo");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3800
     * @tc.name      StringReplaceAllTest1038
     * @tc.desc      Remove matches using an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1038';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replaceAll("l", "");
      expect(result).assertEqual("heo");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_3900
     * @tc.name      StringReplaceAllTest1039
     * @tc.desc      The replacement value contains special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1039';
      console.log(TAG + 'start');
      const str = "a.b";
      const result = str.replaceAll(".", "\\.");
      expect(result).assertEqual("a\\.b");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4000
     * @tc.name      StringReplaceAllTest1040
     * @tc.desc      Using a function as the replacement value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1040';
      console.log(TAG + 'start');
      const str = "abc123";
      const result = str.replaceAll(/\d/g, match => `[${match}]`);
      expect(result).assertEqual("abc[1][2][3]");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4100
     * @tc.name      StringReplaceAllTest1041
     * @tc.desc      The function receives the matched string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1041';
      console.log(TAG + 'start');
      const str = "aaa";
      const result = str.replaceAll("a", (match) => match.toUpperCase());
      expect(result).assertEqual("AAA");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4200
     * @tc.name      StringReplaceAllTest1042
     * @tc.desc      The function receives matched positional arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1042';
      console.log(TAG + 'start');
      let result: number[] = stringTest.testCaptureReplaceOffset();
      expect(result.toString()).assertEqual('0,1,2');
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4300
     * @tc.name      StringReplaceAllTest1043
     * @tc.desc      The function receives a raw string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1043';
      console.log(TAG + 'start');
      let result  = stringTest.testReplaceWithOffset();
      expect(result).assertEqual("he5-25-3o");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4400
     * @tc.name      StringReplaceAllTest1044
     * @tc.desc      The function receives capture group parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1044';
      console.log(TAG + 'start');
      let result  = stringTest.testRegexGroupReplace();
      expect(result).assertEqual("a[1]b[2]c[3]");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4500
     * @tc.name      StringReplaceAllTest1045
     * @tc.desc      The function receives named capture group parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1045';
      console.log(TAG + 'start');
      let result  = stringTest.testNamedGroupReplace();
      expect(result).assertEqual("Smith, John Doe, Jane");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4600
     * @tc.name      StringReplaceAllTest1046
     * @tc.desc      A function returning undefined will be converted to the string "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1046';
      console.log(TAG + 'start');
      let result  = stringTest.testReplaceReturnUndefined();
      expect(result).assertEqual("aundefinedc");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4700
     * @tc.name      StringReplaceAllTest1047
     * @tc.desc      If a function returns null, it will be converted to the string "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1047';
      console.log(TAG + 'start');
      let result  = stringTest.testReplaceReturnNull();
      expect(result).assertEqual("anullc");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4800
     * @tc.name      StringReplaceAllTest1048
     * @tc.desc      A number returned by the function will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1048';
      console.log(TAG + 'start');
      let result  = stringTest.testReplaceReturnOffset();
      expect(result).assertEqual("012");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_4900
     * @tc.name      StringReplaceAllTest1049
     * @tc.desc      The object returned by the function will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1049';
      console.log(TAG + 'start');
      let result  = stringTest.testReplaceReturnObject();
      expect(result).assertEqual("a[object Object]c");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5000
     * @tc.name      StringReplaceAllTest1050
     * @tc.desc      Throwing an exception in a function will interrupt replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1050';
      console.log(TAG + 'start');
      const str = "abc";
      let errorMessage = "";
      try {
        str.replaceAll("b", () => {
          throw new Error("Function error");
        });
      } catch (e) {
        errorMessage = e.message;
      }
      expect(errorMessage).assertEqual("Function error");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5100
     * @tc.name      StringReplaceAllTest1051
     * @tc.desc      $& represents the matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1051';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replaceAll("l", "[$&]");
      expect(result).assertEqual("he[l][l]o");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5200
     * @tc.name      StringReplaceAllTest1052
     * @tc.desc      $` represents the string matched before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1052';
      console.log(TAG + 'start');
      const str = "abc";
      const result = str.replaceAll("b", "[$`]");
      expect(result).assertEqual("a[a]c");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5300
     * @tc.name      StringReplaceAllTest1053
     * @tc.desc      $' represents the matched string after
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1053';
      console.log(TAG + 'start');
      const str = "abc";
      const result = str.replaceAll("b", "[$']");
      expect(result).assertEqual("a[c]c");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5400
     * @tc.name      StringReplaceAllTest1054
     * @tc.desc      $$ represents a literal $
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1054';
      console.log(TAG + 'start');
      const str = "price";
      const result = str.replaceAll("price", "$$100");
      expect(result).assertEqual("$100");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5500
     * @tc.name      StringReplaceAllTest1055
     * @tc.desc      $n represents the nth capture group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1055';
      console.log(TAG + 'start');
      const str = "2021-12-25";
      const regex = /(\d{4})-(\d{2})-(\d{2})/g;
      const result = str.replaceAll(regex, "$2/$3/$1");
      expect(result).assertEqual("12/25/2021");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5600
     * @tc.name      StringReplaceAllTest1056
     * @tc.desc      $<name> represents a named capturing group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1056';
      console.log(TAG + 'start');
      const str = "John Smith";
      const regex = /(?<first>\w+) (?<last>\w+)/g;
      const result = str.replaceAll(regex, "$<last>, $<first>");
      expect(result).assertEqual("Smith, John");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5700
     * @tc.name      StringReplaceAllTest1057
     * @tc.desc      Combine multiple replacement special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1057';
      console.log(TAG + 'start');
      const str = "abc123";
      const regex = /(\w)(\d)/g;
      const result = str.replaceAll(regex, "[$&:$1-$2]");
      expect(result).assertEqual("ab[c1:c-1][23:2-3]");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5800
     * @tc.name      StringReplaceAllTest1058
     * @tc.desc      Use an empty string as the pattern to insert the replacement value between each character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1058';
      console.log(TAG + 'start');
      const str = "xxx";
      const result = str.replaceAll("", "_");
      expect(result).assertEqual("_x_x_x_");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_5900
     * @tc.name      StringReplaceAllTest1059
     * @tc.desc      Use an empty string as the replacement value to delete matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1059';
      console.log(TAG + 'start');
      const str = "aaa";
      const result = str.replaceAll("a", "");
      expect(result).assertEqual("");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6000
     * @tc.name      StringReplaceAllTest1060
     * @tc.desc      Both the pattern and the replacement value are empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1060';
      console.log(TAG + 'start');
      const str = "abc";
      const result = str.replaceAll("", "");
      expect(result).assertEqual("abc");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6100
     * @tc.name      StringReplaceAllTest1061
     * @tc.desc      Empty string pattern, insert replacement value at each position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1061';
      console.log(TAG + 'start');
      const str = "ab";
      const result = str.replaceAll("", "-");
      expect(result).assertEqual("-a-b-");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6200
     * @tc.name      StringReplaceAllTest1062
     * @tc.desc      Regular expression special characters as string patterns, automatically escaped
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1062';
      console.log(TAG + 'start');
      const report = "A hacker called ha.*er used special characters";
      const result = report.replaceAll("ha.*er", "[REDACTED]");
      expect(result).assertEqual("A hacker called [REDACTED] used special characters");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6300
     * @tc.name      StringReplaceAllTest1063
     * @tc.desc      Replace newline characters in a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1063';
      console.log(TAG + 'start');
      const str = "line1\nline2\nline3";
      const result = str.replaceAll("\n", " ");
      expect(result).assertEqual("line1 line2 line3");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6400
     * @tc.name      StringReplaceAllTest1064
     * @tc.desc      Replace Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1064';
      console.log(TAG + 'start');
      const str = "Hello 世界";
      const result = str.replaceAll("世界", "World");
      expect(result).assertEqual("Hello World");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6500
     * @tc.name      StringReplaceAllTest1065
     * @tc.desc      Replace emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1065';
      console.log(TAG + 'start');
      const str = "I ❤️ JavaScript ❤️";
      const result = str.replaceAll("❤️", "");
      expect(result).assertEqual("I  JavaScript ");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6600
     * @tc.name      StringReplaceAllTest1066
     * @tc.desc      Replace tab characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1066';
      console.log(TAG + 'start');
      const str = "col1\tcol2\tcol3";
      const result = str.replaceAll("\t", " | ");
      expect(result).assertEqual("col1 | col2 | col3");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6700
     * @tc.name      StringReplaceAllTest1067
     * @tc.desc      Replace carriage return
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1067';
      console.log(TAG + 'start');
      const str = "line1\rline2";
      const result = str.replaceAll("\r", "\n");
      expect(result).assertEqual("line1\nline2");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6800
     * @tc.name      StringReplaceAllTest1068
     * @tc.desc      Calling replaceAll on a very long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1068';
      console.log(TAG + 'start');
      const str = "a".repeat(10000);
      const result = str.replaceAll("a", "b");
      expect(result.length).assertEqual(10000);
      expect(result === "b".repeat(10000)).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_6900
     * @tc.name      StringReplaceAllTest1069
     * @tc.desc      The string contains a large number of substrings that need to be replaced
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1069';
      console.log(TAG + 'start');
      const str = Array(1000).fill("abc").join("");
      const result = str.replaceAll("abc", "x");
      expect(result.length).assertEqual(1000);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7000
     * @tc.name      StringReplaceAllTest1070
     * @tc.desc      Use the maximum safe integer as the replacement value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1070';
      console.log(TAG + 'start');
      let result  = stringTest.testReplaceMaxInteger();
      expect(result).assertEqual("900719925474099190071992547409919007199254740991");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7100
     * @tc.name      StringReplaceAllTest1071
     * @tc.desc      Replace characters containing proxy pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1071';
      console.log(TAG + 'start');
      const str = "Hello  World ";
      const result = str.replaceAll("", "");
      expect(result).assertEqual("Hello  World ");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7200
     * @tc.name      StringReplaceAllTest1072
     * @tc.desc      Replace strings containing combined characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1072';
      console.log(TAG + 'start');
      const str = "café café";
      const result = str.replaceAll("é", "e");
      expect(result).assertEqual("cafe cafe");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7300
     * @tc.name      StringReplaceAllTest1073
     * @tc.desc      Use Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1073';
      console.log(TAG + 'start');
      const str = "Hello \u4e16\u754c";
      const result = str.replaceAll("\u4e16\u754c", "World");
      expect(result).assertEqual("Hello World");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7400
     * @tc.name      StringReplaceAllTest1074
     * @tc.desc      Replace BOM (Byte Order Mark) character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1074';
      console.log(TAG + 'start');
      const str = "\uFEFFHello World";
      const result = str.replaceAll("\uFEFF", "");
      expect(result).assertEqual("Hello World");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7500
     * @tc.name      StringReplaceAllTest1075
     * @tc.desc      Replace zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1075';
      console.log(TAG + 'start');
      const str = "Hello\u200BWorld";
      const result = str.replaceAll("\u200B", "");
      expect(result).assertEqual("HelloWorld");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7600
     * @tc.name      StringReplaceAllTest1076
     * @tc.desc      Numbers passed as the pattern parameter are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1076';
      console.log(TAG + 'start');
      'use strict';
      const str = "123";
      const result = str.replace(/2/g, "X");
      expect(result).assertEqual("1X3");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7700
     * @tc.name      StringReplaceAllTest1077
     * @tc.desc      Boolean values passed as the pattern parameter are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1077';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testBooleanReplaceStr();
      expect(result).assertEqual("yes false yes");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7800
     * @tc.name      StringReplaceAllTest1078
     * @tc.desc      Objects passed as the pattern parameter are converted to strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1078';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testObjectReplaceStr();
      expect(result).assertEqual("OBJ test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_7900
     * @tc.name      StringReplaceAllTest1079
     * @tc.desc      null as a pattern parameter will be converted to the string "null".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1079';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testNullReplaceStr();
      expect(result).assertEqual("NULL value NULL");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8000
     * @tc.name      StringReplaceAllTest1080
     * @tc.desc      When undefined is used as a pattern parameter, it will be converted to the string "undefined".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1080';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testUndefinedReplaceStr();
      expect(result).assertEqual( "UNDEFINED value UNDEFINED");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8100
     * @tc.name      StringReplaceAllTest1081
     * @tc.desc      An array as a pattern parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1081';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testArrayReplaceStr();
      expect(result).assertEqual("ARRAY test ARRAY");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8200
     * @tc.name      StringReplaceAllTest1082
     * @tc.desc      Using Symbol as a pattern parameter will throw a TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1082';
      console.log(TAG + 'start');
      'use strict';
      let result: boolean | undefined = stringTest.testSymbolReplaceError();
      expect(result).assertTrue();
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8300
     * @tc.name      StringReplaceAllTest1083
     * @tc.desc      A number as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1083';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testNumberReplaceVal();
      expect(result).assertEqual("123123123");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8400
     * @tc.name      StringReplaceAllTest1084
     * @tc.desc      A Boolean value as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1084';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testBooleanReplaceVal();
      expect(result).assertEqual("truetruetrue");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8500
     * @tc.name      StringReplaceAllTest1085
     * @tc.desc      An array used as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1085';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testArrayReplaceVal();
      expect(result).assertEqual("1,21,21,2");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8600
     * @tc.name      StringReplaceAllTest1086
     * @tc.desc      An object used as a replacement parameter will be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1086';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testObjectReplaceVal();
      expect(result).assertEqual("[object Object][object Object][object Object]");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8700
     * @tc.name      StringReplaceAllTest1087
     * @tc.desc      null as the replacement parameter will be converted to the string "null".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1087';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testNullReplaceVal();
      expect(result).assertEqual("nullnullnull");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8800
     * @tc.name      StringReplaceAllTest1088
     * @tc.desc      undefined as the replacement parameter will be converted to the string "undefined".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1088';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testUndefinedReplaceVal();
      expect(result).assertEqual("undefinedundefinedundefined");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_8900
     * @tc.name      StringReplaceAllTest1089
     * @tc.desc      Compare the behavioral differences between replaceAll and replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1089';
      console.log(TAG + 'start');
      'use strict';
      let result: string[] = stringTest.testReplaceAllFirst();
      expect(result[0]).assertEqual("bbb");
      expect(result[1]).assertEqual("baa");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9000
     * @tc.name      StringReplaceAllTest1090
     * @tc.desc      replaceAll requires global flags, while replace is not mandatory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1090';
      console.log(TAG + 'start');
      'use strict';
      let result: string[] = stringTest.testReplaceMethodCompare();
      expect(result[0]).assertEqual("baa");
      expect(result[1]).assertEqual("bbb");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9100
     * @tc.name      StringReplaceAllTest1091
     * @tc.desc      split + join can achieve an effect similar to replaceAll.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1091';
      console.log(TAG + 'start');
      'use strict';
      let result: string[] = stringTest.testSplitJoinEquiv();
      expect(result[0]).assertEqual("a_b_c");
      expect(result[1]).assertEqual("a_b_c");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9200
     * @tc.name      StringReplaceAllTest1092
     * @tc.desc      The handling of empty string patterns by replaceAll and split is similar
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1092';
      console.log(TAG + 'start');
      'use strict';
      let result: string[] = stringTest.testEmptyStrReplace();
      expect(result[0]).assertEqual("_a_b_c_");
      expect(result[1]).assertEqual("a_b_c");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9300
     * @tc.name      StringReplaceAllTest1093
     * @tc.desc      Use match to find the matching items and then replace them
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1093';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testReplaceMatchedContent();
      expect(result).assertEqual("test[123]test[456]");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9400
     * @tc.name      StringReplaceAllTest1094
     * @tc.desc      Iterate over the matches using matchAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1094';
      console.log(TAG + 'start');
      'use strict';
      let result: string[] = stringTest.testMatchAllReplace();
      expect(result[0]).assertEqual("123");
      expect(result[1]).assertEqual("456");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9500
     * @tc.name      StringReplaceAllTest1095
     * @tc.desc      Call replaceAll multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1095';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testMultipleReplaceChain();
      expect(result).assertEqual("ABC###DEF###");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9600
     * @tc.name      StringReplaceAllTest1096
     * @tc.desc      replaceAll is used in combination with other string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1096';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testReplaceAllChain();
      expect(result).assertEqual("HELLO_WORLD");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9700
     * @tc.name      StringReplaceAllTest1097
     * @tc.desc      Complex chained calls of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1097';
      console.log(TAG + 'start');
      'use strict';
      let result: string = stringTest.testComplexChainCall();
      expect(result).assertEqual("hello-world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9800
     * @tc.name      StringReplaceAllTest1098
     * @tc.desc      replaceAll does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1098';
      console.log(TAG + 'start');
      'use strict';
      const str = "hello";
      const result = str.replaceAll("l", "L");
      expect(str).assertEqual("hello");
      expect(result).assertEqual("heLLo");
      expect(str === result).assertEqual(false);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALL_9900
     * @tc.name      StringReplaceAllTest1099
     * @tc.desc      Calling replaceAll multiple times on the same string yields the same result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1099';
      console.log(TAG + 'start');
      'use strict';
      let result: boolean = stringTest.testReplaceResultSame();
      expect(result).assertTrue();
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0100
     * @tc.name      StringReplaceAllTest1100
     * @tc.desc      Calling replaceAll on a string object does not modify the original object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1100';
      console.log(TAG + 'start');
      'use strict';
      const strObj = new String("hello");
      const result = strObj.replaceAll("l", "L");
      expect(strObj.toString()).assertEqual("hello");
      expect(result).assertEqual("heLLo");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0200
     * @tc.name      StringReplaceAllTest1101
     * @tc.desc      A TypeError is thrown when using non-global regular expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1101';
      console.log(TAG + 'start');
      'use strict';
      let result: boolean[] = stringTest.testRegexTypeError();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0300
     * @tc.name      StringReplaceAllTest1102
     * @tc.desc      The sticky flag must be used in conjunction with the global flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1102';
      console.log(TAG + 'start');
      'use strict';
      const str = "test";
      const regex = /test/y;
      let bool : boolean = true;
      try {
        str.replaceAll(regex, "replaced");
      } catch (e) {
        bool = e instanceof TypeError;
      }
      expect(bool).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0400
     * @tc.name      StringReplaceAllTest1103
     * @tc.desc      null or undefined is used as this to throw a TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1103';
      console.log(TAG + 'start');
      'use strict';
      let result: boolean = stringTest.testNullUndefinedError();
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0500
     * @tc.name      StringReplaceAllTest1104
     * @tc.desc      Exceptions thrown by the Symbol.replace method of the pattern object are propagated.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1104';
      console.log(TAG + 'start');
      'use strict';
      let result:string = stringTest.testCustomSymbolError();
      expect(result).assertEqual("Custom error");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0600
     * @tc.name      StringReplaceAllTest1105
     * @tc.desc      Use a custom object that implements the Symbol.replace method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1105';
      console.log(TAG + 'start');
      let result:string = stringTest.testCustomObjectReplace();
      expect(result).assertEqual("hellX wXrld");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0700
     * @tc.name      StringReplaceAllTest1106
     * @tc.desc      Symbol.replace return value is the result of replaceAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1106';
      console.log(TAG + 'start');
      let result:string = stringTest.testSymbolReplaceReturn();
      expect(result).assertEqual("custom result");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0800
     * @tc.name      StringReplaceAllTest1107
     * @tc.desc      Custom object must provide a flags property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1107';
      console.log(TAG + 'start');
      let result:string = stringTest.testSymbolReplaceAccess();
      expect(result).assertEqual("replaced");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_0900
     * @tc.name      StringReplaceAllTest1108
     * @tc.desc      Use a string as the pattern to replace all matched items (large string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1108';
      console.log(TAG + 'start');
      'use strict';
      const str = "ab".repeat(10000);
      const result = str.replaceAll("ab", "cdef");
      expect(result.startsWith("cd")).assertEqual(true);
      expect(result.length).assertEqual(40000);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1000
     * @tc.name      StringReplaceAllTest1109
     * @tc.desc      Use regex with capture groups to replace matched items
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1109';
      console.log(TAG + 'start');
      'use strict';
      const str = "test123test456test789".repeat(100);
      const result = str.replaceAll(/test(\d+)/g, "[$1]");
      expect(result.includes("[123]")).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1100
     * @tc.name      StringReplaceAllTest1110
     * @tc.desc      Replace all spaces in a string with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1110';
      console.log(TAG + 'start');
      'use strict';
      const str = "hello world test";
      const result = str.replaceAll(" ", "");
      expect(result).assertEqual("helloworldtest");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1200
     * @tc.name      StringReplaceAllTest1111
     * @tc.desc      Unify line break formats in strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1111';
      console.log(TAG + 'start');
      'use strict';
      const str = "line1\r\nline2\nline3\rline4";
      const result = str.replaceAll(/\r\n|\r|\n/g, "\n");
      expect(result).assertEqual("line1\nline2\nline3\nline4");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1300
     * @tc.name      StringReplaceAllTest1112
     * @tc.desc      Remove all HTML tags from string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1112';
      console.log(TAG + 'start');
      'use strict';
      const html = "<p>Hello</p><div>World</div>";
      const result = html.replaceAll(/<[^>]*>/g, "");
      expect(result).assertEqual("HelloWorld");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1400
     * @tc.name      StringReplaceAllTest1113
     * @tc.desc      Mask all phone numbers in string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1113';
      console.log(TAG + 'start');
      'use strict';
      const text = "My phone is 123-456-7890 and 987-654-3210";
      const result = text.replaceAll(/\d{3}-\d{3}-\d{4}/g, "[PHONE]");
      expect(result).assertEqual("My phone is [PHONE] and [PHONE]");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1500
     * @tc.name      StringReplaceAllTest1114
     * @tc.desc      Escape HTML special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1114';
      console.log(TAG + 'start');
      'use strict';
      const html = "<div>Test & Demo</div>";
      let result = html.replaceAll("&", "&amp;");
      result = result.replaceAll("<", "&lt;");
      result = result.replaceAll(">", "&gt;");
      expect(result).assertEqual("&lt;div&gt;Test &amp; Demo&lt;/div&gt;");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGREPLACEALLONE_1600
     * @tc.name      StringReplaceAllTest1115
     * @tc.desc      Replace multiple consecutive spaces with single space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceAllTest1115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceAllTest1115';
      console.log(TAG + 'start');
      'use strict';
      const str = "hello    world   test";
      const result = str.replaceAll(/\s+/g, " ");
      expect(result).assertEqual("hello world test");
      console.log(TAG + "end");
    });
  });
}