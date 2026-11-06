'use static'
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

import { describe, expect, beforeEach, afterEach, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

let domain: int = 0x000;
let tag: string = 'HttpFlushTest';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export default function HttpFlushTest(): void {
  describe('HttpFlushTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    let XTS_TEST_SECOND_HTTP_URL: string = 'https://openharmony.cn/HomePage';
    let httpResponseCache: http.HttpResponseCache | undefined;
    let httpRequest: http.HttpRequest | undefined;

    beforeEach(async () => {
      httpRequest = http.createHttp();
      httpResponseCache = await http.createHttpResponseCache();
      hilog.info(domain, tag, `httpRequest and httpResponseCache create success`);
    })

    afterEach(async () => {
      await httpResponseCache!.delete();
      httpRequest!.destroy();
      hilog.info(domain, tag, `httpRequest and httpResponseCache delete success`);
    })

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0100
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0100
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpResponseCache!.flush((err: BusinessError | null) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, `${caseName} flush failed ${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} failed err: ${JSON.stringify(err)}`);
                  ExpectTrue(true);
                  done();
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0200
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0200
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpResponseCache!.flush((error) => {
                if (error!.code !== 0) {
                  hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(error)}`);
                  ExpectFail();
                  done();
                } else {

                  ExpectTrue(true);
                  done();
                }
              })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0300
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0300
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} request fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((err: BusinessError | null) => {
                      if (err!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err:${JSON.stringify(err)}`);

                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              ExpectTrue(data!.performanceTiming.tcpTiming == 0);
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
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0400
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0400
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0400';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((err: BusinessError | null) => {
                      if (err!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err:${JSON.stringify(err)}`);

                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              httpRequest!.request(XTS_TEST_HTTP_URL,
                                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                  if (err!.code !== 0) {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse fail err:${JSON.stringify(err)}`);

                                    ExpectFail();
                                    done();
                                  } else {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                    ExpectTrue(data!.performanceTiming.tcpTiming == 0);
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
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0500
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0500
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0500';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((err: BusinessError | null) => {
                      if (err!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              httpRequest!.request(XTS_TEST_HTTP_URL,
                                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                  if (err!.code !== 0) {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse fail err:${JSON.stringify(err)}`);
                                    ExpectFail();
                                    done();
                                  } else {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                    httpRequest!.request(XTS_TEST_HTTP_URL,
                                      (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                        if (err!.code !== 0) {
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse fail err:${JSON.stringify(err)}`);

                                          ExpectFail();
                                          done();
                                        } else {
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                          ExpectTrue(data!.performanceTiming.tcpTiming == 0);
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
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0600
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0600
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  }
                  hilog.info(domain, tag,
                    `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                  httpResponseCache!.flush((err: BusinessError | null) => {
                    if (err!.code !== 0) {
                      hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(err)}`);
                      ExpectFail();
                      done();
                    } else {
                      httpRequest!.request(XTS_TEST_HTTP_URL,
                        (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                          if (err!.code !== 0) {
                            hilog.info(domain, tag, `${caseName} secondResponse fail err:${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                          } else {
                            hilog.info(domain, tag,
                              `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                            hilog.info(domain, tag,
                              `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                            httpRequest!.request(XTS_TEST_HTTP_URL,
                              (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                if (err!.code !== 0) {
                                  hilog.info(domain, tag, `${caseName} thirdResponse fail err:${JSON.stringify(err)}`);
                                  ExpectFail();
                                  done();
                                } else {
                                  hilog.info(domain, tag,
                                    `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                  hilog.info(domain, tag,
                                    `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                  httpRequest!.request(XTS_TEST_HTTP_URL,
                                    (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                      if (err!.code !== 0) {
                                        hilog.info(domain, tag,
                                          `${caseName} fourthResponse fail err:${JSON.stringify(err)}`);
                                        ExpectFail();
                                        done();
                                      } else {
                                        hilog.info(domain, tag,
                                          `${caseName} fourthResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                        hilog.info(domain, tag,
                                          `${caseName} fourthResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                        httpRequest!.request(XTS_TEST_HTTP_URL,
                                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                            if (err!.code !== 0) {
                                              hilog.info(domain, tag,
                                                `${caseName} fifthResponse fail err:${JSON.stringify(err)}`);
                                              ExpectFail();
                                              done();
                                            } else {
                                              hilog.info(domain, tag,
                                                `${caseName} fifthResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                              hilog.info(domain, tag,
                                                `${caseName} fifthResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                              ExpectTrue(data!.performanceTiming.tcpTiming == 0);
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
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0800
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0800
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL).then((data) => {
                hilog.info(domain, tag,
                  `${caseName} firstResponse data performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                httpResponseCache!.flush(() => {
                });
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
              httpRequest!.request(XTS_TEST_SECOND_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    hilog.info(domain, tag,
                      `${caseName} secondResponse tcpTiming ${data!.performanceTiming!.tcpTiming}`);
                    ExpectTrue(data!.performanceTiming!.tcpTiming > 0);
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush0900
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0900
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush0900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((error) => {
                      if (error!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(error)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();

                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                              done();
                            }
                          });
                      }
                    })
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1000
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1000
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1000';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((error) => {
                      if (error!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              httpRequest!.request(XTS_TEST_HTTP_URL,
                                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                  if (err!.code !== 0) {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                                    ExpectFail();

                                    done();
                                  } else {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                    ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                                    done();
                                  }
                                });
                            }
                          });
                      }
                    })
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1100
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1100
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((error) => {
                      if (error!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(error)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              httpRequest!.request(XTS_TEST_HTTP_URL,
                                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                  if (err!.code !== 0) {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                                    ExpectFail();
                                    done();
                                  } else {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                    httpRequest!.request(XTS_TEST_HTTP_URL,
                                      (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                        if (err!.code !== 0) {
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse fail err : ${JSON.stringify(err)}`);
                                          ExpectFail();

                                          done();
                                        } else {
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                          ExpectTrue(data!.performanceTiming.tcpTiming == 0);

                                          // httpRequest!.destroy();
                                          done();
                                        }
                                      });
                                  }
                                });
                            }
                          });
                      }
                    })
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1200
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1200
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {

                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((error) => {
                      if (error!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(error)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();
                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              httpRequest!.request(XTS_TEST_HTTP_URL,
                                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                  if (err!.code !== 0) {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                                    ExpectFail();
                                    done();
                                  } else {
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                    hilog.info(domain, tag,
                                      `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                    httpRequest!.request(XTS_TEST_HTTP_URL,
                                      (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                        if (err!.code !== 0) {
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse fail err : ${JSON.stringify(err)}`);
                                          ExpectFail();
                                          done();
                                        } else {
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                          hilog.info(domain, tag,
                                            `${caseName} fourthResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                          httpRequest!.request(XTS_TEST_HTTP_URL,
                                            (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                              if (err!.code !== 0) {
                                                hilog.info(domain, tag,
                                                  `${caseName} fifthResponse fail err : ${JSON.stringify(err)}`);
                                                ExpectFail();

                                                done();
                                              } else {
                                                hilog.info(domain, tag,
                                                  `${caseName} fifthResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                                hilog.info(domain, tag,
                                                  `${caseName} fifthResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                                ExpectTrue(data!.performanceTiming.tcpTiming == 0);
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
                    })
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1300
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1300
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_SECOND_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} request success data : ${JSON.stringify(JSON.stringify(data))}`);
                    httpRequest!.request(XTS_TEST_HTTP_URL, (err: BusinessError | null) => {
                      if (err!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpResponseCache!.flush((error) => {
                          if (error!.code !== 0) {
                            hilog.info(domain, tag, `${caseName} flush fail err:${JSON.stringify(error)}`);
                            ExpectFail();
                            done();
                          } else {
                            httpRequest!.request(XTS_TEST_SECOND_HTTP_URL);
                            httpRequest!.request(XTS_TEST_HTTP_URL,
                              (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                                if (err!.code !== 0) {
                                  hilog.info(domain, tag, `${caseName} baidu fail err : ${JSON.stringify(err)}`);
                                  ExpectFail();

                                  done();
                                } else {
                                  hilog.info(domain, tag,
                                    `${caseName} baidu tcpTiming: ${data!.performanceTiming.tcpTiming}`);
                                  ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                                  done();
                                }
                              });
                          }
                        })
                      }
                    });
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1400
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1400
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1400';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL).then((data) => {
                hilog.info(domain, tag,
                  `${caseName} first data.performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                httpResponseCache!.flush().then().catch((err) => {
                  hilog.info(domain, tag, `${caseName} flush fail err.code:${JSON.stringify(err.code)}`);
                  ExpectFail();
                  done();
                });
                // httpRequest!.request(XTS_TEST_SECOND_HTTP_URL,
                httpRequest!.request('https://developer.huawei.com/consumer/cn/',
                  (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                    if (err!.code !== 0) {
                      hilog.info(domain, tag, `${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                      ExpectFail();

                      done();
                    } else {
                      hilog.info(domain, tag, `${caseName} secondResponse data ${JSON.stringify(data)}`);
                      hilog.info(domain, tag,
                        `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                      hilog.info(domain, tag,
                        `${caseName} secondResponse tcpTiming ${data?.performanceTiming!.tcpTiming}`);
                      ExpectTrue(data!.performanceTiming!.tcpTiming > 0);
                      done();
                    }
                  });
              }).catch((error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, `${caseName} request fail err:${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1500
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1500
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1500';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse | undefined) => {
                hilog.info(domain, tag,
                  `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                httpResponseCache!.flush((err: BusinessError | null) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} flush fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest!.request(XTS_TEST_HTTP_URL,
                      (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                        if (err!.code !== 0) {
                          hilog.info(domain, tag, `${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                          ExpectFail();

                          done();
                        } else {
                          hilog.info(domain, tag,
                            `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                          hilog.info(domain, tag,
                            `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                          ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                          done();
                        }
                      });
                  }
                });
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1600
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1600
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse | undefined) => {
                hilog.info(domain, tag,
                  `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                httpResponseCache!.flush((err: BusinessError | null) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} flush fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    httpRequest!.request(XTS_TEST_HTTP_URL,
                      (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                        if (err!.code !== 0) {
                          hilog.info(domain, tag, `${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                          ExpectFail();
                          done();
                        } else {
                          hilog.info(domain, tag,
                            `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                          hilog.info(domain, tag,
                            `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                          httpRequest!.request(XTS_TEST_HTTP_URL,
                            (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                              if (err!.code !== 0) {
                                hilog.info(domain, tag, `${caseName} thirdResponse fail err : ${JSON.stringify(err)}`);
                                ExpectFail();

                                done();
                              } else {
                                hilog.info(domain, tag,
                                  `${caseName} thirdResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                                hilog.info(domain, tag,
                                  `${caseName} thirdResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                                ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                                done();
                              }
                            });
                        }
                      });
                  }
                });
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1700
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1700
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1700';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequestOptions: http.HttpRequestOptions = {
                usingCache: false
              }
              httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((err: BusinessError | null) => {
                      if (err!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err : ${JSON.stringify(err)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondRequest fail err : ${JSON.stringify(err)}`);
                              ExpectFail();

                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              ExpectTrue(data!.performanceTiming.tcpTiming == 0);
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
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1800
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1800
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequestOptions: http.HttpRequestOptions = {
                usingCache: true
              }
              httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} firstResponse fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush((error) => {
                      if (error!.code !== 0) {
                        hilog.info(domain, tag, `${caseName} flush fail err : ${JSON.stringify(error)}`);
                        ExpectFail();
                        done();
                      } else {
                        httpRequest!.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                          (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                            if (err!.code !== 0) {
                              hilog.info(domain, tag, `${caseName} secondResponse fail err : ${JSON.stringify(err)}`);
                              ExpectFail();

                              done();
                            } else {
                              hilog.info(domain, tag,
                                `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                              hilog.info(domain, tag,
                                `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                              ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                              done();
                            }
                          });
                      }
                    })
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush1900
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_1900
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush1900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`, error);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    httpResponseCache!.flush(() => {
                    });
                  }
                });
              const secondRequest: () => void = () => httpRequest!.request(XTS_TEST_HTTP_URL,
                (err: BusinessError | null, data: http.HttpResponse | undefined) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, `${caseName} err： ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                  } else {
                    hilog.info(domain, tag,
                      `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                    hilog.info(domain, tag,
                      `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                    ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                    done();
                  }
                });
              setTimeout(() => {
                secondRequest();
              }, 10000);
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush2000
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_2000
     * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpResponseCacheFlush2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush2000';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`, error?.code);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              httpRequest!.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse | undefined) => {
                hilog.info(domain, tag,
                  `${caseName} firstResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                httpResponseCache!.flush(() => {
                });
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
              const secondRequest: () => void = () => {
                httpRequest!.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse | undefined) => {
                  hilog.info(domain, tag,
                    `${caseName} secondResponse performanceTiming ${JSON.stringify(data!.performanceTiming)}`);
                  hilog.info(domain, tag, `${caseName} secondResponse tcpTiming ${data!.performanceTiming.tcpTiming}`);
                  ExpectTrue(data!.performanceTiming.tcpTiming == 0);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                  ExpectFail();
                  done();
                });
              }
              setTimeout(() => {
                secondRequest();
              }, 10000);
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });
  });
}
