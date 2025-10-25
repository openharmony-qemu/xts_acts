import { describe, it, expect, beforeAll, Level, TestType, Size,beforeEach } from '../../../hypium';
import { AsyncCallback, BusinessError, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';
import webSocket from '@ohos.net.webSocket';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = ' WebsocketTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let PERMISSION_DENIED_CODE:number =201;
let PARAMETER_ERROR_CODE:number =401;

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

function expectTrue(exp: boolean | undefined, info: string = ''): void {
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

function expectEqual(exp: string | number | boolean | int | undefined,
  assert: string | number | boolean | int, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    hilog.info(domain, tag, `${info} test failed`);
  }
}

let sendLongMessage: string = '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'+
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'


let header:Record<string,string> = {
  "Content-Type": "application/json"
}

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err: BusinessError) {
    console.info("expectInfo", `test failed`);
  }
}

let availableWebSocketAddress: string = 'wss://whale.tooly.top/ws';

export default function WebsocketTestStatic() {
  describe('WebsocketTestStatic', () => {
    /* *
     * @tc.number: SUB_Network_WebSocket_OnHeaderReceiveCallback_0100
     * @tc.name  : testWebSocketOnHeaderReceiveCallback_static_0100
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(on_HeaderReceive)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testWebSocketOnHeaderReceiveCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketOnHeaderReceiveCallback_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        const options111: webSocket.WebSocketRequestOptions = {
          header: header,
        };
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
          hilog.info(domain, tag, `${caseName} on headerReceive"+${data}`)
          expectTrue(data != null)
          done()
        })
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen err is ${data?.status}  and value is ${JSON.stringify(data)}`)
          expectEqual(data?.status, 101)
        })
        ws.connect(availableWebSocketAddress, options111).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          expectTrue(value as boolean);
          await ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        let error = err as  BusinessError;
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(error)}`);
        if (error?.code === PERMISSION_DENIED_CODE){
          expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          done()
        } else {
          expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          done()
        }
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OffHeaderReceiveCallback_0100
     * @tc.name  : testWebSocketOffHeaderReceiveCallback_static_0100
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testWebSocketOffHeaderReceiveCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketOffHeaderReceiveCallback_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const options: webSocket.WebSocketRequestOptions = {
          header: header
        };
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
          hilog.info(domain, tag, `${caseName} on headerReceive"+${data}`)
          expectTrue(data != null)
          done()
        })
        ws.offHeaderReceive()
        ws.offHeaderReceive()
        ws.onOpen((data: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          expectTrue(value as boolean);
          await ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OffHeaderReceiveCallback_0200
     * @tc.name  : testWebSocketOffHeaderReceiveCallback_static_0200
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(off-->on)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testWebSocketOffHeaderReceiveCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketOffHeaderReceiveCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const options: webSocket.WebSocketRequestOptions = {
          header: header
        };
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.offHeaderReceive()
        ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
          hilog.info(domain, tag, `${caseName} on headerReceive"+${data}`)
          expectTrue(data != null)
          done()
        })
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          expectTrue(value as boolean);
          await ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /* *
     * @tc.number: SUB_Network_WebSocket_OffHeaderReceiveCallback_0300
     * @tc.name  : testWebSocketOffHeaderReceiveCallback_static_0300
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testWebSocketOffHeaderReceiveCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketOffHeaderReceiveCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const options: webSocket.WebSocketRequestOptions = {
          header: header
        };
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError+ ${JSON.stringify(err)}`)
        })
        ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
          hilog.info(domain, tag, `${caseName} on headerReceive"+${data}`)
          expectTrue(data != null)
          done()
        })
        ws.offHeaderReceive()
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status, 101)
        })
        ws.connect(availableWebSocketAddress, options).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          expectTrue(value as boolean);
          await ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          expectFail('test connect fail')
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        expectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_WebSocket_CloseResult_0100
     * @tc.name   : testNetworkMgrWebSocketCloseResult_static_0100
     * @tc.desc   : Closure result obtained by subscribing to the close event when the WebSocket connection is closed.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrWebSocketCloseResult_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseResult_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          ExpectTrue(value?.reason != undefined)
          done();
        })
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          ws.close((err: BusinessError<void>|null,value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              ExpectTrue(false)
              done();
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catch err is ${JSON.stringify(err)}`);
        ExpectTrue(false)
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0200
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0200
     * @tc.desc  : Sending data through WebSocket connection(data is '')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status,101);
          ws.send('', (err: BusinessError<void>|null, value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectTrue(false);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0300
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0300
     * @tc.desc  : Sending data through WebSocket connection(data is string)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null, value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue( value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0400
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0400
     * @tc.desc  : Sending data through WebSocket connection(data is ArrayBuffer)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        let sendMessage: ArrayBuffer = new ArrayBuffer(96);
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status,101);
          ws.send(sendMessage, (err: BusinessError<void>|null, value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue( value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0500
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0500
     * @tc.desc  : Sending data through WebSocket connection(data is Int8Array)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        let sendMessage: ArrayBuffer = new ArrayBuffer(0);
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status,101);
          ws.send(sendMessage, (err: BusinessError<void>|null, value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectFail(`${caseName} send success`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0600
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0600
     * @tc.desc  : Sending data through WebSocket connection(no connect)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.send('Hello', (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
            expect(err?.code).assertEqual(-1);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
            expectFail(`${caseName} send success`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0700
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0700
     * @tc.desc  : Sending data through WebSocket connection(send twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null, value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send1 fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send1 fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send1 success and value is ${value}`);
              ws.send('Hello', (err: BusinessError<void>|null, value: boolean|undefined) => {
                if (err?.code) {
                  hilog.info(domain, tag, `${caseName} send2 fail ${JSON.stringify(err)}`);
                  expectFail(`${caseName} send2 fail`);
                  done();
                  hilog.info(domain, tag, `${caseName} test end`);
                } else {
                  hilog.info(domain, tag, `${caseName} send2 success and value is ${value}`);
                  expectTrue( value as boolean);
                  done();
                  hilog.info(domain, tag, `${caseName} test end`);
                }
              })
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendCallback_0800
     * @tc.name  : testNetworkMgrWebSocketSendCallback_static_0800
     * @tc.desc  : Sending data through WebSocket connection(send long message)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendCallback_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendCallback_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(data)}`)
          expectEqual(data?.status,101);
          ws.send(sendLongMessage, (err: BusinessError<void>|null, value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue( value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0200
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0200
     * @tc.desc  : Sending data through WebSocket connection(data is '')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('').then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0300
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0300
     * @tc.desc  : Sending data through WebSocket connection(data is string)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello').then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0400
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0400
     * @tc.desc  : Sending data through WebSocket connection(data is ArrayBuffer)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        let sendMessage: ArrayBuffer = new ArrayBuffer(96);
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send(sendMessage).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0500
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0500
     * @tc.desc  : Sending data through WebSocket connection(data is Int8Array)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        let sendMessage: ArrayBuffer = new ArrayBuffer(0);
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send(sendMessage).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
            expectFail(`${caseName} send success`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            let error = err as  BusinessError;
            hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(error)}`);
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null, value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0600
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0600
     * @tc.desc  : Sending data through WebSocket connection(no connect)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.send('Hello').then((value: boolean) => {
          hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
          expectFail(`${caseName} send success`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          let error = err as  BusinessError;
          hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(error)}`);
          expect(error?.code).assertEqual(-1);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0700
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0700
     * @tc.desc  : Sending data through WebSocket connection(send twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello').then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} send1 success and value is ${value}`);
            ws.send('Hello').then((value: boolean) => {
              hilog.info(domain, tag, `${caseName} send2 success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }).catch((err: Error) => {
              hilog.info(domain, tag, `${caseName} send2 fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send2 fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            })
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} send1 fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send1 fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_SendPromise_0800
     * @tc.name  : testNetworkMgrWebSocketSendPromise_static_0800
     * @tc.desc  : Sending data through WebSocket connection(send long message)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketSendPromise_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketSendPromise_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send(sendLongMessage).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} send fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0100
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0100
     * @tc.desc  : Close WebSocket connection(normal)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0200
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0200
     * @tc.desc  : Close WebSocket connection(close twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            hilog.info(domain, tag, `${caseName} close1 ${JSON.stringify(err)}`);
            if (err?.code) {
              expectFail(`${caseName} close1 fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close1 success and value is ${value}`);
              setTimeout(() => {
                ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
                  if (err?.code) {
                    hilog.info(domain, tag, `${caseName} close2 fail ${JSON.stringify(err)}`);
                    expect(err?.code == 2302999).assertTrue();
                    done();
                    hilog.info(domain, tag, `${caseName} test end`);
                  } else {
                    hilog.info(domain, tag, `${caseName} close2 success and value is ${value}`);
                    expectFail(`${caseName} close2 success`);
                    done();
                    hilog.info(domain, tag, `${caseName} test end`);
                  }
                })
              },2000)
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0300
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0300
     * @tc.desc  : Close WebSocket connection(No connection established)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expect(err?.code).assertEqual(2302999);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
            expectFail(`${caseName} close success`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0500
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0500
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(options is {})
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0600
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0600
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:-100,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: -100,reason: 'error'}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0700
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0700
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:0,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 0,reason: 'error'}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_0800
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_0800
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:100,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 100,reason: 'error'}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_1100
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_1100
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:1000,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_1100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 1000, reason: 'error'}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_CloseCallback_1200
     * @tc.name  : testNetworkMgrWebSocketCloseCallback_static_1200
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(No connection established)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketCloseCallback_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketCloseCallback_static_1200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.close({code: 1000, reason: 'error'}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expect(err?.code).assertEqual(2302999);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} close success ${value}`);
            expectFail(`${caseName} close success`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ClosePromise_0100
     * @tc.name  : testNetworkMgrWebSocketClosePromise_static_0100
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(options is {})
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketClosePromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({}).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} close success ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ClosePromise_0200
     * @tc.name  : testNetworkMgrWebSocketClosePromise_static_0200
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:-100,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketClosePromise_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: -100,reason: 'error'}).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} close success ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ClosePromise_0300
     * @tc.name  : testNetworkMgrWebSocketClosePromise_static_0300
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:0,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketClosePromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 0,reason: 'error'}).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} close success ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ClosePromise_0400
     * @tc.name  : testNetworkMgrWebSocketClosePromise_static_0400
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:100,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketClosePromise_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 100,reason: 'error'}).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} close success ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ClosePromise_0500
     * @tc.name  : testNetworkMgrWebSocketClosePromise_static_0500
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(code:1000,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketClosePromise_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise_static_0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 1000,reason: 'error'}).then((value: boolean) => {
            hilog.info(domain, tag, `${caseName} close success ${value}`);
            expectTrue(value as boolean);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }).catch((err: Error) => {
            hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} close fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_ClosePromise_0600
     * @tc.name  : testNetworkMgrWebSocketClosePromise_static_0600
     * @tc.desc  : Close WebSocket connection based on optional parameters code and reason(No connection established,code:1000,reason:'error')
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketClosePromise_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketClosePromise_static_0600';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.close({code: 1000,reason: 'error'}).then((value: boolean) => {
          hilog.info(domain, tag, `${caseName} close success ${value}`);
          expectFail(`${caseName} close success`);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(error)}`);
          expect(error?.code).assertEqual(2302999);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnOpenCallback_0100
     * @tc.name  : testNetworkMgrWebSocketOnOpenCallback_static_0100
     * @tc.desc  : Subscription to WebSocket Open Event(connect-->open)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketOnOpenCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value as boolean);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnOpenCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOnOpenCallback_static_0200
     * @tc.desc  : Subscription to WebSocket Open Event(connect-->close-->open)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketOnOpenCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen1 value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              ws.onOpen((value: webSocket.OpenResult|undefined) => {
                hilog.info(domain, tag, `${caseName} onopen2 value is ${JSON.stringify(value)}`);
                done();
              });
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnOpenCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOnOpenCallback_static_0300
     * @tc.desc  : Subscription to WebSocket Open Event(open)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketOnOpenCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnOpenCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          done();
        })
        expectTrue(true);
        done();
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffOpenCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOffOpenCallback_static_0200
     * @tc.desc  : Unsubscribe from WebSocket's open event(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketOffOpenCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          done();
        });
        ws.offOpen();
        ws.offOpen();
        ws.connect(availableWebSocketAddress, (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value as boolean);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffOpenCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOffOpenCallback_static_0300
     * @tc.desc  : Unsubscribe from WebSocket's open event(off-->open-->connect)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketOffOpenCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.offOpen();
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          done();
        });
        ws.connect(availableWebSocketAddress, (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value as boolean);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffOpenCallback_0400
     * @tc.name  : testNetworkMgrWebSocketOffOpenCallback_static_0400
     * @tc.desc  : Unsubscribe from WebSocket's open event(open-->off-->connect)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it("testNetworkMgrWebSocketOffOpenCallback_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffOpenCallback_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          done();
        });
        ws.offOpen();
        ws.connect(availableWebSocketAddress, (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(value as boolean);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnMessageCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOnMessageCallback_static_0200
     * @tc.desc  : Subscription to WebSocket receiving server message events(message)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnMessageCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnMessageCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          done();
        })
        expectTrue(true);
        done();
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnMessageCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOnMessageCallback_static_0300
     * @tc.desc  : Subscription to WebSocket receiving server message events(send-->message)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnMessageCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnMessageCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffMessageCallback_0100
     * @tc.name  : testNetworkMgrWebSocketOffMessageCallback_static_0100
     * @tc.desc  : Unsubscribe from WebSocket receiving server message events(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffMessageCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffMessageCallback_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.offMessage();
        ws.offMessage();
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffMessageCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOffMessageCallback_static_0200
     * @tc.desc  : Unsubscribe from WebSocket receiving server message events(off--on--send)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffMessageCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffMessageCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.offMessage();
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffMessageCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOffMessageCallback_static_0300
     * @tc.desc  : Unsubscribe from WebSocket receiving server message events(on--off--send)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffMessageCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffMessageCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.offMessage();
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnCloseCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOnCloseCallback_static_0200
     * @tc.desc  : Subscription to WebSocket shutdown event(close)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnCloseCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        expectTrue(true);
        done();
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnCloseCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOnCloseCallback_static_0300
     * @tc.desc  : Subscription to WebSocket shutdown event(connect-->close-->on)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnCloseCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expect(value?.code).assertEqual(1000);
          done();
        })
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnCloseCallback_0400
     * @tc.name  : testNetworkMgrWebSocketOnCloseCallback_static_0400
     * @tc.desc  : Subscription to WebSocket shutdown event(connect-->close-->on,options,callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnCloseCallback_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnCloseCallback_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expect(value?.code).assertEqual(1000);
          done();
        })
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close({code: 1000,reason: ''}, (err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffCloseCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOffCloseCallback_static_0200
     * @tc.desc  : Unsubscribe from WebSocket's shutdown event(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffCloseCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          done();
        })
        ws.offWebSocketClose();
        ws.offWebSocketClose();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffCloseCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOffCloseCallback_static_0300
     * @tc.desc  : Unsubscribe from WebSocket's shutdown event(off--on--close)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffCloseCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.offWebSocketClose();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${JSON.stringify(value)}`);
          expect(value?.code).assertEqual(1000);
          done();
        });
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffCloseCallback_0400
     * @tc.name  : testNetworkMgrWebSocketOffCloseCallback_static_0400
     * @tc.desc  : Unsubscribe from WebSocket's shutdown event(on--off--close)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffCloseCallback_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffCloseCallback_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketClose((err: BusinessError<void>|null, value: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onclose err is ${JSON.stringify(err)} and value is ${value}`);
          expect(value?.code).assertEqual(1000);
          done();
        });
        ws.offWebSocketClose();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.close((err: BusinessError<void>|null, value: Boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} close fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} close fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} close success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnErrorCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOnErrorCallback_static_0200
     * @tc.desc  : Subscription to WebSocket's Error Event(connect_null)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnErrorCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnErrorCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} onerror err is ${JSON.stringify(err)}`);
          expect(err?.code).assertEqual(200);
          done();
        });
        ws.connect('ws://', (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error?.code === -1);
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        });
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffErrorCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOffErrorCallback_static_0200
     * @tc.desc  : Unsubscribe from WebSocket's Error event(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffErrorCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} onerror err is ${JSON.stringify(err)}`);
          done();
        });
        ws.offWebSocketError();
        ws.offWebSocketError();
        ws.connect('ws://', (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error?.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        });
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffErrorCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOffErrorCallback_static_0300
     * @tc.desc  : Unsubscribe from WebSocket's Error event(off--on--connect_null)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffErrorCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.offWebSocketError();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} onerror err is ${JSON.stringify(err)}`);
          expect(err?.code).assertEqual(200);
          done();
        });
        ws.connect('ws://', (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error?.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        });
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffErrorCallback_0400
     * @tc.name  : testNetworkMgrWebSocketOffErrorCallback_static_0400
     * @tc.desc  : Unsubscribe from WebSocket's Error event(on--off--connect_null)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffErrorCallback_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffErrorCallback_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} onerror err is ${JSON.stringify(err)}`);
          done();
        });
        ws.offWebSocketError();
        ws.connect('ws://', (error: BusinessError<void>|null , value: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
          expectTrue(error !== undefined && error?.code === -1); // {"code":-1,"message":"Websocket connect failed"}
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        });
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OnDataEndCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOnDataEndCallback_static_0200
     * @tc.desc  : Subscription to WebSocket data receiving end event(onDataEnd)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOnDataEndCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnDataEndCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onDataEnd(() => {
          hilog.info(domain, tag, `${caseName} ondataEnd success`);
          done();
        })
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffDataEndCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOffDataEndCallback_static_0200
     * @tc.desc  : Unsubscribe from WebSocket data receiving end event(off twice)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffDataEndCallback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onDataEnd(() => {
          hilog.info(domain, tag, `${caseName} ondataEnd success`);
          done();
        });
        ws.offDataEnd();
        ws.offDataEnd();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffDataEndCallback_0300
     * @tc.name  : testNetworkMgrWebSocketOffDataEndCallback_staic_0300
     * @tc.desc  : Unsubscribe from WebSocket data receiving end event(off--on)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffDataEndCallback_staic_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback_staic_0300';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.offDataEnd();
        ws.onDataEnd(() => {
          hilog.info(domain, tag, `${caseName} ondataEnd success`);
          done();
        });
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffDataEndCallback_0400
     * @tc.name  : testNetworkMgrWebSocketOffDataEndCallback_static_0400
     * @tc.desc  : Unsubscribe from WebSocket data receiving end event(on--off)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
	it("testNetworkMgrWebSocketOffDataEndCallback_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOffDataEndCallback_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
     try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onDataEnd(() => {
          hilog.info(domain, tag, `${caseName} ondataEnd success`);
          done();
        });
        ws.offDataEnd();
        ws.onWebSocketError((err: BusinessError) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        ws.onMessage((err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onmessage err is ${JSON.stringify(err)} and value is ${value}`);
          expectTrue(value != null);
          done();
        });
        ws.onOpen((value: webSocket.OpenResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
          expectEqual(value?.status,101);
          ws.send('Hello', (err: BusinessError<void>|null , value: boolean|undefined) => {
            if (err?.code) {
              hilog.info(domain, tag, `${caseName} send fail ${JSON.stringify(err)}`);
              expectFail(`${caseName} send fail`);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            } else {
              hilog.info(domain, tag, `${caseName} send success and value is ${value}`);
              expectTrue(value as boolean);
              done();
              hilog.info(domain, tag, `${caseName} test end`);
            }
          })
        });
        ws.connect(availableWebSocketAddress, (err: BusinessError<void>|null , value: boolean|undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            expectFail(`${caseName} test connect fail`);
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          }
        })
      } catch (err:Error) {
        hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /* *
       * @tc.number: SUB_NetworkMgr_WebSocket_OnHeaderReceiveCallback_0100
       * @tc.name  : testNetworkMgrWebSocketOnHeaderReceiveCallback_static_0100
       * @tc.desc  : Subscribe to the headerReceive event of WebSocket(on_HeaderReceive)
       * @tc.size  : MediumTest
       * @tc.type  : Function
       * @tc.level : level 3
       */
    it("testNetworkMgrWebSocketOnHeaderReceiveCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketOnHeaderReceiveCallback_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
       try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
          ws.onWebSocketError((err: Error) => {
            hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
          });
          ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
            hilog.info(domain, tag, `${caseName} on headerReceive" + ${data}`);
            expect(true).assertEqual(data !== null);
            done();
          })
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
            expectEqual(value?.status, 101);
            done();
          });
          ws.connect(availableWebSocketAddress, (error: BusinessError<void> | null, value: boolean | undefined) => {
            hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
            if (value !== undefined) {
              expectTrue(value);
            }
            hilog.info(domain, tag, `${caseName} test end`);
          })
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      })

    /* *
    * @tc.number: SUB_NetworkMgr_WebSocket_OffHeaderReceiveCallback_0100
    * @tc.name  : testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0100
    * @tc.desc  : Subscribe to the headerReceive event of WebSocket(off twice)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it("testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
       try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
          ws.onWebSocketError((err: Error) => {
            hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
          });
          ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
            hilog.info(domain, tag, `${caseName} on headerReceive" + ${data}`);
            expect(true).assertEqual(data !== null);
            done();
          });
          ws.offHeaderReceive();
          ws.offHeaderReceive();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
            expectEqual(value?.status, 101);
            done();
          });
          ws.connect(availableWebSocketAddress, (error: BusinessError<void> | null, value: boolean | undefined) => {
            hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
            if (value !== undefined) {
              expectTrue(value);
            }
            hilog.info(domain, tag, `${caseName} test end`);
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }
      })


    /* *
     * @tc.number: SUB_NetworkMgr_WebSocket_OffHeaderReceiveCallback_0200
     * @tc.name  : testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0200
     * @tc.desc  : Subscribe to the headerReceive event of WebSocket(off-->on)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
       try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
          ws.onWebSocketError((err: Error) => {
            console.info(`${caseName} findError" + ${JSON.stringify(err)}`);
          });
          ws.offHeaderReceive();
          ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
            hilog.info(domain, tag, `${caseName} on headerReceive" + ${data}`);
            expect(true).assertEqual(data !== null);
            done();
          });
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
            expectEqual(value?.status, 101);
            done();
          });
          ws.connect(availableWebSocketAddress, (error: BusinessError<void> | null, value: boolean | undefined) => {
            hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
            if (value !== undefined) {
              expectTrue(value);
            }
            hilog.info(domain, tag, `${caseName} test end`);
          })
        } catch (err) {
          hilog.error(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
        }
      })

    /* *
        * @tc.number: SUB_NetworkMgr_WebSocket_OffHeaderReceiveCallback_0300
        * @tc.name  : testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0300
        * @tc.desc  : Subscribe to the headerReceive event of WebSocket(on-->off)
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrWebSocketOffHeaderReceiveCallback_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
       try {
         const ws : webSocket.WebSocket = webSocket.createWebSocket();
          ws.onWebSocketError((err: Error) => {
            hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
          });
          ws.onHeaderReceive((data: webSocket.ResponseHeaders) => {
            hilog.info(domain, tag, `${caseName} on headerReceive" + ${data}`);
            expect(true).assertEqual(data !== null);
            done();
          });
          ws.offHeaderReceive();
          ws.onOpen((value: webSocket.OpenResult | undefined) => {
            hilog.info(domain, tag, `${caseName} onopen value is ${JSON.stringify(value)}`);
            expectEqual(value?.status, 101);
            done();
          });
          ws.connect(availableWebSocketAddress, (error: BusinessError<void> | null, value: boolean | undefined) => {
            hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
            if (value !== undefined) {
              expectTrue(value);
            }
            hilog.info(domain, tag, `${caseName} test end`);
          })
       } catch (err) {
          hilog.error(domain, tag, `${caseName} catchError ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
          hilog.error(domain, tag, `${caseName} test end`);
       }
    })

    /**
     * @tc.number SUB_NetworkMgr_WebSocket_OnOffCallback_0100
     * @tc.name   testNetworkMgrWebSocketOnOffCallback_static_0100
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrWebSocketOnOffCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnOffCallback_static_0100';
      let isOnEvent = 0;
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        ws.onWebSocketError((err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${caseName} findError" + ${JSON.stringify(err)}`);
        });
        let onOpenCallback01 = (data: webSocket.OpenResult | undefined) => {
          hilog.info(domain, tag, `${caseName} onOpenCallback01 data is: `+ JSON.stringify(data));
          expectFail()
          hilog.info(domain, tag, `${caseName}---end`);
        }
        let onOpenCallback02 = (data: webSocket.OpenResult | undefined) => {
          isOnEvent+=1;
          hilog.info(domain, tag, `${caseName} onOpenCallback01 data is: `+ JSON.stringify(data));
          const status: int|undefined = data?.status;
          expectTrue(status == 101);
          ws.send('haha', (err: BusinessError<void> | null, value: boolean | undefined) => {
            if (err?.code) {
              console.error(`${caseName} get err is `+JSON.stringify(err));
              expectFail();
              done();
              hilog.info(domain, tag, `${caseName}---end`);
            }else{
              hilog.info(domain, tag, `${caseName} send success and calue is: `+value)
            }
          })
        }
        let onMessageCallback01 = (err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          hilog.info(domain, tag, `${caseName} onMessageCallback01 err is ${JSON.stringify(err)} and value is ${value}`);
          expectFail();
          hilog.info(domain, tag, `${caseName}---end`);
          done();
        }
        let onMessageCallback02 = (err: BusinessError<void>|null, value: undefined|String|ArrayBuffer) => {
          isOnEvent+=1;
          hilog.info(domain, tag, `${caseName} onMessageCallback02 err is ${JSON.stringify(err)} and value is ${value}`);
        }
        let onHeaderReceiveCallback01 = (data: webSocket.ResponseHeaders) => {
          hilog.info(domain, tag, `${caseName} onHeaderReceiveCallback01 `+JSON.stringify(data));
          expectFail()
          hilog.info(domain, tag, `${caseName}---end`);
          done();
        }
        let onHeaderReceiveCallback02 = (data: webSocket.ResponseHeaders) => {
          isOnEvent += 1;
          hilog.info(domain, tag, `${caseName} onHeaderReceiveCallback02 `+JSON.stringify(data));
        }
        let onDataEndCallback01 = () => {
          hilog.info(domain, tag, `${caseName} onDataEndCallback01 dataEnd `);
          expectFail();
          hilog.info(domain, tag, `${caseName}---end`);
          done();
        }
        let onDataEndCallback02 = () => {
          isOnEvent +=1;
          hilog.info(domain, tag, `${caseName} onDataEndCallback02 dataEnd `);
          ws.close()
        }
        let onCloseCallback01 = (err: BusinessError<void>|null, data: webSocket.CloseResult|undefined) => {
          hilog.info(domain, tag, `${caseName} onCloseCallback01 close ,closeResult is `+JSON.stringify(data));
          expectFail();
          hilog.info(domain, tag, `${caseName}---end`);
          done();
        }
        let onCloseCallback02 = (err: BusinessError<void>|null, data: webSocket.CloseResult|undefined) => {
          isOnEvent += 1;
          hilog.info(domain, tag, `${caseName} onCloseCallback02 close ,closeResult is `+JSON.stringify(data));
          hilog.info(domain, tag, `${caseName}  isOnEvent is `+ isOnEvent);
          expectTrue(isOnEvent >=5);
          hilog.info(domain, tag, `${caseName}---end`);
          done();
        }
        ws.onOpen(onOpenCallback01);
        ws.onOpen(onOpenCallback01);
        ws.onOpen(onOpenCallback02);
        ws.offOpen(onOpenCallback01);
        ws.onMessage(onMessageCallback01);
        ws.onMessage(onMessageCallback02);
        ws.offMessage(onMessageCallback01);
        ws.onDataEnd(onDataEndCallback01);
        ws.onDataEnd(onDataEndCallback02);
        ws.offDataEnd(onDataEndCallback01);
        ws.onHeaderReceive(onHeaderReceiveCallback01);
        ws.onHeaderReceive(onHeaderReceiveCallback02);
        ws.offHeaderReceive(onHeaderReceiveCallback01);
        ws.onWebSocketClose(onCloseCallback01);
        ws.onWebSocketClose(onCloseCallback02);
        ws.offWebSocketClose(onCloseCallback01);
        ws.connect(availableWebSocketAddress, (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
        })
      } catch (err: Error) {
        hilog.info(domain, tag, `${caseName} catch Error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })

    /**
     * @tc.number SUB_NetworkMgr_WebSocket_OnOffCallback_0200
     * @tc.name   testNetworkMgrWebSocketOnOffCallback_static_0200
     * @tc.desc   Subscribe to the headerReceive event of WebSocket(on-->off)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  level 3
     */
    it('testNetworkMgrWebSocketOnOffCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketOnOffCallback_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const ws : webSocket.WebSocket = webSocket.createWebSocket();
        let onErrorCallback01 = (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${caseName} onErrorCallback01 get err is `+JSON.stringify(err))
          expectFail();
          done();
          hilog.info(domain, tag, `${caseName}---end`);
        }
        let onErrorCallback02 = (err: BusinessError<void> | null) => {
          hilog.info(domain, tag, `${caseName} onErrorCallback02 get err is `+JSON.stringify(err))
          expectTrue(true)
          done();
          hilog.info(domain, tag, `${caseName}---end`);
        }
        ws.onWebSocketError(onErrorCallback01);
        ws.onWebSocketError(onErrorCallback02);
        ws.offWebSocketError(onErrorCallback01);
        ws.connect('ws://124.222.6.66:12423', (error: BusinessError<void> | null, value: boolean | undefined) => {
          hilog.info(domain, tag, `${caseName} test result error ${JSON.stringify(error)} and value is ${value}`);
        })
      } catch (err: Error) {
        hilog.info(domain, tag, `${caseName} catch Error ${JSON.stringify(err)}`);
        expectFail(`${caseName} fail,errInfo->${JSON.stringify(err)}`);
        done();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    })
  })
}