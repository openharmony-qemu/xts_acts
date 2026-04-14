import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as startsWithTest from './string_startswith_test1';

export default function StringStartsWithTest1() {
  describe('StringStartsWithTest1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    });

    //========================== Basic Function Test ============================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1001
     * @tc.name      StringStartsWith.test1001
     * @tc.desc      Verify complete match at the beginning of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1001';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1002
     * @tc.name      StringStartsWith.test1002
     * @tc.desc      Verify partial match at the beginning of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1002';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hel")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1003
     * @tc.name      StringStartsWith.test1003
     * @tc.desc      Verify no match at the beginning of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1003';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1004
     * @tc.name      StringStartsWith.test1004
     * @tc.desc      Verify no match when search string is in the middle or end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1004';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World")).assertFalse();
      expect(str.startsWith("llo")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1005
     * @tc.name      StringStartsWith.test1005
     * @tc.desc      Verify return type and value for a true matching condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1005';
      console.log(TAG + 'start');

      const str = "Hello";
      const result = str.startsWith("Hel");

      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1006
     * @tc.name      StringStartsWith.test1006
     * @tc.desc      Verify return type and value for a false matching condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1006';
      console.log(TAG + 'start');

      const str = "Hello";
      const result = str.startsWith("xyz");

      expect(typeof result).assertEqual("boolean");
      expect(result).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1007
     * @tc.name      StringStartsWith.test1007
     * @tc.desc      Verify match when search string equals the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1007';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1008
     * @tc.name      StringStartsWith.test1008
     * @tc.desc      Verify no match when search string is longer than original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1008';
      console.log(TAG + 'start');

      const str = "Hi";
      expect(str.startsWith("Hello World")).assertFalse();

      console.log(TAG + "end");
    });

    //========================== Parameter Type Test ============================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1009
     * @tc.name      StringStartsWith.test1009
     * @tc.desc      Verify matching with standard string type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1009';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1010
     * @tc.name      StringStartsWith.test1010
     * @tc.desc      Verify implicit conversion of number type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1010';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testNumberConversion();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1011
     * @tc.name      StringStartsWith.test1011
     * @tc.desc      Verify implicit conversion of boolean type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1011';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testBooleanConversion();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1012
     * @tc.name      StringStartsWith.test1012
     * @tc.desc      Verify implicit conversion of undefined searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1012';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testUndefinedConversion();
      expect(result).assertTrue();

      expect("undefined value".startsWith("undefined")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1013
     * @tc.name      StringStartsWith.test1013
     * @tc.desc      Verify implicit conversion of null searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1013';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testNullConversion();
      expect(result).assertTrue();
      expect("null pointer".startsWith("null")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1014
     * @tc.name      StringStartsWith.test1014
     * @tc.desc      Verify implicit conversion of object type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1014';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testObjectConversion();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1015
     * @tc.name      StringStartsWith.test1015
     * @tc.desc      Verify implicit conversion of array type searchString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1015';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testArrayConversion();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1016
     * @tc.name      StringStartsWith.test1016
     * @tc.desc      Verify passing RegExp throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1016';
      console.log(TAG + 'start');

      const isTypeError: boolean = startsWithTest.testRegExpException();
      expect(isTypeError).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1017
     * @tc.name      StringStartsWith.test1017
     * @tc.desc      Verify match with valid number position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1017';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1018
     * @tc.name      StringStartsWith.test1018
     * @tc.desc      Verify implicit conversion of string number position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1018';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testPositionStringNumber();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1019
     * @tc.name      StringStartsWith.test1019
     * @tc.desc      Verify behavior with negative position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1019';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello", -1)).assertTrue();
      expect(str.startsWith("Hello", -100)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1020
     * @tc.name      StringStartsWith.test1020
     * @tc.desc      Verify behavior with float position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1020';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World", 6.9)).assertTrue();
      expect(str.startsWith("World", 6.1)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1021
     * @tc.name      StringStartsWith.test1021
     * @tc.desc      Verify behavior with NaN position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1021';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello", NaN)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1022
     * @tc.name      StringStartsWith.test1022
     * @tc.desc      Verify behavior with undefined position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1022';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello", undefined)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1023
     * @tc.name      StringStartsWith.test1023
     * @tc.desc      Verify behavior with null position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1023';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testPositionNull();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1024
     * @tc.name      StringStartsWith.test1024
     * @tc.desc      Verify match when position exceeds string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1024';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("", 100)).assertTrue();
      expect(str.startsWith("H", 100)).assertFalse();

      console.log(TAG + "end");
    });

    //========================== Boundary Value Test ============================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1025
     * @tc.name      StringStartsWith.test1025
     * @tc.desc      Verify matching when both strings are empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1025';
      console.log(TAG + 'start');

      const str = "";
      expect(str.startsWith("")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1026
     * @tc.name      StringStartsWith.test1026
     * @tc.desc      Verify matching when original string is empty and search string is non-empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1026';
      console.log(TAG + 'start');

      const str = "";
      expect(str.startsWith("a")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1027
     * @tc.name      StringStartsWith.test1027
     * @tc.desc      Verify non-empty string always starts with empty string at any position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1027';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("")).assertTrue();
      expect(str.startsWith("", 0)).assertTrue();
      expect(str.startsWith("", 5)).assertTrue();
      expect(str.startsWith("", 100)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1028
     * @tc.name      StringStartsWith.test1028
     * @tc.desc      Verify single character string matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1028';
      console.log(TAG + 'start');

      const str = "a";
      expect(str.startsWith("a")).assertTrue();
      expect(str.startsWith("b")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1029
     * @tc.name      StringStartsWith.test1029
     * @tc.desc      Verify single character string starts with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1029';
      console.log(TAG + 'start');

      const str = "a";
      expect(str.startsWith("")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1030
     * @tc.name      StringStartsWith.test1030
     * @tc.desc      Verify searching from position 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1030';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello", 0)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1031
     * @tc.name      StringStartsWith.test1031
     * @tc.desc      Verify behavior when position equals string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1031';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("", 5)).assertTrue();
      expect(str.startsWith("a", 5)).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1032
     * @tc.name      StringStartsWith.test1032
     * @tc.desc      Verify behavior when position is greater than string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1032';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("", 1000)).assertTrue();
      expect(str.startsWith("a", 1000)).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1033
     * @tc.name      StringStartsWith.test1033
     * @tc.desc      Verify behavior when position is Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1033';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("", Infinity)).assertTrue();
      expect(str.startsWith("H", Infinity)).assertFalse();

      console.log(TAG + "end");
    });

    //========================== Position Parameter Test ============================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1034
     * @tc.name      StringStartsWith.test1034
     * @tc.desc      Verify matching from position 0 by default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1034';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("Hello", 0)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1035
     * @tc.name      StringStartsWith.test1035
     * @tc.desc      Verify matching from the middle of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1035';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();
      expect(str.startsWith("Wor", 6)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1036
     * @tc.name      StringStartsWith.test1036
     * @tc.desc      Verify matching at the very end of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1036';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("", 5)).assertTrue();
      expect(str.startsWith("o", 4)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1037
     * @tc.name      StringStartsWith.test1037
     * @tc.desc      Verify position parameter as a mathematical expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1037';
      console.log(TAG + 'start');

      const str = "Hello World";
      const pos = 2 + 4;
      expect(str.startsWith("World", pos)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1038
     * @tc.name      StringStartsWith.test1038
     * @tc.desc      Verify position parameter calculated from string length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1038';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("d", str.length - 1)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1039
     * @tc.name      StringStartsWith.test1039
     * @tc.desc      Verify skipping characters using position parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1039';
      console.log(TAG + 'start');

      const str = "abcabc";
      expect(str.startsWith("abc", 0)).assertTrue();
      expect(str.startsWith("abc", 3)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1040
     * @tc.name      StringStartsWith.test1040
     * @tc.desc      Verify match when search string overlaps with position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1040';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("ello", 1)).assertTrue();
      expect(str.startsWith("llo", 2)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1041
     * @tc.name      StringStartsWith.test1041
     * @tc.desc      Verify case sensitivity with exact match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1041';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("hello")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1042
     * @tc.name      StringStartsWith.test1042
     * @tc.desc      Verify case sensitivity with full uppercase string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1042';
      console.log(TAG + 'start');

      const str = "HELLO WORLD";
      expect(str.startsWith("HELLO")).assertTrue();
      expect(str.startsWith("hello")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1043
     * @tc.name      StringStartsWith.test1043
     * @tc.desc      Verify case sensitivity with full lowercase string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1043';
      console.log(TAG + 'start');

      const str = "hello world";
      expect(str.startsWith("hello")).assertTrue();
      expect(str.startsWith("HELLO")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1044
     * @tc.name      StringStartsWith.test1044
     * @tc.desc      Verify case sensitivity with mixed case string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1044';
      console.log(TAG + 'start');

      const str = "HeLLo WoRLd";
      expect(str.startsWith("HeLLo")).assertTrue();
      expect(str.startsWith("Hello")).assertFalse();
      expect(str.startsWith("HELLO")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1045
     * @tc.name      StringStartsWith.test1045
     * @tc.desc      Verify matching with space characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1045';
      console.log(TAG + 'start');

      const str = " Hello World";
      expect(str.startsWith(" ")).assertTrue();
      expect(str.startsWith(" Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1046
     * @tc.name      StringStartsWith.test1046
     * @tc.desc      Verify matching with tab characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1046';
      console.log(TAG + 'start');

      const str = "\tHello World";
      expect(str.startsWith("\t")).assertTrue();
      expect(str.startsWith("\tHello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1047
     * @tc.name      StringStartsWith.test1047
     * @tc.desc      Verify matching with newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1047';
      console.log(TAG + 'start');

      const str = "\nHello World";
      expect(str.startsWith("\n")).assertTrue();
      expect(str.startsWith("\nHello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1048
     * @tc.name      StringStartsWith.test1048
     * @tc.desc      Verify matching with carriage return characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1048';
      console.log(TAG + 'start');

      const str = "\rHello World";
      expect(str.startsWith("\r")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1049
     * @tc.name      StringStartsWith.test1049
     * @tc.desc      Verify matching with multiple types of whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1049';
      console.log(TAG + 'start');

      const str = " \t\nHello World";
      expect(str.startsWith(" \t\n")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1050
     * @tc.name      StringStartsWith.test1050
     * @tc.desc      Verify matching with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1050';
      console.log(TAG + 'start');

      const str = "\\Hello World";
      expect(str.startsWith("\\")).assertTrue();
      expect(str.startsWith("\\Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1051
     * @tc.name      StringStartsWith.test1051
     * @tc.desc      Verify matching with quote characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1051';
      console.log(TAG + 'start');

      const str = '"Hello" World';
      expect(str.startsWith('"')).assertTrue();
      expect(str.startsWith('"Hello"')).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1052
     * @tc.name      StringStartsWith.test1052
     * @tc.desc      Verify matching with backslash in paths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1052';
      console.log(TAG + 'start');

      const str = "\\path\\to\\file";
      expect(str.startsWith("\\")).assertTrue();
      expect(str.startsWith("\\path")).assertTrue();

      console.log(TAG + "end");
    });

    //========= Unicode and Multi-byte Character Test =========

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1053
     * @tc.name      StringStartsWith.test1053
     * @tc.desc      Verify matching with Chinese characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1053';
      console.log(TAG + 'start');

      const str = "你好世界";
      expect(str.startsWith("你好")).assertTrue();
      expect(str.startsWith("世界")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1054
     * @tc.name      StringStartsWith.test1054
     * @tc.desc      Verify matching with mixed Chinese and English characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1054';
      console.log(TAG + 'start');

      const str = "Hello世界World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("世界", 5)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1055
     * @tc.name      StringStartsWith.test1055
     * @tc.desc      Verify matching with a single Emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1055';
      console.log(TAG + 'start');

      const str = "😀Hello World";
      expect(str.startsWith("😀")).assertTrue();
      expect(str.startsWith("😀Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1056
     * @tc.name      StringStartsWith.test1056
     * @tc.desc      Verify matching with multiple Emojis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1056';
      console.log(TAG + 'start');

      const str = "😀🎉🎊Hello";
      expect(str.startsWith("😀🎉🎊")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1057
     * @tc.name      StringStartsWith.test1057
     * @tc.desc      Verify Emoji position calculation (Surrogate pairs)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1057';
      console.log(TAG + 'start');

      const str = "😀Hello";
      expect(str.startsWith("Hello", 2)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1058
     * @tc.name      StringStartsWith.test1058
     * @tc.desc      Verify matching with Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1058';
      console.log(TAG + 'start');

      const str = "\u0048\u0065\u006c\u006c\u006f";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.startsWith("\u0048")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1059
     * @tc.name      StringStartsWith.test1059
     * @tc.desc      Verify matching with special Unicode symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1059';
      console.log(TAG + 'start');

      const str = "♠♣♥♦Hello";
      expect(str.startsWith("♠♣♥♦")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1060
     * @tc.name      StringStartsWith.test1060
     * @tc.desc      Verify matching with partial multi-byte characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1060';
      console.log(TAG + 'start');

      const str = "你好世界";
      expect(str.startsWith("你")).assertTrue();
      expect(str.startsWith("你 好")).assertFalse();

      console.log(TAG + "end");
    });

    //========================== Exception Handling Test ============================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1061
     * @tc.name      StringStartsWith.test1061
     * @tc.desc      Verify TypeError when passing a direct regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1061';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testRegexError();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1062
     * @tc.name      StringStartsWith.test1062
     * @tc.desc      Verify TypeError when passing a regex with flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1062';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testRegexFlagsError();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1063
     * @tc.name      StringStartsWith.test1063
     * @tc.desc      Verify TypeError when passing a RegExp object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1063';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testRegExpObjectError();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1064
     * @tc.name      StringStartsWith.test1064
     * @tc.desc      Verify TypeError when this is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1064';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testNullThisError();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1065
     * @tc.name      StringStartsWith.test1065
     * @tc.desc      Verify TypeError when this is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1065';
      console.log(TAG + 'start');

      const result: boolean = startsWithTest.testUndefinedThisError();
      expect(result).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1066
     * @tc.name      StringStartsWith.test1066
     * @tc.desc      Verify handling of custom toString throwing error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1066';
      console.log(TAG + 'start');

      const result: string = startsWithTest.testToStringError();
      expect(result).assertEqual("toString error");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1067
     * @tc.name      StringStartsWith.test1067
     * @tc.desc      Compare startsWith and endsWith on the same string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1067';
      console.log(TAG + 'start');

      const str = "Hello World Hello";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.endsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1068
     * @tc.name      StringStartsWith.test1068
     * @tc.desc      Use startsWith and endsWith at different positions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1068';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();
      expect(str.endsWith("World")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1069
     * @tc.name      StringStartsWith.test1069
     * @tc.desc      Verify includes is true when startsWith is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1069';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      expect(str.includes("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1070
     * @tc.name      StringStartsWith.test1070
     * @tc.desc      Verify includes is true while startsWith is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1070';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.includes("World")).assertTrue();
      expect(str.startsWith("World")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1071
     * @tc.name      StringStartsWith.test1071
     * @tc.desc      Verify indexOf alignment when startsWith is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1071';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("World", 6)).assertTrue();
      expect(str.indexOf("World")).assertEqual(6);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1072
     * @tc.name      StringStartsWith.test1072
     * @tc.desc      Verify startsWith behavior when indexOf returns index > 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1072';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.indexOf("World")).assertEqual(6);
      expect(str.startsWith("World")).assertFalse();
      expect(str.startsWith("World", 6)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1073
     * @tc.name      StringStartsWith.test1073
     * @tc.desc      Verify startsWith on a sliced sub-string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1073';
      console.log(TAG + 'start');

      const str = "Hello World";
      const sliced = str.slice(6);
      expect(sliced.startsWith("World")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1074
     * @tc.name      StringStartsWith.test1074
     * @tc.desc      Verify startsWith on a substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1074';
      console.log(TAG + 'start');

      const str = "Hello World";
      const sub = str.substring(6);
      expect(sub.startsWith("World")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1075
     * @tc.name      StringStartsWith.test1075
     * @tc.desc      Verify startsWith after case conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1075';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.toLowerCase().startsWith("hello")).assertTrue();
      expect(str.toUpperCase().startsWith("HELLO")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1076
     * @tc.name      StringStartsWith.test1076
     * @tc.desc      Simulate case-insensitive matching using conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1076';
      console.log(TAG + 'start');

      const str = "Hello World";
      const search = "HELLO";
      expect(str.toLowerCase().startsWith(search.toLowerCase())).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1077
     * @tc.name      StringStartsWith.test1077
     * @tc.desc      Verify startsWith after trimming whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1077';
      console.log(TAG + 'start');

      const str = "  Hello World";
      expect(str.startsWith("Hello")).assertFalse();
      expect(str.trim().startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1078
     * @tc.name      StringStartsWith.test1078
     * @tc.desc      Verify matching with leading spaces using position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1078';
      console.log(TAG + 'start');

      const str = "  Hello World";
      expect(str.startsWith("  ")).assertTrue();
      expect(str.startsWith("Hello", 2)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1079
     * @tc.name      StringStartsWith.test1079
     * @tc.desc      Verify startsWith on repeated strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1079';
      console.log(TAG + 'start');

      const str = "abc".repeat(3);
      expect(str.startsWith("abc")).assertTrue();
      expect(str.startsWith("abcabc")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1080
     * @tc.name      StringStartsWith.test1080
     * @tc.desc      Verify matching a repeated pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1080';
      console.log(TAG + 'start');

      const str = "Hello".repeat(2);
      expect(str.startsWith("HelloHello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1081
     * @tc.name      StringStartsWith.test1081
     * @tc.desc      Verify startsWith after padStart
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1081';
      console.log(TAG + 'start');

      const str = "5".padStart(3, "0");
      expect(str.startsWith("00")).assertTrue();
      expect(str.startsWith("0")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1082
     * @tc.name      StringStartsWith.test1082
     * @tc.desc      Verify checking for padding characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1082';
      console.log(TAG + 'start');

      const str = "abc".padStart(10, "xyz");
      expect(str.startsWith("xyzxyzx")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1083
     * @tc.name      StringStartsWith.test1083
     * @tc.desc      Verify startsWith after string replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1083';
      console.log(TAG + 'start');

      const str = "Hello World";
      const replaced = str.replace("Hello", "Hi");
      expect(replaced.startsWith("Hi")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1084
     * @tc.name      StringStartsWith.test1084
     * @tc.desc      Verify startsWith after replacing the start of the string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1084';
      console.log(TAG + 'start');

      const str = "Hello World";
      const replaced = str.replace("Hello", "Goodbye");
      expect(replaced.startsWith("Goodbye")).assertTrue();

      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1085
     * @tc.name      StringStartsWith.test1085
     * @tc.desc      Verify startsWith on elements of a split string array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1085';
      console.log(TAG + 'start');

      const str = "Hello,World,Test";
      const parts = str.split(",");
      expect(parts[0].startsWith("Hello")).assertTrue();
      expect(parts[1].startsWith("World")).assertTrue();

      console.log(TAG + "end");
    });
    //==================== Actual Application Scenario Test ====================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1086
     * @tc.name      StringStartsWith.test1086
     * @tc.desc      Verify URL protocol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1086';
      console.log(TAG + 'start');

      const url = "https://example.com";
      expect(url.startsWith("https://")).assertTrue();
      expect(url.startsWith("http://")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1087
     * @tc.name      StringStartsWith.test1087
     * @tc.desc      Verify URL domain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1087';
      console.log(TAG + 'start');

      const url = "https://example.com/path";
      expect(url.startsWith("https://example.com")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1088
     * @tc.name      StringStartsWith.test1088
     * @tc.desc      Verify absolute file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1088';
      console.log(TAG + 'start');

      const path = "/usr/local/bin";
      expect(path.startsWith("/")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1089
     * @tc.name      StringStartsWith.test1089
     * @tc.desc      Verify relative file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1089';
      console.log(TAG + 'start');

      const path = "./folder/file.txt";
      expect(path.startsWith("./")).assertTrue();
      expect(path.startsWith("../")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1090
     * @tc.name      StringStartsWith.test1090
     * @tc.desc      Verify Windows file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1090';
      console.log(TAG + 'start');

      const path = "C:\\Users\\Documents";
      expect(path.startsWith("C:")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1091
     * @tc.name      StringStartsWith.test1091
     * @tc.desc      Verify file prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1091';
      console.log(TAG + 'start');

      const filename = "backup_20231215.zip";
      expect(filename.startsWith("backup_")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1092
     * @tc.name      StringStartsWith.test1092
     * @tc.desc      Verify command line flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1092';
      console.log(TAG + 'start');

      const arg = "--verbose";
      expect(arg.startsWith("--")).assertTrue();
      expect(arg.startsWith("-")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1093
     * @tc.name      StringStartsWith.test1093
     * @tc.desc      Verify command line short flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1093';
      console.log(TAG + 'start');

      const arg = "-v";
      expect(arg.startsWith("-")).assertTrue();
      expect(arg.startsWith("--")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1094
     * @tc.name      StringStartsWith.test1094
     * @tc.desc      Verify Base64 data URI
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1094';
      console.log(TAG + 'start');

      const dataUri = "data:image/png;base64,iVBORw0KG...";
      expect(dataUri.startsWith("data:image/")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1095
     * @tc.name      StringStartsWith.test1095
     * @tc.desc      Verify JSON data format string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1095';
      console.log(TAG + 'start');

      const json = '{"name": "John"}';
      expect(json.startsWith("{")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1096
     * @tc.name      StringStartsWith.test1096
     * @tc.desc      Verify line starts with specific character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1096';
      console.log(TAG + 'start');

      const line = "# Heading";
      expect(line.startsWith("#")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1097
     * @tc.name      StringStartsWith.test1097
     * @tc.desc      Verify line indentation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1097';
      console.log(TAG + 'start');

      const line = "    indented text";
      expect(line.startsWith("    ")).assertTrue();
      expect(line.startsWith("\t")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1098
     * @tc.name      StringStartsWith.test1098
     * @tc.desc      Verify phone number prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1098';
      console.log(TAG + 'start');

      const phone = "+86-13800138000";
      expect(phone.startsWith("+86")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1099
     * @tc.name      StringStartsWith.test1099
     * @tc.desc      Verify credit card prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1099';
      console.log(TAG + 'start');

      const cardNumber = "4111111111111111";
      expect(cardNumber.startsWith("4")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1100
     * @tc.name      StringStartsWith.test1100
     * @tc.desc      Verify variable naming prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1100';
      console.log(TAG + 'start');

      const identifier = "_privateVar";
      expect(identifier.startsWith("_")).assertTrue();
      expect(/^[a-zA-Z_$]/.test(identifier)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST1101
     * @tc.name      StringStartsWith.test1101
     * @tc.desc      Verify class name starts with uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test1101';
      console.log(TAG + 'start');

      const className = "MyClass";
      expect(/^[A-Z]/.test(className)).assertTrue();

      console.log(TAG + "end");
    });
  });
}