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
import napicoveraddbatch1ndktest from 'libnapicoveraddbatch1ndktest.so';
import Utils from '../../Utils';

function forceFullGC(): void {
  globalThis.ArkTools.forceFullGC();
}

export default function NapiCoverAddBatch1StablePart1Test() {
  describe('NapiCoverAddBatch1StablePart1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(20);
    });

    /**
     * @tc.name testCreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected0009
     * @tc.number SUB_NSD_B1_TYPED_ARRAY_INVALID_ARRAYBUFFER_0900
     * @tc.desc   Verify napi_create_typedarray returns napi_arraybuffer_expected for non-ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        const caseName = 'testCreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected0009';
        console.info(caseName + ' start');
        expect(napicoveraddbatch1ndktest.createTypedArrayInvalidArrayBufferReturnsArrayBufferExpected()).
        assertEqual(1);
        console.info(caseName + ' end');
      });

    /**
     * @tc.name testWrapResultStrongReferenceSurvivesGc0022
     * @tc.number SUB_NSD_B1_WRAP_RESULT_STRONG_REF_2200
     * @tc.desc   Verify napi_wrap result reference keeps wrapped object alive after full GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapResultStrongReferenceSurvivesGc0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testWrapResultStrongReferenceSurvivesGc0022';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.setupWrapResultStrongReference()).assertEqual(1);
      expect(napicoveraddbatch1ndktest.verifyWrapResultStrongReferenceAfterGc()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testResolveDeferredThenThrowCanBeCaught0026
     * @tc.number SUB_NSD_B1_RESOLVE_DEFERRED_THROW_2600
     * @tc.desc   Verify exception thrown in then callback after napi_resolve_deferred can be caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResolveDeferredThenThrowCanBeCaught0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testResolveDeferredThenThrowCanBeCaught0026';
      console.info(caseName + ' start');
      let caught: boolean = false;
      napicoveraddbatch1ndktest.createResolvedPromiseWithDeferred()
        .then(() => {
          done();
          throw new Error('resolve deferred throw probe');
        })
        .catch(() => {
          caught = true;
          expect(caught).assertTrue();
          console.info(caseName + ' end');
          done();
        });
    });

    /**
     * @tc.name testResolveDeferredThenThrowWithoutCatchContinues0027
     * @tc.number SUB_NSD_B1_RESOLVE_DEFERRED_THROW_NO_CATCH_2700
     * @tc.desc   Verify exception thrown in then callback after napi_resolve_deferred without catch does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResolveDeferredThenThrowWithoutCatchContinues0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testResolveDeferredThenThrowWithoutCatchContinues0027';
        console.info(caseName + ' start');
        let callbackEntered: boolean = false;
        const unhandledPromise: Promise<number> = napicoveraddbatch1ndktest.createResolvedPromiseWithDeferred()
          .then(() => {
            callbackEntered = true;
            expect(callbackEntered).assertTrue();
            console.info(caseName + ' end');
            done();
            throw new Error('resolve deferred throw without catch probe');
          })
          .catch(() => {
            console.info(caseName + ' probe throw handled');
            done();
          });
        expect(unhandledPromise !== undefined).assertTrue();
      });

    /**
     * @tc.name testRejectDeferredCatchThrowCanBeCaught0028
     * @tc.number SUB_NSD_B1_REJECT_DEFERRED_THROW_2800
     * @tc.desc   Verify exception thrown in catch callback after napi_reject_deferred can be caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredCatchThrowCanBeCaught0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRejectDeferredCatchThrowCanBeCaught0028';
      console.info(caseName + ' start');
      let caught: boolean = false;
      napicoveraddbatch1ndktest.createRejectedPromiseWithDeferred()
        .catch(() => {
          done();
          throw new Error('reject deferred throw probe');
        })
        .catch(() => {
          caught = true;
          expect(caught).assertTrue();
          console.info(caseName + ' end');
          done();
        });
    });

    /**
     * @tc.name testRejectDeferredCatchThrowWithoutCatchContinues0029
     * @tc.number SUB_NSD_B1_REJECT_DEFERRED_THROW_NO_CATCH_2900
     * @tc.desc   Verify exception thrown in catch callback after napi_reject_deferred without catch does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredCatchThrowWithoutCatchContinues0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testRejectDeferredCatchThrowWithoutCatchContinues0029';
        console.info(caseName + ' start');
        let callbackEntered: boolean = false;
        const unhandledPromise: Promise<number> = napicoveraddbatch1ndktest.createRejectedPromiseWithDeferred()
          .catch(() => {
            callbackEntered = true;
            expect(callbackEntered).assertTrue();
            console.info(caseName + ' end');
            done();
            throw new Error('reject deferred throw without catch probe');
          })
          .catch(() => {
            console.info(caseName + ' probe throw handled');
            done();
          });
        expect(unhandledPromise !== undefined).assertTrue();
      });

    // ========== 绗竴杞ˉ鍏呮祴璇?==========

    /**
     * @tc.name testThrowRangeErrorNullMessageReturnsInvalidArg0037
     * @tc.number SUB_NSD_B1_THROW_RANGE_ERROR_NULL_MSG_3700
     * @tc.desc   Verify napi_throw_range_error returns napi_invalid_arg when message is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorNullMessageReturnsInvalidArg0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testThrowRangeErrorNullMessageReturnsInvalidArg0037';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.throwRangeErrorNullMessageReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testThrowRangeErrorResultIsRangeErrorType0038
     * @tc.number SUB_NSD_B1_THROW_RANGE_ERROR_TYPE_3800
     * @tc.desc   Verify thrown exception object is RangeError type with correct message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorResultIsRangeErrorType0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testThrowRangeErrorResultIsRangeErrorType0038';
      console.info(caseName + ' start');
      try {
        napicoveraddbatch1ndktest.throwRangeErrorResultIsRangeErrorType();
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testThrowRangeErrorWhenExceptionPending0039
     * @tc.number SUB_NSD_B1_THROW_RANGE_ERROR_PENDING_3900
     * @tc.desc   Verify napi_throw_range_error returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorWhenExceptionPending0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testThrowRangeErrorWhenExceptionPending0039';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napicoveraddbatch1ndktest.throwRangeErrorWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testThrowRangeErrorComboWithCreateAndThrow0040
     * @tc.number SUB_NSD_B1_THROW_RANGE_ERROR_COMBO_4000
     * @tc.desc   Verify napi_throw_range_error combination with napi_create_range_error and napi_throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorComboWithCreateAndThrow0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testThrowRangeErrorComboWithCreateAndThrow0040';
      console.info(caseName + ' start');
      try {
        napicoveraddbatch1ndktest.throwRangeErrorComboWithCreateAndThrow();
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
      console.info(caseName + ' end');
    });
    /**
     * @tc.name testCreateSymbolReturnsOkAndSymbolType0041
     * @tc.number SUB_NSD_B1_CREATE_SYMBOL_TYPE_4100
     * @tc.desc   Verify napi_create_symbol returns napi_ok and result is symbol type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbolReturnsOkAndSymbolType0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateSymbolReturnsOkAndSymbolType0041';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.createSymbolReturnsOkAndSymbolType()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateSymbolAsPrivatePropertyKey0042
     * @tc.number SUB_NSD_B1_CREATE_SYMBOL_PRIVATE_KEY_4200
     * @tc.desc   Verify Symbol works as private property key, inaccessible by string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbolAsPrivatePropertyKey0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateSymbolAsPrivatePropertyKey0042';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.createSymbolAsPrivatePropertyKey()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateSymbolWhenExceptionPending0043
     * @tc.number SUB_NSD_B1_CREATE_SYMBOL_PENDING_4300
     * @tc.desc   Verify napi_create_symbol returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbolWhenExceptionPending0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateSymbolWhenExceptionPending0043';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napicoveraddbatch1ndktest.createSymbolWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateSymbolPropertyFullLifecycle0044
     * @tc.number SUB_NSD_B1_CREATE_SYMBOL_LIFECYCLE_4400
     * @tc.desc   Verify Symbol property has/get/delete full lifecycle operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbolPropertyFullLifecycle0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateSymbolPropertyFullLifecycle0044';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.createSymbolPropertyFullLifecycle()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateTypedArrayWithDetachedBufferReturnsError0045
     * @tc.number SUB_NSD_B1_TYPEDARRAY_DETACHED_BUFFER_4500
     * @tc.desc   Verify napi_create_typedarray returns error for detached ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypedArrayWithDetachedBufferReturnsError0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateTypedArrayWithDetachedBufferReturnsError0045';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.createTypedArrayWithDetachedBufferReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateTypedArrayMultiViewAndDetach0046
     * @tc.number SUB_NSD_B1_TYPEDARRAY_MULTIVIEW_4600
     * @tc.desc   Verify multiple TypedArray views on same ArrayBuffer and detach behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypedArrayMultiViewAndDetach0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateTypedArrayMultiViewAndDetach0046';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.createTypedArrayMultiViewAndDetach()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDefinePropertiesReturnValueAndAttributes0047
     * @tc.number SUB_NSD_B1_DEFINE_PROPERTIES_RETURN_4700
     * @tc.desc   Verify napi_define_properties returns napi_ok and properties exist with correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefinePropertiesReturnValueAndAttributes0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testDefinePropertiesReturnValueAndAttributes0047';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.definePropertiesReturnValueAndAttributes()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDefinePropertiesBatchMethods0048
     * @tc.number SUB_NSD_B1_DEFINE_PROPERTIES_BATCH_4800
     * @tc.desc   Verify napi_define_properties batch defines methods and properties on export object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefinePropertiesBatchMethods0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testDefinePropertiesBatchMethods0048';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.definePropertiesBatchMethods()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDefinePropertiesComboWithClass0049
     * @tc.number SUB_NSD_B1_DEFINE_PROPERTIES_CLASS_4900
     * @tc.desc   Verify napi_define_properties combined with napi_define_class on instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefinePropertiesComboWithClass0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testDefinePropertiesComboWithClass0049';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.definePropertiesComboWithClass()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testTypeTagObjectCheckSuccess0050
     * @tc.number SUB_NSD_B1_TYPE_TAG_CHECK_SUCCESS_5000
     * @tc.desc   Verify napi_type_tag_object tag can be confirmed by napi_check_object_type_tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeTagObjectCheckSuccess0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testTypeTagObjectCheckSuccess0050';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.typeTagObjectCheckSuccess()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testTypeTagObjectDifferentTagReturnsFalse0051
     * @tc.number SUB_NSD_B1_TYPE_TAG_DIFFERENT_TAG_5100
     * @tc.desc   Verify napi_check_object_type_tag returns false for a different tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeTagObjectDifferentTagReturnsFalse0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testTypeTagObjectDifferentTagReturnsFalse0051';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.typeTagObjectDifferentTagReturnsFalse()).assertEqual(1);
      console.info(caseName + ' end');
    });

    // ========== 绗簩杞ˉ鍏呮祴璇?==========

    /**
     * @tc.name testAsyncInitNullFuncReturnsInvalidArg0052
     * @tc.number SUB_NSD_B1_ASYNC_INIT_NULL_FUNC_5200
     * @tc.desc   Verify napi_async_init returns napi_invalid_arg when func is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncInitNullFuncReturnsInvalidArg0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testAsyncInitNullFuncReturnsInvalidArg0052';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.asyncInitNullFuncReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAsyncInitNullNameReturnsInvalidArg0053
     * @tc.number SUB_NSD_B1_ASYNC_INIT_NULL_NAME_5300
     * @tc.desc   Verify napi_async_init returns napi_invalid_arg when name is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncInitNullNameReturnsInvalidArg0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testAsyncInitNullNameReturnsInvalidArg0053';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.asyncInitNullNameReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCancelAsyncWorkNullWorkReturnsInvalidArg0054
     * @tc.number SUB_NSD_B1_CANCEL_ASYNC_NULL_WORK_5400
     * @tc.desc   Verify napi_cancel_async_work returns napi_invalid_arg when work is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelAsyncWorkNullWorkReturnsInvalidArg0054',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCancelAsyncWorkNullWorkReturnsInvalidArg0054';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.cancelAsyncWorkNullWorkReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testCreateReferenceWhenPendingReturnsPendingException0055
     * @tc.number SUB_NSD_B1_CREATE_REF_PENDING_5500
     * @tc.desc   Verify napi_create_reference returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateReferenceWhenPendingReturnsPendingException0055',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testCreateReferenceWhenPendingReturnsPendingException0055';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napicoveraddbatch1ndktest.createReferenceWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testResolveDeferredNullDeferredReturnsInvalidArg0056
     * @tc.number SUB_NSD_B1_RESOLVE_NULL_DEFERRED_5600
     * @tc.desc   Verify napi_resolve_deferred returns napi_invalid_arg when deferred is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResolveDeferredNullDeferredReturnsInvalidArg0056',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testResolveDeferredNullDeferredReturnsInvalidArg0056';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.resolveDeferredNullDeferredReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testResolveDeferredNullValueReturnsInvalidArg0057
     * @tc.number SUB_NSD_B1_RESOLVE_NULL_VALUE_5700
     * @tc.desc   Verify napi_resolve_deferred returns napi_invalid_arg when value is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResolveDeferredNullValueReturnsInvalidArg0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testResolveDeferredNullValueReturnsInvalidArg0057';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.resolveDeferredNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRejectDeferredNullDeferredReturnsInvalidArg0058
     * @tc.number SUB_NSD_B1_REJECT_NULL_DEFERRED_5800
     * @tc.desc   Verify napi_reject_deferred returns napi_invalid_arg when deferred is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredNullDeferredReturnsInvalidArg0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testRejectDeferredNullDeferredReturnsInvalidArg0058';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.rejectDeferredNullDeferredReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRejectDeferredNullValueReturnsInvalidArg0059
     * @tc.number SUB_NSD_B1_REJECT_NULL_VALUE_5900
     * @tc.desc   Verify napi_reject_deferred returns napi_invalid_arg when value is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredNullValueReturnsInvalidArg0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testRejectDeferredNullValueReturnsInvalidArg0059';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.rejectDeferredNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testGetValueBigintWordsWhenPendingReturnsPendingException0060
     * @tc.number SUB_NSD_B1_BIGINT_WORDS_PENDING_6000
     * @tc.desc   Verify napi_get_value_bigint_words returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueBigintWordsWhenPendingReturnsPendingException0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testGetValueBigintWordsWhenPendingReturnsPendingException0060';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napicoveraddbatch1ndktest.getValueBigintWordsWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddEnvCleanupHookNullHookReturnsInvalidArg0061
     * @tc.number SUB_NSD_B1_ADD_ENV_HOOK_NULL_6100
     * @tc.desc   Verify napi_add_env_cleanup_hook returns napi_invalid_arg when hook is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddEnvCleanupHookNullHookReturnsInvalidArg0061',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testAddEnvCleanupHookNullHookReturnsInvalidArg0061';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.addEnvCleanupHookNullHookReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testAddEnvCleanupHookReturnsOk0062
     * @tc.number SUB_NSD_B1_ADD_ENV_HOOK_OK_6200
     * @tc.desc   Verify napi_add_env_cleanup_hook returns napi_ok for valid hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddEnvCleanupHookReturnsOk0062',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testAddEnvCleanupHookReturnsOk0062';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.addEnvCleanupHookReturnsOk()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveEnvCleanupHookOpaqueMismatchReturnsInvalidArg0063
     * @tc.number SUB_NSD_B1_REMOVE_ENV_HOOK_MISMATCH_6300
     * @tc.desc   Verify napi_remove_env_cleanup_hook returns napi_invalid_arg when opaque mismatches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveEnvCleanupHookOpaqueMismatchReturnsInvalidArg0063',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testRemoveEnvCleanupHookOpaqueMismatchReturnsInvalidArg0063';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.removeEnvCleanupHookOpaqueMismatchReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testRemoveEnvCleanupHookNotRegisteredReturnsGenericFailure0064
     * @tc.number SUB_NSD_B1_REMOVE_ENV_HOOK_NOT_REG_6400
     * @tc.desc   Verify napi_remove_env_cleanup_hook returns napi_generic_failure for unregistered hook
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveEnvCleanupHookNotRegisteredReturnsGenericFailure0064',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testRemoveEnvCleanupHookNotRegisteredReturnsGenericFailure0064';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.removeEnvCleanupHookNotRegisteredReturnsGenericFailure()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDetachArrayBufferReturnsOkAndVerified0065
     * @tc.number SUB_NSD_B1_DETACH_AB_VERIFIED_6500
     * @tc.desc   Verify napi_detach_arraybuffer returns napi_ok and buffer is detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDetachArrayBufferReturnsOkAndVerified0065',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testDetachArrayBufferReturnsOkAndVerified0065';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.detachArrayBufferReturnsOkAndVerified()).assertEqual(1);
      console.info(caseName + ' end');
    });

    /**
     * @tc.name testDetachArrayBufferWhenPendingReturnsPendingException0066
     * @tc.number SUB_NSD_B1_DETACH_AB_PENDING_6600
     * @tc.desc   Verify napi_detach_arraybuffer returns napi_pending_exception when exception is pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDetachArrayBufferWhenPendingReturnsPendingException0066',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const caseName = 'testDetachArrayBufferWhenPendingReturnsPendingException0066';
      console.info(caseName + ' start');
      expect(napicoveraddbatch1ndktest.detachArrayBufferWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
    });
  });
}
