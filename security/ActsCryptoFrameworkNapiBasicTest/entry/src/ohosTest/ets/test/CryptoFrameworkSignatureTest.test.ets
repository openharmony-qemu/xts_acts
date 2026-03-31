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

export default function cryptoFrameworkSignatureTest() {
  describe('ActsCryptoFrameworkSignatureTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0100
     * @tc.number SubCryptoFrameworkNapiSignatureTest0100
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0200
     * @tc.number SubCryptoFrameworkNapiSignatureTest0200
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0300
     * @tc.number SubCryptoFrameworkNapiSignatureTest0300
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0400
     * @tc.number SubCryptoFrameworkNapiSignatureTest0400
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0500
     * @tc.number SubCryptoFrameworkNapiSignatureTest0500
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0600
     * @tc.number SubCryptoFrameworkNapiSignatureTest0600
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0700
     * @tc.number SubCryptoFrameworkNapiSignatureTest0700
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0800
     * @tc.number SubCryptoFrameworkNapiSignatureTest0800
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest0900
     * @tc.number SubCryptoFrameworkNapiSignatureTest0900
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1000
     * @tc.number SubCryptoFrameworkNapiSignatureTest1000
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1100
     * @tc.number SubCryptoFrameworkNapiSignatureTest1100
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1200
     * @tc.number SubCryptoFrameworkNapiSignatureTest1200
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1300
     * @tc.number SubCryptoFrameworkNapiSignatureTest1300
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1400
     * @tc.number SubCryptoFrameworkNapiSignatureTest1400
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1500
     * @tc.number SubCryptoFrameworkNapiSignatureTest1500
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1600
     * @tc.number SubCryptoFrameworkNapiSignatureTest1600
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1700
     * @tc.number SubCryptoFrameworkNapiSignatureTest1700
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(16);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1800
     * @tc.number SubCryptoFrameworkNapiSignatureTest1800
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(17);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest1900
     * @tc.number SubCryptoFrameworkNapiSignatureTest1900
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest1900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(18);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiSignatureTest2000
     * @tc.number SubCryptoFrameworkNapiSignatureTest2000
     * @tc.desc   algorithm is Signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiSignatureTest2000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Signature_Test(19);
      expect(result).assertEqual(0);
      done();
    });
  })
}