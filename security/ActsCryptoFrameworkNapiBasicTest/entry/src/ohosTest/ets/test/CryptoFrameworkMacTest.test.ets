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

export default function cryptoFrameworkMacTest() {
  describe('ActsCryptoFrameworkMacTest', () => {
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
     * @tc.name   SubCryptoFrameworkNapiMacTest0100
     * @tc.number SubCryptoFrameworkNapiMacTest0100
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0200
     * @tc.number SubCryptoFrameworkNapiMacTest0200
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0200', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0300
     * @tc.number SubCryptoFrameworkNapiMacTest0300
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0300', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(2);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0400
     * @tc.number SubCryptoFrameworkNapiMacTest0400
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0400', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(3);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0500
     * @tc.number SubCryptoFrameworkNapiMacTest0500
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0500', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0600
     * @tc.number SubCryptoFrameworkNapiMacTest0600
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0600', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0700
     * @tc.number SubCryptoFrameworkNapiMacTest0700
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0700', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(6);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0800
     * @tc.number SubCryptoFrameworkNapiMacTest0800
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0800', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(7);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacTest0900
     * @tc.number SubCryptoFrameworkNapiMacTest0900
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacTest0900', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SubCryptoFrameworkNapiMacVectorTest0100
     * @tc.number SubCryptoFrameworkNapiMacVectorTest0100
     * @tc.desc   algorithm is Mac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SubCryptoFrameworkNapiMacVectorTest0100', Level.LEVEL0, async (done: Function) => {
      const result = await entry.Mac_Test(9);
      expect(result).assertEqual(0);
      done();
    });
  })
}