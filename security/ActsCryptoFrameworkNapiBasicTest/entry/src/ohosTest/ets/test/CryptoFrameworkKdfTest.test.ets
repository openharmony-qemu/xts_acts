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

export default function cryptoFrameworkKdfTest() {
  describe('ActsCryptoFrameworkKdfTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiKdfTest0100
     * @tc.number SubCryptoFrameworkNapiKdfTest0100
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0200
     * @tc.number SubCryptoFrameworkNapiKdfTest0200
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0300
     * @tc.number SubCryptoFrameworkNapiKdfTest0300
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0400
     * @tc.number SubCryptoFrameworkNapiKdfTest0400
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0500
     * @tc.number SubCryptoFrameworkNapiKdfTest0500
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0600
     * @tc.number SubCryptoFrameworkNapiKdfTest0600
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0700
     * @tc.number SubCryptoFrameworkNapiKdfTest0700
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0800
     * @tc.number SubCryptoFrameworkNapiKdfTest0800
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest0900
     * @tc.number SubCryptoFrameworkNapiKdfTest0900
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest1000
     * @tc.number SubCryptoFrameworkNapiKdfTest1000
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest1000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest1100
     * @tc.number SubCryptoFrameworkNapiKdfTest1100
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest1100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest1200
     * @tc.number SubCryptoFrameworkNapiKdfTest1200
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest1200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfVectorTest0100
     * @tc.number SubCryptoFrameworkNapiKdfVectorTest0100
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfVectorTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiKdfTest1300
     * @tc.number SubCryptoFrameworkNapiKdfTest1300
     * @tc.desc   algorithm is Kdf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiKdfTest1300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Kdf_Test(13);
      expect(result).assertEqual(0);
      done();
    });
  })
}