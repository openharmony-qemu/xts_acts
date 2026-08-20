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
import napispecdiffbatch1ndktest from 'libnapispecdiffbatch1ndktest.so';
import Utils from '../../Utils';

function forceFullGC(): void {
  globalThis.ArkTools.forceFullGC();
}

export default function NapiSpecDiffBatch1StablePart1Test() {
  describe('NapiSpecDiffBatch1StablePart1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(20);
    });


    /**
     * @tc.name testThrowErrorNullCodeKeepsOpenHarmonyBehavior0001
     * @tc.number SUB_NSD_B1_THROW_ERROR_NULL_CODE_0100
     * @tc.desc   Verify napi_throw_error keeps OpenHarmony behavior when code is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowErrorNullCodeKeepsOpenHarmonyBehavior0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowErrorNullCodeKeepsOpenHarmonyBehavior0001';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.throwErrorNullCodeKeepsOpenHarmonyBehavior()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior0002
     * @tc.number SUB_NSD_B1_THROW_TYPE_ERROR_NULL_CODE_0200
     * @tc.desc   Verify napi_throw_type_error keeps OpenHarmony behavior when code is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior0002';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.throwTypeErrorNullCodeKeepsOpenHarmonyBehavior()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior0003
     * @tc.number SUB_NSD_B1_THROW_RANGE_ERROR_NULL_CODE_0300
     ** @tc.desc   Verify napi_throw_range_error keeps OpenHarmony behavior when code is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior0003';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.throwRangeErrorNullCodeKeepsOpenHarmonyBehavior()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateErrorSupportsStringAndNumberCode0004
     * @tc.number SUB_NSD_B1_CREATE_ERROR_CODE_TYPES_0400
     * @tc.desc   Verify napi_create_error supports string and number code and rejects object code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateErrorSupportsStringAndNumberCode0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateErrorSupportsStringAndNumberCode0004';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createErrorSupportsStringAndNumberCode()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateTypeErrorNumberCodeAndObjectCodeInvalid0005
     * @tc.number SUB_NSD_B1_CREATE_TYPE_ERROR_CODE_TYPES_0500
     ** @tc.desc   Verify napi_create_type_error supports number code and rejects object code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeErrorNumberCodeAndObjectCodeInvalid0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateTypeErrorNumberCodeAndObjectCodeInvalid0005';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createTypeErrorNumberCodeAndObjectCodeInvalid()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateRangeErrorNumberCodeAndObjectCodeInvalid0006
     * @tc.number SUB_NSD_B1_CREATE_RANGE_ERROR_CODE_TYPES_0600
     * @tc.desc   Verify napi_create_range_error supports number code and rejects object code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeErrorNumberCodeAndObjectCodeInvalid0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateRangeErrorNumberCodeAndObjectCodeInvalid0006';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createRangeErrorNumberCodeAndObjectCodeInvalid()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateReferenceSupportsNonObjectValues0007
     * @tc.number SUB_NSD_B1_CREATE_REFERENCE_NON_OBJECT_0700
     * @tc.desc   Verify napi_create_reference supports non-object values in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateReferenceSupportsNonObjectValues0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateReferenceSupportsNonObjectValues0007';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createReferenceSupportsNonObjectValues()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateSymbolInvalidDescriptionReturnsInvalidArg0008
     * @tc.number SUB_NSD_B1_CREATE_SYMBOL_INVALID_DESCRIPTION_0800
     * @tc.desc   Verify napi_create_symbol returns napi_invalid_arg for non-string description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbolInvalidDescriptionReturnsInvalidArg0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateSymbolInvalidDescriptionReturnsInvalidArg0008';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createSymbolInvalidDescriptionReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        const caseName = 'testCreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected0009';
        console.info(caseName + ' start');
        expect(napispecdiffbatch1ndktest.createTypedArrayInvalidArrayBufferReturnsArrayBufferExpected()).
        assertEqual(1);
        console.info(caseName + ' end');
        done();
      });

    /**
     * @tc.name testCreateDataViewInvalidAndOverflowArrayBuffer0010
     * @tc.number SUB_NSD_B1_DATA_VIEW_INVALID_AND_OVERFLOW_1000
     * @tc.desc   Verify napi_create_dataview invalid arraybuffer and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDataViewInvalidAndOverflowArrayBuffer0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateDataViewInvalidAndOverflowArrayBuffer0010';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createDataViewInvalidAndOverflowArrayBuffer()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetTypedArrayInfoLengthReturnsByteLength0011
     * @tc.number SUB_NSD_B1_TYPED_ARRAY_INFO_BYTE_LENGTH_1100
     * @tc.desc   Verify napi_get_typedarray_info length returns byte length in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTypedArrayInfoLengthReturnsByteLength0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetTypedArrayInfoLengthReturnsByteLength0011';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.getTypedArrayInfoLengthReturnsByteLength()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCoerceUndefinedAndNullToObjectReturnsUndefined0012
     * @tc.number SUB_NSD_B1_COERCE_NULL_UNDEFINED_1200
     * @tc.desc   Verify napi_coerce_to_object returns undefined for null and undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCoerceUndefinedAndNullToObjectReturnsUndefined0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCoerceUndefinedAndNullToObjectReturnsUndefined0012';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.coerceUndefinedAndNullToObjectReturnsUndefined()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testInstanceOfInvalidArgumentsReturnExpectedStatus0013
     * @tc.number SUB_NSD_B1_INSTANCEOF_INVALID_ARGS_1300
     * @tc.desc   Verify napi_instanceof invalid object and constructor status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInstanceOfInvalidArgumentsReturnExpectedStatus0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testInstanceOfInvalidArgumentsReturnExpectedStatus0013';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.instanceOfInvalidArgumentsReturnExpectedStatus()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testPropertyApisNonObjectReturnObjectExpected0014
     * @tc.number SUB_NSD_B1_PROPERTY_APIS_NON_OBJECT_1400
     * @tc.desc   Verify property APIs return napi_object_expected when object argument is not Object or Function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPropertyApisNonObjectReturnObjectExpected0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testPropertyApisNonObjectReturnObjectExpected0014';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.propertyApisNonObjectReturnObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testTypeTagNonObjectReturnsObjectExpected0015
     * @tc.number SUB_NSD_B1_TYPE_TAG_NON_OBJECT_1500
     * @tc.desc   Verify type tag APIs return napi_object_expected for non-object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeTagNonObjectReturnsObjectExpected0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeTagNonObjectReturnsObjectExpected0015';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.typeTagNonObjectReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testDefinePropertiesClearsExceptionAndContinues0016
     * @tc.number SUB_NSD_B1_DEFINE_PROPERTIES_CONTINUE_1600
     * @tc.desc   Verify napi_define_properties clears property definition exception and continues descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefinePropertiesClearsExceptionAndContinues0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDefinePropertiesClearsExceptionAndContinues0016';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.definePropertiesClearsExceptionAndContinues()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCallFunctionInvalidFuncReturnsFunctionExpected0017
     * @tc.number SUB_NSD_B1_CALL_FUNCTION_INVALID_FUNC_1700
     * @tc.desc   Verify napi_call_function returns napi_function_expected for non-function func
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallFunctionInvalidFuncReturnsFunctionExpected0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCallFunctionInvalidFuncReturnsFunctionExpected0017';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.callFunctionInvalidFuncReturnsFunctionExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testNewInstanceInvalidConstructorReturnsFunctionExpected0018
     * @tc.number SUB_NSD_B1_NEW_INSTANCE_INVALID_CTOR_1800
     * @tc.desc   Verify napi_new_instance returns napi_function_expected for non-function constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewInstanceInvalidConstructorReturnsFunctionExpected0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNewInstanceInvalidConstructorReturnsFunctionExpected0018';
        console.info(caseName + ' start');
        expect(napispecdiffbatch1ndktest.newInstanceInvalidConstructorReturnsFunctionExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
      });

    /**
     * @tc.name testDefineClassHugeLengthReturnsObjectExpected0019
     * @tc.number SUB_NSD_B1_DEFINE_CLASS_HUGE_LENGTH_1900
     * @tc.desc   Verify napi_define_class returns napi_object_expected when class name length exceeds INT_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefineClassHugeLengthReturnsObjectExpected0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDefineClassHugeLengthReturnsObjectExpected0019';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.defineClassHugeLengthReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testWrapNullFinalizerReturnsInvalidArg0020
     * @tc.number SUB_NSD_B1_WRAP_NULL_FINALIZER_2000
     * @tc.desc   Verify napi_wrap returns napi_invalid_arg when finalize callback is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapNullFinalizerReturnsInvalidArg0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testWrapNullFinalizerReturnsInvalidArg0020';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.wrapNullFinalizerReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testWrapUnwrapRemoveWrapNonObjectReturnObjectExpected0021
     * @tc.number SUB_NSD_B1_WRAP_NON_OBJECT_2100
     * @tc.desc   Verify wrap related APIs return napi_object_expected for non-object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapUnwrapRemoveWrapNonObjectReturnObjectExpected0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testWrapUnwrapRemoveWrapNonObjectReturnObjectExpected0021';
        console.info(caseName + ' start');
        expect(napispecdiffbatch1ndktest.wrapUnwrapRemoveWrapNonObjectReturnObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testWrapResultStrongReferenceSurvivesGc0022';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.setupWrapResultStrongReference()).assertEqual(1);
      forceFullGC();
      expect(napispecdiffbatch1ndktest.verifyWrapResultStrongReferenceAfterGc()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testAsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks0023
     * @tc.number SUB_NSD_B1_ASYNC_HOOKS_UNSUPPORTED_2300
     * @tc.desc   Verify async init and destroy work without async_hooks interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testAsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks0023';
        console.info(caseName + ' start');
        expect(napispecdiffbatch1ndktest.asyncInitMakeCallbackDestroyWorksWithoutAsyncHooks()).assertEqual(1);
      console.info(caseName + ' end');
      done();
      });

    /**
     * @tc.name testCancelAsyncWorkStatusLayering0024
     * @tc.number SUB_NSD_B1_CANCEL_ASYNC_WORK_STATUS_2400
     * @tc.desc   Verify napi_cancel_async_work returns current OpenHarmony status for unqueued and running work
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelAsyncWorkStatusLayering0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCancelAsyncWorkStatusLayering0024';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.cancelAsyncWorkStatusLayering()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetNodeVersionDoesNotWriteVersionPointer0025
     * @tc.number SUB_NSD_B1_GET_NODE_VERSION_EMPTY_2500
     * @tc.desc   Verify napi_get_node_version returns napi_ok without writing the version pointer in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetNodeVersionDoesNotWriteVersionPointer0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetNodeVersionDoesNotWriteVersionPointer0025';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.getNodeVersionDoesNotWriteVersionPointer()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      napispecdiffbatch1ndktest.createResolvedPromiseWithDeferred()
        .then(() => {
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
        const unhandledPromise: Promise<number> = napispecdiffbatch1ndktest.createResolvedPromiseWithDeferred()
          .then(() => {
            callbackEntered = true;
            expect(callbackEntered).assertTrue();
            console.info(caseName + ' end');
            done();
            throw new Error('resolve deferred throw without catch probe');
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
      napispecdiffbatch1ndktest.createRejectedPromiseWithDeferred()
        .catch(() => {
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
        const unhandledPromise: Promise<number> = napispecdiffbatch1ndktest.createRejectedPromiseWithDeferred()
          .catch(() => {
            callbackEntered = true;
            expect(callbackEntered).assertTrue();
            console.info(caseName + ' end');
            done();
            throw new Error('reject deferred throw without catch probe');
          });
        expect(unhandledPromise !== undefined).assertTrue();
      });

    /**
     * @tc.name testGetValueBigIntWordsNonBigIntReturnsObjectExpected0030
     * @tc.number SUB_NSD_B1_BIGINT_WORDS_NON_BIGINT_3000
     * @tc.desc   Verify napi_get_value_bigint_words returns napi_object_expected for non-BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueBigIntWordsNonBigIntReturnsObjectExpected0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testGetValueBigIntWordsNonBigIntReturnsObjectExpected0030';
        console.info(caseName + ' start');
        expect(napispecdiffbatch1ndktest.getValueBigIntWordsNonBigIntReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
      });

    /**
     * @tc.name testDuplicateEnvCleanupHookRegistrationAndRemove0031
     * @tc.number SUB_NSD_B1_ENV_CLEANUP_HOOK_DUPLICATE_3100
     * @tc.desc   Verify duplicate napi_add_env_cleanup_hook registration and removal return current status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDuplicateEnvCleanupHookRegistrationAndRemove0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDuplicateEnvCleanupHookRegistrationAndRemove0031';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.duplicateEnvCleanupHookRegistrationAndRemove()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateBufferBoundaryStatus0032
     * @tc.number SUB_NSD_B1_CREATE_BUFFER_BOUNDARY_3200
     * @tc.desc   Verify napi_create_buffer OpenHarmony boundary statuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBufferBoundaryStatus0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateBufferBoundaryStatus0032';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createBufferBoundaryStatus()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateBufferCopyBoundaryStatus0033
     * @tc.number SUB_NSD_B1_CREATE_BUFFER_COPY_BOUNDARY_3300
     * @tc.desc   Verify napi_create_buffer_copy OpenHarmony boundary statuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBufferCopyBoundaryStatus0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateBufferCopyBoundaryStatus0033';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createBufferCopyBoundaryStatus()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateExternalBufferBoundaryStatus0034
     * @tc.number SUB_NSD_B1_CREATE_EXTERNAL_BUFFER_BOUNDARY_3400
     * @tc.desc   Verify napi_create_external_buffer OpenHarmony boundary statuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateExternalBufferBoundaryStatus0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateExternalBufferBoundaryStatus0034';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createExternalBufferBoundaryStatus()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetBufferInfoNonBufferReturnsArrayBufferExpected0035
     * @tc.number SUB_NSD_B1_GET_BUFFER_INFO_NON_BUFFER_3500
     * @tc.desc   Verify napi_get_buffer_info returns napi_arraybuffer_expected for non-buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetBufferInfoNonBufferReturnsArrayBufferExpected0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testGetBufferInfoNonBufferReturnsArrayBufferExpected0035';
        console.info(caseName + ' start');
        expect(napispecdiffbatch1ndktest.getBufferInfoNonBufferReturnsArrayBufferExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
      });

    /**
     * @tc.name testDetachArrayBufferStatusLayering0036
     * @tc.number SUB_NSD_B1_DETACH_ARRAYBUFFER_STATUS_3600
     * @tc.desc   Verify napi_detach_arraybuffer status layering for number, object and ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDetachArrayBufferStatusLayering0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDetachArrayBufferStatusLayering0036';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.detachArrayBufferStatusLayering()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== 第一轮补充测试 ==========

    /**
     * @tc.name testThrowRangeErrorNullMessageReturnsInvalidArg0037
     * @tc.number SUB_NSD_B1_THROW_RANGE_ERROR_NULL_MSG_3700
     * @tc.desc   Verify napi_throw_range_error returns napi_invalid_arg when message is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorNullMessageReturnsInvalidArg0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowRangeErrorNullMessageReturnsInvalidArg0037';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.throwRangeErrorNullMessageReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowRangeErrorResultIsRangeErrorType0038';
      console.info(caseName + ' start');
      try {
        napispecdiffbatch1ndktest.throwRangeErrorResultIsRangeErrorType();
        expect(false).assertTrue();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowRangeErrorWhenExceptionPending0039';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napispecdiffbatch1ndktest.throwRangeErrorWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testThrowRangeErrorComboWithCreateAndThrow0040';
      console.info(caseName + ' start');
      try {
        napispecdiffbatch1ndktest.throwRangeErrorComboWithCreateAndThrow();
        expect(false).assertTrue();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
        expect((e as Error).message).assertContain('0-100');
      }
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateSymbolReturnsOkAndSymbolType0041';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createSymbolReturnsOkAndSymbolType()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateSymbolAsPrivatePropertyKey0042';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createSymbolAsPrivatePropertyKey()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateSymbolWhenExceptionPending0043';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napispecdiffbatch1ndktest.createSymbolWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateSymbolPropertyFullLifecycle0044';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createSymbolPropertyFullLifecycle()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateTypedArrayWithDetachedBufferReturnsError0045';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createTypedArrayWithDetachedBufferReturnsError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateTypedArrayMultiViewAndDetach0046';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.createTypedArrayMultiViewAndDetach()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDefinePropertiesReturnValueAndAttributes0047';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.definePropertiesReturnValueAndAttributes()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDefinePropertiesBatchMethods0048';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.definePropertiesBatchMethods()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDefinePropertiesComboWithClass0049';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.definePropertiesComboWithClass()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeTagObjectCheckSuccess0050';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.typeTagObjectCheckSuccess()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testTypeTagObjectDifferentTagReturnsFalse0051';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.typeTagObjectDifferentTagReturnsFalse()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ========== 第二轮补充测试 ==========

    /**
     * @tc.name testAsyncInitNullFuncReturnsInvalidArg0052
     * @tc.number SUB_NSD_B1_ASYNC_INIT_NULL_FUNC_5200
     * @tc.desc   Verify napi_async_init returns napi_invalid_arg when func is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncInitNullFuncReturnsInvalidArg0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAsyncInitNullFuncReturnsInvalidArg0052';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.asyncInitNullFuncReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAsyncInitNullNameReturnsInvalidArg0053';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.asyncInitNullNameReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCancelAsyncWorkNullWorkReturnsInvalidArg0054';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.cancelAsyncWorkNullWorkReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateReferenceWhenPendingReturnsPendingException0055';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napispecdiffbatch1ndktest.createReferenceWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testResolveDeferredNullDeferredReturnsInvalidArg0056';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.resolveDeferredNullDeferredReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testResolveDeferredNullValueReturnsInvalidArg0057';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.resolveDeferredNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRejectDeferredNullDeferredReturnsInvalidArg0058';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.rejectDeferredNullDeferredReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRejectDeferredNullValueReturnsInvalidArg0059';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.rejectDeferredNullValueReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetValueBigintWordsWhenPendingReturnsPendingException0060';
      console.info(caseName + ' start');
      let caught: boolean = false;
      try {
        napispecdiffbatch1ndktest.getValueBigintWordsWhenPendingReturnsPendingException();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAddEnvCleanupHookNullHookReturnsInvalidArg0061';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.addEnvCleanupHookNullHookReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAddEnvCleanupHookReturnsOk0062';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.addEnvCleanupHookReturnsOk()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRemoveEnvCleanupHookOpaqueMismatchReturnsInvalidArg0063';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.removeEnvCleanupHookOpaqueMismatchReturnsInvalidArg()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testRemoveEnvCleanupHookNotRegisteredReturnsGenericFailure0064';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.removeEnvCleanupHookNotRegisteredReturnsGenericFailure()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDetachArrayBufferReturnsOkAndVerified0065';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.detachArrayBufferReturnsOkAndVerified()).assertEqual(1);
      console.info(caseName + ' end');
      done();
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
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testDetachArrayBufferWhenPendingReturnsPendingException0066';
      console.info(caseName + ' start');
      expect(napispecdiffbatch1ndktest.detachArrayBufferWhenPendingReturnsPendingException()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });
  });
}
