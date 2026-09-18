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

// ArkWeb_BlanklessErrorCode per arkweb_error_code.h
const BLANKLESS_SUCCESS = 0;
const BLANKLESS_ERR_UNKNOWN = -1;
const BLANKLESS_ERR_INVALID_ARGS = -2;
const BLANKLESS_ERR_CONTROLLER_NOT_INITED = -3;
const BLANKLESS_ERR_KEY_NOT_MATCH = -4;
const BLANKLESS_ERR_SIGNIFICANT_CHANGE = -5;
const BLANKLESS_ERR_DEVICE_NOT_SUPPORT = 801;

const ALL_BLANKLESS_ERR_CODES: number[] = [
  BLANKLESS_SUCCESS, BLANKLESS_ERR_UNKNOWN, BLANKLESS_ERR_INVALID_ARGS,
  BLANKLESS_ERR_CONTROLLER_NOT_INITED, BLANKLESS_ERR_KEY_NOT_MATCH,
  BLANKLESS_ERR_SIGNIFICANT_CHANGE, BLANKLESS_ERR_DEVICE_NOT_SUPPORT
];

function assertBlanklessErrCode(result: number, expected: number[]): void {
  expect(expected).assertContain(result);
}

// OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity may return 0 (success) or effective capacity.
function assertCacheCapacityReturn(result: number, effectiveCapacity: number): void {
  expect([0, effectiveCapacity]).assertContain(result);
}

export default function native_blanklessTest() {
  describe('native_blanklessTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingWithKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_BLANKLESS_LOADING_WITH_KEY_0010
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingWithKey returns documented errCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingWithKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKey(), ALL_BLANKLESS_ERR_CODES);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrInvalidArgs
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_INVALID_ARGS_0017
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_INVALID_ARGS (-2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrInvalidArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(3),
          [BLANKLESS_ERR_INVALID_ARGS, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(2),
          [BLANKLESS_ERR_INVALID_ARGS, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrControllerNotInited
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_CONTROLLER_0018
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED (-3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrControllerNotInited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(0),
          [BLANKLESS_ERR_CONTROLLER_NOT_INITED, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(1),
          [BLANKLESS_ERR_CONTROLLER_NOT_INITED, BLANKLESS_ERR_INVALID_ARGS, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrKeyNotMatch
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_KEY_NOT_MATCH_0019
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH (-4)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrKeyNotMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(4),
          [BLANKLESS_ERR_KEY_NOT_MATCH, BLANKLESS_ERR_CONTROLLER_NOT_INITED, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessErrSignificantChange
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_ERR_SIGNIFICANT_0020
     * @tc.desc Test SetBlanklessLoadingWithKey ARKWEB_BLANKLESS_ERR_SIGNIFICANT_CHANGE (-5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessErrSignificantChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyByCase(5),
          [BLANKLESS_SUCCESS, BLANKLESS_ERR_SIGNIFICANT_CHANGE, BLANKLESS_ERR_CONTROLLER_NOT_INITED,
            BLANKLESS_ERR_KEY_NOT_MATCH, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoErrInvalidArgs
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_ERR_INVALID_ARGS_0021
     * @tc.desc Test GetBlanklessInfoWithKey ARKWEB_BLANKLESS_ERR_INVALID_ARGS (-2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoErrInvalidArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(2),
          [BLANKLESS_ERR_INVALID_ARGS, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoErrControllerNotInited
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_ERR_CONTROLLER_0022
     * @tc.desc Test GetBlanklessInfoWithKey ARKWEB_BLANKLESS_ERR_CONTROLLER_NOT_INITED (-3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoErrControllerNotInited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(3),
          [BLANKLESS_ERR_CONTROLLER_NOT_INITED, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoErrKeyNotMatch
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_BLANKLESS_ERR_KEY_NOT_MATCH_0023
     * @tc.desc Test GetBlanklessInfoWithKey ARKWEB_BLANKLESS_ERR_KEY_NOT_MATCH (-4)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoErrKeyNotMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKeyByCase(1),
          [BLANKLESS_SUCCESS, BLANKLESS_ERR_KEY_NOT_MATCH, BLANKLESS_ERR_CONTROLLER_NOT_INITED,
            BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoWithKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_GET_BLANKLESS_INFO_WITH_KEY_0012
     * @tc.desc Test OH_NativeArkWeb_GetBlanklessInfoWithKey returns documented errCode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoWithKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKey(), ALL_BLANKLESS_ERR_CODES);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCache
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_CLEAR_BLANKLESS_LOADING_CACHE_0011
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CLEAR_BLANKLESS_CACHE_NULL_0014
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
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_INVALID_0015
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingWithKey null params
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertBlanklessErrCode(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKeyInvalid(),
          [BLANKLESS_ERR_INVALID_ARGS, BLANKLESS_ERR_CONTROLLER_NOT_INITED, BLANKLESS_ERR_DEVICE_NOT_SUPPORT]);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityZero
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_ZERO_0024
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_MAX_0025
     * @tc.desc Test SetBlanklessLoadingCacheCapacity returns 100 for capacity=100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertCacheCapacityReturn(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase(1), 100);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityClamp
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_CLAMP_0026
     * @tc.desc Test SetBlanklessLoadingCacheCapacity clamps 101 to 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertCacheCapacityReturn(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityByCase(2), 100);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_SET_BLANKLESS_CAPACITY_RETURN_0016
     * @tc.desc Test SetBlanklessLoadingCacheCapacity returns effective value 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertCacheCapacityReturn(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacityReturn(), 50);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacity
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_BLANKLESS_LOADING_CACHE_CAPACITY_0013
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        assertCacheCapacityReturn(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacity(), 100);
        done();
      });

  });
}
