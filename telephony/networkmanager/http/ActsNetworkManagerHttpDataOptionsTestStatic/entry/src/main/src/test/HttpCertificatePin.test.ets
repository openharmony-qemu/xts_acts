'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const baiduUrl: string = "https://www.baidu.com";
const baiduPinRight: string = 'Q6TCQAWqP4t+eq41xnKaUgJdrPWqyG5L+Ni2YzMhqdY=';
const baiduPinWrong: string = 'AAAAQAWqP4t+eq41xnKaUgJdrPWqyG5L+Ni2YzMhqdY=';

let headerObj: Record<string, string> = { 'content-type': 'application/json' };

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', ` exportFail failed err: ${JSON.stringify(err)}`);
  }
};


export default function HttpCertificatePinTest(): void {
  describe('HttpCertificatePinTest', () => {


    /**
     * @tc.name   testHttpCertificatePin_static_0100
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0100
     * @tc.desc   test certificatePin with wrong baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpCertificatePin_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
          }
          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.request(baiduUrl, requestOptions,
            (err: BusinessError | null, data: http.HttpResponse | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', "HTTP Request error: " + JSON.stringify(err));
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', "HTTP Request data: " + JSON.stringify(data));
                httpRequest.destroy();
                done();
              }
            })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testHttpCertificatePin_static_0200
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0200
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: { publicKeyHash: baiduPinRight, hashAlgorithm: 'SHA-256' },
          }

          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.request(baiduUrl, requestOptions,
            (err: BusinessError | null, data: http.HttpResponse | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', "HTTP Request error: " + JSON.stringify(err));
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', "HTTP Request data: " + JSON.stringify(data));
                httpRequest.destroy();
                done();
              }
            })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });
    /**
     * @tc.name   testHttpCertificatePin_static_0300
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0300
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: [],
          }

          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.request(baiduUrl, requestOptions,
            (err: BusinessError | null, data: http.HttpResponse | undefined) => {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', "HTTP Request error: " + JSON.stringify(err));
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', "HTTP Request data: " + JSON.stringify(data));
                httpRequest.destroy();
                done();
              }
            })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });
    /**
     * @tc.name   testHttpCertificatePin_static_0400
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0400
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: [],
          }

          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.request(baiduUrl, requestOptions).then((res) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: --- ${JSON.stringify(res)}`);
            httpRequest.destroy();
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR: ${JSON.stringify(err)}`);
            ExpectFail();
            httpRequest.destroy();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testHttpCertificatePin_static_0500
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0500
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: [],
          }

          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.requestInStream(baiduUrl, requestOptions, (err: BusinessError | null, data: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', "HTTP Request error: " + JSON.stringify(err));
              httpRequest.destroy();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', "HTTP Request data: " + JSON.stringify(data));
              httpRequest.destroy();
              done();
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testHttpCertificatePin_static_0600
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0600
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: [],
          }

          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.requestInStream(baiduUrl, requestOptions).then((res) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: --- ${JSON.stringify(res)}`);
            httpRequest.destroy();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR: ${JSON.stringify(err)}`);
            ExpectFail();
            httpRequest.destroy();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testHttpCertificatePin_static_0700
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0700
     * @tc.desc   test certificatePin with wrong baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpCertificatePin_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
          }
          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers");
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.requestInStream(baiduUrl, requestOptions, (err: BusinessError | null, data: int | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} HTTP Request error: ${JSON.stringify(err)}`);
              httpRequest.destroy();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} HTTP Request data: ${JSON.stringify(err)}`);

              httpRequest.destroy();
              done();
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testHttpCertificatePin_static_0800
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0800
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
          }
          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers", JSON.stringify(data));
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.requestInStream(baiduUrl, requestOptions).then((res) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: --- ${JSON.stringify(res)}`);
            httpRequest.destroy();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR: ${JSON.stringify(err)}`);
            httpRequest.destroy();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testHttpCertificatePin_static_0900
     * @tc.number SUB_NetworkMgr_Http_CertificatePin_0900
     * @tc.desc   test certificatePin with correct baidu's PIN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpCertificatePin_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpCertificatePin_static_0900';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let requestOptions: http.HttpRequestOptions = {
            usingProtocol: http.HttpProtocol.HTTP1_1,
            header: headerObj,
            certificatePinning: { publicKeyHash: baiduPinWrong, hashAlgorithm: 'SHA-256' }
          }
          httpRequest.onHeadersReceive((data: Object) => {
            hilog.info(domain, tag, '%{public}s', "Rcv headers", JSON.stringify(data));
          });
          httpRequest.onDataEnd(() => {
            hilog.info(domain, tag, '%{public}s', "Rcv data end");
          });
          httpRequest.request(baiduUrl, requestOptions).then((res) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: --- ${JSON.stringify(res)}`);
            httpRequest.destroy();
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR: ${JSON.stringify(err)}`);
            httpRequest.destroy();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });
  });
}

