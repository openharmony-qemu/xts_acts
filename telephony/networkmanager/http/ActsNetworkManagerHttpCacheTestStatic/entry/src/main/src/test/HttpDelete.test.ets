'use static'
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeEach, afterEach} from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test sucess`);
  }
}

export default function HttpDeleteTest(): void {

  describe("HttpDeleteTest", (): void => {

    hilog.info(domain, tag, '%{public}s', 'describe start');
    let httpResponseCache: http.HttpResponseCache | undefined;
    let httpRequest: http.HttpRequest | undefined;

    beforeEach(async () => {
      httpRequest = http.createHttp();
      httpResponseCache = await http.createHttpResponseCache();
      hilog.info(domain, tag, `httpRequest and httpResponseCache create success`);
    })

    afterEach(async () => {
      httpRequest!.destroy();
      hilog.info(domain, tag, `httpRequest and httpResponseCache delete success`);
    })

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheDelete_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Delete_0100
     * @tc.desc   Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ': Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + '  Network connected ');
              httpResponseCache!.delete((err: BusinessError<void> | null) => {
                if (err?.code != 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                  ExpectFail();
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': delete success httpResponseCache ->' + JSON.stringify(httpResponseCache));
                  ExpectTrue(true);
                  done();
                }
              });
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheDelete_static_0200
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Delete_0200
     * @tc.desc   Disable cache and delete data within it.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ': Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + '  Network connected ');
              httpResponseCache!.delete().then(() => {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ' delete success httpResponseCache , httpResponseCache ');
                ExpectTrue(true);
                done();
              }).catch((error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  delete get error is ' + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End `);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheDelete_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Delete_0300
     * @tc.desc   Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete_static_0300';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ': Please connect to the network');
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + '  Network connected ');
              let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(undefined);
              httpResponseCache!.delete((err: BusinessError<void> | null) => {
                if (err?.code != 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': delete success httpResponseCache ->' + JSON.stringify(httpResponseCache));
                  ExpectTrue(httpResponseCache !== undefined);
                  done();
                }
              });
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheDelete_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Delete_0400
     * @tc.desc   Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ': Please connect to the network');
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + '  Network connected ');
              ExpectTrue(typeof httpResponseCache === 'object');
              httpResponseCache!.delete((err: BusinessError<void> | null) => {
                if (err?.code != 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + ': delete success httpResponseCache ->' + JSON.stringify(httpResponseCache));
                  ExpectTrue(httpResponseCache !== undefined);
                  done();
                }
              });
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheDelete_static_0301
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Delete_0301
     * @tc.desc   Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete_static_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete_static_0301';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err?.code !== 0) {
                    hilog.info(domain, tag, '%{public}s',
                      `${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                    httpResponseCache!.flush((err: BusinessError | null) => {
                      if (err?.code !== 0) {
                        hilog.info(domain, tag, '%{public}s', `${caseName} flush err: ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpResponseCache!.delete((err: BusinessError | null) => {
                          if (err?.code !== 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} delete err: ${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                          } else {
                            httpRequest!.request(XTS_TEST_HTTP_URL,
                              (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                if (err?.code !== 0) {
                                  hilog.info(domain, tag, '%{public}s',
                                    `${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                                  ExpectFail();
                                  done();
                                } else {
                                  hilog.info(domain, tag, '%{public}s',
                                    `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                  hilog.info(domain, tag, '%{public}s',
                                    `${caseName} secondResponse tcpTiming ${data?.performanceTiming?.tcpTiming}`);
                                  ExpectTrue(data?.performanceTiming?.tcpTiming == 0);
                                  done();
                                }
                              });
                          }
                        });
                      }
                    });
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheDelete_static_0401
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Delete_0401
     * @tc.desc   Disable cache and delete data within it.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheDelete_static_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheDelete_static_0401';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, '%{public}s',
                      `${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                    httpResponseCache!.flush((err: BusinessError | null) => {
                      if (err!.code !== 0) {
                        hilog.info(domain, tag, '%{public}s', `${caseName} flush err: ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, '%{public}s',
                                `${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag, '%{public}s',
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                              hilog.info(domain, tag, '%{public}s',
                                `${caseName} secondResponse tcpTiming ${data?.performanceTiming?.tcpTiming}`);
                              httpResponseCache!.delete((err: BusinessError | null) => {
                                if (err!.code !== 0) {
                                  hilog.info(domain, tag, '%{public}s',
                                    `${caseName} delete err: ${JSON.stringify(err)}`);
                                  ExpectFail();
                                  done();
                                } else {
                                  httpRequest!.request(XTS_TEST_HTTP_URL,
                                    (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                      if (err!.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                          `${caseName} thirdResponse failed err: ${JSON.stringify(err)}`);
                                        ExpectFail();
                                        done();
                                      } else {
                                        hilog.info(domain, tag, '%{public}s',
                                          `${caseName} thirdResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                        hilog.info(domain, tag, '%{public}s',
                                          `${caseName} thirdResponse tcpTiming ${data?.performanceTiming?.tcpTiming}`);
                                        ExpectTrue(data?.performanceTiming?.tcpTiming == 0);
                                        done();
                                      }
                                    });
                                }
                              });
                            }
                          });
                      }
                    });
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
      });


  })

}
