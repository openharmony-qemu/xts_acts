import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'WebSocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为



const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err: BusinessError) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err: BusinessError) {
    console.info("expectInfo", `test failed`);
  }
}
export default function WebSocketTest() {

  describe("WebSocketTest", (): void => {

    hilog.info(domain, tag, '%{public}s', 'describe start');
    let availableWebSocketAddress: string = 'ws://echo.websocket.org';


    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectCallback_0300
    * @tc.name  : testWebSocketConnectCallback_static_0300
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is {},callback)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectCallback_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectCallback_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test ');
        ws.connect(availableWebSocketAddress, {}, (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (err && err.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  connect fail  error  is '+JSON.stringify(err));
            ExpectFail();
            await ws.close();
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +': test connect success and value is ->'+value);
            ExpectTrue(value!);
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0200
    * @tc.name  : testWebSocketConnectPromise_static_0200
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options is {},promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectPromise_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test ');
        ws.connect(availableWebSocketAddress, {}).then(async (value: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +': test connect success and value is ->'+value);
          ExpectTrue(value);
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  connect fail  error  is '+JSON.stringify(err));
          ExpectFail();
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /* *
    * @tc.number: SUB_Network_WebSocket_ConnectPromise_0300
    * @tc.name  : testWebSocketConnectPromise_static_0300
    * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,options Parameter rejection,promise)
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testWebSocketConnectPromise_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectPromise_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test ');
        ws.connect(availableWebSocketAddress).then(async (value: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +': test connect success and value is ->'+value);
          ExpectTrue(value);
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  connect fail  error  is '+JSON.stringify(err));
          ExpectFail();
          done();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    });

    /*
      * @tc.number: SUB_NetworkMgr_WebSocket_Connect_0100
      * @tc.name  : testNetworkMgrWebSocketConnect_static_0100
      * @tc.desc  : Establish a WebSocket connection based on the URL address and header(connect twice)
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testNetworkMgrWebSocketConnect_static_0100',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketConnect_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (err && err.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  test connect1 fail error is '+JSON.stringify(err));
            ExpectTrue(false)
            done();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +': test connect1 success and value is ->'+ value);
            ws.connect(availableWebSocketAddress, (err: BusinessError<void> | null, value: boolean | undefined) => {
              if (err && err.code != 0) {
                hilog.info(domain, tag, '%{public}s', caseName +' test connect2 fail  error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2302003);
                done();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              } else {
                hilog.info(domain, tag, '%{public}s', caseName +': test connect2 success and value is ->'+ value);
                ExpectTrue(false)
                done();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              }
            })
          }
        })
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch error is '+JSON.stringify(err));
        ExpectTrue(false)
        done();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
      }
    })

    /**
     * @tc.number: SUB_Network_WebSocket_ConnectPromise_0400
     * @tc.name  : testWebSocketConnectPromise_static_0400
     * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is '',promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketConnectPromise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectPromise_static_0400';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, {
          protocol: ''
        }).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          ExpectTrue(value);
          ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          ExpectFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_Network_WebSocket_ConnectPromise_0500
     * @tc.name  : testWebSocketConnectPromise_static_0500
     * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The protocol in the option is '123',promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketConnectPromise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testWebSocketConnectPromise_static_0500';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, {
          protocol: '123'
        }).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          ExpectTrue(value);
          ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          ExpectFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_Network_WebSocket_ConnectCallback_0800
     * @tc.name  : testWebSocketConnectCallback_static_0800
     * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketConnectCallback_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let proxy: webSocket.ProxyConfiguration = 'no-proxy'
      let caseName: string = 'testWebSocketConnectCallback_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, {
          proxy
        }, (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            ExpectFail();
            ws.close();
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            ExpectTrue(value == true);
            ws.close();
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_Network_WebSocket_ConnectCallback_0900
     * @tc.name  : testWebSocketConnectCallback_static_0900
     * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,callback)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketConnectCallback_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let proxy: webSocket.ProxyConfiguration = 'system'
      let caseName: string = 'testWebSocketConnectCallback_static_0900';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, {
          proxy
        }, (err: BusinessError<void> | null, value: boolean | undefined) => {
          if (err?.code) {
            hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
            ExpectFail();
            ws.close();
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          } else {
            hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
            ExpectTrue(value == true);
            ws.close();
            done();
            hilog.info(domain, tag, `${caseName} test end`);
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_Network_WebSocket_ConnectPromise_0700
     * @tc.name  : testWebSocketConnectPromise_static_0700
     * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketConnectPromise_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let proxy: webSocket.ProxyConfiguration = 'system'
      let caseName: string = 'testWebSocketConnectPromise_static_0700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, {
          proxy
        }).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          ExpectTrue(value);
          ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          ExpectFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });

    /**
     * @tc.number: SUB_Network_WebSocket_ConnectPromise_0800
     * @tc.name  : testWebSocketConnectPromise_static_0800
     * @tc.desc  : Establish a WebSocket connection based on the URL address and header(correct url,The proxy in the option is proxy,promise)
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testWebSocketConnectPromise_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let proxy: webSocket.ProxyConfiguration = 'no-proxy'
      let caseName: string = 'testWebSocketConnectPromise_static_0800';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let ws: webSocket.WebSocket= webSocket.createWebSocket();
        ws.connect(availableWebSocketAddress, {
          proxy
        }).then(async (value: boolean) => {
          hilog.info(domain, tag, `${caseName} test connect success and value is ${value}`);
          ExpectTrue(value);
          ws.close();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        }).catch((err: Error) => {
          hilog.info(domain, tag, `${caseName} test connect fail ${JSON.stringify(err)}`);
          ExpectFail();
          done();
          hilog.info(domain, tag, `${caseName} test end`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName} test end`);
      }
    });
  })
}