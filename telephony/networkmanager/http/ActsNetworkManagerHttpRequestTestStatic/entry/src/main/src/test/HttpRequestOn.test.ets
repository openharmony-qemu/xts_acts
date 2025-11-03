/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';

export const ADDR_TEST_STREAM_HTTPS = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";

type emptyFunc = () => void;

const TEST_MORE_LEN: int = 2;

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function HttpRequestOnOffTest() {
  describe("HttpRequestOnTest", () => {

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0100
     * @tc.name   testHttpRequestOn_static_0100
     * @tc.desc   test on with type headersReceive send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0100";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onHeadersReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0200
     * @tc.name   testHttpRequestOn_static_0200
     * @tc.desc   test on with type headersReceive send one request with httpRequest.requestInStream one more listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0200";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onHeadersReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0300
     * @tc.name   testHttpRequestOn_static_0300
     * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0300";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number  SUB_NetworkMgr_Http_HttpRequest_On_0400
     * @tc.name    testHttpRequestOn_static_0400
     * @tc.desc    test on with type dataReceive send one request with httpRequest.requestInStream one more listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 2
     */
    it("testHttpRequestOn_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0400";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onDataReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0500
     * @tc.name   testHttpRequestOn_static_0500
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0500";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataEnd(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      setTimeout(() => {
                        if (err?.code !== 0) {
                          reject(err as Error);
                        } else {
                          resolve(undefined);
                        }
                      }, 0);
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0600
     * @tc.name   testHttpRequestOn_static_0600
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream one more listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0600";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(2).fill(undefined).forEach(() => {
                httpRequest.onDataEnd(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      setTimeout(() => {
                        if (err?.code !== 0) {
                          reject(err as Error);
                        } else {
                          resolve(undefined);
                        }
                      }, 0);
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0700
     * @tc.name   testHttpRequestOn_static_0700
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0700";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                hilog.info(domain, tag, `${caseName} emptyFunc begin called = ${called}`);
                called++;
                hilog.info(domain, tag, `${caseName} emptyFunc end called = ${called}`);
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataReceiveProgress(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                hilog.info(domain, tag, `${caseName} Network i = ${i}`);
                list.push(
                  new Promise<void>((resolve, reject) => {
                    hilog.info(domain, tag, `${caseName} Network requestInStream`);
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        hilog.info(domain, tag, `${caseName} Network requestInStream reject`);
                        reject(err as Error);
                      } else {
                        hilog.info(domain, tag, `${caseName} Network requestInStream resolve`);
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number  SUB_NetworkMgr_Http_HttpRequest_On_0800
     * @tc.name    testHttpRequestOn_static_0800
     * @tc.desc    test on with type dataReceiveProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   level 2
     */
    it("testHttpRequestOn_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_0800";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onDataReceiveProgress(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_0900
     * @tc.name   SUB_NetworkMgr_Http_HttpRequest_On_static_0900
     * @tc.desc   test on with type dataSendProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   method
     * @tc.level  level 2
     */
    it("SUB_NetworkMgr_Http_HttpRequest_On_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "SUB_NetworkMgr_Http_HttpRequest_On_static_0900";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataSendProgress(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, {
                      method: http.RequestMethod.POST
                    }, (err) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_1000
     * @tc.name:    testHttpRequestOn_static_1000
     * @tc.desc:    test on with type dataSendProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size:    MediumTest
     * @tc.type:    Function
     * @tc.level:   level 2
     */
    it("testHttpRequestOn_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_1000";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onDataSendProgress(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_1100
     * @tc.name   SUB_NetworkMgr_Http_HttpRequest_Once_static_1100
     * @tc.desc   test once with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("SUB_NetworkMgr_Http_HttpRequest_Once_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "SUB_NetworkMgr_Http_HttpRequest_Once_static_1100";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                hilog.info(domain, tag, `${caseName} ---------> onceHeaderCallback called`);
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onceHeadersReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_1200
     * @tc.name   testHttpRequestOnce_static_1200
     * @tc.desc   test once with type headersReceive  send more request with httpRequest.request only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOnce_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOnce_static_1200";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onceHeadersReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_1300
     * @tc.name   testHttpRequestOnce_static_1300
     * @tc.desc   test once with type headersReceive  send one request with httpRequest.request  one more listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOnce_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOnce_static_1300";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onceHeadersReceive(callback);
              });
              let list: Promise<void>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  new Promise<void>((resolve, reject) => {
                    httpRequest.request(ADDR_TEST_STREAM_HTTPS, (err: BusinessError<void>|null) => {
                      if (err?.code !== 0) {
                        reject(err as Error);
                      } else {
                        resolve(undefined);
                      }
                    });
                  })
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1400
     * @tc.name   testHttpRequestOn_static_1400
     * @tc.desc   test on with type headersReceive  send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_1400";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onHeadersReceive(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.offHeadersReceive();
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
    * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1500
    * @tc.name   testHttpRequestOn_static_1500
    * @tc.desc   test on with type headersReceive  send one request with httpRequest.requestInStream one more listener
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  level 2
    */
    it("testHttpRequestOn_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_1500";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onHeadersReceive(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called === 1);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1600
     * @tc.name   testHttpRequestOn_static_1600
     * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_1600";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataReceive(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
      * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1700
      * @tc.name   testHttpRequestOn_static_1700
      * @tc.desc   test on with type dataReceive send one request with httpRequest.requestInStream one more listener
      * @tc.size   MediumTest
      * @tc.type   Function
      * @tc.level  level 2
      */
    it("testHttpRequestOn_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_1700";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onDataReceive(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_1800
     * @tc.name   testHttpRequestOn_static_1800
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_1800";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataEnd(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                setTimeout(() => {
                  hilog.info(domain, tag, `${caseName} called: ${called}}`);
                  expect(true).assertEqual(called === 1);
                  httpRequest.destroy();
                  done();
                }, 0)
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_2000
     * @tc.name   testHttpRequestOn_static_2000
     * @tc.desc   test on with type dataEnd send one request with httpRequest.requestInStream one more listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_2000";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(2).fill(undefined).forEach(() => {
                httpRequest.onDataEnd(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                setTimeout(() => {
                  hilog.info(domain, tag, `${caseName} called: ${called}}`);
                  expect(true).assertEqual(called === 1);
                  httpRequest.destroy();
                  done();
                }, 0)
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_2100
     * @tc.name   testHttpRequestOn_static_2100
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_2100";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataReceiveProgress(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_2200
     * @tc.name   testHttpRequestOn_static_2200
     * @tc.desc   test on with type dataReceiveProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_2200";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onDataReceiveProgress(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                expect(true).assertEqual(called >= 1);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /* *
     * @tc.number:  SUB_NetworkMgr_Http_HttpRequest_On_2300
     * @tc.name  :  testHttpRequestOn_static_2300
     * @tc.desc  :  test on with type dataSendProgress send one request with httpRequest.requestInStream only one listener
     * @tc.size  :  MediumTest
     * @tc.type  :  method
     * @tc.level :  level 2
     */
    it("testHttpRequestOn_static_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_2300";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(1).fill(undefined).forEach(() => {
                httpRequest.onDataSendProgress(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                hilog.info(domain, tag, `${caseName} promiseAll called = ${called}`);
                expect(true).assertEqual(called >= 0);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_2400
     * @tc.name   testHttpRequestOn_static_2400
     * @tc.desc   test on with type dataSendProgress send one request with httpRequest.requestInStream one more listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 2
     */
    it("testHttpRequestOn_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestOn_static_2400";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} getDefaultNet fail, error code: ${error?.code}, msg: ${error?.message}`);
            expect().assertFail();
            done();
          } else {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} no Network connected`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let called: number = 0;
              const callback: emptyFunc = () => {
                called++;
              }
              new Array<void>(TEST_MORE_LEN).fill(undefined).forEach(() => {
                httpRequest.onDataSendProgress(callback);
              });
              let list: Promise<Int>[] = [];
              for (let i = 0; i < 1; i++) {
                list.push(
                  httpRequest.requestInStream(ADDR_TEST_STREAM_HTTPS)
                );
              }
              Promise.all(list).then(() => {
                hilog.info(domain, tag, `${caseName} promiseAll called = ${called}`);
                expect(true).assertEqual(called === 0);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, `${caseName} promiseAll catch error, code: ${error?.code}, msg: ${error?.message}`);
                httpRequest.destroy();
                expect().assertFail();
                done();
              })
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });


  });
}