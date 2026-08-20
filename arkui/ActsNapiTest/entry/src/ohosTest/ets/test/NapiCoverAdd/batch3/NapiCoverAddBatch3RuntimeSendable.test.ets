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
import { beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import napicoveraddbatch3ndktest from 'libnapicoveraddbatch3ndktest.so';
import Utils from '../../Utils';

const NAPI_GENERIC_FAILURE: number = 9;

@Concurrent
function refThreadsafeFunctionInTaskPool(): number {
  return napicoveraddbatch3ndktest.refThreadsafeFunctionWithCurrentEnv();
}
@Concurrent
function unrefThreadsafeFunctionInTaskPool(): number {
  return napicoveraddbatch3ndktest.unrefThreadsafeFunctionWithCurrentEnv();
}

export default function NapiCoverAddBatch3RuntimeSendableTest() {
  describe('NapiCoverAddBatch3RuntimeSendableTest', () => {

    beforeEach(async () => {
      await Utils.sleep(20);
    });

    /**
     * @tc.name testRefThreadsafeFunctionFromTaskPoolReturnsGenericFailure0005
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_TSFN_REF_CROSS_THREAD_0500
     * @tc.desc Verify napi_ref_threadsafe_function rejects TaskPool env from another ArkTS thread
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testRefThreadsafeFunctionFromTaskPoolReturnsGenericFailure0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        const caseName: string = 'testRefThreadsafeFunctionFromTaskPoolReturnsGenericFailure0005';
        console.info(`${caseName} START`);
        expect(napicoveraddbatch3ndktest.setupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
        let status: number = 0;
        try {
          status = await taskpool.execute(refThreadsafeFunctionInTaskPool) as number;
        } catch (e) {
          console.error('taskpool.execute error occurred');
        }
        expect(status).assertEqual(NAPI_GENERIC_FAILURE);
        expect(napicoveraddbatch3ndktest.cleanupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
        console.info(`${caseName} END`);
        done();
      });

    /**
     * @tc.name testUnrefThreadsafeFunctionFromTaskPoolReturnsGenericFailure0006
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_TSFN_UNREF_CROSS_THREAD_0600
     * @tc.desc Verify napi_unref_threadsafe_function rejects TaskPool env from another ArkTS thread
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testUnrefThreadsafeFunctionFromTaskPoolReturnsGenericFailure0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        const caseName: string = 'testUnrefThreadsafeFunctionFromTaskPoolReturnsGenericFailure0006';
        console.info(`${caseName} START`);
        expect(napicoveraddbatch3ndktest.setupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
        let status: number = 0;
        try {
          status = await taskpool.execute(unrefThreadsafeFunctionInTaskPool) as number;
        } catch (e) {
          console.error('taskpool.execute error occurred');
        }
        expect(status).assertEqual(NAPI_GENERIC_FAILURE);
        expect(napicoveraddbatch3ndktest.cleanupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
        console.info(`${caseName} END`);
        done();
      });

    /**
     * @tc.name testCreateThreadsafeFunctionNullFunc0017
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_TSFN_NULL_FUNC_1700
     * @tc.desc Verify napi_create_threadsafe_function returns napi_invalid_arg when func is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateThreadsafeFunctionNullFunc0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateThreadsafeFunctionNullFunc0017';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createThreadsafeFunctionNullFunc()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testRefThreadsafeFunctionNull0018
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_TSFN_REF_NULL_1800
     * @tc.desc Verify napi_ref_threadsafe_function returns napi_invalid_arg when tsfn is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testRefThreadsafeFunctionNull0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testRefThreadsafeFunctionNull0018';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.refThreadsafeFunctionNull()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsSendableNullParam0019
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_IS_SENDABLE_NULL_1900
     * @tc.desc Verify napi_is_sendable returns napi_invalid_arg when result is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsSendableNullParam0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsSendableNullParam0019';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isSendableNullParam()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateSendableArrayNullResult0020
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_SENDABLE_ARRAY_NULL_2000
     * @tc.desc Verify napi_create_sendable_array returns napi_invalid_arg when result is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateSendableArrayNullResult0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateSendableArrayNullResult0020';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createSendableArrayNullResult()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateSendableArraybufferNullData0021
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_SENDABLE_ARRAYBUFFER_NULL_2100
     * @tc.desc Verify napi_create_sendable_arraybuffer returns napi_invalid_arg when data is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateSendableArraybufferNullData0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateSendableArraybufferNullData0021';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createSendableArraybufferNullData()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testReleaseThreadsafeFunctionNull0022
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_TSFN_RELEASE_NULL_2200
     * @tc.desc Verify napi_release_threadsafe_function returns napi_invalid_arg when tsfn is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testReleaseThreadsafeFunctionNull0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionNull0022';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.releaseThreadsafeFunctionNull()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ========== Batch3 瀹夊叏缁勶細CallsiteInfo (0023-0030) ==========

    /**
     * @tc.name testCreateCallsiteInfoReturnsOkAndNonNull0023
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_CREATE_OK_2300
     * @tc.desc Verify napi_create_callsite_info returns ok and non-null callsite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateCallsiteInfoReturnsOkAndNonNull0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateCallsiteInfoReturnsOkAndNonNull0023';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createCallsiteInfoReturnsOkAndNonNull()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDeleteCallsiteInfoNullReturnsInvalidArg0024
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_DEL_NULL_2400
     * @tc.desc Verify napi_delete_callsite_info returns napi_invalid_arg when callsite is NULL
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDeleteCallsiteInfoNullReturnsInvalidArg0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDeleteCallsiteInfoNullReturnsInvalidArg0024';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.deleteCallsiteInfoNullReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDeleteCallsiteInfoTwiceReturnsError0025
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_DEL_TWICE_2500
     * @tc.desc Verify second napi_delete_callsite_info returns napi_invalid_arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDeleteCallsiteInfoTwiceReturnsError0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDeleteCallsiteInfoTwiceReturnsError0025';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.deleteCallsiteInfoTwiceReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateCallsiteInfoInvalidEnvReturnsError0026
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_INV_ENV_2600
     * @tc.desc Verify napi_create_callsite_info returns napi_invalid_arg with nullptr env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateCallsiteInfoInvalidEnvReturnsError0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateCallsiteInfoInvalidEnvReturnsError0026';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createCallsiteInfoInvalidEnvReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateCallsiteInfoContainsCallstackInfo0027
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_STACK_2700
     * @tc.desc Verify napi_create_callsite_info succeeds (OH SDK opaque handle limitation)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateCallsiteInfoContainsCallstackInfo0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateCallsiteInfoContainsCallstackInfo0027';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createCallsiteInfoContainsCallstackInfo()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateCallsiteInfoComboWithGetProperty0028
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_COMBO_GET_2800
     * @tc.desc Verify callsite_info combo with get_property_with_callsite_info
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateCallsiteInfoComboWithGetProperty0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateCallsiteInfoComboWithGetProperty0028';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createCallsiteInfoComboWithGetProperty()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDeleteCallsiteInfoWhenPendingReturnsPendingException0029
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_DEL_PEND_2900
     * @tc.desc Verify napi_delete_callsite_info returns napi_pending_exception when exception pending
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDeleteCallsiteInfoWhenPendingReturnsPendingException0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDeleteCallsiteInfoWhenPendingReturnsPendingException0029';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.deleteCallsiteInfoWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDeleteCallsiteInfoComboWithErrorHandling0030
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CALLSITE_COMBO_ERR_3000
     * @tc.desc Verify callsite_info combo: create error -> callsite ops -> delete -> throw
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDeleteCallsiteInfoComboWithErrorHandling0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDeleteCallsiteInfoComboWithErrorHandling0030';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.deleteCallsiteInfoComboWithErrorHandling()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ========== Batch3 瀹夊叏缁勶細IsSendable (0031-0035) ==========

    /**
     * @tc.name testIsSendableNullEnvReturnsInvalidArg0031
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISSEND_NULL_ENV_3100
     * @tc.desc Verify napi_is_sendable returns napi_invalid_arg with nullptr env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsSendableNullEnvReturnsInvalidArg0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsSendableNullEnvReturnsInvalidArg0031';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isSendableNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsSendableNullResultReturnsInvalidArg0032
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISSEND_NULL_RES_3200
     * @tc.desc Verify napi_is_sendable returns napi_invalid_arg with nullptr result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsSendableNullResultReturnsInvalidArg0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsSendableNullResultReturnsInvalidArg0032';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isSendableNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsSendableUndefinedReturnsFalse0033
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISSEND_UNDEF_3300
     * @tc.desc Verify napi_is_sendable with undefined returns ok (OH-NAPI-DIFF: SDK may return true)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsSendableUndefinedReturnsFalse0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsSendableUndefinedReturnsFalse0033';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isSendableUndefinedReturnsFalse()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsSendableNullReturnsFalse0034
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISSEND_NULL_3400
     * @tc.desc Verify napi_is_sendable with null returns ok (OH-NAPI-DIFF: SDK may return true)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsSendableNullReturnsFalse0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsSendableNullReturnsFalse0034';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isSendableNullReturnsFalse()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsSendableNumberReturnsFalse0035
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISSEND_NUM_3500
     * @tc.desc Verify napi_is_sendable with number returns ok (OH-NAPI-DIFF: SDK may return true)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsSendableNumberReturnsFalse0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsSendableNumberReturnsFalse0035';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isSendableNumberReturnsFalse()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ========== Batch3 瀹夊叏缁勶細ArkRuntime/Context (0036-0046) ==========

    /**
     * @tc.name testCreateArkRuntimeNullReturnsInvalidArg0036
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ARK_RT_NULL_3600
     * @tc.desc Verify napi_create_ark_runtime returns napi_invalid_arg with nullptr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArkRuntimeNullReturnsInvalidArg0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateArkRuntimeNullReturnsInvalidArg0036';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createArkRuntimeNullReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDestroyArkRuntimeNullReturnsInvalidArg0037
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ARK_DESTROY_NULL_3700
     * @tc.desc Verify napi_destroy_ark_runtime returns napi_invalid_arg with nullptr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDestroyArkRuntimeNullReturnsInvalidArg0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDestroyArkRuntimeNullReturnsInvalidArg0037';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.destroyArkRuntimeNullReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDestroyArkRuntimeTwiceReturnsError0038
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ARK_DESTROY_TWICE_3800
     * @tc.desc Verify second napi_destroy_ark_runtime returns error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDestroyArkRuntimeTwiceReturnsError0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDestroyArkRuntimeTwiceReturnsError0038';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.destroyArkRuntimeTwiceReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateArkContextReturnsOkAndNonNull0039
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CTX_CREATE_OK_3900
     * @tc.desc Verify napi_create_ark_context returns ok and non-null env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArkContextReturnsOkAndNonNull0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateArkContextReturnsOkAndNonNull0039';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createArkContextReturnsOkAndNonNull()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateArkContextWithInvalidEnvReturnsError0040
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CTX_INV_ENV_4000
     * @tc.desc Verify napi_create_ark_context returns napi_invalid_arg with nullptr env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArkContextWithInvalidEnvReturnsError0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateArkContextWithInvalidEnvReturnsError0040';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createArkContextWithInvalidEnvReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDestroyArkContextReturnsOk0041
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CTX_DESTROY_OK_4100
     * @tc.desc Verify napi_destroy_ark_context returns ok
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDestroyArkContextReturnsOk0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDestroyArkContextReturnsOk0041';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.destroyArkContextReturnsOk()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testDestroyArkContextWithInvalidArgsReturnsError0042
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CTX_DESTROY_NULL_4200
     * @tc.desc Verify napi_destroy_ark_context returns napi_invalid_arg with nullptr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testDestroyArkContextWithInvalidArgsReturnsError0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testDestroyArkContextWithInvalidArgsReturnsError0042';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.destroyArkContextWithInvalidArgsReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ===== Batch3 涓闄╃粍锛欳ritical Scope (0047-0053) =====

    /**
     * @tc.name testOpenCriticalScopeNullEnvReturnsInvalidArg0043
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_NULL_ENV_4300
     * @tc.desc Verify napi_open_critical_scope returns napi_invalid_arg with nullptr env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testOpenCriticalScopeNullEnvReturnsInvalidArg0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testOpenCriticalScopeNullEnvReturnsInvalidArg0043';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.openCriticalScopeNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testOpenCriticalScopeNullScopeReturnsInvalidArg0044
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_NULL_SCOPE_4400
     * @tc.desc Verify napi_open_critical_scope returns napi_invalid_arg with nullptr scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testOpenCriticalScopeNullScopeReturnsInvalidArg0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testOpenCriticalScopeNullScopeReturnsInvalidArg0044';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.openCriticalScopeNullScopeReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testOpenCriticalScopeReturnsOkAndValidScope0045
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_OPEN_OK_4500
     * @tc.desc Verify napi_open_critical_scope returns ok and non-null scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testOpenCriticalScopeReturnsOkAndValidScope0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testOpenCriticalScopeReturnsOkAndValidScope0045';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.openCriticalScopeReturnsOkAndValidScope()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCloseCriticalScopeNullScopeReturnsInvalidArg0047
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_CLOSE_NULL_4700
     * @tc.desc Verify napi_close_critical_scope returns napi_invalid_arg with nullptr scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeNullScopeReturnsInvalidArg0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCloseCriticalScopeNullScopeReturnsInvalidArg0047';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.closeCriticalScopeNullScopeReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCloseCriticalScopeReturnsOk0049
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_CLOSE_OK_4900
     * @tc.desc Verify napi_close_critical_scope returns ok after successful open
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeReturnsOk0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCloseCriticalScopeReturnsOk0049';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.closeCriticalScopeReturnsOk()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ===== Batch3 涓闄╃粍锛歄bject Properties (0054-0060) =====

    /**
     * @tc.name testCreateObjectWithPropertiesNullResultReturnsInvalidArg0050
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_OBJPROPS_NULL_RES_5000
     * @tc.desc Verify napi_create_object_with_properties returns napi_invalid_arg with nullptr result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateObjectWithPropertiesNullResultReturnsInvalidArg0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateObjectWithPropertiesNullResultReturnsInvalidArg0050';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createObjectWithPropertiesNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateObjectWithNamedPropertiesNullResultReturnsInvalidArg0051
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_NAMEDPROPS_NULL_RES_5100
     * @tc.desc Verify napi_create_object_with_named_properties returns napi_invalid_arg with nullptr result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateObjectWithNamedPropertiesNullResultReturnsInvalidArg0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesNullResultReturnsInvalidArg0051';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.
      createObjectWithNamedPropertiesNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateSendableObjectWithPropertiesNullResultReturnsInvalidArg0052
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_SENDPROPS_NULL_RES_5200
     * @tc.desc Verify napi_create_sendable_object_with_properties returns napi_invalid_arg with nullptr result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateSendableObjectWithPropertiesNullResultReturnsInvalidArg0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesNullResultReturnsInvalidArg0052';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.
      createSendableObjectWithPropertiesNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsTypedArrayNullEnvReturnsInvalidArg0053
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISTYPEDARR_NULL_ENV_5300
     * @tc.desc Verify napi_is_typedarray returns napi_invalid_arg with nullptr env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsTypedArrayNullEnvReturnsInvalidArg0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsTypedArrayNullEnvReturnsInvalidArg0053';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isTypedArrayNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testIsTypedArrayNullResultReturnsInvalidArg0054
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_ISTYPEDARR_NULL_RES_5400
     * @tc.desc Verify napi_is_typedarray returns napi_invalid_arg with nullptr result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsTypedArrayNullResultReturnsInvalidArg0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testIsTypedArrayNullResultReturnsInvalidArg0054';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.isTypedArrayNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ===== Batch3 浣庨闄╃粍A锛欳riticalScopeUtf16Buffer (0061-0068) =====

    /**
     * @tc.name testCriticalScopeUtf16BufferNullEnvReturnsInvalidArg0055
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_NULL_ENV_5500
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns napi_invalid_arg with nullptr env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferNullEnvReturnsInvalidArg0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferNullEnvReturnsInvalidArg0055';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferNullDataReturnsInvalidArg0056
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_NULL_DATA_5600
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns napi_invalid_arg with nullptr data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferNullDataReturnsInvalidArg0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferNullDataReturnsInvalidArg0056';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferNullDataReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferNullLengthReturnsInvalidArg0057
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_NULL_LEN_5700
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns napi_invalid_arg with nullptr length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferNullLengthReturnsInvalidArg0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferNullLengthReturnsInvalidArg0057';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferNullLengthReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferNullParamsReturnInvalidArg0058
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_NULL_PARAMS_5800
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns napi_invalid_arg with nullptr value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferNullParamsReturnInvalidArg0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferNullParamsReturnInvalidArg0058';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferNullParamsReturnInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferNumberReturnsStringExpected0059
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_NUMBER_5900
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns napi_string_expected for number input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferNumberReturnsStringExpected0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferNumberReturnsStringExpected0059';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferNumberReturnsStringExpected()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferReturnValueVerification0060
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_RETVAL_6000
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns correct buffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferReturnValueVerification0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferReturnValueVerification0060';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferReturnValueVerification()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferWhenPendingReturnsPendingException0061
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_PENDING_6100
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns pending_exception when error pending
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferWhenPendingReturnsPendingException0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferWhenPendingReturnsPendingException0061';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ===== Batch3 浣庨闄╃粍B锛歂ull鍙傛暟/杈圭晫鍊?(0069-0075) =====

    /**
     * @tc.name testQueueAsyncWorkWithQosNullWorkReturnsInvalidArg0062
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_QOS_NULL_WORK_6200
     * @tc.desc Verify napi_queue_async_work_with_qos returns napi_invalid_arg with nullptr work
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testQueueAsyncWorkWithQosNullWorkReturnsInvalidArg0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testQueueAsyncWorkWithQosNullWorkReturnsInvalidArg0062';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.queueAsyncWorkWithQosNullWorkReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testRefThreadsafeFunctionNullTsfnReturnsInvalidArg0063
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_REF_NULL_TSFN_6300
     * @tc.desc Verify napi_ref_threadsafe_function returns napi_invalid_arg with nullptr tsfn
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testRefThreadsafeFunctionNullTsfnReturnsInvalidArg0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testRefThreadsafeFunctionNullTsfnReturnsInvalidArg0063';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.refThreadsafeFunctionNullTsfnReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testReleaseThreadsafeFunctionNullTsfnReturnsInvalidArg0064
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_RELEASE_NULL_TSFN_6400
     * @tc.desc Verify napi_release_threadsafe_function returns napi_invalid_arg with nullptr tsfn
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testReleaseThreadsafeFunctionNullTsfnReturnsInvalidArg0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionNullTsfnReturnsInvalidArg0064';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.releaseThreadsafeFunctionNullTsfnReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testUnrefThreadsafeFunctionNullTsfnReturnsInvalidArg0065
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UNREF_NULL_TSFN_6500
     * @tc.desc Verify napi_unref_threadsafe_function returns napi_invalid_arg with nullptr tsfn
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testUnrefThreadsafeFunctionNullTsfnReturnsInvalidArg0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionNullTsfnReturnsInvalidArg0065';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.unrefThreadsafeFunctionNullTsfnReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateSendableArrayWithLengthZero0066
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_SENDARR_LEN_ZERO_6600
     * @tc.desc Verify napi_create_sendable_array_with_length returns ok with length 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateSendableArrayWithLengthZero0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthZero0066';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createSendableArrayWithLengthZero()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCreateSendableTypedArrayNullResultReturnsInvalidArg0067
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_SENDTYPEDARR_NULL_6700
     * @tc.desc Verify napi_create_sendable_typedarray returns napi_invalid_arg with nullptr result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateSendableTypedArrayNullResultReturnsInvalidArg0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCreateSendableTypedArrayNullResultReturnsInvalidArg0067';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.createSendableTypedArrayNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testUnrefThreadsafeFunctionReturnsOk0068
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UNREF_OK_6800
     * @tc.desc Verify napi_unref_threadsafe_function returns napi_ok
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testUnrefThreadsafeFunctionReturnsOk0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionReturnsOk0068';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.unrefThreadsafeFunctionReturnsOk()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ===== Batch3 涓闄╃粍C锛歐henPending/Combo (0076-0080) =====

    /**
     * @tc.name testRefThreadsafeFunctionComboWithCreateAndRelease0069
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_REF_COMBO_6900
     * @tc.desc Verify ref_threadsafe_function combo with create and release
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testRefThreadsafeFunctionComboWithCreateAndRelease0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testRefThreadsafeFunctionComboWithCreateAndRelease0069';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.refThreadsafeFunctionComboWithCreateAndRelease()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testReleaseThreadsafeFunctionComboWithRefAndCall0070
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_RELEASE_COMBO_7000
     * @tc.desc Verify release_threadsafe_function combo with ref and call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testReleaseThreadsafeFunctionComboWithRefAndCall0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionComboWithRefAndCall0070';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.releaseThreadsafeFunctionComboWithRefAndCall()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testThrowBusinessErrorComboWithCreateError0071
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_BIZERR_COMBO_7100
     * @tc.desc Verify napi_throw_business_error combo with napi_create_error equivalence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testThrowBusinessErrorComboWithCreateError0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testThrowBusinessErrorComboWithCreateError0071';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.throwBusinessErrorComboWithCreateError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ===== Batch3 閬楁紡琛ュ厖锛?涓己澶辨祴璇?(0081-0084) =====
    /**
     * @tc.name testCriticalScopeUtf16BufferEfficientAccess0072
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_EFFICIENT_7200
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns correct data within scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferEfficientAccess0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferEfficientAccess0072';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferEfficientAccess()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferOutsideScopeReturnsError0073
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_OUTSIDE_7300
     * @tc.desc Verify napi_get_buffer_string_utf16_in_critical_scope returns napi_generic_failure outside scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferOutsideScopeReturnsError0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferOutsideScopeReturnsError0073';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferOutsideScopeReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCriticalScopeUtf16BufferComboWithGetValue0074
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_UTF16_COMBO_7400
     * @tc.desc Verify combo of get_value_string_utf16 and get_buffer_string_utf16_in_critical_scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCriticalScopeUtf16BufferComboWithGetValue0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCriticalScopeUtf16BufferComboWithGetValue0074';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.criticalScopeUtf16BufferComboWithGetValue()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    // ========== napi_close_critical_scope 琛ュ厖鐢ㄤ緥 ==========

    /**
     * @tc.name testCloseCriticalScopeNullEnvReturnsInvalidArg0075
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_CLOSE_NULL_ENV_7500
     * @tc.desc Verify napi_close_critical_scope returns napi_invalid_arg with NULL env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeNullEnvReturnsInvalidArg0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCloseCriticalScopeNullEnvReturnsInvalidArg0075';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.closeCriticalScopeNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name testCloseCriticalScopeWithoutOpenReturnsError0076
     * @tc.number SUB_THIRDPARTY_NAPI_COVER_ADD_BATCH3_CRITICAL_CLOSE_NO_OPEN_7600
     * @tc.desc Verify napi_close_critical_scope returns error without prior open
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeWithoutOpenReturnsError0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName: string = 'testCloseCriticalScopeWithoutOpenReturnsError0076';
      console.info(`${caseName} START`);
      expect(napicoveraddbatch3ndktest.closeCriticalScopeWithoutOpenReturnsError()).assertEqual(1);
      console.info(`${caseName} END`);
    });

  });
}
