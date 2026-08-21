/**
 * NAPI Spec Diff Batch2 Native Test 模块类型声明 (Lifecycle)
 */
declare module 'libnapispecdiffbatch2ndktest.so' {
  const napispecdiffbatch2ndktest: {
    deleteReferenceTriggersFinalizer: () => number;
    removeWrapCallsFinalizerBeforeRemoving: () => number;
    addFinalizerResultReferenceIsStrong: () => number;
    createStrongReferenceKeepsValue: () => number;
    deleteStrongReferenceOnceWorks: () => number;
    getStrongReferenceValueWorksBeforeDelete: () => number;
    wrapEnhanceSyncAndAsyncFinalizerCanBeCreated: () => number;
    removeWrapSendableReturnsNativePointerWithoutImmediateFinalizer: () => number;
    strongSendableReferenceNormalPath: () => number;
    // ===== 第一轮补充用例 =====
    addFinalizerNullObjectReturnsInvalidArg: () => number;
    addFinalizerNullCallbackReturnsInvalidArg: () => number;
    addFinalizerWithExternalResourceCleanup: () => number;
    addFinalizerNonObjectReturnsObjectExpected: () => number;
    addFinalizerWhenPendingReturnsPendingException: () => number;
    addFinalizerMultipleTypesReturnsObjectExpected: () => number;
    addFinalizerNullDataReturnsOk: () => number;
    addFinalizerNullResultReturnsOk: () => number;
    removeWrapReturnsOkAndCorrectPointer: () => number;
    removeWrapNoWrappedObjectReturnsError: () => number;
    removeWrapTwiceReturnsError: () => number;
    removeWrapResourceCleanupFlow: () => number;
    removeWrapWhenPendingReturnsPendingException: () => number;
    wrapEnhanceNonObjectReturnsObjectExpected: () => number;
    createStrongReferenceWhenPendingReturnsPendingException: () => number;
    createStrongReferencePrimitiveValue: () => number;
    deleteStrongReferenceNullRefReturnsInvalidArg: () => number;
    deleteStrongReferenceTwiceReturnsError: () => number;
    deleteStrongReferenceVerifyInvalidAfterDelete: () => number;
    deleteStrongReferenceComboWithWeakRef: () => number;
    getStrongReferenceValueWhenPendingReturnsPendingException: () => number;
    getStrongReferenceValueAfterDeleteReturnsError: () => number;
    createStrongSendableRefNullValueReturnsInvalidArg: () => number;
    createStrongSendableRefNullRefReturnsInvalidArg: () => number;
    createStrongSendableRefWhenPendingReturnsPendingException: () => number;
    deleteStrongSendableRefNullRefReturnsInvalidArg: () => number;
    deleteStrongSendableRefTwiceReturnsError: () => number;
    deleteStrongSendableRefVerifyInvalidAfterDelete: () => number;
    deleteStrongSendableRefWhenPendingReturnsPendingException: () => number;
    // ===== 第二轮补充用例 =====
    removeWrapSendableNullObjectReturnsInvalidArg: () => number;
    createExternalComboWithGetValueExternal: () => number;
    // ===== 第三轮补充用例 =====
    wrapSendableNullObjectReturnsInvalidArg: () => number;
    wrapSendableNonSendableObjectReturnsError: () => number;
    wrapSendableUnwrapReturnsCorrectPointer: () => number;
    getStrongSendableRefValueAfterDeleteReturnsError: () => number;
    getStrongSendableRefValueComboWithCreateAndDelete: () => number;
    // ===== 第四轮补充用例 =====
    getValueExternalNullValueReturnsInvalidArg: () => number;
    getValueExternalNonExternalReturnsError: () => number;
    getValueExternalReturnsCorrectPointer: () => number;
    getValueExternalWhenPendingReturnsPendingException: () => number;
    unwrapSendableNonSendableReturnsError: () => number;
    unwrapSendableReturnsCorrectPointer: () => number;
    // ===== 第五轮补充用例 =====
    createStrongSendableRefComboWithCrossThreadArray: () => number;
    deleteStrongSendableRefComboWithWeakRef: () => number;
    getStrongReferenceValueComboWithRefUnref: () => number;
    // ===== 第六轮补充用例 (napi_get_value_external 完整覆盖) =====
    getValueExternalNullEnvReturnsInvalidArg: () => number;
    getValueExternalNullResultReturnsInvalidArg: () => number;
    getValueExternalStringReturnsError: () => number;
    getValueExternalNumberReturnsError: () => number;
    getValueExternalAfterModification: () => number;
    getValueExternalCrossEnvReturnsError: () => number;
    getValueExternalAfterFinalizeReturnsError: () => number;
    // ===== napi_get_value_external finalize场景 =====
    createExternalForFinalizeTest: () => object;
    getExternalDataAfterFinalize: (extObj: object) => number;
    cleanupExternalForFinalizeTest: (extObj: object) => number;
    // ===== napi_get_value_external 第三轮补充 =====
    getValueExternalBooleanReturnsError: () => number;
    getValueExternalNullTypeReturnsError: () => number;
    getValueExternalUndefinedReturnsError: () => number;
    getValueExternalMultipleGetsConsistency: () => number;
    // ===== 第七轮补充用例 (napi_reject_deferred 完整覆盖) =====
    rejectDeferredNonDeferredReturnsInvalidArg: () => number;
    rejectDeferredAfterResolveReturnsError: () => number;
    rejectDeferredWithNonErrorValue: () => number;
    // ===== 第七轮补充用例 (napi_get_property 异常参数覆盖) =====
    getPropertyNullEnvReturnsInvalidArg: () => number;
    getPropertyNullObjectReturnsInvalidArg: () => number;
    getPropertyNullKeyReturnsInvalidArg: () => number;
    getPropertyNullResultReturnsInvalidArg: () => number;
    getPropertyStringReturnsObjectExpected: () => number;
    getPropertyNumberReturnsObjectExpected: () => number;
    getPropertyNullReturnsObjectExpected: () => number;
    // ===== 第七轮补充用例 (napi_create_strong_sendable_reference 完整覆盖) =====
    createStrongSendableRefNonSendableReturnsError: () => number;
    createStrongSendableRefNullEnvReturnsInvalidArg: () => number;
    // ===== 第七轮补充用例 (napi_delete_strong_sendable_reference 完整覆盖) =====
    deleteStrongSendableRefNullEnvReturnsInvalidArg: () => number;
    deleteStrongSendableRefNonSendableRefReturnsInvalidArg: () => number;
    rejectDeferredAfterPromiseGC: () => number;
    deleteStrongSendableRefCrossThreadRelease: () => number;
    deleteStrongSendableRefLifecycleManagement: () => number;
    // ===== napi_delete_strong_sendable_reference env已销毁 =====
    deleteStrongSendableRefAfterEnvDestroyedReturnsClosing: () => number;
    // ===== napi_wrap_sendable_with_size 补充用例 =====
    wrapSendableWithSizeZeroReturnsInvalidArg: () => number;
    wrapSendableWithSizeNonSendableReturnsError: () => number;
    wrapSendableWithSizeVerifyDataIntegrity: () => number;
    // ===== napi_get_strong_sendable_reference_value 补充用例 =====
    getStrongSendableRefValueWhenPendingReturnsPendingException: () => number;
    getStrongSendableRefValueNonSendableRefReturnsInvalidArg: () => number;
    getStrongSendableRefValueCrossThreadConsistency: () => number;
    getStrongSendableRefValueComboWithRegularRef: () => number;
    // ===== napi_get_value_string_latin1 补充用例 (0088-0091) =====
    getValueStringLatin1WhenPending: () => number;
    getValueStringLatin1NonLatin1: () => number;
    getValueStringLatin1BufsizeSmaller: () => number;
    getValueStringLatin1Number: () => number;
    // ===== napi_get_value_uint32 补充用例 (0092) =====
    getValueUint32Roundtrip: () => number;
    // ===== napi_remove_wrap_sendable 补充 =====
    removeWrapSendableNonSendableReturnsError: () => number;
    removeWrapSendableNonWrappedReturnsError: () => number;
    // ===== napi_create_strong_reference 异常参数补充 =====
    createStrongReferenceNullEnvReturnsInvalidArg: () => number;
    createStrongReferenceNullObjectReturnsInvalidArg: () => number;
    createStrongReferenceNullRefReturnsInvalidArg: () => number;
    createStrongReferenceNumberReturnsError: () => number;
    createStrongReferenceStringReturnsError: () => number;
    // ===== napi_delete_strong_reference 异常参数+异常场景补充 =====
    deleteStrongReferenceNullEnvReturnsInvalidArg: () => number;
    deleteStrongReferenceWhenPendingReturnsPendingException: () => number;
    // ===== napi_get_reference_value 异常参数补充 =====
    getStrongReferenceValueNullEnvReturnsInvalidArg: () => number;
    getStrongReferenceValueNullRefReturnsInvalidArg: () => number;
    getStrongReferenceValueNullResultReturnsInvalidArg: () => number;
  };
  export default napispecdiffbatch2ndktest;
}
