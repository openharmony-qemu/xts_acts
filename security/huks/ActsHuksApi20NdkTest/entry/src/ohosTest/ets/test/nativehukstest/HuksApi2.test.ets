/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativehuksndk from 'libnativehuksndk.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function HuksApiTest2() {
  describe('HuksApiTest2', () => {
    beforeAll(async () => {
      console.info("====>HuksApiTest2 start====");
    });
    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_TYPE_NORMAL_0100
       * @tc.name    testOH_HUKS_CHALLENGE_TYPE_NORMAL0100
       * @tc.desc    testing OH_HUKS_CHALLENGE_TYPE_NORMAL interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_TYPE_NORMAL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_TYPE_NORMAL0100 start====");
          let result: number = nativehuksndk.ChallengeTypeTest_001();
          console.info(`====>testOH_HUKS_CHALLENGE_TYPE_NORMAL0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_TYPE_NORMAL0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_TYPE_CUSTOM_0100
       * @tc.name    testOH_HUKS_CHALLENGE_TYPE_CUSTOM0100
       * @tc.desc    testing OH_HUKS_CHALLENGE_TYPE_CUSTOM interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_TYPE_CUSTOM0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_TYPE_CUSTOM0100 start====");
          let result: number = nativehuksndk.ChallengeTypeTest_002();
          console.info(`====>testOH_HUKS_CHALLENGE_TYPE_CUSTOM0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_TYPE_CUSTOM0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_TYPE_NONE_0100
       * @tc.name    testOH_HUKS_CHALLENGE_TYPE_NONE0100
       * @tc.desc    testing OH_HUKS_CHALLENGE_TYPE_NONE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_TYPE_NONE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_TYPE_NONE0100 start====");
          let result: number = nativehuksndk.ChallengeTypeTest_003();
          console.info(`====>testOH_HUKS_CHALLENGE_TYPE_NONE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_TYPE_NONE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_POS_0_0100
       * @tc.name    testOH_HUKS_CHALLENGE_POS_00100
       * @tc.desc    testing OH_HUKS_CHALLENGE_POS_0 interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_POS_00100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_POS_00100 start====");
          let result: number = nativehuksndk.ChallengePositionTest_001();
          console.info(`====>testOH_HUKS_CHALLENGE_POS_00100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_POS_00100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_POS_1_0100
       * @tc.name    testOH_HUKS_CHALLENGE_POS_10100
       * @tc.desc    testing OH_HUKS_CHALLENGE_POS_1 interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_POS_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_POS_10100 start====");
          let result: number = nativehuksndk.ChallengePositionTest_002();
          console.info(`====>testOH_HUKS_CHALLENGE_POS_10100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_POS_10100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_POS_2_0100
       * @tc.name    testOH_HUKS_CHALLENGE_POS_20100
       * @tc.desc    testing OH_HUKS_CHALLENGE_POS_2 interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_POS_20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_POS_20100 start====");
          let result: number = nativehuksndk.ChallengePositionTest_003();
          console.info(`====>testOH_HUKS_CHALLENGE_POS_20100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_POS_20100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_CHALLENGE_POS_3_0100
       * @tc.name    testOH_HUKS_CHALLENGE_POS_30100
       * @tc.desc    testing OH_HUKS_CHALLENGE_POS_3 interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_CHALLENGE_POS_30100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_CHALLENGE_POS_30100 start====");
          let result: number = nativehuksndk.ChallengePositionTest_004();
          console.info(`====>testOH_HUKS_CHALLENGE_POS_30100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_CHALLENGE_POS_30100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_SECURE_SIGN_WITH_AUTHINFO_0100
       * @tc.name    testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100
       * @tc.desc    testing OH_HUKS_SECURE_SIGN_WITH_AUTHINFO interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100 start====");
          let result: number = nativehuksndk.SecureSignTypeTest_001();
          console.info(`====>testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_SECURE_SIGN_WITH_AUTHINFO0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_KEY_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_001();
          console.info(`====>testOH_HUKS_TAG_KEY_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_INFO_0100
       * @tc.name    testOH_HUKS_TAG_INFO0100
       * @tc.desc    testing OH_HUKS_TAG_INFO interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_INFO0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_INFO0100 start====");
          let result: number = nativehuksndk.TagTest_002();
          console.info(`====>testOH_HUKS_TAG_INFO0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_INFO0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AGREE_ALG_0100
       * @tc.name    testOH_HUKS_TAG_AGREE_ALG0100
       * @tc.desc    testing OH_HUKS_TAG_AGREE_ALG interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AGREE_ALG0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AGREE_ALG0100 start====");
          let result: number = nativehuksndk.TagTest_003();
          console.info(`====>testOH_HUKS_TAG_AGREE_ALG0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AGREE_ALG0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS_0100
       * @tc.name    testOH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS0100
       * @tc.desc    testing OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS0100 start====");
          let result: number = nativehuksndk.TagTest_004();
          console.info(`====>testOH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS_0100
       * @tc.name    testOH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS0100
       * @tc.desc    testing OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS0100 start====");
          let result: number = nativehuksndk.TagTest_005();
          console.info(`====>testOH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AGREE_PUBLIC_KEY_0100
       * @tc.name    testOH_HUKS_TAG_AGREE_PUBLIC_KEY0100
       * @tc.desc    testing OH_HUKS_TAG_AGREE_PUBLIC_KEY interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AGREE_PUBLIC_KEY0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AGREE_PUBLIC_KEY0100 start====");
          let result: number = nativehuksndk.TagTest_006();
          console.info(`====>testOH_HUKS_TAG_AGREE_PUBLIC_KEY0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AGREE_PUBLIC_KEY0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_IMPORT_KEY_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_IMPORT_KEY_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_IMPORT_KEY_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_IMPORT_KEY_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_IMPORT_KEY_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_007();
          console.info(`====>testOH_HUKS_TAG_IMPORT_KEY_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_IMPORT_KEY_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG_0100
       * @tc.name    testOH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG0100
       * @tc.desc    testing OH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG0100 start====");
          let result: number = nativehuksndk.TagTest_008();
          console.info(`====>testOH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_009();
          console.info(`====>testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_RSA_PSS_SALT_LEN_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_ALL_USERS_0100
       * @tc.name    testOH_HUKS_TAG_ALL_USERS0100
       * @tc.desc    testing OH_HUKS_TAG_ALL_USERS interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_ALL_USERS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_ALL_USERS0100 start====");
          let result: number = nativehuksndk.TagTest_010();
          console.info(`====>testOH_HUKS_TAG_ALL_USERS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_ALL_USERS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_NO_AUTH_REQUIRED_0100
       * @tc.name    testOH_HUKS_TAG_NO_AUTH_REQUIRED0100
       * @tc.desc    testing OH_HUKS_TAG_NO_AUTH_REQUIRED interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_NO_AUTH_REQUIRED0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_NO_AUTH_REQUIRED0100 start====");
          let result: number = nativehuksndk.TagTest_012();
          console.info(`====>testOH_HUKS_TAG_NO_AUTH_REQUIRED0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_NO_AUTH_REQUIRED0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_USER_AUTH_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_USER_AUTH_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_USER_AUTH_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_USER_AUTH_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_USER_AUTH_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_013();
          console.info(`====>testOH_HUKS_TAG_USER_AUTH_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_USER_AUTH_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AUTH_TIMEOUT_0100
       * @tc.name    testOH_HUKS_TAG_AUTH_TIMEOUT0100
       * @tc.desc    testing OH_HUKS_TAG_AUTH_TIMEOUT interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AUTH_TIMEOUT0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AUTH_TIMEOUT0100 start====");
          let result: number = nativehuksndk.TagTest_014();
          console.info(`====>testOH_HUKS_TAG_AUTH_TIMEOUT0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AUTH_TIMEOUT0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AUTH_TOKEN_0100
       * @tc.name    testOH_HUKS_TAG_AUTH_TOKEN0100
       * @tc.desc    testing OH_HUKS_TAG_AUTH_TOKEN interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AUTH_TOKEN0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AUTH_TOKEN0100 start====");
          let result: number = nativehuksndk.TagTest_015();
          console.info(`====>testOH_HUKS_TAG_AUTH_TOKEN0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AUTH_TOKEN0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_016();
          console.info(`====>testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_017();
          console.info(`====>testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_SECURE_SIGN_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_CHALLENGE_TYPE_0100
       * @tc.name    testOH_HUKS_TAG_CHALLENGE_TYPE0100
       * @tc.desc    testing OH_HUKS_TAG_CHALLENGE_TYPE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_CHALLENGE_TYPE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_CHALLENGE_TYPE0100 start====");
          let result: number = nativehuksndk.TagTest_018();
          console.info(`====>testOH_HUKS_TAG_CHALLENGE_TYPE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_CHALLENGE_TYPE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_CHALLENGE_POS_0100
       * @tc.name    testOH_HUKS_TAG_CHALLENGE_POS0100
       * @tc.desc    testing OH_HUKS_TAG_CHALLENGE_POS interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_CHALLENGE_POS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_CHALLENGE_POS0100 start====");
          let result: number = nativehuksndk.TagTest_019();
          console.info(`====>testOH_HUKS_TAG_CHALLENGE_POS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_CHALLENGE_POS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_AUTH_PURPOSE_0100
       * @tc.name    testOH_HUKS_TAG_KEY_AUTH_PURPOSE0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_AUTH_PURPOSE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_AUTH_PURPOSE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_AUTH_PURPOSE0100 start====");
          let result: number = nativehuksndk.TagTest_020();
          console.info(`====>testOH_HUKS_TAG_KEY_AUTH_PURPOSE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_AUTH_PURPOSE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_USER_AUTH_MODE_0100
       * @tc.name    testOH_HUKS_TAG_USER_AUTH_MODE0100
       * @tc.desc    testing OH_HUKS_TAG_USER_AUTH_MODE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_USER_AUTH_MODE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_USER_AUTH_MODE0100 start====");
          let result: number = nativehuksndk.TagTest_021();
          console.info(`====>testOH_HUKS_TAG_USER_AUTH_MODE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_USER_AUTH_MODE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_ATTESTATION_APPLICATION_ID_0100
       * @tc.name    testOH_HUKS_TAG_ATTESTATION_APPLICATION_ID0100
       * @tc.desc    testing OH_HUKS_TAG_ATTESTATION_APPLICATION_ID interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_ATTESTATION_APPLICATION_ID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_ATTESTATION_APPLICATION_ID0100 start====");
          let result: number = nativehuksndk.TagTest_022();
          console.info(`====>testOH_HUKS_TAG_ATTESTATION_APPLICATION_ID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_ATTESTATION_APPLICATION_ID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_OVERRIDE_0100
       * @tc.name    testOH_HUKS_TAG_KEY_OVERRIDE0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_OVERRIDE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_OVERRIDE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_OVERRIDE0100 start====");
          let result: number = nativehuksndk.TagTest_023();
          console.info(`====>testOH_HUKS_TAG_KEY_OVERRIDE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_OVERRIDE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_IS_KEY_ALIAS_0100
       * @tc.name    testOH_HUKS_TAG_IS_KEY_ALIAS0100
       * @tc.desc    testing OH_HUKS_TAG_IS_KEY_ALIAS interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_IS_KEY_ALIAS0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_IS_KEY_ALIAS0100 start====");
          let result: number = nativehuksndk.TagTest_024();
          console.info(`====>testOH_HUKS_TAG_IS_KEY_ALIAS0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_IS_KEY_ALIAS0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_IS_ALLOWED_WRAP_0100
       * @tc.name    testOH_HUKS_TAG_IS_ALLOWED_WRAP0100
       * @tc.desc    testing OH_HUKS_TAG_IS_ALLOWED_WRAP interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_IS_ALLOWED_WRAP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_IS_ALLOWED_WRAP0100 start====");
          let result: number = nativehuksndk.TagTest_025();
          console.info(`====>testOH_HUKS_TAG_IS_ALLOWED_WRAP0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_IS_ALLOWED_WRAP0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_AUTH_ID_0100
       * @tc.name    testOH_HUKS_TAG_KEY_AUTH_ID0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_AUTH_ID interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_AUTH_ID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_AUTH_ID0100 start====");
          let result: number = nativehuksndk.TagTest_026();
          console.info(`====>testOH_HUKS_TAG_KEY_AUTH_ID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_AUTH_ID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_KEY_ROLE_0100
       * @tc.name    testOH_HUKS_TAG_KEY_ROLE0100
       * @tc.desc    testing OH_HUKS_TAG_KEY_ROLE interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_KEY_ROLE0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_KEY_ROLE0100 start====");
          let result: number = nativehuksndk.TagTest_027();
          console.info(`====>testOH_HUKS_TAG_KEY_ROLE0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_KEY_ROLE0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET_0100
       * @tc.name    testOH_HUKS_TAG_IS_DEVICE_PASSWORD_SET0100
       * @tc.desc    testing OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_IS_DEVICE_PASSWORD_SET0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_IS_DEVICE_PASSWORD_SET0100 start====");
          let result: number = nativehuksndk.TagTest_031();
          console.info(`====>testOH_HUKS_TAG_IS_DEVICE_PASSWORD_SET0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_IS_DEVICE_PASSWORD_SET0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_AE_TAG_0100
       * @tc.name    testOH_HUKS_TAG_AE_TAG0100
       * @tc.desc    testing OH_HUKS_TAG_AE_TAG interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_AE_TAG0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_AE_TAG0100 start====");
          let result: number = nativehuksndk.TagTest_032();
          console.info(`====>testOH_HUKS_TAG_AE_TAG0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_AE_TAG0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_SYMMETRIC_KEY_DATA_0100
       * @tc.name    testOH_HUKS_TAG_SYMMETRIC_KEY_DATA0100
       * @tc.desc    testing OH_HUKS_TAG_SYMMETRIC_KEY_DATA interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_SYMMETRIC_KEY_DATA0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_SYMMETRIC_KEY_DATA0100 start====");
          let result: number = nativehuksndk.TagTest_033();
          console.info(`====>testOH_HUKS_TAG_SYMMETRIC_KEY_DATA0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_SYMMETRIC_KEY_DATA0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
       * @tc.number  SUB_SECURITY_HUKS_OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA_0100
       * @tc.name    testOH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA0100
       * @tc.desc    testing OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA interface
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level 1
       */
    it('testOH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA0100 start====");
          let result: number = nativehuksndk.TagTest_034();
          console.info(`====>testOH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}
