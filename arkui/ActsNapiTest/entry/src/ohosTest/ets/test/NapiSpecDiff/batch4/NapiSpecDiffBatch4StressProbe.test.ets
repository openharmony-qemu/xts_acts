/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import napiSpecDiffBatch4 from 'libnapispecdiffbatch4ndktest.so';
import Utils from '../../Utils';


export default function napiSpecDiffBatch4StressProbeTest() {
  describe('NapiSpecDiffBatch4StressProbeTest', () => {

    beforeEach(async () => {
      await Utils.sleep(20);
    });


    /**
     * @tc.name testSetElementHugeIndexDoesNotMutateObject0001
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_SET_ELEMENT_HUGE_INDEX_0100
     * @tc.desc   Verify napi_set_element does not crash or mutate the object when a huge index cannot be set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetElementHugeIndexDoesNotMutateObject0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testSetElementHugeIndexDoesNotMutateObject0001';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-022
      expect(napiSpecDiffBatch4.setElementHugeIndexDoesNotMutateObject()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testFatalExceptionRejectsNonError0002
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_FATAL_EXCEPTION_NON_ERROR_0200
     * @tc.desc   Verify napi_fatal_exception returns napi_invalid_arg for non-Error values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFatalExceptionRejectsNonError0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testFatalExceptionRejectsNonError0002';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-060
      expect(napiSpecDiffBatch4.fatalExceptionRejectsNonError()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringUtf16AndAsciiCreate0003
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_EXTERNAL_STRING_CREATE_0300
     * @tc.desc   Verify OpenHarmony external string creation APIs accept UTF-16 and ASCII input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testExternalStringUtf16AndAsciiCreate0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringUtf16AndAsciiCreate0003';
      console.info(caseName + ' start');
      // OH-NAPI-EXT-036 OH-NAPI-EXT-037 OH-NAPI-EXT-038
      expect(napiSpecDiffBatch4.externalStringUtf16AndAsciiCreate()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateDateExtremeReturnsStatus0004
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CREATE_DATE_EXTREME_0400
     * @tc.desc   Verify napi_create_date returns a controlled status for an extreme double value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDateExtremeReturnsStatus0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateDateExtremeReturnsStatus0004';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-047
      expect(napiSpecDiffBatch4.createDateExtremeReturnsStatus()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCallFunctionNullRecvIsolatedProbe0005
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CALL_FUNCTION_NULL_RECV_0500
     * @tc.desc   Probe napi_call_function with null recv inside a native-created Ark runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCallFunctionNullRecvIsolatedProbe0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCallFunctionNullRecvIsolatedProbe0005';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-026
      expect(napiSpecDiffBatch4.callFunctionNullRecvIsolatedProbe()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testTsfnDestroyRuntimeWithoutExplicitCleanupProbe0006
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_TSFN_DESTROY_RUNTIME_0600
     * @tc.desc   Probe runtime destroy behavior after creating TSFN without explicit cleanup hook.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTsfnDestroyRuntimeWithoutExplicitCleanupProbe0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        const caseName = 'testTsfnDestroyRuntimeWithoutExplicitCleanupProbe0006';
        console.info(caseName + ' start');
        // OH-NAPI-DIFF-042
        expect(napiSpecDiffBatch4.tsfnDestroyRuntimeWithoutExplicitCleanupProbe()).assertEqual(1);
        console.info(caseName + ' end');
        done();
      });


    /**
     * @tc.name testCreateBigintHugeWordsProbe0008
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_BIGINT_HUGE_WORDS_0800
     * @tc.desc   Probe napi_create_bigint_words with a huge word count and controlled status handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateBigintHugeWordsProbe0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateBigintHugeWordsProbe0008';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-048
      expect(napiSpecDiffBatch4.createBigintHugeWordsProbe()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });



    /**
     * @tc.name testCreateArrayWithHugeLengthProbe0011
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAY_HUGE_LENGTH_1100
     * @tc.desc   Probe napi_create_array_with_length with a huge length and controlled status handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArrayWithHugeLengthProbe0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateArrayWithHugeLengthProbe0011';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-062
      expect(napiSpecDiffBatch4.createArrayWithHugeLengthProbe()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateArrayBufferWithHugeLengthProbe0012
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAYBUFFER_HUGE_LENGTH_1200
     * @tc.desc   Probe napi_create_arraybuffer with a huge byte length and controlled status handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArrayBufferWithHugeLengthProbe0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateArrayBufferWithHugeLengthProbe0012';
      console.info(caseName + ' start');
      // OH-NAPI-DIFF-063
      expect(napiSpecDiffBatch4.createArrayBufferWithHugeLengthProbe()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_has_element 测试 =====

    /**
     * @tc.name testHasElementAbnormalParams0013
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_HAS_ELEMENT_ABNORMAL_PARAMS_1300
     * @tc.desc Verify napi_has_element handles non-array, string, number, undefined, null, negative index correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testHasElementAbnormalParams0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testHasElementAbnormalParams0013';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testHasElementAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testHasElementReturnValue0014
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_HAS_ELEMENT_RETURN_VALUE_1400
     * @tc.desc Verify napi_has_element return value correctness for valid/invalid index, NULL env/result, empty array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testHasElementReturnValue0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testHasElementReturnValue0014';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testHasElementReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringUtf16ReturnValue0016
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UTF16_RETURN_VALUE_1600
     * @tc.desc Verify napi_create_external_string_utf16 return value and output parameter correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringUtf16ReturnValue0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringUtf16ReturnValue0016';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringUtf16ReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringUtf16NormalScene0017
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UTF16_NORMAL_SCENE_1700
     * @tc.desc Verify external UTF-16 string typical usage from external resource
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringUtf16NormalScene0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringUtf16NormalScene0017';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringUtf16NormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringUtf16AbnormalScene0018
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UTF16_ABNORMAL_SCENE_1800
     * @tc.desc Verify external UTF-16 string creation with env destroyed, pending exception, huge length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringUtf16AbnormalScene0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringUtf16AbnormalScene0018';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringUtf16AbnormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringUtf16Combination0019
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UTF16_COMBINATION_1900
     * @tc.desc Verify external UTF-16 string with get_length, get_content, reference management
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringUtf16Combination0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringUtf16Combination0019';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringUtf16Combination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_external_string_ascii 测试 =====

    /**
     * @tc.name testExternalStringAsciiNullParam0020
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ASCII_NULL_PARAM_2000
     * @tc.desc Verify napi_create_external_string_ascii returns error for NULL string parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringAsciiNullParam0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringAsciiNullParam0020';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringAsciiNullParam()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringAsciiReturnValue0021
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ASCII_RETURN_VALUE_2100
     * @tc.desc Verify napi_create_external_string_ascii return value and content via get_value_string_utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringAsciiReturnValue0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringAsciiReturnValue0021';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringAsciiReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringAsciiNormalScene0022
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ASCII_NORMAL_SCENE_2200
     * @tc.desc Verify external ASCII string in ArkTS as normal string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringAsciiNormalScene0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringAsciiNormalScene0022';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringAsciiNormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringAsciiNonAscii0023
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ASCII_NON_ASCII_2300
     * @tc.desc Verify napi_create_external_string_ascii with non-ASCII characters handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringAsciiNonAscii0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringAsciiNonAscii0023';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringAsciiNonAscii()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testExternalStringAsciiCombination0024
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ASCII_COMBINATION_2400
     * @tc.desc Verify external ASCII string with malloc, finalize callback, reference management
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testExternalStringAsciiCombination0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testExternalStringAsciiCombination0024';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testExternalStringAsciiCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_date 测试 =====

    /**
     * @tc.name testCreateDateNanScene0025
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CREATE_DATE_NAN_2500
     * @tc.desc Verify napi_create_date with NaN timestamp creates Invalid Date
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateDateNanScene0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateDateNanScene0025';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateDateNanScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateDateCombination0026
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CREATE_DATE_COMBINATION_2600
     * @tc.desc Verify napi_create_date with typeof and coerce_to_string combination
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateDateCombination0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateDateCombination0026';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateDateCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_threadsafe_function 测试 =====

    /**
     * @tc.name testCreateThreadsafeFunctionAbnormalParams0027
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_TSFN_ABNORMAL_PARAMS_2700
     * @tc.desc Verify napi_create_threadsafe_function returns error for invalid parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateThreadsafeFunctionAbnormalParams0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateThreadsafeFunctionAbnormalParams0027';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateThreadsafeFunctionAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_call_threadsafe_function 测试 =====

    /**
     * @tc.name testCallThreadsafeFunctionAbnormalParams0028
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CALL_TSFN_ABNORMAL_PARAMS_2800
     * @tc.desc Verify napi_call_threadsafe_function returns error for NULL tsfn
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCallThreadsafeFunctionAbnormalParams0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCallThreadsafeFunctionAbnormalParams0028';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCallThreadsafeFunctionAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_bigint_words 测试 =====

    /**
     * @tc.name testCreateBigintWordsCombination0029
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_BIGINT_WORDS_COMBINATION_2900
     * @tc.desc Verify napi_create_bigint_words and napi_get_value_bigint_words combination works correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateBigintWordsCombination0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateBigintWordsCombination0029';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateBigintWordsCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_add_finalizer 测试 =====

    /**
     * @tc.name testAddFinalizerAbnormalParams0030
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ADD_FINALIZER_ABNORMAL_PARAMS_3000
     * @tc.desc Verify napi_add_finalizer returns error for NULL object or NULL callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testAddFinalizerAbnormalParams0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAddFinalizerAbnormalParams0030';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testAddFinalizerAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testAddFinalizerReturnValue0031
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ADD_FINALIZER_RETURN_VALUE_3100
     * @tc.desc Verify napi_add_finalizer returns napi_ok and valid napi_ref on success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testAddFinalizerReturnValue0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAddFinalizerReturnValue0031';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testAddFinalizerReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testAddFinalizerCombination0032
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ADD_FINALIZER_COMBINATION_3200
     * @tc.desc Verify napi_add_finalizer with napi_create_external combination releases external resources correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testAddFinalizerCombination0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testAddFinalizerCombination0032';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testAddFinalizerCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_get_uv_event_loop 测试 =====

    /**
     * @tc.name testGetUvEventLoopAbnormalParams0033
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UV_LOOP_ABNORMAL_PARAMS_3300
     * @tc.desc Verify napi_get_uv_event_loop returns error for NULL parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUvEventLoopAbnormalParams0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUvEventLoopAbnormalParams0033';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUvEventLoopAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetUvEventLoopAbnormalScene0034
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UV_LOOP_ABNORMAL_SCENE_3400
     * @tc.desc Verify napi_get_uv_event_loop behavior with pending exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUvEventLoopAbnormalScene0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUvEventLoopAbnormalScene0034';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUvEventLoopAbnormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetUvEventLoopCombination0035
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UV_LOOP_COMBINATION_3500
     * @tc.desc Verify napi_get_uv_event_loop with async_work combination
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUvEventLoopCombination0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUvEventLoopCombination0035';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUvEventLoopCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_array_with_length 测试 =====

    /**
     * @tc.name testCreateArrayWithLengthAbnormalParams0036
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAY_WITH_LENGTH_ABNORMAL_PARAMS_3600
     * @tc.desc Verify napi_create_array_with_length rejects NULL result pointer and NULL env
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArrayWithLengthAbnormalParams0036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateArrayWithLengthAbnormalParams0036';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateArrayWithLengthAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCreateArrayWithLengthReturnValue0037
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAY_WITH_LENGTH_RETURN_VALUE_3700
     * @tc.desc Verify napi_create_array_with_length returns correct array length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArrayWithLengthReturnValue0037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateArrayWithLengthReturnValue0037';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateArrayWithLengthReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    //===== napi_create_arraybuffer 测试 =====

    /**
     * @tc.name testCreateArraybufferZeroLengthScene0038
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARRAYBUFFER_ZERO_LENGTH_3800
     * @tc.desc Verify napi_create_arraybuffer with 0 size creates empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArraybufferZeroLengthScene0038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateArraybufferZeroLengthScene0038';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateArraybufferZeroLengthScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_open_critical_scope 测试 =====

    /**
     * @tc.name testOpenCriticalScopeNormalParams0039
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_OPEN_CRITICAL_SCOPE_NORMAL_3900
     * @tc.desc Verify napi_open_critical_scope with valid env returns valid scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testOpenCriticalScopeNormalParams0039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testOpenCriticalScopeNormalParams0039';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testOpenCriticalScopeNormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testOpenCriticalScopeReturnValue0040
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_OPEN_CRITICAL_SCOPE_RETURN_VALUE_4000
     * @tc.desc Verify napi_open_critical_scope return value for valid/invalid env and NULL scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testOpenCriticalScopeReturnValue0040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testOpenCriticalScopeReturnValue0040';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testOpenCriticalScopeReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testOpenCriticalScopeAbnormalParams0041
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_OPEN_CRITICAL_SCOPE_ABNORMAL_PARAMS_4100
     * @tc.desc Verify napi_open_critical_scope returns error for NULL parameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testOpenCriticalScopeAbnormalParams0041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testOpenCriticalScopeAbnormalParams0041';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testOpenCriticalScopeAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_close_critical_scope 测试 =====

    /**
     * @tc.name testCloseCriticalScopeAbnormalParams0042
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CLOSE_CRITICAL_SCOPE_ABNORMAL_PARAMS_4200
     * @tc.desc Verify napi_close_critical_scope returns error for NULL scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeAbnormalParams0042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCloseCriticalScopeAbnormalParams0042';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCloseCriticalScopeAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCloseCriticalScopeReturnValue0043
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CLOSE_CRITICAL_SCOPE_RETURN_VALUE_4300
     * @tc.desc Verify napi_close_critical_scope returns napi_ok on success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeReturnValue0043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCloseCriticalScopeReturnValue0043';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCloseCriticalScopeReturnValue()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testCloseCriticalScopeAbnormalScene0044
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CLOSE_CRITICAL_SCOPE_ABNORMAL_SCENE_4400
     * @tc.desc Verify napi_close_critical_scope on already closed scope returns error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCloseCriticalScopeAbnormalScene0044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCloseCriticalScopeAbnormalScene0044';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCloseCriticalScopeAbnormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_ark_runtime 测试 =====

    /**
     * @tc.name testCreateArkRuntimeCombination0045
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_ARK_RUNTIME_COMBINATION_4500
     * @tc.desc Verify create_ark_runtime and destroy_ark_runtime complete lifecycle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateArkRuntimeCombination0045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateArkRuntimeCombination0045';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateArkRuntimeCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_is_exception_pending 测试 =====

    /**
     * @tc.name testIsExceptionPendingAbnormalScene0046
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_IS_EXCEPTION_PENDING_ABNORMAL_SCENE_4600
     * @tc.desc Verify napi_is_exception_pending behavior with multiple exceptions and non-Error objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsExceptionPendingAbnormalScene0046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testIsExceptionPendingAbnormalScene0046';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testIsExceptionPendingAbnormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testIsExceptionPendingCombination0047
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_IS_EXCEPTION_PENDING_COMBINATION_4700
     * @tc.desc Verify is_exception_pending with get_and_clear_last_exception and is_error combination
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testIsExceptionPendingCombination0047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testIsExceptionPendingCombination0047';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testIsExceptionPendingCombination()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_get_undefined 测试 =====

    /**
     * @tc.name testGetUndefinedAbnormalParams0048
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_GET_UNDEFINED_ABNORMAL_PARAMS_4800
     * @tc.desc Verify napi_get_undefined returns error for NULL env or NULL result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUndefinedAbnormalParams0048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUndefinedAbnormalParams0048';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUndefinedAbnormalParams()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetUndefinedNormalScene0049
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_GET_UNDEFINED_NORMAL_SCENE_4900
     * @tc.desc Verify napi_get_undefined returns undefined as default return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUndefinedNormalScene0049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUndefinedNormalScene0049';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUndefinedNormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_create_int32 测试 =====

    /**
     * @tc.name testCreateInt32AbnormalScene0050
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_CREATE_INT32_ABNORMAL_SCENE_5000
     * @tc.desc Verify napi_create_int32 behavior with pending exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCreateInt32AbnormalScene0050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testCreateInt32AbnormalScene0050';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testCreateInt32AbnormalScene()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== napi_set_element 补充用例 =====

    /**
     * @tc.name testSetElementNonObjectReturnsObjectExpected0051
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_SET_ELEMENT_NON_OBJECT_5100
     * @tc.desc Verify napi_set_element returns napi_object_expected with non-object argument
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testSetElementNonObjectReturnsObjectExpected0051',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testSetElementNonObjectReturnsObjectExpected0051';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.setElementNonObjectReturnsObjectExpected()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== 0052-0053: napi_get_uv_event_loop 补充测试 =====

    /**
     * @tc.name testGetUvEventLoopNonMainThread0052
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UV_LOOP_NON_MAIN_THREAD_5200
     * @tc.desc Verify napi_get_uv_event_loop returns valid loop on non-main thread
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUvEventLoopNonMainThread0052',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUvEventLoopNonMainThread0052';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUvEventLoopNonMainThread()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    /**
     * @tc.name testGetUvEventLoopWithThreadsafeFunction0053
     * @tc.number SUB_THIRDPARTY_NAPI_SPEC_DIFF_BATCH4_UV_LOOP_TSFN_COMBO_5300
     * @tc.desc Verify napi_get_uv_event_loop combined with napi_create_threadsafe_function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetUvEventLoopWithThreadsafeFunction0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName = 'testGetUvEventLoopWithThreadsafeFunction0053';
      console.info(caseName + ' start');
      expect(napiSpecDiffBatch4.testGetUvEventLoopWithThreadsafeFunction()).assertEqual(1);
      console.info(caseName + ' end');
      done();
    });

    // ===== 0058: criticalScopeForbiddenNapiCrashProbe — 已注释 =====
    // SDK 26.0.0限制：napi_create_object在critical scope内调用时SDK内部abort崩溃，
    // 而非返回错误码，C++层无法捕获此SIGABRT。

  });
}
