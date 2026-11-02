'use static'
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import hilog from '@ohos.hilog';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const BASE_URL = "https://146.56.217.118:7808";
const EMPTY_MSG = "__SNI_EMPTY__";
const SLEEP_TIME = 3000;
interface ResponseData {
  sni: string
}

export function expectFail (info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('${info} test failed');
  }
}
export function expectTrue (exp:boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    console.info('${info} test failed');
  }
}

export default function SniTest(): void {
  describe('SniTest', () => {

    /**
     * @tc.name    testRequestWithSni_static_1700
     * @tc.number  SUB_Request_WITH_SNI_1700
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testRequestWithSni_static_1700';
      await Utils.msSleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: true,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'lalala'
      };
      try {
        const responseCode: number = await httpRequest.requestInStream(BASE_URL, options);
        hilog.info(domain, tag, '%{public}s', `${caseName} request success: ${JSON.stringify(responseCode)}`);
        expect(responseCode).assertEqual(http.ResponseCode.OK);
        if (responseCode === http.ResponseCode.OK) {
          const responseData: string = String(responseCode);
          hilog.info(domain, tag, '%{public}s', `${caseName} responseData success: ${JSON.stringify(responseData)}`);
          expectTrue(responseData === "200");
          httpRequest.destroy();
          done();
        }
      } catch (error) {
        console.error(`${caseName} request failed: ${error.message}`);
        httpRequest.destroy();
        expect(true).assertEqual(false);
        done();
      }
    });

    /**
     * @tc.name    testRequestWithSni_static_1900
     * @tc.number  SUB_Request_WITH_SNI_1900
     * @tc.desc    Test parameters "",TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testRequestWithSni_static_1900';
      await Utils.msSleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation: 'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.OBJECT,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      try {
        const responseCode: number = await httpRequest.requestInStream(BASE_URL, options);
        hilog.info(domain, tag, '%{public}s', `${caseName} request success: ${JSON.stringify(responseCode)}`);
        expect(responseCode).assertEqual(http.ResponseCode.OK);
        if (responseCode === http.ResponseCode.OK) {
          const responseData: string = String(responseCode);
          hilog.info(domain, tag, '%{public}s', `${caseName} responseData success: ${JSON.stringify(responseData)}`);
          expectTrue(responseData === "200");
          httpRequest.destroy();
          done();
        }
      } catch (error) {
        console.error(`${caseName} request failed: ${error.message}`);
        httpRequest.destroy();
        expect(true).assertEqual(false);
        done();
      }
    });
    /**
     * @tc.name    testRequestWithSni_static_2000
     * @tc.number  SUB_Request_WITH_SNI_2000
     * @tc.desc    Test parameters "",TLSv1.2.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testRequestWithSni_static_2000';
      await Utils.msSleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation: 'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_0
        },
        expectDataType: http.HttpDataType.ARRAY_BUFFER,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: 'example-b1.test'
      };
      try {
        const responseCode: number = await httpRequest.requestInStream(BASE_URL, options);
        hilog.info(domain, tag, '%{public}s', `${caseName} request success: ${JSON.stringify(responseCode)}`);
        expect(responseCode).assertEqual(http.ResponseCode.OK);
        if (responseCode === http.ResponseCode.OK) {
          const responseData: string = String(responseCode);
          hilog.info(domain, tag, '%{public}s', `${caseName} responseData success: ${JSON.stringify(responseData)}`);
          expectTrue(responseData === "200");
          httpRequest.destroy();
          done();
        }
      } catch (error) {
        console.error(`${caseName} request failed: ${error.message}`);
        httpRequest.destroy();
        expect(true).assertEqual(false);
        done();
      }
    });
    /**
     * @tc.name    testRequestWithSni_static_2100
     * @tc.number  SUB_Request_WITH_SNI_2100
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testRequestWithSni_static_2100';
      await Utils.msSleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.STRING,
        usingCache: true,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.requestInStream(BASE_URL, options, (err, data) => {
        hilog.info(domain, tag, '%{public}s', `${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data).assertEqual(http.ResponseCode.OK);
        if (data) {
          let responseData: string = String(data);
          try {
            hilog.info(domain, tag, '%{public}s', `${caseName} responseData success: ${JSON.stringify(responseData)}`);
            expectTrue(responseData == "200");
          } catch (e) {
            hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(data)}`);
          }
        }
        httpRequest.destroy();
      });
      done()
    });
    /**
     * @tc.name    testRequestWithSni_static_2200
     * @tc.number  SUB_Request_WITH_SNI_2200
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testRequestWithSni_static_2200';
      await Utils.msSleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.OBJECT,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.requestInStream(BASE_URL, options, (err, data) => {
        hilog.info(domain, tag, '%{public}s', `${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data).assertEqual(http.ResponseCode.OK);
        if (data) {
          let responseData: string = String(data);
          try {
            hilog.info(domain, tag, '%{public}s', `${caseName} responseData success: ${JSON.stringify(responseData)}`);
            expectTrue(responseData == "200");
          } catch (e) {
            hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(data)}`);
          }
        }
        httpRequest.destroy();
      });
      done()
    });
    /**
     * @tc.name    testRequestWithSni_static_2300
     * @tc.number  SUB_Request_WITH_SNI_2300
     * @tc.desc    Test parameters '.',TLSv1.1.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('testRequestWithSni_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testRequestWithSni_static_2300';
      await Utils.msSleep(SLEEP_TIME);
      let httpRequest = http.createHttp();
      let options: http.HttpRequestOptions = {
        method: http.RequestMethod.GET,
        remoteValidation:'skip',
        tlsOptions: {
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
          tlsVersionMin: http.TlsVersion.TLS_V_1_1
        },
        expectDataType: http.HttpDataType.ARRAY_BUFFER,
        usingCache: false,
        readTimeout: 30000,
        connectTimeout: 15000,
        sniHostName: ''
      };
      httpRequest.requestInStream(BASE_URL, options, (err, data) => {
        hilog.info(domain, tag, '%{public}s', `${caseName} request success: ${JSON.stringify(data)}`);
        if (err) {
          console.error('HTTP request failed:', err);
          expect(true).assertEqual(false);
          return;
        }
        expect(data).assertEqual(http.ResponseCode.OK);
        if (data) {
          let responseData: string = String(data);
          try {
            hilog.info(domain, tag, '%{public}s', `${caseName} responseData success: ${JSON.stringify(responseData)}`);
            expectTrue(responseData == "200");
          } catch (e) {
            hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(data)}`);
          }
        }
        httpRequest.destroy();
      });
      done()
    });
  });
}

