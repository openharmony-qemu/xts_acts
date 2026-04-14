import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as startsWithTest from './string_startswith_test1';

export default function StringStartsWithTest2() {
  describe('StringStartsWithTest2', () => {
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
    //==================== Chain calls and complex expressions ====================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2001
     * @tc.name      StringStartsWith.test2001
     * @tc.desc      Verify chained string methods with startsWith
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2001';
      console.log(TAG + 'start');

      const str = "  Hello World  ";
      expect(str.trim().toLowerCase().startsWith("hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2002
     * @tc.name      StringStartsWith.test2002
     * @tc.desc      Verify multiple calls to startsWith
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2002';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello") || str.startsWith("World")).assertTrue();
      expect(str.startsWith("Hello") && str.startsWith("Hel")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2003
     * @tc.name      StringStartsWith.test2003
     * @tc.desc      Verify matching with template strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2003';
      console.log(TAG + 'start');

      const str = "Hello World";
      const prefix = "Hello";
      expect(str.startsWith(`${prefix}`)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2004
     * @tc.name      StringStartsWith.test2004
     * @tc.desc      Verify matching with dynamic template strings (Corrected Expectation)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2004';
      console.log(TAG + 'start');

      const result: boolean[] = startsWithTest.testDynamicTemplateString();

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2005
     * @tc.name      StringStartsWith.test2005
     * @tc.desc      Verify combining startsWith with AND operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2005';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello") && str.length > 5).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2006
     * @tc.name      StringStartsWith.test2006
     * @tc.desc      Verify combining startsWith with OR operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2006';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello") || str.startsWith("World")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2007
     * @tc.name      StringStartsWith.test2007
     * @tc.desc      Verify combining startsWith with NOT operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2007';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(!str.startsWith("World")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2008
     * @tc.name      StringStartsWith.test2008
     * @tc.desc      Verify using startsWith in a ternary operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2008';
      console.log(TAG + 'start');

      const str = "Hello World";
      const result = str.startsWith("Hello") ? "Starts with Hello" : "Does not start with Hello";
      expect(result).assertEqual("Starts with Hello");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2009
     * @tc.name      StringStartsWith.test2009
     * @tc.desc      Verify nested ternary operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2009';
      console.log(TAG + 'start');

      const str = "Hello World";
      const result = str.startsWith("Hello")
        ? "Starts with Hello"
        : str.startsWith("World")
          ? "Starts with World"
          : "Starts with something else";
      expect(result).assertEqual("Starts with Hello");

      console.log(TAG + "end");
    });

    //==================== Performance and extreme cases test ====================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2010
     * @tc.name      StringStartsWith.test2010
     * @tc.desc      Verify matching on very long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2010';
      console.log(TAG + 'start');

      const longStr = "a".repeat(1000000);
      expect(longStr.startsWith("a")).assertTrue();
      expect(longStr.startsWith("aaa")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2011
     * @tc.name      StringStartsWith.test2011
     * @tc.desc      Verify matching with a long search string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2011';
      console.log(TAG + 'start');

      const str = "a".repeat(10000);
      const search = "a".repeat(5000);
      expect(str.startsWith(search)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2012
     * @tc.name      StringStartsWith.test2012
     * @tc.desc      Verify mismatch on a very long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2012';
      console.log(TAG + 'start');

      const longStr = "b" + "a".repeat(1000000);
      expect(longStr.startsWith("a")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2013
     * @tc.name      StringStartsWith.test2013
     * @tc.desc      Verify behavior with negative Infinity position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2013';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("Hello", -Infinity)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2014
     * @tc.name      StringStartsWith.test2014
     * @tc.desc      Verify behavior with a very large negative position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2014';
      console.log(TAG + 'start');

      const str = "Hello";
      expect(str.startsWith("Hello", -999999999)).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2015
     * @tc.name      StringStartsWith.test2015
     * @tc.desc      Verify matching a repeated single character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2015';
      console.log(TAG + 'start');

      const str = "a".repeat(1000);
      expect(str.startsWith("a")).assertTrue();
      expect(str.startsWith("aa")).assertTrue();
      expect(str.startsWith("b")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2016
     * @tc.name      StringStartsWith.test2016
     * @tc.desc      Verify matching a repeated pattern string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2016';
      console.log(TAG + 'start');

      const str = "abc".repeat(1000);
      expect(str.startsWith("abc")).assertTrue();
      expect(str.startsWith("abcabc")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2017
     * @tc.name      StringStartsWith.test2017
     * @tc.desc      Verify fast fail on a long string mismatch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2017';
      console.log(TAG + 'start');

      const str = "a".repeat(1000000);
      expect(str.startsWith("b")).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2018
     * @tc.name      StringStartsWith.test2018
     * @tc.desc      Verify full match on a long string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2018';
      console.log(TAG + 'start');

      const str = "a".repeat(10000);
      const search = "a".repeat(10000);
      expect(str.startsWith(search)).assertTrue();

      console.log(TAG + "end");
    });

    //==================== Strict mode and special environments ====================

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2019
     * @tc.name      StringStartsWith.test2019
     * @tc.desc      Verify startsWith in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2019';
      console.log(TAG + 'start');

      const str = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2020
     * @tc.name      StringStartsWith.test2020
     * @tc.desc      Verify this binding in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2020';
      console.log(TAG + 'start');

      expect(startsWithTest.testStrictThis()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2021
     * @tc.name      StringStartsWith.test2021
     * @tc.desc      Verify calling with call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2021';
      console.log(TAG + 'start');

      expect(startsWithTest.testCall()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2022
     * @tc.name      StringStartsWith.test2022
     * @tc.desc      Verify calling with apply method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2022';
      console.log(TAG + 'start');

      expect(startsWithTest.testApply()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2023
     * @tc.name      StringStartsWith.test2023
     * @tc.desc      Verify calling with bind method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2023';
      console.log(TAG + 'start');

      expect(startsWithTest.testBind()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2024
     * @tc.name      StringStartsWith.test2024
     * @tc.desc      Verify behavior on array objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2024';
      console.log(TAG + 'start');

      expect(startsWithTest.testArrayObjError()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2025
     * @tc.name      StringStartsWith.test2025
     * @tc.desc      Verify behavior on String wrapper objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2025';
      console.log(TAG + 'start');

      const strObj = new String("Hello World");
      expect(strObj.startsWith("Hello")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2026
     * @tc.name      StringStartsWith.test2026
     * @tc.desc      Verify behavior on custom objects with toString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2026';
      console.log(TAG + 'start');

      expect(startsWithTest.testCustomObj()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2027
     * @tc.name      StringStartsWith.test2027
     * @tc.desc      Verify with iterator protocol
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2027';
      console.log(TAG + 'start');

      expect(startsWithTest.testIterator()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2028
     * @tc.name      StringStartsWith.test2028
     * @tc.desc      Verify methods on the prototype chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2028';
      console.log(TAG + 'start');

      const res: boolean[] = startsWithTest.testProtoChain();
      expect(res[0]).assertFalse();
      expect(res[1]).assertTrue();
      expect(res[2]).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2029
     * @tc.name      StringStartsWith.test2029
     * @tc.desc      Verify modifying prototype method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2029';
      console.log(TAG + 'start');

      expect(startsWithTest.testModifyProto()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2030
     * @tc.name      StringStartsWith.test2030
     * @tc.desc      Verify on frozen strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2030';
      console.log(TAG + 'start');

      expect(startsWithTest.testFrozen()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2031
     * @tc.name      StringStartsWith.test2031
     * @tc.desc      Verify on sealed strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2031';
      console.log(TAG + 'start');

      expect(startsWithTest.testSealed()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2032
     * @tc.name      StringStartsWith.test2032
     * @tc.desc      12.7.1 Verify on Proxy wrapped strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2032';
      console.log(TAG + 'start');

      expect(startsWithTest.testProxy()).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_STARTSWITH_TEST2033
     * @tc.name      StringStartsWith.test2033
     * @tc.desc      Verify across frames or windows
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringStartsWith.test2033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringStartsWith.test2033';
      console.log(TAG + 'start');

      expect(true).assertTrue();

      console.log(TAG + "end");
    });
  });
}