/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import napispecdiffbatch3ndktest from 'libnapispecdiffbatch3ndktest.so';

const NAPI_GENERIC_FAILURE: number = 9;

@Concurrent
function refThreadsafeFunctionInTaskPool(): number {
  return napispecdiffbatch3ndktest.refThreadsafeFunctionWithCurrentEnv();
}

@Concurrent
function unrefThreadsafeFunctionInTaskPool(): number {
  return napispecdiffbatch3ndktest.unrefThreadsafeFunctionWithCurrentEnv();
}

export default function napiSpecDiffBatch3RuntimeSendableTest() {
  describe('NapiSpecDiffBatch3RuntimeSendableTest', () => {
    /**
     * @tc.name   testCreateThreadsafeFunctionInitialCountLimit
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_TSFN_INITIAL_COUNT_LIMIT
     * @tc.desc   Verify napi_create_threadsafe_function initial_thread_count upper limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateThreadsafeFunctionInitialCountLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-040
      expect(napispecdiffbatch3ndktest.createThreadsafeFunctionInitialCountLimit()).assertEqual(1);
    });

    /**
     * @tc.name   testQueueAsyncWorkWithQosReturnsOk
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_QUEUE_ASYNC_WORK_WITH_QOS
     * @tc.desc   Verify napi_queue_async_work_with_qos queues async work successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testQueueAsyncWorkWithQosReturnsOk', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-001
      expect(napispecdiffbatch3ndktest.queueAsyncWorkWithQosReturnsOk()).assertEqual(1);
    });

    /**
     * @tc.name   testThreadsafeFunctionLooseResourceAndNameTypes
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_TSFN_LOOSE_TYPES
     * @tc.desc   Verify napi_create_threadsafe_function accepts non-standard async resource and name value types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThreadsafeFunctionLooseResourceAndNameTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-041
      expect(napispecdiffbatch3ndktest.threadsafeFunctionLooseResourceAndNameTypes()).assertEqual(1);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionAfterCountZero
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_TSFN_RELEASE_ZERO
     * @tc.desc   Verify napi_release_threadsafe_function returns generic failure after thread count reaches zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseThreadsafeFunctionAfterCountZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-044
      expect(napispecdiffbatch3ndktest.releaseThreadsafeFunctionAfterCountZero()).assertEqual(1);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionFromTaskPoolReturnsGenericFailure
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_TSFN_REF_CROSS_THREAD
     * @tc.desc   Verify napi_ref_threadsafe_function rejects TaskPool env from another ArkTS thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRefThreadsafeFunctionFromTaskPoolReturnsGenericFailure',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        // OH-NAPI-DIFF-045
        expect(napispecdiffbatch3ndktest.setupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
        const status: number = await taskpool.execute(refThreadsafeFunctionInTaskPool) as number;
        expect(status).assertEqual(NAPI_GENERIC_FAILURE);
        expect(napispecdiffbatch3ndktest.cleanupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
      });

    /**
     * @tc.name   testUnrefThreadsafeFunctionFromTaskPoolReturnsGenericFailure
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_TSFN_UNREF_CROSS_THREAD
     * @tc.desc   Verify napi_unref_threadsafe_function rejects TaskPool env from another ArkTS thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUnrefThreadsafeFunctionFromTaskPoolReturnsGenericFailure',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        // OH-NAPI-DIFF-046
        expect(napispecdiffbatch3ndktest.setupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
        const status: number = await taskpool.execute(unrefThreadsafeFunctionInTaskPool) as number;
        expect(status).assertEqual(NAPI_GENERIC_FAILURE);
        expect(napispecdiffbatch3ndktest.cleanupThreadsafeFunctionCrossThreadProbe()).assertEqual(1);
      });

    /**
     * @tc.name   testCreateArkRuntimeOnNativeThread
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CREATE_ARK_RUNTIME_NATIVE_THREAD
     * @tc.desc   Verify napi_create_ark_runtime works on native-created thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArkRuntimeOnNativeThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-007
      expect(napispecdiffbatch3ndktest.createArkRuntimeOnNativeThread()).assertEqual(1);
    });

    /**
     * @tc.name   testIsSendableDistinguishesValues
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_IS_SENDABLE
     * @tc.desc   Verify napi_is_sendable distinguishes normal object and sendable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsSendableDistinguishesValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-016
      expect(napispecdiffbatch3ndktest.isSendableDistinguishesValues()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateSendableObjectArrayAndBuffer
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CREATE_SENDABLE_OBJECT_ARRAY_BUFFER
     * @tc.desc   Verify create sendable object, array and arraybuffer APIs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSendableObjectArrayAndBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-018 OH-NAPI-EXT-019 OH-NAPI-EXT-021
      expect(napispecdiffbatch3ndktest.createSendableObjectArrayAndBuffer()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthAndTypedArray
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CREATE_SENDABLE_TYPEDARRAY
     * @tc.desc   Verify create sendable array with length and sendable typedarray APIs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSendableArrayWithLengthAndTypedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-020 OH-NAPI-EXT-022
      expect(napispecdiffbatch3ndktest.createSendableArrayWithLengthAndTypedArray()).assertEqual(1);
    });

    /**
     * @tc.name   testSendableTypedArrayInfoAndTypeCheck
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_SENDABLE_TYPEDARRAY_INFO
     * @tc.desc   Verify napi_is_typedarray and napi_get_typedarray_info support sendable typedarray values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSendableTypedArrayInfoAndTypeCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-DIFF-016 OH-NAPI-DIFF-017
      expect(napispecdiffbatch3ndktest.sendableTypedArrayInfoAndTypeCheck()).assertEqual(1);
    });

    /**
     * @tc.name   testCreateObjectWithPropertiesHelpers
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CREATE_OBJECT_HELPERS
     * @tc.desc   Verify object creation helper APIs with descriptors and name/value arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateObjectWithPropertiesHelpers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-004 OH-NAPI-EXT-005
      expect(napispecdiffbatch3ndktest.createObjectWithPropertiesHelpers()).assertEqual(1);
    });

    /**
     * @tc.name   testThrowBusinessErrorStatus
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_THROW_BUSINESS_ERROR
     * @tc.desc   Verify napi_throw_business_error argument and normal throw status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrowBusinessErrorStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-043
      expect(napispecdiffbatch3ndktest.throwBusinessErrorStatus()).assertEqual(1);
    });

    /**
     * @tc.name   testCallsiteInfoGetAndSetProperty
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CALLSITE_INFO_PROPERTY
     * @tc.desc   Verify callsite info create/delete and property get/set helper APIs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallsiteInfoGetAndSetProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-044 OH-NAPI-EXT-045 OH-NAPI-EXT-046
      expect(napispecdiffbatch3ndktest.callsiteInfoGetAndSetProperty()).assertEqual(1);
    });

    /**
     * @tc.name   testCallsiteInfoNullParametersAreAccepted
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CALLSITE_INFO_NULL_PARAMS
     * @tc.desc   Verify callsite property get and set APIs accept null callsite info and null hit output
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallsiteInfoNullParametersAreAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-045 OH-NAPI-EXT-046
      expect(napispecdiffbatch3ndktest.callsiteInfoNullParametersAreAccepted()).assertEqual(1);
    });

    /**
     * @tc.name   testCriticalScopeUtf16BufferBehavior
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH3_CRITICAL_SCOPE_UTF16_BUFFER
     * @tc.desc   Verify critical scope UTF-16 buffer API succeeds for UTF-16 strings and rejects ASCII strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCriticalScopeUtf16BufferBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      // OH-NAPI-EXT-032
      expect(napispecdiffbatch3ndktest.criticalScopeUtf16BufferBehavior()).assertEqual(1);
    });
  });
}
