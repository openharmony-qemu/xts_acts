'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import certManager from '@ohos.security.certManager';
import type common from '@ohos.app.ability.common';
import type { BusinessError } from '@ohos.base';
import certManagerDialog from '@ohos.security.certManagerDialog';
import { priRsaCredData } from './utils/common/common_parameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog';
import { canIUse } from '@internal.full.global';
import { GlobalContext } from '../testrunner/OpenHarmonyTestRunner';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function certManagerPubCertJsAPIFunctionTestUnitThree() {
  describe('certManagerPubCertJsAPIFunctionTestUnitThree', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'test'; /* 业务安装凭据，返回唯一标识符，此处省略 */
      try {
        await certManager.getPrivateCertificate(uri);
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      try {
        await certManager.getPrivateCertificate("");
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0100 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'test';
      let cmResult2: certManager.CMResult;
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(uri, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(CMResult as certManager.CMResult);
            }
          });
        });
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101 private certificate success. `);
        expect(cmResult2 != undefined && cmResult2 != null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101 Failed to get private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
	  let cmResult3:certManager.CMResult;
      try {
        cmResult3 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate("", (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(CMResult as certManager.CMResult);
            }
          });
        });
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101 private certificate success. `);
        expect(cmResult3 != undefined && cmResult3 != null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0101 Failed to get private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      try {
        await certManager.getPrivateCertificate(uri);
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102 private certificate success. `);
        expect(null).assertFail();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0102 Failed to get private certificate. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cmResult2: certManager.CMResult;
      let uri: string = 'oh:t=ak;o=appCertAliasDemoRsa;u=100;a=20010045';
      try {
        cmResult2 = await new Promise<certManager.CMResult>((resolve, reject) => {
          certManager.getPrivateCertificate(uri, (err: BusinessError<void> | null, CMResult: certManager.CMResult | undefined) => {
            if (err != null && err?.code != 0) {
              reject(err as Error);
            } else {
              resolve(CMResult as certManager.CMResult);
            }
          });
        });
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103 private certificate success. `);
        expect(cmResult2 != undefined && cmResult2 != null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0103 getPrivateCertificate err: " + err.code);
        expect(err.code).assertEqual(17500002);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110
     * @tc.number SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let uri: string = 'oh:t=c;o=vBBPFaSL5wncpUKn4dS5328FRSfoAuqpLVlURCWK_nEA;u=0;a=20010044';
      try {
        await certManager.getUserTrustedCertificate(uri);
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110 init success. `);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110 init err: " + err.code);
        expect(err.code).assertEqual(17500002);
      }
	  try {
        await certManager.getUserTrustedCertificate("");
        hilog.info(domain, tag, '%{public}s', `SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110 init success. `);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', "SUB_Security_CertManager_GetPriCertJsApi_Func_Static_0110 init err: " + err.code);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200
     * @tc.number SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let keystore: Uint8Array = priRsaCredData;
      let keystorePwd: string = '111111';
      let certAlias: string = 'appCertAliasDemoRsa';
      let keyUri: string | undefined;
      try {
        await certManager.installPrivateCertificate(keystore, keystorePwd, certAlias);
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_InstallPrivateCertificate_Func_Static_0200 Failed to install private certificate. Code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(17500003);
      }
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_getUkeyCertificateList_func_Static_0020
     * @tc.number SUB_Security_CertManager_getUkeyCertificateList_func_Static_0020
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_getUkeyCertificateList_func_Static_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "SUB_Security_CertManager_getUkeyCertificateList_func_Static_0020: started ");
      let ukeyProvider: string = 'testProvider'; 
      let ukeyInfo: certManager.UkeyInfo = { 
        certPurpose: certManager.CertificatePurpose.PURPOSE_ENCRYPT,
      }
      try {
        await certManager.getUkeyCertificateList("", ukeyInfo);
      } catch (error) {
        if(error.code !== 801){
        hilog.info(domain, tag, '%{public}s', "SUB_Security_CertManager_getUkeyCertificateList_func_Static_0020: e.code " + error.code);
        expect(error.code).assertEqual(17500001);
        }
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_getUkeyCertificateList_func_Static_0020 end');
      done();
    });
    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0300
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0300
     * @tc.desc   keyUri is empty string, return error code 17500011 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0300 start');
      let keyUri: string = '';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
	  try {
        await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0300 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500011);
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0300 end');
      done();
    });
  
    /**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0600
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0600
     * @tc.desc   cert is empty Uint8Array, return error code 17500011 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0600 start');
      let keyUri: string = 'test';
      let emptyCertData: Uint8Array = new Uint8Array([]);
      let ukeyInfo: certManager.UkeyInfo = {
        certPurpose: certManager.CertificatePurpose.PURPOSE_SIGN,
      };
	  try {
        await certManager.importUkeyCertificate(keyUri, emptyCertData, ukeyInfo);
        expect(null).assertFail();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0600 failed. Code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(17500011);
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_0600 end');
      done();
    });
	/**
     * @tc.name   SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700
     * @tc.number SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700
     * @tc.desc   ukeyInfo without certPurpose, return error code 17500010 on PC device or 801 on non-PC device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700 start');
      let keyUri: string = 'test';
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      let ukeyInfo: certManager.UkeyInfo = {};
      if (canIUse('SystemCapability.Security.Huks.CryptoExtension')) {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(17500010);
        }
      } else {
        try {
          await certManager.importUkeyCertificate(keyUri, certData, ukeyInfo);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(801);
        }
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_ImportUkeyCertificate_Func_Static_1700 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100
     * @tc.number SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100
     * @tc.desc   Call openInstallCertificateDialog with certType CREDENTIAL_USER, certScope GLOBAL_USER. Return error code 29700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100 start');
      const context: common.Context = await GlobalContext.getContext();
      let certType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CREDENTIAL_USER;
      let certScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.GLOBAL_USER;
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      if (canIUse('SystemCapability.Security.CertificateManagerDialog')) {
        try {
          let uri: string = await certManagerDialog.openInstallCertificateDialog(context, certType, certScope, certData);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_NOT_COMPLY_SECURITY_POLICY);
        }
      } else {
        hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100 device not support CertificateManagerDialog');
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0100 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200
     * @tc.number SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200
     * @tc.desc   Call openInstallCertificateDialog with certType CREDENTIAL_APP, certScope CURRENT_USER. Return error code 401(CM_ERROR_INVALID_PARAMS).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200 start');
      const context: common.Context = await GlobalContext.getContext();
      let certType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CREDENTIAL_APP;
      let certScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.CURRENT_USER;
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      if (canIUse('SystemCapability.Security.CertificateManagerDialog')) {
        try {
          let uri: string = await certManagerDialog.openInstallCertificateDialog(context, certType, certScope, certData);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(401);
        }
      } else {
        hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200 device not support CertificateManagerDialog');
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0200 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300
     * @tc.number SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300
     * @tc.desc   Call openInstallCertificateDialog with certType CREDENTIAL_UKEY, certScope CURRENT_USER. Return error code 401(CM_ERROR_INVALID_PARAMS).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300 start');
      const context: common.Context = await GlobalContext.getContext();
      let certType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CREDENTIAL_UKEY;
      let certScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.CURRENT_USER;
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      if (canIUse('SystemCapability.Security.CertificateManagerDialog')) {
        try {
          let uri: string = await certManagerDialog.openInstallCertificateDialog(context, certType, certScope, certData);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(401);
        }
      } else {
        hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300 device not support CertificateManagerDialog');
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0300 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400
     * @tc.number SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400
     * @tc.desc   Call openInstallCertificateDialog with certType CREDENTIAL_SYSTEM, certScope CURRENT_USER. Return error code 29700005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400 start');
      const context: common.Context = await GlobalContext.getContext();
      let certType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CREDENTIAL_SYSTEM;
      let certScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.GLOBAL_USER;
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      if (canIUse('SystemCapability.Security.CertificateManagerDialog')) {
        try {
          let uri: string = await certManagerDialog.openInstallCertificateDialog(context, certType, certScope, certData);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400 failed. Code: ${error.code}, message: ${error.message}`);
          expect(error.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_NOT_COMPLY_SECURITY_POLICY);
        }
      } else {
        hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400 device not support CertificateManagerDialog');
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0400 end');
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500
     * @tc.number SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500
     * @tc.desc   Call openInstallCertificateDialog with certType CA_CERT, certScope NOT_SPECIFIED. Return error code 29700003 if PC device is supported, otherwise return error code 29700004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500 start');
      const context: common.Context = await GlobalContext.getContext();
      let certType: certManagerDialog.CertificateType = certManagerDialog.CertificateType.CA_CERT;
      let certScope: certManagerDialog.CertificateScope = certManagerDialog.CertificateScope.NOT_SPECIFIED;
      let isSupport: boolean = certManagerDialog.supportsCACertDialog();
      let certData: Uint8Array = new Uint8Array([0x30, 0x82, 0x0b, 0xc1, 0x02, 0x01]);
      if (canIUse('SystemCapability.Security.CertificateManagerDialog')) {
        try {
          let uri: string = await certManagerDialog.openInstallCertificateDialog(context, certType, certScope, certData);
          expect(null).assertFail();
        } catch (err) {
          let error: BusinessError = err as BusinessError;
          if (isSupport) {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500: the device supports CA dialog. Code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_OPERATION_FAILED);
          } else {
            hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500: the device don't support CA dialog. Code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(certManagerDialog.CertificateDialogErrorCode.ERROR_DEVICE_NOT_SUPPORTED);
          }
        }
      } else {
        hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500 device not support CertificateManagerDialog');
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_Security_CertManager_OpenInstallCertDialog_Func_Static_0500 end');
      done();
    });
  })
}