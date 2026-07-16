/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napiSpecDiffBatch4 from 'libnapispecdiffbatch4ndktest.so';


export default function napiSpecDiffBatch4StressProbeTest() {
  describe('NapiSpecDiffBatch4StressProbeTest', () => {
    /**
     * @tc.name   testSetElementHugeIndexDoesNotMutateObject
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_SET_ELEMENT_HUGE_INDEX
     * @tc.desc   Verify napi_set_element does not crash or mutate the object when a huge index cannot be set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetElementHugeIndexDoesNotMutateObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-022
      expect(napiSpecDiffBatch4.setElementHugeIndexDoesNotMutateObject()).assertEqual(1);
    });

    /**
     * @tc.name   testFatalExceptionRejectsNonError
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_FATAL_EXCEPTION_NON_ERROR
     * @tc.desc   Verify napi_fatal_exception returns napi_invalid_arg for non-Error values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFatalExceptionRejectsNonError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-060
      expect(napiSpecDiffBatch4.fatalExceptionRejectsNonError()).assertEqual(1);
    });

    /**
     * @tc.name   testExternalStringUtf16AndAsciiCreate
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_EXTERNAL_STRING_CREATE
     * @tc.desc   Verify OpenHarmony external string creation APIs accept UTF-16 and ASCII input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testExternalStringUtf16AndAsciiCreate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-036 OH-NAPI-EXT-037 OH-NAPI-EXT-038
      expect(napiSpecDiffBatch4.externalStringUtf16AndAsciiCreate()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateDateExtremeReturnsStatus
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CREATE_DATE_EXTREME
     * @tc.desc   Verify napi_create_date returns a controlled status for an extreme double value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDateExtremeReturnsStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-047
      expect(napiSpecDiffBatch4.createDateExtremeReturnsStatus()).assertEqual(1);
    });

    /**
     * @tc.name   testCallFunctionNullRecvIsolatedProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CALL_FUNCTION_NULL_RECV
     * @tc.desc   Probe napi_call_function with null recv inside a native-created Ark runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallFunctionNullRecvIsolatedProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-026
      expect(napiSpecDiffBatch4.callFunctionNullRecvIsolatedProbe()).assertEqual(1);
    });

    /**
     * @tc.name   testTsfnDestroyRuntimeWithoutExplicitCleanupProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_TSFN_DESTROY_RUNTIME
     * @tc.desc   Probe runtime destroy behavior after creating TSFN without explicit cleanup hook.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTsfnDestroyRuntimeWithoutExplicitCleanupProbe',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        // OH-NAPI-DIFF-042
        expect(napiSpecDiffBatch4.tsfnDestroyRuntimeWithoutExplicitCleanupProbe()).assertEqual(1);
      });

    /**
     * @tc.name   testCallThreadsafeFunctionAfterRuntimeDestroyProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_TSFN_CALL_AFTER_DESTROY
     * @tc.desc   Probe napi_call_threadsafe_function after its Ark runtime has been destroyed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallThreadsafeFunctionAfterRuntimeDestroyProbe',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
        // OH-NAPI-DIFF-043
        expect(napiSpecDiffBatch4.callThreadsafeFunctionAfterRuntimeDestroyProbe()).assertEqual(1);
      });

    /**
     * @tc.name   testCreateBigintHugeWordsProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_BIGINT_HUGE_WORDS
     * @tc.desc   Probe napi_create_bigint_words with a huge word count and controlled status handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBigintHugeWordsProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-048
      expect(napiSpecDiffBatch4.createBigintHugeWordsProbe()).assertEqual(1);
    });

    /**
     * @tc.name   testAddFinalizerThrowExceptionProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_FINALIZER_THROW
     * @tc.desc   Probe behavior when napi_add_finalizer callback throws a JS exception.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddFinalizerThrowExceptionProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-058
      expect(napiSpecDiffBatch4.addFinalizerThrowExceptionProbe()).assertEqual(1);
    });

    /**
     * @tc.name   testGetUvEventLoopAfterRuntimeDestroyProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UV_LOOP_AFTER_DESTROY
     * @tc.desc   Probe napi_get_uv_event_loop using an env after napi_destroy_ark_runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetUvEventLoopAfterRuntimeDestroyProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-061
      expect(napiSpecDiffBatch4.getUvEventLoopAfterRuntimeDestroyProbe()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateArrayWithHugeLengthProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAY_HUGE_LENGTH
     * @tc.desc   Probe napi_create_array_with_length with a huge length and controlled status handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArrayWithHugeLengthProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-062
      expect(napiSpecDiffBatch4.createArrayWithHugeLengthProbe()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateArrayBufferWithHugeLengthProbe
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAYBUFFER_HUGE_LENGTH
     * @tc.desc   Probe napi_create_arraybuffer with a huge byte length and controlled status handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArrayBufferWithHugeLengthProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-063
      expect(napiSpecDiffBatch4.createArrayBufferWithHugeLengthProbe()).assertEqual(1);
    });
  });
}
