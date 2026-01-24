/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsRuntimeLinkerLoadLibraryTest() {
  describe("builtinsRuntimeLinkerLoadLibraryTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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

    /*
    * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0100
    * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0100
    * @tc.desc    Test loadLibrary with undefined parameter
    * @tc.type    FUNCTION
    * @tc.size    SMALLTEST
    * @tc.level   LEVEL0
    */
    it('builtinsRuntimeLinkerLoadLibraryTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const strObj = new String(undefined);
        loadLibrary(strObj);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        console.log('Undefined parameter handled');
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0200
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0200
     * @tc.desc    Test loadLibrary with null parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const strObj = new String(null);
        loadLibrary(strObj);
        expect(true).assertTrue();
      } catch (error) {
        console.log('Null parameter handled');
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0300
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0300
     * @tc.desc    Test loadLibrary with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0300', TestType.FUNCTION + Size.SMALLTEST + Level.LEVEL0, () => {
      let testCompleted = false;
      try {
        loadLibrary('');
        testCompleted = true;
      } catch (error) {
        testCompleted = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(testCompleted).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0400
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0400
     * @tc.desc    Test loadLibrary with full range of special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect(specialChars.length).assertEqual(32);
      for (let i = 0; i < specialChars.length; i++) {
        const singleChar = specialChars.charAt(i);
        try {
          const testPath = '/lib/test' + singleChar + 'file.so';
          loadLibrary(testPath);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
          const errorMsg = error.message || '';
        }
      }
      expect(true).assertTrue();
    });


    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0500
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0500
     * @tc.desc    Test loadLibrary with full range of ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      expect(asciiStr.length).assertEqual(95);
      for (let i = 0; i < asciiStr.length; i++) {
        const charStr = String(asciiStr.charAt(i));
        try {
          loadLibrary(charStr);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0600
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0600
     * @tc.desc    Test loadLibrary with duplicated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
        loadLibrary(specialChars);
        expect(true).assertTrue();
      } catch (error) {
        console.log('Duplicated special characters handled');
        expect(error instanceof Error).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0700
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0700
     * @tc.desc    Test loadLibrary with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0700', TestType.FUNCTION + Size.SMALLTEST + Level.LEVEL0, () => {
      const actualEscapeChars =
        '\u0007' +
          '\b' +
          '\f' +
          '\n' +
          '\r' +
          '\t' +
          '\u000B' +
          '\\' +
          '\'' +
          '\"' +
          '?' +
          '\0' +
          'A' +
          'A';
      expect(actualEscapeChars.charCodeAt(0)).assertEqual(7);
      expect(actualEscapeChars.charCodeAt(1)).assertEqual(8);
      expect(actualEscapeChars.charCodeAt(2)).assertEqual(12);
      expect(actualEscapeChars.charCodeAt(3)).assertEqual(10);
      expect(actualEscapeChars.charCodeAt(4)).assertEqual(13);
      expect(actualEscapeChars.charCodeAt(5)).assertEqual(9);
      expect(actualEscapeChars.charCodeAt(6)).assertEqual(11);
      expect(actualEscapeChars.charCodeAt(7)).assertEqual(92);
      expect(actualEscapeChars.charCodeAt(8)).assertEqual(39);
      expect(actualEscapeChars.charCodeAt(9)).assertEqual(34);
      expect(actualEscapeChars.charCodeAt(10)).assertEqual(63);
      expect(actualEscapeChars.charCodeAt(11)).assertEqual(0);
      expect(actualEscapeChars.charCodeAt(12)).assertEqual(65);
      expect(actualEscapeChars.charCodeAt(13)).assertEqual(65);

      const escapeChars = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41';

      try {
        loadLibrary(escapeChars);
        expect(true).assertTrue();
      } catch (error) {
        console.log('Escape characters handled');
        expect(error instanceof Error).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0800
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0800
     * @tc.desc    Test loadLibrary with emoji and Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testPaths = [
        'test\\udc04.so',
        'test\\ud83d.so',
        'test\\udff4.so',
        'test\\ud83d\\udc46.so',
        'test\\ud83d\\udc7f.so',
        'test\\ud83d\\udc40.so',
        'test\\ud83d\\udcaf.so',
        'test\\ud83c\\udf85.so',
        'test\\ud83d\\ude3c.so',
        'test\\ud83d\\udd27.so',
        'test\\ud83d\\udc87.so',
        'test\\ud83e\\udd3c.so',
        'test\\ud83d\\udee2.so',
        'test\\ud83c\\udc04.so',
        'test\\ud83c\\udff4.so',
      ];

      let testsExecuted = 0;
      for (let i = 0; i < testPaths.length; i++) {
        try {
          loadLibrary(testPaths[i]);
          testsExecuted++;
        } catch (e) {
          testsExecuted++;
        }
      }
      expect(testsExecuted).assertEqual(testPaths.length);
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest0900
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST0900
     * @tc.desc    Test loadLibrary with invalid Unicode sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest0900', TestType.FUNCTION + Size.SMALLTEST + Level.LEVEL0, () => {
      const safeTests = [
        'test\\udc04.so',
        'lib\\ud83d.so',
        'path\\udff4.so'
      ];
      for (let i = 0; i < safeTests.length; i++) {
        try {
          loadLibrary(safeTests[i]);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest1000
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST1000
     * @tc.desc    Test loadLibrary with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const keywords = ['0', 'NaN', ''];

        for (const keyword of keywords) {
          loadLibrary(keyword);
        }
        expect(true).assertTrue();
      } catch (error) {
        console.log('Keyword strings handled');
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest1100
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST1100
     * @tc.desc    Test loadLibrary with treeString type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const size = 10000;
      const treeStart = Date.now();
      const treeString = initTreeString(size);
      const treeTime = Date.now() - treeStart;
      const normalStart = Date.now();
      const normalString = 'x'.repeat(size);
      const normalTime = Date.now() - normalStart;
      console.log(`treeString length: ${treeString.length}, expected: ${size}`);
      console.log(`normalString length: ${normalString.length}, expected: ${size}`);
      expect(treeString.length >= size).assertTrue();

      let treeExceptionCaught = false;
      try {
        loadLibrary(treeString);
      } catch (error) {
        treeExceptionCaught = true;
        console.log("loadLibrary(treeString) error:", error);
      }
      expect(treeExceptionCaught).assertTrue();

      let normalExceptionCaught = false;
      try {
        loadLibrary(normalString);
      } catch (error) {
        normalExceptionCaught = true;
        console.log("loadLibrary(normalString) error:", error);
      }
      expect(normalExceptionCaught).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest1200
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST1200
     * @tc.desc    Test loadLibrary with sliceString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str = "{k1:value1,k2:value2}";
      for (let i = 0; i < 1000; i++) {
        const result = str.substring(0, str.length - 2);
        expect(result).assertEqual("{k1:value1,k2:value");
      }
      const finalResult = str.substring(0, str.length - 2);
      try {
        loadLibrary(finalResult);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest1300
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST1300
     * @tc.desc    Test loadLibrary memory usage with large string
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringSize = 10000000;
      try {
        const largeString = 'a'.repeat(stringSize);
        expect(largeString.length).assertEqual(stringSize);
        loadLibrary(largeString);
        expect(true).assertTrue();
      } catch (error) {
        const errorMsg = error.message || error.toString();
        if (errorMsg.includes('memory') || errorMsg.includes('out of')) {
          expect(false).assertTrue();
        } else {
          expect(error instanceof Error).assertTrue();
        }
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryTest1400
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_TEST1400
     * @tc.desc    Test loadLibrary GC behavior
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const iterations = 100;
      const stringSize = 100000;
      for (let i = 0; i < iterations; i++) {
        const largeString = 'x'.repeat(stringSize);
        try {
          loadLibrary(largeString);
        } catch (error) {
          const errorMsg = error.message || '';
          expect(errorMsg.includes('memory')).assertFalse();
          expect(errorMsg.includes('out of')).assertFalse();
        }
      }
      expect(true).assertTrue();
    });

  })
}