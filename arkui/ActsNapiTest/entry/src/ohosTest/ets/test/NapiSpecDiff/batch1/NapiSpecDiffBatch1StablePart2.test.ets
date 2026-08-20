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
import napispecdiffbatch1ndktest from 'libnapispecdiffbatch1ndktest.so';
import Utils from '../../Utils';

function forceFullGC(): void {
  globalThis.ArkTools.forceFullGC();
}

export default function NapiSpecDiffBatch1StablePart2Test() {
  describe('NapiSpecDiffBatch1StablePart2Test', () => {
    /**
     * @tc.name testWrapReturnsOkAndWrapperObject0001
     * @tc.number SUB_NSD_B1_WRAP_RETURN_OK_0100
     * @tc.desc   Verify napi_wrap returns napi_ok and valid wrapper object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapReturnsOkAndWrapperObject0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testWrapReturnsOkAndWrapperObject0001';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.wrapReturnsOkAndWrapperObject()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testUnwrapReturnsOkAndCorrectPointer0002
     * @tc.number SUB_NSD_B1_UNWRAP_RETURN_OK_0200
     * @tc.desc   Verify napi_unwrap returns napi_ok and correct native pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnwrapReturnsOkAndCorrectPointer0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testUnwrapReturnsOkAndCorrectPointer0002';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.unwrapReturnsOkAndCorrectPointer()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testUnwrapWhenPendingReturnsPendingException0003
     * @tc.number SUB_NSD_B1_UNWRAP_PENDING_0300
     * @tc.desc   Verify napi_unwrap returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnwrapWhenPendingReturnsPendingException0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testUnwrapWhenPendingReturnsPendingException0003';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.unwrapWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateDataviewNullArrayBufferReturnsInvalidArg0004
     * @tc.number SUB_NSD_B1_DATAVIEW_NULL_AB_0400
     * @tc.desc   Verify napi_create_dataview returns napi_invalid_arg when ArrayBuffer is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDataviewNullArrayBufferReturnsInvalidArg0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateDataviewNullArrayBufferReturnsInvalidArg0004';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createDataviewNullArrayBufferReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateDataviewComboWithArrayBuffer0005
     * @tc.number SUB_NSD_B1_DATAVIEW_COMBO_0500
     * @tc.desc   Verify napi_create_dataview combo with napi_get_dataview_info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDataviewComboWithArrayBuffer0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateDataviewComboWithArrayBuffer0005';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createDataviewComboWithArrayBuffer()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testGetTypedArrayInfoNonTypedArrayReturnsError0006
     * @tc.number SUB_NSD_B1_TYPEDARRAY_INFO_NON_TA_0600
     * @tc.desc   Verify napi_get_typedarray_info returns error for non-TypedArray value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTypedArrayInfoNonTypedArrayReturnsError0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetTypedArrayInfoNonTypedArrayReturnsError0006';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getTypedArrayInfoNonTypedArrayReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCoerceToObjectNullValueReturnsInvalidArg0007
     * @tc.number SUB_NSD_B1_COERCE_OBJECT_NULL_0700
     * @tc.desc   Verify napi_coerce_to_object returns napi_invalid_arg for NULL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCoerceToObjectNullValueReturnsInvalidArg0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCoerceToObjectNullValueReturnsInvalidArg0007';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.coerceToObjectNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCoerceToObjectComboWithSetProperty0008
     * @tc.number SUB_NSD_B1_COERCE_OBJECT_COMBO_0800
     * @tc.desc   Verify napi_coerce_to_object combo with napi_set_property and napi_get_property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCoerceToObjectComboWithSetProperty0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCoerceToObjectComboWithSetProperty0008';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.coerceToObjectComboWithSetProperty()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testInstanceofReturnsTrueForValidInstance0009
     * @tc.number SUB_NSD_B1_INSTANCEOF_RETURN_TRUE_0900
     * @tc.desc   Verify napi_instanceof returns napi_ok and result=true for valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInstanceofReturnsTrueForValidInstance0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testInstanceofReturnsTrueForValidInstance0009';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.instanceofReturnsTrueForValidInstance()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testNewInstanceComboWithDefineClass0010
     * @tc.number SUB_NSD_B1_NEW_INSTANCE_COMBO_1000
     * @tc.desc   Verify napi_new_instance combo with napi_define_class and napi_instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewInstanceComboWithDefineClass0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testNewInstanceComboWithDefineClass0010';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.newInstanceComboWithDefineClass()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testDefineClassConstructorThrowsException0011
     * @tc.number SUB_NSD_B1_DEFINE_CLASS_CTOR_THROW_1100
     * @tc.desc   Verify napi_define_class constructor throws exception propagates to pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefineClassConstructorThrowsException0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDefineClassConstructorThrowsException0011';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.defineClassConstructorThrowsException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testAsyncDestroyWhenPendingReturnsPendingException0012
     * @tc.number SUB_NSD_B1_ASYNC_DESTROY_PENDING_1200
     * @tc.desc   Verify napi_async_destroy returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncDestroyWhenPendingReturnsPendingException0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAsyncDestroyWhenPendingReturnsPendingException0012';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.asyncDestroyWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateExternalBufferReturnsOkAndRefsExternalData0013
     * @tc.number SUB_NSD_B1_EXT_BUFFER_RETURN_1300
     * @tc.desc   Verify napi_create_external_buffer returns napi_ok and references external data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateExternalBufferReturnsOkAndRefsExternalData0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateExternalBufferReturnsOkAndRefsExternalData0013';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createExternalBufferReturnsOkAndRefsExternalData()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    // ===== 缺失用例：testCreateAsyncWorkAllowsNonStringResourceName0024_1 =====
    // 对应C++: createAsyncWorkAllowsNonStringResourceName
    // 原测试文件中已有 testCancelAsyncWorkStatusLayering0024，
    // 但 createAsyncWorkAllowsNonStringResourceName 没有被测试

    //   expect(napispecdiffbatch1ndktest.createAsyncWorkAllowsNonStringResourceName()).assertEqual(1);
      // console.info(caseName + ' end');
    // });
    /**
     * @tc.name testTypeTagObjectNullTagReturnsInvalidArg0014
     * @tc.number SUB_NSD_B1_TYPE_TAG_NULL_TAG_1400
     * @tc.desc   Verify napi_type_tag_object returns napi_invalid_arg for NULL tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeTagObjectNullTagReturnsInvalidArg0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeTagObjectNullTagReturnsInvalidArg0014';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.typeTagObjectNullTagReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testUnwrapNoWrappedObjectReturnsNull0015
     * @tc.number SUB_NSD_B1_UNWRAP_NO_WRAP_1500
     * @tc.desc   Verify napi_unwrap returns napi_ok with NULL data for unwrapped object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnwrapNoWrappedObjectReturnsNull0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testUnwrapNoWrappedObjectReturnsNull0015';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.unwrapNoWrappedObjectReturnsNull()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testThrowTypeErrorNullMessageReturnsInvalidArg0016
     * @tc.number SUB_NSD_B1_THROW_TYPE_ERROR_NULL_MSG_1600
     * @tc.desc   Verify napi_throw_type_error returns napi_invalid_arg for null message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowTypeErrorNullMessageReturnsInvalidArg0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowTypeErrorNullMessageReturnsInvalidArg0016';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.throwTypeErrorNullMessageReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testThrowTypeErrorResultIsTypeErrorType0017
     * @tc.number SUB_NSD_B1_THROW_TYPE_ERROR_RESULT_1700
     * @tc.desc   Verify napi_throw_type_error throws TypeError with correct name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowTypeErrorResultIsTypeErrorType0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowTypeErrorResultIsTypeErrorType0017';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.throwTypeErrorResultIsTypeErrorType()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testThrowTypeErrorWhenPendingReturnsPendingException0018
     * @tc.number SUB_NSD_B1_THROW_TYPE_ERROR_PENDING_1800
     * @tc.desc   Verify napi_throw_type_error returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowTypeErrorWhenPendingReturnsPendingException0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowTypeErrorWhenPendingReturnsPendingException0018';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.throwTypeErrorWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    //   let errObj: object | null = napispecdiffbatch1ndktest.createTypeErrorTypicalUsage(123);
    //   expect(errObj !== null).assertTrue();
    //   expect((errObj as Error).message).assertContain('Expected string');
    //   expect((errObj as Error).name).assertEqual('TypeError');
      // console.info(caseName + ' end');
    // });
    /**
     * @tc.name testCreateRangeErrorWhenPendingReturnsPendingException0019
     * @tc.number SUB_NSD_B1_CREATE_RANGE_ERROR_PENDING_1900
     * @tc.desc   Verify napi_create_range_error returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeErrorWhenPendingReturnsPendingException0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateRangeErrorWhenPendingReturnsPendingException0019';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createRangeErrorWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateRangeErrorComboWithThrowAndCatch0020
     * @tc.number SUB_NSD_B1_CREATE_RANGE_ERROR_COMBO_2000
     * @tc.desc   Verify napi_create_range_error combo with throw and exception handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeErrorComboWithThrowAndCatch0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateRangeErrorComboWithThrowAndCatch0020';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      let result: string = napispecdiffbatch1ndktest.createRangeErrorComboWithThrowAndCatch() as string;
      expect(result === "range_error_combo_ok").assertTrue();
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testRejectDeferredWhenPendingReturnsPendingException0021
     * @tc.number SUB_NSD_B1_REJECT_DEFERRED_PENDING_2100
     * @tc.desc   Verify napi_reject_deferred returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredWhenPendingReturnsPendingException0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRejectDeferredWhenPendingReturnsPendingException0021';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.rejectDeferredWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    //   expect(napispecdiffbatch1ndktest.rejectDeferredThenResolveReturnsError()).assertEqual(1);
      // console.info(caseName + ' end');
    // });

    /**
     * @tc.name testRejectDeferredWithNullOrUndefined0022
     * @tc.number SUB_NSD_B1_REJECT_DEFERRED_NULL_UNDEF_2200
     * @tc.desc   Verify napi_reject_deferred accepts null and undefined as reject value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredWithNullOrUndefined0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRejectDeferredWithNullOrUndefined0022';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.rejectDeferredWithNullOrUndefined()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoNullEnvReturnsInvalidArg0023
     * @tc.number SUB_NSD_B1_DATAVIEW_INFO_NULL_ENV_2300
     * @tc.desc   Verify napi_get_dataview_info returns napi_invalid_arg for null env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoNullEnvReturnsInvalidArg0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoNullEnvReturnsInvalidArg0023';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoNullDataviewReturnsInvalidArg0024
     * @tc.number SUB_NSD_B1_DATAVIEW_INFO_NULL_DATAVIEW_2400
     * @tc.desc   Verify napi_get_dataview_info returns napi_invalid_arg for null dataview
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoNullDataviewReturnsInvalidArg0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoNullDataviewReturnsInvalidArg0024';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoNullDataviewReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoTypedArrayReturnsError0025
     * @tc.number SUB_NSD_B1_DATAVIEW_INFO_TYPED_ARRAY_2500
     * @tc.desc   Verify napi_get_dataview_info returns error for TypedArray input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoTypedArrayReturnsError0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoTypedArrayReturnsError0025';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoTypedArrayReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoObjectReturnsError0026
     * @tc.number SUB_NSD_B1_DATAVIEW_INFO_OBJECT_2600
     * @tc.desc   Verify napi_get_dataview_info returns error for plain object input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoObjectReturnsError0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoObjectReturnsError0026';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoObjectReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoWhenPendingReturnsPendingException0027
     * @tc.number SUB_NSD_B1_DATAVIEW_INFO_PENDING_2700
     * @tc.desc   Verify napi_get_dataview_info returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoWhenPendingReturnsPendingException0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoWhenPendingReturnsPendingException0027';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyWhenPendingReturnsPendingException0028
     * @tc.number SUB_NSD_B1_GET_PROPERTY_PENDING_2800
     * @tc.desc   Verify napi_get_property returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyWhenPendingReturnsPendingException0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyWhenPendingReturnsPendingException0028';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertySymbolNotExistsReturnsUndefined0029
     * @tc.number SUB_NSD_B1_GET_PROPERTY_SYMBOL_2900
     * @tc.desc   Verify napi_get_property returns undefined for non-existent Symbol property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertySymbolNotExistsReturnsUndefined0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertySymbolNotExistsReturnsUndefined0029';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertySymbolNotExistsReturnsUndefined()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertySealedObjectNonExistentReturnsUndefined0030
     * @tc.number SUB_NSD_B1_GET_PROPERTY_SEALED_3000
     * @tc.desc   Verify napi_get_property returns undefined for non-existent property on sealed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertySealedObjectNonExistentReturnsUndefined0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertySealedObjectNonExistentReturnsUndefined0030';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertySealedObjectNonExistentReturnsUndefined()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateRangeErrorAsReturnValue0031
     * @tc.number SUB_NSD_B1_CREATE_RANGE_ERROR_RETURN_3100
     * @tc.desc   Verify napi_create_range_error object can be returned without throwing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeErrorAsReturnValue0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateRangeErrorAsReturnValue0031';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      let err: object = napispecdiffbatch1ndktest.createRangeErrorAsReturnValue() as object;
      expect(err !== null && err !== undefined).assertTrue();
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testCreateRangeErrorAfterEnvDestroyed0032
     * @tc.number SUB_NSD_B1_CREATE_RANGE_ERROR_ENV_DESTROYED_3200
     * @tc.desc   Verify napi_create_range_error returns error when env is destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeErrorAfterEnvDestroyed0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateRangeErrorAfterEnvDestroyed0032';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createRangeErrorAfterEnvDestroyed()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testCheckObjectTypeTagNullObjectReturnsInvalidArg0033
     * @tc.number SUB_NSD_B1_CHECK_OBJECT_TYPE_TAG_NULL_3300
     * @tc.desc   Verify napi_check_object_type_tag returns napi_invalid_arg for NULL object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCheckObjectTypeTagNullObjectReturnsInvalidArg0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCheckObjectTypeTagNullObjectReturnsInvalidArg0033';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.checkObjectTypeTagNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    // ========== napi_create_string_utf8 补充用例 ==========
    /**
     * @tc.name testCreateStringUtf8AfterEnvDestroyedReturnsClosing0034
     * @tc.number SUB_NSD_B1_CREATE_STRING_UTF8_ENV_DESTROYED_3400
     * @tc.desc   Verify napi_create_string_utf8 returns napi_closing when env is destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStringUtf8AfterEnvDestroyedReturnsClosing0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateStringUtf8AfterEnvDestroyedReturnsClosing0034';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createStringUtf8AfterEnvDestroyedReturnsClosing()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    //   expect(napispecdiffbatch1ndktest.createStringUtf8WhenPendingReturnsPendingException()).assertEqual(1);
      // console.info(caseName + ' end');
    // });
    /**
     * @tc.name testCreateStringUtf8InvalidUtf8ReturnsError0035
     * @tc.number SUB_NSD_B1_CREATE_STRING_UTF8_INVALID_3500
     * @tc.desc   Verify napi_create_string_utf8 handles invalid UTF-8 data (0xFF 0xFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStringUtf8InvalidUtf8ReturnsError0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateStringUtf8InvalidUtf8ReturnsError0035';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createStringUtf8InvalidUtf8ReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testCreateStringUtf8LengthExceedsActual0036
     * @tc.number SUB_NSD_B1_CREATE_STRING_UTF8_LENGTH_3600
     * @tc.desc   Verify napi_create_string_utf8 with length exceeding actual string content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStringUtf8LengthExceedsActual0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateStringUtf8LengthExceedsActual0036';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createStringUtf8LengthExceedsActual()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testCreateStringUtf8ComboWithGetAndRebuild0037
     * @tc.number SUB_NSD_B1_CREATE_STRING_UTF8_COMBO_3700
     * @tc.desc   Verify napi_create_string_utf8 combo: create → get_length → get_content → rebuild → strict_equals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStringUtf8ComboWithGetAndRebuild0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateStringUtf8ComboWithGetAndRebuild0037';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createStringUtf8ComboWithGetAndRebuild()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    // ========== napi_get_and_clear_last_exception 补充用例 ==========
    /**
     * @tc.name testGetAndClearLastExceptionNoExceptionReturnsUndefined0038
     * @tc.number SUB_NSD_B1_GET_CLEAR_EXC_NO_EXC_3800
     * @tc.desc   Verify napi_get_and_clear_last_exception returns napi_ok and
     * result is undefined when no exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAndClearLastExceptionNoExceptionReturnsUndefined0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetAndClearLastExceptionNoExceptionReturnsUndefined0038';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getAndClearLastExceptionNoExceptionReturnsUndefined()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testGetAndClearLastExceptionEnvDestroyedReturnsInvalidArg0039
     * @tc.number SUB_NSD_B1_GET_CLEAR_EXC_ENV_DESTROYED_3900
     * @tc.desc   Verify napi_get_and_clear_last_exception returns napi_invalid_arg when env is destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAndClearLastExceptionEnvDestroyedReturnsInvalidArg0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetAndClearLastExceptionEnvDestroyedReturnsInvalidArg0039';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getAndClearLastExceptionEnvDestroyedReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
    /**
     * @tc.name testGetAndClearLastExceptionReacquireAfterClear0040
     * @tc.number SUB_NSD_B1_GET_CLEAR_EXC_REACQUIRE_4000
     * @tc.desc   Verify napi_get_and_clear_last_exception: clear → throw again → get new exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAndClearLastExceptionReacquireAfterClear0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetAndClearLastExceptionReacquireAfterClear0040';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getAndClearLastExceptionReacquireAfterClear()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_get_arraybuffer_info 补充 ==========

    /**
     * @tc.name testGetArraybufferInfoDetachedReturnsNullData0041
     * @tc.number SUB_NSD_B1_AB_INFO_DETACHED_4100
     * @tc.desc   Verify napi_get_arraybuffer_info returns napi_generic_failure or data=NULL for detached ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetArraybufferInfoDetachedReturnsNullData0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetArraybufferInfoDetachedReturnsNullData0041';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getArraybufferInfoDetachedReturnsNullData()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetArraybufferInfoWhenPendingReturnsPendingException0042
     * @tc.number SUB_NSD_B1_AB_INFO_PENDING_4200
     * @tc.desc   Verify napi_get_arraybuffer_info returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetArraybufferInfoWhenPendingReturnsPendingException0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetArraybufferInfoWhenPendingReturnsPendingException0042';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getArraybufferInfoWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetArraybufferInfoReleasedReturnsZeroLength0043
     * @tc.number SUB_NSD_B1_AB_INFO_RELEASED_4300
     * @tc.desc   Verify napi_get_arraybuffer_info returns zero byte_length for released/detached ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetArraybufferInfoReleasedReturnsZeroLength0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetArraybufferInfoReleasedReturnsZeroLength0043';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getArraybufferInfoReleasedReturnsZeroLength()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetArraybufferInfoTypedArrayReturnsError0044
     * @tc.number SUB_NSD_B1_AB_INFO_TYPEDARRAY_4400
     * @tc.desc   Verify napi_get_arraybuffer_info returns napi_arraybuffer_expected for TypedArray param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetArraybufferInfoTypedArrayReturnsError0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetArraybufferInfoTypedArrayReturnsError0044';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getArraybufferInfoTypedArrayReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_get_cb_info 补充 ==========

    /**
     * @tc.name testGetCbInfoWhenPendingReturnsPendingException0045
     * @tc.number SUB_NSD_B1_CB_INFO_PENDING_4500
     * @tc.desc   Verify napi_get_cb_info returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCbInfoWhenPendingReturnsPendingException0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetCbInfoWhenPendingReturnsPendingException0045';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getCbInfoWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetCbInfoArgcSmallerThanActual0046
     * @tc.number SUB_NSD_B1_CB_INFO_ARGC_4600
     * @tc.desc   Verify napi_get_cb_info fills partial argv when argc buffer is smaller than actual
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetCbInfoArgcSmallerThanActual0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetCbInfoArgcSmallerThanActual0046';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getCbInfoArgcSmallerThanActual()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_get_dataview_info NULL输出参数补充 ==========

    /**
     * @tc.name testGetDataviewInfoNullByteLength0047
     * @tc.number SUB_NSD_B1_DV_INFO_NULL_BYTELEN_4700
     * @tc.desc   Verify napi_get_dataview_info allows NULL byte_length and returns partial info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoNullByteLength0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoNullByteLength0047';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoNullByteLength()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoNullByteOffset0048
     * @tc.number SUB_NSD_B1_DV_INFO_NULL_BYTEOFF_4800
     * @tc.desc   Verify napi_get_dataview_info allows NULL byte_offset and returns partial info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoNullByteOffset0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoNullByteOffset0048';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoNullByteOffset()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetDataviewInfoNullArrayBuffer0049
     * @tc.number SUB_NSD_B1_DV_INFO_NULL_AB_4900
     * @tc.desc   Verify napi_get_dataview_info allows NULL arraybuffer and returns partial info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDataviewInfoNullArrayBuffer0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetDataviewInfoNullArrayBuffer0049';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getDataviewInfoNullArrayBuffer()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_get_last_error_info 迁移自batch4 (0127-0132) ==========

    /**
     * @tc.name testGetLastErrorInfoAfterFailedCall0050
     * @tc.number SUB_NSD_B1_LAST_ERROR_FAILED_5000
     * @tc.desc   Verify napi_get_last_error_info returns error info after failed call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfoAfterFailedCall0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetLastErrorInfoAfterFailedCall0050';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getLastErrorInfoAfterFailedCall()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetLastErrorInfoWhenNoError0051
     * @tc.number SUB_NSD_B1_LAST_ERROR_NO_ERR_5100
     * @tc.desc   Verify napi_get_last_error_info when there is no error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfoWhenNoError0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetLastErrorInfoWhenNoError0051';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getLastErrorInfoWhenNoError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetLastErrorInfoAfterMultipleErrors0052
     * @tc.number SUB_NSD_B1_LAST_ERROR_MULTI_5200
     * @tc.desc   Verify napi_get_last_error_info returns last error after multiple errors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfoAfterMultipleErrors0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetLastErrorInfoAfterMultipleErrors0052';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getLastErrorInfoAfterMultipleErrors()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetLastErrorInfoWhenPending0053
     * @tc.number SUB_NSD_B1_LAST_ERROR_PENDING_5300
     * @tc.desc   Verify napi_get_last_error_info reflects current error when pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfoWhenPending0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetLastErrorInfoWhenPending0053';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getLastErrorInfoWhenPending()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetLastErrorInfoAfterExceptionCleared0054
     * @tc.number SUB_NSD_B1_LAST_ERROR_CLEARED_5400
     * @tc.desc   Verify napi_get_last_error_info retains last error after exception cleared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfoAfterExceptionCleared0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetLastErrorInfoAfterExceptionCleared0054';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getLastErrorInfoAfterExceptionCleared()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetLastErrorInfoComboWithThrowAndClear0055
     * @tc.number SUB_NSD_B1_LAST_ERROR_COMBO_5500
     * @tc.desc   Verify napi_get_last_error_info combo with throw, clear, and compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfoComboWithThrowAndClear0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetLastErrorInfoComboWithThrowAndClear0055';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getLastErrorInfoComboWithThrowAndClear()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });


    /**
     * @tc.name testIsErrorCustomSubclass0056
     * @tc.number SUB_NSD_B1_IS_ERROR_CUSTOM_SUBCLASS_5600
     * @tc.desc   Verify napi_is_error returns true for custom Error subclass (TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsErrorCustomSubclass0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testIsErrorCustomSubclass0056';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.isErrorCustomSubclass()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testIsErrorNonErrorThrow0057
     * @tc.number SUB_NSD_B1_IS_ERROR_NON_ERROR_5700
     * @tc.desc   Verify napi_is_error returns false for non-Error value (number 42)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsErrorNonErrorThrow0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testIsErrorNonErrorThrow0057';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.isErrorNonErrorThrow()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testIsErrorFrozenError0058
     * @tc.number SUB_NSD_B1_IS_ERROR_FROZEN_5800
     * @tc.desc   Verify napi_is_error returns true for Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsErrorFrozenError0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testIsErrorFrozenError0058';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.isErrorFrozenError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testIsErrorAggregateError0059
     * @tc.number SUB_NSD_B1_IS_ERROR_AGGREGATE_5900
     * @tc.desc   Verify napi_is_error returns true for AggregateError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsErrorAggregateError0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testIsErrorAggregateError0059';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.isErrorAggregateError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== 第四轮补充：高优先级缺口 (0070-0079) ==========

    /**
     * @tc.name testModuleRegisterNullModuleReturnsInvalidArg0060
     * @tc.number SUB_NSD_B1_MOD_REG_NULL_MODULE_6000
     * @tc.desc   Verify napi_module_register returns error with NULL module pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testModuleRegisterNullModuleReturnsInvalidArg0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testModuleRegisterNullModuleReturnsInvalidArg0060';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.moduleRegisterNullModuleReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testModuleRegisterNullModnameReturnsError0061
     * @tc.number SUB_NSD_B1_MOD_REG_NULL_MODNAME_6100
     * @tc.desc   Verify napi_module_register returns error with NULL nm_modname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testModuleRegisterNullModnameReturnsError0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testModuleRegisterNullModnameReturnsError0061';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.moduleRegisterNullModnameReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testModuleRegisterNullRegisterFuncReturnsError0062
     * @tc.number SUB_NSD_B1_MOD_REG_NULL_REGFUNC_6200
     * @tc.desc   Verify napi_module_register returns error with NULL nm_register_func
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testModuleRegisterNullRegisterFuncReturnsError0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testModuleRegisterNullRegisterFuncReturnsError0062';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.moduleRegisterNullRegisterFuncReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testTypeofNullValueReturnsInvalidArg0063
     * @tc.number SUB_NSD_B1_TYPEOF_NULL_VALUE_6300
     * @tc.desc   Verify napi_typeof returns napi_invalid_arg with NULL value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeofNullValueReturnsInvalidArg0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeofNullValueReturnsInvalidArg0063';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.typeofNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testTypeofNullResultReturnsInvalidArg0064
     * @tc.number SUB_NSD_B1_TYPEOF_NULL_RESULT_6400
     * @tc.desc   Verify napi_typeof returns napi_invalid_arg with NULL result pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeofNullResultReturnsInvalidArg0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeofNullResultReturnsInvalidArg0064';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.typeofNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testTypeofWhenPendingReturnsPendingException0065
     * @tc.number SUB_NSD_B1_TYPEOF_WHEN_PENDING_6500
     * @tc.desc   Verify napi_typeof returns napi_pending_exception when exception pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeofWhenPendingReturnsPendingException0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeofWhenPendingReturnsPendingException0065';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      let caught: boolean = false;
      try {
        napispecdiffbatch1ndktest.typeofWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreatePromiseNullDeferredReturnsInvalidArg0066
     * @tc.number SUB_NSD_B1_CREATE_PROM_NULL_DEF_6600
     * @tc.desc   Verify napi_create_promise returns napi_invalid_arg with NULL deferred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePromiseNullDeferredReturnsInvalidArg0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreatePromiseNullDeferredReturnsInvalidArg0066';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createPromiseNullDeferredReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreatePromiseNullPromiseReturnsInvalidArg0067
     * @tc.number SUB_NSD_B1_CREATE_PROM_NULL_PROM_6700
     * @tc.desc   Verify napi_create_promise returns napi_invalid_arg with NULL promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreatePromiseNullPromiseReturnsInvalidArg0067',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreatePromiseNullPromiseReturnsInvalidArg0067';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createPromiseNullPromiseReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateReferenceWithUndefinedValue0068
     * @tc.number SUB_NSD_B1_CREATE_REF_UNDEFINED_6800
     * @tc.desc   Verify napi_create_reference succeeds with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateReferenceWithUndefinedValue0068',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateReferenceWithUndefinedValue0068';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.createReferenceWithUndefinedValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCheckObjectTypeTagNullResultReturnsInvalidArg0069
     * @tc.number SUB_NSD_B1_CHK_TTAG_NULL_RESULT_6900
     * @tc.desc   Verify napi_check_object_type_tag returns napi_invalid_arg with NULL result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCheckObjectTypeTagNullResultReturnsInvalidArg0069',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCheckObjectTypeTagNullResultReturnsInvalidArg0069';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.checkObjectTypeTagNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_typeof 正常参数 + 组合场景 ==========

    /**
     * @tc.name testTypeofAllTypesReturnsCorrectType0070
     * @tc.number SUB_NSD_B1_TYPEOF_ALL_TYPES_7000
     * @tc.desc   Verify napi_typeof returns correct napi_valuetype for all JS types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeofAllTypesReturnsCorrectType0070',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeofAllTypesReturnsCorrectType0070';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.typeofAllTypesReturnsCorrectType()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testTypeofComboWithCreateModifyAndCheck0071
     * @tc.number SUB_NSD_B1_TYPEOF_COMBO_7100
     * @tc.desc   Verify napi_typeof combination with create/modify/recheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeofComboWithCreateModifyAndCheck0071',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeofComboWithCreateModifyAndCheck0071';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.typeofComboWithCreateModifyAndCheck()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_get_property_names 完整覆盖 ==========

    /**
     * @tc.name testGetPropertyNamesNormalPath0072
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_NORMAL_7200
     * @tc.desc   Verify napi_get_property_names returns correct array of property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesNormalPath0072',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesNormalPath0072';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyNamesNormalPath()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyNamesReturnValueVerification0073
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_RETVAL_7300
     * @tc.desc   Verify napi_get_property_names return value contains expected property names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesReturnValueVerification0073',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesReturnValueVerification0073';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyNamesReturnValueVerification()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyNamesWhenPendingReturnsPendingException0074
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_PENDING_7400
     * @tc.desc   Verify napi_get_property_names with pending exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesWhenPendingReturnsPendingException0074',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesWhenPendingReturnsPendingException0074';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      let caught: boolean = false;
      try {
        napispecdiffbatch1ndktest.getPropertyNamesWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyNamesComboWithGetProperty0075
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_COMBO_7500
     * @tc.desc   Verify napi_get_property_names combo with napi_get_property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesComboWithGetProperty0075',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesComboWithGetProperty0075';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyNamesComboWithGetProperty()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyNamesNullEnvReturnsInvalidArg0076
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_NULLENV_7600
     * @tc.desc   Verify napi_get_property_names returns napi_invalid_arg with NULL env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesNullEnvReturnsInvalidArg0076',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesNullEnvReturnsInvalidArg0076';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyNamesNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyNamesNullObjectReturnsInvalidArg0077
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_NULLOBJ_7700
     * @tc.desc   Verify napi_get_property_names returns napi_invalid_arg with NULL object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesNullObjectReturnsInvalidArg0077',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesNullObjectReturnsInvalidArg0077';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyNamesNullObjectReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetPropertyNamesNullResultReturnsInvalidArg0078
     * @tc.number SUB_NSD_B1_GET_PROP_NAMES_NULLRES_7800
     * @tc.desc   Verify napi_get_property_names returns napi_invalid_arg with NULL result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetPropertyNamesNullResultReturnsInvalidArg0078',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetPropertyNamesNullResultReturnsInvalidArg0078';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getPropertyNamesNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_module_register 正常参数 + 组合场景 ==========

    /**
     * @tc.name testModuleRegisterNormalPath0079
     * @tc.number SUB_NSD_B1_MOD_REG_NORMAL_7900
     * @tc.desc   Verify napi_module_register succeeds with valid module struct (no crash)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testModuleRegisterNormalPath0079',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testModuleRegisterNormalPath0079';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.moduleRegisterNormalPath()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testModuleRegisterComboMultipleModules0080
     * @tc.number SUB_NSD_B1_MOD_REG_COMBO_8000
     * @tc.desc   Verify napi_module_register combo with multiple module registrations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testModuleRegisterComboMultipleModules0080',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testModuleRegisterComboMultipleModules0080';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.moduleRegisterComboMultipleModules()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== napi_get_and_clear_last_exception 异常参数 ==========

    /**
     * @tc.name testGetAndClearLastExceptionNullEnvReturnsInvalidArg0081
     * @tc.number SUB_NSD_B1_GCLE_NULLENV_8100
     * @tc.desc   Verify napi_get_and_clear_last_exception returns napi_invalid_arg with NULL env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAndClearLastExceptionNullEnvReturnsInvalidArg0081',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetAndClearLastExceptionNullEnvReturnsInvalidArg0081';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getAndClearLastExceptionNullEnvReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetAndClearLastExceptionNullResultReturnsInvalidArg0082
     * @tc.number SUB_NSD_B1_GCLE_NULLRES_8200
     * @tc.desc   Verify napi_get_and_clear_last_exception returns napi_invalid_arg with NULL result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAndClearLastExceptionNullResultReturnsInvalidArg0082',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetAndClearLastExceptionNullResultReturnsInvalidArg0082';
      console.info(caseName + ' start');
      await Utils.sleep(20);
      expect(napispecdiffbatch1ndktest.getAndClearLastExceptionNullResultReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

  });
}
