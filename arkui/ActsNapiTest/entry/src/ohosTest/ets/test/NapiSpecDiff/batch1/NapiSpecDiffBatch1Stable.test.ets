/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napispecdiffbatch1ndktest from 'libnapispecdiffbatch1ndktest.so';

interface ArkToolsApi {
  forceFullGC(): void;
}

interface GlobalWithArkTools {
  ArkTools?: ArkToolsApi;
}

function forceFullGC(): void {
  const arkTools: ArkToolsApi | undefined = (globalThis as GlobalWithArkTools).ArkTools;
  if (arkTools !== undefined) {
    arkTools.forceFullGC();
  }
}

export default function napiSpecDiffBatch1StableTest() {
  describe('NapiSpecDiffBatch1StableTest', () => {
    /**
     * @tc.name   testThrowErrorNullCodeKeepsOpenHarmonyBehavior
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_THROW_ERROR_NULL_CODE
     * @tc.desc   Verify napi_throw_error keeps OpenHarmony behavior when code is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowErrorNullCodeKeepsOpenHarmonyBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-001
      expect(napispecdiffbatch1ndktest.throwErrorNullCodeKeepsOpenHarmonyBehavior()).assertEqual(1);
    });

    /**
     * @tc.name   testThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_THROW_TYPE_ERROR_NULL_CODE
     * @tc.desc   Verify napi_throw_type_error keeps OpenHarmony behavior when code is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowTypeErrorNullCodeKeepsOpenHarmonyBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-002
      expect(napispecdiffbatch1ndktest.throwTypeErrorNullCodeKeepsOpenHarmonyBehavior()).assertEqual(1);
    });

    /**
     * @tc.name   testThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_THROW_RANGE_ERROR_NULL_CODE
     * @tc.desc   Verify napi_throw_range_error keeps OpenHarmony behavior when code is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowRangeErrorNullCodeKeepsOpenHarmonyBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-003
      expect(napispecdiffbatch1ndktest.throwRangeErrorNullCodeKeepsOpenHarmonyBehavior()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateErrorSupportsStringAndNumberCode
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_ERROR_CODE_TYPES
     * @tc.desc   Verify napi_create_error supports string and number code and rejects object code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateErrorSupportsStringAndNumberCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-004
      expect(napispecdiffbatch1ndktest.createErrorSupportsStringAndNumberCode()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateTypeErrorNumberCodeAndObjectCodeInvalid
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_TYPE_ERROR_CODE_TYPES
     * @tc.desc   Verify napi_create_type_error supports number code and rejects object code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeErrorNumberCodeAndObjectCodeInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-005 OH-NAPI-DIFF-006
      expect(napispecdiffbatch1ndktest.createTypeErrorNumberCodeAndObjectCodeInvalid()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateRangeErrorNumberCodeAndObjectCodeInvalid
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_RANGE_ERROR_CODE_TYPES
     * @tc.desc   Verify napi_create_range_error supports number code and rejects object code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeErrorNumberCodeAndObjectCodeInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-007 OH-NAPI-DIFF-008
      expect(napispecdiffbatch1ndktest.createRangeErrorNumberCodeAndObjectCodeInvalid()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateReferenceSupportsNonObjectValues
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_REFERENCE_NON_OBJECT
     * @tc.desc   Verify napi_create_reference supports non-object values in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateReferenceSupportsNonObjectValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-009
      expect(napispecdiffbatch1ndktest.createReferenceSupportsNonObjectValues()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateSymbolInvalidDescriptionReturnsInvalidArg
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_SYMBOL_INVALID_DESCRIPTION
     * @tc.desc   Verify napi_create_symbol returns napi_invalid_arg for non-string description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbolInvalidDescriptionReturnsInvalidArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-011
      expect(napispecdiffbatch1ndktest.createSymbolInvalidDescriptionReturnsInvalidArg()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_TYPED_ARRAY_INVALID_ARRAYBUFFER
     * @tc.desc   Verify napi_create_typedarray returns napi_arraybuffer_expected for non-ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypedArrayInvalidArrayBufferReturnsArrayBufferExpected',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        // OH-NAPI-DIFF-012
        expect(napispecdiffbatch1ndktest.createTypedArrayInvalidArrayBufferReturnsArrayBufferExpected()).assertEqual(1);
      });

    /**
     * @tc.name   testCreateDataViewInvalidAndOverflowArrayBuffer
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_DATA_VIEW_INVALID_AND_OVERFLOW
     * @tc.desc   Verify napi_create_dataview invalid arraybuffer and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDataViewInvalidAndOverflowArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-013 OH-NAPI-DIFF-014
      expect(napispecdiffbatch1ndktest.createDataViewInvalidAndOverflowArrayBuffer()).assertEqual(1);
    });

    /**
     * @tc.name   testGetTypedArrayInfoLengthReturnsByteLength
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_TYPED_ARRAY_INFO_BYTE_LENGTH
     * @tc.desc   Verify napi_get_typedarray_info length returns byte length in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetTypedArrayInfoLengthReturnsByteLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-015
      expect(napispecdiffbatch1ndktest.getTypedArrayInfoLengthReturnsByteLength()).assertEqual(1);
    });

    /**
     * @tc.name   testCoerceUndefinedAndNullToObjectReturnsUndefined
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_COERCE_NULL_UNDEFINED
     * @tc.desc   Verify napi_coerce_to_object returns undefined for null and undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCoerceUndefinedAndNullToObjectReturnsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-018
      expect(napispecdiffbatch1ndktest.coerceUndefinedAndNullToObjectReturnsUndefined()).assertEqual(1);
    });

    /**
     * @tc.name   testInstanceOfInvalidArgumentsReturnExpectedStatus
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_INSTANCEOF_INVALID_ARGS
     * @tc.desc   Verify napi_instanceof invalid object and constructor status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInstanceOfInvalidArgumentsReturnExpectedStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-019 OH-NAPI-DIFF-020
      expect(napispecdiffbatch1ndktest.instanceOfInvalidArgumentsReturnExpectedStatus()).assertEqual(1);
    });

    /**
     * @tc.name   testPropertyApisNonObjectReturnObjectExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_PROPERTY_APIS_NON_OBJECT
     * @tc.desc   Verify property APIs return napi_object_expected when object argument is not Object or Function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPropertyApisNonObjectReturnObjectExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-021
      expect(napispecdiffbatch1ndktest.propertyApisNonObjectReturnObjectExpected()).assertEqual(1);
    });

    /**
     * @tc.name   testTypeTagNonObjectReturnsObjectExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_TYPE_TAG_NON_OBJECT
     * @tc.desc   Verify type tag APIs return napi_object_expected for non-object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTypeTagNonObjectReturnsObjectExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-024 OH-NAPI-DIFF-025
      expect(napispecdiffbatch1ndktest.typeTagNonObjectReturnsObjectExpected()).assertEqual(1);
    });

    /**
     * @tc.name   testDefinePropertiesClearsExceptionAndContinues
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_DEFINE_PROPERTIES_CONTINUE
     * @tc.desc   Verify napi_define_properties clears property definition exception and continues descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefinePropertiesClearsExceptionAndContinues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-023
      expect(napispecdiffbatch1ndktest.definePropertiesClearsExceptionAndContinues()).assertEqual(1);
    });

    /**
     * @tc.name   testCallFunctionInvalidFuncReturnsFunctionExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CALL_FUNCTION_INVALID_FUNC
     * @tc.desc   Verify napi_call_function returns napi_function_expected for non-function func
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallFunctionInvalidFuncReturnsFunctionExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-027
      expect(napispecdiffbatch1ndktest.callFunctionInvalidFuncReturnsFunctionExpected()).assertEqual(1);
    });

    /**
     * @tc.name   testNewInstanceInvalidConstructorReturnsFunctionExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_NEW_INSTANCE_INVALID_CTOR
     * @tc.desc   Verify napi_new_instance returns napi_function_expected for non-function constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewInstanceInvalidConstructorReturnsFunctionExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      () => {
        // OH-NAPI-DIFF-028
        expect(napispecdiffbatch1ndktest.newInstanceInvalidConstructorReturnsFunctionExpected()).assertEqual(1);
      });

    /**
     * @tc.name   testDefineClassHugeLengthReturnsObjectExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_DEFINE_CLASS_HUGE_LENGTH
     * @tc.desc   Verify napi_define_class returns napi_object_expected when class name length exceeds INT_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDefineClassHugeLengthReturnsObjectExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-029
      expect(napispecdiffbatch1ndktest.defineClassHugeLengthReturnsObjectExpected()).assertEqual(1);
    });

    /**
     * @tc.name   testWrapNullFinalizerReturnsInvalidArg
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_WRAP_NULL_FINALIZER
     * @tc.desc   Verify napi_wrap returns napi_invalid_arg when finalize callback is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapNullFinalizerReturnsInvalidArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-030
      expect(napispecdiffbatch1ndktest.wrapNullFinalizerReturnsInvalidArg()).assertEqual(1);
    });

    /**
     * @tc.name   testWrapUnwrapRemoveWrapNonObjectReturnObjectExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_WRAP_NON_OBJECT
     * @tc.desc   Verify wrap related APIs return napi_object_expected for non-object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapUnwrapRemoveWrapNonObjectReturnObjectExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      () => {
        // OH-NAPI-DIFF-032
        expect(napispecdiffbatch1ndktest.wrapUnwrapRemoveWrapNonObjectReturnObjectExpected()).assertEqual(1);
      });

    /**
     * @tc.name   testWrapResultStrongReferenceSurvivesGc
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_WRAP_RESULT_STRONG_REF
     * @tc.desc   Verify napi_wrap result reference keeps wrapped object alive after full GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapResultStrongReferenceSurvivesGc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-031
      expect(napispecdiffbatch1ndktest.setupWrapResultStrongReference()).assertEqual(1);
      forceFullGC();
      expect(napispecdiffbatch1ndktest.verifyWrapResultStrongReferenceAfterGc()).assertEqual(1);
    });

    /**
     * @tc.name   testAsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_ASYNC_HOOKS_UNSUPPORTED
     * @tc.desc   Verify async init and destroy work without async_hooks interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAsyncInitMakeCallbackDestroyWorksWithoutAsyncHooks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      () => {
        // OH-NAPI-DIFF-036
        expect(napispecdiffbatch1ndktest.asyncInitMakeCallbackDestroyWorksWithoutAsyncHooks()).assertEqual(1);
      });

    /**
     * @tc.name   testCancelAsyncWorkStatusLayering
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CANCEL_ASYNC_WORK_STATUS
     * @tc.desc   Verify napi_cancel_async_work returns current OpenHarmony status for unqueued and running work
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelAsyncWorkStatusLayering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-035
      expect(napispecdiffbatch1ndktest.cancelAsyncWorkStatusLayering()).assertEqual(1);
    });

    /**
     * @tc.name   testGetNodeVersionDoesNotWriteVersionPointer
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_GET_NODE_VERSION_EMPTY
     * @tc.desc   Verify napi_get_node_version returns napi_ok without writing the version pointer in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetNodeVersionDoesNotWriteVersionPointer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-037
      expect(napispecdiffbatch1ndktest.getNodeVersionDoesNotWriteVersionPointer()).assertEqual(1);
    });

    /**
     * @tc.name   testResolveDeferredThenThrowCanBeCaught
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_RESOLVE_DEFERRED_THROW
     * @tc.desc   Verify exception thrown in then callback after napi_resolve_deferred can be caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResolveDeferredThenThrowCanBeCaught', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // OH-NAPI-DIFF-038
      let caught: boolean = false;
      await napispecdiffbatch1ndktest.createResolvedPromiseWithDeferred()
        .then(() => {
          throw new Error('resolve deferred throw probe');
        })
        .catch(() => {
          caught = true;
        });
      expect(caught).assertTrue();
    });

    /**
     * @tc.name   testResolveDeferredThenThrowWithoutCatchContinues
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_RESOLVE_DEFERRED_THROW_NO_CATCH
     * @tc.desc   Verify exception thrown in then callback after napi_resolve_deferred without catch does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResolveDeferredThenThrowWithoutCatchContinues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        // OH-NAPI-DIFF-038 no catch path
        let callbackEntered: boolean = false;
        const unhandledPromise: Promise<void> = napispecdiffbatch1ndktest.createResolvedPromiseWithDeferred()
          .then(() => {
            callbackEntered = true;
            throw new Error('resolve deferred throw without catch probe');
          });
        await Promise.resolve();
        expect(callbackEntered).assertTrue();
        expect(unhandledPromise !== undefined).assertTrue();
      });

    /**
     * @tc.name   testRejectDeferredCatchThrowCanBeCaught
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_REJECT_DEFERRED_THROW
     * @tc.desc   Verify exception thrown in catch callback after napi_reject_deferred can be caught
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredCatchThrowCanBeCaught', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // OH-NAPI-DIFF-039
      let caught: boolean = false;
      await napispecdiffbatch1ndktest.createRejectedPromiseWithDeferred()
        .catch(() => {
          throw new Error('reject deferred throw probe');
        })
        .catch(() => {
          caught = true;
        });
      expect(caught).assertTrue();
    });

    /**
     * @tc.name   testRejectDeferredCatchThrowWithoutCatchContinues
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_REJECT_DEFERRED_THROW_NO_CATCH
     * @tc.desc   Verify exception thrown in catch callback after napi_reject_deferred without catch does not crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRejectDeferredCatchThrowWithoutCatchContinues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        // OH-NAPI-DIFF-039 no catch path
        let callbackEntered: boolean = false;
        const unhandledPromise: Promise<void> = napispecdiffbatch1ndktest.createRejectedPromiseWithDeferred()
          .catch(() => {
            callbackEntered = true;
            throw new Error('reject deferred throw without catch probe');
          });
        await Promise.resolve();
        expect(callbackEntered).assertTrue();
        expect(unhandledPromise !== undefined).assertTrue();
      });

    /**
     * @tc.name   testGetValueBigIntWordsNonBigIntReturnsObjectExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_BIGINT_WORDS_NON_BIGINT
     * @tc.desc   Verify napi_get_value_bigint_words returns napi_object_expected for non-BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetValueBigIntWordsNonBigIntReturnsObjectExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      () => {
        // OH-NAPI-DIFF-049
        expect(napispecdiffbatch1ndktest.getValueBigIntWordsNonBigIntReturnsObjectExpected()).assertEqual(1);
      });

    /**
     * @tc.name   testDuplicateEnvCleanupHookRegistrationAndRemove
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_ENV_CLEANUP_HOOK_DUPLICATE
     * @tc.desc   Verify duplicate napi_add_env_cleanup_hook registration and removal return current status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDuplicateEnvCleanupHookRegistrationAndRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-055
      expect(napispecdiffbatch1ndktest.duplicateEnvCleanupHookRegistrationAndRemove()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateBufferBoundaryStatus
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_BUFFER_BOUNDARY
     * @tc.desc   Verify napi_create_buffer OpenHarmony boundary statuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBufferBoundaryStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-050
      expect(napispecdiffbatch1ndktest.createBufferBoundaryStatus()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateBufferCopyBoundaryStatus
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_BUFFER_COPY_BOUNDARY
     * @tc.desc   Verify napi_create_buffer_copy OpenHarmony boundary statuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBufferCopyBoundaryStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-051
      expect(napispecdiffbatch1ndktest.createBufferCopyBoundaryStatus()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateExternalBufferBoundaryStatus
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_CREATE_EXTERNAL_BUFFER_BOUNDARY
     * @tc.desc   Verify napi_create_external_buffer OpenHarmony boundary statuses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateExternalBufferBoundaryStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-052
      expect(napispecdiffbatch1ndktest.createExternalBufferBoundaryStatus()).assertEqual(1);
    });

    /**
     * @tc.name   testGetBufferInfoNonBufferReturnsArrayBufferExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_GET_BUFFER_INFO_NON_BUFFER
     * @tc.desc   Verify napi_get_buffer_info returns napi_arraybuffer_expected for non-buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetBufferInfoNonBufferReturnsArrayBufferExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      () => {
        // OH-NAPI-DIFF-053
        expect(napispecdiffbatch1ndktest.getBufferInfoNonBufferReturnsArrayBufferExpected()).assertEqual(1);
      });

    /**
     * @tc.name   testDetachArrayBufferStatusLayering
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_DETACH_ARRAYBUFFER_STATUS
     * @tc.desc   Verify napi_detach_arraybuffer status layering for number, object and ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDetachArrayBufferStatusLayering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-054
      expect(napispecdiffbatch1ndktest.detachArrayBufferStatusLayering()).assertEqual(1);
    });

    /**
     * @tc.name   testAddFinalizerNonObjectReturnsObjectExpected
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH1_ADD_FINALIZER_NON_OBJECT
     * @tc.desc   Verify napi_add_finalizer returns napi_object_expected for non-object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerNonObjectReturnsObjectExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-056
      expect(napispecdiffbatch1ndktest.addFinalizerNonObjectReturnsObjectExpected()).assertEqual(1);
    });
  });
}
