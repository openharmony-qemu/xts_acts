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

export default function cryptoFrameworkAsymKeyTest() {
  describe('ActsCryptoFrameworkAsymKeyTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0100
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0100
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0200
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0200
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0300
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0300
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0400
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0400
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0500
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0500
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0600
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0600
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0700
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0700
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0800
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0800
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest0900
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest0900
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1000
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1000
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1100
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1100
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1200
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1200
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1300
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1300
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1400
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1400
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1500
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1500
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1600
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1600
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1700
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1700
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(16);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1800
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1800
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(17);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest1900
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest1900
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest1900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(18);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest2000
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest2000
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest2000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(19);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiAsymKeyTest2100
     * @tc.number SubCryptoFrameworkNapiAsymKeyTest2100
     * @tc.desc   algorithm is Asym Key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiAsymKeyTest2100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Asym_Key_Test(20);
      expect(result).assertEqual(0);
      done();
    });
  })
}