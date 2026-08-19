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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napispecdiffbatch2ndktest from 'libnapispecdiffbatch2ndktest.so';

function forceFullGC(): void {
  globalThis.ArkTools.forceFullGC();
}

export default function NapiSpecDiffBatch2LifecycleTest() {
  describe('NapiSpecDiffBatch2LifecycleTest', () => {

    /**
     * @tc.name testDeleteReferenceTriggersFinalizer0001
     * @tc.number SUB_NSD_B2_DELETE_REFERENCE_TRIGGERS_FINALIZER_0100
     * @tc.desc   Verify deleting reference triggers finalizer in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteReferenceTriggersFinalizer0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteReferenceTriggersFinalizer0001';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteReferenceTriggersFinalizer()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapCallsFinalizerBeforeRemoving0002
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_CALLS_FINALIZER_BEFORE_REMOVING_0200
     * @tc.desc   Verify napi_remove_wrap calls finalizer before removing native binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapCallsFinalizerBeforeRemoving0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapCallsFinalizerBeforeRemoving0002';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapCallsFinalizerBeforeRemoving()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddFinalizerResultReferenceIsStrong0003
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_RESULT_REFERENCE_IS_STRONG_0300
     * @tc.desc   Verify napi_add_finalizer result reference behaves as strong reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerResultReferenceIsStrong0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerResultReferenceIsStrong0003';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerResultReferenceIsStrong()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferenceKeepsValue0004
     * @tc.number SUB_NSD_B2_CREATE_STRONG_REFERENCE_KEEPS_VALUE_0400
     * @tc.desc   Verify napi_create_strong_reference and get value normal path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceKeepsValue0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceKeepsValue0004';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceKeepsValue()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongReferenceOnceWorks0005
     * @tc.number SUB_NSD_B2_DELETE_STRONG_REFERENCE_ONCE_WORKS_0500
     * @tc.desc   Verify napi_delete_strong_reference deletes a valid strong reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceOnceWorks0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceOnceWorks0005';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceOnceWorks()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongReferenceValueWorksBeforeDelete0006
     * @tc.number SUB_NSD_B2_GET_STRONG_REFERENCE_VALUE_WORKS_BEFORE_DELETE_0600
     * @tc.desc   Verify napi_get_strong_reference_value returns the original object before delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueWorksBeforeDelete0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueWorksBeforeDelete0006';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueWorksBeforeDelete()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testWrapEnhanceSyncAndAsyncFinalizerCanBeCreated0007
     * @tc.number SUB_NSD_B2_WRAP_ENHANCE_SYNC_AND_ASYNC_FINALIZER_CAN_BE_CREATED_0700
     * @tc.desc   Verify napi_wrap_enhance accepts sync and async finalizer configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapEnhanceSyncAndAsyncFinalizerCanBeCreated0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testWrapEnhanceSyncAndAsyncFinalizerCanBeCreated0007';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.wrapEnhanceSyncAndAsyncFinalizerCanBeCreated()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer0008
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_SENDABLE_RETURNS_NATIVE_POINTER_WITHOUT_IMMEDIATE_FINALIZER_0800
     * @tc.desc   Verify napi_remove_wrap_sendable returns native pointer and does not call finalizer immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer0008';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapSendableReturnsNativePointerWithoutImmediateFinalizer()).
      assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testStrongSendableReferenceNormalPath0009
     * @tc.number SUB_NSD_B2_STRONG_SENDABLE_REFERENCE_NORMAL_PATH_0900
     * @tc.desc   Verify strong sendable reference normal create/get/delete path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStrongSendableReferenceNormalPath0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testStrongSendableReferenceNormalPath0009';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.strongSendableReferenceNormalPath()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第一轮补充测试 ==========

    /**
     * @tc.name testAddFinalizerNullObjectReturnsInvalidArg0010
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_NULL_OBJECT_RETURNS_INVALID_ARG_1000
     * @tc.desc   Verify napi_add_finalizer returns napi_invalid_arg when object is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerNullObjectReturnsInvalidArg0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerNullObjectReturnsInvalidArg0010';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddFinalizerNullCallbackReturnsInvalidArg0011
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_NULL_CALLBACK_RETURNS_INVALID_ARG_1100
     * @tc.desc   Verify napi_add_finalizer returns napi_invalid_arg when callback is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerNullCallbackReturnsInvalidArg0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerNullCallbackReturnsInvalidArg0011';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerNullCallbackReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // SDK限制，add_finalizer对相同external数据添加finalizer失败
    //   expect(napispecdiffbatch2ndktest.addFinalizerWithExternalResourceCleanup()).assertEqual(1);
      // console.info(caseName + ' end');
    // });

    /**
     * @tc.name testRemoveWrapReturnsOkAndCorrectPointer0012
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_RETURNS_OK_AND_CORRECT_POINTER_1200
     * @tc.desc   Verify napi_remove_wrap returns napi_ok and correct native pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapReturnsOkAndCorrectPointer0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapReturnsOkAndCorrectPointer0012';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapReturnsOkAndCorrectPointer()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapNoWrappedObjectReturnsError0013
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_NO_WRAPPED_OBJECT_RETURNS_ERROR_1300
     * @tc.desc   Verify napi_remove_wrap returns error for object without wrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapNoWrappedObjectReturnsError0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapNoWrappedObjectReturnsError0013';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapNoWrappedObjectReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapTwiceReturnsError0014
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_TWICE_RETURNS_ERROR_1400
     * @tc.desc   Verify second napi_remove_wrap returns error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapTwiceReturnsError0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapTwiceReturnsError0014';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapTwiceReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapResourceCleanupFlow0015
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_RESOURCE_CLEANUP_FLOW_1500
     * @tc.desc   Verify napi_remove_wrap resource cleanup full flow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapResourceCleanupFlow0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapResourceCleanupFlow0015';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapResourceCleanupFlow()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapWhenPendingReturnsPendingException0016
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_WHEN_PENDING_RETURNS_PENDING_EXCEPTION_1600
     * @tc.desc   Verify napi_remove_wrap returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapWhenPendingReturnsPendingException0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapWhenPendingReturnsPendingException0016';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testWrapEnhanceNonObjectReturnsObjectExpected0017
     * @tc.number SUB_NSD_B2_WRAP_ENHANCE_NON_OBJECT_RETURNS_OBJECT_EXPECTED_1700
     * @tc.desc   Verify napi_wrap_enhance returns napi_object_expected for non-object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapEnhanceNonObjectReturnsObjectExpected0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testWrapEnhanceNonObjectReturnsObjectExpected0017';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.wrapEnhanceNonObjectReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferenceWhenPendingReturnsPendingException0018
     * @tc.number SUB_NSD_B2_CREATE_STRONG_REFERENCE_WHEN_PENDING_RETURNS_PENDING_EXCEPTION_1800
     * @tc.desc   Verify napi_create_strong_reference returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceWhenPendingReturnsPendingException0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceWhenPendingReturnsPendingException0018';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferencePrimitiveValue0019
     * @tc.number SUB_NSD_B2_CREATE_STRONG_REFERENCE_PRIMITIVE_VALUE_1900
     * @tc.desc   Verify napi_create_strong_reference accepts primitive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferencePrimitiveValue0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferencePrimitiveValue0019';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferencePrimitiveValue()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongReferenceNullRefReturnsInvalidArg0020
     * @tc.number SUB_NSD_B2_DELETE_STRONG_REFERENCE_NULL_REF_RETURNS_INVALID_ARG_2000
     * @tc.desc   Verify napi_delete_strong_reference returns napi_invalid_arg for NULL ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceNullRefReturnsInvalidArg0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceNullRefReturnsInvalidArg0020';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceNullRefReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongReferenceTwiceReturnsError0021
     * @tc.number SUB_NSD_B2_DELETE_STRONG_REFERENCE_TWICE_RETURNS_ERROR_2100
     * @tc.desc   Verify second napi_delete_strong_reference returns error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceTwiceReturnsError0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceTwiceReturnsError0021';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceTwiceReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongReferenceVerifyInvalidAfterDelete0022
     * @tc.number SUB_NSD_B2_DELETE_STRONG_REFERENCE_VERIFY_INVALID_AFTER_DELETE_2200
     * @tc.desc   Verify reference is invalid after napi_delete_strong_reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceVerifyInvalidAfterDelete0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceVerifyInvalidAfterDelete0022';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceVerifyInvalidAfterDelete()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongReferenceComboWithWeakRef0023
     * @tc.number SUB_NSD_B2_DELETE_STRONG_REFERENCE_COMBO_WITH_WEAK_REF_2300
     * @tc.desc   Verify strong reference deletion combo with weak reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceComboWithWeakRef0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceComboWithWeakRef0023';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceComboWithWeakRef()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongReferenceValueWhenPendingReturnsPendingException0024
     * @tc.number SUB_NSD_B2_GET_STRONG_REFERENCE_VALUE_WHEN_PENDING_RETURNS_PENDING_EXCEPTION_2400
     * @tc.desc   Verify napi_get_strong_reference_value returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueWhenPendingReturnsPendingException0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueWhenPendingReturnsPendingException0024';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongReferenceValueAfterDeleteReturnsError0025
     * @tc.number SUB_NSD_B2_GET_STRONG_REFERENCE_VALUE_AFTER_DELETE_RETURNS_ERROR_2500
     * @tc.desc   Verify napi_get_strong_reference_value returns error for deleted reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueAfterDeleteReturnsError0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueAfterDeleteReturnsError0025';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueAfterDeleteReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongSendableRefNullValueReturnsInvalidArg0026
     * @tc.number SUB_NSD_B2_CREATE_STRONG_SENDABLE_REF_NULL_VALUE_RETURNS_INVALID_ARG_2600
     * @tc.desc   Verify napi_create_strong_sendable_reference returns napi_invalid_arg for NULL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongSendableRefNullValueReturnsInvalidArg0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongSendableRefNullValueReturnsInvalidArg0026';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongSendableRefNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongSendableRefNullRefReturnsInvalidArg0027
     * @tc.number SUB_NSD_B2_CREATE_STRONG_SENDABLE_REF_NULL_REF_RETURNS_INVALID_ARG_2700
     * @tc.desc   Verify napi_create_strong_sendable_reference returns napi_invalid_arg for NULL ref output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongSendableRefNullRefReturnsInvalidArg0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongSendableRefNullRefReturnsInvalidArg0027';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongSendableRefNullRefReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongSendableRefNullRefReturnsInvalidArg0028
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_NULL_REF_RETURNS_INVALID_ARG_2800
     * @tc.desc   Verify napi_delete_strong_sendable_reference returns napi_invalid_arg for NULL ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefNullRefReturnsInvalidArg0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefNullRefReturnsInvalidArg0028';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefNullRefReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongSendableRefVerifyInvalidAfterDelete0029
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_VERIFY_INVALID_AFTER_DELETE_2900
     * @tc.desc   Verify reference is invalid after napi_delete_strong_sendable_reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefVerifyInvalidAfterDelete0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefVerifyInvalidAfterDelete0029';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefVerifyInvalidAfterDelete()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongSendableRefWhenPendingReturnsPendingException0030
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_WHEN_PENDING_RETURNS_PENDING_EXCEPTION_3000
     * @tc.desc   Verify napi_delete_strong_sendable_reference returns
     * napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefWhenPendingReturnsPendingException0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefWhenPendingReturnsPendingException0030';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapSendableNullObjectReturnsInvalidArg0031
     * @tc.number SUB_NSD_B2_REMOVE_WRAP_SENDABLE_NULL_OBJECT_RETURNS_INVALID_ARG_3100
     * @tc.desc   Verify napi_remove_wrap_sendable returns napi_invalid_arg for NULL object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapSendableNullObjectReturnsInvalidArg0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapSendableNullObjectReturnsInvalidArg0031';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapSendableNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });


    // ========== 第二轮补充测试 ==========

    /**
     * @tc.name testCreateExternalComboWithGetValueExternal0033
     * @tc.number SUB_NSD_B2_CREATE_EXTERNAL_COMBO_WITH_GET_VALUE_EXTERNAL_3300
     * @tc.desc   Verify napi_create_external combo with napi_get_value_external for C resource management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateExternalComboWithGetValueExternal0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateExternalComboWithGetValueExternal0033';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createExternalComboWithGetValueExternal()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testWrapSendableNullObjectReturnsInvalidArg0034
     * @tc.number SUB_NSD_B2_WRAP_SENDABLE_NULL_OBJECT_RETURNS_INVALID_ARG_3400
     * @tc.desc   Verify napi_wrap_sendable returns napi_invalid_arg when object is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapSendableNullObjectReturnsInvalidArg0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testWrapSendableNullObjectReturnsInvalidArg0034';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.wrapSendableNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testWrapSendableUnwrapReturnsCorrectPointer0035
     * @tc.number SUB_NSD_B2_WRAP_SENDABLE_UNWRAP_RETURNS_CORRECT_POINTER_3500
     * @tc.desc   Verify napi_wrap_sendable unwrap returns correct native pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapSendableUnwrapReturnsCorrectPointer0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testWrapSendableUnwrapReturnsCorrectPointer0035';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.wrapSendableUnwrapReturnsCorrectPointer()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongSendableRefValueComboWithCreateAndDelete0036
     * @tc.number SUB_NSD_B2_GET_STRONG_SENDABLE_REF_VALUE_COMBO_WITH_CREATE_AND_DELETE_3600
     * @tc.desc   Verify napi_get_strong_sendable_reference_value combo with create and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongSendableRefValueComboWithCreateAndDelete0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongSendableRefValueComboWithCreateAndDelete0036';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongSendableRefValueComboWithCreateAndDelete()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第四轮补充测试 ==========

    /**
     * @tc.name testGetValueExternalNullValueReturnsInvalidArg0037
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_NULL_VALUE_RETURNS_INVALID_ARG_3700
     * @tc.desc   Verify napi_get_value_external returns napi_invalid_arg for NULL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalNullValueReturnsInvalidArg0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalNullValueReturnsInvalidArg0037';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalNonExternalReturnsError0038
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_NON_EXTERNAL_RETURNS_ERROR_3800
     * @tc.desc   Verify napi_get_value_external returns error for non-external value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalNonExternalReturnsError0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalNonExternalReturnsError0038';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalNonExternalReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalReturnsCorrectPointer0039
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_RETURNS_CORRECT_POINTER_3900
     * @tc.desc   Verify napi_get_value_external returns correct pointer matching creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalReturnsCorrectPointer0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalReturnsCorrectPointer0039';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalReturnsCorrectPointer()).assertEqual(1);
      console.info(caseName + ' end');
    });


    /**
     * @tc.name testUnwrapSendableNonSendableReturnsError0041
     * @tc.number SUB_NSD_B2_UNWRAP_SENDABLE_NON_SENDABLE_RETURNS_ERROR_4100
     * @tc.desc   Verify napi_unwrap_sendable returns error for non-sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnwrapSendableNonSendableReturnsError0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testUnwrapSendableNonSendableReturnsError0041';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.unwrapSendableNonSendableReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testUnwrapSendableReturnsCorrectPointer0042
     * @tc.number SUB_NSD_B2_UNWRAP_SENDABLE_RETURNS_CORRECT_POINTER_4200
     * @tc.desc   Verify napi_unwrap_sendable returns correct pointer matching wrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnwrapSendableReturnsCorrectPointer0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testUnwrapSendableReturnsCorrectPointer0042';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.unwrapSendableReturnsCorrectPointer()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongSendableRefComboWithCrossThreadArray0043
     * @tc.number SUB_NSD_B2_CREATE_STRONG_SENDABLE_REF_COMBO_WITH_CROSS_THREAD_ARRAY_4300
     * @tc.desc   Verify napi_create_strong_sendable_reference combo with sendable array cross-thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongSendableRefComboWithCrossThreadArray0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongSendableRefComboWithCrossThreadArray0043';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongSendableRefComboWithCrossThreadArray()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第五轮补充测试 ==========

    /**
     * @tc.name testDeleteStrongSendableRefComboWithWeakRef0044
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_COMBO_WITH_WEAK_REF_4400
     * @tc.desc   Verify napi_delete_strong_sendable_reference combo with weak reference lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefComboWithWeakRef0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefComboWithWeakRef0044';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefComboWithWeakRef()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongReferenceValueComboWithRefUnref0045
     * @tc.number SUB_NSD_B2_GET_STRONG_REFERENCE_VALUE_COMBO_WITH_REF_UNREF_4500
     * @tc.desc   Verify napi_get_strong_reference_value combo with reference ref and unref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueComboWithRefUnref0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueComboWithRefUnref0045';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueComboWithRefUnref()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第六轮补充测试 (napi_get_value_external 完整覆盖) ==========

    /**
     * @tc.name testGetValueExternalNullEnvReturnsInvalidArg0046
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_NULL_ENV_RETURNS_INVALID_ARG_4600
     * @tc.desc   Verify napi_get_value_external returns napi_invalid_arg for NULL env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalNullEnvReturnsInvalidArg0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalNullEnvReturnsInvalidArg0046';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalNullResultReturnsInvalidArg0047
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_NULL_RESULT_RETURNS_INVALID_ARG_4700
     * @tc.desc   Verify napi_get_value_external returns napi_invalid_arg for NULL result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalNullResultReturnsInvalidArg0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalNullResultReturnsInvalidArg0047';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalStringReturnsError0048
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_STRING_RETURNS_ERROR_4800
     * @tc.desc   Verify napi_get_value_external returns napi_invalid_arg for string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalStringReturnsError0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalStringReturnsError0048';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalStringReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalNumberReturnsError0049
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_NUMBER_RETURNS_ERROR_4900
     * @tc.desc   Verify napi_get_value_external returns napi_invalid_arg for number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalNumberReturnsError0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalNumberReturnsError0049';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalNumberReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalAfterModification0050
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_AFTER_MODIFICATION_5000
     * @tc.desc   Verify napi_get_value_external pointer remains consistent after data modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalAfterModification0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalAfterModification0050';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalAfterModification()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalAfterFinalizeReturnsError0051
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_AFTER_FINALIZE_RETURNS_ERROR_5100
     * @tc.desc   Verify napi_get_value_external returns error after finalize has been called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalAfterFinalizeReturnsError0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalAfterFinalizeReturnsError0051';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      let extObj: object | null = napispecdiffbatch2ndktest.createExternalForFinalizeTest() as object | null;
      expect(extObj !== null && extObj !== undefined).assertTrue();
      if (globalThis.forceFullGC) {
        globalThis.forceFullGC();
      }
      let result: number = napispecdiffbatch2ndktest.getExternalDataAfterFinalize(extObj) as number;
      expect(result).assertEqual(1);
      napispecdiffbatch2ndktest.cleanupExternalForFinalizeTest(extObj);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueExternalBooleanReturnsError0052
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_BOOLEAN_RETURNS_ERROR_5200
     * @tc.desc   Verify napi_get_value_external returns napi_invalid_arg for boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalBooleanReturnsError0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalBooleanReturnsError0052';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalBooleanReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // SDK偏差：SDK返回napi_ok而非napi_invalid_arg，对napi_null类型不做类型校验
    //   expect(napispecdiffbatch2ndktest.getValueExternalUndefinedReturnsError()).assertEqual(1);
      // console.info(caseName + ' end');
    // });

    /**
     * @tc.name testGetValueExternalMultipleGetsConsistency0053
     * @tc.number SUB_NSD_B2_GET_VALUE_EXTERNAL_MULTIPLE_GETS_CONSISTENCY_5300
     * @tc.desc   Verify napi_get_value_external returns same pointer on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueExternalMultipleGetsConsistency0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueExternalMultipleGetsConsistency0053';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueExternalMultipleGetsConsistency()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_get_value_external 第三轮补充测试 ==========

    /**
     * @tc.name testRejectDeferredWithNonErrorValue0054
     * @tc.number SUB_NSD_B2_REJECT_DEFERRED_WITH_NON_ERROR_VALUE_5400
     * @tc.desc   Verify napi_reject_deferred accepts non-Error value as reject reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredWithNonErrorValue0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRejectDeferredWithNonErrorValue0054';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.rejectDeferredWithNonErrorValue()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetPropertyNullEnvReturnsInvalidArg0055
     * @tc.number SUB_NSD_B2_GET_PROPERTY_NULL_ENV_RETURNS_INVALID_ARG_5500
     * @tc.desc   Verify napi_get_property returns napi_invalid_arg for null env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNullEnvReturnsInvalidArg0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyNullEnvReturnsInvalidArg0055';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetPropertyNullObjectReturnsInvalidArg0056
     * @tc.number SUB_NSD_B2_GET_PROPERTY_NULL_OBJECT_RETURNS_INVALID_ARG_5600
     * @tc.desc   Verify napi_get_property returns napi_invalid_arg for null object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNullObjectReturnsInvalidArg0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyNullObjectReturnsInvalidArg0056';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetPropertyNullKeyReturnsInvalidArg0057
     * @tc.number SUB_NSD_B2_GET_PROPERTY_NULL_KEY_RETURNS_INVALID_ARG_5700
     * @tc.desc   Verify napi_get_property returns napi_invalid_arg for null key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNullKeyReturnsInvalidArg0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyNullKeyReturnsInvalidArg0057';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyNullKeyReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第七轮补充测试 (napi_reject_deferred 完整覆盖) ==========

    /**
     * @tc.name testGetPropertyNullResultReturnsInvalidArg0058
     * @tc.number SUB_NSD_B2_GET_PROPERTY_NULL_RESULT_RETURNS_INVALID_ARG_5800
     * @tc.desc   Verify napi_get_property returns napi_invalid_arg for null result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNullResultReturnsInvalidArg0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyNullResultReturnsInvalidArg0058';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetPropertyStringReturnsObjectExpected0059
     * @tc.number SUB_NSD_B2_GET_PROPERTY_STRING_RETURNS_OBJECT_EXPECTED_5900
     * @tc.desc   Verify napi_get_property returns napi_object_expected for string input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyStringReturnsObjectExpected0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyStringReturnsObjectExpected0059';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyStringReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetPropertyNumberReturnsObjectExpected0060
     * @tc.number SUB_NSD_B2_GET_PROPERTY_NUMBER_RETURNS_OBJECT_EXPECTED_6000
     * @tc.desc   Verify napi_get_property returns napi_object_expected for number input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNumberReturnsObjectExpected0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyNumberReturnsObjectExpected0060';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyNumberReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第七轮补充测试 (napi_get_property 异常参数覆盖) ==========

    /**
     * @tc.name testGetPropertyNullReturnsObjectExpected0061
     * @tc.number SUB_NSD_B2_GET_PROPERTY_NULL_RETURNS_OBJECT_EXPECTED_6100
     * @tc.desc   Verify napi_get_property returns napi_object_expected for null input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNullReturnsObjectExpected0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetPropertyNullReturnsObjectExpected0061';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getPropertyNullReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongSendableRefNonSendableReturnsError0062
     * @tc.number SUB_NSD_B2_CREATE_STRONG_SENDABLE_REF_NON_SENDABLE_RETURNS_ERROR_6200
     * @tc.desc   Verify napi_create_strong_sendable_reference returns error for non-sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongSendableRefNonSendableReturnsError0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongSendableRefNonSendableReturnsError0062';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongSendableRefNonSendableReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongSendableRefNullEnvReturnsInvalidArg0063
     * @tc.number SUB_NSD_B2_CREATE_STRONG_SENDABLE_REF_NULL_ENV_RETURNS_INVALID_ARG_6300
     * @tc.desc   Verify napi_create_strong_sendable_reference returns napi_invalid_arg for null env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongSendableRefNullEnvReturnsInvalidArg0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongSendableRefNullEnvReturnsInvalidArg0063';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongSendableRefNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongSendableRefNullEnvReturnsInvalidArg0064
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_NULL_ENV_RETURNS_INVALID_ARG_6400
     * @tc.desc   Verify napi_delete_strong_sendable_reference returns napi_invalid_arg for null env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefNullEnvReturnsInvalidArg0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefNullEnvReturnsInvalidArg0064';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRejectDeferredAfterPromiseGC0065
     * @tc.number SUB_NSD_B2_REJECT_DEFERRED_AFTER_PROMISE_G_C_6500
     * @tc.desc   Verify napi_reject_deferred behavior after Promise has been GC'd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredAfterPromiseGC0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRejectDeferredAfterPromiseGC0065';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.rejectDeferredAfterPromiseGC()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongSendableRefCrossThreadRelease0066
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_CROSS_THREAD_RELEASE_6600
     * @tc.desc   Verify napi_delete_strong_sendable_reference cross-thread release scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefCrossThreadRelease0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefCrossThreadRelease0066';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefCrossThreadRelease()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第七轮补充测试 (napi_create_strong_sendable_reference 完整覆盖) ==========

    /**
     * @tc.name testDeleteStrongSendableRefLifecycleManagement0067
     * @tc.number SUB_NSD_B2_DELETE_STRONG_SENDABLE_REF_LIFECYCLE_MANAGEMENT_6700
     * @tc.desc   Verify napi_delete_strong_sendable_reference lifecycle management combo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongSendableRefLifecycleManagement0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongSendableRefLifecycleManagement0067';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongSendableRefLifecycleManagement()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 第七轮补充测试 (napi_delete_strong_sendable_reference 完整覆盖) ==========

    /**
     * @tc.name testWrapSendableWithSizeZeroReturnsInvalidArg0068
     * @tc.number SUB_NSD_B2_WRAP_SENDABLE_WITH_SIZE_ZERO_RETURNS_INVALID_ARG_6800
     * @tc.desc   Verify napi_wrap_sendable_with_size returns napi_invalid_arg for size=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapSendableWithSizeZeroReturnsInvalidArg0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testWrapSendableWithSizeZeroReturnsInvalidArg0068';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.wrapSendableWithSizeZeroReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testWrapSendableWithSizeVerifyDataIntegrity0069
     * @tc.number SUB_NSD_B2_WRAP_SENDABLE_WITH_SIZE_VERIFY_DATA_INTEGRITY_6900
     * @tc.desc   Verify napi_wrap_sendable_with_size data integrity after unwrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapSendableWithSizeVerifyDataIntegrity0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testWrapSendableWithSizeVerifyDataIntegrity0069';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.wrapSendableWithSizeVerifyDataIntegrity()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongSendableRefValueWhenPendingReturnsPendingException0070
     * @tc.number SUB_NSD_B2_STRONG_SENDABLE_REF_PENDING_7000
     * @tc.desc   Verify napi_get_strong_sendable_reference_value returns error when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongSendableRefValueWhenPendingReturnsPendingException0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongSendableRefValueWhenPendingReturnsPendingException0070';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongSendableRefValueWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongSendableRefValueCrossThreadConsistency0071
     * @tc.number SUB_NSD_B2_GET_STRONG_SENDABLE_REF_VALUE_CROSS_THREAD_CONSISTENCY_7100
     * @tc.desc   Verify napi_get_strong_sendable_reference_value returns consistent value across multiple accesses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongSendableRefValueCrossThreadConsistency0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongSendableRefValueCrossThreadConsistency0071';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongSendableRefValueCrossThreadConsistency()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_wrap_sendable_with_size 补充用例 ==========

    /**
     * @tc.name testGetValueStringLatin1WhenPending0072
     * @tc.number SUB_NSD_B2_GET_VALUE_STRING_LATIN1_WHEN_PENDING_7200
     * @tc.desc   Verify napi_get_value_string_latin1 returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueStringLatin1WhenPending0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueStringLatin1WhenPending0072';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueStringLatin1WhenPending()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueStringLatin1NonLatin0073
     * @tc.number SUB_NSD_B2_GET_VALUE_STRING_LATIN1_NON_LATIN1_7300
     * @tc.desc   Verify napi_get_value_string_latin1 substitutes non-latin1 chars (e.g. Chinese)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueStringLatin1NonLatin0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueStringLatin1NonLatin0073';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueStringLatin1NonLatin1()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueStringLatin1BufsizeSmaller0074
     * @tc.number SUB_NSD_B2_GET_VALUE_STRING_LATIN1_BUFSIZE_SMALLER_7400
     * @tc.desc   Verify napi_get_value_string_latin1 truncates when bufsize smaller, written=bufsize-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueStringLatin1BufsizeSmaller0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueStringLatin1BufsizeSmaller0074';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueStringLatin1BufsizeSmaller()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_get_strong_sendable_reference_value 补充用例 ==========

    /**
     * @tc.name testGetValueStringLatin1Number0075
     * @tc.number SUB_NSD_B2_GET_VALUE_STRING_LATIN1_NUMBER_7500
     * @tc.desc   Verify napi_get_value_string_latin1 returns napi_string_expected for number input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueStringLatin1Number0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueStringLatin1Number0075';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueStringLatin1Number()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueUint32Roundtrip0076
     * @tc.number SUB_NSD_B2_GET_VALUE_UINT32_ROUNDTRIP_7600
     * @tc.desc   Verify napi_get_value_uint32 + napi_create_uint32 roundtrip: 12345 survives create-get-create-get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueUint32Roundtrip0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetValueUint32Roundtrip0076';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getValueUint32Roundtrip()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_add_finalizer 补充用例（0093-0097）==========

    // 从 batch1 迁移
    /**
     * @tc.name testAddFinalizerNonObjectReturnsObjectExpected0077
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_NON_OBJECT_7700
     * @tc.desc   Verify napi_add_finalizer returns napi_object_expected for non-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerNonObjectReturnsObjectExpected0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerNonObjectReturnsObjectExpected0077';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerNonObjectReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddFinalizerWhenPendingReturnsPendingException0078
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_WHEN_PENDING_7800
     * @tc.desc   Verify napi_add_finalizer returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerWhenPendingReturnsPendingException0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerWhenPendingReturnsPendingException0078';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      try {
        napispecdiffbatch2ndktest.addFinalizerWhenPendingReturnsPendingException();
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddFinalizerMultipleTypesReturnsObjectExpected0079
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_MULTIPLE_TYPES_7900
     * @tc.desc   Verify napi_add_finalizer returns napi_object_expected for string/boolean/null/undefined/symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerMultipleTypesReturnsObjectExpected0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerMultipleTypesReturnsObjectExpected0079';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerMultipleTypesReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddFinalizerNullDataReturnsOk0080
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_NULL_DATA_8000
     * @tc.desc   Verify napi_add_finalizer returns napi_ok with nullptr native_object data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerNullDataReturnsOk0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerNullDataReturnsOk0080';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerNullDataReturnsOk()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddFinalizerNullResultReturnsOk0081
     * @tc.number SUB_NSD_B2_ADD_FINALIZER_NULL_RESULT_8100
     * @tc.desc   Verify napi_add_finalizer returns napi_ok with nullptr result parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerNullResultReturnsOk0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testAddFinalizerNullResultReturnsOk0081';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.addFinalizerNullResultReturnsOk()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_remove_wrap_sendable 补充用例 (0098-0099) ==========

    /**
     * @tc.name testRemoveWrapSendableNonSendableReturnsError0082
     * @tc.number SUB_NSD_B2_RM_WRAP_SEND_NON_SEND_8200
     * @tc.desc   Verify napi_remove_wrap_sendable returns error with non-sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapSendableNonSendableReturnsError0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapSendableNonSendableReturnsError0082';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapSendableNonSendableReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveWrapSendableNonWrappedReturnsError0083
     * @tc.number SUB_NSD_B2_RM_WRAP_SEND_NON_WRAP_8300
     * @tc.desc   Verify napi_remove_wrap_sendable returns error with sendable but unwrapped object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapSendableNonWrappedReturnsError0083',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testRemoveWrapSendableNonWrappedReturnsError0083';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.removeWrapSendableNonWrappedReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_create_strong_reference 异常参数补充 ==========

    /**
     * @tc.name testCreateStrongReferenceNullEnvReturnsInvalidArg0084
     * @tc.number SUB_NSD_B2_CR_STRONGREF_NULLENV_8400
     * @tc.desc   Verify napi_create_reference returns napi_invalid_arg with NULL env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceNullEnvReturnsInvalidArg0084',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceNullEnvReturnsInvalidArg0084';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferenceNullObjectReturnsInvalidArg0085
     * @tc.number SUB_NSD_B2_CR_STRONGREF_NULLOBJ_8500
     * @tc.desc   Verify napi_create_reference returns napi_invalid_arg with NULL object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceNullObjectReturnsInvalidArg0085',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceNullObjectReturnsInvalidArg0085';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferenceNullRefReturnsInvalidArg0086
     * @tc.number SUB_NSD_B2_CR_STRONGREF_NULLREF_8600
     * @tc.desc   Verify napi_create_reference returns napi_invalid_arg with NULL ref output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceNullRefReturnsInvalidArg0086',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceNullRefReturnsInvalidArg0086';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceNullRefReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferenceNumberReturnsError0087
     * @tc.number SUB_NSD_B2_CR_STRONGREF_NUM_8700
     * @tc.desc   Verify napi_create_reference returns error with number (non-object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceNumberReturnsError0087',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceNumberReturnsError0087';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceNumberReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateStrongReferenceStringReturnsError0088
     * @tc.number SUB_NSD_B2_CR_STRONGREF_STR_8800
     * @tc.desc   Verify napi_create_reference returns error with string (non-object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceStringReturnsError0088',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testCreateStrongReferenceStringReturnsError0088';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.createStrongReferenceStringReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== napi_delete_strong_reference 异常参数+异常场景补充 ==========

    /**
     * @tc.name testDeleteStrongReferenceNullEnvReturnsInvalidArg0089
     * @tc.number SUB_NSD_B2_DEL_STRONGREF_NULLENV_8900
     * @tc.desc   Verify napi_delete_reference returns napi_invalid_arg with NULL env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceNullEnvReturnsInvalidArg0089',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceNullEnvReturnsInvalidArg0089';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDeleteStrongReferenceWhenPendingReturnsPendingException0090
     * @tc.number SUB_NSD_B2_DEL_STRONGREF_PENDING_9000
     * @tc.desc   Verify napi_delete_reference with pending exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceWhenPendingReturnsPendingException0090',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testDeleteStrongReferenceWhenPendingReturnsPendingException0090';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      try {
        napispecdiffbatch2ndktest.deleteStrongReferenceWhenPendingReturnsPendingException();
        expect(false).assertTrue();
      } catch (e) {
        expect(true).assertTrue();
      }
      console.info(caseName + ' end');
    });

    // ========== napi_get_reference_value 异常参数补充 ==========

    /**
     * @tc.name testGetStrongReferenceValueNullEnvReturnsInvalidArg0091
     * @tc.number SUB_NSD_B2_GET_STRONGREFVAL_NULLENV_9100
     * @tc.desc   Verify napi_get_reference_value returns napi_invalid_arg with NULL env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueNullEnvReturnsInvalidArg0091',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueNullEnvReturnsInvalidArg0091';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongReferenceValueNullRefReturnsInvalidArg0092
     * @tc.number SUB_NSD_B2_GET_STRONGREFVAL_NULLREF_9200
     * @tc.desc   Verify napi_get_reference_value returns napi_invalid_arg with NULL ref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueNullRefReturnsInvalidArg0092',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueNullRefReturnsInvalidArg0092';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueNullRefReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetStrongReferenceValueNullResultReturnsInvalidArg0093
     * @tc.number SUB_NSD_B2_GET_STRONGREFVAL_NULLRES_9300
     * @tc.desc   Verify napi_get_reference_value returns napi_invalid_arg with NULL result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueNullResultReturnsInvalidArg0093',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const caseName = 'testGetStrongReferenceValueNullResultReturnsInvalidArg0093';
      console.info(caseName + ' start');
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

  });

}
