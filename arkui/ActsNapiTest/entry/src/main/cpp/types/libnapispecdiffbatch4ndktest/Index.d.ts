
declare namespace napispecdiffbatch4ndktest {
  export const testGetUvEventLoopNonMainThread: () => number;
  export const testGetUvEventLoopWithThreadsafeFunction: () => number;
  export const setElementHugeIndexDoesNotMutateObject: () => number;
  export const fatalExceptionRejectsNonError: () => number;
  export const externalStringUtf16AndAsciiCreate: () => number;
  export const createDateExtremeReturnsStatus: () => number;
  export const callFunctionNullRecvIsolatedProbe: () => number;
  export const tsfnDestroyRuntimeWithoutExplicitCleanupProbe: () => number;
  export const createBigintHugeWordsProbe: () => number;
  export const createArrayWithHugeLengthProbe: () => number;
  export const createArrayBufferWithHugeLengthProbe: () => number;
  export const criticalScopeForbiddenNapiCrashProbe: () => number;
}
