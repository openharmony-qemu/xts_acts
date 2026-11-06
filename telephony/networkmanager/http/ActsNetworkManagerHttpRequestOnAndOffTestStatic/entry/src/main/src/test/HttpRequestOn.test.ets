'use static';
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
import { BusinessError } from '@ohos.base';
import http from '@ohos.net.http';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

export const ADDR_TEST_STREAM_HTTPS: string = "https://httpbin.moyufangge.com/image/svg";

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', "expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', "expectInfo", `test failed`);
  }
}

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

type emptyFunc = () => void;

const TEST_MORE_LEN: int = 2;
const TEST_MORE_REQUEST_LEN: int = 2;

export default function HttpRequestOnOffTest(): void {
  describe("HttpRequestOnTest", () => {

    /**
     * @tc.name   testHttpRequestOn_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0400
     * @tc.desc   test on with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestOn_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_0400";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  httpRequest.offHeadersReceive();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_0500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0500
     * @tc.desc   test on with type headersReceive  send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_0500";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  )
                  ;
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  httpRequest.offHeadersReceive();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_0700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0700
     * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_0700";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  )
                  ;
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_0800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0800
     * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_0800";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  )
                  ;
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_0900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0900
     * @tc.desc   test on with type dataReceive send more request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_0900";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  )
                  ;
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_1000
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1000
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1000";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataEnd(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        setTimeout(() => {
                          if (err!.code !== 0) {
                            reject(err!);
                          } else {
                            resolve(0);
                          }
                        }, 0);
                      });
                    })
                  )
                  ;
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_1100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1100
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1100";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 2; i++) {
                  httpRequest.onDataEnd(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        setTimeout(() => {
                          if (err!.code !== 0) {
                            reject(err!);
                          } else {
                            resolve(0);
                          }
                        }, 0);
                      });
                    })
                  )
                  ;
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_1300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1300
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1300";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataReceiveProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_1400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1400
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1400";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceiveProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_1500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1500
     * @tc.desc   test on with type dataReceiveProgress send more request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1500";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceiveProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_1600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1600
     * @tc.desc   test on with type dataSendProgress send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1600";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataSendProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, {
                        method: http.RequestMethod.POST
                      }, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 0);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_1700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1700
     * @tc.desc   test on with type dataSendProgress send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1700";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataSendProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 0);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_1800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1800
     * @tc.desc   test on with type dataSendProgress send more request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_1800";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataSendProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream('http://www.baidu.com', {
                        method: http.RequestMethod.POST,
                      }, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 0);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOnce_static_1900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_1900
     * @tc.desc   test once with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOnce_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOnce_static_1900";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onceHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  httpRequest.offHeadersReceive();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOnce_static_2000
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_2000
     * @tc.desc   test once with type headersReceive  send more request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOnce_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOnce_static_2000";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onceHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  httpRequest.offHeadersReceive();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOnce_static_2100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_2100
     * @tc.desc   test once with type headersReceive  send more request with httpRequest.requestInStream  one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOnce_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOnce_static_2100";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onceHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    new Promise<int>((resolve, reject) => {
                      httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err) => {
                        if (err!.code !== 0) {
                          reject(err!);
                        } else {
                          resolve(0);
                        }
                      });
                    })
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  httpRequest.offHeadersReceive();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_3200
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3200
     * @tc.desc   test on with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3200";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.offHeadersReceive();
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_3300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3300
     * @tc.desc   test on with type headersReceive  send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3300";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onHeadersReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 2; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  httpRequest.offHeadersReceive();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_3500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3500
     * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3500";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_3600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3600
     * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3600";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_3700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3700
     * @tc.desc   test on with type dataReceive send more request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3700";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceive(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_3800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3800
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3800";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataEnd(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(() => {
                  setTimeout(async () => {
                    await sleep(100);
                    hilog.info(domain, tag, '%{public}s', `${caseName} called: ${called}}`);
                    ExpectTrue(called == 1);
                    httpRequest.destroy();
                    done();
                  }, 0)
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_3900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_3900
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_3900";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 2; i++) {
                  httpRequest.onDataEnd(callback);
                }

                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(() => {
                  setTimeout(async () => {
                    await sleep(100);
                    hilog.info(domain, tag, '%{public}s', `${caseName} called: ${called}}`);
                    ExpectTrue(called == 1);
                    httpRequest.destroy();
                    done();
                  }, 0)
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_4100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_4100
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_4100";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataReceiveProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_4200
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_4200
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_4200";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceiveProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_4300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_4300
     * @tc.desc   test on with type dataReceiveProgress send more request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_4300";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataReceiveProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= TEST_MORE_REQUEST_LEN);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_4400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_4400
     * @tc.desc   test on with type dataSendProgress send one request with httpRequest.requestInStream only one listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_4400";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < 1; i++) {
                  httpRequest.onDataSendProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 0);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_4500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_4500
     * @tc.desc   test on with type dataSendProgress send one request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_4500";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataSendProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < 1; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called == 0);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });


    /**
     * @tc.name   testHttpRequestOn_static_4600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_4600
     * @tc.desc   test on with type dataSendProgress send more request with httpRequest.requestInStream one more listener
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_4600";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                const callback: emptyFunc = () => {
                  called++;
                }
                for (let i = 0; i < TEST_MORE_LEN; i++) {
                  httpRequest.onDataSendProgress(callback);
                }
                let list: Promise<int>[] = [];
                for (let i = 0; i < TEST_MORE_REQUEST_LEN; i++) {
                  list.push(
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                  );
                }
                Promise.all(list).then(async () => {
                  await sleep(100);
                  ExpectTrue(called >= 0);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} promiseAll catch error, code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_5300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_5300
     * @tc.desc   test on with type dataReceive with httpRequest.request not support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_5300";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                httpRequest.onDataReceive(() => {
                  called++;
                });
                httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS).then(async (res: int) => {
                  await sleep(100);
                  hilog.info(domain, tag, '%{public}s', `${caseName} request sunccess, data: ${JSON.stringify(res)}`);
                  hilog.info(domain, tag, '%{public}s', `${caseName} called: ${called}`);
                  ExpectTrue(called == 2);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} request fail, error code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestOn_static_5500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_5500
     * @tc.desc   test on with type dataEnd with httpRequest.request not support
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestOn_static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = "testHttpRequestOn_static_5500";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (error!.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} getDefaultNet fail, error code: ${error!.code}, msg: ${error!.message}`);
              ExpectFail();
              done();
            } else {
              if (data!.netId == 0) {
                hilog.info(domain, tag, '%{public}s', `${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                let httpRequest: http.HttpRequest = http.createHttp();
                let called: int = 0;
                httpRequest.onDataEnd(() => {
                  called++;
                });
                httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS).then(async (res: int) => {
                  try {
                    await sleep(100);
                  } catch (error) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} sleep error, error code: ${error!.code}, msg: ${error!.message}`);
                  }
                  hilog.info(domain, tag, '%{public}s', `${caseName} request sunccess, data: ${JSON.stringify(res)}`);
                  hilog.info(domain, tag, '%{public}s', `${caseName} called: ${called}`);
                  ExpectTrue(called == 1);
                  httpRequest.destroy();
                  done();
                }).catch((error) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} request fail, error code: ${error!.code}, msg: ${error!.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                })
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
      });
  });
}
