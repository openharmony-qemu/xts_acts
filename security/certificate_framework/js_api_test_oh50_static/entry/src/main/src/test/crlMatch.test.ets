/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import * as crlFunc from "./utils/collection/crlFunc";
import * as certFunc from "./utils/collection/certFunc";
import {
  CRL_CERT_DATA_01,
  CRL_CERT_DATA_02,
  CRL_DATA_MAP_01,
  CRL_DATA_MAP_02,
  EXPECT_RESULT_FALSE,
  EXPECT_RESULT_TRUE,
  PEM
} from './utils/common/commonParam';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function certFrameworkCRLMatchJsAPIFunctionTestUnit() {
  describe("certFrameworkCRLMatchJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkCRLMatchJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1300
     * @tc.name check X509CRL match for parameter updateDateTime match
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: '231123033300Z'
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1400
     * @tc.name check X509CRL match for parameter updateDateTime mismatching
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: '281123033300Z'
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertFalse();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1500
     * @tc.name check X509CRL match for parameter updateDateTime empty
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: ''
      };
      try {
        const result = x509CRL.match(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1600
     * @tc.name check X509CRL match for parameter maxCRL > CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(10)
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1700
     * @tc.name check X509CRL match for parameter maxCRL < CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(0)
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertFalse();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1800
     * @tc.name check X509CRL match for parameter maxCRL invalid
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(-1)
      };
      try {
        const result = x509CRL.match(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1900
     * @tc.name check X509CRL match for parameter minCRL < CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(0)
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_2000
     * @tc.name check X509CRL match for parameter minCRL > CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(10)
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertFalse();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_2100
     * @tc.name check X509CRL match for parameter minCRL invalid
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(-1)
      };
      try {
        const result = x509CRL.match(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_2200
     * @tc.name check X509CRL match for parameter minCRL>maxCRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(3),
        maxCRL: BigInt(1)
      };
      try {
        const result = x509CRL.match(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });
  });
}
