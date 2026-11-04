'use static';
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

import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import getWebsite from './utils/WsWebsite';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'webSocketMinSupportTlsProtocolTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed`);
  }
}

let ws: webSocket.WebSocket | null = null;
let availableWebSocketAddress: string;

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

export default function WebSocketMinSupportTlsProtocolTest(): void {
  describe('WebSocketMinSupportTlsProtocolTest', () => {

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "beforeAll start");
      availableWebSocketAddress = await getWebsite();
      hilog.info(domain, tag, "current url is " + availableWebSocketAddress)
      done()
      hilog.info(domain, tag, "beforeAll end ")
    })

    beforeEach(async (done: () => void): Promise<void> => {
      ws = webSocket.createWebSocket();
      await sleep(1000);
      done();
    })

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0100
     * @tc.desc   The minimum supported TLS protocol is TLS 1.0 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_0;
          ws!.connect(availableWebSocketAddress, options,
            (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code != 0) {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expectFail(`${caseName} test connect fail`);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
                expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_0);
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
                expectTrue(value == true);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }
            });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0200
     * @tc.desc   The minimum supported TLS protocol is TLS 1.0 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_0;
          ws!.connect(availableWebSocketAddress, options).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_0);
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: BusinessError) => {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0300
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0300
     * @tc.desc   The minimum supported TLS protocol is TLS 1.1 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_1;
          ws!.connect(availableWebSocketAddress, options,
            (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code != 0) {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expectFail(`${caseName} test connect fail`);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
                expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_1);
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
                expectTrue(value == true);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }
            });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0400
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0400
     * @tc.desc   The minimum supported TLS protocol is TLS 1.1 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_1;
          ws!.connect(availableWebSocketAddress, options).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_1);
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: BusinessError) => {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0500
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0500
     * @tc.desc   The minimum supported TLS protocol is TLS 1.2 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_2;
          ws!.connect(availableWebSocketAddress, options,
            (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code != 0) {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expectFail(`${caseName} test connect fail`);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
                expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_2);
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
                expectTrue(value == true);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }
            });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0600
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0600
     * @tc.desc   The minimum supported TLS protocol is TLS 1.2 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_2;
          ws!.connect(availableWebSocketAddress, options).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_2);
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: BusinessError) => {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0700
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0700
     * @tc.desc   The minimum supported TLS protocol is TLS 1.3 for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_3;
          ws!.connect(availableWebSocketAddress, options,
            (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code != 0) {
                hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
                expectFail(`${caseName} test connect fail`);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              } else {
                hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
                expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_3);
                hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
                expectTrue(value == true);
                done();
                hilog.info(domain, tag, `${caseName} test end`);
              }
            });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });

    /**
     * @tc.name   testNetSocketMinSupportTlsProtocol_static_0800
     * @tc.number SUB_NetworkMgr_WebSocket_MinSupportTls_Protocol_0800
     * @tc.desc   The minimum supported TLS protocol is TLS 1.3 for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketMinSupportTlsProtocol_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketMinSupportTlsProtocol_static_0800';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            }
          };
          options.minSupportTlsProtocol = webSocket.TlsProtocol.TLS_V_1_3;
          ws!.connect(availableWebSocketAddress, options).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} options success is ${options.minSupportTlsProtocol}`);
            expectTrue(options.minSupportTlsProtocol == webSocket.TlsProtocol.TLS_V_1_3);
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            expectTrue(value == true);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: BusinessError) => {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });
  });
}
