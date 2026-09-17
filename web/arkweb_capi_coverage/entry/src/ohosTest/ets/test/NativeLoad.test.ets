/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

const ARKWEB_SUCCESS = 0;
const ARKWEB_INIT_ERROR = 17100001;
const ARKWEB_INVALID_PARAM = 17100101;

export default function native_loadTest() {
  describe('native_loadTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_LoadDataInitError
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_LOAD_DATA_INIT_0021
     * @tc.desc Test OH_NativeArkWeb_LoadData ARKWEB_INIT_ERROR (17100001)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_LoadDataInitError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_LoadData()).assertEqual(ARKWEB_INIT_ERROR);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_LoadDataUnboundTag
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_LOAD_DATA_INIT_0022
     * @tc.desc Test OH_NativeArkWeb_LoadData with unbound webTag returns ARKWEB_INIT_ERROR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_LoadDataUnboundTag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_LoadDataByCase(1)).assertEqual(ARKWEB_INIT_ERROR);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_LoadDataEmptyData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_LOAD_DATA_INVALID_0023
     * @tc.desc Test OH_NativeArkWeb_LoadData empty data returns ARKWEB_INVALID_PARAM or INIT_ERROR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_LoadDataEmptyData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const result = nativeFunc.TestNativeArkWeb_LoadDataByCase(2);
        expect([ARKWEB_INVALID_PARAM, ARKWEB_INIT_ERROR, ARKWEB_SUCCESS]).assertContain(result);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_LoadDataEmptyMimeType
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_LOAD_DATA_INVALID_0024
     * @tc.desc Test OH_NativeArkWeb_LoadData empty mimeType returns ARKWEB_INVALID_PARAM or INIT_ERROR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_LoadDataEmptyMimeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const result = nativeFunc.TestNativeArkWeb_LoadDataByCase(3);
        expect([ARKWEB_INVALID_PARAM, ARKWEB_INIT_ERROR, ARKWEB_SUCCESS]).assertContain(result);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_LoadDataEmptyEncoding
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_LOAD_DATA_INVALID_0025
     * @tc.desc Test OH_NativeArkWeb_LoadData empty encoding returns ARKWEB_INVALID_PARAM or INIT_ERROR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_LoadDataEmptyEncoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const result = nativeFunc.TestNativeArkWeb_LoadDataByCase(4);
        expect([ARKWEB_INVALID_PARAM, ARKWEB_INIT_ERROR, ARKWEB_SUCCESS]).assertContain(result);
        done();
      });

  });
}
