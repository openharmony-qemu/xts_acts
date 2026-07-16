/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napispecdiffbatch2ndktest from 'libnapispecdiffbatch2ndktest.so';


export default function napiSpecDiffBatch2LifecycleTest() {
  describe('NapiSpecDiffBatch2LifecycleTest', () => {
    /**
     * @tc.name   testDeleteReferenceTriggersFinalizer
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_DELETE_REFERENCE_FINALIZER
     * @tc.desc   Verify deleting reference triggers finalizer in OpenHarmony
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteReferenceTriggersFinalizer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-010 OH-NAPI-DIFF-057
      expect(napispecdiffbatch2ndktest.deleteReferenceTriggersFinalizer()).assertEqual(1);
    });

    /**
     * @tc.name   testRemoveWrapCallsFinalizerBeforeRemoving
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_REMOVE_WRAP_FINALIZER
     * @tc.desc   Verify napi_remove_wrap calls finalizer before removing native binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapCallsFinalizerBeforeRemoving', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-033
      expect(napispecdiffbatch2ndktest.removeWrapCallsFinalizerBeforeRemoving()).assertEqual(1);
    });

    /**
     * @tc.name   testAddFinalizerResultReferenceIsStrong
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_ADD_FINALIZER_STRONG_REF
     * @tc.desc   Verify napi_add_finalizer result reference behaves as strong reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerResultReferenceIsStrong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-059
      expect(napispecdiffbatch2ndktest.addFinalizerResultReferenceIsStrong()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateStrongReferenceKeepsValue
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_CREATE_STRONG_REFERENCE
     * @tc.desc   Verify napi_create_strong_reference and get value normal path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateStrongReferenceKeepsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-033
      expect(napispecdiffbatch2ndktest.createStrongReferenceKeepsValue()).assertEqual(1);
    });

    /**
     * @tc.name   testDeleteStrongReferenceOnceWorks
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_DELETE_STRONG_REFERENCE
     * @tc.desc   Verify napi_delete_strong_reference deletes a valid strong reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteStrongReferenceOnceWorks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-034
      expect(napispecdiffbatch2ndktest.deleteStrongReferenceOnceWorks()).assertEqual(1);
    });

    /**
     * @tc.name   testGetStrongReferenceValueWorksBeforeDelete
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_GET_STRONG_REFERENCE_VALUE
     * @tc.desc   Verify napi_get_strong_reference_value returns the original object before delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetStrongReferenceValueWorksBeforeDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-035
      expect(napispecdiffbatch2ndktest.getStrongReferenceValueWorksBeforeDelete()).assertEqual(1);
    });

    /**
     * @tc.name   testWrapEnhanceSyncAndAsyncFinalizerCanBeCreated
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_WRAP_ENHANCE_SYNC_ASYNC
     * @tc.desc   Verify napi_wrap_enhance accepts sync and async finalizer configuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWrapEnhanceSyncAndAsyncFinalizerCanBeCreated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-027
      expect(napispecdiffbatch2ndktest.wrapEnhanceSyncAndAsyncFinalizerCanBeCreated()).assertEqual(1);
    });

    /**
     * @tc.name   testRemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_REMOVE_WRAP_SENDABLE
     * @tc.desc   Verify napi_remove_wrap_sendable returns native pointer and does not call finalizer immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveWrapSendableReturnsNativePointerWithoutImmediateFinalizer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        // OH-NAPI-EXT-026
        expect(napispecdiffbatch2ndktest.removeWrapSendableReturnsNativePointerWithoutImmediateFinalizer()).assertEqual(1);
      });

    /**
     * @tc.name   testStrongSendableReferenceNormalPath
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH2_STRONG_SENDABLE_REFERENCE
     * @tc.desc   Verify strong sendable reference normal create/get/delete path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStrongSendableReferenceNormalPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-041 OH-NAPI-EXT-042 normal path
      expect(napispecdiffbatch2ndktest.strongSendableReferenceNormalPath()).assertEqual(1);
    });
  });
}
