import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_replace_test01';
export default function StringReplaceTest1() {
  describe('StringReplaceTest1', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });


    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1001
     * @tc.name      StringReplaceTest1001
     * @tc.desc      Use RegExp object as pattern to replace first occurrence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1001';
      console.log(TAG + 'start');
      const str = "hello world, hello javascript";
      const result = str.replace(/hello/, "hi");
      expect(result).assertEqual("hi world, hello javascript");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1002
     * @tc.name      StringReplaceTest1002
     * @tc.desc      Use regular expression to match multiple numeric characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1002';
      console.log(TAG + 'start');
      const str = "apple123banana456";
      const result = str.replace(/[0-9]+/, "NUMBER");
      expect(result).assertEqual("appleNUMBERbanana456");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1003
     * @tc.name      StringReplaceTest1003
     * @tc.desc      Use i flag for case-insensitive replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1003';
      console.log(TAG + 'start');
      const str = "Hello HELLO hello";
      const result = str.replace(/hello/i, "hi");
      expect(result).assertEqual("hi HELLO hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1004
     * @tc.name      StringReplaceTest1004
     * @tc.desc      Use g flag to replace all matched occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1004';
      console.log(TAG + 'start');
      const str = "hello world, hello javascript";
      const result = str.replace(/hello/g, "hi");
      expect(result).assertEqual("hi world, hi javascript");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1005
     * @tc.name      StringReplaceTest1005
     * @tc.desc      Use both g and i flags for global case-insensitive replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1005';
      console.log(TAG + 'start');
      const str = "Hello HELLO hello";
      const result = str.replace(/hello/gi, "hi");
      expect(result).assertEqual("hi hi hi");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1006
     * @tc.name      StringReplaceTest1006
     * @tc.desc      Use m flag with line start anchor for multiline replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1006';
      console.log(TAG + 'start');
      const str = "line1\nline2\nline3";
      const result2 = str.replace(/^line/g, "row");
      expect(result2).assertEqual("row1\nline2\nline3");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1007
     * @tc.name      StringReplaceTest1007
     * @tc.desc      Use s flag to make dot match newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1007';
      console.log(TAG + 'start');
      const str = "hello\nworld";
      const result2 = str.replace(/hello.world/, "replaced");
      expect(result2).assertEqual("hello\nworld");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1008
     * @tc.name      StringReplaceTest1008
     * @tc.desc      Use u flag to handle Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1008';
      console.log(TAG + 'start');
      const str = "\u{1F600} hello";
      const result = str.replace(/\u{1F600}/u, "emoji");
      expect(result).assertEqual("emoji hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1009
     * @tc.name      StringReplaceTest1009
     * @tc.desc      Use u flag to handle Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1009';
      console.log(TAG + 'start');
      const str = " hello";
      const result = str.replace(/\u{1F600}/u, "emoji");
      expect(result).assertEqual(" hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1010
     * @tc.name      StringReplaceTest1010
     * @tc.desc      Combine multiple flags g, i, m for replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1010';
      console.log(TAG + 'start');
      const str = "Hello\nWorld\nHELLO";
      const result = str.replace(/^hello/gim, "hi");
      expect(result).assertEqual("hi\nWorld\nhi");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1011
     * @tc.name      StringReplaceTest1011
     * @tc.desc      Regex without flags only replaces first match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1011';
      console.log(TAG + 'start');
      const str = "cat dog cat bird";
      const result = str.replace(/cat/, "tiger");
      expect(result).assertEqual("tiger dog cat bird");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1012
     * @tc.name      StringReplaceTest1012
     * @tc.desc      Use capture groups and reference in replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1012';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/(\w+) (\w+)/, "$2 $1");
      expect(result).assertEqual("world hello");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1013
     * @tc.name      StringReplaceTest1013
     * @tc.desc      Use multiple capture groups for date format conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1013';
      console.log(TAG + 'start');
      const str = "2024-03-09";
      const result = str.replace(/(\d{4})-(\d{2})-(\d{2})/, "$3/$2/$1");
      expect(result).assertEqual("09/03/2024");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1014
     * @tc.name      StringReplaceTest1014
     * @tc.desc      Use nested capture groups in replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1014';
      console.log(TAG + 'start');
      const str = "abc123";
      const result = str.replace(/((abc)(123))/, "$2-$3");
      expect(result).assertEqual("abc-123");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1015
     * @tc.name      StringReplaceTest1015
     * @tc.desc      Use non-capturing groups (?:...) in regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1015';
      console.log(TAG + 'start');
      const str = "hello123world";
      const result = str.replace(/(?:hello)(\d+)(world)/, "[$1]-$2");
      expect(result).assertEqual("[123]-world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1016
     * @tc.name      StringReplaceTest1016
     * @tc.desc      Mix capture groups and non-capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1016';
      console.log(TAG + 'start');
      const str = "abc123def456";
      const result = str.replace(/(abc)(?:\d+)(def)(\d+)/, "$1-$2-$3");
      expect(result).assertEqual("abc-def-456");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1017
     * @tc.name      StringReplaceTest1017
     * @tc.desc      Use named capture groups and reference in replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1017';
      console.log(TAG + 'start');
      const str = "John Smith";
      const result = str.replace(/(?<first>\w+) (?<last>\w+)/, "$<last>, $<first>");
      expect(result).assertEqual("Smith, John");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1018
     * @tc.name      StringReplaceTest1018
     * @tc.desc      Reference non-existent named capture group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1018';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replace(/hello/, "$<nonexist>");
      expect(result).assertEqual("$<nonexist>");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1019
     * @tc.name      StringReplaceTest1019
     * @tc.desc      Use ^ and $ boundary anchors for replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1019';
      console.log(TAG + 'start');
      const str = "hello world";
      const result2 = str.replace(/world$/, "javascript");
      expect(result2).assertEqual("hello javascript");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1020
     * @tc.name      StringReplaceTest1020
     * @tc.desc      Use \b word boundary for precise matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1020';
      console.log(TAG + 'start');
      const str = "cat category catalog";
      const result = str.replace(/\bcat\b/g, "dog");
      expect(result).assertEqual("dog category catalog");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1021
     * @tc.name      StringReplaceTest1021
     * @tc.desc      Use positive lookahead (?=...) for conditional matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1021';
      console.log(TAG + 'start');
      const str = "hello123 world456";
      const result = str.replace(/\d+(?= )/g, "NUM");
      expect(result).assertEqual("helloNUM world456");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1022
     * @tc.name      StringReplaceTest1022
     * @tc.desc      Use negative lookahead (?!...) for exclusion matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1022';
      console.log(TAG + 'start');
      const str = "hello123 world456";
      const result = str.replace(/\d+(?! )/g, "NUM");
      expect(result).assertEqual("helloNUM3 worldNUM");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1023
     * @tc.name      StringReplaceTest1023
     * @tc.desc      Use positive lookbehind (?<=...) for prefix matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1023';
      console.log(TAG + 'start');
      const str = "price: $100, $200";
      const result = str.replace(/(?<=\$)\d+/g, "XXX");
      expect(result).assertEqual("price: $XXX, $XXX");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1024
     * @tc.name      StringReplaceTest1024
     * @tc.desc      Use negative lookbehind (?<!...) for exclusion prefix matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1024';
      console.log(TAG + 'start');
      const str = "price: 100$, 200$";
      const result = str.replace(/(?<!\$)\d+/g, "NUM");
      expect(result).assertEqual("price: NUM$, NUM$");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1025
     * @tc.name      StringReplaceTest1025
     * @tc.desc      Assertion matches but does not consume characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1025';
      console.log(TAG + 'start');
      const str = "abc";
      const result = str.replace(/(?=b)/, "X");
      expect(result).assertEqual("aXbc");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1026
     * @tc.name      StringReplaceTest1026
     * @tc.desc      Use greedy quantifier * for maximum match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1026';
      console.log(TAG + 'start');
      const str = "<div>content</div>";
      const result = str.replace(/<.*>/, "[TAG]");
      expect(result).assertEqual("[TAG]");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1027
     * @tc.name      StringReplaceTest1027
     * @tc.desc      Use lazy quantifier *? for minimum match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1027';
      console.log(TAG + 'start');
      const str = "<div>content</div>";
      const result = str.replace(/<.*?>/, "[TAG]");
      expect(result).assertEqual("[TAG]content</div>");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1028
     * @tc.name      StringReplaceTest1028
     * @tc.desc      Use lazy quantifier *? for minimum match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1028';
      console.log(TAG + 'start');
      const str = "<div>content</div>";
      const result = str.replace(/<.*?>/, "[TAG]");
      expect(result).assertEqual("[TAG]content</div>");
      console.log(TAG + "end");
    });
    //============================Special Replacement Patterns==================================
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1029
     * @tc.name      StringReplaceTest1029
     * @tc.desc      Use to insert a literal $
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1029';
      console.log(TAG + 'start');
      const str = "price: 100";
      const result = str.replace(/100/, "$$200");
      expect(result).assertEqual("price: $200");
      console.log(TAG + "end");
    });


    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1030
     * @tc.name      StringReplaceTest1030
     * @tc.desc      Use $& to reference the entire matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1030';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/world/, "beautiful $&");
      expect(result).assertEqual("hello beautiful world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1031
     * @tc.name      StringReplaceTest1031
     * @tc.desc      Use the $& special replacement pattern multiple times within the replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1031';
      console.log(TAG + 'start');
      const str = "cat";
      const result = str.replace(/cat/, "$& $& $&");
      expect(result).assertEqual("cat cat cat");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1032
     * @tc.name      StringReplaceTest1032
     * @tc.desc      Use the $` special replacement pattern to insert the text preceding the match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1032';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/world/, "$`");
      expect(result).assertEqual("hello hello ");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1033
     * @tc.name      StringReplaceTest1033
     * @tc.desc      Use $' to insert the text following the matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1033';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/hello/, "$'");
      expect(result).assertEqual(" world world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1034
     * @tc.name      StringReplaceTest1034
     * @tc.desc      Reference the nth capturing group using $n
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1034';
      console.log(TAG + 'start');
      const str = "apple,orange";
      const result = str.replace(/(\w+),(\w+)/, "$2,$1");
      expect(result).assertEqual("orange,apple");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1035
     * @tc.name      StringReplaceTest1035
     * @tc.desc      Referencing an undefined capturing group index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1035';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replace(/hello/, "$2");
      expect(result).assertEqual("$2");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1036
     * @tc.name      StringReplaceTest1036
     * @tc.desc      The capturing group is present but unmatched because of an alternation branch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1036';
      console.log(TAG + 'start');
      const str = "abc";
      const result = str.replace(/(a)|(b)/, "$2");
      expect(result).assertEqual("bc");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1037
     * @tc.name      StringReplaceTest1037
     * @tc.desc      Use the $10 or higher-numbered capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1037';
      console.log(TAG + 'start');
      const str = "1-2-3-4-5-6-7-8-9-10";
      const result = str.replace(/(1)-(2)-(3)-(4)-(5)-(6)-(7)-(8)-(9)-(10)/, "$10");
      expect(result).assertEqual("10");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1038
     * @tc.name      StringReplaceTest1038
     * @tc.desc      Test the boundary condition for 99 capturing groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1038';
      console.log(TAG + 'start');
      const str = "a".repeat(100);
      let pattern = "";
      for (let i = 1; i <= 99; i++) {
        pattern += "(a)";
      }
      pattern += "a";
      const regex = new RegExp(pattern);
      const result = str.replace(regex, "$99");
      expect(result).assertEqual("a");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1039
     * @tc.name      StringReplaceTest1039
     * @tc.desc      Reference a named capture group using the $<groupName> syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1039';
      console.log(TAG + 'start');
      const str = "2024-03-09";
      const result = str.replace(/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/, "$<day>/$<month>/$<year>");
      expect(result).assertEqual("09/03/2024");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1040
     * @tc.name      StringReplaceTest1040
     * @tc.desc      Use multiple special replacement patterns together in the replacement string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1040';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/(\w+) (\w+)/, "Matched: $&, Before: $`, Groups: $1-$2");
      expect(result).assertEqual("Matched: hello world, Before: , Groups: hello-world");
      console.log(TAG + "end");
    });
    //============================Function as a substitute==================================
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1041
     * @tc.name      StringReplaceTest1041
     * @tc.desc      Use arrow function as replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1041';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/world/, match => match.toUpperCase());
      expect(result).assertEqual("hello WORLD");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1042
     * @tc.name      StringReplaceTest1042
     * @tc.desc      Use a regular function as the replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1042';
      console.log(TAG + 'start');
      let result: string = stringTest.testUseRegularFunction()
      expect(result).assertEqual("hello WORLD");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1043
     * @tc.name      StringReplaceTest1043
     * @tc.desc      Get the matched substring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1043';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/world/, (match) => {
        console.log(match);
        return match;
      });
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1044
     * @tc.name      StringReplaceTest1044
     * @tc.desc      Test Description: Get the content matched by the capture group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1044';
      console.log(TAG + 'start');
      let result: string = stringTest.testCaptureGroupParameters()
      expect(result).assertEqual("world hello");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1045
     * @tc.name      StringReplaceTest1045
     * @tc.desc      Get the offset of the matched substring in the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1045';
      console.log(TAG + 'start');
      let result: string = stringTest.testOffsetParameter()
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1046
     * @tc.name      StringReplaceTest1046
     * @tc.desc      Get the original string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1046';
      console.log(TAG + 'start');
      let result: string = stringTest.testStringParameter()
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1047
     * @tc.name      StringReplaceTest1047
     * @tc.desc      Use rest parameters when there are no named groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1047';
      console.log(TAG + 'start');
      let result: string = stringTest.testWithoutNamedGroups();
      expect(result).assertEqual("hello world");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1048
     * @tc.name      StringReplaceTest1048
     * @tc.desc      The function returns a string as the replacement content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1048';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replace(/hello/, () => "world");
      expect(result).assertEqual("world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1049
     * @tc.name      StringReplaceTest1049
     * @tc.desc      Return string as replacement content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1049';
      console.log(TAG + 'start');
      const str = "hello";
      const result = str.replace(/hello/, () => "world");
      console.log(result);
      expect(result).assertEqual("world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1050
     * @tc.name      StringReplaceTest1050
     * @tc.desc      Number return value auto-converts to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1050';
      console.log(TAG + 'start');
      let result: string = stringTest.testReturningNumber()
      expect(result).assertEqual("value: 123");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1051
     * @tc.name      StringReplaceTest1051
     * @tc.desc      Test description: undefined becomes "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1051';
      console.log(TAG + 'start');
      let result: string = stringTest.testReturningUndefined()
      expect(result).assertEqual("undefined");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1052
     * @tc.name      StringReplaceTest1052
     * @tc.desc       null becomes "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1052';
      console.log(TAG + 'start');
      let result: string = stringTest.testReturningNull()
      expect(result).assertEqual("null");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1053
     * @tc.name      StringReplaceTest1053
     * @tc.desc     Object return calls toString()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1053';
      console.log(TAG + 'start');
      let result: string = stringTest.testReturningObject()
      expect(result).assertEqual("world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1054
     * @tc.name      StringReplaceTest1054
     * @tc.desc     'g' flag triggers multiple function calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1054';
      console.log(TAG + 'start');
      let result: string = stringTest.testFunctionMultipleTimes()
      expect(result).assertEqual("a[1]b[2]c[3]");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1055
     * @tc.name      StringReplaceTest1055
     * @tc.desc     Different offset for each match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1055';
      console.log(TAG + 'start');
      let result: string[] = stringTest.testDifferentOffsetEachCall()
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(8);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1056
     * @tc.name      StringReplaceTest1056
     * @tc.desc     Arrow function preserves lexical 'this'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1056';
      console.log(TAG + 'start');
      let result: string = stringTest.testTheOriginalStrings()
      expect(result).assertEqual("Symbol(test)");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1057
     * @tc.name      StringReplaceTest1057
     * @tc.desc     Arrow function preserves lexical 'this'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1057';
      console.log(TAG + 'start');
      let result: string = stringTest.testThisArrowFunctions()
      expect(result).assertEqual("PREFIX-hello world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1058
     * @tc.name      StringReplaceTest1058
     * @tc.desc     The 'this' of a regular function depends on how it is called.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1058';
      console.log(TAG + 'start');
      let result: string = stringTest. testThisRegularFunctions()
      expect(result).assertEqual("undefinedhello");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1059
     * @tc.name      StringReplaceTest1059
     * @tc.desc     Explicitly binding 'this' using bind
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1059';
      console.log(TAG + 'start');
      let result: string = stringTest. testBindingUsingBind()
      expect(result).assertEqual("PREFIX-hello world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1060
     * @tc.name      StringReplaceTest1060
     * @tc.desc      Calling/replacing functions using call or apply
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1060';
      console.log(TAG + 'start');
      let result: string = stringTest. testUsingCallApply()
      expect(result).assertEqual("hello-SUFFIX");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1061
     * @tc.name      StringReplaceTest1061
     * @tc.desc     Replacer function throwing an exception will abort the replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1061';
      console.log(TAG + 'start');
      let result: string = stringTest.testFunctionThrowsException()
      expect(result).assertEqual("Replacer error");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1062
     * @tc.name      StringReplaceTest1062
     * @tc.desc      Exceptions in global replacement stop subsequent replacements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1062';
      console.log(TAG + 'start');
      let result: string = stringTest.testGlobalReplacement()
      expect(result).assertEqual("2");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1063
     * @tc.name      StringReplaceTest1063
     * @tc.desc      Throw Exception in Global Replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1063';
      console.log(TAG + 'start');
      const str = "1 apple, 2 oranges, 3 bananas";
      const result = str.replace(/\d+/g, (match) => {
        const num = parseInt(match);
        return num > 1 ? `(${num})` : match;
      });
      expect(result).assertEqual("1 apple, (2) oranges, (3) bananas");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1064
     * @tc.name      StringReplaceTest1064
     * @tc.desc      Using variables from the outer scope in a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1064';
      console.log(TAG + 'start');
      const str = "hello";
      const replacement = "world";
      const result = str.replace(/hello/, () => replacement);
      expect(result).assertEqual("world");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1065
     * @tc.name      StringReplaceTest1065
     * @tc.desc     Modifying outer variables inside a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1065';
      console.log(TAG + 'start');
      let result: string = stringTest.testModifyingExternalState()
      expect(result).assertEqual("abc");
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1066
     * @tc.name      StringReplaceTest1066
     * @tc.desc     Modifying external variables in a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1066';
      console.log(TAG + 'start');
      const res = stringTest.testCaptureNumbersAndRemove();
      expect(res.replacedStr).assertEqual("abc");
      expect(res.capturedNumbers).assertDeepEquals(["1","2","3"]);
      console.log(TAG + "end");
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1067
     * @tc.name      StringReplaceTest1067
     * @tc.desc     Accessing and Modifying the Original String via Closure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1067';
      console.log(TAG + 'start');
      let result: string = stringTest.testTheOriginalString()
      expect(result).assertEqual("modified");
      console.log(TAG + "end");
    });
    //=============Boundary Value and Exception Handling===============
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1068
     * @tc.name       StringReplaceTest1068
     * @tc.desc       Call replace on an empty string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1068';
      console.log(TAG + ' start');
      const str = "";
      const result = str.replace(/a/, "b");
      expect(result).assertEqual("")
      console.log(TAG + ' end');
    });
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1069
     * @tc.name       StringReplaceTest1069
     * @tc.desc      Match empty string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1069';
      console.log(TAG + 'start');
      const str = "aabc";
      const result = str.replace(/a?/, "X");
      expect(result).assertEqual("Xabc")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1070
     * @tc.name       StringReplaceTest1070
     * @tc.desc       The string contains only spaces
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1070';
      console.log(TAG + 'start');
      const str = "   ";
      const result = str.replace(/ /, "-");
      expect(result).assertEqual("-  ")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1071
     * @tc.name       StringReplaceTest1071
     * @tc.desc       The string consists of only special characters.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1071';
      console.log(TAG + 'start');
      const str = "!@#$%&";
      const result = str.replace(/@/, "AT");
      expect(result).assertEqual("!AT#$%&")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1072
     * @tc.name       StringReplaceTest1072
     * @tc.desc       If the pattern parameter is null, it will be converted to the string "null"
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1072';
      console.log(TAG + 'start');
      const str = "null value";
      const result = str.replace('null', "undefined");
      expect(result).assertEqual("undefined value")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1073
     * @tc.name       StringReplaceTest1073
     * @tc.desc       If the pattern parameter is undefined, it will be converted to the string "undefined".
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1073';
      console.log(TAG + 'start');
      let result: string = stringTest.testIsUndefinedPattern()
      expect(result).assertEqual("defined variable")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1074
     * @tc.name       StringReplaceTest1074
     * @tc.desc       The replacement parameter is null, which is automatically converted to the string "null"
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1074';
      console.log(TAG + 'start');
      const result: string = stringTest.testReplaceWithNullValue();
      expect(result).assertEqual("null");
      console.log(TAG + "end");
    });
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1075
     * @tc.name       StringReplaceTest1075
     * @tc.desc       If the replacement parameter is undefined, it will be converted to the string "undefined".
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1075';
      console.log(TAG + 'start');
      let result: string = stringTest.testIsReplacementUndefined()
      expect(result).assertEqual("undefined")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1076
     * @tc.name       StringReplaceTest1076
     * @tc.desc       Numbers are converted to strings
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1076';
      console.log(TAG + 'start');
      let result: string = stringTest.testIsNumberPattern()
      expect(result).assertEqual("456 is a number")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1077
     * @tc.name       StringReplaceTest1077
     * @tc.desc       Boolean values are converted to strings.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1077';
      console.log(TAG + 'start');
      let result: string = stringTest.testIsBooleanPattern()
      expect(result).assertEqual("yes or false")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1078
     * @tc.name       StringReplaceTest1078
     * @tc.desc       Objects are converted to strings.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1078';
      console.log(TAG + 'start');
      let result: string = stringTest.testIsObjectPattern()
      expect(result).assertEqual("object")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1079
     * @tc.name       StringReplaceTest1079
     * @tc.desc       Arrays are converted to strings.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1079';
      console.log(TAG + 'start');
      let result: string = stringTest.testIsArrayPattern()
      expect(result).assertEqual("array")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1080
     * @tc.name       StringReplaceTest1080
     * @tc.desc       The object implements the Symbol.toPrimitive method.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1080';
      console.log(TAG + 'start');
      let result: string = stringTest.testSymbolToPrimitive()
      expect(result).assertEqual("hi world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1081
     * @tc.name       StringReplaceTest1081
     * @tc.desc       Conversion order of the pattern object
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1081';
      console.log(TAG + 'start');
      let result: string = stringTest.testValueToStringOrder()
      expect(result).assertEqual("test replaced")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1082
     * @tc.name       StringReplaceTest1082
     * @tc.desc      Handle very long strings
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1082';
      console.log(TAG + 'start');
      let result: number = stringTest.testLongString()
      expect(result).assertEqual(10000)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1083
     * @tc.name       StringReplaceTest1083
     * @tc.desc      Replace a large number of matches at once
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1083';
      console.log(TAG + 'start');
      const str = "x".repeat(1000);
      const result = str.replace(/x/g, "y");
      expect(result).assertEqual("y".repeat(1000))
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1084
     * @tc.name       StringReplaceTest1084
     * @tc.desc       Replace with a very long string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1084';
      console.log(TAG + 'start');
      let result: number = stringTest.testLongReplacementString()
      expect(result).assertEqual(10000)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1085
     * @tc.name       StringReplaceTest1085
     * @tc.desc      Replace strings containing Unicode characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1085';
      console.log(TAG + 'start');
      const str = "hello 你好";
      const result = str.replace(/你好/, "world");
      expect(result).assertEqual("hello world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1086
     * @tc.name       StringReplaceTest1086
     * @tc.desc      Replace strings containing emojis
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1086';
      console.log(TAG + 'start');
      const str = "hello  world";
      const result = str.replace(/\s+/g, " ");
      expect(result).assertEqual("hello world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1087
     * @tc.name       StringReplaceTest1087
     * @tc.desc      Replace strings containing escape characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1087';
      console.log(TAG + 'start');
      const str = "line1\nline2\ttab";
      const result = str.replace(/\n/, " ");
      expect(result).assertEqual("line1 line2\ttab")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1088
     * @tc.name       StringReplaceTest1088
     * @tc.desc      Replace surrogate pairs as complete characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1088';
      console.log(TAG + 'start');
      const str = "hello　world";
      const result = str.replace(/\u3000/g, " X ");
      expect(result).assertEqual("hello X world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1089
     * @tc.name       StringReplaceTest1089
     * @tc.desc      Incorrect splitting of surrogate pairs
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1089';
      console.log(TAG + 'start');
      const str = "hello \uD834\uDF06 world";
      const result = str.replace(/\uD834/, "X");
      expect(result).assertEqual("hello X\uDF06 world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1090
     * @tc.name       StringReplaceTest1090
     * @tc.desc      Replace after using normalize()
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1090';
      console.log(TAG + 'start');
      const str = "café";
      const normalized = str.normalize("NFC");
      const result = normalized.replace(/é/, "e");
      expect(result).assertEqual("cafe")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1091
     * @tc.name       StringReplaceTest1091
     * @tc.desc      Replace zero-width characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1091';
      console.log(TAG + 'start');
      const str = "hello\u200Bworld";
      const result = str.replace(/\u200B/, " ");
      expect(result).assertEqual("hello world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1092
     * @tc.name       StringReplaceTest1092
     * @tc.desc      Replace BOM characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1092';
      console.log(TAG + 'start');
      const str = "\uFEFFhello world";
      const result = str.replace(/\uFEFF/, "");
      expect(result).assertEqual("hello world")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1093
     * @tc.name       StringReplaceTest1093
     * @tc.desc      Global regular expressions maintain lastIndex
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1093';
      console.log(TAG + 'start');
      let result: number = stringTest.testLastIndexOfRegex()
      expect(result).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1094
     * @tc.name       StringReplaceTest1094
     * @tc.desc      Manually setting lastIndex affects replacement
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1094';
      console.log(TAG + 'start');
      const str = "hello hello hello";
      const regex = /hello/g;
      regex.lastIndex = 6;
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi hi hi")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1095
     * @tc.name       StringReplaceTest1095
     * @tc.desc      lastIndex of regular expressions with the y flag
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1095';
      console.log(TAG + 'start');
      let testData = stringTest.testLastIndexStickyMode()
      expect(testData.result).assertEqual("hello world hello")
      expect(testData.lastIndex).assertEqual(0)
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1096
     * @tc.name       StringReplaceTest1096
     * @tc.desc      Freeze regular expressions using Object.freeze
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1096';
      console.log(TAG + 'start');
      let result: string = stringTest.testFrozenRegex()
      expect(result).assertEqual("hello javascript")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1097
     * @tc.name       StringReplaceTest1097
     * @tc.desc      Reuse the same regular expression object multiple times
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1097';
      console.log(TAG + 'start');
      const regex = /\d+/g;
      const str1 = "abc123def";
      const str2 = "xyz456uvw";
      const result1 = str1.replace(regex, "NUM");
      const result2 = str2.replace(regex, "NUM");
      expect(result1).assertEqual("abcNUMdef")
      expect(result2).assertEqual("xyzNUMuvw")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1098
     * @tc.name       StringReplaceTest1098
     * @tc.desc      Call replace in strict mode
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1098';
      console.log(TAG + 'start');
      "use strict";
      const str = "hello world";
      const result = str.replace(/world/, "javascript");
      expect(result).assertEqual("hello javascript")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1099
     * @tc.name       StringReplaceTest1099
     * @tc.desc       Behavior in non-strict mode
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1099';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str.replace(/world/, "javascript");
      expect(result).assertEqual("hello javascript")
      console.log(TAG + 'end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1100
     * @tc.name       StringReplaceTest1100
     * @tc.desc       Regular expression syntax error
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void=> {
      const TAG = 'StringReplaceTest1100';
      console.log(TAG + 'start');
      let result: string = stringTest.testInvalidRegex();
      expect(result).assertEqual("SyntaxError");
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1101
     * @tc.name       StringReplaceTest1101
     * @tc.desc       Invalid regular expression flag
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1101';
      console.log(TAG + 'start');
      let errorType = stringTest.testInvalidFlagCombo();
      expect(errorType).assertEqual("SyntaxError");
      console.log(TAG + ' end');
    })
    /**
     * @tc.number     BUILTINS_STRING_REPLACE_TEST1102
     * @tc.name       StringReplaceTest1102
     * @tc.desc       The pattern is a circularly referenced object
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it("StringReplaceTest1102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1102';
      console.log(TAG + 'start');
      let errorType = stringTest.testCircularRefObject();
      expect(errorType).assertEqual("TypeError");
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1103
     * @tc.name      StringReplaceTest1103
     * @tc.desc       replace only replaces the first occurrence, replaceAll replaces all occurrences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1103';
      console.log(TAG + 'start');

      const str = "aaa";
      const result1 = str.replace("a", "b");
      const result2 = str.replaceAll("a", "b");
      expect(result1).assertEqual("baa");
      expect(result2).assertEqual("bbb");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1104
     * @tc.name      StringReplaceTest1104
     * @tc.desc       replaceAll requires the regular expression to have the 'g' flag.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1104';
      console.log(TAG + 'start');

      const str = "aaa";
      const result1 = str.replace(/a/, "b");
      const result2 = str.replaceAll(/a/g, "b");
      expect(result1).assertEqual("baa");
      expect(result2).assertEqual("bbb");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1105
     * @tc.name      StringReplaceTest1105
     * @tc.desc       Replace after finding matches using match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1105';
      console.log(TAG + 'start');
      let result = stringTest.testReplaceEmptyCharacters();
      expect(result).assertEqual("hi world");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1106
     * @tc.name      StringReplaceTest1106
     * @tc.desc       Obtain matching substrings via match() and implement dynamic string replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1106';
      console.log(TAG + 'start');

      const str = "price: $100, $200";
      const matches = str.match(/\$\d+/g);
      const result = str.replace(/\$\d+/g, (match) => {
        const num = parseInt(match.slice(1));
        return `$${num * 2}`;
      });
      expect(result).assertEqual("price: $200, $400");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1107
     * @tc.name      StringReplaceTest1107
     * @tc.desc       Replace the separator characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1107';
      console.log(TAG + 'start');
      let result = stringTest.testReplaceAndSplit();
      expect(result).assertDeepEquals(["a", "b", "c"]);

      console.log(TAG + " end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1108
     * @tc.name      StringReplaceTest1108
     * @tc.desc       Replace first, then split.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1108';
      console.log(TAG + 'start');
      const str = "a1b2c3";
      const replaced = str.replace(/\d/g, "-");
      const parts = replaced.split("-");
      expect(parts).assertDeepEquals(["a", "b", "c", ""]);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1109
     * @tc.name      StringReplaceTest1109
     * @tc.desc       Dynamically construct regular expressions for replacement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1109';
      console.log(TAG + 'start');
      const str = "hello world";
      const pattern = "hello";
      const regex = new RegExp(pattern, "g");
      const result = str.replace(regex, "hi");
      expect(result).assertEqual("hi world");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1110
     * @tc.name      StringReplaceTest1110
     * @tc.desc      First, use the test method to verify if there is a match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1110';
      console.log(TAG + 'start');
      const str = "hello world";
      const regex = /hello/;
      if (regex.test(str)) {
        const result = str.replace(regex, "hi");
        expect(result).assertEqual("hi world");
      }
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1111
     * @tc.name      StringReplaceTest1111
     * @tc.desc      Replace after obtaining detailed match information using exec
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1111';
      console.log(TAG + 'start');
      const str = "hello world";
      const regex = /(\w+) (\w+)/;
      const match = regex.exec(str);

      if (match) {
        const result = str.replace(regex, `${match[2]} ${match[1]}`);
        expect(result).assertEqual("world hello");
      }
      console.log(TAG + "end");
    });

    /**
     * @tc.number    BUILTINS_STRING_REPLACE_TEST1112
     * @tc.name      StringReplaceTest1112
     * @tc.desc      Chain multiple replace methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringReplaceTest1112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringReplaceTest1112';
      console.log(TAG + 'start');
      const str = "hello world";
      const result = str
        .replace(/hello/, "hi")
        .replace(/world/, "javascript");
      expect(result).assertEqual("hi javascript");
      console.log(TAG + "end");
    });
  });
}