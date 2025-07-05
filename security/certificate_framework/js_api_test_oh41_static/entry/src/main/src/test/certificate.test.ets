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
import util from '@ohos.util';
import * as certPromise from "./utils/certificate/publicCertificatePromise";

export default function certificateJsunit() {
  describe("CertificateJsunit", () => {
    console.info("##########start CertificateJsunit##########");
    beforeAll(() => {
    });

    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0100
     * @tc.name check X509CRL get extension true by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_Certificate_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLExtensionsPromise("pem", true)
        expect(data != null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0200
     * @tc.name check X509CRL get extension true by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_Certificate_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLExtensionsPromise("der", true)
        expect(data != null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0300
     * @tc.name check X509CRL get extension false by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_Certificate_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLExtensionsPromise("pem", false)
        expect(data == null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0400
     * @tc.name check X509CRL get extension false by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_Certificate_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLExtensionsPromise("der", false)
        expect(data == null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0500
     * @tc.name check X509CRLEntry get extension true by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_Certificate_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLEntryExtensionsPromise("pem", true)
        expect(data != null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0600
     * @tc.name check X509CRLEntry get extension true by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_Certificate_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLEntryExtensionsPromise("der", true)
        expect(data != null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0700
     * @tc.name check X509CRLEntry get extension false by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_Certificate_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLEntryExtensionsPromise("pem", false)
        expect(data == null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0800
     * @tc.name check X509CRLEntry get extension false by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_Certificate_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.DataBlob = await certPromise.checkGetX509CRLEntryExtensionsPromise("der", false)
        expect(data == null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_0900
     * @tc.name check X509CRLEntry has extension true by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_Certificate_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: boolean = await certPromise.checkHasX509CRLEntryExtensionsPromise("pem", true)
        expect(data != null).assertTrue();
        expect(data).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_1000
     * @tc.name check X509CRLEntry has extension true by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_Certificate_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: boolean = await certPromise.checkHasX509CRLEntryExtensionsPromise("der", true)
        expect(data != null).assertTrue();
        expect(data).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_1100
     * @tc.name check X509CRLEntry has extension false by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_Certificate_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: boolean = await certPromise.checkHasX509CRLEntryExtensionsPromise("pem", false)
        expect(data != null).assertTrue();
        expect(!data).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_1200
     * @tc.name check X509CRLEntry has extension false by promise
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_Certificate_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: boolean = await certPromise.checkHasX509CRLEntryExtensionsPromise("der", false)
        expect(data != null).assertTrue();
        expect(!data).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_1300
     * @tc.name X509 cert extension has not unSupported Critical by promise
     * @tc.desc certExtension test
     */
    it("Security_Cert_Framework_Certificate_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: boolean = await certPromise.checkHasUnsupportedX509CrlPromise('certNoCritical')
        expect(data != null).assertTrue();
        expect(!data).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_Certificate_Func_1400
     * @tc.name X509 cert extension has unSupported Critical by promise
     * @tc.desc certExtension test
     */
    it("Security_Cert_Framework_Certificate_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: boolean = await certPromise.checkHasUnsupportedX509CrlPromise('certHasCritical')
        expect(data != null).assertTrue();
        expect(data).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
  });
}
