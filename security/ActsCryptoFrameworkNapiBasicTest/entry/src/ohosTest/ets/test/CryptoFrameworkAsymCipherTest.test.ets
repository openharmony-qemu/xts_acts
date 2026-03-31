/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import entry from 'libentry.so'

export default function cryptoFrameworkAsymCipherTest() {
  describe('ActsCryptoFrameworkAsymCipherTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0100
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0100
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0200
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0200
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0300
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0300
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0400
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0400
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0500
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0500
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0600
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0600
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0700
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0700
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0800
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0800
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest0900
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest0900
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1000
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1000
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1100
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1100
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1200
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1200
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1300
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1300
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1400
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1400
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1500
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1500
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1600
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1600
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1700
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1700
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(16);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1800
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1800
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(17);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest1900
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest1900
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest1900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(18);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest2000
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest2000
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest2000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(19);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymCipherTest2100
     * @tc.number SubCryptoFrameworkNapiAsymCipherTest2100
     * @tc.desc   algorithm is Asym Cipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymCipherTest2100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Cipher_Test(20);
      expect(result).assertEqual(0);
      done();
    });
  })
}