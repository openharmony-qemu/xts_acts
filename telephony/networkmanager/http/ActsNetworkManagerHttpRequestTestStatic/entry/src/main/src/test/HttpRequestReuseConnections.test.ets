'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let headers: Record<string, string> = {
  'Content-Type': 'application/json'
};

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export default function HttpRequestReuseConnectionsTest(): void {
  describe('HttpRequestReuseConnectionsTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest_static_0100
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0100
     * @tc.desc   Write a parameter with `reuseConnections` set to `true` for stream multiplexing for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest_static_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest_static_0100';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: headers,
          reuseConnections: true,
        };
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`+JSON.stringify(error));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, options,(err: BusinessError<void> | null, data: http.HttpResponse | undefined)  => {
              if (err?.code != 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError | null) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL,options, (err: BusinessError<void> | null, data: http.HttpResponse | undefined)  => {
                      if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
                        ExpectTrue(options.reuseConnections == true);
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                        httpRequest.destroy();
                        done();
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
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest_static_0200
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0200
     * @tc.desc   Write a parameter with `reuseConnections` set to `false` for no stream multiplexing for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest_static_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest_static_0200';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: headers,
          reuseConnections: false,
        };
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`+JSON.stringify(error));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, options,(err: BusinessError<void> | null, data: http.HttpResponse | undefined)  => {
              if (err?.code != 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError | null) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL,options, (err: BusinessError<void> | null, data: http.HttpResponse | undefined)  => {
                      if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
                        ExpectTrue(options.reuseConnections == false);
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        const tcpTiming = data?.performanceTiming?.tcpTiming;
                        const isTcpTimingValid = tcpTiming !== undefined && tcpTiming > 0;
                        ExpectTrue(isTcpTimingValid);
                        httpRequest.destroy();
                        done();
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
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest_static_0300
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0300
     * @tc.desc   Write a parameter with `reuseConnections` set to `undefined` for no stream multiplexing for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest_static_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest_static_0300';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: headers,
          reuseConnections: undefined,
        };
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`+JSON.stringify(error));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL, options,(err: BusinessError<void> | null, data: http.HttpResponse | undefined)  => {
              if (err?.code != 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                httpResponseCache.flush((err: BusinessError | null) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} flush fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest.request(XTS_TEST_HTTP_URL,options, (err: BusinessError<void> | null, data: http.HttpResponse | undefined)  => {
                      if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
                        ExpectTrue(options.reuseConnections == undefined);
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                        hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                        ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                        httpRequest.destroy();
                        done();
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
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest_static_0400
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0400
     * @tc.desc   Write a parameter with `reuseConnections` set to `true` for stream multiplexing for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest_static_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest_static_0400';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: headers,
          reuseConnections: true,
        };
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`+JSON.stringify(error));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush(() => {});
            }).catch((err: Error) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
                ExpectTrue(options.reuseConnections == true);
                hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest_static_0500
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0500
     * @tc.desc   Write a parameter with `reuseConnections` set to `false` for no stream multiplexing for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest_static_0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest_static_0500';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: headers,
          reuseConnections: false,
        };
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network, error:${JSON.stringify(error)}`);
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush(() => {});
            }).catch((err: Error) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
                ExpectTrue(options.reuseConnections == false);
                hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming > 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestReuseConnectionsTest_static_0600
     * @tc.number SUB_NetworkMgr_Http_Reuse_Connections_0600
     * @tc.desc   Write a parameter with `reuseConnections` set to `undefined` for no stream multiplexing for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestReuseConnectionsTest_static_0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestReuseConnectionsTest_static_0600';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: headers,
          reuseConnections: undefined,
        };
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`, JSON.stringify(error));
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
              httpResponseCache.flush(() => {});
            }).catch((err: Error) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            });
            const secondRequest: () => void = () => {
              httpRequest.request(XTS_TEST_HTTP_URL,options).then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
                ExpectTrue(options.reuseConnections == undefined);
                hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                hilog.info(domain, tag, '%{public}s', `${caseName} secondResponse tcpTiming ${data?.performanceTiming.tcpTiming}`);
                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              });
            }
            setTimeout(() => {
              secondRequest();
            }, 10000);
          }
        });
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} try...catch err: ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
  });
}

