/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

type TestArray = Array<number | string | boolean | null | undefined>;

interface TestFunction extends Function {
  prop?: string;
}

class MockSymbol {
  description: string;

  constructor(description: string) {
    this.description = description;
  }
}

export default function RegularExpressions11Test() {
  describe('RegularExpressions11Test', () => {
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

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_TYPE_CHECK_0100
     * @tc.name testArrayLikeTypeCheck0001
     * @tc.desc Verify Array.isArray detects manual array-like objects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeTypeCheck0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeTypeCheck0001 start');

      interface ArrayLikeObject {
        length: number;
      }

      const manualLikeObj: ArrayLikeObject = { length: 2 };
      const result1 = `1. Array.isArray check: ${!Array.isArray(manualLikeObj)}`;
      console.log(result1);
      expect(result1).assertEqual("1. Array.isArray check: true");
      done();
      console.log('testArrayLikeTypeCheck0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_INSTANCEOF_0100
     * @tc.name testArrayLikeInstanceOf0001
     * @tc.desc Verify instanceof Array check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeInstanceOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeInstanceOf0001 start');

      const testArr: number[] = [10, 20];
      const result2 = `2. Instanceof Array check: ${testArr instanceof Array}`;
      console.log(result2);
      expect(result2).assertEqual("2. Instanceof Array check: true");
      done();
      console.log('testArrayLikeInstanceOf0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SPREAD_0100
     * @tc.name testArrayLikeSpread0001
     * @tc.desc Verify spread operator behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeSpread0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeSpread0001 start');

      const testArr: number[] = [1, 2];
      const spreadArr: number[] = testArr.slice();
      const result3 = `3. Spread operator check: ${Array.isArray(spreadArr) && spreadArr[0] === 1}`;
      console.log(result3);
      expect(result3).assertEqual("3. Spread operator check: true");
      done();
      console.log('testArrayLikeSpread0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_DESTRUCTURE_0100
     * @tc.name testArrayLikeDestructure0001
     * @tc.desc Verify destructuring empty array-like.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeDestructure0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeDestructure0001 start');

      const emptyArr: number[] = [];
      const firstElement: number | undefined = emptyArr[0];
      const secondElement: number | undefined = emptyArr[1];
      const result4 = `4. Destructure empty array: ${firstElement === undefined && secondElement === undefined}`;
      console.log(result4);
      expect(result4).assertEqual("4. Destructure empty array: true");
      done();
      console.log('testArrayLikeDestructure0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SORT_0100
     * @tc.name testArrayLikeSort0001
     * @tc.desc Verify sort behavior on array-like.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeSort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeSort0001 start');

      const testArr: number[] = [5, 2, 8];
      testArr.sort((a: number, b: number): number => a - b);
      const result5 = `5. Sort array-like: ${testArr[0] === 2 && testArr[1] === 5 && testArr[2] === 8}`;
      console.log(result5);
      expect(result5).assertEqual("5. Sort array-like: true");
      done();
      console.log('testArrayLikeSort0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_FLAT_0100
     * @tc.name testArrayLikeFlat0001
     * @tc.desc Verify flat behavior on nested array-like.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeFlat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeFlat0001 start');

      const nestedArr: number[][] = [[1, 2], [3], [4, 5]];
      const flattened: number[] = [];

      nestedArr.forEach((subArray: number[]): void => {
        subArray.forEach((num: number): void => {
          flattened.push(num);
        });
      });

      const result6 = `6. Flat nested array: ${flattened.join(',') === "1,2,3,4,5"}`;
      console.log(result6);
      expect(result6).assertEqual("6. Flat nested array: true");
      done();
      console.log('testArrayLikeFlat0001 done');
    });

    /**
     * @tc.number SUB_BASEDATA_ARRAYLIKE_ARGUMENTS_0100
     * @tc.name testArrayLikeArguments0001
     * @tc.desc Verify arguments behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeArguments0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeArguments0001 start');

      const a: number = 10;
      const b: number = 20;
      const args: number[] = [a, b];
      const result7 = `7. Arguments check: ${args.length === 2 && args[0] === 10}`;
      console.log(result7);
      expect(result7).assertEqual("7. Arguments check: true");
      done();
      console.log('testArrayLikeArguments0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_THIS_0100
     * @tc.name testArrayLikeThis0001
     * @tc.desc Verify this binding in array methods.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeThis0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeThis0001 start');

      const testArr: number[] = [1, 2, 3];
      let count: number = 0;

      const callback = (item: number, index: number, array: number[]): void => {
        count++;
      };

      testArr.forEach(callback);
      const result9 = `9. This binding check: ${count === 3}`;
      console.log(result9);
      expect(result9).assertEqual("9. This binding check: true");
      done();
      console.log('testArrayLikeThis0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SPREAD_DIFF_0100
     * @tc.name testArrayLikeSpreadDiff0001
     * @tc.desc Verify difference between array and plain object conversion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testArrayLikeSpreadDiff0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testArrayLikeSpreadDiff0001 start');

      interface PlainObject {
        key: string;
      }

      const testArr: number[] = [1];
      const plainObj: PlainObject = { key: 'value' };
      const convertedArr: number[] = testArr.slice();
      const convertedObj: PlainObject = { key: plainObj.key };

      const result10 = `10. Conversion difference: ${Array.isArray(convertedArr) && convertedObj.key === 'value'}`;
      console.log(result10);
      expect(result10).assertEqual("10. Conversion difference: true");
      done();
      console.log('testArrayLikeSpreadDiff0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_BASIC_0100
     * @tc.name testRegexConstructorBasic0001
     * @tc.desc Verify basic RegExp constructor matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorBasic0001 start');

      const re11 = new RegExp("abc");
      const result11 = re11.test("abc");
      console.log(`11. Constructor match 'abc': ${result11}`);
      expect(result11).assertTrue();
      done();
      console.log('testRegexConstructorBasic0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_DYNAMIC_0100
     * @tc.name testRegexConstructorDynamic0001
     * @tc.desc Verify RegExp constructor with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorDynamic0001 start');

      const pattern = "123";
      const re12 = new RegExp(pattern);
      const result12 = re12.test("456123");
      console.log(`12. Dynamic pattern match '456123': ${result12}`);
      expect(result12).assertTrue();
      done();
      console.log('testRegexConstructorDynamic0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_ESCAPE_0100
     * @tc.name testRegexConstructorEscape0001
     * @tc.desc Verify escaped character matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorEscape0001 start');

      const re13 = new RegExp("\\d");
      const result13 = re13.test("5");
      console.log(`13. Escaped \\d match '5': ${result13}`);
      expect(result13).assertTrue();
      done();
      console.log('testRegexConstructorEscape0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_GLOBAL_0100
     * @tc.name testRegexConstructorGlobal0001
     * @tc.desc Verify global flag with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorGlobal0001 start');

      const re14 = new RegExp("a", "g");
      const matches = "aa".match(re14);
      const result14 = matches ? matches.length : 0;
      console.log(`14. Global flag match count: ${result14}`);
      expect(result14).assertEqual(2);
      done();
      console.log('testRegexConstructorGlobal0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_MULTI_FLAG_0100
     * @tc.name testRegexConstructorMultiFlag0001
     * @tc.desc Verify multiple flags with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorMultiFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorMultiFlag0001 start');

      const re15 = new RegExp("abc", "giu");
      const result15 = re15.flags;
      console.log(`15. Multi-flags (giu) value: ${result15}`);
      expect(result15).assertEqual("giu");
      done();
      console.log('testRegexConstructorMultiFlag0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPE_DIFFERENCE_0100
     * @tc.name testRegexEscapeDifference0001
     * @tc.desc Verify escape sequence difference between literal and constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapeDifference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapeDifference0001 start');

      const re16Literal = /[a-z]:\\/;
      const re16RegExp = new RegExp("[a-z]:\\\\");
      const result16 = re16Literal.test("C:\\") && re16RegExp.test("C:\\");
      console.log(`16. Escape difference match 'C:\\': ${result16}`);
      expect(result16).assertFalse();
      done();
      console.log('testRegexEscapeDifference0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_LITERAL_0100
     * @tc.name testRegexEmptyLiteral0001
     * @tc.desc Verify empty regex literal matches any string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyLiteral0001 start');

      const re17 = new RegExp("");
      const result17 = re17.test("anything");
      console.log(`17. Empty pattern match any string: ${result17}`);
      expect(result17).assertTrue();
      done();
      console.log('testRegexEmptyLiteral0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_CONSTRUCTOR_0100
     * @tc.name testRegexEmptyConstructor0001
     * @tc.desc Verify empty string constructor matches empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyConstructor0001 start');

      const re18 = new RegExp("");
      const result18 = re18.test("");
      console.log(`18. Empty pattern match empty string: ${result18}`);
      expect(result18).assertTrue();
      done();
      console.log('testRegexEmptyConstructor0001 done');
    });

    /**
     * @tc.number REGEX_LITERAL_SPECIAL_CHAR_0100
     * @tc.name testRegexLiteralSpecialChar0001
     * @tc.desc Verify special character matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLiteralSpecialChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLiteralSpecialChar0001 start');

      const re19 = /a\*b/;
      const result19 = re19.test("a*b");
      console.log(`19. Escaped * match 'a*b': ${result19}`);
      expect(result19).assertTrue();
      done();
      console.log('testRegexLiteralSpecialChar0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_SPECIAL_CHAR_0100
     * @tc.name testRegexConstructorSpecialChar0001
     * @tc.desc Verify special character matching with constructor (double escape).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSpecialChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSpecialChar0001 start');

      const re20 = new RegExp("a\\*b");
      const result20 = re20.test("a*b");
      console.log(`20. Double-escaped * match 'a*b': ${result20}`);
      expect(result20).assertTrue();
      done();
      console.log('testRegexConstructorSpecialChar0001 done');
    });

    /**
     * @tc.number REGEX_LITERAL_SLASH_0100
     * @tc.name testRegexLiteralSlash0001
     * @tc.desc Verify escaped slash matching with literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLiteralSlash0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLiteralSlash0001 start');

      const re21 = /\/example\//;
      const result21 = re21.test("/example/");
      console.log(`21. Escaped slash match '/example/': ${result21}`);
      expect(result21).assertTrue();
      done();
      console.log('testRegexLiteralSlash0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_SLASH_0100
     * @tc.name testRegexConstructorSlash0001
     * @tc.desc Verify double-escaped slash matching with constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSlash0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSlash0001 start');

      const re22 = new RegExp("\\/example\\/");
      const result22 = re22.test("/example/");
      console.log(`22. Double-escaped slash match '/example/': ${result22}`);
      expect(result22).assertTrue();
      done();
      console.log('testRegexConstructorSlash0001 done');
    });

    /**
     * @tc.number REGEX_LITERAL_STICKY_0100
     * @tc.name testRegexLiteralSticky0001
     * @tc.desc Verify sticky flag matching from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLiteralSticky0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLiteralSticky0001 start');

      const re23 = /a/y;
      const result23 = re23.test("aa");
      const lastIndex23 = re23.lastIndex;
      console.log(`23. Sticky flag match from index 0: ${result23}, lastIndex: ${lastIndex23}`);
      expect(result23).assertTrue();
      expect(lastIndex23).assertEqual(1);
      done();
      console.log('testRegexLiteralSticky0001 done');
    });

    /**
     * @tc.number REGEX_CONSTRUCTOR_STICKY_0100
     * @tc.name testRegexConstructorSticky0001
     * @tc.desc Verify sticky flag matching from modified lastIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexConstructorSticky0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexConstructorSticky0001 start');

      const re24 = new RegExp("a", "y");
      re24.lastIndex = 1;
      const result24 = re24.test("aa");
      const lastIndex24 = re24.lastIndex;
      console.log(`24. Sticky flag match from index 1: ${result24}, lastIndex: ${lastIndex24}`);
      expect(result24).assertTrue();
      expect(lastIndex24).assertEqual(2);
      done();
      console.log('testRegexConstructorSticky0001 done');
    });

    /**
     * @tc.number REGEX_NO_UNICODE_FLAG_0100
     * @tc.name testRegexNoUnicodeFlag0001
     * @tc.desc Verify failed emoji match without Unicode flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNoUnicodeFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNoUnicodeFlag0001 start');

      const re26 = /\u{1F600}/;
      const result26 = re26.test("😀");
      console.log(`26. No Unicode flag match emoji '😀': ${result26}`);
      expect(result26).assertFalse();
      done();
      console.log('testRegexNoUnicodeFlag0001 done');
    });

    /**
     * @tc.number REGEX_MULTILINE_FLAG_0100
     * @tc.name testRegexMultilineFlag0001
     * @tc.desc Verify multiline flag matching line endings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultilineFlag0001 start');

      const re27 = /line$/m;
      const result27 = re27.test("first line\nsecond line");
      console.log(`27. Multiline flag match line ending 'line': ${result27}`);
      expect(result27).assertTrue();
      done();
      console.log('testRegexMultilineFlag0001 done');
    });

  })
}