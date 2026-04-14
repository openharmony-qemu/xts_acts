import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_trim_test01';

export default function StringTrimTest01() {
  describe('StringTrimTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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

    //============================Whitespace Character Type Test==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1001
     * @tc.name      StringTrimTest1001
     * @tc.desc      Normal space character (U+0020)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1001';
      console.log(TAG + 'start');
      const str = "  test  ";
      expect(str).assertEqual("  test  ");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1002
     * @tc.name      StringTrimTest1002
     * @tc.desc      Horizontal tab character \t (U+0009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1002';
      console.log(TAG + 'start');
      const str = "\t\ttest\t\t";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1003
     * @tc.name      StringTrimTest1003
     * @tc.desc      Vertical tab character \v (U+000B)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1003';
      console.log(TAG + 'start');
      const str = "\v\vtest\v\v";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1004
     * @tc.name      StringTrimTest1004
     * @tc.desc      Form feed character \f (U+000C)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1004';
      console.log(TAG + 'start');
      const str = "\f\ftest\f\f";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1005
     * @tc.name      StringTrimTest1005
     * @tc.desc      Line feed character \n (U+000A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1005';
      console.log(TAG + 'start');
      const str = "\n\ntest\n\n";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1006
     * @tc.name      StringTrimTest1006
     * @tc.desc      Carriage return character \r (U+000D)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1006';
      console.log(TAG + 'start');
      const str = "\r\rtest\r\r";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1007
     * @tc.name      StringTrimTest1007
     * @tc.desc      Carriage return and line feed combination \r\n (U+000D U+000A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1007';
      console.log(TAG + 'start');
      const str = "\r\ntest\r\n";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1008
     * @tc.name      StringTrimTest1008
     * @tc.desc      Line separator character (U+2028)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1008';
      console.log(TAG + 'start');
      const str = "\u2028test\u2028";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1009
     * @tc.name      StringTrimTest1009
     * @tc.desc     Paragraph separator character (U+2029)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1009';
      console.log(TAG + 'start');
      const str = "\u2029test\u2029";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1010
     * @tc.name      StringTrimTest1010
     * @tc.desc      Non-breaking space character (U+00A0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1010';
      console.log(TAG + 'start');
      const str = "\u00A0test\u00A0";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1011
     * @tc.name      StringTrimTest1011
     * @tc.desc      Ideographic space character (U+3000)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1011';
      console.log(TAG + 'start');
      const str = "\u3000test\u3000";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1012
     * @tc.name      StringTrimTest1012
     * @tc.desc      Ogham space mark character (U+1680)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1012';
      console.log(TAG + 'start');
      const str = "\u1680test\u1680";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1013
     * @tc.name      StringTrimTest1013
     * @tc.desc      EN QUAD character (U+2000)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1013';
      console.log(TAG + 'start');
      const str = "\u2000test\u2000";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1014
     * @tc.name      StringTrimTest1014
     * @tc.desc      EN QUAD character (U+2001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1014';
      console.log(TAG + 'start');
      const str = "\u2001test\u2001";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1015
     * @tc.name      StringTrimTest1015
     * @tc.desc      EN SPACE character (U+2002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1015';
      console.log(TAG + 'start');
      const str = "\u2002test\u2002";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1016
     * @tc.name      StringTrimTest1016
     * @tc.desc      EN SPACE character (U+2003)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1016';
      console.log(TAG + 'start');
      const str = "\u2003test\u2003";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1017
     * @tc.name      StringTrimTest1017
     * @tc.desc      THIN SPACE character (U+2009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1017';
      console.log(TAG + 'start');
      const str = "\u2009test\u2009";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1018
     * @tc.name      StringTrimTest1018
     * @tc.desc      HAIR SPACE character (U+200A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1018';
      console.log(TAG + 'start');
      const str = "\u200Atest\u200A";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1019
     * @tc.name      StringTrimTest1019
     * @tc.desc      NARROW NO-BREAK SPACE character (U+202F)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1019';
      console.log(TAG + 'start');
      const str = "\u202Ftest\u202F";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1020
     * @tc.name      StringTrimTest1020
     * @tc.desc      MEDIUM MATHEMATICAL SPACE character (U+205F)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1020';
      console.log(TAG + 'start');
      const str = "\u205Ftest\u205F";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1021
     * @tc.name      StringTrimTest1021
     * @tc.desc      Mixed multiple whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1021';
      console.log(TAG + 'start');
      const str = " \t\n\r\ftest \t\n\r\f";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1022
     * @tc.name      StringTrimTest1022
     * @tc.desc      Consecutive identical whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1022';
      console.log(TAG + 'start');
      const str = "     test     ";
      expect(str.trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    //============================Boundary Value Testing==================================
    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1023
     * @tc.name      StringTrimTest1023
     * @tc.desc      The string is composed entirely of whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1023';
      console.log(TAG + 'start');
      'use strict';
      const str = "    \t\n\r   ";
      const result = str.trim();
      expect(result).assertEqual("")
      expect(result.length).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1024
     * @tc.name      StringTrimTest1024
     * @tc.desc      There is only one blank character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1024';
      console.log(TAG + 'start');
      'use strict';
      const str = " ";
      const result = str.trim();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1025
     * @tc.name      StringTrimTest1025
     * @tc.desc      There is only one non-blank character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1025';
      console.log(TAG + 'start');
      'use strict';
      const str = "a";
      const result = str.trim();
      expect(result).assertEqual("a");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1026
     * @tc.name      StringTrimTest1026
     * @tc.desc      Blank characters will not be deleted in the middle of a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1026';
      console.log(TAG + 'start');
      'use strict';
      const str = "hello world";
      const result = str.trim();
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1027
     * @tc.name      StringTrimTest1027
     * @tc.desc      Multiple white space characters in the middle of a string are retained
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1027';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello    world  ";
      const result = str.trim();
      expect(result).assertEqual("hello    world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1028
     * @tc.name      StringTrimTest1028
     * @tc.desc      Mixed special characters and white spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1028';
      console.log(TAG + 'start');
      'use strict';
      const str = "  @#$%  test  !@#$  ";
      const result = str.trim();
      expect(result).assertEqual("@#$%  test  !@#$");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1029
     * @tc.name      StringTrimTest1029
     * @tc.desc      Trimming operation for long strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1029';
      console.log(TAG + 'start');
      'use strict';
      const longStr = "    " + "a".repeat(10000) + "    ";
      const result = longStr.trim();
      expect(result.length).assertEqual(10000);
      expect(result === "a".repeat(10000)).assertEqual(true);
      console.log(TAG + "end");
    });


    //============================String Position Test==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1030
     * @tc.name      StringTrimTest1030
     * @tc.desc      Test different numbers of leading spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1030';
      console.log(TAG + 'start');
      'use strict';
      expect("test".trim()).assertEqual("test");
      expect(" test".trim()).assertEqual("test");
      expect("  test".trim()).assertEqual("test");
      expect("   test".trim()).assertEqual("test");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1031
     * @tc.name      StringTrimTest1031
     * @tc.desc      Leading multiple whitespace character combinations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1031';
      console.log(TAG + 'start');
      'use strict';
      const str = " \t\nhello";
      expect(str.trim()).assertEqual("hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1032
     * @tc.name      StringTrimTest1032
     * @tc.desc      Test different numbers of trailing spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1032';
      console.log(TAG + 'start');
      'use strict';
      expect("test".trim()).assertEqual("test");
      expect("test ".trim()).assertEqual("test");
      expect("test  ".trim()).assertEqual("test");
      expect("test   ".trim()).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1033
     * @tc.name      StringTrimTest1033
     * @tc.desc      Various combinations of whitespace characters at the end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1033';
      console.log(TAG + 'start');
      'use strict';
      const str = "hello \t\n";
      expect(str.trim()).assertEqual("hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1034
     * @tc.name      StringTrimTest1034
     * @tc.desc      Symmetrical blank characters at both ends
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1034';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello  ";
      expect(str.trim()).assertEqual("hello");
      console.log(TAG + "end");
    });


    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1035
     * @tc.name      StringTrimTest1035
     * @tc.desc      The number of blank characters at both ends is different
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1035';
      console.log(TAG + 'start');
      'use strict';
      const str = "   hello  ";
      expect(str.trim()).assertEqual("hello");
      console.log(TAG + "end");
    });

    //============================Return Value Feature Test==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1036
     * @tc.name      StringTrimTest1036
     * @tc.desc      The return value of trim() is of type string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1036';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1037
     * @tc.name      StringTrimTest1037
     * @tc.desc      Return a brand new string object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1037';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(result !== str).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1038
     * @tc.name      StringTrimTest1038
     * @tc.desc      trim() does not modify the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1038';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const original = str;
      str.trim();
      expect(str).assertEqual("  test  ");
      expect(str === original).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1039
     * @tc.name      StringTrimTest1039
     * @tc.desc      The original string length remains unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1039';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const originalLength = str.length;
      str.trim();
      expect(str.length).assertEqual(8);
      expect(str.length === originalLength).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1040
     * @tc.name      StringTrimTest1040
     * @tc.desc      The returned string length is correct
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1040';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(result.length).assertEqual(4);
      expect(str.length - result.length).assertEqual(4);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1041
     * @tc.name      StringTrimTest1041
     * @tc.desc      An all-blank string returns an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1041';
      console.log(TAG + 'start');
      'use strict';
      const str = "    ";
      const result = str.trim();
      expect(result.length).assertEqual(0);
      console.log(TAG + "end");
    });

    //============================Test in Combination with Other String Methods==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1042
     * @tc.name      StringTrimTest1042
     * @tc.desc      Call trimStart() after trim()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1042';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim().trimStart();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1043
     * @tc.name      StringTrimTest1043
     * @tc.desc      Call trimEnd() after trim()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1043';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim().trimEnd();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1044
     * @tc.name      StringTrimTest1044
     * @tc.desc      trimStart().trimEnd() is equivalent to trim()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1044';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result1 = str.trim();
      const result2 = str.trimStart().trimEnd();
      expect(result1 === result2).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1045
     * @tc.name      StringTrimTest1045
     * @tc.desc      trim and convert to lowercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1045';
      console.log(TAG + 'start');
      'use strict';
      const str = "  HELLO  ";
      const result = str.trim().toLowerCase();
      expect(result).assertEqual("hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1046
     * @tc.name      StringTrimTest1046
     * @tc.desc      trim then convert to uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1046';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello  ";
      const result = str.trim().toUpperCase();
      expect(result).assertEqual("HELLO");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1047
     * @tc.name      StringTrimTest1047
     * @tc.desc      After trimming, use includes to search
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1047';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().includes("world");
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1048
     * @tc.name      StringTrimTest1048
     * @tc.desc      Use indexOf to find the position after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1048';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().indexOf("world");
      expect(result).assertEqual(6);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1049
     * @tc.name      StringTrimTest1049
     * @tc.desc      Check the starting string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1049';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().startsWith("hello");
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1050
     * @tc.name      StringTrimTest1050
     * @tc.desc      Check the ending string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1050';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().endsWith("world");
      expect(result).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1051
     * @tc.name      StringTrimTest1051
     * @tc.desc      Extract substring with slice after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1051';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().slice(0, 5);
      expect(result).assertEqual("hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1052
     * @tc.name      StringTrimTest1052
     * @tc.desc      Extract substring after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1052';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().substring(6, 11);
      expect(result).assertEqual("world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1053
     * @tc.name      StringTrimTest1053
     * @tc.desc      Split string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1053';
      console.log(TAG + 'start');
      let result: string[] = stringTest.testTrimSplit()
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1054
     * @tc.name      StringTrimTest1054
     * @tc.desc      Replace content after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1054';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello world  ";
      const result = str.trim().replace("world", "js");
      expect(result).assertEqual("hello js");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1055
     * @tc.name      StringTrimTest1055
     * @tc.desc      Concatenate strings after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1055';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello  ";
      const result = str.trim().concat(" world");
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1056
     * @tc.name      StringTrimTest1056
     * @tc.desc      Repeat string after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1056';
      console.log(TAG + 'start');
      'use strict';
      const str = "  ab  ";
      const result = str.trim().repeat(3);
      expect(result).assertEqual("ababab");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1057
     * @tc.name      StringTrimTest1057
     * @tc.desc      pre-trim padding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1057';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim().padStart(10, "*");
      expect(result).assertEqual("******test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1058
     * @tc.name      StringTrimTest1058
     * @tc.desc      post-trim filling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1058';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim().padEnd(10, "*");
      expect(result).assertEqual("test******");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1059
     * @tc.name      StringTrimTest1059
     * @tc.desc      Regular expression matching after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1059';
      console.log(TAG + 'start');
      let result:string=stringTest.testTrimMatch()
      expect(result).assertEqual("123");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1060
     * @tc.name      StringTrimTest1060
     * @tc.desc      Regular expression search after trimming
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1060';
      console.log(TAG + 'start');
      'use strict';
      const str = "  hello123  ";
      const result = str.trim().search(/\d/);
      expect(result).assertEqual(5);
      console.log(TAG + "end");
    });

    //============================Practical Application Scenario Testing==================================
    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1061
     * @tc.name      StringTrimTest1061
     * @tc.desc      Clean User Input Username
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1061';
      console.log(TAG + 'start');
      'use strict';
      let result : string = stringTest.testClearUsername("admin");
      expect(result).assertEqual("用户名有效: admin");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1062
     * @tc.name      StringTrimTest1062
     * @tc.desc      Clean User Input Email
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1062';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testValidateEmail("Test@Example.COM");
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1063
     * @tc.name      StringTrimTest1063
     * @tc.desc      Clean Up Whitespace in CSV Data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1063';
      console.log(TAG + 'start');
      'use strict';
      const csvLine = "  John  ,  Doe  ,  25  ";
      const cleanData = csvLine.split(",").map(item => item.trim());
      expect(cleanData[0]).assertEqual("John");
      expect(cleanData[1]).assertEqual("Doe");
      expect(cleanData[2]).assertEqual("25");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1064
     * @tc.name      StringTrimTest1064
     * @tc.desc      Clean the string values in a JSON object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1064';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testCleanedData();
      expect(result.name).assertEqual("John");
      expect(result.email).assertEqual("john@example.com");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1065
     * @tc.name      StringTrimTest1065
     * @tc.desc      Clean the search keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1065';
      console.log(TAG + 'start');
      'use strict';
      let result = stringTest.testSearchProducts("  phone  ");
      expect(result[0]).assertEqual("iPhone");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1066
     * @tc.name      StringTrimTest1066
     * @tc.desc      Clean and split tags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1066';
      console.log(TAG + 'start');
      'use strict';
      const result : string[] = stringTest.testParseTags(" js , html , css ");
      expect(result[0]).assertEqual("js");
      expect(result[1]).assertEqual("html");
      expect(result[2]).assertEqual("css");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1067
     * @tc.name      StringTrimTest1067
     * @tc.desc      Ignore leading and trailing whitespace when comparing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1067';
      console.log(TAG + 'start');
      'use strict';
      let result : boolean = stringTest.testCompareIgnoreWhitespace("  hello  ", "hello");
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1068
     * @tc.name      StringTrimTest1068
     * @tc.desc      Ignore both case and whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1068';
      console.log(TAG + 'start');
      'use strict';
      let result : boolean = stringTest.testCaseAndWhitespace("  HELLO  ", "hello");
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1069
     * @tc.name      StringTrimTest1069
     * @tc.desc      Check if the input is a non-blank string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1069';
      console.log(TAG + 'start');
      'use strict';
      let result : boolean = stringTest.testNonEmptyString("  test  ") === true &&
        stringTest.testNonEmptyString("    ") === false &&
        stringTest.testNonEmptyString("") === false;
      expect(result).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1070
     * @tc.name      StringTrimTest1070
     * @tc.desc      Validate required fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1070';
      console.log(TAG + 'start');
      'use strict';
      let result : string | null = stringTest.testDateRequired("  ", "姓名");
      let result1 : string | null = stringTest.testDateRequired("张三", "姓名");
      expect(result).assertEqual("姓名 是必填项");
      expect(result1).assertNull();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1071
     * @tc.name      StringTrimTest1071
     * @tc.desc      Clean URL query parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1071';
      console.log(TAG + 'start');
      'use strictD';
      let result : Record<string,string> = stringTest.testCleanUrlParams({
        "  q  ": "  javascript  ",
        "  page  ": "  1  "
      }) as Record<string,string>;
      expect(result.q).assertEqual("javascript");
      expect(result.page).assertEqual("1");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1072
     * @tc.name      StringTrimTest1072
     * @tc.desc      Trim leading and trailing whitespace from filenames
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1072';
      console.log(TAG + 'start');
      'use strictD';
      let result : string = stringTest.testSanitizeFilename("  my document.pdf  ");
      expect(result).assertEqual("my_document.pdf");
      console.log(TAG + "end");
    });

    //============================Special character and Unicode testing==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1073
     * @tc.name      StringTrimTest1073
     * @tc.desc      Clean whitespace in Chinese character strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1073';
      console.log(TAG + 'start');
      'use strictD';
      const str = "  你好世界  ";
      const result = str.trim();
      expect(result).assertEqual("你好世界");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1074
     * @tc.name      StringTrimTest1074
     * @tc.desc      Trim mixed Chinese-English strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1074';
      console.log(TAG + 'start')
      'use strictD';
      const str = "  Hello 世界  ";
      const result = str.trim();
      expect(result).assertEqual("Hello 世界");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1075
     * @tc.name      StringTrimTest1075
     * @tc.desc      Trim strings containing Emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1075';
      console.log(TAG + 'start');
      'use strictD';
      const str = "    ";
      const result = str.trim();
      expect(result).assertEqual("");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1076
     * @tc.name      StringTrimTest1076
     * @tc.desc      Trim strings mixed with Emoji and text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1076';
      console.log(TAG + 'start');
      'use strict';
      const str = "  Hello  World  ";
      const result = str.trim();
      expect(result).assertEqual("Hello  World");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1077
     * @tc.name      StringTrimTest1077
     * @tc.desc      Zero-width characters are not whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1077';
      console.log(TAG + 'start');
      'use strict';
      const str = "\u200Btest\u200B";
      const result = str.trim();
      expect(result).assertEqual("\u200Btest\u200B");
      expect(result.length).assertEqual(6);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1078
     * @tc.name      StringTrimTest1078
     * @tc.desc      BOM character (U+FEFF) as whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1078';
      console.log(TAG + 'start');
      'use strict';
      const str = "\uFEFFtest\uFEFF";
      const result = str.trim();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1079
     * @tc.name      StringTrimTest1079
     * @tc.desc      Some control characters are trimmed
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     Level 2
     */
    it("StringTrimTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1079';
      console.log(TAG + 'start');
      'use strict';
      const str = "\x00test\x00";
      const result = str.trim();
      expect(result.length).assertEqual(6);
      console.log(TAG + "end");
    });

    //============================Chained call testing==================================
    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1080
     * @tc.name      StringTrimTest1080
     * @tc.desc      Call trim() multiple times consecutively
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1080';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim().trim().trim();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1081
     * @tc.name      StringTrimTest1081
     * @tc.desc      Chain call of multiple string methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1081';
      console.log(TAG + 'start');
      'use strict';
      const str = "  HELLO WORLD  ";
      const result = str.trim().toLowerCase().replace("world", "js");
      expect(result).assertEqual("hello js");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1082
     * @tc.name      StringTrimTest1082
     * @tc.desc      Complex string processing chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1082';
      console.log(TAG + 'start');
      'use strict';
      const str = "  The Quick Brown Fox  ";
      const result = str.trim()
        .toLowerCase()
        .split(" ")
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(" ");
      expect(result).assertEqual("The Quick Brown Fox");
      console.log(TAG + "end");
    });

    //============================Performance-related boundary testing==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1083
     * @tc.name      StringTrimTest1083
     * @tc.desc      Process a large number of leading whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1083';
      console.log(TAG + 'start');
      'use strict';
      const manySpaces = " ".repeat(100000);
      const str = manySpaces + "test";
      const result = str.trim();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1084
     * @tc.name      StringTrimTest1084
     * @tc.desc      Process a large number of trailing whitespace characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1084';
      console.log(TAG + 'start');
      'use strict';
      const manySpaces = " ".repeat(100000);
      const str = "test" + manySpaces;
      const result = str.trim();
      expect(result).assertEqual("test");
      expect(result.length).assertEqual(4);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1085
     * @tc.name      StringTrimTest1085
     * @tc.desc      Whitespace and characters appear alternately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1085';
      console.log(TAG + 'start');
      'use strict';
      const str = " a b c d e ";
      const result = str.trim();
      expect(result).assertEqual("a b c d e");
      expect(result.length).assertEqual(9);
      console.log(TAG + "end");
    });

    //============================Strict Mode Test==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1086
     * @tc.name      StringTrimTest1086
     * @tc.desc      Use trim in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1086';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result = str.trim();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1087
     * @tc.name      StringTrimTest1087
     * @tc.desc      Chain call in strict mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1087';
      console.log(TAG + 'start');
      'use strict';
      const str = "  TEST  ";
      const result = str.trim().toLowerCase();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    //============================Methods and Properties Testing==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1088
     * @tc.name      StringTrimTest1088
     * @tc.desc      The parameter length of the trim method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1088';
      console.log(TAG + 'start');
      'use strict';
      const trimParamLength : number = stringTest.testTrimParamLength();
      expect(trimParamLength).assertEqual(0);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1089
     * @tc.name      StringTrimTest1089
     * @tc.desc      The name property of the trim method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1089';
      console.log(TAG + 'start');
      'use strict';
      const trimMethodName : string = stringTest.testTrimMethodName();
      expect(trimMethodName).assertEqual("trim");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1090
     * @tc.name      StringTrimTest1090
     * @tc.desc      trim is a method on the String prototype
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1090';
      console.log(TAG + 'start');
      'use strict';
      const result : boolean = stringTest.testHasOwnProperty();
      const result1 : boolean = stringTest.testHasOwnProperty1();
      const result2 : boolean = stringTest.testHasOwnProperty2();
      expect(result).assertFalse();
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1091
     * @tc.name      StringTrimTest1091
     * @tc.desc      Enumerability of the trim method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1091';
      console.log(TAG + 'start')
      'use strict';
      const result : (boolean | undefined)[] = stringTest.testOwnPropertyDescriptor();
      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1092
     * @tc.name      StringTrimTest1092
     * @tc.desc      Call trim via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1092';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result : string = stringTest.testTrimCall(str);
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1093
     * @tc.name      StringTrimTest1093
     * @tc.desc      Call trim via apply method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1093';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result : string = stringTest.testTrimApply(str);
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1094
     * @tc.name      StringTrimTest1094
     * @tc.desc      Use trim on array-like objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1094';
      console.log(TAG + 'start');
      'use strict';
      const result : string[] = stringTest.testTrimCallBind();
      expect(result[0]).assertEqual("test");
      console.log(TAG + "end");
    });

    //============================Type Conversion Testing==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1095
     * @tc.name      StringTrimTest1095
     * @tc.desc      Call trim() on String object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1095';
      console.log(TAG + 'start');
      'use strict';
      const strObj = new String("  test  ");
      const result = strObj.trim();
      expect(result).assertEqual("test");
      expect(typeof result).assertEqual("string");
      expect(typeof strObj).assertEqual("object");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1096
     * @tc.name      StringTrimTest1096
     * @tc.desc      The trim results of String object and primitive string are consistent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1096';
      console.log(TAG + 'start');
      'use strict';
      const strPrim = "  test  ";
      const strObj = new String("  test  ");
      expect(strPrim.trim() === strObj.trim()).assertEqual(true);
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1097
     * @tc.name      StringTrimTest1097
     * @tc.desc      Call trim on number via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1097';
      console.log(TAG + 'start');
      'use strict';
      const num = 123;
      const result : string = stringTest.testTrimCall(num);
      expect(result).assertEqual("123");
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1098
     * @tc.name      StringTrimTest1098
     * @tc.desc      Call trim on boolean via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1098';
      console.log(TAG + 'start');
      'use strict';
      const bool = true;
      const result : string = stringTest.testTrimCall(bool);
      expect(result).assertEqual("true");
      expect(typeof result).assertEqual("string");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1099
     * @tc.name      StringTrimTest1099
     * @tc.desc      Call trim on object via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1099';
      console.log(TAG + 'start');
      'use strict';
      const result : string = stringTest.testTrimCallObj();
      expect(result).assertEqual("test");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1100
     * @tc.name      StringTrimTest1100
     * @tc.desc      Call trim on array via call method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1100';
      console.log(TAG + 'start');
      'use strict';
      const arr = [1, 2, 3];
      const result : string = stringTest.testTrimCall(arr);
      expect(result).assertEqual("1,2,3");
      console.log(TAG + "end");
    });

    //============================Parameter Testing==================================

    /**
     * @tc.number    BUILTINS_STRING_TRIM_TEST1101
     * @tc.name      StringTrimTest1101
     * @tc.desc      trim() does not accept parameters, passed parameters are ignored
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringTrimTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringTrimTest1101';
      console.log(TAG + 'start');
      'use strict';
      const str = "  test  ";
      const result1 : string = str.trim();
      const result2 : string = stringTest.testTrim("ignored");
      const result3 : string = stringTest.testTrim(123, "multiple", "params");
      expect(result1).assertEqual("test");
      expect(result2).assertEqual("test");
      expect(result3).assertEqual("test");
      expect(result1 === result2 && result2 === result3).assertEqual(true);
      console.log(TAG + "end");
    });
  });
}