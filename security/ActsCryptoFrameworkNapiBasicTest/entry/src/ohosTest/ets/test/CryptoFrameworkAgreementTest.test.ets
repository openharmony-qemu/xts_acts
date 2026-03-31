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

export default function cryptoFrameworkAgreementTest() {
  describe('ActsCryptoFrameworkAgreementTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiAgreementTest0100
     * @tc.number SubCryptoFrameworkNapiAgreementTest0100
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementTest0200
     * @tc.number SubCryptoFrameworkNapiAgreementTest0200
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementTest0300
     * @tc.number SubCryptoFrameworkNapiAgreementTest0300
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementTest0400
     * @tc.number SubCryptoFrameworkNapiAgreementTest0400
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementTest0500
     * @tc.number SubCryptoFrameworkNapiAgreementTest0500
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementVectorTest0100
     * @tc.number SubCryptoFrameworkNapiAgreementVectorTest0100
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementVectorTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementVectorTest0200
     * @tc.number SubCryptoFrameworkNapiAgreementVectorTest0200
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementVectorTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAgreementVectorTest0300
     * @tc.number SubCryptoFrameworkNapiAgreementVectorTest0300
     * @tc.desc   algorithm is Agreement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAgreementVectorTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Agreement_Test(7);
      expect(result).assertEqual(0);
      done();
    });
  })
}