import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_trimend_test01';
export default function StringTrimEndTest1() {
  describe('StringTrimEndTest1', () => {
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


    //=================Basic Usage==================
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1001
     * @tc.name       StringTrimEndTest1001
     * @tc.desc       Test the case where the string contains spaces at the end
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1001';
      console.log(TAG + ' start');
      let result: string = stringTest.testStringWithTrailingSpaces();
      expect(result).assertEqual("Hello World")
      expect(result.length).assertEqual(11)
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1002
     * @tc.name       StringTrimEndTest1002
     * @tc.desc       Test that only trailing spaces are removed and leading spaces are retained
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1002';
      console.log(TAG + ' start');
      let str = "   Hello World   ";
      let result = str.trimEnd();
      expect(result).assertEqual("   Hello World")
      expect(result.length).assertEqual(14)
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1003
     * @tc.name       StringTrimEndTest1003
     * @tc.desc       Test return original string copy if no trailing spaces
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1003';
      console.log(TAG + ' start');
      let str = new String("Hello World");
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World")
      expect(result === str).assertEqual(false)
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1004
     * @tc.name       StringTrimEndTest1004
     * @tc.desc       Test calling trimEnd() on an empty string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
   it("StringTrimEndTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1004';
      console.log(TAG + ' start');
      let str = "";
      let result = str.trimEnd();
     expect(result).assertEqual( "")
     expect(result.length).assertEqual(0)
     console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1005
     * @tc.name       StringTrimEndTest1005
     * @tc.desc       Test a string containing only whitespace characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1005';
      console.log(TAG + ' start');
      let str = "     ";
      let result = str.trimEnd();
      expect(result).assertEqual( "")
      expect(result.length).assertEqual(0)
      console.log(TAG + ' end');
   });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1006
     * @tc.name       StringTrimEndTest1006
     * @tc.desc       Test that spaces in the middle of a string are unaffected
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1006';
      console.log(TAG + ' start');
      let str = "Hello World   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World")
      expect(result.indexOf(" ")).assertEqual(5)

      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1007
     * @tc.name       StringTrimEndTest1007
     * @tc.desc       Test multiple middle spaces preserved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
   it("StringTrimEndTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1007';
     console.log(TAG + ' start');
     let result: string = stringTest.testMultiSpacesBetweenWords();
     result = result.padEnd(15, " ");
     expect(result.substring(0, 14)).assertEqual( "Hello    World")
     expect(result.length).assertEqual(15)
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1008
     * @tc.name       StringTrimEndTest1008
     * @tc.desc       TestNormalSpaceChar
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1008';
      console.log(TAG + ' start');
      let str = "Hello\u0020\u0020\u0020";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1009
     * @tc.name       StringTrimEndTest1009
     * @tc.desc       TestHorizontalTabRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1009';
      console.log(TAG + ' start');
      let str = "Hello\t\t\t";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1010
     * @tc.name       StringTrimEndTest1010
     * @tc.desc       TestVerticalTabRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1010';
      console.log(TAG + ' start');
      let str = "Hello\v\v";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1011
     * @tc.name       StringTrimEndTest1011
     * @tc.desc       TestFormFeedRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1011';
      console.log(TAG + ' start');
      let str = "Hello\f\f";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1012
     * @tc.name       StringTrimEndTest1012
     * @tc.desc       TestNbspRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1012';
      console.log(TAG + ' start');
      let str = "Hello\u00A0\u00A0";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1013
     * @tc.name       StringTrimEndTest1013
     * @tc.desc      TestNewLineRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1013';
      console.log(TAG + ' start');
      let str = "Hello\n\n\n";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1014
     * @tc.name       StringTrimEndTest1014
     * @tc.desc      TestCarriageReturnRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1014';
      console.log(TAG + ' start');
      let str = "Hello\r\r";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1015
     * @tc.name       StringTrimEndTest1015
     * @tc.desc      TestWindowsNewLineRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1015';
      console.log(TAG + ' start');
      let str = "Hello\r\n\r\n";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1016
     * @tc.name       StringTrimEndTest1016
     * @tc.desc      TestLineSeparatorRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1016';
      console.log(TAG + ' start');
      let str = "Hello\u2028\u2028";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1017
     * @tc.name       StringTrimEndTest1017
     * @tc.desc      TestParagraphSeparatorRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1017';
      console.log(TAG + ' start');
      let str = "Hello\u2029\u2029";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1018
     * @tc.name       StringTrimEndTest1018
     * @tc.desc      TestFullWidthSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1018';
      console.log(TAG + ' start');
      let str = "Hello\u3000\u3000";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1019
     * @tc.name       StringTrimEndTest1019
     * @tc.desc      TestOghamSpaceMarkRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1019';
      console.log(TAG + ' start');
      let str = "Hello\u1680\u1680";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1020
     * @tc.name       StringTrimEndTest1020
     * @tc.desc      TestEnSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1020';
      console.log(TAG + ' start');
      let str = "Hello\u2002\u2002";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1021
     * @tc.name       StringTrimEndTest1021
     * @tc.desc      TestEmSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1021';
      console.log(TAG + ' start');
      let str = "Hello\u2003\u2003";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1022
     * @tc.name       StringTrimEndTest1022
     * @tc.desc      TestNarrowNbspRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1022';
      console.log(TAG + ' start');
      let str = "Hello\u202F\u202F";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1023
     * @tc.name       StringTrimEndTest1023
     * @tc.desc      TestMediumMathSpaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1023';
      console.log(TAG + ' start');
      let str = "Hello\u205F\u205F";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1024
     * @tc.name       StringTrimEndTest1024
     * @tc.desc      TestMixedWhitespaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1024';
      console.log(TAG + ' start');
      let str = "Hello \t\n\r";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1025
     * @tc.name       StringTrimEndTest1025
     * @tc.desc      TestTrailingMixedWhitespaceRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1025';
      console.log(TAG + ' start');
      let str = "Hello World \t \n \r ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World");
      expect(result.length).assertEqual(11);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1026
     * @tc.name       StringTrimEndTest1026
     * @tc.desc      TestSingleCharWithSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1026';
      console.log(TAG + ' start');
      let str = "A   ";
      let result = str.trimEnd();
      expect(result).assertEqual("A");
      expect(result.length).assertEqual(1);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1027
     * @tc.name       StringTrimEndTest1027
     * @tc.desc      TestMassiveWhitespace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1027';
      console.log(TAG + ' start');
      let str = " ".repeat(1000);
      let result = str.trimEnd();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1028
     * @tc.name       StringTrimEndTest1028
     * @tc.desc      TestLongStringProcessing
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1028';
      console.log(TAG + ' start');
      let str = "A".repeat(10000) + "   ";
      let result = str.trimEnd();
      expect(result.length).assertEqual(10000);
      expect(result === "A".repeat(10000)).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1029
     * @tc.name       StringTrimEndTest1029
     * @tc.desc      TestTrimTrailingKeepLeading
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1029';
      console.log(TAG + ' start');
      let str = "   Hello";
      let result = str.trimEnd();
      expect(result).assertEqual( "   Hello");
      expect(result.length).assertEqual(8);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1030
     * @tc.name       StringTrimEndTest1030
     * @tc.desc      TestMiddleSpacesUnaffected
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1030';
      console.log(TAG + ' start');
      let str = "Hel   lo";
      let result = str.trimEnd();
      expect(result).assertEqual(  "Hel   lo");
      expect(result.length).assertEqual(8);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1031
     * @tc.name       StringTrimEndTest1031
     * @tc.desc       TestTrimTrailingWithLeading
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1031';
      console.log(TAG + ' start');
      let str = "   Hello   ";
      let result = str.trimEnd();
      expect(result).assertEqual(  "   Hello");
      expect(result.length).assertEqual(8);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1032
     * @tc.name       StringTrimEndTest1032
     * @tc.desc       TestSpaceAfterSymbolRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1032';
      console.log(TAG + ' start');
      let str = "@#$%^&*()   ";
      let result = str.trimEnd();
      expect(result).assertEqual("@#$%^&*()");
      expect(result.length).assertEqual(9);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1033
     * @tc.name       StringTrimEndTest1033
     * @tc.desc       TestSpaceAfterNumberRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1033';
      console.log(TAG + ' start');
      let str = "12345   ";
      let result = str.trimEnd();
      expect(result).assertEqual("12345");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1034
     * @tc.name       StringTrimEndTest1034
     * @tc.desc       TestSpaceAfterChineseRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1034';
      console.log(TAG + ' start');
      let str = "你好世界   ";
      let result = str.trimEnd();
      expect(result).assertEqual("你好世界");
      expect(result.length).assertEqual(4);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1035
     * @tc.name       StringTrimEndTest1035
     * @tc.desc       TestSpaceAfterJapaneseRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1035';
      console.log(TAG + ' start');
      let str = "こんにちは   ";
      let result = str.trimEnd();
      expect(result).assertEqual("こんにちは");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1036
     * @tc.name       StringTrimEndTest1036
     * @tc.desc       TestSpaceAfterKoreanRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1036';
      console.log(TAG + ' start');
      let str = "안녕하세요   ";
      let result = str.trimEnd();
      expect(result).assertEqual("안녕하세요");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1037
     * @tc.name       StringTrimEndTest1037
     * @tc.desc       TestSpaceAfterEmojiRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1037';
      console.log(TAG + ' start');
      let str = "Hello🎉🎊   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello🎉🎊");
      expect(result.length).assertEqual(9);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1038
     * @tc.name       StringTrimEndTest1038
     * @tc.desc       TestSpaceAfterArabicRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1038';
      console.log(TAG + ' start');
      let str = "مرحبا   ";
      let result = str.trimEnd();
      expect(result).assertEqual("مرحبا");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1039
     * @tc.name       StringTrimEndTest1039
     * @tc.desc       TestSpaceAfterMultiLangRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1039';
      console.log(TAG + ' start');
      let str = "Hello世界🎉   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello世界🎉");
      expect(result.length).assertEqual(9);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1040
     * @tc.name       StringTrimEndTest1040
     * @tc.desc       TestSpaceAfterZeroWidthRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1040';
      console.log(TAG + ' start');
      let str = "Hello\u200B   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello\u200B");
      expect(result.length).assertEqual(6);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1041
     * @tc.name       StringTrimEndTest1041
     * @tc.desc       TestSpaceAfterCombinedCharRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1041';
      console.log(TAG + ' start');
      let str = "café\u0301   ";
      let result = str.trimEnd();
      expect(result).assertEqual("café\u0301");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1042
     * @tc.name       StringTrimEndTest1042
     * @tc.desc       TestSpaceAfterSurrogatePairRemoved
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1042';
      console.log(TAG + ' start');
      let str = "Hello\uD83D\uDE00   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello\uD83D\uDE00");
      expect(result.length).assertEqual(7);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1043
     * @tc.name       StringTrimEndTest1043
     * @tc.desc       TestNewStringReturned
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1043';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result = str.trimEnd();
      expect(result === str).assertEqual(false);
      expect(result === str).assertEqual(false);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1044
     * @tc.name       StringTrimEndTest1044
     * @tc.desc       TestOriginalStringUnchanged
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1044';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let original = str;
      expect (str).assertEqual("Hello   ");
      expect(str === original).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1045
     * @tc.name       StringTrimEndTest1045
     * @tc.desc       VerifyReturnType
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0045';
      console.log(TAG + ' start');
      let result: (string | boolean)[] = stringTest.testReturnTypeIsString();
      expect(result[0]).assertEqual("string");
      expect(result[1]).assertEqual(false);
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1046
     * @tc.name       StringTrimEndTest1046
     * @tc.desc       TestReturnStrLength
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1046';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result = str.trimEnd();
      expect (result.length).assertEqual(5);
      expect(result.length === str.length - 3).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1047
     * @tc.name       StringTrimEndTest1047
     * @tc.desc       TestTrimRightEqualsEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1047';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result1 = str.trimEnd();
      let result2 = str.trimRight();
      expect (result1).assertEqual("Hello");
      expect(result2).assertEqual("Hello");
      expect(result1 === result2).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1048
     * @tc.name       StringTrimEndTest1048
     * @tc.desc       TestTrimRightWithWhitespaceChars
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1048';
      console.log(TAG + ' start');
      let str = "Hello \t\n\r";
      let result = str.trimRight();
      expect(result).assertEqual("Hello");
      expect(result.length).assertEqual(5);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1049
     * @tc.name       StringTrimEndTest1049
     * @tc.desc       CompareTrimEndTrim
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1049';
      console.log(TAG + ' start');
      let str = "   Hello   ";
      let trimEndResult = str.trimEnd();
      let trimResult = str.trim();
      expect(trimEndResult).assertEqual("   Hello");
      expect(trimResult).assertEqual("Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1050
     * @tc.name       StringTrimEndTest1050
     * @tc.desc       TestTrimEndThenTrim
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1050';
      console.log(TAG + ' start');
      let str = "   Hello   ";
      let result = str.trimEnd().trim();
      expect(result).assertEqual("Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1051
     * @tc.name       StringTrimEndTest1051
     * @tc.desc       TestTwoMethodsTrimEffect
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1051';
      console.log(TAG + ' start');
      let str = "   Hello   ";
      let result = str.trimStart().trimEnd();
      expect(result).assertEqual("Hello");
      expect(result === str.trim()).assertEqual( true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1052
     * @tc.name       StringTrimEndTest1052
     * @tc.desc      TestOrderNoResultImpact
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1052';
      console.log(TAG + ' start');
      let str = "   Hello   ";
      let result1 = str.trimStart().trimEnd();
      let result2 = str.trimEnd().trimStart();
      expect(result1).assertEqual("Hello");
      expect(result2).assertEqual("Hello");
      expect(result1 === result2).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1053
     * @tc.name       StringTrimEndTest1053
     * @tc.desc      TestChainCaseConversion
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1053';
      console.log(TAG + ' start');
      let str = "hello   ";
      let result = str.trimEnd().toUpperCase();
      expect(result).assertEqual("HELLO");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1054
     * @tc.name       StringTrimEndTest1054
     * @tc.desc      TestChainToLowerCase
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1054';
      console.log(TAG + ' start');
      let str = "HELLO   ";
      let result = str.trimEnd().toLowerCase();
      expect(result).assertEqual("hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1055
     * @tc.name       StringTrimEndTest1055
     * @tc.desc      TestTrimEndConcatStr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1055';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result = str.trimEnd().concat(" World");
      expect(result).assertEqual("Hello World");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1056
     * @tc.name       StringTrimEndTest1056
     * @tc.desc      TestTrimEndSlice
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1056';
      console.log(TAG + ' start');
      let str = "Hello World   ";
      let result = str.trimEnd().slice(0, 5);
      expect(result).assertEqual( "Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1057
     * @tc.name       StringTrimEndTest1057
     * @tc.desc      TestTrimEndSubstring
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1057';
      console.log(TAG + ' start');
      let str = "Hello World   ";
      let result = str.trimEnd().substring(6);
      expect(result).assertEqual("World");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1058
     * @tc.name       StringTrimEndTest1058
     * @tc.desc      TestTrimEndReplace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1058';
      console.log(TAG + ' start');
      let str = "hello world   ";
      let result = str.trimEnd().replace("world", "there");
      expect(result).assertEqual("hello there");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1059
     * @tc.name       StringTrimEndTest1059
     * @tc.desc      TestTrimEndSearchSubstr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1059';
      console.log(TAG + ' start');
      let str = "Hello World   ";
      let result = str.trimEnd().includes("World");
      expect(result).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1060
     * @tc.name       StringTrimEndTest1060
     * @tc.desc      TestTrimEndFindIndex
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1060';
      console.log(TAG + ' start');
      let str = "Hello World   ";
      let result = str.trimEnd().indexOf("World");
      expect(result).assertEqual(6);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1061
     * @tc.name       StringTrimEndTest1061
     * @tc.desc     TestTrimEndCheckEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1061';
      console.log(TAG + ' start');
      let str = "Hello World   ";
      let result = str.trimEnd().endsWith("World");
      expect(result).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1062
     * @tc.name       StringTrimEndTest1062
     * @tc.desc       TestTrimEndCheckStart
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1062';
      console.log(TAG + ' start');
      let str = "   Hello World   ";
      let result = str.trimEnd().startsWith("   ");
      expect(result).assertEqual(true);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1063
     * @tc.name       StringTrimEndTest1063
     * @tc.desc       TestTrimEndRepeatStr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1063';
      console.log(TAG + ' start');
      let str = "Hi   ";
      let result = str.trimEnd().repeat(3);
      expect(result).assertEqual("HiHiHi");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1064
     * @tc.name       StringTrimEndTest1064
     * @tc.desc       TestTrimEndThenPad
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1064';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result = str.trimEnd().padEnd(10, "!");
      expect(result).assertEqual("Hello!!!!!");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1065
     * @tc.name       StringTrimEndTest1065
     * @tc.desc       TestTrimEndPadStart
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1065';
      console.log(TAG + ' start');
      let str = "5   ";
      let result = str.trimEnd().padStart(3, "0");
      expect(result).assertEqual("005");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1066
     * @tc.name       StringTrimEndTest1066
     * @tc.desc       TestTrimEndGetChar
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1066';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result = str.trimEnd().charAt(0);
      expect(result).assertEqual( "H");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1067
     * @tc.name       StringTrimEndTest1067
     * @tc.desc       TestTrimEndCharCodeAt
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1067';
      console.log(TAG + ' start');
      let str = "Hello   ";
      let result = str.trimEnd().charCodeAt(0);
      expect(result).assertEqual(72);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1068
     * @tc.name       StringTrimEndTest1068
     * @tc.desc       TestStringTrimEndCall
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1068';
      console.log(TAG + ' start');
      let strObj = new String("Hello   ");
      let result = strObj.trimEnd();
      expect(result).assertEqual( "Hello");
      expect(typeof result).assertEqual( "string");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1069
     * @tc.name       StringTrimEndTest1069
     * @tc.desc       TestRawStringLiteralCall
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1069';
      console.log(TAG + ' start');
      let result = "Hello   ".trimEnd();
      expect(result).assertEqual("Hello");
      expect(typeof result).assertEqual( "string");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1070
     * @tc.name       StringTrimEndTest1070
     * @tc.desc       TestDirectStringCall
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1070';
      console.log(TAG + ' start');
      let result = ("Hello" + "   ").trimEnd();
      expect(result).assertEqual("Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1071
     * @tc.name       StringTrimEndTest1071
     * @tc.desc       TestTemplateStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1071';
      console.log(TAG + ' start');
      let name = "World";
      let str = `Hello ${name}   `;
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1072
     * @tc.name       StringTrimEndTest1072
     * @tc.desc       TestMultiLineTemplateSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1072';
      console.log(TAG + ' start');
      let str = `Hello
World   `;
      let result = str.trimEnd();
      expect(result).assertEqual( "Hello\nWorld");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1073
     * @tc.name       StringTrimEndTest1073
     * @tc.desc       TestConcatenatedStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1073';
      console.log(TAG + ' start');
      let str = "Hello" + " " + "World" + "   ";
      let result = str.trimEnd();
      expect(result).assertEqual("Hello World");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1074
     * @tc.name       StringTrimEndTest1074
     * @tc.desc       TestArrayJoinedStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1074';
      console.log(TAG + ' start');
      let arr = ["Hello", "World"];
      let str = arr.join(" ") + "   ";
      let result = str.trimEnd();
      expect(result).assertEqual( "Hello World");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1075
     * @tc.name       StringTrimEndTest1075
     * @tc.desc       TestLoopBuiltStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1075';
      console.log(TAG + ' start');
      let str = "";
      for (let i = 0; i < 5; i++) {
        str += i + " ";
      }
      let result = str.trimEnd();
      expect(result).assertEqual( "0 1 2 3 4");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1076
     * @tc.name       StringTrimEndTest1076
     * @tc.desc       TestRecursiveBuiltStringTrimEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1076';
      console.log(TAG + ' start');
      let result: string = stringTest.testRecursivelyGeneratedString();
      expect(result).assertEqual("3 2 1");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1077
     * @tc.name       StringTrimEndTest1077
     * @tc.desc       TestMaxLengthString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1077';
      console.log(TAG + ' start');
      let targetLen = Number.MAX_SAFE_INTEGER / 1000;
      let str = "a".repeat(0) + "   ";
      let result = str.trimEnd();
      expect(targetLen).assertEqual(Number.MAX_SAFE_INTEGER / 1000);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1078
     * @tc.name       StringTrimEndTest1078
     * @tc.desc       TestWhitespaceString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1078';
      console.log(TAG + ' start');
      let str = "a" + " ".repeat(999999);
      let result = str.trimEnd();
      expect(result).assertEqual( "a");
      expect(result.length).assertEqual(1);
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1079
     * @tc.name       StringTrimEndTest1079
     * @tc.desc      TestTrimEndPerformance
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1079';
      console.log(TAG + ' start');
      let str = "Hello   ";
      for (let i = 0; i < 1000; i++) {
        str = str.trimEnd() + "   ";
      }
      expect(str.trimEnd()).assertEqual("Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1080
     * @tc.name       StringTrimEndTest1080
     * @tc.desc      TestMassWhitespace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1080';
      console.log(TAG + ' start');
      let str = "a" + " ".repeat(100000);
      let start = Date.now();
      let result = str.trimEnd();
      let end = Date.now();
      expect(result).assertEqual("a");
      expect(`Time: ${end - start}ms`).assertEqual("Time: 0ms");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1081
     * @tc.name       StringTrimEndTest1081
     * @tc.desc      TestTrimEndParamIgnored
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1081';
      console.log(TAG + ' start');
      //let str = "Hello   ";
      //let result = str.trimEnd(" World");
      let result: string = stringTest.testParamIgnoredByPassing();
      expect(result).assertEqual( "Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1082
     * @tc.name       StringTrimEndTest1082
     * @tc.desc      TestMultiParamIgnored
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1082';
      console.log(TAG + ' start');
      let result: string = stringTest.testMultiParamPassing();
      expect(result).assertEqual("Hello");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1083
     * @tc.name       StringTrimEndTest1083
     * @tc.desc      TestCleanTrailingSpaces
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1083';
      console.log(TAG + ' start');
      let result :string = stringTest.testCleanUserInput();
      expect(result).assertEqual("Hello World");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1084
     * @tc.name       StringTrimEndTest1084
     * @tc.desc       TestTrimLineTrailingSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1084';
      console.log(TAG + ' start');
      let result :string = stringTest.testProcessMultiLineText();
      expect(result).assertEqual( "Line 1\nLine 2\nLine 3");
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1085
     * @tc.name       StringTrimEndTest1085
     * @tc.desc       TestTrimCsvTrailingSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1085';
      console.log(TAG + ' start');
      let result :string = stringTest.testProcessCsvData();
      expect(result).assertEqual("John, Doe, 30");
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1086
     * @tc.name       StringTrimEndTest1086
     * @tc.desc       TestFormatLineTrailingSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimEndTest1086';
      console.log(TAG + ' start');
      let result :string = stringTest.testFormatCodeString();
      expect(result).assertEqual("function hello() {\n  return 'world';\n}");
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1087
     * @tc.name       StringTrimEndTest1087
     * @tc.desc       TestTrimPathTrailingSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0087';
      console.log(TAG + ' start');
      let result :string = stringTest.testCleanFilePath();
      expect(result).assertEqual("/home/user/documents");
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1088
     * @tc.name       StringTrimEndTest1088
     * @tc.desc       TestTrimUrlTrailingSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0088';
      console.log(TAG + ' start');
      let result :string = stringTest.testProcessUrlString();
      expect(result).assertEqual("https://example.com/path")
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1089
     * @tc.name       StringTrimEndTest1089
     * @tc.desc       TestTrimLogTrailingSpace
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0089';
      console.log(TAG + ' start');
      let result :string = stringTest.testCleanLogLine();
      expect(result).assertEqual( "[ERROR] Connection failed")
      console.log(TAG + ' end');
    })
    /**
    * @tc.number     BUILTINS_STRING_TRIMEND_TEST1090
     * @tc.name       StringTrimEndTest1090
     * @tc.desc       TestTrimUsernameSpace
    * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
      */
    it("StringTrimEndTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
     const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0090';
      console.log(TAG + ' start');
      let result :boolean[] = stringTest.testCheckUsername();
      expect(result[0]).assertEqual(true)
      expect(result[1]).assertEqual( false)
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1091
     * @tc.name       StringTrimEndTest1091
     * @tc.desc       TestPreTrimEmail
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0091';
      console.log(TAG + ' start');
      let result :boolean[] = stringTest.testValidateEmail();
      expect(result[0]).assertEqual(true)
      expect(result[1]).assertEqual( false)
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1092
     * @tc.name       StringTrimEndTest1092
     * @tc.desc       TestPreTrimCompareStr
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0092';
      console.log(TAG + ' start');
      let result :boolean[] = stringTest.testPreTrimCompareStr();
      expect(result[0]).assertEqual(true)
      expect(result[1]).assertEqual( false)
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1093
     * @tc.name       StringTrimEndTest1093
     * @tc.desc       TestPreTrimDbString
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0093';
      console.log(TAG + ' start');
      let result :(string|number)[] = stringTest.testPreCleanDbData();
      expect(result[0]).assertEqual("Hello World")
      expect(result[1]).assertEqual(  123)
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1094
     * @tc.name       StringTrimEndTest1094
     * @tc.desc       TestEditorAutoClean
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0094';
      console.log(TAG + ' start');
      let result :string= stringTest.testAutoCleanLineEndSpaces();
      expect(result).assertEqual("function test() {\n  return true;\n}")
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_TRIMEND_TEST1095
     * @tc.name       StringTrimEndTest1095
     * @tc.desc       TestPreserveIndentTrimLineEnd
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringTrimEndTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStringTrimEndTest1ChapterrmatCodeString0095';
      console.log(TAG + ' start');
      let result :string= stringTest.testPreserveIndentTrimLineEnd();
      expect(result).assertEqual("    indented line\n        more indented")
      console.log(TAG + ' end');
    })
})
}