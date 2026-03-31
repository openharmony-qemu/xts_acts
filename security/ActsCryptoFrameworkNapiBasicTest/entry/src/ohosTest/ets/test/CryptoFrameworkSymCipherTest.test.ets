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

export default function cryptoFrameworkSymCipherTest() {
  describe('ActsCryptoFrameworkSymCipherTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0100
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0100
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0200
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0200
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0300
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0300
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0400
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0400
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0401
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0401
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0401', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0500
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0500
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0600
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0600
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0700
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0700
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0800
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0800
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest0900
     * @tc.number SubCryptoFrameworkNapiSymCipherTest0900
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1000
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1000
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1100
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1100
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1200
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1200
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1300
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1300
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1400
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1400
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1500
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1500
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1600
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1600
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(16);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1700
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1700
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(17);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1800
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1800
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(18);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest1900
     * @tc.number SubCryptoFrameworkNapiSymCipherTest1900
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest1900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(19);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2000
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2000
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(20);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2100
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2100
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(21);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2200
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2200
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(22);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2300
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2300
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(23);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2600
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2600
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(24);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2700
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2700
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2800
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2800
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(26);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSymCipherTest2900
     * @tc.number SubCryptoFrameworkNapiSymCipherTest2900
     * @tc.desc   algorithm is SymCipher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSymCipherTest2900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Sym_Cipher_Test(27);
      expect(result).assertEqual(0);
      done();
    });
  })
}