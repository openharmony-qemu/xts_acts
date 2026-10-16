/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import testNapi from 'libentry.so';

export default function CrossModuleNapiLoadTest() {
  let TAG = '';
  describe('CrossModuleNapiLoadTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testLocalNativeAdd
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0100
     * @tc.desc   Test the local native method call in the HAP package
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLocalNativeAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0100';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.add(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   testHarNativeAdd
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0200
     * @tc.desc   Test calling the HAR native method from the HAP native side
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testHarNativeAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0200';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.invokeHarNative(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   testHarArkTSAdd
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0300
     * @tc.desc   Test calling the HAR ArkTS method from the HAP native side via napi_load_module_with_info
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testHarArkTSAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0300';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.invokeHarArkTS(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   testHspNativeAdd
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0400
     * @tc.desc   Test calling the HSP native method from the HAP native side
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testHspNativeAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0400';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.invokeHspNative(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })

    /**
     * @tc.name   testHspArkTSAdd
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0500
     * @tc.desc   Test calling the HSP ArkTS method from the HAP native side via napi_load_module_with_info
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testHspArkTSAdd', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      TAG = 'SUB_ARKCOMPILER_ETSRUNTIME_CrossModule_NapiLoad_0500';
      console.info(TAG, ' start');
      let argc1 = 2;
      let argc2 = 3;
      let result: number = testNapi.invokeHspArkTS(argc1, argc2);
      console.info(TAG, 'result: ', result);
      expect(result).assertEqual(5);
    })
  })
}
