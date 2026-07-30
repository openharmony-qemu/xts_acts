/*
 *  Copyright (c) 2026 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { GlobalContext } from '../testability/GlobalContext';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

interface CertFileInfo {
  rawPath: string;
  targetName: string;
  key: keyof CertConfig;
}

interface CertConfig {
  caPath: string;
  sigCertPath: string;
  sigKeyPath: string;
  encCertPath: string;
  encKeyPath: string;
}

interface HttpRequestOptionsWithNullEnablePartialChain {
  method: http.RequestMethod;
  sslType: http.SslType
  caPath: string;
  enablePartialChain: null;
}

let cert: string = '-----BEGIN CERTIFICATE-----\n' +
  'MIIB6zCCAY+gAwIBAgIGAXKnMMauMAwGCCqBHM9VAYN1BQAwSTELMAkGA1UEBhMC\n' +
  'Q04xDjAMBgNVBAoTBUdNU1NMMRAwDgYDVQQLEwdQS0kvU00yMRgwFgYDVQQDEw9S\n' +
  'b290Q0EgZm9yIFRlc3QwIhgPMjAxNTEyMzExNjAwMDBaGA8yMDM1MTIzMDE2MDAw\n' +
  'MFowSzELMAkGA1UEBhMCQ04xDjAMBgNVBAoTBUdNU1NMMRAwDgYDVQQLEwdQS0kv\n' +
  'U00yMRowGAYDVQQDExFNaWRkbGVDQSBmb3IgVGVzdDBZMBMGByqGSM49AgEGCCqB\n' +
  'HM9VAYItA0IABA4uB1fiqJjs1uR6bFIrtxvLFuoU0x+uPPxrslzodyTG1Mj9dJpm\n' +
  '4AUjT9q2bL4cj7H73qWJNpwArnZr7fCc3A2jWzBZMBsGA1UdIwQUMBKAEJxp7A+6\n' +
  'GjnFr+gk67KcEgQwGQYDVR0OBBIEEPl/VbQnlDNiplbKb8xdGv8wDwYDVR0TAQH/\n' +
  'BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAMYwDAYIKoEcz1UBg3UFAANIADBFAiA31tn0\n' +
  'qKz6G0YgGjWd6/ULMyqfTzoL82Y7EkvxbOpX/AIhAKCJYkDp62cvbKvj/Njc2dIe\n' +
  '5BN+DGhO5JOhIyo4oWE3\n' +
  '-----END CERTIFICATE-----'
const TLCP_TARGET_URL: string = 'https://smtest.moyufangge.com';
let certConfig: CertConfig | null = null;
const DOMAIN_NUMBER: number = 0xFF00;
const LOG_TAG: string = '[OpenHarmony_HttpDemo]';

let optionsNull: HttpRequestOptionsWithNullEnablePartialChain = {
  method: http.RequestMethod.POST,
  sslType:'TLCP',
  caPath: cert,
  enablePartialChain: null
};

function initCertConfig(context: Context): CertConfig {
  let certConfig: CertConfig = {
    caPath: '',
    sigCertPath: '',
    sigKeyPath: '',
    encCertPath: '',
    encKeyPath: ''
  };
  try {
    const certFiles: CertFileInfo[] = [
      { rawPath: 'WoSign-SM2.crt', targetName: 'WoSign-SM2.crt', key: 'caPath' },
      { rawPath: 'sm2.user1.sig.crt.pem', targetName: 'sm2.user1.sig.crt.pem', key: 'sigCertPath' },
      { rawPath: 'sm2.user1.sig.key.pem', targetName: 'sm2.user1.sig.key.pem', key: 'sigKeyPath' },
      { rawPath: 'sm2.user1.enc.crt.pem', targetName: 'sm2.user1.enc.crt.pem', key: 'encCertPath' },
      { rawPath: 'sm2.user1.enc.key.pem', targetName: 'sm2.user1.enc.key.pem', key: 'encKeyPath' }
    ];

    for (const file of certFiles) {
      const sandboxPath: string = copyToSandBox(file.rawPath, file.targetName, context);
      switch (file.key) {
        case 'caPath':
          certConfig.caPath = sandboxPath;
          break;
        case 'sigCertPath':
          certConfig.sigCertPath = sandboxPath;
          break;
        case 'sigKeyPath':
          certConfig.sigKeyPath = sandboxPath;
          break;
        case 'encCertPath':
          certConfig.encCertPath = sandboxPath;
          break;
        case 'encKeyPath':
          certConfig.encKeyPath = sandboxPath;
          break;
      }
      console.info(`Certificate [${file.targetName}] Copied to: ${sandboxPath}`);
    }

    if (!validateCertConfig(certConfig)) {
      throw new Error("There is an empty certificate path, and the configuration is incomplete.");
    }

    certConfig = certConfig;
    return certConfig;
  } catch (error) {
    const err = error as BusinessError;
    const msg = `Certificate initialization failed.: ${err.message}`;
    console.error(msg);
    return certConfig;
  }
}

function writeFile(path: string, name: string, content: string | ArrayBuffer) {
  if (!fs.accessSync(path)) {
    fs.mkdirSync(path);
  }
  let file = fs.openSync(`${path}/${name}`, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
  fs.writeSync(file.fd, content);
  fs.fsyncSync(file.fd);
  fs.closeSync(file);
}

function copyToSandBox(rawfilePath: string, sandboxFilePath: string, context: Context) {
  try {
    let cacheDir: string = context.cacheDir;
    let file: Uint8Array = context.resourceManager.getRawFileContentSync(rawfilePath);
    if (file != null) {
      writeFile(cacheDir, sandboxFilePath, file.buffer);
    }
    return `${cacheDir}/${sandboxFilePath}`;
  } catch (err) {
    hilog.error(DOMAIN_NUMBER, LOG_TAG,
      `delete file failed with error message message: ${err.message}, code: ${err.code}`);
    return ""
  }
}

function validateCertConfig(config: CertConfig): boolean {
  return !!(config.caPath && config.sigCertPath && config.sigKeyPath && config.encCertPath && config.encKeyPath);
}

export default function HttpRequestTlcpEnablePartialChainTest() {
  describe('HttpRequestTlcpEnablePartialChainTest', () => {
    /**
     * @tc.name   testNetworkMgrHttpRequestTlcpEnablePartialChain0100
     * @tc.number SUB_NetworkMgr_Http_RequestTlcp_EnablePartialChain_0100
     * @tc.desc   Verify that the request succeeds when TLCP enablePartialChain is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpRequestTlcpEnablePartialChain0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestTlcpEnablePartialChain0100";
        console.info(`${caseName} test Start`);
        let context: Context = GlobalContext.getContext().getObject('context') as Context;
        console.info(`context================: ${JSON.stringify(context)}`);
        let certConfig = initCertConfig(context);
        const clientCert: http.ClientCert = {
          certPath: certConfig.sigCertPath,
          keyPath: certConfig.sigKeyPath,
          certType: http.CertType.PEM,
          keyPassword: ''
        };
        const clientEncCert: http.ClientCert = {
          certPath: certConfig.encCertPath,
          keyPath: certConfig.encKeyPath,
          certType: http.CertType.PEM,
          keyPassword: ''
        };
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: { 'Content-Type': 'application/json' },
          sslType: 'TLCP',
          caPath: certConfig?.caPath,
          clientCert: clientCert,
          clientEncCert: clientEncCert,
          enablePartialChain: true
        };
        let httpRequest: http.HttpRequest = http.createHttp();
        try {
          httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} res.responseCode:${JSON.stringify(res.responseCode)}`);
              ExpectTrue(res.responseCode === 200);
              console.info(`${caseName} options.enablePartialChain:${JSON.stringify(options.enablePartialChain)}`);
              ExpectTrue(options.enablePartialChain === true);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      })

    /**
     * @tc.name   testNetworkMgrHttpRequestTlcpEnablePartialChain0200
     * @tc.number SUB_NetworkMgr_Http_RequestTlcp_EnablePartialChain_0200
     * @tc.desc   Verify that the request fails when TLCP enablePartialChain is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpRequestTlcpEnablePartialChain0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestTlcpEnablePartialChain0200";
        console.info(`${caseName} test Start`);

        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: { 'Content-Type': 'application/json' },
          sslType: 'TLCP',
          caPath: certConfig?.caPath,
          enablePartialChain: false
        };
        let httpRequest: http.HttpRequest = http.createHttp();
        try {
          httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code === 2300999);
              console.info(`${caseName} options.enablePartialChain:${JSON.stringify(options.enablePartialChain)}`);
              ExpectTrue(options.enablePartialChain === false);
              done();
            } else {
              console.info(`${caseName} res.responseCode:${JSON.stringify(res.responseCode)}`);
              ExpectTrue(res.responseCode === 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      })

    /**
     * @tc.name   testNetworkMgrHttpRequestTlcpEnablePartialChain0300
     * @tc.number SUB_NetworkMgr_Http_RequestTlcp_EnablePartialChain_0300
     * @tc.desc   Verify that the request succeeds when TLCP enablePartialChain is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpRequestTlcpEnablePartialChain0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestTlcpEnablePartialChain0300";
        console.info(`${caseName} test Start`);
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: { 'Content-Type': 'application/json' },
          sslType: 'TLCP',
          caPath: certConfig?.caPath,
          enablePartialChain: undefined
        };
        let httpRequest: http.HttpRequest = http.createHttp();
        try {
          httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code === 2300999);
              console.info(`${caseName} options.enablePartialChain:${JSON.stringify(options.enablePartialChain)}`);
              ExpectTrue(options.enablePartialChain === undefined);
              done();
            } else {
              console.info(`${caseName} res.responseCode:${JSON.stringify(res.responseCode)}`);
              ExpectTrue(res.responseCode === 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      })

    /**
     * @tc.name   testNetworkMgrHttpRequestTlcpEnablePartialChain0400
     * @tc.number SUB_NetworkMgr_Http_RequestTlcp_EnablePartialChain_0400
     * @tc.desc   Verify that the request succeeds when TLCP enablePartialChain is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpRequestTlcpEnablePartialChain0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestTlcpEnablePartialChain0400";
        console.info(`${caseName} test Start`);
        let httpRequest: http.HttpRequest = http.createHttp();
        try {
          httpRequest.request(TLCP_TARGET_URL, optionsNull, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code === 2300999);
              console.info(`${caseName} optionsNull.enablePartialChain:${JSON.stringify(optionsNull.enablePartialChain)}`);
              ExpectTrue(optionsNull.enablePartialChain === null);
              done();
            } else {
              console.info(`${caseName} res.responseCode:${JSON.stringify(res.responseCode)}`);
              ExpectTrue(res.responseCode === 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      })

    /**
     * @tc.name   testNetworkMgrHttpRequestTlcpEnablePartialChain0500
     * @tc.number SUB_NetworkMgr_Http_RequestTlcp_EnablePartialChain_0500
     * @tc.desc   Verify that the request succeeds when TLCP enablePartialChain is not set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpRequestTlcpEnablePartialChain0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestTlcpEnablePartialChain0500";
        console.info(`${caseName} test Start`);
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: { 'Content-Type': 'application/json' },
          sslType: 'TLCP',
          caPath: certConfig?.caPath
        };
        let httpRequest: http.HttpRequest = http.createHttp();
        try {
          httpRequest.request(TLCP_TARGET_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code === 2300999);
              done();
            } else {
              console.info(`${caseName} res.responseCode:${JSON.stringify(res.responseCode)}`);
              ExpectTrue(res.responseCode === 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      })
  })
}