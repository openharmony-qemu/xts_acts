/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  decodeWithStream001,
  decodeWithStream002,
  decodeWithStream003,
  decodeWithStream004,
  decodeWithStream005,
  decodeWithStream006,
  decodeWithStream007,
  decodeWithStream_Options_001,
  decodeWithStream_Options_002,
  test_clamp_001,
  test_clamp_002,
  test_clamp_003,
  test_clamp_004,
  test_clamp_005,
  test_compareTo_001,
  test_compareTo_002,
  test_compareTo_003,
  test_compareTo_004,
  test_compareTo_005,
  test_contains_001,
  test_contains_002,
  test_contains_003,
  test_contains_004,
  test_contains_005,
  test_contains_006,
  test_contains_007,
  test_contains_008,
  test_contains_009,
  test_contains_010,
  test_createRationalFromString_001,
  test_createRationalFromString_002,
  test_createRationalFromString_003,
  test_createRationalFromString_004,
  test_createRationalFromString_005,
  test_createRationalFromString_006,
  test_createRationalFromString_007,
  test_createRationalFromString_008,
  test_createRationalFromString_009,
  test_createRationalFromString_010,
  test_createRationalFromString_011,
  test_createRationalFromString_012,
  test_createRationalFromString_013,
  test_createRationalFromString_014,
  test_createRationalFromString_015,
  test_decodeSync_base64_001,
  test_decodeSync_base64_002,
  test_decodeSync_base64_003,
  test_decodeSync_base64_004,
  test_decodeSync_base64_005,
  test_decodeSync_base64_006,
  test_decodeSync_base64_007,
  test_decodeSync_base64_008,
  test_decodeSync_base64_009,
  test_decodeSync_base64_010,
  test_encodeSync_base64_001,
  test_encodeSync_base64_002,
  test_encodeSync_base64_003,
  test_encodeSync_base64_004,
  test_encodeSync_base64_005,
  test_encodeToStringSync_base64_001,
  test_encodeToStringSync_base64_002,
  test_encodeToStringSync_base64_003,
  test_encodeToStringSync_base64_004,
  test_encodeToStringSync_base64_005,
  test_equals_001,
  test_equals_002,
  test_equals_003,
  test_equals_004,
  test_equals_005,
  test_expand_001,
  test_expand_002,
  test_expand_003,
  test_expand_004,
  test_expand_005,
  test_expand_006,
  test_expand_007,
  test_expand_008,
  test_expand_009,
  test_expand_010,
  test_expand_011,
  test_expand_012,
  test_expand_013,
  test_expand_014,
  test_expand_015,
  test_getLower_001,
  test_getLower_002,
  test_getLower_003,
  test_getLower_004,
  test_getLower_005,
  test_getUpper_001,
  test_getUpper_002,
  test_getUpper_003,
  test_getUpper_004,
  test_getUpper_005,
  test_intersect_001,
  test_intersect_002,
  test_intersect_003,
  test_intersect_004,
  test_intersect_005,
  test_intersect_006,
  test_intersect_007,
  test_intersect_008,
  test_intersect_009,
  test_intersect_010,
  test_toString_001,
  test_toString_002,
  test_toString_003,
  test_toString_004,
  test_toString_005,
  testAddAfter001,
  testAddAfter002,
  testAddAfter003,
  testAddAfter004,
  testAddAfter005,
  testAddAfter006,
  testAddAfter007,
  testAddAfter009,
  testAddAfter010,
  testAddAfter011,
  testAddAfter012,
  testAddAfter014,
  testAddAfter015,
  testAddBefore001,
  testAddBefore002,
  testAddBefore003,
  testAddBefore004,
  testAddBefore005,
  testAddBefore006,
  testAddBefore007,
  testAddBefore009,
  testAddBefore010,
  testAddBefore011,
  testAddBefore012,
  testAddBefore013,
  testAddBefore014,
  testAddBefore015,
  testAutoFinalizer_001,
  testdecode_testdecode_001,
  testdecode_testdecode_002,
  testdecode_testdecode_003,
  testdecode_testdecode_004,
  testdecode_testdecode_005,
  testdecode_testdecode_006,
  testdecode_testdecode_007,
  testdecode_testdecode_008,
  testdecode_testdecode_009,
  testdecode_testdecode_010,
  testEncode001,
  testEncode0010,
  testEncode0011,
  testEncode002,
  testEncode003,
  testEncode004,
  testEncode005,
  testEncode006,
  testEncode007,
  testEncode008,
  testEncode009,
  testEncode012,
  testEncode013,
  testEncode014,
  testEncode015,
  testEncode016,
  testEncodeInto001,
  testEncodeInto002,
  testEncodeInto003,
  testEncodeInto004,
  testEncodeInto005,
  testEncodeInto006,
  testEncodeInto007,
  testEncodeInto008,
  testEncodeInto009,
  testencodeIntoUint8Array_Info_001,
  testencodeIntoUint8Array_Info_0010,
  testencodeIntoUint8Array_Info_0011,
  testencodeIntoUint8Array_Info_0012,
  testencodeIntoUint8Array_Info_002,
  testencodeIntoUint8Array_Info_003,
  testencodeIntoUint8Array_Info_004,
  testencodeIntoUint8Array_Info_005,
  testencodeIntoUint8Array_Info_006,
  testencodeIntoUint8Array_Info_007,
  testencodeIntoUint8Array_Info_008,
  testencodeIntoUint8Array_Info_009,
  testencoding_textdecoder_001,
  testencoding_textdecoder_002,
  testencoding_textdecoder_003,
  testencoding_textdecoder_004,
  testencoding_textdecoder_005,
  testencoding_textdecoder_006,
  testencoding_textdecoder_007,
  testencoding_textdecoder_008,
  testencoding_textdecoder_009,
  testencoding_textdecoder_010,
  testencoding_textdecoder_011,
  testencoding_textencoder_001,
  testencoding_textencoder_002,
  testencoding_textencoder_003,
  testencoding_textencoder_004,
  testencoding_textencoder_005,
  testFatal001,
  testFatal002,
  testFatal003,
  testFatal004,
  testFatal005,
  testFatal006,
  testFatal007,
  testFatal008,
  testGetCommonDivisor001,
  testGetCommonDivisor002,
  testGetCommonDivisor003,
  testGetCommonDivisor004,
  testGetCommonDivisor005,
  testGetCommonFactor001,
  testGetCommonFactor002,
  testGetCommonFactor003,
  testGetCommonFactor004,
  testGetCommonFactor005,
  testGetCommonFactor006,
  testGetDenominator001,
  testGetDenominator002,
  testGetDenominator003,
  testGetDenominator004,
  testGetDenominator005,
  testGetDenominator006,
  testGetNumerator001,
  testGetNumerator002,
  testGetNumerator003,
  testGetNumerator004,
  testGetNumerator005,
  testIgnoreBOM001,
  testIgnoreBOM002,
  testIgnoreBOM003,
  testIgnoreBOM004,
  testIgnoreBOM005,
  testIgnoreBOM006,
  testIgnoreBOM007,
  testIgnoreBOM008,
  testIsAnyArrayBuffer001,
  testIsAnyArrayBuffer002,
  testIsAnyArrayBuffer003,
  testIsAnyArrayBuffer004,
  testIsAnyArrayBuffer005,
  testIsArgumentsObject001,
  testIsArgumentsObject002,
  testIsArgumentsObject003,
  testIsArgumentsObject004,
  testIsArgumentsObject005,
  testIsArrayBuffer001,
  testIsArrayBuffer002,
  testIsArrayBuffer003,
  testIsArrayBuffer004,
  testIsArrayBuffer005,
  testIsArrayBufferView001,
  testIsArrayBufferView002,
  testIsArrayBufferView003,
  testIsArrayBufferView004,
  testIsArrayBufferView005,
  testIsAsyncFunction001,
  testIsAsyncFunction002,
  testIsAsyncFunction003,
  testIsAsyncFunction004,
  testIsBigInt64Array001,
  testIsBigInt64Array002,
  testIsBigInt64Array003,
  testIsBigInt64Array004,
  testIsBigInt64Array005,
  testIsBigUint64Array001,
  testIsBigUint64Array002,
  testIsBigUint64Array003,
  testIsBigUint64Array004,
  testIsBigUint64Array005,
  testIsBigUint64Array006,
  testIsBooleanObject001,
  testIsBooleanObject002,
  testIsBooleanObject003,
  testIsBooleanObject004,
  testIsBooleanObject005,
  testIsBoxedPrimitive001,
  testIsBoxedPrimitive002,
  testIsBoxedPrimitive003,
  testIsBoxedPrimitive004,
  testIsBoxedPrimitive005,
  testIsDataView001,
  testIsDataView002,
  testIsDataView003,
  testIsDataView004,
  testIsDataView005,
  testIsDate001,
  testIsDate002,
  testIsDate003,
  testIsDate004,
  testIsDate005,
  testIsExternal001,
  testIsExternal002,
  testIsExternal003,
  testIsExternal004,
  testIsExternal005,
  testisFinite001,
  testisFinite002,
  testisFinite003,
  testisFinite004,
  testisFinite005,
  testIsFloat32Array001,
  testIsFloat32Array002,
  testIsFloat32Array003,
  testIsFloat32Array004,
  testIsFloat32Array005,
  testIsFloat64Array001,
  testIsFloat64Array002,
  testIsFloat64Array003,
  testIsFloat64Array004,
  testIsFloat64Array005,
  testIsGeneratorFunction001,
  testIsGeneratorFunction002,
  testIsGeneratorFunction003,
  testIsGeneratorFunction004,
  testIsGeneratorObject001,
  testIsGeneratorObject002,
  testIsGeneratorObject003,
  testIsGeneratorObject004,
  testIsInt16Array001,
  testIsInt16Array002,
  testIsInt16Array003,
  testIsInt16Array004,
  testIsInt16Array005,
  testIsInt32Array001,
  testIsInt32Array002,
  testIsInt32Array003,
  testIsInt32Array004,
  testIsInt32Array005,
  testIsInt8Array001,
  testIsInt8Array002,
  testIsInt8Array003,
  testIsInt8Array004,
  testIsInt8Array005,
  testIsMap001,
  testIsMap002,
  testIsMap003,
  testIsMap004,
  testIsMap005,
  testIsMapIterator001,
  testIsMapIterator002,
  testIsMapIterator003,
  testIsMapIterator004,
  testIsMapIterator005,
  testIsModuleNamespaceObject002,
  testIsModuleNamespaceObject003,
  testIsModuleNamespaceObject004,
  testIsModuleNamespaceObject005,
  testisNaN001,
  testisNaN002,
  testisNaN003,
  testisNaN004,
  testisNaN005,
  testIsNativeError001,
  testIsNativeError002,
  testIsNativeError003,
  testIsNativeError004,
  testIsNativeError005,
  testisZero001,
  testisZero002,
  testisZero003,
  testisZero004,
  testisZero005,
  testLruBufferAfterRemoval001,
  testLruBufferAfterRemoval002,
  testLruBufferAfterRemoval003,
  testLruBufferAfterRemoval004,
  testLruBufferAfterRemoval005,
  testLruBufferAfterRemoval006,
  testLruBufferAfterRemoval007,
  testLruBufferAfterRemoval008,
  testLruBufferClear001,
  testLruBufferClear002,
  testLruBufferClear003,
  testLruBufferClear004,
  testLruBufferClear005,
  testLruBufferContains001,
  testLruBufferContains002,
  testLruBufferContains003,
  testLruBufferContains004,
  testLruBufferContains005,
  testLruBufferCreateDefault001,
  testLruBufferCreateDefault002,
  testLruBufferCreateDefault003,
  testLruBufferCreateDefault004,
  testLruBufferCreateDefault005,
  testLruBufferEntries001,
  testLruBufferEntries002,
  testLruBufferEntries003,
  testLruBufferEntries004,
  testLruBufferEntries005,
  testLruBufferGet001,
  testLruBufferGet002,
  testLruBufferGet003,
  testLruBufferGet004,
  testLruBufferGet005,
  testLruBufferGetCapacity001,
  testLruBufferGetCapacity002,
  testLruBufferGetCapacity003,
  testLruBufferGetCapacity004,
  testLruBufferGetCapacity005,
  testLruBufferGetCreateCount001,
  testLruBufferGetCreateCount002,
  testLruBufferGetCreateCount003,
  testLruBufferGetCreateCount004,
  testLruBufferGetCreateCount005,
  testLruBufferGetMatchCount001,
  testLruBufferGetMatchCount002,
  testLruBufferGetMatchCount003,
  testLruBufferGetMatchCount004,
  testLruBufferGetMatchCount005,
  testLruBufferGetMatchCount006,
  testLruBufferGetMissCount001,
  testLruBufferGetMissCount002,
  testLruBufferGetMissCount003,
  testLruBufferGetMissCount004,
  testLruBufferGetMissCount005,
  testLruBufferGetMissCount006,
  testLruBufferGetPutCount001,
  testLruBufferGetPutCount002,
  testLruBufferGetPutCount003,
  testLruBufferGetPutCount004,
  testLruBufferGetPutCount005,
  testLruBufferGetRemovalCount001,
  testLruBufferGetRemovalCount002,
  testLruBufferGetRemovalCount003,
  testLruBufferGetRemovalCount004,
  testLruBufferGetRemovalCount005,
  testLruBufferIsEmpty001,
  testLruBufferIsEmpty002,
  testLruBufferIsEmpty003,
  testLruBufferIsEmpty004,
  testLruBufferIsEmpty005,
  testLruBufferKeys001,
  testLruBufferKeys002,
  testLruBufferKeys003,
  testLruBufferKeys004,
  testLruBufferKeys005,
  testLruBufferLength001,
  testLruBufferLength002,
  testLruBufferLength003,
  testLruBufferLength004,
  testLruBufferLength005,
  testLruBufferPut001,
  testLruBufferPut002,
  testLruBufferPut003,
  testLruBufferPut004,
  testLruBufferPut005,
  testLruBufferRemove001,
  testLruBufferRemove002,
  testLruBufferRemove003,
  testLruBufferRemove004,
  testLruBufferRemove005,
  testLruBufferSymboliterator001,
  testLruBufferSymboliterator002,
  testLruBufferSymboliterator003,
  testLruBufferSymboliterator004,
  testLruBufferSymboliterator005,
  testLruBufferToString001,
  testLruBufferToString002,
  testLruBufferToString003,
  testLruBufferToString004,
  testLruBufferToString005,
  testLruBufferUpdateGetCapacity001,
  testLruBufferUpdateGetCapacity002,
  testLruBufferUpdateGetCapacity003,
  testLruBufferUpdateGetCapacity004,
  testLruBufferUpdateGetCapacity005,
  testLruBufferValues001,
  testLruBufferValues002,
  testLruBufferValues003,
  testLruBufferValues004,
  testLruBufferValues005,
  testRationalNumberToString001,
  testRationalNumberToString002,
  testRationalNumberToString003,
  testRationalNumberToString004,
  testRationalNumberToString005,
  testRationalNumberValueOf001,
  testRationalNumberValueOf002,
  testRationalNumberValueOf003,
  testRationalNumberValueOf004,
  testRationalNumberValueOf005,
  testReplace001,
  testReplace002,
  testReplace003,
  testReplace004,
  testReplace005,
  testReplace006,
  testReplace007,
  testReplace009,
  testReplace010,
  testReplace011,
  testReplace013,
  testReplace014,
  testReplace015,
  testReplace016,
  testReplace017,
  testTextDecoderCreate_Options_001,
  testTextDecoderCreate_Options_002,
  testTextDecoderCreate_Options_003,
  testTextDecoderCreate_Options_004,
  testTextencoderencoding_001,
  testTextencoderencoding_002,
  testTextencoderencoding_003,
  testTextencoderencoding_004,
  testTextencoderencoding_005,
  testUtilCallbackWrapper001,
  testUtilCallbackWrapper002,
  testUtilCallbackWrapper003,
  testUtilCallbackWrapper004,
  testUtilCallbackWrapper005,
  testUtilCallbackWrapper006,
  testUtilGetErrorString001,
  testUtilGetErrorString002,
  testUtilGetErrorString003,
  testUtilGetErrorString004,
  testUtilGetErrorString005,
  testUtilPrintf001,
  testUtilPrintf002,
  testUtilPrintf003,
  testUtilPrintf004,
  testUtilPrintf005,
  testUtilPromiseWrapper001,
  testUtilPromiseWrapper002,
  testUtilPromiseWrapper003,
  testUtilPromiseWrapper004,
  testUtilPromiseWrapper005,
  testUtilPromiseWrapper006,
  testUtilPromisify_new_001,
  testUtilPromisify_new_002,
  testUtilPromisify_new_003,
  testUtilPromisify_new_004,
  testUtilPromisify_new_005
} from './Util1Resource';

export default function UtilFunFP1Test() {
  describe('TextEncoderFP1Test', () => {

    /**
     * @tc.name   testUtilPrintf001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0010
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testUtilPrintf001().split('\x00');
      expect(parts[0]).assertEqual("1,qwer 15");
    })

    /**
     * @tc.name   testUtilPrintf002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0020
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testUtilPrintf002().split('\x00');
      expect(parts[0]).assertEqual("{ name: 'jack',\n  age: 15 }");
    })

    /**
     * @tc.name   testUtilPrintf003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0030
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testUtilPrintf003().split('\x00');
      expect(parts[0]).assertEqual('[ 1, 2, 3, [length]: 3 ]');
    })

    /**
     * @tc.name   testUtilPrintf004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0040
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testUtilPrintf004().split('\x00');
      expect(parts[0]).assertEqual('1.5,qwer,%s');
    })

    /**
     * @tc.name   testUtilPrintf005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0050
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPrintf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testUtilPrintf005().split('\x00');
      expect(parts[0]).assertEqual('6,16');
    })

    /**
     * @tc.name   testUtilGetErrorString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0060
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilGetErrorString001()).split('\x00');
      expect(parts[0]).assertEqual('Unknown system error 10');
    })

    /**
     * @tc.name   testUtilGetErrorString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0070
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilGetErrorString002()).split('\x00');
      expect(parts[0]).assertEqual('Unknown system error 0');
    })

    /**
     * @tc.name   testUtilGetErrorString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0080
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilGetErrorString003()).split('\x00');
      expect(parts[0]).assertEqual('operation not permitted');
    })

    /**
     * @tc.name   testUtilGetErrorString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0090
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilGetErrorString004()).split('\x00');
      expect(parts[0]).assertEqual('Unknown system error 9');
    })

    /**
     * @tc.name   testUtilGetErrorString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0100
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetErrorString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilGetErrorString005()).split('\x00');
      expect(parts[0]).assertEqual('Unknown system error 555');
    })

    /**
     * @tc.name   testUtilPromisify_new_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0110
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromisify_new_001()).split('\x00');
      expect(parts[0]).assertEqual("Hello");
    })

    /**
     * @tc.name   testUtilPromisify_new_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0120
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromisify_new_002()).split('\x00');
      expect(parts[0]).assertEqual('type err');
    })

    /**
     * @tc.name   testUtilPromisify_new_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0130
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromisify_new_003()).split('\x00');
      expect(parts[0]).assertEqual("42");
    })

    /**
     * @tc.name   testUtilPromisify_new_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0140
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromisify_new_004()).split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testUtilPromisify_new_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0150
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromisify_new_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromisify_new_005()).split('\x00');
      expect(parts[0]).assertEqual("100");
    })

    /**
     * @tc.name   testUtilPromiseWrapper001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0160
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromiseWrapper001()).split('\x00');
      expect(parts[0]).assertEqual('HelloWorld');
    })

    /**
     * @tc.name   testUtilPromiseWrapper002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0170
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromiseWrapper002()).split('\x00');
      expect(parts[0]).assertEqual('type err');
    })

    /**
     * @tc.name   testUtilPromiseWrapper003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0180
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromiseWrapper003()).split('\x00');
      expect(parts[0]).assertEqual("Error: 123");
    })

    /**
     * @tc.name   testUtilPromiseWrapper004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0190
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromiseWrapper004()).split('\x00');
      expect(parts[0]).assertEqual("123123");
    })

    /**
     * @tc.name   testUtilPromiseWrapper005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0200
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromiseWrapper005()).split('\x00');
      expect(parts[0]).assertEqual("success");
    })

    /**
     * @tc.name   testUtilPromiseWrapper006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0210
     * @tc.desc   Takes a function following the common error-first callback style,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilPromiseWrapper006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilPromiseWrapper006()).split('\x00');
      expect(parts[0]).assertEqual("42");
    })

    /**
     * @tc.name   testUtilCallbackWrapper001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0220
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilCallbackWrapper001()).split('\x00');
      expect(parts[0]).assertEqual('BusinessError: Parameter error. The type of 1,2 must be function');
    })

    /**
     * @tc.name   testUtilCallbackWrapper002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0230
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilCallbackWrapper002()).split('\x00');
      expect(parts[0]).assertEqual("null");
      expect(parts[1]).assertEqual('value');
    })

    /**
     * @tc.name   testUtilCallbackWrapper003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0240
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilCallbackWrapper003()).split('\x00');
      expect(parts[0]).assertEqual("null");
      expect(parts[1]).assertEqual("42");
    })

    /**
     * @tc.name   testUtilCallbackWrapper004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0250
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilCallbackWrapper004()).split('\x00');
      expect(parts[0]).assertEqual('value');
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testUtilCallbackWrapper005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0260
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilCallbackWrapper005()).split('\x00');
      expect(parts[0]).assertEqual("null");
      expect(parts[1]).assertEqual("3");
    })

    /**
     * @tc.name   testUtilCallbackWrapper006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0270
     * @tc.desc   Takes an async function (or a function that returns a Promise) and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilCallbackWrapper006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let parts = (await testUtilCallbackWrapper006()).split('\x00');
      expect(parts[0]).assertEqual('maybe is not function');
    })

    /**
     * @tc.name   testencoding_textdecoder_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0280
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_001().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0290
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_002().split('\x00');
      expect(parts[0]).assertEqual('utf-16le');
    })

    /**
     * @tc.name   testencoding_textdecoder_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0300
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_003().split('\x00');
      expect(parts[0]).assertEqual('utf-16be');
    })

    /**
     * @tc.name   testencoding_textdecoder_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0310
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_004().split('\x00');
      expect(parts[0]).assertEqual('utf-16be');
    })

    /**
     * @tc.name   testencoding_textdecoder_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0320
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_005().split('\x00');
      expect(parts[0]).assertEqual('utf-16be');
    })

    /**
     * @tc.name   testencoding_textdecoder_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0330
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_006().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0340
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_007().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0350
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_008().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0360
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_009().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0370
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_010().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textdecoder_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0380
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textdecoder_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textdecoder_011().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testFatal001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0390
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testFatal002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0400
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testFatal003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0410
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testFatal004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0420
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testFatal005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0430
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testFatal006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0440
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal006().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testFatal007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0450
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal007().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testFatal008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0460
     * @tc.desc   Returns `true` if error mode is "fatal", and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testFatal008().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0470
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIgnoreBOM002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0480
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0490
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0500
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0510
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0520
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM006().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0530
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM007().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIgnoreBOM008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0540
     * @tc.desc   Returns `true` if ignore BOM flag is set, and `false` otherwise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIgnoreBOM008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testIgnoreBOM008().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testdecode_testdecode_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0550
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_001().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0560
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_002().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0570
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_003().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0580
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_004().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0590
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_005().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0600
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_006().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0610
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_007().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0620
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_008().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0630
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_009().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testdecode_testdecode_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0640
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testdecode_testdecode_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testdecode_testdecode_010().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0650
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream001().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0660
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream002().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0670
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream003().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0680
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream004().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0690
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream005().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0700
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream006().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0710
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream007().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testencoding_textencoder_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0720
     * @tc.desc   Encoding format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textencoder_001().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testencoding_textencoder_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0730
     * @tc.desc   Encoding format test gb18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textencoder_002().split('\x00');
      expect(parts[0]).assertEqual('gb18030');
      expect(parts[1]).assertEqual('GB18030');
    })

    /**
     * @tc.name   testencoding_textencoder_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0740
     * @tc.desc   Encoding format test gbk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textencoder_003().split('\x00');
      expect(parts[0]).assertEqual('gbk');
      expect(parts[1]).assertEqual('GBK');
    })

    /**
     * @tc.name   testencoding_textencoder_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0750
     * @tc.desc   Encoding format test gb2313.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textencoder_004().split('\x00');
      expect(parts[0]).assertEqual('gb2312');
      expect(parts[1]).assertEqual('GB2312');
    })

    /**
     * @tc.name   testencoding_textencoder_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0760
     * @tc.desc   The TextEncoder construction parameter is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencoding_textencoder_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencoding_textencoder_005().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
      expect(parts[1]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testEncode001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0770
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode001().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testEncode002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0780
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode002().split('\x00');
      expect(parts[0]).assertEqual("188");
    })

    /**
     * @tc.name   testEncode003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0790
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode003().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testEncode004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0800
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode004().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testEncode005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0810
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode005().split('\x00');
      expect(parts[0]).assertEqual("49");
      expect(parts[1]).assertEqual("230");
    })

    /**
     * @tc.name   testEncode006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0820
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode006().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testEncode007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0830
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode007().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testEncode008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0840
     * @tc.desc   Returns the result of encoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode008().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testEncode009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0850
     * @tc.desc   Returns the result of encoder for gb18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode009().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("185");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("236");
      expect(parts[4]).assertEqual("218");
    })

    /**
     * @tc.name   testEncode0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0860
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode0010().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("185");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("236");
      expect(parts[4]).assertEqual("218");
    })

    /**
     * @tc.name   testEncode0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0870
     * @tc.desc   Returns the result of encoder for GB18030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode0011().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("185");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("236");
      expect(parts[4]).assertEqual("218");
    })

    /**
     * @tc.name   testEncode012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0880
     * @tc.desc   Returns the result of encoder for gbk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode012().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("185");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("236");
      expect(parts[4]).assertEqual("218");
    })

    /**
     * @tc.name   testEncode013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0890
     * @tc.desc   Returns the result of encoder for gb2312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode013().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("185");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("236");
      expect(parts[4]).assertEqual("218");
    })

    /**
     * @tc.name   testEncode014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0900
     * @tc.desc   Returns the result of encoder for gb2312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode014().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("185");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("236");
      expect(parts[4]).assertEqual("218");
    })

    /**
     * @tc.name   testEncode015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0910
     * @tc.desc   Returns the result of encoder for gb2312, input long string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode015().split('\x00');
      expect(parts[0]).assertEqual("185");
      expect(parts[1]).assertEqual("97");
      expect(parts[2]).assertEqual("254");
      expect(parts[3]).assertEqual("185");
      expect(parts[4]).assertEqual("254");
    })

    /**
     * @tc.name   testEncode016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0920
     * @tc.desc   The encode parameter is undefined or null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncode016().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testEncodeInto001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0930
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto001().split('\x00');
      expect(parts[0]).assertEqual("7");
      expect(parts[1]).assertEqual("13");
    })

    /**
     * @tc.name   testEncodeInto002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0940
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto002().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("6");
    })

    /**
     * @tc.name   testEncodeInto003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0950
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto003().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("4");
    })

    /**
     * @tc.name   testEncodeInto004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0960
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto004().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("4");
    })

    /**
     * @tc.name   testEncodeInto005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0970
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto005().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("4");
    })

    /**
     * @tc.name   testEncodeInto006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0980
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto006().split('\x00');
      expect(parts[0]).assertEqual("0");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testEncodeInto007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0990
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto007().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("4");
    })

    /**
     * @tc.name   testEncodeInto008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1000
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto008().split('\x00');
      expect(parts[0]).assertEqual("0");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testEncodeInto009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1010
     * @tc.desc   The encodeInto parameter is undefined or null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEncodeInto009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testEncodeInto009().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1020
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testTextDecoderCreate_Options_001().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1030
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testTextDecoderCreate_Options_002().split('\x00');
      expect(parts[0]).assertEqual('utf-16be');
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1040
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testTextDecoderCreate_Options_003().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   testTextDecoderCreate_Options_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1050
     * @tc.desc   The source encoding's name, lowercased.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextDecoderCreate_Options_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testTextDecoderCreate_Options_004().split('\x00');
      expect(parts[0]).assertEqual('utf-8');
    })

    /**
     * @tc.name   decodeWithStream_Options_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1060
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream_Options_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream_Options_001().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   decodeWithStream_Options_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1070
     * @tc.desc   Returns the result of running encoding's decoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('decodeWithStream_Options_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = decodeWithStream_Options_002().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1080
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencodeIntoUint8Array_Info_001().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("6");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1090
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencodeIntoUint8Array_Info_002().split('\x00');
      expect(parts[0]).assertEqual("0");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1100
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencodeIntoUint8Array_Info_003().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("4");
      expect(parts[2]).assertEqual("98");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1110
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testencodeIntoUint8Array_Info_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let parts = testencodeIntoUint8Array_Info_004().split('\x00');
      expect(parts[0]).assertEqual("1");
      expect(parts[1]).assertEqual("1");
      expect(parts[2]).assertEqual("42");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1120
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_005().split('\x00');
      expect(parts[0]).assertEqual("8");
      expect(parts[1]).assertEqual("8");
      expect(parts[2]).assertEqual("49");
      expect(parts[3]).assertEqual("38");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1130
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_006().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("98");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1140
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_007().split('\x00');
      expect(parts[0]).assertEqual("97");
      expect(parts[1]).assertEqual("98");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1150
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_008().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("4");
      expect(parts[2]).assertEqual("240");
      expect(parts[3]).assertEqual("131");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1160
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_009().split('\x00');
      expect(parts[0]).assertEqual("5");
      expect(parts[1]).assertEqual("10");
      expect(parts[2]).assertEqual("97");
      expect(parts[3]).assertEqual("228");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1170
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_0010().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("4");
      expect(parts[2]).assertEqual("159");
      expect(parts[3]).assertEqual("131");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_0011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1180
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_0011().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("8");
      expect(parts[2]).assertEqual("159");
      expect(parts[3]).assertEqual("131");
    })

    /**
     * @tc.name   testencodeIntoUint8Array_Info_0012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_1190
     * @tc.desc   encode string, write the result to dest array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testencodeIntoUint8Array_Info_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testencodeIntoUint8Array_Info_0012().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual("10");
      expect(parts[2]).assertEqual("97");
      expect(parts[3]).assertEqual("152");
    })
  })

  describe('ScopeFP1Test', () => {

    /**
     * @tc.name   test_getLower_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1200
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getLower_001().split('\x00');
      expect(parts[0]).assertEqual('30');
    })

    /**
     * @tc.name   test_getLower_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1210
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getLower_002().split('\x00');
      expect(parts[0]).assertEqual('35');
    })

    /**
     * @tc.name   test_getLower_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1220
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getLower_003().split('\x00');
      expect(parts[0]).assertEqual('20');
    })

    /**
     * @tc.name   test_getLower_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1230
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getLower_004().split('\x00');
      expect(parts[0]).assertEqual('20');
    })

    /**
     * @tc.name   test_getLower_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1240
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getLower_005().split('\x00');
      expect(parts[0]).assertEqual('35');
    })

    /**
     * @tc.name   test_getUpper_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1250
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getUpper_001().split('\x00');
      expect(parts[0]).assertEqual('40');
    })

    /**
     * @tc.name   test_getUpper_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1260
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getUpper_002().split('\x00');
      expect(parts[0]).assertEqual('39');
    })

    /**
     * @tc.name   test_getUpper_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1270
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getUpper_003().split('\x00');
      expect(parts[0]).assertEqual('45');
    })

    /**
     * @tc.name   test_getUpper_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1280
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getUpper_004().split('\x00');
      expect(parts[0]).assertEqual('35');
    })

    /**
     * @tc.name   test_getUpper_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1290
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_getUpper_005().split('\x00');
      expect(parts[0]).assertEqual('45');
    })

    /**
     * @tc.name   test_clamp_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1300
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_clamp_001().split('\x00');
      expect(parts[0]).assertEqual('30');
    })

    /**
     * @tc.name   test_clamp_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1310
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_clamp_002().split('\x00');
      expect(parts[0]).assertEqual('35');
    })

    /**
     * @tc.name   test_clamp_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1320
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_clamp_003().split('\x00');
      expect(parts[0]).assertEqual('40');
    })

    /**
     * @tc.name   test_clamp_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1330
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_clamp_004().split('\x00');
      expect(parts[0]).assertEqual('30');
    })

    /**
     * @tc.name   test_clamp_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1340
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_clamp_005().split('\x00');
      expect(parts[0]).assertEqual('40');
    })

    /**
     * @tc.name   test_contains_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1350
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_contains_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1360
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_contains_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1370
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_contains_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1380
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_004().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_contains_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1390
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_005().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_contains_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1400
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_006().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_contains_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1410
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_007().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_contains_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1420
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_008().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_contains_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1430
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_009().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_contains_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1440
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_contains_010().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_expand_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1450
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_001().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_expand_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1460
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_002().split('\x00');
      expect(parts[0]).assertEqual('[20, 45]');
    })

    /**
     * @tc.name   test_expand_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1470
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_003().split('\x00');
      expect(parts[0]).assertEqual('[20, 40]');
    })

    /**
     * @tc.name   test_expand_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1480
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_004().split('\x00');
      expect(parts[0]).assertEqual('[30, 45]');
    })

    /**
     * @tc.name   test_expand_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1490
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_005().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_expand_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1500
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_006().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_expand_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1510
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_007().split('\x00');
      expect(parts[0]).assertEqual('[20, 45]');
    })

    /**
     * @tc.name   test_expand_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1520
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_008().split('\x00');
      expect(parts[0]).assertEqual('[20, 40]');
    })

    /**
     * @tc.name   test_expand_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1530
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_009().split('\x00');
      expect(parts[0]).assertEqual('[30, 45]');
    })

    /**
     * @tc.name   test_expand_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1540
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_010().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_expand_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1550
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_011().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_expand_012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1560
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_012().split('\x00');
      expect(parts[0]).assertEqual('[20, 40]');
    })

    /**
     * @tc.name   test_expand_013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1570
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_013().split('\x00');
      expect(parts[0]).assertEqual('[30, 45]');
    })

    /**
     * @tc.name   test_expand_014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1580
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_014().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_expand_015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1590
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_expand_015().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_intersect_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1600
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_001().split('\x00');
      expect(parts[0]).assertEqual('[35, 39]');
    })

    /**
     * @tc.name   test_intersect_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1610
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_002().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_intersect_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1620
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_003().split('\x00');
      expect(parts[0]).assertEqual('[30, 35]');
    })

    /**
     * @tc.name   test_intersect_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1630
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_004().split('\x00');
      expect(parts[0]).assertEqual('[35, 40]');
    })

    /**
     * @tc.name   test_intersect_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1640
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_005().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_intersect_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1650
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_006().split('\x00');
      expect(parts[0]).assertEqual('[35, 39]');
    })

    /**
     * @tc.name   test_intersect_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1660
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_007().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_intersect_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1670
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_008().split('\x00');
      expect(parts[0]).assertEqual('[30, 35]');
    })

    /**
     * @tc.name   test_intersect_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1680
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_009().split('\x00');
      expect(parts[0]).assertEqual('[35, 40]');
    })

    /**
     * @tc.name   test_intersect_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1690
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_intersect_010().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_toString_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1700
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_toString_001().split('\x00');
      expect(parts[0]).assertEqual('[30, 40]');
    })

    /**
     * @tc.name   test_toString_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1710
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_toString_002().split('\x00');
      expect(parts[0]).assertEqual('[35, 39]');
    })

    /**
     * @tc.name   test_toString_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1720
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_toString_003().split('\x00');
      expect(parts[0]).assertEqual('[20, 45]');
    })

    /**
     * @tc.name   test_toString_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1730
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_toString_004().split('\x00');
      expect(parts[0]).assertEqual('[20, 35]');
    })

    /**
     * @tc.name   test_toString_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SCOPE_1740
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_toString_005().split('\x00');
      expect(parts[0]).assertEqual('[35, 45]');
    })
  })

  describe('Base64FP1Test', () => {
    /**
     * @tc.name   test_encodeSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1750
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeSync_base64_001().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_encodeSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1760
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeSync_base64_002().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_encodeSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1770
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeSync_base64_003().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_encodeSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1780
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeSync_base64_004().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_encodeSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1790
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeSync_base64_005().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1800
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeToStringSync_base64_001().split('\x00');
      expect(parts[0]).assertEqual('czEz');
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1810
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeToStringSync_base64_002().split('\x00');
      expect(parts[0]).assertEqual('QmFzZTY0IE5vZGUuanM=');
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1820
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeToStringSync_base64_003().split('\x00');
      expect(parts[0]).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=');
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1830
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeToStringSync_base64_004().split('\x00');
      expect(parts[0]).assertEqual('qK6b/w==');
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1840
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_encodeToStringSync_base64_005().split('\x00');
      expect(parts[0]).assertEqual('QmFzZTY0');
    })

    /**
     * @tc.name   test_decodeSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1850
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_001().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1860
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_002().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1870
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_003().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1880
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_004().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1890
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_005().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1900
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_006().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1910
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_007().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1920
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_008().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1930
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_009().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

    /**
     * @tc.name   test_decodeSync_base64_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_BASE64_1940
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_decodeSync_base64_010().split('\x00');
      expect(parts[0]).assertEqual(parts[1]);
    })

  })

  describe('RationalNumberFunFP1Test', () => {

    /**
     * @tc.name   test_createRationalFromString_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_1950
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_001().split('\x00');
      expect(parts[0]).assertEqual("-0.5");
    })

    /**
     * @tc.name   test_createRationalFromString_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_1960
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_002().split('\x00');
      expect(parts[0]).assertEqual("0.75");
    })

    /**
     * @tc.name   test_createRationalFromString_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_1970
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_003().split('\x00');
      expect(parts[0]).assertEqual("-0.75");
    })

    /**
     * @tc.name   test_createRationalFromString_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_1980
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_004().split('\x00');
      expect(parts[0]).assertEqual("0.5");
    })

    /**
     * @tc.name   test_createRationalFromString_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_1990
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_005().split('\x00');
      expect(parts[0]).assertEqual("0.5");
    })

    /**
     * @tc.name   test_createRationalFromString_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2000
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_006().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of 123 must be effective string");
    })

    /**
     * @tc.name   test_createRationalFromString_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2010
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_007().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of abc must be effective string");
    })

    /**
     * @tc.name   test_createRationalFromString_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2020
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_008().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of 123abc must be effective string");
    })

    /**
     * @tc.name   test_createRationalFromString_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2030
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_009().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of abc: must be character string");
    })

    /**
     * @tc.name   test_createRationalFromString_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2040
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_010().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of :abc must be character string");
    })

    /**
     * @tc.name   test_createRationalFromString_011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2050
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_011().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of abc/ must be character string");
    })

    /**
     * @tc.name   test_createRationalFromString_012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2060
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_012().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of 123:abc must be character string");
    })

    /**
     * @tc.name   test_createRationalFromString_013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2070
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_013().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of abc/123 must be character string");
    })

    /**
     * @tc.name   test_createRationalFromString_014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2080
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_014().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of abc/abcd must be character string");
    })

    /**
     * @tc.name   test_createRationalFromString_015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2090
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_createRationalFromString_015().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of  must be effective string");
    })

    /**
     * @tc.name   test_compareTo_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2100
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_compareTo_001().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   test_compareTo_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2110
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_compareTo_002().split('\x00');
      expect(parts[0]).assertEqual("-1");
    })

    /**
     * @tc.name   test_compareTo_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2120
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_compareTo_003().split('\x00');
      expect(parts[0]).assertEqual("-1");
    })

    /**
     * @tc.name   test_compareTo_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2130
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_compareTo_004().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   test_compareTo_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2140
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareTo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_compareTo_005().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   test_equals_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2150
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_equals_001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_equals_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2160
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_equals_002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_equals_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2170
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_equals_003().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   test_equals_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2180
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_equals_004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   test_equals_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2190
     * @tc.desc   Checks whether a given object is the same as the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_equals_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = test_equals_005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testRationalNumberValueOf001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2200
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberValueOf001().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testRationalNumberValueOf002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2210
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberValueOf002().split('\x00');
      expect(parts[0]).assertEqual("0.2");
    })

    /**
     * @tc.name   testRationalNumberValueOf003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2220
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberValueOf003().split('\x00');
      expect(parts[0]).assertEqual("0.5");
    })

    /**
     * @tc.name   testRationalNumberValueOf004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2230
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberValueOf004().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testRationalNumberValueOf005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2240
     * @tc.desc   Obtains the value of the current RationalNumber object as a number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberValueOf005().split('\x00');
      expect(parts[0]).assertEqual("4");
    })

    /**
     * @tc.name   testGetCommonDivisor001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2250
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonDivisor001().split('\x00');
      expect(parts[0]).assertEqual("4");
    })

    /**
     * @tc.name   testGetCommonDivisor002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2260
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonDivisor002().split('\x00');
      expect(parts[0]).assertEqual("5");
    })

    /**
     * @tc.name   testGetCommonDivisor003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2270
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonDivisor003().split('\x00');
      expect(parts[0]).assertEqual("4");
    })

    /**
     * @tc.name   testGetCommonDivisor004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2280
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonDivisor004().split('\x00');
      expect(parts[0]).assertEqual("8");
    })

    /**
     * @tc.name   testGetCommonDivisor005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2290
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonDivisor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonDivisor005().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testGetCommonFactor001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2300
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonFactor001().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testGetCommonFactor002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2310
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonFactor002().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetCommonFactor003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2320
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonFactor003().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The Parameter cannot be zero");
    })

    /**
     * @tc.name   testGetCommonFactor004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2330
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonFactor004().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The Parameter cannot be zero");
    })

    /**
     * @tc.name   testGetCommonFactor005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2340
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonFactor005().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of null must be number");
    })

    /**
     * @tc.name   testGetCommonFactor006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2350
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCommonFactor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetCommonFactor006().split('\x00');
      expect(parts[0]).assertEqual("401");
      expect(parts[1]).assertContain("Parameter error. The type of 123 must be number");
    })

    /**
     * @tc.name   testGetDenominator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2360
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetDenominator001().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetDenominator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2370
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetDenominator002().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testGetDenominator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2380
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetDenominator003().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testGetDenominator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2390
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetDenominator004().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetDenominator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2400
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetDenominator005().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetDenominator006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2410
     * @tc.desc   Obtains the denominator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDenominator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetDenominator006().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetNumerator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2420
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetNumerator001().split('\x00');
      expect(parts[0]).assertEqual("-2");
    })

    /**
     * @tc.name   testGetNumerator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2430
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetNumerator002().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testGetNumerator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2440
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetNumerator003().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetNumerator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2450
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetNumerator004().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testGetNumerator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2460
     * @tc.desc   Obtains the numerator of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNumerator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testGetNumerator005().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testisFinite001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2470
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisFinite001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testisFinite002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2480
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisFinite002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testisFinite003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2490
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisFinite003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisFinite004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2500
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisFinite004().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testisFinite005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2510
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisFinite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisFinite005().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testisNaN001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2520
     * @tc.desc   Checks whether the current RationalNumber object represents a finite value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisNaN001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisNaN002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2530
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisNaN002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisNaN003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2540
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisNaN003().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testisNaN004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2550
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisNaN004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisNaN005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2560
     * @tc.desc   Checks whether the current RationalNumber object represents a Not-a-Number (NaN) value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisNaN005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisNaN005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisZero001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2570
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisZero001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisZero002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2580
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisZero002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testisZero003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2590
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisZero003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisZero004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2600
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisZero004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testisZero005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2610
     * @tc.desc   Checks whether the current RationalNumber object represents the value 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testisZero005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testisZero005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testRationalNumberToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2620
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberToString001().split('\x00');
      expect(parts[0]).assertEqual("-2/1");
    })

    /**
     * @tc.name   testRationalNumberToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2630
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberToString002().split('\x00');
      expect(parts[0]).assertEqual("NaN");
    })

    /**
     * @tc.name   testRationalNumberToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2640
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberToString003().split('\x00');
      expect(parts[0]).assertEqual("Infinity");
    })

    /**
     * @tc.name   testRationalNumberToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2650
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberToString004().split('\x00');
      expect(parts[0]).assertEqual("-Infinity");
    })

    /**
     * @tc.name   testRationalNumberToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_RATIONALNUMBER_2660
     * @tc.desc   Obtains a string representation of the current RationalNumber object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRationalNumberToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testRationalNumberToString005().split('\x00');
      expect(parts[0]).assertEqual('2/3');
    })
  })

  describe('LruBufferFunFP1Test', () => {

    /**
     * @tc.name   testLruBufferUpdateGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2670
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferUpdateGetCapacity001().split('\x00');
      expect(parts[0]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2680
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferUpdateGetCapacity002().split('\x00');
      expect(parts[0]).assertEqual("2147483646");
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2690
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferUpdateGetCapacity003().split('\x00');
      expect(parts[0]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2700
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferUpdateGetCapacity004().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferUpdateGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2710
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferUpdateGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferUpdateGetCapacity005().split('\x00');
      expect(parts[0]).assertEqual("100");
    })

    /**
     * @tc.name   testLruBufferGet001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2720
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGet001().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferGet002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2730
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGet002().split('\x00');
      expect(parts[0]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferGet003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2740
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGet003().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual("15");
      expect(parts[2]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferGet004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2750
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGet004().split('\x00');
      expect(parts[0]).assertEqual('bcjdshc');
      expect(parts[1]).assertEqual('cdjcaxb');
      expect(parts[2]).assertEqual("15");
      expect(parts[3]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferGet005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2760
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGet005().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual('cdjcaxb');
      expect(parts[2]).assertEqual("15");
      expect(parts[3]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferPut001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2770
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferPut001().split('\x00');
      expect(parts[0]).assertEqual('bcjdshc');
    })

    /**
     * @tc.name   testLruBufferPut002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2780
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferPut002().split('\x00');
      expect(parts[0]).assertEqual("13");
    })

    /**
     * @tc.name   testLruBufferPut003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2790
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferPut003().split('\x00');
      expect(parts[0]).assertEqual("12");
      expect(parts[1]).assertEqual("5");
      expect(parts[2]).assertEqual('adasfdad');
      expect(parts[3]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferPut004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2800
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferPut004().split('\x00');
      expect(parts[0]).assertEqual('bcjdshc');
      expect(parts[1]).assertEqual("12");
      expect(parts[2]).assertEqual("5");
      expect(parts[3]).assertEqual('adasfdad');
      expect(parts[4]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferPut005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2810
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferPut005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferPut005().split('\x00');
      expect(parts[0]).assertEqual('bcjdshc');
      expect(parts[1]).assertEqual("12");
      expect(parts[2]).assertEqual("5");
      expect(parts[3]).assertEqual("10");
      expect(parts[4]).assertEqual("22");
      expect(parts[5]).assertEqual("30");
    })

    /**
     * @tc.name   testLruBufferGetCreateCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2820
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCreateCount001().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetCreateCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2830
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCreateCount002().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetCreateCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2840
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCreateCount003().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetCreateCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2850
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCreateCount004().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetCreateCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2860
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCreateCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCreateCount005().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetMissCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2870
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMissCount001().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMissCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2880
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMissCount002().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMissCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2890
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMissCount003().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMissCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2900
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMissCount004().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMissCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2910
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMissCount005().split('\x00');
      expect(parts[0]).assertEqual("4");
    })

    /**
     * @tc.name   testLruBufferGetMissCount006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2920
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMissCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMissCount006().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2930
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetRemovalCount001().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2940
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetRemovalCount002().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2950
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetRemovalCount003().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2960
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetRemovalCount004().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetRemovalCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2970
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetRemovalCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetRemovalCount005().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMatchCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2980
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMatchCount001().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMatchCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_2990
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMatchCount002().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMatchCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3000
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMatchCount003().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetMatchCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3010
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMatchCount004().split('\x00');
      expect(parts[0]).assertEqual("5");
    })

    /**
     * @tc.name   testLruBufferGetMatchCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3020
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMatchCount005().split('\x00');
      expect(parts[0]).assertEqual("7");
    })

    /**
     * @tc.name   testLruBufferGetMatchCount006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3030
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetMatchCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetMatchCount006().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferGetPutCount001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3040
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetPutCount001().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testLruBufferGetPutCount002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3050
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetPutCount002().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferGetPutCount003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3060
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetPutCount003().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetPutCount004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3070
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetPutCount004().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetPutCount005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3080
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetPutCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetPutCount005().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3090
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCapacity001().split('\x00');
      expect(parts[0]).assertEqual("64");
    })

    /**
     * @tc.name   testLruBufferGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3100
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCapacity002().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3110
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCapacity003().split('\x00');
      expect(parts[0]).assertEqual("100");
    })

    /**
     * @tc.name   testLruBufferGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3120
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCapacity004().split('\x00');
      expect(parts[0]).assertEqual("50");
    })

    /**
     * @tc.name   testLruBufferGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3130
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferGetCapacity005().split('\x00');
      expect(parts[0]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferLength001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3140
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferLength001().split('\x00');
      expect(parts[0]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferLength002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3150
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferLength002().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testLruBufferLength003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3160
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferLength003().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferLength004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3170
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferLength004().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferLength005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3180
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferLength005().split('\x00');
      expect(parts[0]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferClear001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3190
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferClear001().split('\x00');
      expect(parts[0]).assertEqual("1");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferClear002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3200
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferClear002().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferClear003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3210
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferClear003().split('\x00');
      expect(parts[0]).assertEqual("4");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferClear004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3220
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferClear004().split('\x00');
      expect(parts[0]).assertEqual("3");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferClear005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3230
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferClear005().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("0");
    })

    /**
     * @tc.name   testLruBufferIsEmpty001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3240
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferIsEmpty001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferIsEmpty002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3250
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferIsEmpty002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferIsEmpty003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3260
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferIsEmpty003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferIsEmpty004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3270
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferIsEmpty004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferIsEmpty005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3280
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferIsEmpty005().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testLruBufferContains001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3290
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferContains001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testLruBufferContains002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3300
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferContains002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testLruBufferContains003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3310
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferContains003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferContains004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3320
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferContains004().split('\x00');
      expect(parts[0]).assertEqual("true");
      expect(parts[1]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferContains005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3330
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferContains005().split('\x00');
      expect(parts[0]).assertEqual("true");
      expect(parts[1]).assertEqual("true");
      expect(parts[2]).assertEqual("false");
    })

    /**
     * @tc.name   testLruBufferRemove001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3340
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferRemove001().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferRemove002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3350
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferRemove002().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferRemove003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3360
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferRemove003().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferRemove004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3370
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferRemove004().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferRemove005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3380
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferRemove005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferRemove005().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("10");
      expect(parts[2]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3390
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferCreateDefault001().split('\x00');
      expect(parts[0]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferCreateDefault002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3400
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferCreateDefault002().split('\x00');
      expect(parts[0]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferCreateDefault003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3410
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferCreateDefault003().split('\x00');
      expect(parts[0]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferCreateDefault004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3420
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferCreateDefault004().split('\x00');
      expect(parts[0]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferCreateDefault005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3430
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferCreateDefault005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferCreateDefault005().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testLruBufferKeys001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3440
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferKeys001().split('\x00');
      expect(parts[0]).assertEqual('string');
    })

    /**
     * @tc.name   testLruBufferKeys002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3450
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferKeys002().split('\x00');
      expect(parts[0]).assertEqual("1");
      expect(parts[1]).assertEqual("3");
      expect(parts[2]).assertEqual("5");
      expect(parts[3]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferKeys003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3460
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferKeys003().split('\x00');
      expect(parts[0]).assertEqual("1");
      expect(parts[1]).assertEqual("5");
      expect(parts[2]).assertEqual('abc');
      expect(parts[3]).assertEqual("3");
    })

    /**
     * @tc.name   testLruBufferKeys004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3470
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferKeys004().split('\x00');
      expect(parts[0]).assertEqual("5");
      expect(parts[1]).assertEqual('abc');
      expect(parts[2]).assertEqual("3");
      expect(parts[3]).assertEqual("1");
    })

    /**
     * @tc.name   testLruBufferKeys005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3480
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferKeys005().split('\x00');
      expect(parts[0]).assertEqual("3");
      expect(parts[1]).assertEqual("1");
      expect(parts[2]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferValues001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3490
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferValues001().split('\x00');
      expect(parts[0]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferValues002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3500
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferValues002().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("10");
      expect(parts[2]).assertEqual("15");
      expect(parts[3]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferValues003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3510
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferValues003().split('\x00');
      expect(parts[0]).assertEqual("2");
      expect(parts[1]).assertEqual("15");
      expect(parts[2]).assertEqual("20");
      expect(parts[3]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferValues004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3520
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferValues004().split('\x00');
      expect(parts[0]).assertEqual("15");
      expect(parts[1]).assertEqual("20");
      expect(parts[2]).assertEqual("10");
      expect(parts[3]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferValues005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3530
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferValues005().split('\x00');
      expect(parts[0]).assertEqual("10");
      expect(parts[1]).assertEqual("2");
      expect(parts[2]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferToString001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3540
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferToString001().split('\x00');
      expect(parts[0]).assertEqual('Lrubuffer[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]');
    })

    /**
     * @tc.name   testLruBufferToString002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3550
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferToString002().split('\x00');
      expect(parts[0]).assertEqual('Lrubuffer[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]');
    })

    /**
     * @tc.name   testLruBufferToString003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3560
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferToString003().split('\x00');
      expect(parts[0]).assertEqual('Lrubuffer[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]');
    })

    /**
     * @tc.name   testLruBufferToString004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3570
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferToString004().split('\x00');
      expect(parts[0]).assertEqual('Lrubuffer[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]');
    })

    /**
     * @tc.name   testLruBufferToString005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3580
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferToString005().split('\x00');
      expect(parts[0]).assertEqual('Lrubuffer[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]');
    })

    /**
     * @tc.name   testLruBufferEntries001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3590
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferEntries001().split('\x00');
      expect(parts[0]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferEntries002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3600
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferEntries002().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferEntries003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3610
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferEntries003().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testLruBufferEntries004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3620
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferEntries004().split('\x00');
      expect(parts[0]).assertEqual("15");
      expect(parts[1]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferEntries005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3630
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferEntries005().split('\x00');
      expect(parts[0]).assertEqual("10");
      expect(parts[1]).assertEqual("2");
      expect(parts[2]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferSymboliterator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3640
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferSymboliterator001().split('\x00');
      expect(parts[0]).assertEqual('abc');
    })

    /**
     * @tc.name   testLruBufferSymboliterator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3650
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferSymboliterator002().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferSymboliterator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3660
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferSymboliterator003().split('\x00');
      expect(parts[0]).assertEqual("1");
    })

    /**
     * @tc.name   testLruBufferSymboliterator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3670
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferSymboliterator004().split('\x00');
      expect(parts[0]).assertEqual("15");
      expect(parts[1]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferSymboliterator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3680
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferSymboliterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferSymboliterator005().split('\x00');
      expect(parts[0]).assertEqual("10");
      expect(parts[1]).assertEqual("2");
      expect(parts[2]).assertEqual("20");
    })

    /**
     * @tc.name   testLruBufferAfterRemoval001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3690
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval001().split('\x00');
      expect(parts[0]).assertEqual("10");
    })

    /**
     * @tc.name   testLruBufferAfterRemoval002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3700
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval002().split('\x00');
      expect(parts[0]).assertEqual('string');
    })

    /**
     * @tc.name   testLruBufferAfterRemoval003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3710
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval003().split('\x00');
      expect(parts[0]).assertEqual("12");
    })

    /**
     * @tc.name   testLruBufferAfterRemoval004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3720
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval004().split('\x00');
      expect(parts[0]).assertEqual("30");
    })

    /**
     * @tc.name   testLruBufferAfterRemoval005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3730
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval005().split('\x00');
      expect(parts[0]).assertEqual('string');
    })

    /**
     * @tc.name   testLruBufferAfterRemoval006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3740
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval006().split('\x00');
      expect(parts[0]).assertEqual("2");
    })

    /**
     * @tc.name   testLruBufferAfterRemoval007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_LRUBUFFER_3750
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval007().split('\x00');
      expect(parts[0]).assertEqual("8");
    })

    /**
     * @tc.name   testLruBufferAfterRemoval008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UTIL_3760
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLruBufferAfterRemoval008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testLruBufferAfterRemoval008().split('\x00');
      expect(parts[0]).assertEqual("1");
      expect(parts[1]).assertEqual("3");
      expect(parts[2]).assertEqual("2");
      expect(parts[3]).assertEqual("2");
      expect(parts[4]).assertEqual("10");
      expect(parts[5]).assertEqual("8");
    })
  })

  describe('TypesFP1Test', () => {

    /**
     * @tc.name   testIsAnyArrayBuffer001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3770
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAnyArrayBuffer001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsAnyArrayBuffer002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3780
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAnyArrayBuffer002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsAnyArrayBuffer003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3790
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAnyArrayBuffer003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsAnyArrayBuffer004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3800
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAnyArrayBuffer004().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsAnyArrayBuffer005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3810
     * @tc.desc   Check whether the entered value is of arraybuffer or sharedarraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAnyArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAnyArrayBuffer005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArrayBufferView001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3820
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBufferView001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsArrayBufferView002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3830
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBufferView002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsArrayBufferView003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3840
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBufferView003().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsArrayBufferView004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3850
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBufferView004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArrayBufferView005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3860
     * @tc.desc   Check whether the entered value is napi_ int8_ array or napi_ uint8_ array or naPi_ uint8_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBufferView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBufferView005().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsArgumentsObject001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3870
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArgumentsObject001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsArgumentsObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3880
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArgumentsObject002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArgumentsObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3890
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArgumentsObject003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArgumentsObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3900
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArgumentsObject004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArgumentsObject005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3910
     * @tc.desc   Check whether the entered value is an arguments object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArgumentsObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArgumentsObject005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArrayBuffer001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3920
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBuffer001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsArrayBuffer002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3930
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBuffer002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArrayBuffer003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3940
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBuffer003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArrayBuffer004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3950
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBuffer004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsArrayBuffer005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3960
     * @tc.desc   Check whether the entered value is of arraybuffer type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsArrayBuffer005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsAsyncFunction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3970
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAsyncFunction001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsAsyncFunction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3980
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAsyncFunction002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsAsyncFunction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_3990
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAsyncFunction003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsAsyncFunction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4000
     * @tc.desc   Check whether the value entered is an asynchronous function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsAsyncFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsAsyncFunction004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigInt64Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4010
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigInt64Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsBigInt64Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4020
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigInt64Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigInt64Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4030
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigInt64Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigInt64Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4040
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigInt64Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigInt64Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4050
     * @tc.desc   Check whether the entered value is of bigint64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigInt64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigInt64Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigUint64Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4060
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigUint64Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsBigUint64Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4070
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigUint64Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigUint64Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4080
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigUint64Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigUint64Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4090
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigUint64Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigUint64Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4100
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigUint64Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBigUint64Array006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4110
     * @tc.desc   Check whether the entered value is of biguint64array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBigUint64Array006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBigUint64Array006().split('\x00');
      expect(parts[0]).assertEqual("false");
    })


    /**
     * @tc.name   testIsBooleanObject001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4120
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBooleanObject001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsBooleanObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4130
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBooleanObject002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsBooleanObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4140
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBooleanObject003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBooleanObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4150
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBooleanObject004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBooleanObject005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4160
     * @tc.desc   Check whether the entered value is a Boolean object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBooleanObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBooleanObject005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBoxedPrimitive001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4170
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBoxedPrimitive001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBoxedPrimitive002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4180
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBoxedPrimitive002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsBoxedPrimitive003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4190
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBoxedPrimitive003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsBoxedPrimitive004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4200
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBoxedPrimitive004().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsBoxedPrimitive005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4210
     * @tc.desc   Check whether the entered value is a Boolean or number or string or symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsBoxedPrimitive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsBoxedPrimitive005().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsDataView001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4220
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDataView001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsDataView002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4230
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDataView002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDataView003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4240
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDataView003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDataView004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4250
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDataView004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDataView005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4260
     * @tc.desc   Check whether the entered value is of DataView type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDataView005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDate001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4270
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDate001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsDate002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4280
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDate002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDate003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4290
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDate003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDate004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4300
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDate004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsDate005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4310
     * @tc.desc   Check whether the entered value is of type date.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsDate005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsExternal001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4320
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsExternal001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsExternal002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4330
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsExternal002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsExternal003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4340
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsExternal003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsExternal004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4350
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsExternal004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsExternal005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4360
     * @tc.desc   Check whether the entered value is a native external value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExternal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsExternal005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat32Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4370
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat32Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsFloat32Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4380
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat32Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat32Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4390
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat32Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat32Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4400
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat32Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat32Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4410
     * @tc.desc   Check whether the entered value is of float32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat32Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat64Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4420
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat64Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsFloat64Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4430
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat64Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat64Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4440
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat64Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat64Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4450
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat64Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsFloat64Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4460
     * @tc.desc   Check whether the entered value is of float64array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsFloat64Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsFloat64Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorFunction001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4470
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorFunction001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorFunction002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4480
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorFunction002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorFunction003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4490
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorFunction003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorFunction004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4500
     * @tc.desc   Check whether the input value is a generator function type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorFunction004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorObject001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4510
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorObject001().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4520
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorObject002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4530
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorObject003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsGeneratorObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4540
     * @tc.desc   Check whether the entered value is a generator object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsGeneratorObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsGeneratorObject004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt8Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4550
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt8Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsInt8Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4560
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt8Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt8Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4570
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt8Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt8Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4580
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt8Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt8Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4590
     * @tc.desc   Check whether the entered value is of int8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt8Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt16Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4600
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt16Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsInt16Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4610
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt16Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt16Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4620
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt16Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt16Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4630
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt16Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt16Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4640
     * @tc.desc   Check whether the entered value is the int16array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt16Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt16Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt32Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4650
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt32Array001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsInt32Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4660
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt32Array002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt32Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4670
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt32Array003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt32Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4680
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt32Array004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsInt32Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4690
     * @tc.desc   Check whether the entered value is the int32array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsInt32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsInt32Array005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsMap001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4700
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMap001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsMap002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4710
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMap002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsMap003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4720
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMap003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsMap004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4730
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMap004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsMap005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4740
     * @tc.desc   Check whether the entered value is of map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMap005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsMapIterator001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4750
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMapIterator001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsMapIterator002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4760
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMapIterator002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsMapIterator003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4770
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMapIterator003().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsMapIterator004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4780
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMapIterator004().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsMapIterator005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4790
     * @tc.desc   Check whether the entered value is the iterator type of map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsMapIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsMapIterator005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })


    /**
     * @tc.name   testIsModuleNamespaceObject002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4800
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsModuleNamespaceObject002().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsModuleNamespaceObject003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4810
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsModuleNamespaceObject003().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsModuleNamespaceObject004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4820
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsModuleNamespaceObject004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsModuleNamespaceObject005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4830
     * @tc.desc   Check whether the entered value is the module namespace object object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsModuleNamespaceObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsModuleNamespaceObject005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsNativeError001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4840
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsNativeError001().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsNativeError002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4850
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsNativeError002().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsNativeError003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4860
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsNativeError003().split('\x00');
      expect(parts[0]).assertEqual("true");
    })

    /**
     * @tc.name   testIsNativeError004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4870
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsNativeError004().split('\x00');
      expect(parts[0]).assertEqual("false");
    })

    /**
     * @tc.name   testIsNativeError005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TYPES_4880
     * @tc.desc   Check whether the value entered is of type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNativeError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testIsNativeError005().split('\x00');
      expect(parts[0]).assertEqual("false");
    })
  })

  describe('AspectFP1Test', () => {

    /**
     * @tc.name   testAddBefore001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4890
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore001().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual('intMsg');
    })

    /**
     * @tc.name   testAddBefore002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4900
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore002().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual('msg123');
      expect(parts[2]).assertEqual('data');
    })

    /**
     * @tc.name   testAddBefore003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4910
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore003().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual('intData');
    })

    /**
     * @tc.name   testAddBefore004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4920
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let parts = (await testAddBefore004()).split('\x00');
      expect(parts[0]).assertEqual('456');
      expect(parts[1]).assertEqual('intMsg');
      expect(parts[2]).assertEqual('456');
      expect(parts[3]).assertEqual('intMsg');
    })

    /**
     * @tc.name   testAddBefore005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4930
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let parts = (await testAddBefore005()).split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual('123');
    })

    /**
     * @tc.name   testAddBefore006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4940
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore006().split('\x00');
      expect(parts[0]).assertEqual(`Parameter error. The type of printFunc must be a method of targetClass`);
    })

    /**
     * @tc.name   testAddBefore007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4950
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore007().split('\x00');
      expect(parts[0]).assertEqual(`Parameter error. The type of 123 must be string`);
    })

    /**
     * @tc.name   testAddBefore009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4960
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore009().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual('msg123');
      expect(parts[2]).assertEqual("0");
    })

    /**
     * @tc.name   testAddBefore010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4970
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore010().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual("6");
      expect(parts[2]).assertEqual("6");
      expect(parts[3]).assertEqual('strData');
    })

    /**
     * @tc.name   testAddBefore011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4980
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore011().split('\x00');
      expect(parts[0]).assertEqual("123");
      expect(parts[1]).assertEqual("223");
    })

    /**
     * @tc.name   testAddBefore012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_4990
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore012().split('\x00');
      expect(parts[0]).assertEqual("100");
      expect(parts[1]).assertEqual("102");
      expect(parts[2]).assertEqual('intDataBase');
    })

    /**
     * @tc.name   testAddBefore013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5000
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore013().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual('intMsg');
      expect(parts[3]).assertEqual('123');
      expect(parts[4]).assertEqual("0");
    })

    /**
     * @tc.name   testAddBefore014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5010
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore014().split('\x00');
      expect(parts[0]).assertEqual('AsyncFunction');
      expect(parts[1]).assertEqual('string');
      expect(parts[2]).assertEqual("undefined");
      expect(parts[3]).assertEqual('msg123');
      expect(parts[4]).assertEqual('AsyncFunction');
    })

    /**
     * @tc.name   testAddBefore015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5020
     * @tc.desc   Insert some logic before the method. In implementation the method will be replaced with a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddBefore015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddBefore015().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual("0");
    })

    /**
     * @tc.name   testAddAfter001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5030
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter001().split('\x00');
      expect(parts[0]).assertEqual('msg123');
      expect(parts[1]).assertEqual('123');
      expect(parts[2]).assertEqual("undefined");
    })

    /**
     * @tc.name   testAddAfter002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5040
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter002().split('\x00');
      expect(parts[0]).assertEqual("0");
      expect(parts[1]).assertEqual('123');
      expect(parts[2]).assertEqual("100");
      expect(parts[3]).assertEqual('intMsg');
    })

    /**
     * @tc.name   testAddAfter003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5050
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter003().split('\x00');
      expect(parts[0]).assertEqual('data');
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testAddAfter004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5060
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter004().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual('msg123');
      expect(parts[2]).assertEqual('true');
    })

    /**
     * @tc.name   testAddAfter005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5070
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter005().split('\x00');
      expect(parts[0]).assertEqual('intMsg');
    })

    /**
     * @tc.name   testAddAfter006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5080
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter006().split('\x00');
      expect(parts[0]).assertEqual(`Parameter error. The type of printFunc must be a method of targetClass`);
    })

    /**
     * @tc.name   testAddAfter007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5090
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter007().split('\x00');
      expect(parts[0]).assertEqual(`Parameter error. The type of 123 must be boolean`);
    })

    /**
     * @tc.name   testAddAfter009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5100
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter009().split('\x00');
      expect(parts[0]).assertEqual("0");
      expect(parts[1]).assertEqual('msg123');
      expect(parts[2]).assertEqual("6");
    })

    /**
     * @tc.name   testAddAfter010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5110
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter010().split('\x00');
      expect(parts[0]).assertEqual('strData');
      expect(parts[1]).assertEqual("undefined");
      expect(parts[2]).assertEqual("undefined");
      expect(parts[3]).assertEqual("undefined");
    })

    /**
     * @tc.name   testAddAfter011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5120
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter011().split('\x00');
      expect(parts[0]).assertEqual("223");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testAddAfter012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5130
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter012().split('\x00');
      expect(parts[0]).assertEqual("102");
      expect(parts[1]).assertEqual("0");
      expect(parts[2]).assertEqual('intDataBase');
    })

    /**
     * @tc.name   testAddAfter014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5140
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter014().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual("100");
    })

    /**
     * @tc.name   testAddAfter015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5150
     * @tc.desc   Insert some logic after the method. In implementation the method will be replaced with a new function,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddAfter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAddAfter015().split('\x00');
      expect(parts[0]).assertEqual('AsyncFunction');
      expect(parts[1]).assertEqual('str');
      expect(parts[2]).assertEqual('msg123');
      expect(parts[3]).assertEqual('true');
      expect(parts[4]).assertEqual('AsyncFunction');
    })

    /**
     * @tc.name   testReplace001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5160
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace001().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual("100");
    })

    /**
     * @tc.name   testReplace002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5170
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace002().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("undefined");
      expect(parts[2]).assertEqual("100");
      expect(parts[3]).assertEqual('intMsg');
    })

    /**
     * @tc.name   testReplace003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5180
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace003().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testReplace004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5190
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace004().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual("100");
      expect(parts[2]).assertEqual('intData');
    })

    /**
     * @tc.name   testReplace005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5200
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace005().split('\x00');
      expect(parts[0]).assertEqual('123');
    })

    /**
     * @tc.name   testReplace006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5210
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace006().split('\x00');
      expect(parts[0]).assertEqual("6");
      expect(parts[1]).assertEqual("100");
      expect(parts[2]).assertEqual("6");
      expect(parts[3]).assertEqual('strData');
    })

    /**
     * @tc.name   testReplace007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5220
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace007().split('\x00');
      expect(parts[0]).assertEqual('456');
      expect(parts[1]).assertEqual('intMsg');
    })

    /**
     * @tc.name   testReplace009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5230
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace009().split('\x00');
      expect(parts[0]).assertEqual(`Parameter error. The type of printFunc must be a method of targetClass`);
    })

    /**
     * @tc.name   testReplace010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5240
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace010().split('\x00');
      expect(parts[0]).assertEqual(`Parameter error. The type of 123 must be boolean`);
    })

    /**
     * @tc.name   testReplace011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5250
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace011().split('\x00');
      expect(parts[0]).assertEqual("undefined");
      expect(parts[1]).assertEqual('msg123');
      expect(parts[2]).assertEqual("6");
    })

    /**
     * @tc.name   testReplace013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5260
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace013().split('\x00');
      expect(parts[0]).assertEqual("10");
      expect(parts[1]).assertEqual("undefined");
    })

    /**
     * @tc.name   testReplace014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5270
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace014().split('\x00');
      expect(parts[0]).assertEqual("100");
      expect(parts[1]).assertEqual("0");
      expect(parts[2]).assertEqual('intDataBase');
    })

    /**
     * @tc.name   testReplace015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5280
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace015().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual('123');
      expect(parts[3]).assertEqual("111");
      expect(parts[4]).assertEqual("0");
    })

    /**
     * @tc.name   testReplace016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5290
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace016().split('\x00');
      expect(parts[0]).assertEqual('123');
      expect(parts[1]).assertEqual("111");
      expect(parts[2]).assertEqual("0");
      expect(parts[3]).assertEqual('123');
      expect(parts[4]).assertEqual("100");
    })

    /**
     * @tc.name   testReplace017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ASPECT_5300
     * @tc.desc   Replace the original method with a new function, which will execute 'instead' with the args 'this'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testReplace017().split('\x00');
      expect(parts[0]).assertEqual('AsyncFunction');
      expect(parts[1]).assertEqual('123');
      expect(parts[2]).assertEqual('intMsg');
      expect(parts[3]).assertEqual('AsyncFunction');
    })

    /**
     * @tc.name   testTextencoderencoding_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_5310
     * @tc.desc   Encoding format test gB2313.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextencoderencoding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testTextencoderencoding_001().split('\x00');
      expect(parts[0]).assertEqual('gB2312');
      expect(parts[1]).assertEqual('Gb2312');
    })

    /**
     * @tc.name   testTextencoderencoding_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_5320
     * @tc.desc   Encoding format test utf-16le.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextencoderencoding_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testTextencoderencoding_002().split('\x00');
      expect(parts[0]).assertEqual('utf-16le');
      expect(parts[1]).assertEqual('Utf-16le');
    })

    /**
     * @tc.name   testTextencoderencoding_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_5330
     * @tc.desc   Encoding format test GbK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextencoderencoding_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testTextencoderencoding_003().split('\x00');
      expect(parts[0]).assertEqual('GbK');
      expect(parts[1]).assertEqual('GBK');
    })

    /**
     * @tc.name   testTextencoderencoding_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_5340
     * @tc.desc   Encoding format test UTF-16le.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextencoderencoding_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testTextencoderencoding_004().split('\x00');
      expect(parts[0]).assertEqual('UTF-16le');
      expect(parts[1]).assertEqual('Utf-16le');
    })

    /**
     * @tc.name   testTextencoderencoding_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_5350
     * @tc.desc   Encoding format test ISO-8859-3/IBM866.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextencoderencoding_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testTextencoderencoding_005().split('\x00');
      expect(parts[0]).assertEqual('ISO-8859-3');
      expect(parts[1]).assertEqual('IBM866');
    })
  })

  describe('AutoFinalizerFP1Test', () => {
    /**
     * @tc.name   testAutoFinalizer_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_AUTO_FINALIZER_5360
     * @tc.desc   Auto finalizer test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAutoFinalizer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parts = testAutoFinalizer_001().split('\x00');
      expect(parts[0]).assertEqual('test');
    })
  })
}
