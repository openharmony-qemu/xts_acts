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

const BLANKLESS_SUCCESS = 0;
const BLANKLESS_ERR_UNKNOWN = -1;
const BLANKLESS_ERR_INVALID_ARGS = -2;
const BLANKLESS_ERR_CONTROLLER_NOT_INITED = -3;
const BLANKLESS_ERR_KEY_NOT_MATCH = -4;
const BLANKLESS_ERR_SIGNIFICANT_CHANGE = -5;
const BLANKLESS_ERR_DEVICE_NOT_SUPPORT = 801;

function assertBlanklessErrCode(actual: number, expected: number): void {
  expect([expected, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]).assertContain(actual);
}

export default function native_blanklessTest() {
  describe('native_blanklessTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingWithKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_BLANKLESS_LOADING_WITH_KEY_6900
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingWithKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingWithKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKey()).assertLarger(BLANKLESS_ERR_SIGNIFICANT_CHANGE);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrControllerNotInited
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_CONTROLLER_7000
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrControllerNotInited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(0),
          BLANKLESS_ERR_CONTROLLER_NOT_INITED);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrInvalidArgs
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_INVALID_ARGS_7100
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrInvalidArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(3),
          BLANKLESS_ERR_INVALID_ARGS);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrInvalidArgsEmptyWebTag
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_INVALID_ARGS_WEBTAG_7200
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_INVALID_ARGS empty webTag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrInvalidArgsEmptyWebTag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(1),
          BLANKLESS_ERR_INVALID_ARGS);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrInvalidArgsEmptyKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_INVALID_ARGS_KEY_7300
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_INVALID_ARGS empty key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrInvalidArgsEmptyKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(2),
          BLANKLESS_ERR_INVALID_ARGS);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrKeyNotMatch
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_KEY_NOT_MATCH_7400
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrKeyNotMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(4),
          BLANKLESS_ERR_KEY_NOT_MATCH);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrSignificantChange
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_SIGNIFICANT_7500
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_SIGNIFICANT_CHANGE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrSignificantChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(5),
          BLANKLESS_ERR_SIGNIFICANT_CHANGE);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrUnknown
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_UNKNOWN_7600
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_UNKNOWN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyErrUnknown(),
          BLANKLESS_ERR_UNKNOWN);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoErrInvalidArgs
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_ERR_INVALID_ARGS_7700
     * @tc.desc Test GetBlanklessInfoWithKey ARKWEB_BLANKLESS_ERR_INVALID_ARGS
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoErrInvalidArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(2),
          BLANKLESS_ERR_INVALID_ARGS);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoErrControllerNotInited
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_ERR_CONTROLLER_7800
     * @tc.desc Test GetBlanklessInfoWithKey ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoErrControllerNotInited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(3),
          BLANKLESS_ERR_CONTROLLER_NOT_INITED);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoErrKeyNotMatch
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_ERR_KEY_NOT_MATCH_7900
     * @tc.desc Test GetBlanklessInfoWithKey ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoErrKeyNotMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(1),
          BLANKLESS_ERR_KEY_NOT_MATCH);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoWithKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_GET_BLANKLESS_INFO_WITH_KEY_8000
     * @tc.desc Test OH_NativeArkWeb_GetBlanklessInfoWithKey errCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoWithKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKey()).assertLarger(BLANKLESS_ERR_SIGNIFICANT_CHANGE);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoWithKeyReturnFields
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_RETURN_FIELDS_8100
     * @tc.desc Test GetBlanklessInfoWithKey return errCode field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoWithKeyReturnFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyReturnFields())
          .assertLarger(BLANKLESS_ERR_SIGNIFICANT_CHANGE);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoSimilarityReturn
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_SIMILARITY_8200
     * @tc.desc Test GetBlanklessInfoWithKey return similarity field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoSimilarityReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetBlanklessInfoSimilarity()).assertLarger(-1);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoLoadingTimeReturn
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_LOADING_TIME_8300
     * @tc.desc Test GetBlanklessInfoWithKey return loadingTime field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoLoadingTimeReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetBlanklessInfoLoadingTime()).assertLarger(-1);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCache
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_CLEAR_BLANKLESS_LOADING_CACHE_8400
     * @tc.desc Test OH_NativeArkWeb_ClearBlanklessLoadingCache
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_ClearBlanklessLoadingCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_ClearBlanklessLoadingCache()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCacheNull
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CLEAR_BLANKLESS_CACHE_NULL_8500
     * @tc.desc Test OH_NativeArkWeb_ClearBlanklessLoadingCache with null keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_ClearBlanklessLoadingCacheNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_ClearBlanklessLoadingCacheNull()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCacheSizeZero
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CLEAR_BLANKLESS_CACHE_SIZE_ZERO_8600
     * @tc.desc Test ClearBlanklessLoadingCache uint32_t size boundary 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_ClearBlanklessLoadingCacheSizeZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_ClearBlanklessLoadingCacheByCase(0)).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCacheSize100
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CLEAR_BLANKLESS_CACHE_SIZE_100_8700
     * @tc.desc Test ClearBlanklessLoadingCache uint32_t size boundary 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_ClearBlanklessLoadingCacheSize100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_ClearBlanklessLoadingCacheByCase(2)).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCacheSize101
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CLEAR_BLANKLESS_CACHE_SIZE_101_8800
     * @tc.desc Test ClearBlanklessLoadingCache uint32_t size boundary 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_ClearBlanklessLoadingCacheSize101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_ClearBlanklessLoadingCacheByCase(3)).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_INVALID_8900
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingWithKey null params
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid(),
          BLANKLESS_ERR_INVALID_ARGS);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityZero
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_ZERO_9000
     * @tc.desc Test SetBlanklessLoadingCacheCapacity returns 0 for capacity=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase(0)).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityMax
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_MAX_9100
     * @tc.desc Test SetBlanklessLoadingCacheCapacity returns 100 for capacity=100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase(1)).assertEqual(100);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityClamp
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_CLAMP_9200
     * @tc.desc Test SetBlanklessLoadingCacheCapacity clamps 101 to 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase(2)).assertEqual(100);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_RETURN_9300
     * @tc.desc Test SetBlanklessLoadingCacheCapacity returns effective value 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn()).assertEqual(50);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacity
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_BLANKLESS_LOADING_CACHE_CAPACITY_9400
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacity()).assertEqual(100);
        done();
      });

  });
}
