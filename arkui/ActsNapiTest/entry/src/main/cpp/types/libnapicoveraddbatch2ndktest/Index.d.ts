declare namespace napicoveraddbatch2ndktest {
  export const deleteReferenceTriggersFinalizer: () => number;
  export const removeWrapCallsFinalizerBeforeRemoving: () => number;
  export const addFinalizerResultReferenceIsStrong: () => number;
  export const createStrongReferenceKeepsValue: () => number;
  export const deleteStrongReferenceOnceWorks: () => number;
  export const getStrongReferenceValueWorksBeforeDelete: () => number;
  export const wrapEnhanceSyncAndAsyncFinalizerCanBeCreated: () => number;
  export const removeWrapSendableReturnsNativePointerWithoutImmediateFinalizer: () => number;
  export const strongSendableReferenceNormalPath: () => number;
}
