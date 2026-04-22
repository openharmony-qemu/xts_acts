import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as stringTest from './string_symbol.iterator_test1'

interface CustomIteratorResult {
  value?: string;
  done: boolean;
}

interface CustomStringIterator {
  next(): CustomIteratorResult;
}

export default function StringSymbolIteratorTest2() {
  describe('StringSymbolIteratorTest2', () => {
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
      // This API supports only one parameter: preset action function.
    });

    //========================Interaction Test with Other String Methods===========================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0100
     * @tc.name      StringSymbol.iteratorTest2001
     * @tc.desc      Verify iterating a normalized (NFC) string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2001';
      console.log(TAG + 'start');

      const str = "e\u0301"; // e + combining acute accent
      const normalized = str.normalize("NFC");
      const chars: string[] = stringTest.testStringSpreadToArray(normalized);

      expect(chars.length).assertEqual(1);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0200
     * @tc.name      StringSymbol.iteratorTest2002
     * @tc.desc      Compare iteration results of NFC vs NFD forms
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2002';
      console.log(TAG + 'start');

      const str = "e\u0301";
      const nfcStr = str.normalize("NFC");
      const nfdStr = str.normalize("NFD");

      const nfcChars: string[] = stringTest.testStringSpreadToArray(nfcStr);
      const nfdChars: string[] = stringTest.testStringSpreadToArray(nfdStr);

      expect(nfcChars.length).assertEqual(1);
      expect(nfdChars.length).assertEqual(2);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0300
     * @tc.name      StringSymbol.iteratorTest2003
     * @tc.desc      Verify repeat() result when repeating non-empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2003';
      console.log(TAG + 'start');

      const str = "ab".repeat(3);
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(6);
      expect(chars[0]).assertEqual("a");
      expect(chars[1]).assertEqual("b");
      expect(chars[2]).assertEqual("a");
      expect(chars[3]).assertEqual("b");
      expect(chars[4]).assertEqual("a");
      expect(chars[5]).assertEqual("b");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0400
     * @tc.name      StringSymbol.iteratorTest2004
     * @tc.desc      Verify repeat() result when repeating empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2004';
      console.log(TAG + 'start');

      const str = "".repeat(10);
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(0);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0500
     * @tc.name      StringSymbol.iteratorTest2005
     * @tc.desc      Verify padStart iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2005';
      console.log(TAG + 'start');

      const str = "hello".padStart(10, " ");
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(10);
      for (let i = 0; i < 5; i++) {
        expect(chars[i]).assertEqual(" ");
      }
      expect(chars[5]).assertEqual("h");
      expect(chars[6]).assertEqual("e");
      expect(chars[7]).assertEqual("l");
      expect(chars[8]).assertEqual("l");
      expect(chars[9]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0600
     * @tc.name      StringSymbol.iteratorTest2006
     * @tc.desc      Verify padEnd iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2006';
      console.log(TAG + 'start');

      const str = "hello".padEnd(10, ".");
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(10);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");
      for (let i = 5; i < 10; i++) {
        expect(chars[i]).assertEqual(".");
      }

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0700
     * @tc.name      StringSymbol.iteratorTest2007
     * @tc.desc      Verify toString iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2007';
      console.log(TAG + 'start');

      const strObj = new String("hello");
      const str = strObj.toString();
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0800
     * @tc.name      StringSymbol.iteratorTest2008
     * @tc.desc      Verify valueOf iteration result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2008';
      console.log(TAG + 'start');

      const strObj = new String("hello");
      const str = strObj.valueOf();
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      expect(chars.length).assertEqual(5);
      expect(chars[0]).assertEqual("h");
      expect(chars[1]).assertEqual("e");
      expect(chars[2]).assertEqual("l");
      expect(chars[3]).assertEqual("l");
      expect(chars[4]).assertEqual("o");

      console.log(TAG + "end");
    });

    //========================Practical Application Scenario Test============================

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_0900
     * @tc.name      StringSymbol.iteratorTest2009
     * @tc.desc      Use iterator to count character frequency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2009';
      console.log(TAG + 'start');

      const str = "hello world";
      const res: number[] = stringTest.testFreqLR(str) as number[];
      expect(res[0]).assertEqual(3);
      expect(res[1]).assertEqual(2);

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1000
     * @tc.name      StringSymbol.iteratorTest2010
     * @tc.desc      Use iterator to obtain unique characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2010';
      console.log(TAG + 'start');

      const str = "hello";
      const res: Array<number | boolean> = stringTest.testUniqueHello(str) as Array<number | boolean>;
      expect(res[0] as number).assertEqual(4);
      expect(res[1] as boolean).assertTrue();
      expect(res[2] as boolean).assertTrue();
      expect(res[3] as boolean).assertTrue();
      expect(res[4] as boolean).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1100
     * @tc.name      StringSymbol.iteratorTest2011
     * @tc.desc      Use iterator to reverse a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2011';
      console.log(TAG + 'start');

      const str = "hello";
      const reversed: string = stringTest.testReverseJoin(str);
      expect(reversed).assertEqual("olleh");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1200
     * @tc.name      StringSymbol.iteratorTest2012
     * @tc.desc      Use iterator to uppercase characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2012';
      console.log(TAG + 'start');

      const str = "hello";
      const upper: string = stringTest.testUpperJoin(str);
      expect(upper).assertEqual("HELLO");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1300
     * @tc.name      StringSymbol.iteratorTest2013
     * @tc.desc      Use iterator to filter non-numeric characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2013';
      console.log(TAG + 'start');

      const str = "a1b2c3";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const filtered: string = chars.filter((c: string) => isNaN(Number(c))).join('');

      expect(filtered).assertEqual("abc");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1400
     * @tc.name      StringSymbol.iteratorTest2014
     * @tc.desc      Use iterator to remove spaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2014';
      console.log(TAG + 'start');

      const str = "hello world";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const noSpaces: string = chars.filter((c: string) => c !== ' ').join('');

      expect(noSpaces).assertEqual("helloworld");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1500
     * @tc.name      StringSymbol.iteratorTest2015
     * @tc.desc      Verify character types using iterator and every
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2015';
      console.log(TAG + 'start');

      const str = "abc123";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      const allLetters: boolean = chars.every((c: string) => /[a-zA-Z]/.test(c));
      const allDigits: boolean = chars.every((c: string) => /[0-9]/.test(c));

      expect(allLetters).assertFalse();
      expect(allDigits).assertFalse();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1600
     * @tc.name      StringSymbol.iteratorTest2016
     * @tc.desc      Verify character code range using iterator and every
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2016';
      console.log(TAG + 'start');

      const str = "abc";
      const chars: string[] = stringTest.testStringSpreadToArray(str);

      const inRange: boolean = chars.every((c: string) => {
        const code = c.charCodeAt(0);
        return code >= 97 && code <= 122; // a-z
      });

      expect(inRange).assertTrue();

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1700
     * @tc.name      StringSymbol.iteratorTest2017
     * @tc.desc      Use iterator chain: filter then map then join
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2017';
      console.log(TAG + 'start');

      const str = "Hello World ";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const result: string = chars.filter((c: string) => c !== ' ').map((c: string) => c.toLowerCase()).join('');

      expect(result).assertEqual("helloworld");

      console.log(TAG + "end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STRINGSYMBOLITERATORTWO_1800
     * @tc.name      StringSymbol.iteratorTest2018
     * @tc.desc      Use iterator chain to alternate upper/lower by index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("StringSymbol.iteratorTest2018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'StringSymbol.iteratorTest2018';
      console.log(TAG + 'start');

      const str = "hello";
      const chars: string[] = stringTest.testStringSpreadToArray(str);
      const result: string = chars.map((c: string, i: number) => i % 2 === 0 ? c.toUpperCase() : c.toLowerCase()).join('');

      expect(result).assertEqual("HeLlO");

      console.log(TAG + "end");
    });

  });
}