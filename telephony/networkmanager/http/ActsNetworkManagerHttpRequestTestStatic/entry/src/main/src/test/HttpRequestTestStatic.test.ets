/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

let domain: Int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'httpRequestStatic'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";
const ADDR_TEST_ILLEGAL: string = "abc";


export default function HttpRequestTestStatic() {
  describe('HttpRequestTestStatic',  () => {

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_RequestInStream_0100
     * @tc.name:    testNetworkMgrHttpRequestInStream_static_0100
     * @tc.desc:    test requestInStream
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 0
     */
    it("testNetworkMgrHttpRequestInStream_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrHttpRequestInStream_static_0100";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void> | null, data: Int | undefined) => {
              if (err?.code !== 0) {
                hilog.error(domain, tag, `${caseName} requestInStream fail err: ${JSON.stringify(err)}`);
                expect().assertFail();
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, `${caseName} requestInStream success ${JSON.stringify(data)}`);
                expect(true).assertEqual(data === 200);
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_RequestInStream_0300
     * @tc.name:    testNetworkMgrHttpRequestInStream_static_0300
     * @tc.desc:    test requestInStream
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 0
     */
    it("testNetworkMgrHttpRequestInStream_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrHttpRequestInStream_static_0300";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: Int): PromiseLike<void> => {
              hilog.info(domain, tag, `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
              expect(true).assertEqual(data === 200);
              httpRequest.destroy();
              done();
            }).catch((err: Error): PromiseLike<void>|undefined => {
              hilog.info(domain, tag, `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
              expect().assertFail();
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_RequestInStream_0200
     * @tc.name:    testHttpRequestInStream_static_0200
     * @tc.desc:    test requestInStream with destory httpRequest
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it("testHttpRequestInStream_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestInStream_static_0200";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.destroy();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError<void> | null, data: Int | undefined) => {
              if (err?.code !== 0) {
                hilog.error(domain, tag, `${caseName} destory httpRequest and requestStream fail err ${JSON.stringify(err)}`);
                expect(true).assertEqual(err?.code === 2300999);
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, `${caseName} destory httpRequest and requestStream success ${JSON.stringify(data)}`);
                expect().assertFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        console.error(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_RequestInStream_0400
     * @tc.name:    testHttpRequestInStream_static_0400
     * @tc.desc:    test requestInStream with destroy httpRequest
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it("testHttpRequestInStream_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestInStream_static_0400";
      hilog.info(domain, tag, `${caseName} test Start`);
      let httpRequest: http.HttpRequest = http.createHttp();
      try {
        connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            httpRequest.destroy();
            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: Int): PromiseLike<void> => {
              hilog.info(domain, tag, `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
              expect().assertFail();
              httpRequest.destroy();
              done();
            }).catch((err: BusinessError): PromiseLike<void>|undefined => {
              hilog.error(domain, tag, `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
              expect(true).assertEqual(err?.code === 2300999);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_RequestInStream_0500
     * @tc.name  :  testHttpRequestInStream_static_0500
     * @tc.desc  :  test requestInStream with illegal url
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it("testHttpRequestInStream_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestInStream_static_0500";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_ILLEGAL, (err: BusinessError<void> | null, data: Int | undefined) => {
              if (err?.code !== 0) {
                hilog.error(domain, tag, `${caseName}  requestInStream fail err ${JSON.stringify(err)}`);
                expect(true).assertEqual(err?.code === 2300006);
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, `${caseName}  requestInStream success ${JSON.stringify(data)}`);
                expect().assertFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /*
     * @tc.number:  SUB_NetworkMgr_Http_RequestInStream_0600
     * @tc.name  :  testHttpRequestInStream_static_0600
     * @tc.desc  :  test requestInStream with illegal url
     * @tc.size  :  MediumTest
     * @tc.type  :  Function
     * @tc.level :  level 2
     */
    it("testHttpRequestInStream_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestInStream_static_0600";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.requestInStream(ADDR_TEST_ILLEGAL, (err: BusinessError<void> | null, data: Int | undefined) => {
              if (err?.code !== 0) {
                hilog.error(domain, tag, `${caseName}  requestInStream fail err ${JSON.stringify(err)}`);
                expect(true).assertEqual(err?.code === 2300006);
                httpRequest.destroy();
                done();
              } else {
                hilog.info(domain, tag, `${caseName}  requestInStream success ${JSON.stringify(data)}`);
                expect().assertFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });


  });
}