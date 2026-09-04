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
  test_clamp_001,
  test_clamp_002,
  test_clamp_003,
  test_clamp_004,
  test_clamp_005,
  test_clamp_throwError_001,
  test_compare_001,
  test_compare_002,
  test_compare_003,
  test_compare_004,
  test_compare_005,
  test_compareThrowError_001,
  test_constructor_throwError_001,
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
  test_contains_throwError_001,
  test_createRationalFromString_001,
  test_createRationalFromString_002,
  test_createRationalFromString_003,
  test_createRationalFromString_004,
  test_createRationalFromString_005,
  test_createRationalFromStringThrowError_001,
  test_decode_base64_001,
  test_decode_base64_002,
  test_decode_base64_003,
  test_decode_base64_004,
  test_decode_base64_005,
  test_decode_base64_006,
  test_decode_base64_007,
  test_decode_base64_008,
  test_decode_base64_009,
  test_decode_base64_010,
  test_decode_base64_throwError_001,
  test_decode_base64_throwError_006,
  test_decode_base64_throwError_007,
  test_decode_base64_throwError_008,
  test_decode_base64_throwError_009,
  test_decode_base64url_001,
  test_decode_base64url_002,
  test_decode_base64url_003,
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
  test_decodeSync_base64_throw_error_003,
  test_decodeSync_base64_throwError_001,
  test_decodeSync_base64_throwError_002,
  test_decodeSync_base64_throwError_003,
  test_decodeSync_base64_throwError_004,
  test_decodeSync_base64_throwError_005,
  test_decodeSync_base64_throwError_006,
  test_decodeSync_base64url_001,
  test_decodeSync_base64url_002,
  test_decodeSync_base64url_003,
  test_decodeSync_base64url_004,
  test_decodeSync_base64url_005,
  test_decodeSync_base64url_006,
  test_decodeSync_basic_base64_002,
  test_decodeSync_mime_base64_002,
  test_encode_base64url_001,
  test_encode_base64url_002,
  test_encode_base64url_003,
  test_encode_throwError_001,
  test_encode_throwError_002,
  test_encode_throwError_003,
  test_encodeAsync_base64_001,
  test_encodeAsync_base64_002,
  test_encodeAsync_base64_003,
  test_encodeAsync_base64_004,
  test_encodeAsync_base64_005,
  test_encodeAsync_base64_throwError_004,
  test_encodeSync_base64_001,
  test_encodeSync_base64_002,
  test_encodeSync_base64_003,
  test_encodeSync_base64_004,
  test_encodeSync_base64_005,
  test_encodeSync_base64_006,
  test_encodeSync_base64_throw_error_001,
  test_encodeSync_base64_throwError_001,
  test_encodeSync_base64url_001,
  test_encodeSync_base64url_002,
  test_encodeSync_base64url_003,
  test_encodesync_throwError_001,
  test_encodesync_throwError_002,
  test_encodesync_throwError_003,
  test_encodeToString_base64_001,
  test_encodeToString_base64_002,
  test_encodeToString_base64_003,
  test_encodeToString_base64_004,
  test_encodeToString_base64_005,
  test_encodeToString_base64_006,
  test_encodeToString_base64_throwError_005,
  test_encodeToString_base64url_001,
  test_encodeToString_base64url_002,
  test_encodeToString_base64url_003,
  test_encodeToString_basic_base64_003,
  test_encodeToString_basic_base64_004,
  test_encodeToString_mime_base64_003,
  test_encodeToString_mime_base64_004,
  test_encodeToString_throwError_001,
  test_encodeToStringSync_base64_001,
  test_encodeToStringSync_base64_002,
  test_encodeToStringSync_base64_003,
  test_encodeToStringSync_base64_004,
  test_encodeToStringSync_base64_005,
  test_encodeToStringSync_base64_006,
  test_encodeToStringSync_base64_throw_error_002,
  test_encodeToStringSync_base64url_001,
  test_encodeToStringSync_base64url_002,
  test_encodeToStringSync_base64url_003,
  test_encodeToStringSync_basic_base64_001,
  test_encodeToStringSync_mime_base64_001,
  test_encodeToStringSync_mime_base64_throwError_007,
  test_encodeToStringSync_throwError_001,
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
  test_expand_throwError_001,
  test_expand_throwError_002,
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
  test_intersect_throwError_001,
  test_intersect_throwError_002,
  test_parseRationalNumber_001,
  test_parseRationalNumberThrowError_001,
  test_toString_001,
  test_toString_002,
  test_toString_003,
  test_toString_004,
  test_toString_005,
  testgetCommonFactor001,
  testgetCommonFactor002,
  testgetCommonFactor003,
  testgetCommonFactor004,
  testgetCommonFactor005,
  testgetCommonFactorThrowError001,
  testIsNumberObject001,
  testIsNumberObject002,
  testIsNumberObject003,
  testIsNumberObject004,
  testIsNumberObject005,
  testIsPromise001,
  testIsPromise002,
  testIsPromise003,
  testIsPromise004,
  testIsPromise005,
  testIsProxy001,
  testIsProxy002,
  testIsProxy003,
  testIsProxy004,
  testIsProxy005,
  testIsRegExp001,
  testIsRegExp002,
  testIsRegExp003,
  testIsRegExp004,
  testIsRegExp005,
  testIsSet001,
  testIsSet002,
  testIsSet003,
  testIsSet004,
  testIsSet005,
  testIsSetIterator001,
  testIsSetIterator002,
  testIsSetIterator003,
  testIsSetIterator004,
  testIsSetIterator005,
  testIsSharedArrayBuffer001,
  testIsSharedArrayBuffer002,
  testIsSharedArrayBuffer003,
  testIsSharedArrayBuffer004,
  testIsSharedArrayBuffer005,
  testIsStringObject001,
  testIsStringObject002,
  testIsStringObject003,
  testIsStringObject004,
  testIsStringObject005,
  testIsSymbolObject001,
  testIsSymbolObject002,
  testIsSymbolObject003,
  testIsSymbolObject004,
  testIsSymbolObject005,
  testIsTypedArray001,
  testIsTypedArray002,
  testIsTypedArray003,
  testIsTypedArray004,
  testIsTypedArray005,
  testIsUint16Array001,
  testIsUint16Array002,
  testIsUint16Array003,
  testIsUint16Array004,
  testIsUint16Array005,
  testIsUint32Array001,
  testIsUint32Array002,
  testIsUint32Array003,
  testIsUint32Array004,
  testIsUint32Array005,
  testIsUint8Array001,
  testIsUint8Array002,
  testIsUint8Array003,
  testIsUint8Array004,
  testIsUint8Array005,
  testIsUint8ClampedArray001,
  testIsUint8ClampedArray002,
  testIsUint8ClampedArray003,
  testIsUint8ClampedArray004,
  testIsUint8ClampedArray005,
  testIsWeakMap001,
  testIsWeakMap002,
  testIsWeakMap003,
  testIsWeakMap004,
  testIsWeakMap005,
  testIsWeakSet001,
  testIsWeakSet002,
  testIsWeakSet003,
  testIsWeakSet004,
  testIsWeakSet005,
  testLRUCacheAfterRemoval001,
  testLRUCacheAfterRemoval002,
  testLRUCacheAfterRemoval003,
  testLRUCacheAfterRemoval004,
  testLRUCacheAfterRemoval005,
  testLRUCacheAfterRemoval006,
  testLRUCacheAfterRemoval007,
  testLRUCacheAfterRemoval008,
  testLRUCacheClear001,
  testLRUCacheClear002,
  testLRUCacheClear003,
  testLRUCacheClear004,
  testLRUCacheClear005,
  testLRUCacheConstrcutor001,
  testLRUCacheConstrcutor002,
  testLRUCacheContains001,
  testLRUCacheContains002,
  testLRUCacheContains003,
  testLRUCacheContains004,
  testLRUCacheContains005,
  testLRUCacheContains006,
  testLRUCacheCreateDefault001,
  testLRUCacheCreateDefault002,
  testLRUCacheCreateDefault003,
  testLRUCacheCreateDefault004,
  testLRUCacheCreateDefault005,
  testLRUCacheCreateDefault006,
  testLRUCacheEntries001,
  testLRUCacheEntries002,
  testLRUCacheEntries003,
  testLRUCacheEntries004,
  testLRUCacheEntries005,
  testLRUCacheGet001,
  testLRUCacheGet002,
  testLRUCacheGet003,
  testLRUCacheGet004,
  testLRUCacheGet005,
  testLRUCacheGet006,
  testLRUCacheGet007,
  testLRUCacheGetCapacity001,
  testLRUCacheGetCapacity002,
  testLRUCacheGetCapacity003,
  testLRUCacheGetCapacity004,
  testLRUCacheGetCapacity005,
  testLRUCacheGetCreateCount001,
  testLRUCacheGetCreateCount002,
  testLRUCacheGetCreateCount003,
  testLRUCacheGetCreateCount004,
  testLRUCacheGetCreateCount005,
  testLRUCacheGetMatchCount001,
  testLRUCacheGetMatchCount002,
  testLRUCacheGetMatchCount003,
  testLRUCacheGetMatchCount004,
  testLRUCacheGetMatchCount005,
  testLRUCacheGetMatchCount006,
  testLRUCacheGetMissCount001,
  testLRUCacheGetMissCount002,
  testLRUCacheGetMissCount003,
  testLRUCacheGetMissCount004,
  testLRUCacheGetMissCount005,
  testLRUCacheGetMissCount006,
  testLRUCacheGetPutCount001,
  testLRUCacheGetPutCount002,
  testLRUCacheGetPutCount003,
  testLRUCacheGetPutCount004,
  testLRUCacheGetPutCount005,
  testLRUCacheGetRemovalCount001,
  testLRUCacheGetRemovalCount002,
  testLRUCacheGetRemovalCount003,
  testLRUCacheGetRemovalCount004,
  testLRUCacheGetRemovalCount005,
  testLRUCacheIsEmpty001,
  testLRUCacheIsEmpty002,
  testLRUCacheIsEmpty003,
  testLRUCacheIsEmpty004,
  testLRUCacheIsEmpty005,
  testLRUCacheKeys001,
  testLRUCacheKeys002,
  testLRUCacheKeys003,
  testLRUCacheKeys004,
  testLRUCacheKeys005,
  testLRUCacheLength001,
  testLRUCacheLength002,
  testLRUCacheLength003,
  testLRUCacheLength004,
  testLRUCacheLength005,
  testLRUCachePut001,
  testLRUCachePut002,
  testLRUCachePut003,
  testLRUCachePut004,
  testLRUCachePut005,
  testLRUCachePut006,
  testLRUCachePut007,
  testLRUCachePut008,
  testLRUCacheRemove001,
  testLRUCacheRemove002,
  testLRUCacheRemove003,
  testLRUCacheRemove004,
  testLRUCacheRemove005,
  testLRUCacheRemove006,
  testLRUCacheRemove007,
  testLRUCacheSymbol001,
  testLRUCacheSymbol002,
  testLRUCacheSymbol003,
  testLRUCacheSymbol004,
  testLRUCacheSymbol005,
  testLRUCacheToString001,
  testLRUCacheToString002,
  testLRUCacheToString003,
  testLRUCacheToString004,
  testLRUCacheToString005,
  testLRUCacheUpdateGetCapacity001,
  testLRUCacheUpdateGetCapacity002,
  testLRUCacheUpdateGetCapacity003,
  testLRUCacheUpdateGetCapacity004,
  testLRUCacheUpdateGetCapacity005,
  testLRUCacheUpdateGetCapacity006,
  testLRUCacheUpdateGetCapacity007,
  testLRUCacheUpdateGetCapacity008,
  testLRUCacheValues001,
  testLRUCacheValues002,
  testLRUCacheValues003,
  testLRUCacheValues004,
  testLRUCacheValues005,
  testUtilerrnoToString001,
  testUtilerrnoToString002,
  testUtilerrnoToString003,
  testUtilerrnoToString004,
  testUtilerrnoToString005,
  testUtilerrnoToStringThrowError001,
  testUtilformat001,
  testUtilformat002,
  testUtilformat003,
  testUtilformat004,
  testUtilformat005,
  testUtilformatThrowError001,
  testUtilgenerateRandomBinaryUUID001,
  testUtilgenerateRandomBinaryUUID002,
  testUtilgenerateRandomUUID001,
  testUtilgenerateRandomUUID002,
  testUtilgenerateRandomUUID003,
  testUtilGetHash001,
  testUtilGetHash002,
  testUtilGetHash003,
  testUtilGetHash004,
  testUtilGetHash005,
  testUtilGetHash006,
  testUtilParseUUID001,
  testUtilParseUUID002,
  testUtilParseUUID003,
  testUtilParseUUIDThrow001,
  testUtilRandomBinaryUUID001,
  testUtilRandomBinaryUUID002,
  testUtilRandomBinaryUUIDThrowError001,
  testUtilRandomUUID001,
  testUtilRandomUUID002,
  testUtilRandomUUIDThrowError001,
} from './Util2Resource';

export default function UtilFunFP2Test() {
  describe('TextEncoderFP2Test', () => {
    /**
     * @tc.name   testIsNumberObject001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_NUMBER_OBJECT_0010
     * @tc.desc   Check whether the entered value is of the number object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNumberObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsNumberObject001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsNumberObject002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_NUMBER_OBJECT_0020
     * @tc.desc   Check whether the entered value is of the number object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNumberObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsNumberObject002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsNumberObject003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_NUMBER_OBJECT_0030
     * @tc.desc   Check whether the entered value is of the number object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNumberObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsNumberObject003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsNumberObject004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_NUMBER_OBJECT_0040
     * @tc.desc   Check whether the entered value is of the number object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsNumberObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsNumberObject004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsNumberObject005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_NUMBER_OBJECT_0050
     * @tc.desc   Check whether the entered value is of the number object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsNumberObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsNumberObject005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsPromise001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROMISE_0060
     * @tc.desc   Check whether the entered value is of promise type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsPromise001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsPromise002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROMISE_0070
     * @tc.desc   Check whether the entered value is of promise type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsPromise002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsPromise003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROMISE_0080
     * @tc.desc   Check whether the entered value is of promise type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsPromise003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsPromise004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROMISE_0090
     * @tc.desc   Check whether the entered value is of promise type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromise004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsPromise004()).assertEqual(true)
    })

    /**
     * @tc.name   testIsPromise005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROMISE_0100
     * @tc.desc   Check whether the entered value is of promise type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromise005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsPromise005()).assertEqual(true)
    })

    /**
     * @tc.name   testIsProxy001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROXY_0110
     * @tc.desc   Check whether the value entered is of proxy type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsProxy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsProxy001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsProxy002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROXY_0120
     * @tc.desc   Check whether the value entered is of proxy type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsProxy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testIsProxy002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsProxy003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROXY_0130
     * @tc.desc   Check whether the value entered is of proxy type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsProxy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsProxy003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsProxy004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROXY_0140
     * @tc.desc   Check whether the value entered is of proxy type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsProxy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsProxy004()).assertEqual(true)
    })

    /**
     * @tc.name   testIsProxy005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_PROXY_0150
     * @tc.desc   Check whether the value entered is of proxy type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsProxy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsProxy005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsRegExp001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_REGEXP_0160
     * @tc.desc   Check whether the entered value is of type regexp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRegExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsRegExp001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsRegExp002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_REGEXP_0170
     * @tc.desc   Check whether the entered value is of type regexp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRegExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsRegExp002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsRegExp003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_REGEXP_0180
     * @tc.desc   Check whether the entered value is of type regexp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRegExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsRegExp003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsRegExp004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_REGEXP_0190
     * @tc.desc   Check whether the entered value is of type regexp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRegExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsRegExp004()).assertEqual(true)
    })

    /**
     * @tc.name   testIsRegExp005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_REGEXP_0200
     * @tc.desc   Check whether the entered value is of type regexp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsRegExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsRegExp005()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSet001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_0210
     * @tc.desc   Check whether the entered value is of type set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSet001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSet002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_0220
     * @tc.desc   Check whether the entered value is of type set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSet002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSet003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_0230
     * @tc.desc   Check whether the entered value is of type set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSet003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSet004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_0240
     * @tc.desc   Check whether the entered value is of type set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSet004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSet005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_0250
     * @tc.desc   Check whether the entered value is of type set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSet005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSetIterator001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_ITERATOR_0260
     * @tc.desc   Check whether the entered value is the iterator type of set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSetIterator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSetIterator001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSetIterator002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_ITERATOR_0270
     * @tc.desc   Check whether the entered value is the iterator type of set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSetIterator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSetIterator002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSetIterator003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_ITERATOR_0280
     * @tc.desc   Check whether the entered value is the iterator type of set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSetIterator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSetIterator003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSetIterator004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_ITERATOR_0290
     * @tc.desc   Check whether the entered value is the iterator type of set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSetIterator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSetIterator004()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSetIterator005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SET_ITERATOR_0300
     * @tc.desc   Check whether the entered value is the iterator type of set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSetIterator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSetIterator005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSharedArrayBuffer001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SHARED_ARRAY_BUFFER_0310
     * @tc.desc   Check whether the entered value is of type sharedarraybuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSharedArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSharedArrayBuffer001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSharedArrayBuffer002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SHARED_ARRAY_BUFFER_0320
     * @tc.desc   Check whether the entered value is of type sharedarraybuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSharedArrayBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSharedArrayBuffer002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSharedArrayBuffer003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SHARED_ARRAY_BUFFER_0330
     * @tc.desc   Check whether the entered value is of type sharedarraybuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSharedArrayBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSharedArrayBuffer003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSharedArrayBuffer004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SHARED_ARRAY_BUFFER_0340
     * @tc.desc   Check whether the entered value is of type sharedarraybuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSharedArrayBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSharedArrayBuffer004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSharedArrayBuffer005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SHARED_ARRAY_BUFFER_0350
     * @tc.desc   Check whether the entered value is of type sharedarraybuffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSharedArrayBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSharedArrayBuffer005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsStringObject001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_STRING_OBJECT_0360
     * @tc.desc   Check whether the entered value is a string object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsStringObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsStringObject001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsStringObject002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_STRING_OBJECT_0370
     * @tc.desc   Check whether the entered value is a string object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsStringObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsStringObject002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsStringObject003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_STRING_OBJECT_0380
     * @tc.desc   Check whether the entered value is a string object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsStringObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsStringObject003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsStringObject004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_STRING_OBJECT_0390
     * @tc.desc   Check whether the entered value is a string object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsStringObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsStringObject004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsStringObject005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_STRING_OBJECT_0400
     * @tc.desc   Check whether the entered value is a string object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsStringObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsStringObject005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSymbolObject001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SYMBOL_OBJECT_0410
     * @tc.desc   Check whether the entered value is a symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSymbolObject001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSymbolObject001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSymbolObject002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SYMBOL_OBJECT_0420
     * @tc.desc   Check whether the entered value is a symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSymbolObject002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSymbolObject002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSymbolObject003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SYMBOL_OBJECT_0430
     * @tc.desc   Check whether the entered value is a symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSymbolObject003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSymbolObject003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsSymbolObject004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SYMBOL_OBJECT_0440
     * @tc.desc   Check whether the entered value is a symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSymbolObject004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSymbolObject004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsSymbolObject005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_SYMBOL_OBJECT_0450
     * @tc.desc   Check whether the entered value is a symbol object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsSymbolObject005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsSymbolObject005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsTypedArray001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_TYPED_ARRAY_0460
     * @tc.desc   Check whether the entered value is a type contained in typedarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsTypedArray001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsTypedArray002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_TYPED_ARRAY_0470
     * @tc.desc   Check whether the entered value is a type contained in typedarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsTypedArray002()).assertEqual(true)
    })

    /**
     * @tc.name   testIsTypedArray003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_TYPED_ARRAY_0480
     * @tc.desc   Check whether the entered value is a type contained in typedarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsTypedArray003()).assertEqual(true)
    })

    /**
     * @tc.name   testIsTypedArray004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_TYPED_ARRAY_0490
     * @tc.desc   Check whether the entered value is a type contained in typedarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsTypedArray004()).assertEqual(true)
    })

    /**
     * @tc.name   testIsTypedArray005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_TYPED_ARRAY_0500
     * @tc.desc   Check whether the entered value is a type contained in typedarray.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsTypedArray005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8Array001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_ARRAY_0510
     * @tc.desc   Check whether the entered value is the uint8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8Array001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsUint8Array002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_ARRAY_0520
     * @tc.desc   Check whether the entered value is the uint8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8Array002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8Array003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_ARRAY_0530
     * @tc.desc   Check whether the entered value is the uint8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8Array003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8Array004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_ARRAY_0540
     * @tc.desc   Check whether the entered value is the uint8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8Array004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8Array005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_ARRAY_0550
     * @tc.desc   Check whether the entered value is the uint8array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8Array005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8ClampedArray001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_CLAMPED_ARRAY_0560
     * @tc.desc   Check whether the entered value is the uint8clapedarray array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8ClampedArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8ClampedArray001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsUint8ClampedArray002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_CLAMPED_ARRAY_0570
     * @tc.desc   Check whether the entered value is the uint8clapedarray array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8ClampedArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8ClampedArray002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8ClampedArray003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_CLAMPED_ARRAY_0580
     * @tc.desc   Check whether the entered value is the uint8clapedarray array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8ClampedArray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8ClampedArray003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8ClampedArray004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_CLAMPED_ARRAY_0590
     * @tc.desc   Check whether the entered value is the uint8clapedarray array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8ClampedArray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8ClampedArray004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint8ClampedArray005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT8_CLAMPED_ARRAY_0600
     * @tc.desc   Check whether the entered value is the uint8clapedarray array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint8ClampedArray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint8ClampedArray005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint16Array001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT16_ARRAY_0610
     * @tc.desc   Check whether the entered value is the uint16array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint16Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint16Array001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsUint16Array002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT16_ARRAY_0620
     * @tc.desc   Check whether the entered value is the uint16array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint16Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint16Array002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint16Array003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT16_ARRAY_0630
     * @tc.desc   Check whether the entered value is the uint16array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint16Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint16Array003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint16Array004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT16_ARRAY_0640
     * @tc.desc   Check whether the entered value is the uint16array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint16Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint16Array004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint16Array005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT16_ARRAY_0650
     * @tc.desc   Check whether the entered value is the uint16array array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint16Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint16Array005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint32Array001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT32_ARRAY_0660
     * @tc.desc   Check whether the entered value is the uint32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint32Array001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint32Array001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsUint32Array002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT32_ARRAY_0670
     * @tc.desc   Check whether the entered value is the uint32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint32Array002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint32Array002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint32Array003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT32_ARRAY_0680
     * @tc.desc   Check whether the entered value is the uint32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint32Array003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint32Array003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint32Array004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT32_ARRAY_0690
     * @tc.desc   Check whether the entered value is the uint32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint32Array004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint32Array004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsUint32Array005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_UINT32_ARRAY_0700
     * @tc.desc   Check whether the entered value is the uint32array array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsUint32Array005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsUint32Array005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakMap001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_MAP_0710
     * @tc.desc   Check whether the entered value is of type weakmap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakMap001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsWeakMap002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_MAP_0720
     * @tc.desc   Check whether the entered value is of type weakmap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakMap002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakMap003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_MAP_0730
     * @tc.desc   Check whether the entered value is of type weakmap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakMap003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakMap004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_MAP_0740
     * @tc.desc   Check whether the entered value is of type weakmap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakMap004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakMap005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_MAP_0750
     * @tc.desc   Check whether the entered value is of type weakmap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakMap005()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakSet001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_SET_0760
     * @tc.desc   Check whether the entered value is of type weakset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakSet001()).assertEqual(true)
    })

    /**
     * @tc.name   testIsWeakSet002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_SET_0770
     * @tc.desc   Check whether the entered value is of type weakset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakSet002()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakSet003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_SET_0780
     * @tc.desc   Check whether the entered value is of type weakset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakSet003()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakSet004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_SET_0790
     * @tc.desc   Check whether the entered value is of type weakset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakSet004()).assertEqual(false)
    })

    /**
     * @tc.name   testIsWeakSet005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_IS_WEAK_SET_0800
     * @tc.desc   Check whether the entered value is of type weakset.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsWeakSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testIsWeakSet005()).assertEqual(false)
    })

    /**
     * @tc.name   testUtilRandomUUID001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_RANDOM_UUID_0810
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilRandomUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilRandomUUID001()).assertEqual(36)
    })

    /**
     * @tc.name   testUtilRandomUUID002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_RANDOM_UUID_0820
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilRandomUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilRandomUUID002()).assertEqual(36)
    })

    /**
     * @tc.name   testUtilRandomBinaryUUID001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_RANDOM_BINARY_UUID_0830
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilRandomBinaryUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilRandomBinaryUUID001()).assertEqual(16)
    })

    /**
     * @tc.name   testUtilRandomBinaryUUID002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_RANDOM_BINARY_UUID_0840
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilRandomBinaryUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilRandomBinaryUUID002()).assertEqual(16)
    })

    /**
     * @tc.name   testUtilParseUUID001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_PARSE_UUID_0850
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilParseUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilParseUUID001()).assertEqual(16)
    })

    /**
     * @tc.name   testUtilParseUUID002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_PARSE_UUID_0860
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilParseUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilParseUUID002()).assertEqual('Syntax Error.Invalid 84df796-66cc-4655-9b89-d6218d100f9c string')
    })

    /**
     * @tc.name   testUtilParseUUID003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_PARSE_UUID_0870
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilParseUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilParseUUID003()).assertEqual('Syntax Error.Invalid 84Wdf796-66cc-4655-9b89-d6218d100f9c string')
    })

    /**
     * @tc.name   testUtilgenerateRandomUUID001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GENERATE_RANDOM_UUID_0880
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilgenerateRandomUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilgenerateRandomUUID001()).assertEqual(36)
    })

    /**
     * @tc.name   testUtilgenerateRandomUUID002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GENERATE_RANDOM_UUID_0890
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilgenerateRandomUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilgenerateRandomUUID002()).assertEqual(36)
    })

    /**
     * @tc.name   testUtilgenerateRandomUUID003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GENERATE_RANDOM_UUID_0900
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilgenerateRandomUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilgenerateRandomUUID003()).assertTrue()
    })

    /**
     * @tc.name   testUtilgenerateRandomBinaryUUID001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GENERATE_RANDOM_BINARY_UUID_0910
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilgenerateRandomBinaryUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilgenerateRandomBinaryUUID001()).assertEqual(16)
    })

    /**
     * @tc.name   testUtilgenerateRandomBinaryUUID002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GENERATE_RANDOM_BINARY_UUID_0920
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilgenerateRandomBinaryUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilgenerateRandomBinaryUUID002()).assertEqual(16)
    })
  })

  describe('ScopeHelperFP2Test', () => {
    /**
     * @tc.name   test_getLower_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_LOWER_0930
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getLower_001()).assertEqual('30')
    })

    /**
     * @tc.name   test_getLower_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_LOWER_0940
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getLower_002()).assertEqual('35')
    })

    /**
     * @tc.name   test_getLower_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_LOWER_0950
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getLower_003()).assertEqual('20')
    })

    /**
     * @tc.name   test_getLower_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_LOWER_0960
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getLower_004()).assertEqual('20')
    })

    /**
     * @tc.name   test_getLower_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_LOWER_0970
     * @tc.desc   Obtains the lower bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getLower_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getLower_005()).assertEqual('35')
    })

    /**
     * @tc.name   test_getUpper_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_UPPER_0980
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getUpper_001()).assertEqual('40')
    })

    /**
     * @tc.name   test_getUpper_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_UPPER_0990
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getUpper_002()).assertEqual('39')
    })

    /**
     * @tc.name   test_getUpper_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_UPPER_1000
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getUpper_003()).assertEqual('45')
    })

    /**
     * @tc.name   test_getUpper_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_UPPER_1010
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getUpper_004()).assertEqual('35')
    })

    /**
     * @tc.name   test_getUpper_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_UPPER_1020
     * @tc.desc   Obtains the upper bound of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_getUpper_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_getUpper_005()).assertEqual('45')
    })

    /**
     * @tc.name   test_clamp_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CLAMP_1030
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_clamp_001()).assertEqual('30')
    })

    /**
     * @tc.name   test_clamp_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CLAMP_1040
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_clamp_002()).assertEqual('35')
    })

    /**
     * @tc.name   test_clamp_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CLAMP_1050
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_clamp_003()).assertEqual('40')
    })

    /**
     * @tc.name   test_clamp_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CLAMP_1060
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_clamp_004()).assertEqual('30')
    })

    /**
     * @tc.name   test_clamp_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CLAMP_1070
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_clamp_005()).assertEqual('40')
    })

    /**
     * @tc.name   test_contains_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1080
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_001()).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1090
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_002()).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1100
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_003()).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1110
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_004()).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1120
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_005()).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1130
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_006()).assertEqual(true)
    })

    /**
     * @tc.name   test_contains_007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1140
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_007()).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_008
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1150
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_008()).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_009
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1160
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_009()).assertEqual(false)
    })

    /**
     * @tc.name   test_contains_010
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_1170
     * @tc.desc   Checks whether a given range is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_010()).assertEqual(true)
    })

    /**
     * @tc.name   test_expand_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1180
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_001()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1190
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_002()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name   test_expand_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1200
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_003()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name   test_expand_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1210
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_004()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name   test_expand_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1220
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_005()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1230
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_006()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1240
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_007()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name   test_expand_008
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1250
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_008()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name   test_expand_009
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1260
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_009()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name   test_expand_010
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1270
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_010()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_011
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1280
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_011()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_012
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1290
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_012()).assertEqual('[20, 40]')
    })

    /**
     * @tc.name   test_expand_013
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1300
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_013()).assertEqual('[30, 45]')
    })

    /**
     * @tc.name   test_expand_014
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1310
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_014()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_expand_015
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_1320
     * @tc.desc   Creates the smallest range that includes the current range and a given value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_015()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1330
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_001()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name   test_intersect_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1340
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_002()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1350
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_003()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name   test_intersect_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1360
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_004()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name   test_intersect_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1370
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_005()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1380
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_006()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name   test_intersect_007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1390
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_007()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_intersect_008
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1400
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_008()).assertEqual('[30, 35]')
    })

    /**
     * @tc.name   test_intersect_009
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1410
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_009()).assertEqual('[35, 40]')
    })

    /**
     * @tc.name   test_intersect_010
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_1420
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_010()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_toString_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_TO_STRING_1430
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_toString_001()).assertEqual('[30, 40]')
    })

    /**
     * @tc.name   test_toString_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_TO_STRING_1440
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_toString_002()).assertEqual('[35, 39]')
    })

    /**
     * @tc.name   test_toString_003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_TO_STRING_1450
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_toString_003()).assertEqual('[20, 45]')
    })

    /**
     * @tc.name   test_toString_004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_TO_STRING_1460
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_toString_004()).assertEqual('[20, 35]')
    })

    /**
     * @tc.name   test_toString_005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_TO_STRING_1470
     * @tc.desc   Obtains a string representation of the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_toString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_toString_005()).assertEqual('[35, 45]')
    })

    /**
     * @tc.name   test_constructor_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONSTRUCTOR_THROW_ERROR_1480
     * @tc.desc   A constructor used to create a Scope instance with the lower and upper bounds specified.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_constructor_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_constructor_throwError_001())
        .assertEqual("BusinessError: Parameter error. The type of 1 must be object")
    })

    /**
     * @tc.name   test_intersect_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_THROW_ERROR_1490
     * @tc.desc   Returns the intersection of a given range and the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_throwError_001())
        .assertEqual("BusinessError: Parameter error. The type of str must be ScopeHelper " + "or ScopeType")
    })

    /**
     * @tc.name   test_intersect_throwError_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_INTERSECT_THROW_ERROR_1500
     * @tc.desc   Returns the intersection of the current range and the range specified by
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_intersect_throwError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_intersect_throwError_002())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be ScopeType")
    })

    /**
     * @tc.name   test_expand_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_THROW_ERROR_1510
     * @tc.desc   Creates the smallest range that includes the current range and the given lower and upper bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_throwError_001())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be ScopeType")
    })

    /**
     * @tc.name   test_expand_throwError_002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_EXPAND_THROW_ERROR_1520
     * @tc.desc   Creates the smallest range that includes the current range and a given range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_expand_throwError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_expand_throwError_002())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be ScopeHelper " + "or ScopeType")
    })

    /**
     * @tc.name   test_contains_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CONTAINS_THROW_ERROR_1530
     * @tc.desc   Checks whether a given value is within the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_contains_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_contains_throwError_001())
        .assertEqual("BusinessError: Parameter error. The type of str must be object or " + "ScopeHelper")
    })

    /**
     * @tc.name   test_clamp_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_CLAMP_THROW_ERROR_1540
     * @tc.desc   Clamps a given value to the current range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_clamp_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_clamp_throwError_001()).assertEqual("BusinessError: Parameter error. The type of 123 must be object")
    })
  })

  describe('LRUCacheFP2Test', () => {
    /**
     * @tc.name   testLRUCacheUpdateGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_1550
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheUpdateGetCapacity001()).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_1560
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheUpdateGetCapacity002()).assertEqual(2147483646)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_1570
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheUpdateGetCapacity003()).assertEqual(20)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_1580
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheUpdateGetCapacity004()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_1590
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheUpdateGetCapacity005()).assertEqual(100)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_1600
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheUpdateGetCapacity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheUpdateGetCapacity006()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheGet001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_1610
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGet001()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheGet002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_1620
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGet002()).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheGet003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_1630
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGet003()[0]).assertEqual(undefined)
      expect(testLRUCacheGet003()[1]).assertEqual(15)
      expect(testLRUCacheGet003()[2]).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCacheGet004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_1640
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGet004()[0]).assertEqual('bcjdshc')
      expect(testLRUCacheGet004()[1]).assertEqual('cdjcaxb')
      expect(testLRUCacheGet004()[2]).assertEqual(15)
      expect(testLRUCacheGet004()[3]).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheGet005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_1650
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGet005()[0]).assertEqual(undefined)
      expect(testLRUCacheGet005()[1]).assertEqual('cdjcaxb')
      expect(testLRUCacheGet005()[2]).assertEqual(15)
      expect(testLRUCacheGet005()[3]).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheGet006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_1660
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGet006()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCachePut001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_1670
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut001()).assertEqual('bcjdshc')
    })

    /**
     * @tc.name   testLRUCachePut002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_1680
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut002()).assertEqual(13)
    })

    /**
     * @tc.name   testLRUCachePut003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_1690
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut003()[0]).assertEqual(12)
      expect(testLRUCachePut003()[1]).assertEqual(5)
      expect(testLRUCachePut003()[2]).assertEqual('adasfdad')
      expect(testLRUCachePut003()[3]).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCachePut004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_1700
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut004()[0]).assertEqual('bcjdshc')
      expect(testLRUCachePut004()[1]).assertEqual(12)
      expect(testLRUCachePut004()[2]).assertEqual(5)
      expect(testLRUCachePut004()[3]).assertEqual('adasfdad')
      expect(testLRUCachePut004()[4]).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCachePut005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_1710
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut005()[0]).assertEqual('bcjdshc')
      expect(testLRUCachePut005()[1]).assertEqual(12)
      expect(testLRUCachePut005()[2]).assertEqual(5)
      expect(testLRUCachePut005()[3]).assertEqual(10)
      expect(testLRUCachePut005()[4]).assertEqual(22)
      expect(testLRUCachePut005()[5]).assertEqual(30)
    })

    /**
     * @tc.name   testLRUCachePut006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_1720
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut006()).assertEqual(401)

    })

    /**
     * @tc.name   testLRUCacheGetCreateCount001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CREATE_COUNT_1730
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetCreateCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetCreateCount001()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetCreateCount002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CREATE_COUNT_1740
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetCreateCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetCreateCount002()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetCreateCount003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CREATE_COUNT_1750
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetCreateCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetCreateCount003()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetCreateCount004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CREATE_COUNT_1760
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetCreateCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetCreateCount004()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetCreateCount005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CREATE_COUNT_1770
     * @tc.desc   Obtains the number of times createDefault(Object) returned a value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetCreateCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetCreateCount005()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetMissCount001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MISS_COUNT_1780
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetMissCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetMissCount001()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMissCount002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MISS_COUNT_1790
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGetMissCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGetMissCount002()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMissCount003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MISS_COUNT_1800
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMissCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMissCount003()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMissCount004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MISS_COUNT_1810
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMissCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMissCount004()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMissCount005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MISS_COUNT_1820
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMissCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMissCount005()).assertEqual(4)
    })

    /**
     * @tc.name   testLRUCacheGetMissCount006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MISS_COUNT_1830
     * @tc.desc   Obtains the number of times that the queried values are not matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMissCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMissCount006()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetRemovalCount001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_1840
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetRemovalCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetRemovalCount001()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetRemovalCount002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_1850
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetRemovalCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetRemovalCount002()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetRemovalCount003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_1860
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetRemovalCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetRemovalCount003()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetRemovalCount004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_1870
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetRemovalCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetRemovalCount004()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetRemovalCount005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_REMOVAL_COUNT_1880
     * @tc.desc   Obtains the number of times that values are evicted from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetRemovalCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetRemovalCount005()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMatchCount001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MATCH_COUNT_1890
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMatchCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMatchCount001()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMatchCount002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MATCH_COUNT_1900
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMatchCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMatchCount002()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMatchCount003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MATCH_COUNT_1910
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMatchCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMatchCount003()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetMatchCount004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MATCH_COUNT_1920
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMatchCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMatchCount004()).assertEqual(5)
    })

    /**
     * @tc.name   testLRUCacheGetMatchCount005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MATCH_COUNT_1930
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMatchCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMatchCount005()).assertEqual(7)
    })

    /**
     * @tc.name   testLRUCacheGetMatchCount006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_MATCH_COUNT_1940
     * @tc.desc   Obtains the number of times that the queried values are successfully matched.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetMatchCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetMatchCount006()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheGetPutCount001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_PUT_COUNT_1950
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetPutCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetPutCount001()).assertEqual(1)
    })

    /**
     * @tc.name   testLRUCacheGetPutCount002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_PUT_COUNT_1960
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetPutCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetPutCount002()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheGetPutCount003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_PUT_COUNT_1970
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetPutCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetPutCount003()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetPutCount004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_PUT_COUNT_1980
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetPutCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetPutCount004()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetPutCount005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_PUT_COUNT_1990
     * @tc.desc   Obtains the number of times that values are added to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetPutCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetPutCount005()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheGetCapacity001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CAPACITY_2000
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetCapacity001()).assertEqual(64)
    })

    /**
     * @tc.name   testLRUCacheGetCapacity002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CAPACITY_2010
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetCapacity002()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheGetCapacity003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CAPACITY_2020
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetCapacity003()).assertEqual(100)
    })

    /**
     * @tc.name   testLRUCacheGetCapacity004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CAPACITY_2030
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetCapacity004()).assertEqual(50)
    })

    /**
     * @tc.name   testLRUCacheGetCapacity005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_CAPACITY_2040
     * @tc.desc   Obtains the capacity of the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheGetCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheGetCapacity005()).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCacheLength001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_LENGTH_2050
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheLength001()).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheLength002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_LENGTH_2060
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheLength002()).assertEqual(1)
    })

    /**
     * @tc.name   testLRUCacheLength003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_LENGTH_2070
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheLength003()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheLength004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_LENGTH_2080
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheLength004()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheLength005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_LENGTH_2090
     * @tc.desc   Obtains the total number of values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheLength005()).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheClear001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CLEAR_2100
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheClear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheClear001()[0]).assertEqual(1)
      expect(testLRUCacheClear001()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheClear002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CLEAR_2110
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheClear002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheClear002()[0]).assertEqual(4)
      expect(testLRUCacheClear002()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheClear003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CLEAR_2120
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheClear003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheClear003()[0]).assertEqual(4)
      expect(testLRUCacheClear003()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheClear004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CLEAR_2130
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheClear004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheClear004()[0]).assertEqual(3)
      expect(testLRUCacheClear004()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheClear005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CLEAR_2140
     * @tc.desc   Clears key-value pairs from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheClear005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheClear005()[0]).assertEqual(2)
      expect(testLRUCacheClear005()[1]).assertEqual(0)
    })

    /**
     * @tc.name   testLRUCacheIsEmpty001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_IS_EMPTY_2150
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheIsEmpty001()).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheIsEmpty002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_IS_EMPTY_2160
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheIsEmpty002()).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheIsEmpty003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_IS_EMPTY_2170
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheIsEmpty003()).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheIsEmpty004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_IS_EMPTY_2180
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheIsEmpty004()).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheIsEmpty005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_IS_EMPTY_2190
     * @tc.desc   Checks whether the current buffer is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheIsEmpty005()).assertEqual(true)
    })

    /**
     * @tc.name   testLRUCacheContains001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONTAINS_2200
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheContains001()).assertEqual(true)
    })

    /**
     * @tc.name   testLRUCacheContains002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONTAINS_2210
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheContains002()).assertEqual(true)
    })

    /**
     * @tc.name   testLRUCacheContains003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONTAINS_2220
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheContains003()).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheContains004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONTAINS_2230
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheContains004()[0]).assertEqual(true)
      expect(testLRUCacheContains004()[1]).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheContains005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONTAINS_2240
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheContains005()[0]).assertEqual(true)
      expect(testLRUCacheContains005()[1]).assertEqual(true)
      expect(testLRUCacheContains005()[2]).assertEqual(false)
    })

    /**
     * @tc.name   testLRUCacheContains006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONTAINS_2250
     * @tc.desc   Checks whether the current buffer contains a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheContains006()).assertEqual(401)

    })

    /**
     * @tc.name   testLRUCacheRemove001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2260
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove001()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheRemove002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2270
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove002()[0]).assertEqual(2)
      expect(testLRUCacheRemove002()[1]).assertEqual(20)
    })

    /**
     * @tc.name   testLRUCacheRemove003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2280
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove003()[0]).assertEqual(2)
      expect(testLRUCacheRemove003()[1]).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheRemove004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2290
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove004()[0]).assertEqual(undefined)
      expect(testLRUCacheRemove004()[1]).assertEqual(20)
    })

    /**
     * @tc.name   testLRUCacheRemove005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2300
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove005()[0]).assertEqual(2)
      expect(testLRUCacheRemove005()[1]).assertEqual(10)
      expect(testLRUCacheRemove005()[2]).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheRemove006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2310
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove006()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheCreateDefault001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CREATE_DEFAULT_2320
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheCreateDefault001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheCreateDefault001()).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheCreateDefault002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CREATE_DEFAULT_2330
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheCreateDefault002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheCreateDefault002()).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheCreateDefault003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CREATE_DEFAULT_2340
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheCreateDefault003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheCreateDefault003()).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheCreateDefault004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CREATE_DEFAULT_2350
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheCreateDefault004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheCreateDefault004()).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheCreateDefault005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CREATE_DEFAULT_2360
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheCreateDefault005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheCreateDefault005()[0]).assertEqual(undefined)
      expect(testLRUCacheCreateDefault005()[1]).assertEqual(undefined)
    })

    /**
     * @tc.name   testLRUCacheCreateDefault006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CREATE_DEFAULT_2370
     * @tc.desc   Executes subsequent operations if miss to compute a value for the specific key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheCreateDefault006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheCreateDefault006()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheKeys001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_KEYS_2380
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheKeys001()).assertEqual('string')
    })

    /**
     * @tc.name   testLRUCacheKeys002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_KEYS_2390
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheKeys002()[0]).assertEqual(1)
      expect(testLRUCacheKeys002()[1]).assertEqual(3)
      expect(testLRUCacheKeys002()[2]).assertEqual(5)
      expect(testLRUCacheKeys002()[3]).assertEqual('abc')
    })

    /**
     * @tc.name   testLRUCacheKeys003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_KEYS_2400
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheKeys003()[0]).assertEqual(1)
      expect(testLRUCacheKeys003()[1]).assertEqual(5)
      expect(testLRUCacheKeys003()[2]).assertEqual('abc')
      expect(testLRUCacheKeys003()[3]).assertEqual(3)
    })

    /**
     * @tc.name   testLRUCacheKeys004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_KEYS_2410
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheKeys004()[0]).assertEqual(5)
      expect(testLRUCacheKeys004()[1]).assertEqual('abc')
      expect(testLRUCacheKeys004()[2]).assertEqual(3)
      expect(testLRUCacheKeys004()[3]).assertEqual(1)
    })

    /**
     * @tc.name   testLRUCacheKeys005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_KEYS_2420
     * @tc.desc   Obtains a list of keys for the values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheKeys005()[0]).assertEqual(3)
      expect(testLRUCacheKeys005()[1]).assertEqual(1)
      expect(testLRUCacheKeys005()[2]).assertEqual('abc')
    })

    /**
     * @tc.name   testLRUCacheValues001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_VALUES_2430
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheValues001()).assertEqual('abc')
    })

    /**
     * @tc.name   testLRUCacheValues002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_VALUES_2440
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheValues002()[0]).assertEqual(2)
      expect(testLRUCacheValues002()[1]).assertEqual(10)
      expect(testLRUCacheValues002()[2]).assertEqual(15)
      expect(testLRUCacheValues002()[3]).assertEqual(20)
    })

    /**
     * @tc.name   testLRUCacheValues003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_VALUES_2450
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheValues003()[0]).assertEqual(2)
      expect(testLRUCacheValues003()[1]).assertEqual(15)
      expect(testLRUCacheValues003()[2]).assertEqual(20)
      expect(testLRUCacheValues003()[3]).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCacheValues004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_VALUES_2460
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheValues004()[0]).assertEqual(15)
      expect(testLRUCacheValues004()[1]).assertEqual(20)
      expect(testLRUCacheValues004()[2]).assertEqual(10)
      expect(testLRUCacheValues004()[3]).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheValues005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_VALUES_2470
     * @tc.desc   Obtains a list of all values in the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheValues005()[0]).assertEqual(10)
      expect(testLRUCacheValues005()[1]).assertEqual(2)
      expect(testLRUCacheValues005()[2]).assertEqual(20)
    })

    /**
     * @tc.name   testLRUCacheToString001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_TO_STRING_2480
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheToString001()).assertEqual('LRUCache[ maxSize = 64, hits = 0, misses = 0, hitRate = 0% ]')
    })

    /**
     * @tc.name   testLRUCacheToString002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_TO_STRING_2490
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheToString002()).assertEqual('LRUCache[ maxSize = 64, hits = 2, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name   testLRUCacheToString003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_TO_STRING_2500
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheToString003()).assertEqual('LRUCache[ maxSize = 100, hits = 1, misses = 0, hitRate = 100% ]')
    })

    /**
     * @tc.name   testLRUCacheToString004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_TO_STRING_2510
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheToString004()).assertEqual('LRUCache[ maxSize = 100, hits = 1, misses = 1, hitRate = 50% ]')
    })

    /**
     * @tc.name   testLRUCacheToString005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_TO_STRING_2520
     * @tc.desc   Returns a string representation of the object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheToString005()).assertEqual('LRUCache[ maxSize = 100, hits = 3, misses = 1, hitRate = 75% ]')
    })

    /**
     * @tc.name   testLRUCacheEntries001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_ENTRIES_2530
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheEntries001()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheEntries002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_ENTRIES_2540
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheEntries002()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheEntries003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_ENTRIES_2550
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheEntries003()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheEntries004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_ENTRIES_2560
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheEntries004()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheEntries005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_ENTRIES_2570
     * @tc.desc   Returns an array of key-value pairs of enumeratable properties of a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheEntries005()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheSymbol001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_2580
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheSymbol001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheSymbol001()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheSymbol002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_2590
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheSymbol002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheSymbol002()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheSymbol003
     * @tc.number testLRUCacheSymbol003
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheSymbol003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheSymbol003()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheSymbol004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_2610
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheSymbol004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheSymbol004()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheSymbol005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_[SYMBOL.ITERATOR]_2620
     * @tc.desc   Returns a two - dimensional array in the form of key - value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheSymbol005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheSymbol005()).assertTrue()
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2630
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval001()).assertEqual(10)
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2640
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval002()).assertEqual('string')
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2650
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval003()).assertEqual(12)
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2660
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval004()).assertEqual(30)
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2670
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval005()).assertEqual('string')
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2680
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval006()).assertEqual(2)
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2690
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheAfterRemoval007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheAfterRemoval007()).assertEqual(8)
    })

    /**
     * @tc.name   testLRUCacheAfterRemoval008
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_AFTER_REMOVAL_2700
     * @tc.desc   Executes subsequent operations after a value is deleted.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheAfterRemoval008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheAfterRemoval008()[0]).assertEqual(1)
      expect(testLRUCacheAfterRemoval008()[1]).assertEqual(3)
      expect(testLRUCacheAfterRemoval008()[2]).assertEqual(2)
      expect(testLRUCacheAfterRemoval008()[3]).assertEqual(2)
      expect(testLRUCacheAfterRemoval008()[4]).assertEqual(10)
      expect(testLRUCacheAfterRemoval008()[5]).assertEqual(8)
    })

    /**
     * @tc.name   testLRUCacheConstrcutor001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONSTRUCTOR_2710
     * @tc.desc   The default constructor is used to create a new LRUCache instance with a default capacity of 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheConstrcutor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheConstrcutor001()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheConstrcutor002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_CONSTRUCTOR_2720
     * @tc.desc   The default constructor is used to create a new LRUCache instance with a default capacity of 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheConstrcutor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheConstrcutor002()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_2730
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheUpdateGetCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheUpdateGetCapacity007()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheUpdateGetCapacity008
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_UPDATE_GET_CAPACITY_2740
     * @tc.desc   Updates the buffer capacity to a specified capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheUpdateGetCapacity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheUpdateGetCapacity008()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheGet007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_GET_2750
     * @tc.desc   Obtains the value associated with a specified key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCacheGet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCacheGet007()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCachePut007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_2760
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut007()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCachePut008
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_PUT_2770
     * @tc.desc   Adds a key-value pair to the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCachePut008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testLRUCachePut008()).assertEqual(401)
    })

    /**
     * @tc.name   testLRUCacheRemove007
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_LRU_CACHE_REMOVE_2780
     * @tc.desc   Deletes a specified key and its associated value from the current buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLRUCacheRemove007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testLRUCacheRemove007()).assertEqual(401)
    })
  })

  describe('FunctionFP2Test', () => {
    /**
     * @tc.name   testUtilformat001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_FORMAT_2790
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilformat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilformat001()).assertEqual("1,qwer 15")
    })

    /**
     * @tc.name   testUtilformat002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_FORMAT_2800
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilformat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilformat002()).assertEqual("{ name: 'jack',\n  age: 15 }")
    })

    /**
     * @tc.name   testUtilformat003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_FORMAT_2810
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilformat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilformat003()).assertEqual('[ 1, 2, 3, [length]: 3 ]')
    })

    /**
     * @tc.name   testUtilformat004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_FORMAT_2820
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilformat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilformat004()).assertEqual('1.5,qwer,%s')
    })

    /**
     * @tc.name   testUtilformat005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_FORMAT_2830
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilformat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilformat005()).assertEqual('6,16')
    })

    /**
     * @tc.name   testUtilformatThrowError001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_FORMAT_THROW_ERROR_2840
     * @tc.desc   Returns the formatted string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilformatThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilformatThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be string or " + "array")
    })

    /**
     * @tc.name   testUtilerrnoToString001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_ERROR_TO_STRING_2850
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilerrnoToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilerrnoToString001()).assertEqual('Unknown system error 10')
    })

    /**
     * @tc.name   testUtilerrnoToString002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_ERROR_TO_STRING_2860
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilerrnoToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilerrnoToString002()).assertEqual('Unknown system error 0')
    })

    /**
     * @tc.name   testUtilerrnoToString003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_ERROR_TO_STRING_2870
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilerrnoToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilerrnoToString003()).assertEqual('operation not permitted')
    })

    /**
     * @tc.name   testUtilerrnoToString004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_ERROR_TO_STRING_2880
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilerrnoToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilerrnoToString004()).assertEqual('Unknown system error 9')
    })

    /**
     * @tc.name   testUtilerrnoToString005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_ERROR_TO_STRING_2890
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilerrnoToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilerrnoToString005()).assertEqual('Unknown system error 555')
    })

    /**
     * @tc.name   testUtilerrnoToStringThrowError001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_ERROR_TO_STRING_THROW_ERROR_2900
     * @tc.desc   Get the string name of the system errno.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilerrnoToStringThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilerrnoToStringThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of str must be number")
    })


    /**
     * @tc.name   testUtilRandomUUIDThrowError001
     * @tc.number testUtilRandomUUIDThrowError001
     * @tc.desc   testUtilRandomUUIDThrowError001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilRandomUUIDThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilRandomUUIDThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be boolean")
    })

    /**
     * @tc.name   testUtilRandomBinaryUUIDThrowError001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_RANDOM_BINARY_UUID_THROW_ERROR_2920
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilRandomBinaryUUIDThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilRandomBinaryUUIDThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be boolean")
    })

    /**
     * @tc.name   testUtilParseUUIDThrow001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_RANDOM_PARSE_UUID_THROW_2930
     * @tc.desc   Generate a random RFC 4122 version 4 UUID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilParseUUIDThrow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(testUtilParseUUIDThrow001()).assertEqual("BusinessError: Syntax Error.Invalid 123 string")
    })
  })

  describe('RationalNumberFP2Test', () => {
    /**
     * @tc.name   test_parseRationalNumber_001
     * @tc.number SUB_COMMONLIBRARY_FP_PARSE_RATIONAL_NUMBER_2940
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_parseRationalNumber_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_parseRationalNumber_001()).assertEqual(2)
    })

    /**
     * @tc.name   test_parseRationalNumberThrowError_001
     * @tc.number SUB_COMMONLIBRARY_FP_PARSE_RATIONAL_NUMBER_THROW_ERROR_2950
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_parseRationalNumberThrowError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_parseRationalNumberThrowError_001())
        .assertEqual("BusinessError: Parameter error. The type of str must be number")
    })

    /**
     * @tc.name   test_createRationalFromString_001
     * @tc.number SUB_COMMONLIBRARY_FP_CREATE_RATIONAL_FROM_STRING_2960
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_createRationalFromString_001()).assertEqual(-0.5)
    })

    /**
     * @tc.name   test_createRationalFromString_002
     * @tc.number SUB_COMMONLIBRARY_FP_CREATE_RATIONAL_FROM_STRING_2970
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_createRationalFromString_002()).assertEqual(0.75)
    })

    /**
     * @tc.name   test_createRationalFromString_003
     * @tc.number SUB_COMMONLIBRARY_FP_CREATE_RATIONAL_FROM_STRING_2980
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_createRationalFromString_003()).assertEqual(-0.75)
    })

    /**
     * @tc.name   test_createRationalFromString_004
     * @tc.number SUB_COMMONLIBRARY_FP_CREATE_RATIONAL_FROM_STRING_2990
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_createRationalFromString_004()).assertEqual(0.5)
    })

    /**
     * @tc.name   test_createRationalFromString_005
     * @tc.number SUB_COMMONLIBRARY_FP_CREATE_RATIONAL_FROM_STRING_3000
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromString_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_createRationalFromString_005()).assertEqual(-0.5)
    })

    /**
     * @tc.name   test_createRationalFromStringThrowError_001
     * @tc.number SUB_COMMONLIBRARY_FP_CREATE_RATIONAL_FROM_STRING_THROW_ERROR_3010
     * @tc.desc   Creates a RationalNumber object based on a given string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_createRationalFromStringThrowError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_createRationalFromStringThrowError_001())
        .assertEqual("BusinessError: Parameter error. The type of 123 must be string")
    })

    /**
     * @tc.name   test_compare_001
     * @tc.number SUB_COMMONLIBRARY_FP_COMPARE_3020
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compare_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_compare_001()).assertEqual(1)
    })

    /**
     * @tc.name   test_compare_002
     * @tc.number SUB_COMMONLIBRARY_FP_COMPARE_3030
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compare_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_compare_002()).assertEqual(-1)
    })

    /**
     * @tc.name   test_compare_003
     * @tc.number SUB_COMMONLIBRARY_FP_COMPARE_3040
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compare_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_compare_003()).assertEqual(-1)
    })

    /**
     * @tc.name   test_compare_004
     * @tc.number SUB_COMMONLIBRARY_FP_COMPARE_3050
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compare_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_compare_004()).assertEqual(0)
    })

    /**
     * @tc.name   test_compare_005
     * @tc.number SUB_COMMONLIBRARY_FP_COMPARE_3060
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compare_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_compare_005()).assertEqual(1)
    })

    /**
     * @tc.name   test_compareThrowError_001
     * @tc.number SUB_COMMONLIBRARY_FP_COMPARE_THROW_ERROR_3070
     * @tc.desc   Compares the current RationalNumber object with a given object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_compareThrowError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_compareThrowError_001())
        .assertEqual("BusinessError: Parameter error. The type of str must be RationalNumber")
    })

    /**
     * @tc.name   testgetCommonFactor001
     * @tc.number SUB_COMMONLIBRARY_FP_GET_COMMON_FACTOR_3080
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgetCommonFactor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testgetCommonFactor001()).assertEqual(4)
    })

    /**
     * @tc.name   testgetCommonFactor002
     * @tc.number SUB_COMMONLIBRARY_FP_GET_COMMON_FACTOR_3090
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgetCommonFactor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testgetCommonFactor002()).assertEqual(5)
    })

    /**
     * @tc.name   testgetCommonFactor003
     * @tc.number SUB_COMMONLIBRARY_FP_GET_COMMON_FACTOR_3100
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgetCommonFactor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testgetCommonFactor003()).assertEqual(4)
    })

    /**
     * @tc.name   testgetCommonFactor004
     * @tc.number SUB_COMMONLIBRARY_FP_GET_COMMON_FACTOR_3110
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgetCommonFactor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testgetCommonFactor004()).assertEqual(8)
    })

    /**
     * @tc.name   testgetCommonFactor005
     * @tc.number SUB_COMMONLIBRARY_FP_GET_COMMON_FACTOR_3120
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetCommonFactor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testgetCommonFactor005()).assertEqual(2)
    })

    /**
     * @tc.name   testgetCommonFactorThrowError001
     * @tc.number SUB_COMMONLIBRARY_FP_GET_COMMON_FACTOR_THROW_ERROR_3130
     * @tc.desc   Obtains the greatest common divisor of two specified numbers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetCommonFactorThrowError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testgetCommonFactorThrowError001())
        .assertEqual("BusinessError: Parameter error. The type of str must be number")
    })

    /**
     * @tc.name   testUtilGetHash001
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_HASH_3140
     * @tc.desc   Get the hash value of an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetHash001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testUtilGetHash001()).assertTrue()
    })

    /**
     * @tc.name   testUtilGetHash002
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_HASH_3150
     * @tc.desc   Get the hash value of an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetHash002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testUtilGetHash002()).assertTrue()
    })

    /**
     * @tc.name   testUtilGetHash003
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_HASH_3160
     * @tc.desc   Get the hash value of an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetHash003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testUtilGetHash003()).assertTrue()
    })

    /**
     * @tc.name   testUtilGetHash004
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_HASH_3170
     * @tc.desc   Get the hash value of an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUtilGetHash004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(testUtilGetHash004()).assertTrue()
    })

    /**
     * @tc.name   testUtilGetHash005
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_HASH_3180
     * @tc.desc   Get the hash value of an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilGetHash005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilGetHash005()).assertTrue()
    })

    /**
     * @tc.name   testUtilGetHash006
     * @tc.number SUB_COMMONLIBRARY_FP_UTIL_GET_HASH_3190
     * @tc.desc   Get the hash value of an object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUtilGetHash006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testUtilGetHash006()).assertTrue()
    })
  })

  describe('Base64HelperFP2Test', () => {
    /**
     * @tc.name   test_encodeSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64_3200
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_001()).assertTrue()
    })

    /**
     * @tc.name   test_encodeSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64_3210
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_encodeSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64_3220
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_encodeSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64_3230
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_encodeSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64_3240
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_005()).assertTrue()
    })

    /**
     * @tc.name   test_encodeSync_base64_006
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64_3250
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_006())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3260
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_001()).assertEqual('czEz')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3270
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_002()).assertEqual('QmFzZTY0IE5vZGUuanM=')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3280
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_003()).assertEqual('QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3290
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_004()).assertEqual('qK6b/w==')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3300
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_005()).assertEqual('QmFzZTY0')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_006
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3310
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_006())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_decodeSync_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3320
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_001()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3330
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3340
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3350
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_005
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3360
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_005()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_006
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3370
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_006())
        .assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
          "string and the length greater than 0.")
    })

    /**
     * @tc.name   test_decodeSync_base64_007
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3380
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_007()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_008
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3390
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_008()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_009
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3400
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_009()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_010
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYC_BASE64_3410
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_010()).assertTrue()
    })


    /**
     * @tc.name   test_encodeAsync_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_3420
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeAsync_base64_001()).assertTrue()
    })

    /**
     * @tc.name   test_encodeAsync_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_3430
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeAsync_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_encodeAsync_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_3440
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeAsync_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_encodeAsync_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_3450
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeAsync_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_encodeAsync_base64_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_3460
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeAsync_base64_005()).assertTrue()
    })

    /**
     * @tc.name   test_encodeSync_base64_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_THROW_ERROR_3470
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_encodeSync_base64_throwError_001())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_encodeToString_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3480
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64_001()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3490
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3500
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3510
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3520
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64_005()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64_006
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_3530
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_encodeToString_base64_006())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_decode_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3540
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_001()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3550
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3560
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3570
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_005
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3580
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_005()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_006
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3590
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_006()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_007
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3600
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_007()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_008
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3610
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_008()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_009
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3620
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8 array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_009()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_010
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_3630
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64_010()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_THROW_ERROR_3640
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_decode_base64_throwError_001())
        .assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
          "string and the length greater than 0.")
    })

    /**
     * @tc.name   test_encodeToStringSync_mime_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_SYNC_MIME_BASE64_3650
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_mime_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_mime_base64_001())
        .assertEqual(
          'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n')
    })

    /**
     * @tc.name   test_decodeSync_mime_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_MIME_BASE64_3660
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_mime_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_mime_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_mime_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_MIME_BASE64_3670
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_mime_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_mime_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_mime_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE__MIME_BASE64_3680
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_mime_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_mime_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToStringSync_basic_base64_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_SYNC_BASIC_BASE64_3690
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_basic_base64_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_basic_base64_001())
        .assertEqual(
          'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=')
    })

    /**
     * @tc.name   test_decodeSync_basic_base64_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASIC_BASE64_3700
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_basic_base64_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_basic_base64_002()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_basic_base64_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASIC_BASE64_3710
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_basic_base64_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_basic_base64_003()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_basic_base64_004
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASIC_BASE64_3720
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_basic_base64_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_basic_base64_004()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASE64_THROW_ERROR_3730
     * @tc.desc   Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throwError_001())
        .assertEqual("Error: decodeSync: The input string contains unsupported characters")
    })

    /**
     * @tc.name   test_decodeSync_base64_throwError_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASE64_THROW_ERROR_3740
     * @tc.desc   Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throwError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throwError_002())
        .assertEqual("Error: decodeSync: The input string contains unsupported characters")
    })

    /**
     * @tc.name   test_decodeSync_base64_throwError_003
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASE64_THROW_ERROR_3750
     * @tc.desc   Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throwError_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throwError_003())
        .assertEqual("Error: decodeSync: The input string contains unsupported characters")
    })

    /**
     * @tc.name   test_decodeSync_base64_throwError_004
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASE64_THROW_ERROR_3760
     * @tc.desc   Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throwError_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throwError_004())
        .assertEqual("Error: decodeSync: The input string contains unsupported characters")
    })

    /**
     * @tc.name   test_decodeSync_base64_throwError_005
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASE64_THROW_ERROR_3770
     * @tc.desc   Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throwError_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throwError_005())
        .assertEqual("Error: Parameter error. The type of Parameter must be string and the length greater than 0.")
    })

    /**
     * @tc.name   test_decodeSync_base64_throwError_006
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_SYNC_BASE64_THROW_ERROR_3780
     * @tc.desc   Use base64 for synchronous decoding, an exception is thrown when the input parameter exceeds the decoding range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throwError_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throwError_006())
        .assertEqual("Error: decodeSync: The input string contains unsupported characters")
    })

    /**
     * @tc.name   test_encodeToStringSync_mime_base64_throwError_007
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_SYNC_MIME_BASE64_THROW_ERROR_3790
     * @tc.desc   Use base64 for synchronous encode, an exception is thrown when the input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_mime_base64_throwError_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_mime_base64_throwError_007())
        .assertEqual("Error: The parameter length does not meet this encoding format.")
    })

    /**
     * @tc.name   test_encodeToStringSync_base64url_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRINGSYNC_BASE64URL_3800
     * @tc.desc   Encodes the specified byte array into a String using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64url_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64url_001()[0]).assertEqual('AsD+/QWERQ==')
      expect(test_encodeToStringSync_base64url_001()[1]).assertEqual('AsD+/QWERQ==')
      expect(test_encodeToStringSync_base64url_001()[2]).assertEqual('AsD-_QWERQ')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64url_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRINGSYNC_BASE64URL_3810
     * @tc.desc   Encodes the specified byte array into a String using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64url_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64url_002()[0]).assertEqual('AsD+QWERQ9+y')
      expect(test_encodeToStringSync_base64url_002()[1]).assertEqual('AsD+QWERQ9+y')
      expect(test_encodeToStringSync_base64url_002()[2]).assertEqual('AsD-QWERQ9-y')
    })

    /**
     * @tc.name   test_encodeToStringSync_base64url_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRINGSYNC_BASE64URL_3820
     * @tc.desc   Encodes the specified byte array into a String using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64url_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64url_003()[0]).assertEqual('AsD/QWERQ9/y')
      expect(test_encodeToStringSync_base64url_003()[1]).assertEqual('AsD/QWERQ9/y')
      expect(test_encodeToStringSync_base64url_003()[2]).assertEqual('AsD_QWERQ9_y')
    })

    /**
     * @tc.name   test_encodeSync_base64url_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64URL_3830
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64url_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64url_001()[0]).assertEqual(true)
      expect(test_encodeSync_base64url_001()[1]).assertEqual(true)
      expect(test_encodeSync_base64url_001()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_encodeSync_base64url_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64URL_3840
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64url_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64url_002()[0]).assertEqual(true)
      expect(test_encodeSync_base64url_002()[1]).assertEqual(true)
      expect(test_encodeSync_base64url_002()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_encodeSync_base64url_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_BASE64URL_3850
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64url_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64url_003()[0]).assertEqual(true)
      expect(test_encodeSync_base64url_003()[1]).assertEqual(true)
      expect(test_encodeSync_base64url_003()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_encodeToString_base64url_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRING_BASE64URL_3860
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64url_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64url_001()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64url_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRING_BASE64URL_3870
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64url_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64url_002()).assertTrue()
    })

    /**
     * @tc.name   test_encodeToString_base64url_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRING_BASE64URL_3880
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64url_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encodeToString_base64url_003()).assertTrue()
    })

    /**
     * @tc.name   test_encode_base64url_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_BASE64URL_3890
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encode_base64url_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encode_base64url_001()).assertTrue()
    })

    /**
     * @tc.name   test_encode_base64url_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_BASE64URL_3900
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encode_base64url_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encode_base64url_002()).assertTrue()
    })

    /**
     * @tc.name   test_encode_base64url_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_BASE64URL_3910
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encode_base64url_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_encode_base64url_003()).assertTrue()
    })

    /**
     * @tc.name   test_decodeSync_base64url_001
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64URL_3920
     * @tc.desc   Decodes String into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64url_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64url_001()[0]).assertEqual(true)
      expect(test_decodeSync_base64url_001()[1]).assertEqual(true)
      expect(test_decodeSync_base64url_001()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_decodeSync_base64url_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64URL_3930
     * @tc.desc   Decodes String into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64url_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64url_002()[0]).assertEqual(true)
      expect(test_decodeSync_base64url_002()[1]).assertEqual(true)
      expect(test_decodeSync_base64url_002()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_decodeSync_base64url_003
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64URL_3940
     * @tc.desc   Decodes String into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64url_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64url_003()[0]).assertEqual(true)
      expect(test_decodeSync_base64url_003()[1]).assertEqual(true)
      expect(test_decodeSync_base64url_003()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_decodeSync_base64url_004
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64URL_3950
     * @tc.desc   Decodes input u8 array into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64url_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64url_004()[0]).assertEqual(true)
      expect(test_decodeSync_base64url_004()[1]).assertEqual(true)
      expect(test_decodeSync_base64url_004()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_decodeSync_base64url_005
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64URL_3960
     * @tc.desc   Decodes input u8 array into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64url_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64url_005()[0]).assertEqual(true)
      expect(test_decodeSync_base64url_005()[1]).assertEqual(true)
      expect(test_decodeSync_base64url_005()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_decodeSync_base64url_006
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64URL_3970
     * @tc.desc   Decodes input u8 array into a newly-allocated u8 array using the Base64 and Base64URL encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64url_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64url_006()[0]).assertEqual(true)
      expect(test_decodeSync_base64url_006()[1]).assertEqual(true)
      expect(test_decodeSync_base64url_006()[2]).assertEqual(true)
    })

    /**
     * @tc.name   test_decode_base64url_001
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64URL_3980
     * @tc.desc   Use the Base64 and Base64URL encoding scheme to asynchronously decode a string into
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64url_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64url_001()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64url_002
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64URL_3990
     * @tc.desc   Use the Base64 and Base64URL encoding scheme to asynchronously decode a string into
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64url_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64url_002()).assertTrue()
    })

    /**
     * @tc.name   test_decode_base64url_003
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64URL_4000
     * @tc.desc   Use the Base64 and Base64URL encoding scheme to asynchronously decode a string into
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64url_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await test_decode_base64url_003()).assertTrue()
    })

    /**
     * @tc.name   test_encodesync_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_THROWERROR_4010
     * @tc.desc   An error is thrown when the parameter does not meet the interface requirements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodesync_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodesync_throwError_001())
        .assertEqual(
          'BusinessError: Parameter error.' + ' The target encoding type option must be BASIC or BASIC_URL_SAFE.')
    })

    /**
     * @tc.name   test_encodesync_throwError_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_THROWERROR_4020
     * @tc.desc   An error is thrown when the parameter does not meet the interface requirements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodesync_throwError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodesync_throwError_002())
        .assertEqual(
          'BusinessError: Parameter error.' + ' The target encoding type option must be BASIC or BASIC_URL_SAFE.')
    })

    /**
     * @tc.name   test_encodesync_throwError_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_THROWERROR_4030
     * @tc.desc   An error is thrown when the parameter does not meet the interface requirements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodesync_throwError_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodesync_throwError_003())
        .assertEqual(
          'BusinessError: Parameter error.' + ' The target encoding type option must be BASIC or BASIC_URL_SAFE.')
    })

    /**
     * @tc.name   test_encodeToStringSync_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRINGSYNC_THROWERROR_4040
     * @tc.desc   An error is thrown when the argument is out of enumeration range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_throwError_001())
        .assertEqual(
          'BusinessError: Parameter error.' + ' The target encoding type option must be one of the Type enumerations.')
    })

    /**
     * @tc.name   test_encode_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_THROWERROR_4050
     * @tc.desc   An error is thrown when the parameter does not meet the interface requirements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encode_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encode_throwError_001())
        .assertEqual('BusinessError: Parameter error. The type of 6 must be BASIC or ' + 'BASIC_URL_SAFE')
    })

    /**
     * @tc.name   test_encode_throwError_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_THROWERROR_4060
     * @tc.desc   An error is thrown when the parameter does not meet the interface requirements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encode_throwError_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encode_throwError_002())
        .assertEqual('BusinessError: Parameter error. The type of 1 must be BASIC or ' + 'BASIC_URL_SAFE')
    })

    /**
     * @tc.name   test_encode_throwError_003
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_THROWERROR_4070
     * @tc.desc   An error is thrown when the parameter does not meet the interface requirements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encode_throwError_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encode_throwError_003())
        .assertEqual('BusinessError: Parameter error. The type of 3 must be BASIC or ' + 'BASIC_URL_SAFE')
    })

    /**
     * @tc.name   test_encodeToString_throwError_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODETOSTRING_THROWERROR_4080
     * @tc.desc   An error is thrown when the argument is out of enumeration range.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_throwError_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToString_throwError_001())
        .assertEqual('BusinessError: Parameter error. The type of 5 must be one of the type ' + 'enumerations')
    })

    /**
     * @tc.name   test_encodeSync_base64_throw_error_001
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODESYNC_THROW_ERROR_4090
     * @tc.desc   Encodes all bytes from the specified u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeSync_base64_throw_error_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeSync_base64_throw_error_001())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_encodeToStringSync_base64_throw_error_002
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_THROW_ERROR_4100
     * @tc.desc   Encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToStringSync_base64_throw_error_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_encodeToStringSync_base64_throw_error_002())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_decodeSync_base64_throw_error_003
     * @tc.number SUB_COMMONLIBRARY_FP_DECODESYNC_BASE64_THROW_ERROR_4110
     * @tc.desc   Decodes a Base64 encoded String or input u8 array into a newly-allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decodeSync_base64_throw_error_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(test_decodeSync_base64_throw_error_003())
        .assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
          "string and the length greater than 0.")
    })

    /**
     * @tc.name   test_encodeAsync_base64_throwError_004
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODEASYNC_BASE64_THROW_ERROR_4120
     * @tc.desc   Asynchronously encodes all bytes in the specified u8 array into the newly allocated u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeAsync_base64_throwError_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_encodeAsync_base64_throwError_004())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_encodeToString_base64_throwError_005
     * @tc.number SUB_COMMONLIBRARY_FP_ENCODE_TO_STRING_BASE64_THROW_ERROR_4130
     * @tc.desc   Asynchronously encodes the specified byte array into a String using the Base64 encoding scheme.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_encodeToString_base64_throwError_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_encodeToString_base64_throwError_005())
        .assertEqual(
          "Error: Parameter error. The type of Parameter must be Uint8Array and " + "the length greater than zero.")
    })

    /**
     * @tc.name   test_decode_base64_throwError_006
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_THROW_ERROR_4140
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_throwError_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_decode_base64_throwError_006())
        .assertEqual("Error: Parameter error. The type of Parameter must be Uint8Array or " +
          "string and the length greater than 0.")
    })

    /**
     * @tc.name   test_decode_base64_throwError_007
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_THROW_ERROR_4150
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_throwError_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_decode_base64_throwError_007()).assertEqual("")
    })

    /**
     * @tc.name   test_decode_base64_throwError_008
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_THROW_ERROR_4160
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_throwError_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_decode_base64_throwError_008()).assertEqual("")
    })

    /**
     * @tc.name   test_decode_base64_throwError_009
     * @tc.number SUB_COMMONLIBRARY_FP_DECODE_BASE64_THROW_ERROR_4170
     * @tc.desc   Use the Base64 encoding scheme to asynchronously decode a Base64-encoded string or input u8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_decode_base64_throwError_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(test_decode_base64_throwError_009()).assertEqual("")
    })


  })

}
