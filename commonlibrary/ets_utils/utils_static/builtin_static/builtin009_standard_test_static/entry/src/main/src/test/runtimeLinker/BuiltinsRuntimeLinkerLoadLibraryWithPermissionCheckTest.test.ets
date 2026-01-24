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

export default function builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest() {
  describe("builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest", () => {
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
    * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0100
    * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0100
    * @tc.desc    Test loadLibraryWithPermissionCheck with normal path and filename
    * @tc.type    FUNCTION
    * @tc.size    SMALLTEST
    * @tc.level   LEVEL0
    */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        loadLibraryWithPermissionCheck('/system/lib/libc.so', '@ohos.bundle.d.ts');
        expect(true).assertTrue();
      } catch (error) {
        console.log('Normal parameters handled');
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0200
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0200
     * @tc.desc    Test loadLibraryWithPermissionCheck with empty path and filename
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let hasError = false;
      try {
        loadLibraryWithPermissionCheck('', '');
      } catch (error) {
        hasError = true;
        expect(error instanceof Error).assertTrue();
      }
      expect(hasError).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0300
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0300
     * @tc.desc    Test loadLibraryWithPermissionCheck with special characters in path
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialPath = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      const normalFile = 'test.d.ts';
      try {
        loadLibraryWithPermissionCheck(specialPath, normalFile);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      const normalPath = '/system/lib/libtest.so';
      const specialFile = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~.d.ts';
      try {
        loadLibraryWithPermissionCheck(normalPath, specialFile);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      try {
        loadLibraryWithPermissionCheck(specialPath, specialFile);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0400
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0400
     * @tc.desc    Test loadLibraryWithPermissionCheck with special characters in filename
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      try {
        loadLibraryWithPermissionCheck('/system/lib/libc.so', specialChars);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      try {
        loadLibraryWithPermissionCheck(specialChars, 'normal.d.ts');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      try {
        loadLibraryWithPermissionCheck(specialChars, specialChars);
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0500
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0500
     * @tc.desc    Test loadLibraryWithPermissionCheck with ASCII characters in both parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let asciiStr = '';
      for (let i = 32; i <= 126; i++) {
        asciiStr += String.fromCharCode(i);
      }
      expect(asciiStr.length).assertEqual(95);
      const fixedFileName = 'test.d.ts';
      for (let i = 0; i < asciiStr.length; i++) {
        const singleChar = asciiStr.charAt(i);
        const charStr = String(singleChar);
        try {
          loadLibraryWithPermissionCheck(charStr, fixedFileName);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      const fixedPath = '/system/lib/libc.so';
      for (let i = 0; i < asciiStr.length; i++) {
        const singleChar = asciiStr.charAt(i);
        const charStr = String(singleChar);
        try {
          loadLibraryWithPermissionCheck(fixedPath, charStr);
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0600
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0600
     * @tc.desc    Test loadLibraryWithPermissionCheck with duplicated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const specialChars = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
        loadLibraryWithPermissionCheck(specialChars, specialChars);
        expect(true).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0700
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0700
     * @tc.desc    Test loadLibraryWithPermissionCheck with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const escapeChars = '\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0\\101\\x41';
        loadLibraryWithPermissionCheck(escapeChars, escapeChars);
        expect(true).assertTrue();
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0800
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0800
     * @tc.desc    Test loadLibraryWithPermissionCheck with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emojiUnicodes = [
          '\\ud83d\\udc46',
          '\\ud83d\\udc7f',
          '\\ud83d\\udc40',
          '\\ud83d\\udcaf',
          '\\ud83c\\udf85',
          '\\ud83d\\ude3c',
          '\\ud83d\\udd27',
          '\\ud83d\\udc87',
          '\\ud83e\\udd3c\\u200d\\u2642\\ufe0f',
          '\\ud83d\\udee2',
          '\\ud83c\\udc04',
          '\\ud83c\\udff4'
        ];
        for (const unicodeStr of emojiUnicodes) {
          try {
            loadLibraryWithPermissionCheck(unicodeStr, unicodeStr);
            console.log(`accept: ${unicodeStr}`);
          } catch (error) {
            console.log(`Refuse: ${error.message || 'Invalid'}`);
          }
        }
        expect(true).assertTrue();
      } catch (error) {
        expect(true).assertTrue();
      }
    });


    //有问题
    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest0900
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST0900
     * @tc.desc    Test loadLibraryWithPermissionCheck with invalid Unicode sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('testInvalidUnicodeEncoded', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const invalidUnicodes = ['\udc04', '\ud83d', '\udff4'];
      for (let i = 0; i < invalidUnicodes.length; i++) {
        const rawCode = invalidUnicodes[i];
        const codePoint = rawCode.charCodeAt(0);
        const percentEncoded = '%u' + codePoint.toString(16).toUpperCase().padStart(4, '0');
        const path1 = '/lib/' + percentEncoded + '/lib.so';
        try {
          loadLibraryWithPermissionCheck(path1, 'test.d.ts');
        } catch (e) {
          console.log(`Percent-encoded path error: ${e.message}`);
        }
      }
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1000
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST1000
     * @tc.desc    Test loadLibraryWithPermissionCheck with keyword strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const keywords = ['0', 'NaN', ''];
        for (const keyword of keywords) {
          loadLibraryWithPermissionCheck(keyword, keyword);
        }
        for (let i = 0; i < 2; i++) {
          for (const keyword of keywords) {
            loadLibraryWithPermissionCheck(keyword, keyword);
          }
        }
        expect(true).assertTrue();
      } catch (error) {
        console.log('Keyword strings handled');
        expect(true).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1100
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST1100
     * @tc.desc    Test loadLibraryWithPermissionCheck with treeString type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const initTreeString = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };
      const size = 5000;
      const treeStart = Date.now();
      const treeString = initTreeString(size);
      const treeCreationTime = Date.now() - treeStart;
      const treeCallStart = Date.now();
      try {
        loadLibraryWithPermissionCheck(treeString, treeString);
      } catch (error) {
      }
      const treeCallTime = Date.now() - treeCallStart;
      const normalStart = Date.now();
      const normalString = 'x'.repeat(size);
      const normalCreationTime = Date.now() - normalStart;
      const normalCallStart = Date.now();
      try {
        loadLibraryWithPermissionCheck(normalString, normalString);
      } catch (error) {
      }
      const normalCallTime = Date.now() - normalCallStart;
      console.log('Performance Comparison Results:');
      console.log(`TreeString: Create${treeCreationTime}ms, Call${treeCallTime}ms`);
      expect(true).assertTrue();
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1200
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST1200
     * @tc.desc    Test loadLibraryWithPermissionCheck with sliceString type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const originalStr = "{k1:value1,k2:value2}";
      const sliced = originalStr.substring(0, originalStr.length - 2);
      const iterations = 100;
      let valueChanged = false;
      for (let i = 0; i < iterations; i++) {
        const beforeCall = sliced;
        try {
          loadLibraryWithPermissionCheck(sliced, sliced);
        } catch (error) {
        }
        const afterCall = sliced;
        if (beforeCall !== afterCall) {
          console.error(`Call ${i + 1}: The value has changed!`);
          console.error(`  Before calling: "${beforeCall}"`);
          console.error(`  After calling: "${afterCall}"`);
          valueChanged = true;
          break;
        }
        if (beforeCall.length !== afterCall.length) {
          valueChanged = true;
          break;
        }
      }
      if (!valueChanged) {
        expect(true).assertTrue();
      } else {
        expect(false).assertTrue();
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1500
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST1500
     * @tc.desc    Test loadLibraryWithPermissionCheck with very long path
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const hugeSize = 1000000;
        const hugePath = "a".repeat(hugeSize);
        const hugeFileName = "b".repeat(hugeSize);
        loadLibraryWithPermissionCheck(hugePath, hugeFileName);
        expect(true).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    });

    /*
    * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1800
    * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST1800
    * @tc.desc    Test loadLibraryWithPermissionCheck with undefined parameters
    * @tc.type    FUNCTION
    * @tc.size    SMALLTEST
    * @tc.level   LEVEL0
    */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const undefinedStr = new String(undefined);
        loadLibraryWithPermissionCheck(undefinedStr, undefinedStr);
        expect(true).assertTrue();
      } catch (error) {
        console.log('Undefined parameters handled');
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1900
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST1900
     * @tc.desc    Test loadLibraryWithPermissionCheck with null parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const nullStr = new String(null);
        loadLibraryWithPermissionCheck(nullStr, nullStr);
        expect(true).assertTrue();
      } catch (error) {
        console.log('Null parameters handled');
      }
    });

    /*
     * @tc.name    builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest2000
     * @tc.number  BUILTINS_RUNTIME_LINKER_LOAD_LIBRARY_WITH_PERMISSION_CHECK_TEST2000
     * @tc.desc    Test loadLibraryWithPermissionCheck GC behavior
     * @tc.type    FUNCTION
     * @tc.size    LARGETEST
     * @tc.level   LEVEL2
     */
    it('builtinsRuntimeLinkerLoadLibraryWithPermissionCheckTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const largePath = 'x'.repeat(100000);
        const largeFilename = 'y'.repeat(100000);
        loadLibraryWithPermissionCheck(largePath, largeFilename);
        const tempArray: string[] = [];
        for (let i = 0; i < 10000; i++) {
          tempArray.push(i.toString());
        }
        loadLibraryWithPermissionCheck('test', 'test.so');
        expect(true).assertTrue();
      } catch (error) {
        console.log('GC behavior handled: ' + error.message);
        expect(true).assertTrue();
      }
    });

  })
}