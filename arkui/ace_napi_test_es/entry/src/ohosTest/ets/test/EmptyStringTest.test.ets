/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from "@ohos/hypium"

import napitest from 'libnapitest.so'

export default function emptyStringJsunit() {

  describe('napiEmptyStringTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiEmptyStringTest] after each called');
    });

    /**
     * @tc.name   aceNapiEmptyStringTest001
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0100
     * @tc.desc   napi_create_string_latin1 with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest001 START');
      let value = napitest.emptyStringLatin1();
      console.info('aceNapiEmptyStringTest001 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('');
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest002
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0200
     * @tc.desc   napi_set_named_property with empty name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest002 START');
      let value = napitest.emptySetNamedProperty();
      console.info('aceNapiEmptyStringTest002 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0300
     * @tc.desc   napi_has_named_property with empty name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest003 START');
      let value = napitest.emptyHasNamedProperty();
      console.info('aceNapiEmptyStringTest003 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest004
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0400
     * @tc.desc   napi_get_named_property with empty name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest004 START');
      let value = napitest.emptyGetNamedProperty();
      console.info('aceNapiEmptyStringTest004 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(42);
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest005
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0500
     * @tc.desc   napi_define_class with empty name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest005 START');
      let value = napitest.emptyDefineClass();
      console.info('aceNapiEmptyStringTest005 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest006
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0600
     * @tc.desc   napi_throw_error with empty code and empty msg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest006 START');
      try {
        napitest.emptyThrowError();
        expect(false).assertTrue();
      } catch (err) {
        console.info('aceNapiEmptyStringTest006 testString result is err: ' + err + "--" + JSON.stringify(err));
        let errStr = JSON.stringify(err);
        expect(errStr !== '').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest007
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0700
     * @tc.desc   napi_throw_type_error with empty code and empty msg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest007 START');
      try {
        napitest.emptyThrowTypeError();
        expect(false).assertTrue();
      } catch (err) {
        console.info('aceNapiEmptyStringTest007 testString result is err: ' + err + "--" + JSON.stringify(err));
        let errStr = JSON.stringify(err);
        expect(errStr !== '').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest008
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0800
     * @tc.desc   napi_throw_range_error with empty code and empty msg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest008 START');
      try {
        napitest.emptyThrowRangeError();
        expect(false).assertTrue();
      } catch (err) {
        console.info('aceNapiEmptyStringTest008 testString result is err: ' + err + "--" + JSON.stringify(err));
        let errStr = JSON.stringify(err);
        expect(errStr !== '').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest009
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_0900
     * @tc.desc   napi_run_script_path with empty path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest009 START');
      let value = napitest.emptyRunScriptPath();
      console.info('aceNapiEmptyStringTest009 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest010
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_1000
     * @tc.desc   napi_load_module with empty path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest010 START');
      let value = napitest.emptyLoadModule();
      console.info('aceNapiEmptyStringTest010 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest011
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_1100
     * @tc.desc   napi_define_sendable_class with empty name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest011 START');
      let value = napitest.emptyDefineSendableClass();
      console.info('aceNapiEmptyStringTest011 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest012
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_1200
     * @tc.desc   napi_create_external_string_ascii with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest012 START');
      let value = napitest.emptyExternalStringAscii();
      console.info('aceNapiEmptyStringTest012 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('');
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest013
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_1300
     * @tc.desc   napi_throw_business_error with empty msg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest013 START');
      try {
        napitest.emptyThrowBusinessError();
        expect(false).assertTrue();
      } catch (err) {
        console.info('aceNapiEmptyStringTest013 testString result is err: ' + err + "--" + JSON.stringify(err));
        let errStr = JSON.stringify(err);
        expect(errStr !== '').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   aceNapiEmptyStringTest014
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_EMPTY_STRING_1400
     * @tc.desc   napi_create_object_with_named_properties with empty key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('aceNapiEmptyStringTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('aceNapiEmptyStringTest014 START');
      let value = napitest.emptyObjectWithNamedProperties();
      console.info('aceNapiEmptyStringTest014 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });
  })
}
