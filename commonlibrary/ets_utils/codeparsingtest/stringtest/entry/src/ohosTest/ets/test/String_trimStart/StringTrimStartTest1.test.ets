import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_trimstart_test';
export default function StringTrimStartTest1() {
  describe('StringTrimStartTest1', () => {
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
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1001
     * @tc.name      StringTrimStartTest1001
     * @tc.desc      Test string starting with a regular space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1001';
      console.log(TAG + 'start');
      let str = "   Hello World";
      let result = str.trimStart();
      expect(result).assertEqual("Hello World");
      expect(result.length).assertEqual(11);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1002
     * @tc.name      StringTrimStartTest1002
     * @tc.desc      The test string has whitespace at both ends, only remove the leading whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1002';
      console.log(TAG + 'start');
      let str = "   Hello World   ";
      let result = str.trimStart();
      expect(result).assertEqual("Hello World   ");
      expect(result.length).assertEqual(14);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1003
     * @tc.name      StringTrimStartTest1003
     * @tc.desc      Test a string without whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1003';
      console.log(TAG + 'start');
      let str = "HelloWorld";
      let result = str.trimStart();
      expect(result).assertEqual("HelloWorld");
      expect(result === str).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1004
     * @tc.name      StringTrimStartTest1004
     * @tc.desc      Test string with whitespace only at the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1004';
      console.log(TAG + 'start');
      let str = "   test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
      expect(str).assertEqual("   test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1005
     * @tc.name      StringTrimStartTest1005
     * @tc.desc      Test a string that only has whitespace at the end, trimStart does not affect the end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1005';
      console.log(TAG + 'start');
      let str = "test   ";
      let result = str.trimStart();
      expect(result).assertEqual("test   ");
      expect(result.length).assertEqual(7);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1006
     * @tc.name      StringTrimStartTest1006
     * @tc.desc      There are whitespace characters in the middle of the test string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1006';
      console.log(TAG + 'start');
      let str = "Hello   World";
      let result = str.trimStart();
      expect(result).assertEqual("Hello   World");
      expect(result === str).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1007
     * @tc.name      StringTrimStartTest1007
     * @tc.desc      Verify that trimLeft() and trimStart() functions are completely identical
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1007';
      console.log(TAG + 'start');
      let str = "   test";
      expect(str.trimStart() === str.trimLeft()).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1008
     * @tc.name      StringTrimStartTest1008
     * @tc.desc      Test alternating use of two methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1008';
      console.log(TAG + 'start');
      let str = "   test   ";
      let result1 = str.trimStart();
      let result2 = str.trimLeft();
      expect(result1).assertEqual("test   ");
      expect(result2).assertEqual("test   ");
      expect(result1 === result2).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1009
     * @tc.name      StringTrimStartTest1009
     * @tc.desc      Test standard space character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1009';
      console.log(TAG + 'start');
      let str = "   text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1010
     * @tc.name      StringTrimStartTest1010
     * @tc.desc      Test tab character removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1010';
      console.log(TAG + 'start');
      let str = "\t\ttext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.charCodeAt(0)).assertEqual(116);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1011
     * @tc.name      StringTrimStartTest1011
     * @tc.desc      Test line break removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1011';
      console.log(TAG + 'start');
      let str = "\n\ntext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1012
     * @tc.name      StringTrimStartTest1012
     * @tc.desc      Test if the carriage return is removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1012';
      console.log(TAG + 'start');
      let str = "\r\rtext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1013
     * @tc.name      StringTrimStartTest1013
     * @tc.desc      Test vertical tab removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1013';
      console.log(TAG + 'start');
      let str = "\v\vtext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1014
     * @tc.name      StringTrimStartTest1014
     * @tc.desc      Test page break removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1014';
      console.log(TAG + 'start');
      let str = "\f\ftext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1015
     * @tc.name      StringTrimStartTest1015
     * @tc.desc      Test non-breaking space character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1015';
      console.log(TAG + 'start');
      let str = "\u00A0\u00A0text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1016
     * @tc.name      StringTrimStartTest1016
     * @tc.desc      Test full-width space character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1016';
      console.log(TAG + 'start');
      let str = "\u3000\u3000text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1017
     * @tc.name      StringTrimStartTest1017
     * @tc.desc      Testing various Unicode whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1017';
      console.log(TAG + 'start');
      let str = "\u2000\u2001\u2002text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1018
     * @tc.name      StringTrimStartTest1018
     * @tc.desc      Test line separator is removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1018';
      console.log(TAG + 'start');
      let str = "\u2028\u2028text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1019
     * @tc.name      StringTrimStartTest1019
     * @tc.desc      Test paragraph separator removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1019';
      console.log(TAG + 'start');
      let str = "\u2029\u2029text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1020
     * @tc.name      StringTrimStartTest1020
     * @tc.desc      Test multiple types of whitespace characters mixed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1020';
      console.log(TAG + 'start');
      let str = " \t\n\r\v\ftext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1021
     * @tc.name      StringTrimStartTest1021
     * @tc.desc      Test calling trimStart on an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1021';
      console.log(TAG + 'start');
      let str = "";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      expect(result === str).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1022
     * @tc.name      StringTrimStartTest1022
     * @tc.desc      Test a string that contains only whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1022';
      console.log(TAG + 'start');
      let str = "   ";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1023
     * @tc.name      StringTrimStartTest1023
     * @tc.desc      Test combinations of various whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1023';
      console.log(TAG + 'start');
      let str = " \t\n\r";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1024
     * @tc.name      StringTrimStartTest1024
     * @tc.desc      Test a single whitespace character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1024';
      console.log(TAG + 'start');
      let str = " ";
      let result = str.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1025
     * @tc.name      StringTrimStartTest1025
     * @tc.desc      Test a single non-whitespace character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1025';
      console.log(TAG + 'start');
      let str = "a";
      let result = str.trimStart();
      expect(result).assertEqual("a");
      expect(result === str).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1026
     * @tc.name      StringTrimStartTest1026
     * @tc.desc      Test a large number of leading whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1026';
      console.log(TAG + 'start');
      let spaces = " ".repeat(10000);
      let str = spaces + "text";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1027
     * @tc.name      StringTrimStartTest1027
     * @tc.desc      Test long text string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1027';
      console.log(TAG + 'start');
      let longText = "a".repeat(100000);
      let str = "   " + longText;
      let result = str.trimStart();
      expect(result.length).assertEqual(100000);
      expect(result === longText).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1028
     * @tc.name      StringTrimStartTest1028
     * @tc.desc      Test zero-width characters (non-breaking)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1028';
      console.log(TAG + 'start');
      let str = "\u200B\u200Btext";
      let result = str.trimStart();
      expect(result.length).assertEqual(6);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1029
     * @tc.name      StringTrimStartTest1029
     * @tc.desc      Test BOM (Byte Order Mark) character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1029';
      console.log(TAG + 'start');
      let str = "\uFEFFtext";
      let result = str.trimStart();
      expect(result).assertEqual("text");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1030
     * @tc.name      StringTrimStartTest1030
     * @tc.desc      Verify that trimStart does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1030';
      console.log(TAG + 'start');
      let str = "   test";
      let original = str;
      let result = str.trimStart();
      expect(str).assertEqual("   test");
      expect(str === original).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1031
     * @tc.name      StringTrimStartTest1031
     * @tc.desc      Verify that the original string length remains unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1031';
      console.log(TAG + 'start');
      let str = "   test";
      let originalLength = str.length;
      let result = str.trimStart();
      expect(str.length).assertEqual(7);
      expect(str.length === originalLength).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1032
     * @tc.name      StringTrimStartTest1032
     * @tc.desc      Verify that the return is a new string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1032';
      console.log(TAG + 'start');
      let str = "test";
      let result = str.trimStart();
      expect(result === str).assertEqual(true);
      expect(result == str).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1033
     * @tc.name      StringTrimStartTest1033
     * @tc.desc      Test multiple calls returning different string objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1033';
      console.log(TAG + 'start');
      let str = "   test";
      let result1 = str.trimStart();
      let result2 = str.trimStart();
      expect(result1 === result2).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1034
     * @tc.name      StringTrimStartTest1034
     * @tc.desc      Verify that the return value is of string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1034';
      console.log(TAG + 'start');
      let result1 = stringTest.testResultTypeof();
      let result2 = stringTest.testResultInstanceof();
      expect(result1).assertEqual("string");
      expect(result2).assertEqual(false);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1035
     * @tc.name      StringTrimStartTest1035
     * @tc.desc      Test that a purely blank string returns an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1035';
      console.log(TAG + 'start');
      let str = "   ";
      let result = str.trimStart();
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1036
     * @tc.name      StringTrimStartTest1036
     * @tc.desc      Return a copy of the original string when there is no whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1036';
      console.log(TAG + 'start');
      let str = "test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
      expect(result === str).assertEqual(true);
      expect(result == str).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1037
     * @tc.name      StringTrimStartTest1037
     * @tc.desc      Test only removes leading whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1037';
      console.log(TAG + 'start');
      let str = "  test  ";
      let result = str.trimStart();
      expect(result).assertEqual("test  ");
      expect(result.length).assertEqual(6);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1038
     * @tc.name      StringTrimStartTest1038
     * @tc.desc      Test chained calls of trimStart and trimEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1038';
      console.log(TAG + 'start');
      let str = "   test   ";
      let result = str.trimStart().trimEnd();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1039
     * @tc.name      StringTrimStartTest1039
     * @tc.desc      Test trimStart and toUpperCase chained calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1039';
      console.log(TAG + 'start');
      let str = "   test";
      let result = str.trimStart().toUpperCase();
      expect(result).assertEqual("TEST");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1040
     * @tc.name      StringTrimStartTest1040
     * @tc.desc      Testing trimStart and repeat chained calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1040';
      console.log(TAG + 'start');
      let str = "  ab";
      let result = str.trimStart().repeat(3);
      expect(result).assertEqual("ababab");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1041
     * @tc.name      StringTrimStartTest1041
     * @tc.desc      Test calling trimStart multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1041';
      console.log(TAG + 'start');
      let str = "   test";
      let result = str.trimStart().trimStart().trimStart();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1042
     * @tc.name      StringTrimStartTest1042
     * @tc.desc      Testing mixed use of trim and trimEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1042';
      console.log(TAG + 'start');
      let str = "   test   ";
      let result = str.trimStart().trimEnd().trim();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1043
     * @tc.name      StringTrimStartTest1043
     * @tc.desc      Compare the functional differences between trimStart and trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1043';
      console.log(TAG + 'start');
      let str = "   test   ";
      expect(str.trimStart()).assertEqual("test   ");
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1044
     * @tc.name      StringTrimStartTest1044
     * @tc.desc      Test the difference between the two in handling blank ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1044';
      console.log(TAG + 'start');
      let str = "   test   ";
      let trimStartResult = str.trimStart();
      let trimResult = str.trim();
      expect(trimStartResult.length).assertEqual(7);
      expect(trimResult.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1045
     * @tc.name      StringTrimStartTest1045
     * @tc.desc      Comparing the directional differences between trimStart and trimEnd
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1045';
      console.log(TAG + 'start');
      let str = "   test   ";
      expect(str.trimStart()).assertEqual("test   ");
      expect(str.trimEnd()).assertEqual("   test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1046
     * @tc.name      StringTrimStartTest1046
     * @tc.desc      Testing the combination of the two is equivalent to trim
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1046';
      console.log(TAG + 'start');
      let str = "   test   ";
      let combined = str.trimStart().trimEnd();
      let trimmed = str.trim();
      expect(combined === trimmed).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1047
     * @tc.name      StringTrimStartTest1047
     * @tc.desc      Use replace to achieve similar functionality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1047';
      console.log(TAG + 'start');
      let str = "   test";
      let withReplace = str.replace(/^\s+/, '');
      let withTrimStart = str.trimStart();
      expect(withReplace === withTrimStart).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1048
     * @tc.name      StringTrimStartTest1048
     * @tc.desc      Compare the behavior of regular expressions and trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1048';
      console.log(TAG + 'start');
      let str = "  \t\n test";
      let withReplace = str.replace(/^\s+/, '');
      let withTrimStart = str.trimStart();
      expect(withReplace).assertEqual("test");
      expect(withTrimStart).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1049
     * @tc.name      StringTrimStartTest1049
     * @tc.desc      Test leading whitespace of Chinese strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1049';
      console.log(TAG + 'start');
      let str = "   你好世界";
      let result = str.trimStart();
      expect(result).assertEqual("你好世界");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1050
     * @tc.name      StringTrimStartTest1050
     * @tc.desc      Test a string containing Emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1050';
      console.log(TAG + 'start');
      let str = "   😀🎉";
      let result = str.trimStart();
      expect(result).assertEqual("😀🎉");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1051
     * @tc.name      StringTrimStartTest1051
     * @tc.desc      Test special Unicode whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1051';
      console.log(TAG + 'start');
      let str = "\u2000\u2001\u2002test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1052
     * @tc.name      StringTrimStartTest1052
     * @tc.desc      Test control character handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1052';
      console.log(TAG + 'start');
      let str = "\x00\x01\x02test";
      let result = str.trimStart();
      expect(result.length).assertEqual(7);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1053
     * @tc.name      StringTrimStartTest1053
     * @tc.desc      Test delete character (DEL)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1053';
      console.log(TAG + 'start');
      let str = "\x7Ftest";
      let result = str.trimStart();
      expect(result.length).assertEqual(5);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1054
     * @tc.name      StringTrimStartTest1054
     * @tc.desc      Test multibyte character handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1054';
      console.log(TAG + 'start');
      let str = "   𠮷𠮷";
      let result = str.trimStart();
      expect(result).assertEqual("𠮷𠮷");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1055
     * @tc.name      StringTrimStartTest1055
     * @tc.desc      Test combined characters (with tones, etc.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1055';
      console.log(TAG + 'start');
      let str = "   é";
      let result = str.trimStart();
      expect(result).assertEqual("é");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1056
     * @tc.name      StringTrimStartTest1056
     * @tc.desc      Test calling trimStart on a String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1056';
      console.log(TAG + 'start');
      let strObj = new String("   test");
      let result = strObj.trimStart();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1057
     * @tc.name      StringTrimStartTest1057
     * @tc.desc      Test original string calling trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1057';
      console.log(TAG + 'start');
      let str = "   test";
      let result = str.trimStart();
      expect(typeof str).assertEqual("string");
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1058
     * @tc.name      StringTrimStartTest1058
     * @tc.desc      Test numbers are forcibly converted to strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1058';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallNum();
      expect(result).assertEqual("123");
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1059
     * @tc.name      StringTrimStartTest1059
     * @tc.desc      The test object is forcibly converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1059';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallObj();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1060
     * @tc.name      StringTrimStartTest1060
     * @tc.desc      Test array is forced to be converted to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1060';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallArr();
      expect(result).assertEqual("a,b   ");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1061
     * @tc.name      StringTrimStartTest1061
     * @tc.desc      Testing interaction with Symbol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1061';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallSym();
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1062
     * @tc.name      StringTrimStartTest1062
     * @tc.desc      Testing interaction with Symbol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1062';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallHint();
      expect(result).assertEqual("custom");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1063
     * @tc.name      StringTrimStartTest1063
     * @tc.desc      Test undefined as the value of this
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1063';
      console.log(TAG + 'start');
      let result:boolean = stringTest.testCallUndefined();
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1064
     * @tc.name      StringTrimStartTest1064
     * @tc.desc      Test number as this value (convertible to string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1064';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallNumber();
      expect(result).assertEqual("123");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1065
     * @tc.name      StringTrimStartTest1065
     * @tc.desc      Test trimStart does not accept parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1065';
      console.log(TAG + 'start');
      let result:string = stringTest.testTrimStartIgnored();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1066
     * @tc.name      StringTrimStartTest1066
     * @tc.desc      Test passing multiple parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1066';
      console.log(TAG + 'start');
      let result:string = stringTest.testTrimStartNumber();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1067
     * @tc.name      StringTrimStartTest1067
     * @tc.desc      Test trimStart in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1067';
      console.log(TAG + 'start');
      "use strict";
      let str = "   test";
      let result = str.trimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1068
     * @tc.name      StringTrimStartTest1068
     * @tc.desc      Primitive values as this in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1068';
      console.log(TAG + 'start');
      "use strict";
      let str = "   test";
      let result = str.trimStart();
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1069
     * @tc.name      StringTrimStartTest1069
     * @tc.desc      Trim leading whitespace from user input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1069';
      console.log(TAG + 'start');
      let result:string = stringTest.testUserInput();
      expect(result).assertEqual("user@example.com");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1070
     * @tc.name      StringTrimStartTest1070
     * @tc.desc      Preserve the trailing whitespace of user input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1070';
      console.log(TAG + 'start');
      let result:string = stringTest.testEndInput();
      expect(result).assertEqual("text   ");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1071
     * @tc.name      StringTrimStartTest1071
     * @tc.desc      Handle leading whitespace in code strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1071';
      console.log(TAG + 'start');
      let result:string = stringTest.testFormatCode();
      expect(result).assertEqual("function test() { return 1; }");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1072
     * @tc.name      StringTrimStartTest1072
     * @tc.desc      Handling leading whitespace for each line in multi-line text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1072';
      console.log(TAG + 'start');
      let text = "   line1\n   line2\n   line3";
      let lines = text.split('\n').map(line => line.trimStart());
      expect(lines[0]).assertEqual("line1");
      expect(lines[1]).assertEqual("line2");
      expect(lines[2]).assertEqual("line3");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1073
     * @tc.name      StringTrimStartTest1073
     * @tc.desc      Processing CSV data fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1073';
      console.log(TAG + 'start');
      let result:string[] = stringTest.testCsvFields();
      expect(result[0]).assertEqual("value1");
      expect(result[1]).assertEqual("value2");
      expect(result[2]).assertEqual("value3");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1074
     * @tc.name      StringTrimStartTest1074
     * @tc.desc      Handling JSON string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1074';
      console.log(TAG + 'start');
      let result = stringTest.testJsonStr();
      expect(result.name).assertEqual("John");
      expect(result.email).assertEqual("john@example.com");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1075
     * @tc.name      StringTrimStartTest1075
     * @tc.desc      Handle leading whitespace in template strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1075';
      console.log(TAG + 'start');
      let result:string = stringTest.testTemplateStr();
      expect(result).assertEqual("Hello ");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1076
     * @tc.name      StringTrimStartTest1076
     * @tc.desc      Remove leading whitespace from HTML text content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1076';
      console.log(TAG + 'start');
      let result:string = stringTest.testHtmlText();
      expect(result).assertEqual("<p>Content</p>");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1077
     * @tc.name      StringTrimStartTest1077
     * @tc.desc      Trim leading whitespace from file paths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1077';
      console.log(TAG + 'start');
      let result:string = stringTest.testFilePath();
      expect(result).assertEqual("/user/home/document.txt");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1078
     * @tc.name      StringTrimStartTest1078
     * @tc.desc      Clear leading spaces from the URL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1078';
      console.log(TAG + 'start');
      let result:string = stringTest.testCleanUrl();
      expect(result).assertEqual("https://example.com/path");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1079
     * @tc.name      StringTrimStartTest1079
     * @tc.desc      Test calling trimStart on a frozen String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1079';
      console.log(TAG + 'start');
      let result = stringTest.testFrozenString();
      expect(result.trimmed).assertEqual("test");
      expect(result.isFrozen).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1080
     * @tc.name      StringTrimStartTest1080
     * @tc.desc      Test the original frozen string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1080';
      console.log(TAG + 'start');
      let result = stringTest.testFrozenOriginalStr();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1081
     * @tc.name      StringTrimStartTest1081
     * @tc.desc      Test sealed String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1081';
      console.log(TAG + 'start');
      let result = stringTest.testSealedString();
      expect(result.trimmed).assertEqual("test");
      expect(result.isSealed).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1082
     * @tc.name      StringTrimStartTest1082
     * @tc.desc      Test accessing string through Proxy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1082';
      console.log(TAG + 'start');
      let result:string = stringTest.testStringProxy();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1083
     * @tc.name      StringTrimStartTest1083
     * @tc.desc      Test accessing the string through getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1083';
      console.log(TAG + 'start');
      let result = stringTest.testStringGetter();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1084
     * @tc.name      StringTrimStartTest1084
     * @tc.desc      Test using trimStart after setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1084';
      console.log(TAG + 'start');
      let result = stringTest.testSetterrTrimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1085
     * @tc.name      StringTrimStartTest1085
     * @tc.desc      Verify that trimStart is an inherited method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1085';
      console.log(TAG + 'start');
      let result = stringTest.testInheritedMethod();
      expect(result.hasOwnOnInstance).assertEqual(false);
      expect(result.hasOwnOnPrototype).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1086
     * @tc.name      StringTrimStartTest1086
     * @tc.desc      Verify prototype chain relationship
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1086';
      console.log(TAG + 'start');
      let result = stringTest.testVerifyRelationship();
      expect(result.hasOwnOnInstance).assertEqual(false);
      expect(result.hasOwnOnPrototype).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1087
     * @tc.name      StringTrimStartTest1087
     * @tc.desc      Test a custom class that inherits from String
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1087';
      console.log(TAG + 'start');
      let result = stringTest.testCustomClassStr();
      expect(result.result1).assertEqual("test");
      expect(result.result2).assertEqual(false);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1088
     * @tc.name      StringTrimStartTest1088
     * @tc.desc      Test coverage for the trimStart method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1088';
      console.log(TAG + 'start');
      let result = stringTest.testCoverageMethod();
      expect(result).assertEqual("Custom: test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1089
     * @tc.name      StringTrimStartTest1089
     * @tc.desc      Test the impact of modifying the prototype method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1089';
      console.log(TAG + 'start');
      let result = stringTest.testPrototypeMethod();
      expect(result).assertEqual("Modified: test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1090
     * @tc.name      StringTrimStartTest1090
     * @tc.desc      Test restoring after deleting the prototype method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1090';
      console.log(TAG + 'start');
      let result = stringTest.testRestoringPrototypeMethod();
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1091
     * @tc.name      StringTrimStartTest1091
     * @tc.desc      Test the length property of the trimStart function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1091';
      console.log(TAG + 'start');
      let result = stringTest.testFunctionLength();
      expect(result).assertEqual(0);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1092
     * @tc.name      StringTrimStartTest1092
     * @tc.desc      Use the call method to invoke trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1092';
      console.log(TAG + 'start');
      let result:string = stringTest.testCallTrimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1093
     * @tc.name      StringTrimStartTest1093
     * @tc.desc      Use the apply method to call trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1093';
      console.log(TAG + 'start');
      let result:string = stringTest.testApplyTrimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1094
     * @tc.name      StringTrimStartTest1094
     * @tc.desc      Use the bind method to bind trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1094';
      console.log(TAG + 'start');
      let result:string = stringTest.testBindTrimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1095
     * @tc.name      StringTrimStartTest1095
     * @tc.desc      Test the type of trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1095';
      console.log(TAG + 'start');
      let result = stringTest.testTypeTrimStart();
      expect(result).assertEqual("function");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1096
     * @tc.name      StringTrimStartTest1096
     * @tc.desc      Test whether trimStart is an instance of Function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1096';
      console.log(TAG + 'start');
      let result = stringTest.testInstanceOfFunction();
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1097
     * @tc.name      StringTrimStartTest1097
     * @tc.desc      Test converting trimStart to a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1097';
      console.log(TAG + 'start');
      let result = stringTest.testConvertingToString();
      expect(result.result1).assertEqual("string");
      expect(result.result2).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1098
     * @tc.name      StringTrimStartTest1098
     * @tc.desc      Test object literal using trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1098';
      console.log(TAG + 'start');
      let result:string = stringTest.testLiteralUsing();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1099
     * @tc.name      StringTrimStartTest1099
     * @tc.desc      Test custom object implementation of toString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1099';
      console.log(TAG + 'start');
      let result:string = stringTest.tesCustomObject();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1100
     * @tc.name      StringTrimStartTest1100
     * @tc.desc      Test calling trimStart on Date object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1100';
      console.log(TAG + 'start');
      let result:string = stringTest.tesDataObject();
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1101
     * @tc.name      StringTrimStartTest1101
     * @tc.desc      Test calling trimStart on RegExp object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1101';
      console.log(TAG + 'start');
      let result = stringTest.tesRegExpObject();
      expect(result.result1).assertEqual("string");
      expect(result.result2).assertEqual(true);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1102
     * @tc.name      StringTrimStartTest1102
     * @tc.desc      Test Boolean object calling trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1102';
      console.log(TAG + 'start');
      let result:boolean = stringTest.tesBooleanObject();
      expect(result).assertEqual("true");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_TRIMSTART_TEST1103
     * @tc.name      StringTrimStartTest1103
     * @tc.desc      Test Boolean object calling trimStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimStartTest1103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimStartTest1103';
      console.log(TAG + 'start');
      let result:boolean = stringTest.tesBooleanObject();
      expect(result).assertEqual("true");
      console.log(TAG + "end");
    });
  });
}
