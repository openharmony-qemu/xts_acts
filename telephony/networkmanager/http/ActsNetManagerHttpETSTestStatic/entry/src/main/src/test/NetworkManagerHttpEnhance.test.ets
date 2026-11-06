'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, afterEach, afterAll, beforeAll, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let httpRequest = http.createHttp();
let address_baidu = 'https://www.baidu.com';
let address_baidu2 = 'http://www.baidu.com';
let address_post = 'https://www.baidu.com';
let address_post1: string =
  'https://mirrors.huaweicloud.com/ubuntu-cdimage/ubuntu/releases/22.04.5/release/ubuntu-22.04.5-live-server-arm64.iso';

let headerObj: Record<string, string> = { 'Content-Type': 'application/json' };

let httpRequestOptions_post: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000
} as http.HttpRequestOptions;

let httpRequestOptions_resumeFrom_1: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  maxLimit: 510241024,
  resumeFrom: 1,
  resumeTo: 100
};

let httpRequestOptions_resumeFrom_2G: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  resumeFrom: 2147483648
};

let httpRequestOptions_resumeFrom_err: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  resumeFrom: -1
};

let httpRequestOptions_resumeFrom_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  resumeFrom: undefined
};

let httpRequestOptions_resumeFrom_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
};

let httpRequestOptions_clientCert: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: {
    certPath: 'etc/ssl/certs/client.crt',
    keyPath: 'etc/ssl/certs/client.key',
    keyPassword: 'test1234',
    certType: http.CertType.PEM
  }
};

let httpRequestOptions_clientCert_err: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: {
    certPath: 'xxxxxxxx',
    keyPath: 'xxxxxxxx',
    certType: http.CertType.DER
  }
};

let httpRequestOptions_clientCert_emptyObj: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: {
    certPath: '',
    keyPath: '',
    certType: http.CertType.P12
  }
};

let httpRequestOptions_clientCert_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  clientCert: undefined
};

let httpRequestOptions_clientCert_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
};

let httpRequestOptions_dnsOverHttps: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsOverHttps: 'https://dns.alidns.com/dns-query'
};

let httpRequestOptions_dnsOverHttps_emptyStr: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsOverHttps: ''
};

let httpRequestOptions_dnsOverHttps_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsOverHttps: undefined
};

let httpRequestOptions_dnsOverHttps_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
};

let httpRequestOptions_dnsServers: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsServers: ['114.114.115.115:53', '114.114.114.114:53', '8.8.8.8:53']
};

let httpRequestOptions_dnsServers_emptyArr: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsServers: []
};

let httpRequestOptions_dnsServers_undefined: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
  dnsServers: undefined
};

let httpRequestOptions_dnsServers_null: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  extraData: 'MineMine',
  header: headerObj,
  readTimeout: 60000,
  connectTimeout: 60000,
};


function dataSendProgress_on_callback(data: http.DataSendProgressInfo) {
  hilog.info(domain, tag, "dataSendProgress_on_callback receive data: " + JSON.stringify(data));
  let sendSize = data.sendSize;
  let totalSize = data.totalSize;
  hilog.info(domain, tag, "dataSendProgress_on_callback sendSize: " + JSON.stringify(sendSize) +
    " , dataSendProgress_on_callback totalSize: " + JSON.stringify(totalSize));
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

function expectTrue(data: boolean) {
  try {
    expect(data).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

export default function NetworkManagerHttpEnhanceTest(): void {
  beforeAll(async () => {
    hilog.info(domain, tag, 'NetworkManagerHttpEnhanceTest beforeAll start');
    hilog.info(domain, tag, 'NetworkManagerHttpEnhanceTest beforeAll end');
  });

  describe('NetworkManagerHttpEnhanceTest', () => {
    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsServers_static_0600
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsServers_0600
     * @tc.desc   Test request property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHTTPRequestDnsServers_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHTTPRequestDnsServers_static_0600";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          httpRequest.requestInStream(address_baidu, httpRequestOptions_dnsServers_emptyArr).then((data) => {
            hilog.info(domain, tag, `${caseName} request succeed, data: ${JSON.stringify(data)}`);
            expectTrue(data === 200);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} request failed, err: ${JSON.stringify(err)}`);
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          })
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch error: ${JSON.stringify(error)}`);
          expectTrue(false);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHTTPOnDataSendProgress_static_0100
     * @tc.number SUB_NetworkMgr_HTTP_On_DataSendProgress_0100
     * @tc.desc   http::on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOnDataSendProgress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHTTPOnDataSendProgress_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          httpRequest.onDataSendProgress((data: http.DataSendProgressInfo) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} dataSendProgress DataSendProgressInfo success:" + ${JSON.stringify(data)}`);
            expectTrue(data.sendSize != null);
            expectTrue(data.totalSize != null);
          });

          httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
            if (err!.code !== 0) {
              hilog.info(domain, tag, `${caseName} request failed, err: ${JSON.stringify(err)}`);
              expectFalse();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} on dataSendProgress success, data: ${JSON.stringify(data)}`);
              expectTrue(data!.responseCode == 200);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          });

        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch error: ${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHTTPOnDataSendProgress_static_0400
     * @tc.number SUB_NetworkMgr_HTTP_On_DataSendProgress_0400
     * @tc.desc   http::on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPOnDataSendProgress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHTTPOnDataSendProgress_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          httpRequest.onDataSendProgress(dataSendProgress_on_callback);
          httpRequest.request(address_post, httpRequestOptions_post, (err, data) => {
            if (err!.code !== 0) {
              hilog.info(domain, tag, `${caseName} request failed, err: ${JSON.stringify(err)}`);
              expectFalse();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} on dataSendProgress success, data: ${JSON.stringify(data)}`);
              expectTrue(data!.responseCode == 200);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          })
        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch error: ${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsOverHttps_static_0500
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsOverHttps_0500
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsOverHttps_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHTTPRequestDnsOverHttps_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const httpRequest = http.createHttp();
          const options: http.HttpRequestOptions = httpRequestOptions_dnsOverHttps_emptyStr;
          httpRequest.requestInStream(address_baidu2, options,
            (err: BusinessError | null, responseCode: int | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, `${caseName} request failed, err: ${JSON.stringify(err)}`);
                expectFalse();
                hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} request success, responseCode: ${responseCode}`);
                expectTrue((responseCode as int) === 200);
                hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
                done();
              }
            });

        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch error: ${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsOverHttps_static_0600
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsOverHttps_0600
     * @tc.desc   http::request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHTTPRequestDnsOverHttps_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHTTPRequestDnsOverHttps_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const httpRequest = http.createHttp();
          const options: http.HttpRequestOptions = httpRequestOptions_dnsOverHttps_emptyStr;
          httpRequest.requestInStream(address_baidu2, options).then((data) => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            expectTrue(data == 200);
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch error: ${JSON.stringify(error)}`);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHTTPRequestDnsServers_static_0500
     * @tc.number SUB_NetworkMgr_HTTP_Request_DnsServers_0500
     * @tc.desc   Test request property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHTTPRequestDnsServers_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHTTPRequestDnsServers_static_0500";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          httpRequest.requestInStream(address_baidu, httpRequestOptions_dnsServers_emptyArr,
            (err: BusinessError | null, responseCode: int | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} request failed, err: ${JSON.stringify(err)}`);
                expectTrue(false);
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} request success, responseCode: ${responseCode}`);
                expectTrue((responseCode as int) === 200);
              }
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });

        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch error: ${JSON.stringify(error)}`);
          expectTrue(false);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
  })
};