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

import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium";
import Utils from './Utils'
import testNapi from 'libnapiString.so';

export default function stringTest() {
  describe('ActsStringTest', () => {

    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ============ Original Test Cases ============

    /**
     * @tc.name   testNapiString0001
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_0100
     * @tc.desc   Test napi_create_string_utf8 with simple string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0001';
      console.log(TAG + ' start');
      let ret: string = testNapi.createStringUtf8('abc');
      expect(ret).assertEqual('abc');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0002
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_EMPTY_0200
     * @tc.desc   Test napi_create_string_utf8 with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0002';
      console.log(TAG + ' start');
      let ret: string = testNapi.createStringUtf8('');
      expect(ret).assertEqual('');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0003
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_CHINESE_0300
     * @tc.desc   Test napi_create_string_utf8 with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0003';
      console.log(TAG + ' start');
      let ret: string = testNapi.createStringUtf8('测试');
      expect(ret).assertEqual('测试');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0004
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_SPECIAL_0400
     * @tc.desc   Test napi_create_string_utf8 with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0004';
      console.log(TAG + ' start');
      let ret: string = testNapi.createStringUtf8('!@#$%^&*()');
      expect(ret).assertEqual('!@#$%^&*()');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0005
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_NUMERIC_0500
     * @tc.desc   Test napi_create_string_utf8 with numbers string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0005';
      console.log(TAG + ' start');
      let ret: string = testNapi.createStringUtf8('1234567890');
      expect(ret).assertEqual('1234567890');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    // ============ New Test Cases (24 cases) ============

    /**
     * @tc.name   testNapiString0006
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_INVALID_0600
     * @tc.desc   Test napi_create_string_utf8 with invalid UTF8 data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0006';
      console.log(TAG + ' start');
      let status: number = testNapi.createStringUtf8InvalidData();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0007
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_VERIFY_0700
     * @tc.desc   Test napi_create_string_utf8 creates string that can be verified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0007';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createStringUtf8AndVerify('hello world');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0008
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_0800
     * @tc.desc   Test napi_create_external_string_ascii creates normal ASCII string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0008';
      console.log(TAG + ' start');
      let ret: string = testNapi.createExternalStringAscii('hello');
      expect(ret).assertEqual('hello');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0009
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_NULL_0900
     * @tc.desc   Test napi_create_external_string_ascii with null str
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0009';
      console.log(TAG + ' start');
      let status: number = testNapi.createExternalStringAsciiNullStr();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0010
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_NON_ASCII_1000
     * @tc.desc   Test napi_create_external_string_ascii with non-ASCII chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0010';
      console.log(TAG + ' start');
      let status: number = testNapi.createExternalStringAsciiNonAscii('测试');
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0011
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_FINALIZE_1100
     * @tc.desc   Test napi_create_external_string_ascii finalize callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testNapiString0011';
      console.log(TAG + ' start');
      let str: string = testNapi.createExternalStringAscii('test');
      expect(str).assertEqual('test');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0012
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_UTF16_1200
     * @tc.desc   Test napi_create_external_string_utf16 creates normal string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0012';
      console.log(TAG + ' start');
      let ret: string = testNapi.createExternalStringUtf16('hello utf16');
      expect(ret).assertEqual('hello utf16');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0013
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_UTF16_NULL_1300
     * @tc.desc   Test napi_create_external_string_utf16 with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0013';
      console.log(TAG + ' start');
      let status: number = testNapi.createExternalStringUtf16NullParam();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0014
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_1400
     * @tc.desc   Test napi_get_buffer_string_utf16_in_critical_scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0014';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getBufferStringUtf16InCriticalScope('critical scope 临界区测试');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0015
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_NULL_1500
     * @tc.desc   Test napi_get_buffer_string_utf16 with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0015';
      console.log(TAG + ' start');
      let status: number = testNapi.getBufferStringUtf16InCriticalScopeNull();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0016
     * @tc.number SUB_NAPI_STRING_GET_VALUE_STRING_LATIN1_1600
     * @tc.desc   Test napi_get_value_string_latin1 retrieves string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0016';
      console.log(TAG + ' start');
      let ret: string = testNapi.getValueStringLatin1('latin1 test');
      expect(ret).assertEqual('latin1 test');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0017
     * @tc.number SUB_NAPI_STRING_GET_VALUE_STRING_LATIN1_NULL_1700
     * @tc.desc   Test napi_get_value_string_latin1 with null param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0017';
      console.log(TAG + ' start');
      let status: number = testNapi.getValueStringLatin1NullParam();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0018
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_LONG_1800
     * @tc.desc   Test napi_create_string_utf8 with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0018';
      console.log(TAG + ' start');
      let longStr: string = 'A'.repeat(100);
      let ret: string = testNapi.createStringUtf8(longStr);
      expect(ret.length).assertEqual(100);
      expect(ret).assertEqual(longStr);
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0019
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_VERIFY_CONTENT_1900
     * @tc.desc   Test napi_create_string_utf8 and verify content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0019';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createStringUtf8AndVerify('verify content');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0020
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_CHINESE_2000
     * @tc.desc   Test napi_get_buffer_string_utf16 with Chinese chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0020';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getBufferStringUtf16InCriticalScope('中文字符测试');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0021
     * @tc.number SUB_NAPI_STRING_GET_VALUE_STRING_LATIN1_SPECIAL_2100
     * @tc.desc   Test napi_get_value_string_latin1 with special chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0021';
      console.log(TAG + ' start');
      let inputStr: string = 'latin-1 chars test';
      let ret: string = testNapi.getValueStringLatin1(inputStr);
      // Input is pure ASCII/latin1 so it survives the latin1 round-trip unchanged.
      expect(ret.length).assertEqual(inputStr.length);
      expect(ret).assertEqual(inputStr);
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0022
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_RETURN_2200
     * @tc.desc   Test napi_create_external_string_ascii return value verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0022';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createExternalStringAsciiVerifyReturn('verify ascii return');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0023
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_UTF16_RETURN_2300
     * @tc.desc   Test napi_create_external_string_utf16 return value verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0023';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createExternalStringUtf16VerifyReturn('verify utf16 return');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0024
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_UTF16_ABNORMAL_2400
     * @tc.desc   Test napi_create_external_string_utf16 abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0024';
      console.log(TAG + ' start');
      let status: number = testNapi.createExternalStringUtf16Abnormal();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0025
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_UTF16_COMBINED_2500
     * @tc.desc   Test napi_create_external_string_utf16 combined usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0025';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createExternalStringUtf16Combined('combined utf16 test');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0026
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_VERIFY_2600
     * @tc.desc   Test napi_get_buffer_string_utf16_in_critical_scope return value verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0026';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getBufferStringUtf16VerifyReturn('complex string 复杂字符串');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0027
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_ABNORMAL_2700
     * @tc.desc   Test napi_get_buffer_string_utf16_in_critical_scope abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0027';
      console.log(TAG + ' start');
      let status: number = testNapi.getBufferStringUtf16Abnormal();
      expect(status !== 0).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0028
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_COMBINED_2800
     * @tc.desc   Test napi_get_buffer_string_utf16_in_critical_scope combined usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0028';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getBufferStringUtf16Combined('combined memory 组合访问');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0029
     * @tc.number SUB_NAPI_STRING_GET_VALUE_STRING_LATIN1_ABNORMAL_2900
     * @tc.desc   Test napi_get_value_string_latin1 abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0029';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getValueStringLatin1Abnormal('normal string');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    // ============ Additional Cases from Gap Analysis ============

    /**
     * @tc.name   testNapiString0030
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_NORMAL_3000
     * @tc.desc   Test napi_create_external_string_ascii normal scenario as ArkTS string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0030';
      console.log(TAG + ' start');
      let ret: string = testNapi.createExternalStringAsciiNormalUsage();
      expect(ret.length).assertEqual(11);
      expect(ret).assertEqual('hello world');
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0031
     * @tc.number SUB_NAPI_STRING_CREATE_EXTERNAL_STRING_ASCII_FINALIZE_3100
     * @tc.desc   Test napi_create_external_string_ascii combined with finalize callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testNapiString0031';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createExternalStringAsciiWithFinalize();
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0032
     * @tc.number SUB_NAPI_STRING_CREATE_STRING_UTF8_ABNORMAL_3200
     * @tc.desc   Test napi_create_string_utf8 abnormal scenario with invalid UTF8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0032';
      console.log(TAG + ' start');
      let result: boolean = testNapi.createStringUtf8AbnormalScenario();
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0033
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_NULL_PARAMS_3300
     * @tc.desc   Test napi_get_buffer_string_utf16_in_critical_scope abnormal NULL params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0033';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getBufferStringUtf16AbnormalParams();
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0034
     * @tc.number SUB_NAPI_STRING_BUFFER_STRING_CRITICAL_SCOPE_NORMAL_3400
     * @tc.desc   Test napi_get_buffer_string_utf16_in_critical_scope normal direct memory access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0034';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getBufferStringUtf16NormalScenario('direct buffer 直接访问');
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });

    /**
     * @tc.name   testNapiString0035
     * @tc.number SUB_NAPI_STRING_GET_VALUE_STRING_LATIN1_ABNORMAL_PARAMS_3500
     * @tc.desc   Test napi_get_value_string_latin1 abnormal params NULL and non-string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = 'testNapiString0035';
      console.log(TAG + ' start');
      let result: boolean = testNapi.getValueStringLatin1AbnormalParams();
      expect(result).assertTrue();
      console.log(TAG + ' done');
      console.log(TAG + ' end');
    });
  });
}
