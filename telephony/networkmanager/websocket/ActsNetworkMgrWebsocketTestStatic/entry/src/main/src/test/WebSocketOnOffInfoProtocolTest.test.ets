'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeEach, beforeAll, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import getWebsite from './utils/WsWebsite';
import { expectEqual } from './utils';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'webSocketOnOffInfoProtocolTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function WebSocketOnOffInfoProtocolTest(): void {
  describe('WebSocketOnOffInfoProtocolTest', () => {
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
     * @tc.name   testNetSocketOnOffInfoTlsProtocol_static_0100
     * @tc.number SUB_Network_WebSocket_OnOffInfoTlsProtocol_0100
     * @tc.desc   WebSocket supports the on.openInfo event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketOnOffInfoTlsProtocol_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketOnOffInfoTlsProtocol_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        let options: webSocket.WebSocketRequestOptions = {
          header: {
            'Content-Type': 'application/json'
          },
          protocol: 'Sec-WebSocket-Protocol'
        };
        try {
          ws!.onWebSocketError((err: BusinessError) => {
            hilog.info(domain, tag,
              `${caseName} findError code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`)
            done();
          })
          ws!.offOpenInfo();
          ws!.onOpenInfo((value: webSocket.WebSocketOpenInfo) => {
            const status: int = value.status
            hilog.info(domain, tag, `${caseName} status is ${JSON.stringify(status)}`)
            expectEqual(status, 101)
            const message: string = value.message
            hilog.info(domain, tag, `${caseName} message is ${JSON.stringify(message)}`)
            expectEqual(message, 'Switching Protocols')
            const protocol: string | undefined = value.protocol
            hilog.info(domain, tag, `${caseName} protocol is ${JSON.stringify(protocol)}`)
            expectTrue(protocol == undefined);
            ws!.close();
            done();
          })
          await ws!.connect('wss://websocket-echo.moyufangge.com', options).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} options success is ${options.protocol}`);
            expectTrue(options.protocol == 'Sec-WebSocket-Protocol')
            expectTrue(value);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err) => {
            hilog.info(domain, tag,
              `${caseName} test connect fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail('test connect fail')
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch error code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(false);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      });
    /**
     * @tc.name   testNetSocketOnOffInfoTlsProtocol_static_0200
     * @tc.number SUB_Network_WebSocket_OnOffInfoTlsProtocol_0200
     * @tc.desc   WebSocket supports the off.openInfo event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetSocketOnOffInfoTlsProtocol_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetSocketOnOffInfoTlsProtocol_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        let callback1 = (value: webSocket.WebSocketOpenInfo) => {
          if (value?.protocol != undefined) {
            hilog.info(domain, tag,
              `on openInfo exist protocol: status: ${value.status}, message: ${value.message}, protocol: ${value.protocol}`);
          } else {
            hilog.info(domain, tag,
              `on openInfo , status: ${value.status}, message: ${value.message}, protocol: ${value.protocol}`);
          }
          expectFail();
        }
        try {
          let options: webSocket.WebSocketRequestOptions = {
            header: {
              'Content-Type': 'application/json'
            },
            protocol: 'Sec-WebSocket-Protocol'
          };
          ws!.onWebSocketError((err: BusinessError) => {
            hilog.info(domain, tag,
              `${caseName} findError+ code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`)
            done();
          })
          ws!.onOpenInfo(callback1);
          ws!.offOpenInfo(callback1);

          await ws!.connect('wss://websocket-echo.moyufangge.com', options).then(async (value: boolean) => {
            hilog.info(domain, tag, `${caseName} options success is ${options.protocol}`);
            expectTrue(options.protocol == 'Sec-WebSocket-Protocol')
            expectTrue(value);
            hilog.info(domain, tag, `${caseName} test end`);
            try {
              await ws!.close();
            } catch (err) {
              hilog.info(domain, tag,
                `${caseName} close error code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(false);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
            done();
          }).catch((err) => {
            hilog.info(domain, tag,
              `${caseName} test connect fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail('test connect fail')
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch error code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(false);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
  });
}
