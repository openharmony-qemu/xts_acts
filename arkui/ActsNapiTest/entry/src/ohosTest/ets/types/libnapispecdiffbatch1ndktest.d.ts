/**
 * NAPI Spec Diff Batch1 Native Test 模块类型声明
 */
declare module 'libnapispecdiffbatch1ndktest.so' {
  const napispecdiffbatch1ndktest: {
    throwErrorNullCodeKeepsOpenHarmonyBehavior: () => number;
    throwTypeErrorNullCodeKeepsOpenHarmonyBehavior: () => number;
    throwRangeErrorNullCodeKeepsOpenHarmonyBehavior: () => number;
    createErrorSupportsStringAndNumberCode: () => number;
    createTypeErrorNumberCodeAndObjectCodeInvalid: () => number;
    createRangeErrorNumberCodeAndObjectCodeInvalid: () => number;
    createReferenceSupportsNonObjectValues: () => number;
    createSymbolInvalidDescriptionReturnsInvalidArg: () => number;
    createTypedArrayInvalidArrayBufferReturnsArrayBufferExpected: () => number;
    createDataViewInvalidAndOverflowArrayBuffer: () => number;
    getTypedArrayInfoLengthReturnsByteLength: () => number;
    coerceUndefinedAndNullToObjectReturnsUndefined: () => number;
    instanceOfInvalidArgumentsReturnExpectedStatus: () => number;
    propertyApisNonObjectReturnObjectExpected: () => number;
    typeTagNonObjectReturnsObjectExpected: () => number;
    definePropertiesClearsExceptionAndContinues: () => number;
    callFunctionInvalidFuncReturnsFunctionExpected: () => number;
    newInstanceInvalidConstructorReturnsFunctionExpected: () => number;
    defineClassHugeLengthReturnsObjectExpected: () => number;
    wrapNullFinalizerReturnsInvalidArg: () => number;
    wrapUnwrapRemoveWrapNonObjectReturnObjectExpected: () => number;
    setupWrapResultStrongReference: () => number;
    verifyWrapResultStrongReferenceAfterGc: () => number;
    createAsyncWorkAllowsNonStringResourceName: () => number;
    cancelAsyncWorkStatusLayering: () => number;
    asyncInitMakeCallbackDestroyWorksWithoutAsyncHooks: () => number;
    getNodeVersionDoesNotWriteVersionPointer: () => number;
    createResolvedPromiseWithDeferred: () => Promise<number>;
    createRejectedPromiseWithDeferred: () => Promise<number>;
    getValueBigIntWordsNonBigIntReturnsObjectExpected: () => number;
    duplicateEnvCleanupHookRegistrationAndRemove: () => number;
    createBufferBoundaryStatus: () => number;
    createBufferCopyBoundaryStatus: () => number;
    createExternalBufferBoundaryStatus: () => number;
    getBufferInfoNonBufferReturnsArrayBufferExpected: () => number;
    detachArrayBufferStatusLayering: () => number;
    // ===== 第一轮补充用例 =====
    throwRangeErrorNullMessageReturnsInvalidArg: () => number;
    throwRangeErrorResultIsRangeErrorType: () => number;
    throwRangeErrorWhenPendingReturnsPendingException: () => number;
    throwRangeErrorComboWithCreateAndThrow: () => number;
    createSymbolReturnsOkAndSymbolType: () => number;
    createSymbolAsPrivatePropertyKey: () => number;
    createSymbolWhenPendingReturnsPendingException: () => number;
    createSymbolPropertyFullLifecycle: () => number;
    createTypedArrayWithDetachedBufferReturnsError: () => number;
    createTypedArrayMultiViewAndDetach: () => number;
    definePropertiesReturnValueAndAttributes: () => number;
    definePropertiesBatchMethods: () => number;
    definePropertiesComboWithClass: () => number;
    typeTagObjectCheckSuccess: () => number;
    typeTagObjectDifferentTagReturnsFalse: () => number;
    // ===== 第二轮补充用例 =====
    asyncInitNullFuncReturnsInvalidArg: () => number;
    asyncInitNullNameReturnsInvalidArg: () => number;
    cancelAsyncWorkNullWorkReturnsInvalidArg: () => number;
    createReferenceWhenPendingReturnsPendingException: () => number;
    resolveDeferredNullDeferredReturnsInvalidArg: () => number;
    resolveDeferredNullValueReturnsInvalidArg: () => number;
    rejectDeferredNullDeferredReturnsInvalidArg: () => number;
    rejectDeferredNullValueReturnsInvalidArg: () => number;
    rejectDeferredTwiceReturnsError: () => number;
    getValueBigintWordsWhenPendingReturnsPendingException: () => number;
    addEnvCleanupHookNullHookReturnsInvalidArg: () => number;
    addEnvCleanupHookReturnsOk: () => number;
    addEnvCleanupHookNullEnvReturnsInvalidArg: () => number;
    addEnvCleanupHookNullDataReturnsOk: () => number;
    addEnvCleanupHookWhenPendingReturnsPendingException: () => number;
    addEnvCleanupHookMultipleDifferentHooksReturnsOk: () => number;
    removeEnvCleanupHookOpaqueMismatchReturnsInvalidArg: () => number;
    removeEnvCleanupHookNotRegisteredReturnsGenericFailure: () => number;
    detachArrayBufferReturnsOkAndVerified: () => number;
    detachArrayBufferWhenPendingReturnsPendingException: () => number;
    wrapReturnsOkAndWrapperObject: () => number;
    unwrapReturnsOkAndCorrectPointer: () => number;
    unwrapWhenPendingReturnsPendingException: () => number;
    createDataviewNullArrayBufferReturnsInvalidArg: () => number;
    createDataviewComboWithArrayBuffer: () => number;
    // ===== 第三轮补充用例 =====
    getTypedArrayInfoNonTypedArrayReturnsError: () => number;
    coerceToObjectNullValueReturnsInvalidArg: () => number;
    coerceToObjectComboWithSetProperty: () => number;
    instanceofReturnsTrueForValidInstance: () => number;
    newInstanceComboWithDefineClass: () => number;
    defineClassConstructorThrowsException: () => number;
    asyncDestroyWhenPendingReturnsPendingException: () => number;
    createExternalBufferReturnsOkAndRefsExternalData: () => number;
    // ===== 第四轮补充用例 =====
    typeTagObjectNullTagReturnsInvalidArg: () => number;
    checkObjectTypeTagNullObjectReturnsInvalidArg: () => number;
    // ===== napi_create_string_utf8 补充用例 =====
    createStringUtf8AfterEnvDestroyedReturnsClosing: () => number;
    createStringUtf8WhenPendingReturnsPendingException: () => number;
    createStringUtf8InvalidUtf8ReturnsError: () => number;
    createStringUtf8LengthExceedsActual: () => number;
    createStringUtf8ComboWithGetAndRebuild: () => number;
    // ===== napi_get_and_clear_last_exception 补充用例 =====
    getAndClearLastExceptionNoExceptionReturnsUndefined: () => number;
    getAndClearLastExceptionEnvDestroyedReturnsInvalidArg: () => number;
    getAndClearLastExceptionReacquireAfterClear: () => number;
    unwrapNoWrappedObjectReturnsNull: () => number;
    // ===== 第五轮补充用例（napi_throw_type_error） =====
    throwTypeErrorNullMessageReturnsInvalidArg: () => number;
    throwTypeErrorResultIsTypeErrorType: () => number;
    throwTypeErrorWhenPendingReturnsPendingException: () => number;
    // ===== 第五轮补充用例（napi_create_type_error） =====
    createTypeErrorTypicalUsage: (input: number) => object | null;
    // ===== 第五轮补充用例（napi_create_range_error） =====
    createRangeErrorWhenPendingReturnsPendingException: () => number;
    // createRangeErrorComboWithThrowAndCatch: () => number;
    // ===== 第五轮补充用例（napi_reject_deferred） =====
    rejectDeferredWhenPendingReturnsPendingException: () => number;
    rejectDeferredThenResolveReturnsError: () => number;
    rejectDeferredWithNullOrUndefined: () => number;
    // ===== 第五轮补充用例（napi_get_dataview_info） =====
    getDataviewInfoNullEnvReturnsInvalidArg: () => number;
    getDataviewInfoNullDataviewReturnsInvalidArg: () => number;
    getDataviewInfoTypedArrayReturnsError: () => number;
    getDataviewInfoObjectReturnsError: () => number;
    getDataviewInfoWhenPendingReturnsPendingException: () => number;
    // ===== 第五轮补充用例（napi_get_property） =====
    getPropertyWhenPendingReturnsPendingException: () => number;
    getPropertySymbolNotExistsReturnsUndefined: () => number;
    getPropertySealedObjectNonExistentReturnsUndefined: () => number;
    createRangeErrorAsReturnValue: () => object;
    createRangeErrorAfterEnvDestroyed: () => number;
    createRangeErrorComboWithThrowAndCatch_Throw: () => void;
    createRangeErrorComboWithThrowAndCatch_Check: () => number;
    createRangeErrorComboWithThrowAndCatch: () => string;
    // ===== napi_get_arraybuffer_info 补充 =====
    getArraybufferInfoDetachedReturnsNullData: () => number;
    getArraybufferInfoWhenPendingReturnsPendingException: () => number;
    getArraybufferInfoReleasedReturnsZeroLength: () => number;
    getArraybufferInfoTypedArrayReturnsError: () => number;
    // ===== napi_get_cb_info 补充 =====
    getCbInfoWhenPendingReturnsPendingException: () => number;
    getCbInfoArgcSmallerThanActual: () => number;
    getCbInfoNonCbInfoReturnsInvalidArg: () => number;
    getCbInfoWrongCallback: () => number;
    // ===== napi_get_last_error_info 迁移自batch4 (0127-0132) =====
    getLastErrorInfoAfterFailedCall: () => number;
    getLastErrorInfoWhenNoError: () => number;
    getLastErrorInfoAfterMultipleErrors: () => number;
    getLastErrorInfoWhenPending: () => number;
    getLastErrorInfoAfterExceptionCleared: () => number;
    getLastErrorInfoComboWithThrowAndClear: () => number;
    // ===== napi_get_dataview_info 补充 =====
    getDataviewInfoDetachedArrayBuffer: () => number;
    getDataviewInfoArrayBufferReleased: () => number;
    getDataviewInfoNullByteLength: () => number;
    getDataviewInfoNullByteOffset: () => number;
    getDataviewInfoNullArrayBuffer: () => number;
    // ===== napi_is_error 补充用例 (0133-0137) =====
    isErrorWhenPending: () => number;
    isErrorCustomSubclass: () => number;
    isErrorNonErrorThrow: () => number;
    isErrorFrozenError: () => number;
    isErrorAggregateError: () => number;
    // ===== napi_close_critical_scope 迁移自batch3 =====
    closeCriticalScopeComboWithCallback: () => number;
    // ===== 第四轮补充：高优先级缺口 =====
    moduleRegisterNullModuleReturnsInvalidArg: () => number;
    moduleRegisterNullModnameReturnsError: () => number;
    moduleRegisterNullRegisterFuncReturnsError: () => number;
    typeofNullValueReturnsInvalidArg: () => number;
    typeofNullResultReturnsInvalidArg: () => number;
    typeofWhenPendingReturnsPendingException: () => number;
    createPromiseNullDeferredReturnsInvalidArg: () => number;
    createPromiseNullPromiseReturnsInvalidArg: () => number;
    createReferenceWithUndefinedValue: () => number;
    checkObjectTypeTagNullResultReturnsInvalidArg: () => number;
    // ===== napi_typeof 正常参数 + 组合场景 =====
    typeofAllTypesReturnsCorrectType: () => number;
    typeofComboWithCreateModifyAndCheck: () => number;
    // ===== napi_get_property_names 完整覆盖 =====
    getPropertyNamesNormalPath: () => number;
    getPropertyNamesReturnValueVerification: () => number;
    getPropertyNamesWhenPendingReturnsPendingException: () => number;
    getPropertyNamesComboWithGetProperty: () => number;
    getPropertyNamesNullEnvReturnsInvalidArg: () => number;
    getPropertyNamesNullObjectReturnsInvalidArg: () => number;
    getPropertyNamesNullResultReturnsInvalidArg: () => number;
    // ===== napi_module_register 正常参数 + 组合场景 =====
    moduleRegisterNormalPath: () => number;
    moduleRegisterComboMultipleModules: () => number;
    // ===== napi_get_and_clear_last_exception 异常参数 =====
    getAndClearLastExceptionNullEnvReturnsInvalidArg: () => number;
    getAndClearLastExceptionNullResultReturnsInvalidArg: () => number;

  };
  export default napispecdiffbatch1ndktest;
}