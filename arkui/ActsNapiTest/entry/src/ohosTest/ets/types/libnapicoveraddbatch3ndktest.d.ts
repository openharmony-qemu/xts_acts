/**
 * NAPI Cover Add Batch3 Native Test 模块类型声明 (Runtime Sendable)
 */
declare module 'libnapicoveraddbatch3ndktest.so' {
  const napicoveraddbatch3ndktest: {
    createThreadsafeFunctionInitialCountLimit: () => number;
    queueAsyncWorkWithQosReturnsOk: () => number;
    threadsafeFunctionLooseResourceAndNameTypes: () => number;
    releaseThreadsafeFunctionAfterCountZero: () => number;
    setupThreadsafeFunctionCrossThreadProbe: () => number;
    refThreadsafeFunctionWithCurrentEnv: () => number;
    unrefThreadsafeFunctionWithCurrentEnv: () => number;
    cleanupThreadsafeFunctionCrossThreadProbe: () => number;
    createArkRuntimeOnNativeThread: () => number;
    isSendableDistinguishesValues: () => number;
    createSendableObjectArrayAndBuffer: () => number;
    createSendableArrayWithLengthAndTypedArray: () => number;
    sendableTypedArrayInfoAndTypeCheck: () => number;
    createObjectWithPropertiesHelpers: () => number;
    throwBusinessErrorStatus: () => number;
    callsiteInfoGetAndSetProperty: () => number;
    callsiteInfoNullParametersAreAccepted: () => number;
    criticalScopeUtf16BufferBehavior: () => number;
    createThreadsafeFunctionNullFunc: () => number;
    refThreadsafeFunctionNull: () => number;
    isSendableNullParam: () => number;
    createSendableArrayNullResult: () => number;
    createSendableArraybufferNullData: () => number;
    releaseThreadsafeFunctionNull: () => number;
    createArkRuntimeNullReturnsInvalidArg: () => number;
    destroyArkRuntimeTwiceReturnsError: () => number;
    createSendableArraybufferHugeLengthReturnsError: () => number;
    criticalScopeUtf16BufferEfficientAccess: () => number;
    criticalScopeUtf16BufferOutsideScopeReturnsError: () => number;
    criticalScopeUtf16BufferComboWithGetValue: () => number;
    // ===== Batch3 安全组：CallsiteInfo =====
    createCallsiteInfoReturnsOkAndNonNull: () => number;
    deleteCallsiteInfoNullReturnsInvalidArg: () => number;
    deleteCallsiteInfoTwiceReturnsError: () => number;
    createCallsiteInfoInvalidEnvReturnsError: () => number;
    createCallsiteInfoContainsCallstackInfo: () => number;
    createCallsiteInfoComboWithGetProperty: () => number;
    deleteCallsiteInfoWhenPendingReturnsPendingException: () => number;
    deleteCallsiteInfoComboWithErrorHandling: () => number;
    // ===== Batch3 安全组：IsSendable =====
    isSendableNullEnvReturnsInvalidArg: () => number;
    isSendableNullResultReturnsInvalidArg: () => number;
    isSendableUndefinedReturnsFalse: () => number;
    isSendableNullReturnsFalse: () => number;
    isSendableNumberReturnsFalse: () => number;
    // ===== Batch3 安全组：ArkRuntime/Context =====
    destroyArkRuntimeNullReturnsInvalidArg: () => number;
    createArkRuntimeComboWithContext: () => number;
    createArkContextReturnsOkAndNonNull: () => number;
    createArkContextWithInvalidEnvReturnsError: () => number;
    createArkContextWithDestroyedRuntimeReturnsError: () => number;
    destroyArkContextReturnsOk: () => number;
    destroyArkContextWithInvalidArgsReturnsError: () => number;
    destroyArkContextTwiceReturnsError: () => number;
    destroyArkContextComboWithRuntime: () => number;
    // ===== Batch3 中风险组：Critical Scope =====
    openCriticalScopeNullEnvReturnsInvalidArg: () => number;
    openCriticalScopeNullScopeReturnsInvalidArg: () => number;
    openCriticalScopeReturnsOkAndValidScope: () => number;
    closeCriticalScopeNullScopeReturnsInvalidArg: () => number;
    closeCriticalScopeReturnsOk: () => number;
    closeCriticalScopeNullEnvReturnsInvalidArg: () => number;
    closeCriticalScopeWithoutOpenReturnsError: () => number;
    // ===== Batch3 中风险组：Object Properties =====
    createObjectWithPropertiesNullResultReturnsInvalidArg: () => number;
    createObjectWithPropertiesWhenPendingReturnsPendingException: () => number;
    createObjectWithNamedPropertiesNullResultReturnsInvalidArg: () => number;
    createObjectWithNamedPropertiesWhenPendingReturnsPendingException: () => number;
    createSendableObjectWithPropertiesNullResultReturnsInvalidArg: () => number;
    isTypedArrayNullEnvReturnsInvalidArg: () => number;
    isTypedArrayNullResultReturnsInvalidArg: () => number;
    // ===== Batch3 低风险组A：CriticalScopeUtf16Buffer =====
    criticalScopeUtf16BufferNullEnvReturnsInvalidArg: () => number;
    criticalScopeUtf16BufferNullDataReturnsInvalidArg: () => number;
    criticalScopeUtf16BufferNullLengthReturnsInvalidArg: () => number;
    criticalScopeUtf16BufferNullParamsReturnInvalidArg: () => number;
    criticalScopeUtf16BufferEmptyStringReturnsNullData: () => number;
    criticalScopeUtf16BufferNumberReturnsStringExpected: () => number;
    criticalScopeUtf16BufferReturnValueVerification: () => number;
    criticalScopeUtf16BufferWhenPendingReturnsPendingException: () => number;
    // ===== Batch3 低风险组B：Null参数/边界值 =====
    queueAsyncWorkWithQosNullWorkReturnsInvalidArg: () => number;
    refThreadsafeFunctionNullTsfnReturnsInvalidArg: () => number;
    releaseThreadsafeFunctionNullTsfnReturnsInvalidArg: () => number;
    // NOTE: napi_release_threadsafe_function 无 napi_env 参数，无法检查 pending exception，已注释
    // releaseThreadsafeFunctionWhenPendingReturnsPendingException: () => number;
    unrefThreadsafeFunctionNullTsfnReturnsInvalidArg: () => number;
    createSendableArrayWithLengthZero: () => number;
    createSendableTypedArrayNullResultReturnsInvalidArg: () => number;
    unrefThreadsafeFunctionReturnsOk: () => number;
    // ===== Batch3 中风险组C：WhenPending/Combo =====
    createSendableArrayWhenPendingReturnsPendingException: () => number;
    refThreadsafeFunctionComboWithCreateAndRelease: () => number;
    releaseThreadsafeFunctionComboWithRefAndCall: () => number;
    throwBusinessErrorWhenPendingReturnsPendingException: () => number;
    throwBusinessErrorComboWithCreateError: () => number;
  };
  export default napicoveraddbatch3ndktest;
}
