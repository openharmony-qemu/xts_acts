/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

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

  export default function HttpRequestGmssl() {
    describe('HttpRequestGmssl', () => {
    /* *
    * @tc.number:  SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0100
    * @tc.name:    testNetworkMgrHttpRequestGmsslHttpRequestOptions0100
    * @tc.desc:    test performanceTiming
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 2
    */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0100";
        console.info(`${caseName} test Start`);
        let clientCert: http.ClientCert = {
            certPath: '',
            keyPath:'',
            certType: http.CertType.PEM,
            keyPassword: ''
          };
          let clientEncCert: http.ClientCert = {
            certPath: '',
            keyPath: '',
            certType: http.CertType.PEM,
            keyPassword: ''
          };
          let sslType: http.SslType = 'TLS';
          let options: http.HttpRequestOptions = {
            sslType,
            caPath: '',
            clientCert,
            clientEncCert,
          };
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com", options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
              ExpectTrue(res.responseCode == 200);
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
      });   
    })
}
