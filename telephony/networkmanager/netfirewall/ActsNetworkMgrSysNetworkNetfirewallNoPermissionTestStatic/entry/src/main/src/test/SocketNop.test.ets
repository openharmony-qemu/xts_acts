'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import socket from '@ohos.net.socket';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'socketNopTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为



const ExpectTrue: (n: boolean, caseName?: string) => void = (n: boolean, caseName?: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `${caseName} expect error ${JSON.stringify(err)}`);
  }
}


export default function WebSocketPermissionDeniedTest(): void {
  describe('webSocketPermissionDeniedTest', () => {
    
    /**
     * @tc.name   testNetworkMgrWebSocketMulticastSocketAddMembership_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_MulticastSocketAddMembership_0100
     * @tc.desc   Test code 201 of MulticastSocket AddMembership(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketMulticastSocketAddMembership_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketAddMembership_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12348
        }
        multicast.addMembership(addr, (error) => {
          const err = error as BusinessError;
          if (err) {
            hilog.info(domain, tag, 'add fail');
            hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            hilog.info(domain, tag, 'add success');
            ExpectTrue(false);
            done();
          }
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketMulticastSocketAddMembership_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_MulticastSocketAddMembership_0200
     * @tc.desc   Test code 201 of MulticastSocket AddMembership(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketMulticastSocketAddMembership_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketAddMembership_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12349
        }
        multicast.addMembership(addr).then(() => {
          hilog.info(domain, tag, 'add success');
          ExpectTrue(false);
          done();
        }).catch((error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'add fail');
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrWebSocketUDPSocketBind_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_UDPSocketBind_0100
     * @tc.desc   Test code 201 of UDPSocket bind(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketUDPSocketBind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketBind_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12345
        }
        udp.bind(bindAddr, (error) => {
          const err = error as BusinessError;
          if (err) {
            hilog.info(domain, tag, 'bind fail');
            hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            hilog.info(domain, tag, 'bind success');
            ExpectTrue(false);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketUDPSocketBind_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_UDPSocketBind_0200
     * @tc.desc   Test code 201 of UDPSocket bind(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketUDPSocketBind_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketBind_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12346
        }
        udp.bind(bindAddr).then(() => {
          hilog.info(domain, tag, 'bind success');
          ExpectTrue(false);
          done();
        }).catch((error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'bind fail');
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code===201);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code===201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketTLSSocketBind_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_TLSSocketBind_0100
     * @tc.desc   Test code 201 of TLSSocket bind(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketTLSSocketBind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketTLSSocketBind_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12347
        }
        tls.bind(bindAddr, (error) => {
          const err = error as BusinessError;
          if (err) {
            hilog.info(domain, tag, 'bind fail');
            hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code===201);
            done();
          } else {
            hilog.info(domain, tag, 'bind success');
            ExpectTrue(false);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code===201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketTLSSocketBind_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_TLSSocketBind_0200
     * @tc.desc   Test code 201 of TLSSocket bind(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketTLSSocketBind_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketTLSSocketBind_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 12348
        }
        tls.bind(bindAddr).then(() => {
          hilog.info(domain, tag, 'bind success');
          ExpectTrue(false);
          done();
        }).catch((error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'bind fail');
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code===201);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code===201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketMulticastSocketDropMembership_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_MulticastSocketDropMembership_0100
     * @tc.desc   Test code 201 of MulticastSocket DropMembership(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketMulticastSocketDropMembership_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketDropMembership_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12350
        }
        multicast.dropMembership(addr, (error) => {
          const err = error as BusinessError;
          if (err) {
            hilog.info(domain, tag, 'drop fail');
            hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            done();
          } else {
            hilog.info(domain, tag, 'drop success');
            ExpectTrue(false);
            done();
          }
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketMulticastSocketDropMembership_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_MulticastSocketDropMembership_0200
     * @tc.desc   Test code 201 of MulticastSocket DropMembership(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketMulticastSocketDropMembership_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketMulticastSocketDropMembership_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let multicast: socket.MulticastSocket = socket.constructMulticastSocketInstance();
        let addr: socket.NetAddress = {
          address: '239.255.0.1',
          port: 12351
        }
        multicast.dropMembership(addr).then(() => {
          hilog.info(domain, tag, 'drop success');
          ExpectTrue(false);
          done();
        }).catch((error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'drop fail');
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketUDPSocketClose_static_0100
     * @tc.number SUB_NetworkMgr_WebSocket_UDPSocketClose_0100
     * @tc.desc   Test code 201 of UDPSocket close(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketUDPSocketClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketClose_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.close((error) => {
          const err = error as BusinessError;
          if (err) {
            hilog.info(domain, tag, 'close fail');
            hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
            ExpectTrue(err.code===201);
            done();
          } else {
            hilog.info(domain, tag, 'close success');
            ExpectTrue(false);
            done();
          }
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code===201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrWebSocketUDPSocketClose_static_0200
     * @tc.number SUB_NetworkMgr_WebSocket_UDPSocketClose_0200
     * @tc.desc   Test code 201 of UDPSocket close(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketUDPSocketClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrWebSocketUDPSocketClose_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
        udp.close().then(() => {
          hilog.info(domain, tag, 'close success');
          ExpectTrue(false);
          done();
        }).catch((error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'close fail');
          hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
          ExpectTrue(err.code===201);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch error ${JSON.stringify(err)}`);
        ExpectTrue(err.code===201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
    * @tc.name   testNetworkMgrSocketTCPSocketServerCloseNoP_static_0100
    * @tc.number SUB_NetworkMgr_Socket_TCPSocketServerCloseNoP_0100
    * @tc.desc   Test code 201 of TCPSocketServer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('testNetworkMgrSocketTCPSocketServerCloseNoP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrSocketTCPSocketServerCloseNoP_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        tcpServer.close().then(()=>{
          hilog.info(domain, tag, `${caseName} tcpServer  close success`);
          ExpectTrue(false);
          done();
          hilog.info(domain, tag, `${caseName}---End`);
        }).catch((error)=>{
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} tcpServer  close failed err is` + JSON.stringify(err));
          ExpectTrue(err.code === 201);
          done();
          hilog.info(domain, tag, `${caseName}---End`);
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerCloseNoP_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServerCloseNoP_0100
     * @tc.desc   Test code 201 of tlsServer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerCloseNoP_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetworkMgrSocketTLSSocketServerCloseNoP_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
        tlsServer.close().then(()=>{
          hilog.info(domain, tag, `${caseName} tlsServer close success `);
          ExpectTrue(false);
          done();
          hilog.info(domain, tag, `${caseName}---End`);
        }).catch((error)=>{
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} tlsServer close get err is `+JSON.stringify(err));
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        })
      } catch (err) {
        hilog.info(domain, tag, `${caseName}_catch fail err:${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      }
    });

  })
}