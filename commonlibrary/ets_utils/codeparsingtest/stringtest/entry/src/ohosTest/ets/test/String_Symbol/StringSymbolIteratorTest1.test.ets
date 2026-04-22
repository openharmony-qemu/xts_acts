import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_symbol.iterator_test1'

interface CustomIteratorResult {
  value?: string;
  done: boolean;
}

interface CustomStringIterator {
  next(): CustomIteratorResult;
}

export default function StringSymbolIteratorTest1() {
  describe('StringSymbolIteratorTest1', () => {
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

    //==========================Basic Function Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0100
     * @tc.name      StringSymbol.iteratorTest1001
     * @tc.desc      Clean User Input Username
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1001';
      console.log(TAG + 'start');
      const str = "hello";
      let result : CustomStringIterator = stringTest.testGetStringIterator(str);
      expect(typeof result).assertEqual("object");
      expect(typeof result.next).assertEqual("function");
      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0200
     * @tc.name      StringSymbol.iteratorTest1002
     * @tc.desc      Verify Symbol.iterator on prototype vs own property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1002';
      console.log(TAG + 'start');

      const result: boolean[] = stringTest.testOwnProperty();
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(false);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0300
     * @tc.name      StringSymbol.iteratorTest1003
     * @tc.desc      Verify iterator protocol compliance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1003';
      console.log(TAG + 'start');

      const str = "abc";
      let result: CustomStringIterator = stringTest.testGetStringIterator(str);
      expect(typeof result.next === "function").assertEqual(true);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0400
     * @tc.name      StringSymbol.iteratorTest1004
     * @tc.desc      Iterate string literal and verify first value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1004';
      console.log(TAG + 'start');

      const str = "hello";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res: CustomIteratorResult = iterator.next();

      expect(res.value).assertEqual("h");
      expect(res.done).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0500
     * @tc.name      StringSymbol.iteratorTest1005
     * @tc.desc      Iterate String object created by constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1005';
      console.log(TAG + 'start');

      const strObj = new String("world");
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(strObj);
      let res: CustomIteratorResult = iterator.next();
      expect(res.value).assertEqual("w");
      expect(res.done).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0600
     * @tc.name      StringSymbol.iteratorTest1006
     * @tc.desc      Iterate string expression result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1006';
      console.log(TAG + 'start');

      const iter = "hello" + "world";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(iter);
      let res: CustomIteratorResult = iterator.next();
      expect(res.value).assertEqual("h");

      console.log(TAG + "end");
    });

    //==========================Iterator Protocol Test==============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0700
     * @tc.name      StringSymbol.iteratorTest1007
     * @tc.desc      Verify next() returns correct iterator result object step by step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1007';
      console.log(TAG + 'start');

      const str = "abc";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res1: CustomIteratorResult = iterator.next();
      expect(res1.value).assertEqual("a");
      expect(res1.done).assertFalse();
      let res2: CustomIteratorResult = iterator.next();
      expect(res2.value).assertEqual("b");
      expect(res2.done).assertFalse();
      let res3: CustomIteratorResult = iterator.next();
      expect(res3.value).assertEqual("c");
      expect(res3.done).assertFalse();
      let res4: CustomIteratorResult = iterator.next();
      expect(res4.value).assertEqual(undefined);
      expect(res4.done).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0800
     * @tc.name      StringSymbol.iteratorTest1008
     * @tc.desc      Verify continuous calling of next() collects all characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1008';
      console.log(TAG + 'start');

      const str = "test";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let result: string[] = [];
      let res: CustomIteratorResult = iterator.next();
      while (!res.done) {
        result.push(res.value as string);
        res = iterator.next();
      }
      expect(result[0]).assertEqual("t");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("s");
      expect(result[3]).assertEqual("t");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_0900
     * @tc.name      StringSymbol.iteratorTest1009
     * @tc.desc      Verify behavior after iteration is complete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1009';
      console.log(TAG + 'start');

      const str = "a";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res1: CustomIteratorResult = iterator.next();
      expect(res1.value).assertEqual("a");
      expect(res1.done).assertFalse();
      let res2: CustomIteratorResult = iterator.next();
      expect(res2.value).assertEqual(undefined);
      expect(res2.done).assertTrue();
      let res3: CustomIteratorResult = iterator.next();
      expect(res3.value).assertEqual(undefined);
      expect(res3.done).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1000
     * @tc.name      StringSymbol.iteratorTest1010
     * @tc.desc      Verify iterator object is iterable and returns itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1010';
      console.log(TAG + 'start');

      const str = "abc";
      let iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      let iter2: CustomStringIterator = stringTest.testGetIteratorFromIterator(iter1);
      expect(iter1 === iter2).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1100
     * @tc.name      StringSymbol.iteratorTest1011
     * @tc.desc      Verify multiple calls return independent iterators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1011';
      console.log(TAG + 'start');

      const str = "ab";
      let iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      let iter2: CustomStringIterator = stringTest.testGetStringIterator(str);
      let res1: CustomIteratorResult = iter1.next();
      let res2: CustomIteratorResult = iter2.next();
      expect(res1.value).assertEqual("a");
      expect(res2.value).assertEqual("a");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1200
     * @tc.name      StringSymbol.iteratorTest1012
     * @tc.desc      Verify iterator maintains current iteration position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1012';
      console.log(TAG + 'start');

      const str = "abc";
      let iterator: CustomStringIterator = stringTest.testGetStringIterator(str);
      iterator.next();
      iterator.next();
      let res: CustomIteratorResult = iterator.next();
      expect(res.value).assertEqual("c");

      console.log(TAG + "end");
    });

    //====================Unicode Code Point Processing Test===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1300
     * @tc.name      StringSymbol.iteratorTest1013
     * @tc.desc      Verify iteration over basic ASCII characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1013';
      console.log(TAG + 'start');

      const str = "ABC";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars[0]).assertEqual("A");
      expect(chars[1]).assertEqual("B");
      expect(chars[2]).assertEqual("C");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1400
     * @tc.name      StringSymbol.iteratorTest1014
     * @tc.desc      Verify iteration over digit characters using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1014';
      console.log(TAG + 'start');

      const str = "12345";
      const result: string[] = stringTest.testStringLoopToArray(str);
      expect(result[0]).assertEqual("1");
      expect(result[1]).assertEqual("2");
      expect(result[2]).assertEqual("3");
      expect(result[3]).assertEqual("4");
      expect(result[4]).assertEqual("5");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1500
     * @tc.name      StringSymbol.iteratorTest1015
     * @tc.desc      Verify iteration over special ASCII characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1015';
      console.log(TAG + 'start');

      const str = "!@#$%";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars[0]).assertEqual("!");
      expect(chars[1]).assertEqual("@");
      expect(chars[2]).assertEqual("#");
      expect(chars[3]).assertEqual("$");
      expect(chars[4]).assertEqual("%");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1600
     * @tc.name      StringSymbol.iteratorTest1016
     * @tc.desc      Verify iteration over Chinese characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1016';
      console.log(TAG + 'start');

      const str = "你好世界";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars[0]).assertEqual("你");
      expect(chars[1]).assertEqual("好");
      expect(chars[2]).assertEqual("世");
      expect(chars[3]).assertEqual("界");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1700
     * @tc.name      StringSymbol.iteratorTest1017
     * @tc.desc      Verify iteration over Japanese Kana characters using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1017';
      console.log(TAG + 'start');

      const str = "あいうえお";
      const result: string[] = stringTest.testStringLoopToArray(str);

      expect(result[0]).assertEqual("あ");
      expect(result[1]).assertEqual("い");
      expect(result[2]).assertEqual("う");
      expect(result[3]).assertEqual("え");
      expect(result[4]).assertEqual("お");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1800
     * @tc.name      StringSymbol.iteratorTest1018
     * @tc.desc      Verify iteration over Korean Hangul characters using spread syntax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1018';
      console.log(TAG + 'start');

      const str = "한글";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars[0]).assertEqual("한");
      expect(chars[1]).assertEqual("글");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_1900
     * @tc.name      StringSymbol.iteratorTest1019
     * @tc.desc      Verify iteration over mixed surrogate pairs and basic characters using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1019';
      console.log(TAG + 'start');

      const str = "A𝟘B𝟙C";
      const result: string[] = stringTest.testStringLoopToArray(str);

      expect(result[0]).assertEqual("A");
      expect(result[1]).assertEqual("𝟘");
      expect(result[2]).assertEqual("B");
      expect(result[3]).assertEqual("𝟙");
      expect(result[4]).assertEqual("C");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2000
     * @tc.name      StringSymbol.iteratorTest1020
     * @tc.desc      Verify iteration over character with combining diacritical mark
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1020';
      console.log(TAG + 'start');

      const str = "é";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(1);
      expect(chars[0]).assertEqual("é");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2100
     * @tc.name      StringSymbol.iteratorTest1021
     * @tc.desc      Verify iteration over ZWJ sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1021';
      console.log(TAG + 'start');

      const str = "‍👩‍‍👦";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length > 1).assertTrue();

      console.log(TAG + "end");
    });

    //==========================Empty String and Boundary Value Test=============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2200
     * @tc.name      StringSymbol.iteratorTest1022
     * @tc.desc      Verify iterator behavior on empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1022';
      console.log(TAG + 'start');

      const str = "";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);
      const res = iter.next();

      expect(res.value).assertEqual(undefined);
      expect(res.done).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2300
     * @tc.name      StringSymbol.iteratorTest1023
     * @tc.desc      Verify spread syntax on empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1023';
      console.log(TAG + 'start');

      const str = "";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(0);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2400
     * @tc.name      StringSymbol.iteratorTest1024
     * @tc.desc      Verify for...of loop on empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1024';
      console.log(TAG + 'start');

      const str = "";
      const count: number = stringTest.testStringForOfCount(str);

      expect(count).assertEqual(0);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2500
     * @tc.name      StringSymbol.iteratorTest1025
     * @tc.desc      Verify spread syntax on single ASCII character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1025';
      console.log(TAG + 'start');

      const str = "A";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(1);
      expect(chars[0]).assertEqual("A");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2600
     * @tc.name      StringSymbol.iteratorTest1026
     * @tc.desc      Verify iterator behavior on single Unicode character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1026';
      console.log(TAG + 'start');

      const str = "你";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);

      const first = iter.next();
      expect(first.value).assertEqual("你");
      expect(first.done).assertFalse();

      const second = iter.next();
      expect(second.value).assertEqual(undefined);
      expect(second.done).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2700
     * @tc.name      StringSymbol.iteratorTest1027
     * @tc.desc      Verify iteration over whitespace characters (space, tab, newline, carriage return)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1027';
      console.log(TAG + 'start');

      const str = " \t\n\r";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars[0]).assertEqual(" ");
      expect(chars[1]).assertEqual("\t");
      expect(chars[2]).assertEqual("\n");
      expect(chars[3]).assertEqual("\r");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2800
     * @tc.name      StringSymbol.iteratorTest1028
     * @tc.desc      Verify iteration over invisible zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1028';
      console.log(TAG + 'start');

      const str = "\u200B\u200C\u200D";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(3);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_2900
     * @tc.name      StringSymbol.iteratorTest1029
     * @tc.desc      Verify iteration over control characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1029';
      console.log(TAG + 'start');

      const str = "\x00\x01\x02";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(3);
      expect(chars[0] === "\x00").assertEqual(true);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3000
     * @tc.name      StringSymbol.iteratorTest1030
     * @tc.desc      Verify iteration over medium-length string (100 'a's)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1030';
      console.log(TAG + 'start');

      const str = "a".repeat(100);
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(100);
      expect(chars.every(c => c === "a")).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3100
     * @tc.name      StringSymbol.iteratorTest1031
     * @tc.desc      Verify for-of iteration over long string (40000 chars)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1031';
      console.log(TAG + 'start');

      const str = "test".repeat(10000);
      const count: number = stringTest.testStringForOfCount(str);

      expect(count).assertEqual(40000);

      console.log(TAG + "end");
    });

    //=========================Compatibility Test with Iteration Syntax===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3200
     * @tc.name      StringSymbol.iteratorTest1032
     * @tc.desc      Verify basic for-of iteration over string "hello" using existing helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1032';
      console.log(TAG + 'start');

      const str = "hello";
      // 复用已有函数 testStringLoopToArray
      const result: string[] = stringTest.testStringLoopToArray(str);

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("h");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3300
     * @tc.name      StringSymbol.iteratorTest1033
     * @tc.desc      Verify for-of with break on space character (element-by-element assertion)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1033';
      console.log(TAG + 'start');

      const str = "hello world";
      const result: string[] = stringTest.testStringForOfWithBreak(str);

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("h");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3400
     * @tc.name      StringSymbol.iteratorTest1034
     * @tc.desc      Verify for-of with continue to skip digit characters (element-by-element assertion)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1034';
      console.log(TAG + 'start');

      const str = "a1b2c3";
      const result: string[] = stringTest.testStringForOfWithContinue(str);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3500
     * @tc.name      StringSymbol.iteratorTest1035
     * @tc.desc      Verify spread syntax to convert string to char array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1035';
      console.log(TAG + 'start');

      const str = "hello";
      const arr: string[] = stringTest.testStringSpreadToArray(str);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual("h");
      expect(arr[1]).assertEqual("e");
      expect(arr[2]).assertEqual("l");
      expect(arr[3]).assertEqual("l");
      expect(arr[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3600
     * @tc.name      StringSymbol.iteratorTest1036
     * @tc.desc      Verify spreading a string as function parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1036';
      console.log(TAG + 'start');

      const str = "abc";
      const result: string[] = stringTest.testStringSpreadToArray(str);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3700
     * @tc.name      StringSymbol.iteratorTest1037
     * @tc.desc      Use spread syntax in array literals
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1037';
      console.log(TAG + 'start');

      const str = "cd";
      const arr: string[] = stringTest.testArrayLiteralSpread(str);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual("a");
      expect(arr[1]).assertEqual("b");
      expect(arr[2]).assertEqual("c");
      expect(arr[3]).assertEqual("d");
      expect(arr[4]).assertEqual("e");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3800
     * @tc.name      StringSymbol.iteratorTest1038
     * @tc.desc      Extract string characters using array destructuring assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1038';
      console.log(TAG + 'start');

      const str = "hello";
      const result: Array<string | string[]> = stringTest.testArrayDestructuringString(str);
      expect(result[0] as string).assertEqual("h");
      expect(result[1] as string).assertEqual("e");
      expect(result[2] as string).assertEqual("l");

      const rest: string[] = result[3] as string[];
      expect(rest.length).assertEqual(2);
      expect(rest[0]).assertEqual("l");
      expect(rest[1]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_3900
     * @tc.name      StringSymbol.iteratorTest1039
     * @tc.desc      Use array destructuring to swap variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1039';
      console.log(TAG + 'start');

      const str = "ab";
      const result: string[] = stringTest.testDestructuringSwapVariables(str);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("b");
      expect(result[1]).assertEqual("a");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4000
     * @tc.name      StringSymbol.iteratorTest1040
     * @tc.desc      Use default values when destructuring
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1040';
      console.log(TAG + 'start');

      const str = "a";
      const result: string[] = stringTest.testDestructuringDefaultValue(str);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("default");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4100
     * @tc.name      StringSymbol.iteratorTest1041
     * @tc.desc      Create a Set from a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1041';
      console.log(TAG + 'start');

      const str = "hello";
      const result: Array<number | boolean> = stringTest.testSetFromString(str);

      expect(result[0] as number).assertEqual(4);
      expect(result[1] as boolean).assertEqual(true);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4200
     * @tc.name      StringSymbol.iteratorTest1042
     * @tc.desc      Create a Map from a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1042';
      console.log(TAG + 'start');

      const str = "ab";
      const result: Array<number | undefined> = stringTest.testMapFromString(str);

      expect(result[0] as number).assertEqual(0);
      expect(result[1] as number).assertEqual(1);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4300
     * @tc.name      StringSymbol.iteratorTest1043
     * @tc.desc      Iterate over strings with Promise.all
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const TAG = 'StringSymbol.iteratorTest1043';
      console.log(TAG + 'start');

      const str = "abc";
      const result: string[] = await stringTest.testPromiseAllUpper(str);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("A");
      expect(result[1]).assertEqual("B");
      expect(result[2]).assertEqual("C");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4400
     * @tc.name      StringSymbol.iteratorTest1044
     * @tc.desc      Use Array.from to convert a string to an array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1044';
      console.log(TAG + 'start');

      const str = "hello";
      const res: Array<string[] | boolean> = stringTest.testFromStr(str);
      const arr = res[0] as string[];
      const isArray = res[1] as boolean;

      expect(isArray).assertTrue();
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual("h");
      expect(arr[1]).assertEqual("e");
      expect(arr[2]).assertEqual("l");
      expect(arr[3]).assertEqual("l");
      expect(arr[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4500
     * @tc.name      StringSymbol.iteratorTest1045
     * @tc.desc      Use Array.from with a mapping function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1045';
      console.log(TAG + 'start');

      const str = "123";
      const nums: number[] = stringTest.testFromMap(str);

      expect(nums.length).assertEqual(3);
      expect(nums[0]).assertEqual(1);
      expect(nums[1]).assertEqual(2);
      expect(nums[2]).assertEqual(3);

      console.log(TAG + "end");
    });

    //===========================Manual Iteration Control Test=============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4600
     * @tc.name      StringSymbol.iteratorTest1046
     * @tc.desc      Verify that next() returns a complete result object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1046';
      console.log(TAG + 'start');

      const str = "a";
      const result: Array<boolean | string> = stringTest.testNextIntegrity(str);
      expect(result[0] as boolean).assertTrue();
      expect(result[1] as boolean).assertTrue();
      expect(result[2] as string).assertEqual("a");
      expect(result[3] as boolean).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4700
     * @tc.name      StringSymbol.iteratorTest1047
     * @tc.desc      Verify that next() ignores passed parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1047';
      console.log(TAG + 'start');

      const str = "ab";
      const result: string[] = stringTest.testNextIgnoreParams(str) as string[];
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4800
     * @tc.name      StringSymbol.iteratorTest1048
     * @tc.desc      Verify that next() consumes only what is requested
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1048';
      console.log(TAG + 'start');

      const str = "abc";
      const result: Array<string | boolean> = stringTest.testNextLazyConsume(str);
      expect(result[0] as string).assertEqual("a");
      expect(result[2] as boolean).assertFalse();
      expect(result[1] as string).assertEqual("b");
      expect(result[3] as boolean).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_4900
     * @tc.name      StringSymbol.iteratorTest1049
     * @tc.desc      Verify whether the iterator has a return() method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1049';
      console.log(TAG + 'start');

      const str = "test";
      const hasReturn: boolean = stringTest.testIterReturn(str);
      expect(hasReturn).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5000
     * @tc.name      StringSymbol.iteratorTest1050
     * @tc.desc      Verify iterator status after it is exhausted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1050';
      console.log(TAG + 'start');

      const str = "ab";
      const result: Array<boolean | undefined> = stringTest.testIterExhausted(str) as Array<boolean | undefined>;

      expect(result[0] as boolean).assertFalse();
      expect(result[1] as boolean).assertFalse();
      expect(result[2] as boolean).assertTrue();
      expect(result[3] as boolean).assertTrue();
      expect(result[4]).assertEqual(undefined);
      expect(result[5]).assertEqual(undefined);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5100
     * @tc.name      StringSymbol.iteratorTest1051
     * @tc.desc      Verify the iterator cannot be reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1051';
      console.log(TAG + 'start');

      const str = "ab";
      const result: string[] = stringTest.testIterNoReset(str) as string[];

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("a");

      console.log(TAG + "end");
    });

    //=====================Surrogate Pair and Grapheme Cluster Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5200
     * @tc.name      StringSymbol.iteratorTest1052
     * @tc.desc      Isolated high surrogate should be iterated as one code unit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1052';
      console.log(TAG + 'start');

      const str = "\uD83D";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(1);
      expect(chars[0]).assertEqual("\uD83D");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5300
     * @tc.name      StringSymbol.iteratorTest1053
     * @tc.desc      Verify combining character sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1053';
      console.log(TAG + 'start');

      const str = "e\u0301";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(2);
      expect(chars[0]).assertEqual("e");
      expect(chars[1]).assertEqual("\u0301");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5400
     * @tc.name      StringSymbol.iteratorTest1054
     * @tc.desc      Multiple combining marks should expand to multiple symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1054';
      console.log(TAG + 'start');

      const str = "a\u0300\u0301\u0302";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(4);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5500
     * @tc.name      StringSymbol.iteratorTest1055
     * @tc.desc      Emoji sequence should be split when iterated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1055';
      console.log(TAG + 'start');

      const str = "👨‍👩‍👧";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length > 1).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5600
     * @tc.name      StringSymbol.iteratorTest1056
     * @tc.desc      Variant selectors should increase the number of iterated symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1056';
      console.log(TAG + 'start');

      const str = "①\uFE0F";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length).assertEqual(2);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5700
     * @tc.name      StringSymbol.iteratorTest1057
     * @tc.desc      Regional indicator symbols should be iterated separately
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1057';
      console.log(TAG + 'start');

      const str = "\uD83C\uDDE6\uD83C\uDDF7";
      const chars: string[] = stringTest.testCodePoints(str);
      expect(chars.length).assertEqual(2);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5800
     * @tc.name      StringSymbol.iteratorTest1058
     * @tc.desc      Tag characters should be split when iterated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1058';
      const str = "\u{1F3F4}\u{E0067}\u{E0062}\u{E0073}\u{E0063}\u{E0074}\u{E007F}";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      expect(chars.length > 1).assertTrue();

      console.log(TAG + "end");
    });

    //======================Iterator State Management Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_5900
     * @tc.name      StringSymbol.iteratorTest1059
     * @tc.desc      Independent iterators should maintain separate state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1059';
      console.log(TAG + 'start');

      const str = "abc";
      const iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      const iter2: CustomStringIterator = stringTest.testGetStringIterator(str);

      const r1 = iter1.next();
      expect(r1.value).assertEqual("a");

      const r2 = iter2.next();
      expect(r2.value).assertEqual("a");

      const r3 = iter1.next();
      expect(r3.value).assertEqual("b");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6000
     * @tc.name      StringSymbol.iteratorTest1060
     * @tc.desc      Interleaving next() calls on two iterators should work correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1060';
      console.log(TAG + 'start');

      const str = "1234";
      const iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      const iter2: CustomStringIterator = stringTest.testGetStringIterator(str);

      expect(iter1.next().value).assertEqual("1");
      expect(iter2.next().value).assertEqual("1");
      expect(iter1.next().value).assertEqual("2");
      expect(iter2.next().value).assertEqual("2");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6100
     * @tc.name      StringSymbol.iteratorTest1061
     * @tc.desc      Iterator references should be shared when assigned
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1061';
      console.log(TAG + 'start');

      const str = "ab";
      const iter1: CustomStringIterator = stringTest.testGetStringIterator(str);
      const iter2: CustomStringIterator = iter1;

      expect(iter1.next().value).assertEqual("a");
      expect(iter2.next().value).assertEqual("b");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6200
     * @tc.name      StringSymbol.iteratorTest1062
     * @tc.desc      Iterator passed as a parameter should advance on each next()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1062';
      console.log(TAG + 'start');

      const str = "abc";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);

      expect(iter.next().value).assertEqual("a");
      expect(iter.next().value).assertEqual("b");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6300
     * @tc.name      StringSymbol.iteratorTest1063
     * @tc.desc      Partial iteration should continue correctly on subsequent next()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1063';
      console.log(TAG + 'start');

      const str = "hello";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);

      iter.next(); // h
      iter.next(); // e

      const r = iter.next(); // next should be l
      expect(r.value).assertEqual("l");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6400
     * @tc.name      StringSymbol.iteratorTest1064
     * @tc.desc      After releasing an iterator reference, a new iterator should work
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1064';
      console.log(TAG + 'start');

      const str = "hello";
      let iter: CustomStringIterator | null = stringTest.testGetStringIterator(str);
      if (iter !== null) {
        iter.next(); // h
      }
      iter = null;

      const iter2: CustomStringIterator = stringTest.testGetStringIterator(str);
      expect(iter2.next().value).assertEqual("h");

      console.log(TAG + "end");
    });

    //========================Exceptional Case Test==============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6500
     * @tc.name      StringSymbol.iteratorTest1065
     * @tc.desc      Invoke String iterator on a non-string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1065';
      console.log(TAG + 'start');

      const isTypeError: boolean = stringTest.testIterCallTypeErrorNonString();
      expect(isTypeError).assertFalse();

      const values: string[] = stringTest.testIterNumber() as string[];
      expect(values[0]).assertEqual("1");
      expect(values[1]).assertEqual("2");
      expect(values[2]).assertEqual("3");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6600
     * @tc.name      StringSymbol.iteratorTest1066
     * @tc.desc      Invoke String iterator on null should throw TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1066';
      console.log(TAG + 'start');

      const isTypeError: boolean = stringTest.testIterCallTypeErrorNull();
      expect(isTypeError).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6700
     * @tc.name      StringSymbol.iteratorTest1067
     * @tc.desc      Invoke String iterator on undefined should throw TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1067';
      console.log(TAG + 'start');

      const isTypeError: boolean = stringTest.testIterCallTypeErrorUndef();
      expect(isTypeError).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6800
     * @tc.name      StringSymbol.iteratorTest1068
     * @tc.desc      next() should return a result object without throwing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1068';
      console.log(TAG + 'start');

      const str = "test";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);
      const result: CustomIteratorResult = iter.next();

      expect(typeof result).assertEqual("object");
      expect(result.value).assertEqual("t");
      expect(result.done).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_6900
     * @tc.name      StringSymbol.iteratorTest1069
     * @tc.desc      Modified iterator next() should be observable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1069';
      console.log(TAG + 'start');

      const str = "ab";
      const res: Array<string | boolean> = stringTest.testModifyNext(str) as Array<string | boolean>;
      expect(res[0] as string).assertEqual("X");
      expect(res[1] as boolean).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7000
     * @tc.name      StringSymbol.iteratorTest1070
     * @tc.desc      Reassigning a string during iteration should not affect next() result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1070';
      console.log(TAG + 'start');

      let str = "hello";
      const iter: CustomStringIterator = stringTest.testGetStringIterator(str);
      str = "world";

      const result: CustomIteratorResult = iter.next();
      expect(result.value).assertEqual("h");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7100
     * @tc.name      StringSymbol.iteratorTest1071
     * @tc.desc      Mutating a String object should not affect iteration content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1071';
      console.log(TAG + 'start');

      const first: string = stringTest.testStringObjMutation();
      expect(first).assertEqual("h");

      console.log(TAG + "end");
    });

    //========================Interaction Test with Other String Methods===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7200
     * @tc.name      StringSymbol.iteratorTest1072
     * @tc.desc      Compare iterator result with charAt outputs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1072';
      console.log(TAG + 'start');

      const str = "hello";
      const iterChars: string[] = stringTest.testStringSpreadToArray(str);
      const charAtChars: string[] = [];
      for (let i = 0; i < str.length; i++) {
        charAtChars.push(str.charAt(i));
      }

      expect(JSON.stringify(iterChars)).assertEqual(JSON.stringify(charAtChars));

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7300
     * @tc.name      StringSymbol.iteratorTest1073
     * @tc.desc      Unicode surrogate pairs differ between charAt and iterating symbols
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1073';
      console.log(TAG + 'start');

      const str = "😀";
      expect(str.charAt(0)).assertEqual("\uD83D");
      expect(str.charAt(1)).assertEqual("\uDE00");

      const chars: string[] = stringTest.testCodePoints(str);
      expect(chars[0]).assertEqual("😀");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7400
     * @tc.name      StringSymbol.iteratorTest1074
     * @tc.desc      charCodeAt returns UTF-16 code units while iteration returns code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1074';
      console.log(TAG + 'start');

      const str = "😀";
      expect(str.charCodeAt(0)).assertEqual(55357);
      expect(str.charCodeAt(1)).assertEqual(56832);

      const chars: string[] = stringTest.testCodePoints(str);
      expect(chars.length).assertEqual(1);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7500
     * @tc.name      StringSymbol.iteratorTest1075
     * @tc.desc      Compare split() result with iterator expansion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1075';
      console.log(TAG + 'start');

      const str = "hello";
      const splitChars: string[] = str.split("");
      const iterChars: string[] = stringTest.testStringSpreadToArray(str);

      expect(splitChars.length).assertEqual(iterChars.length);
      for (let i = 0; i < splitChars.length; i++) {
        expect(splitChars[i]).assertEqual(iterChars[i]);
      }

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7600
     * @tc.name      StringSymbol.iteratorTest1076
     * @tc.desc      split() splits UTF-16 code units while iterator yields code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1076';
      console.log(TAG + 'start');

      const str = "😀";
      const splitChars: string[] = str.split("");
      expect(splitChars.length).assertEqual(2);
      expect(splitChars[0]).assertEqual("\uD83D");
      expect(splitChars[1]).assertEqual("\uDE00");

      const iterChars: string[] = stringTest.testCodePoints(str);
      expect(iterChars.length).assertEqual(1);
      expect(iterChars[0]).assertEqual("😀");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7700
     * @tc.name      StringSymbol.iteratorTest1077
     * @tc.desc      Extract code points from iterated characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1077';
      console.log(TAG + 'start');

      const str = "A😀B";
      const codeNums: number[] = stringTest.testCodeNums(str) as number[];
      expect(codeNums.length).assertEqual(3);
      expect(codeNums[0]).assertEqual(65);
      expect(codeNums[1]).assertEqual(128512);
      expect(codeNums[2]).assertEqual(66);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7800
     * @tc.name      StringSymbol.iteratorTest1078
     * @tc.desc      Rebuild string from code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1078';
      console.log(TAG + 'start');

      const str = "hello";
      const ok: boolean = stringTest.testRebuildNums(str);
      expect(ok).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_7900
     * @tc.name      StringSymbol.iteratorTest1079
     * @tc.desc      Verify iterating a trimmed string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1079';
      console.log(TAG + 'start');

      const str = " hello ";
      const trimmed = str.trim();
      const chars: string[] = stringTest.testStringSpreadToArray(trimmed);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8000
     * @tc.name      StringSymbol.iteratorTest1080
     * @tc.desc      Verify iterating an uppercased string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1080';
      console.log(TAG + 'start');

      const str = "hello";
      const upper = str.toUpperCase();
      const chars: string[] = stringTest.testStringSpreadToArray(upper);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("H");
      expect(chars[1]).assertEqual("E");
      expect(chars[2]).assertEqual("L");
      expect(chars[3]).assertEqual("L");
      expect(chars[4]).assertEqual("O");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8100
     * @tc.name      StringSymbol.iteratorTest1081
     * @tc.desc      Verify iterating a sliced string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1081';
      console.log(TAG + 'start');

      const str = "hello world";
      const sliced = str.slice(0, 5);
      const chars: string[] = stringTest.testStringSpreadToArray(sliced);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8200
     * @tc.name      StringSymbol.iteratorTest1082
     * @tc.desc      Verify using includes on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1082';
      console.log(TAG + 'start');

      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const hasH: boolean = chars.includes("h");
      const hasZ: boolean = chars.includes("z");

      expect(hasH).assertTrue();
      expect(hasZ).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8300
     * @tc.name      StringSymbol.iteratorTest1083
     * @tc.desc      Verify using indexOf on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1083';
      console.log(TAG + 'start');

      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.indexOf("l")).assertEqual(2);
      expect(chars.indexOf("z")).assertEqual(-1);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8400
     * @tc.name      StringSymbol.iteratorTest1084
     * @tc.desc      Verify using join on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1084';
      console.log(TAG + 'start');

      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const joined: string = chars.join('-');

      expect(joined).assertEqual("h-e-l-l-o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8500
     * @tc.name      StringSymbol.iteratorTest1085
     * @tc.desc      Use regex test with filter on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1085';
      console.log(TAG + 'start');

      const str = "a1b2c3";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const letters: string[] = chars.filter((c: string) => /[a-z]/.test(c));

      expect(letters.length).assertEqual(3);
      expect(letters[0]).assertEqual("a");
      expect(letters[1]).assertEqual("b");
      expect(letters[2]).assertEqual("c");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORONE_8600
     * @tc.name      StringSymbol.iteratorTest1086
     * @tc.desc      Use regex replace with map on iterated character array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest1086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest1086';
      console.log(TAG + 'start');

      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const replaced: string[] = chars.map((c: string) => c.replace(/l/g, "L"));

      expect(replaced.length).assertEqual(5);
      expect(replaced[0]).assertEqual("h");
      expect(replaced[1]).assertEqual("e");
      expect(replaced[2]).assertEqual("L");
      expect(replaced[3]).assertEqual("L");
      expect(replaced[4]).assertEqual("o");

      console.log(TAG + "end");
    });

  });
}