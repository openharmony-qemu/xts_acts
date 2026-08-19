declare namespace napispecdiffbatch1ndktest {
  export const throwErrorNullCodeKeepsOpenHarmonyBehavior: () => number;

  export const throwTypeErrorNullCodeKeepsOpenHarmonyBehavior: () => number;

  export const throwRangeErrorNullCodeKeepsOpenHarmonyBehavior: () => number;

  export const createErrorSupportsStringAndNumberCode: () => number;

  export const createTypeErrorNumberCodeAndObjectCodeInvalid: () => number;

  export const createRangeErrorNumberCodeAndObjectCodeInvalid: () => number;

  export const createReferenceSupportsNonObjectValues: () => number;

  export const createSymbolInvalidDescriptionReturnsInvalidArg: () => number;

  export const createTypedArrayInvalidArrayBufferReturnsArrayBufferExpected: () => number;

  export const createDataViewInvalidAndOverflowArrayBuffer: () => number;

  export const getTypedArrayInfoLengthReturnsByteLength: () => number;

  export const coerceUndefinedAndNullToObjectReturnsUndefined: () => number;

  export const instanceOfInvalidArgumentsReturnExpectedStatus: () => number;

  export const propertyApisNonObjectReturnObjectExpected: () => number;

  export const typeTagNonObjectReturnsObjectExpected: () => number;

  export const definePropertiesClearsExceptionAndContinues: () => number;

  export const callFunctionInvalidFuncReturnsFunctionExpected: () => number;

  export const newInstanceInvalidConstructorReturnsFunctionExpected: () => number;

  export const defineClassHugeLengthReturnsObjectExpected: () => number;

  export const wrapNullFinalizerReturnsInvalidArg: () => number;

  export const wrapUnwrapRemoveWrapNonObjectReturnObjectExpected: () => number;

  export const setupWrapResultStrongReference: () => number;

  export const verifyWrapResultStrongReferenceAfterGc: () => number;

  export const createAsyncWorkAllowsNonStringResourceName: () => number;

  export const cancelAsyncWorkStatusLayering: () => number;

  export const asyncInitMakeCallbackDestroyWorksWithoutAsyncHooks: () => number;

  export const getNodeVersionDoesNotWriteVersionPointer: () => number;

  export const createResolvedPromiseWithDeferred: () => Promise<number>;

  export const createRejectedPromiseWithDeferred: () => Promise<number>;

  export const getValueBigIntWordsNonBigIntReturnsObjectExpected: () => number;

  export const duplicateEnvCleanupHookRegistrationAndRemove: () => number;

  export const createBufferBoundaryStatus: () => number;

  export const createBufferCopyBoundaryStatus: () => number;

  export const createExternalBufferBoundaryStatus: () => number;

  export const getBufferInfoNonBufferReturnsArrayBufferExpected: () => number;

  export const detachArrayBufferStatusLayering: () => number;

  export const addFinalizerNonObjectReturnsObjectExpected: () => number;
}