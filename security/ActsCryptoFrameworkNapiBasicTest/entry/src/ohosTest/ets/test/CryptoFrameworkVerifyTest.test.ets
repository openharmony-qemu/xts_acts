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

export default function cryptoFrameworkVerifyTest() {
  describe('ActsCryptoFrameworkVerifyTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0100
     * @tc.number SubCryptoFrameworkNapiVerifyTest0100
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0200
     * @tc.number SubCryptoFrameworkNapiVerifyTest0200
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0301
     * @tc.number SubCryptoFrameworkNapiVerifyTest0301
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0301', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0300
     * @tc.number SubCryptoFrameworkNapiVerifyTest0300
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0400
     * @tc.number SubCryptoFrameworkNapiVerifyTest0400
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0500
     * @tc.number SubCryptoFrameworkNapiVerifyTest0500
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0600
     * @tc.number SubCryptoFrameworkNapiVerifyTest0600
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0700
     * @tc.number SubCryptoFrameworkNapiVerifyTest0700
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0800
     * @tc.number SubCryptoFrameworkNapiVerifyTest0800
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest0900
     * @tc.number SubCryptoFrameworkNapiVerifyTest0900
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1000
     * @tc.number SubCryptoFrameworkNapiVerifyTest1000
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1100
     * @tc.number SubCryptoFrameworkNapiVerifyTest1100
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1200
     * @tc.number SubCryptoFrameworkNapiVerifyTest1200
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1300
     * @tc.number SubCryptoFrameworkNapiVerifyTest1300
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(13);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1400
     * @tc.number SubCryptoFrameworkNapiVerifyTest1400
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(14);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1500
     * @tc.number SubCryptoFrameworkNapiVerifyTest1500
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(15);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1600
     * @tc.number SubCryptoFrameworkNapiVerifyTest1600
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(16);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1700
     * @tc.number SubCryptoFrameworkNapiVerifyTest1700
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(17);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1800
     * @tc.number SubCryptoFrameworkNapiVerifyTest1800
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(18);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest1900
     * @tc.number SubCryptoFrameworkNapiVerifyTest1900
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest1900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(19);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2000
     * @tc.number SubCryptoFrameworkNapiVerifyTest2000
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2000', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(20);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2100
     * @tc.number SubCryptoFrameworkNapiVerifyTest2100
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(21);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2200
     * @tc.number SubCryptoFrameworkNapiVerifyTest2200
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(22);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2300
     * @tc.number SubCryptoFrameworkNapiVerifyTest2300
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(23);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2400
     * @tc.number SubCryptoFrameworkNapiVerifyTest2400
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(24);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2500
     * @tc.number SubCryptoFrameworkNapiVerifyTest2500
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2600
     * @tc.number SubCryptoFrameworkNapiVerifyTest2600
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(26);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiVerifyTest2700
     * @tc.number SubCryptoFrameworkNapiVerifyTest2700
     * @tc.desc   algorithm is Verify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiVerifyTest2700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Verify_Test(27);
      expect(result).assertEqual(0);
      done();
    });
  })
}