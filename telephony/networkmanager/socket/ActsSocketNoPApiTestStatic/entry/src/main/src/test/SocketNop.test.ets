'use static';
import hilog from '@ohos.hilog';
import socket from "@ohos.net.socket";
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'socket_nopTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


const NOT_PERMISSION = 201;
let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();


export default function socketNopTest(): void {
  describe('socketNopTest', () => {
    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop_static_0100 begin');
      try {
        let listenAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080,
          family: 1
        }
        await tcpServer.listen(listenAddr).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop_static_0100 fail' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop_static_0100 begin');
      try {
        let listenAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080,
          family: 1
        }
        tcpServer.listen(listenAddr, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop_static_0100 fail' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_NetAddress_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop_static_0100 begin');
      try {
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080
        }
        tcp.bind(bindAddr, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop_static_0100 begin');
      try {
        let bindAddr: socket.NetAddress = {
          address: '127.0.0.1',
          port: 8080
        }
        await tcp.bind(bindAddr).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Bind_NetAddress_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop_static_0100 begin');
      try {
        tcp.getRemoteAddress((err: BusinessError | null, data: socket.NetAddress | undefined) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop_static_0100 begin');
      try {
        await tcp.getRemoteAddress().then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetRemoteAddress_NetAddress_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop_static_0100 begin');
      try {
        await tcp.getState().then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_SocketStateBase_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100 begin');
      try {
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 8080
          },
          secureOptions: {
            key: "pri_key_server",
            cert: "cert_server",
            ca: ["ca_common"],
            password: "123456",
            protocols: socket.Protocol.TLSv12,
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        }
        tlsServer.listen(tlsConnectOptions, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop_static_0100 begin');
      try {
        let tlsConnectOptions: socket.TLSConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 8080
          },
          secureOptions: {
            key: "pri_key_server",
            cert: "cert_server",
            ca: ["ca_common"],
            password: "123456",
            protocols: socket.Protocol.TLSv12,
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          },
          ALPNProtocols: ["spdy/1", "http/1.1"]
        }
        await tlsServer.listen(tlsConnectOptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Listen_TLSConnectOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });




    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop_static_0100 begin');
      try {
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 8080
          }
        }
        udp.send(sendOptions, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop_static_0100 begin');
      try {
        udp.setExtraOptions({}, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });
    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop_static_0100 begin');
      try {
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!'
        }
        await tcp.send(tcpSendOptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPSendOptions_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_GetState_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_GetState_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_GetState_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop_static_0100 begin');
      try {
        await sleep(500)
        tcp.getState((err: BusinessError | null , data: socket.SocketStateBase | undefined) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_GetState_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop_static_0100 begin');
      try {
        let udpextraoptions: socket.UDPExtraOptions = {
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: false,
          socketTimeout: 6000,
          broadcast: true
        }
        await udp.setExtraOptions(udpextraoptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_UDPSendOptions_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop_static_0100 begin');
      try {
        let sendOptions: socket.UDPSendOptions = {
          data: 'Hello, server!',
          address: {
            address: '127.0.0.1',
            port: 8080
          }
        }
        await udp.send(sendOptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_UDPSendOptions_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop_static_0100 begin');
      try {
        let tcpconnectoptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 8080
          },
          timeout: 6000
        }
        tcp.connect(tcpconnectoptions, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPConnectOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop_static_0100 begin');
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        }
        await tcp.setExtraOptions(tcpExtraOptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop_static_0100 begin');
      try {
        let tcpSendOptions: socket.TCPSendOptions = {
          data: 'Hello, server!'
        }
        tcp.send(tcpSendOptions, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Send_TCPConnectOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop_static_0100 begin');
      try {
        let tcpExtraOptions: socket.TCPExtraOptions = {
          keepAlive: true,
          OOBInline: true,
          TCPNoDelay: true,
          socketLinger: {
            on: true, linger: 10
          },
          receiveBufferSize: 1000,
          sendBufferSize: 1000,
          reuseAddress: true,
          socketTimeout: 3000
        }
        tcp.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop_static_0100 ' + JSON.stringify(err));
            expect(err?.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop_static_0100 success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_SetExtraOptions_TCPConnectOptions_Callback_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop_static_0100
     * @tc.number SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop_static_0100 begin');
      try {
        let tcpconnectoptions: socket.TCPConnectOptions = {
          address: {
            address: '127.0.0.1',
            port: 8080
          },
          timeout: 6000
        }
        await tcp.connect(tcpconnectoptions).then(() => {
          hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop_static_0100 success');
          expect().assertFail();
          done();
        }).catch((err) => {
          hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop_static_0100 ' + JSON.stringify(err));
          expect(err?.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (err) {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_NetStack_Socket_Connect_TCPSendOptions_Promise_Nop_static_0100 fail' + JSON.stringify(err));
        expect(err?.code).assertEqual(NOT_PERMISSION);
        done();
      }
    });
  });
}

async function sleep(timeOut: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      hilog.error(0x0000, 'socketTag', '%{public}s', 'sleep time: ' + JSON.stringify(timeOut));
      resolve(0);
    }, timeOut);
  });
}