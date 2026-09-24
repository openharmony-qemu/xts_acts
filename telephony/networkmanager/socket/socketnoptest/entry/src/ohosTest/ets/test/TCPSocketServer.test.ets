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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-dynamic'
import socket from "@ohos.net.socket";
import { BusinessError, Callback } from '@ohos.base';



function expectFail(info: string = ''): void {
    try {
        expect(false).assertTrue();
    } catch (err) {
        console.info(`${info} test failed`);
    }
}


function expectTrue(exp: boolean, info: string = ''): void {
    try {
        expect(exp).assertTrue();
    } catch (err) {
        console.info(`${info} test failed`);
    }
}



export default function TCPSocketServerTest() {
    describe('ActsTCPSocketServerTest', () => {

        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketServerGetSocketFd0100
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocketServer_GetSocketFd_0100
         * @tc.desc   Obtain TCPSocketServer FD without net
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testNetworkMgrSocketNopTCPSocketServerGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketServerGetSocketFd0100';
            try {
                console.info(`${caseName} test start`);
                let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
                expect(tcpServer).assertInstanceOf('Object');

                tcpServer.getSocketFd().then((data: number) => {
                    console.info(`${caseName} success data:${JSON.stringify(data)}`);
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                    expectTrue(err.code === 201);
                    console.info(`${caseName}---End`);
                    done();
                })
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketServerListen0100
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocketServer_Listen_0100
         * @tc.desc   TCPSocketServer listen error 201 without net (callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketServerListen0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketServerListen0100';
            try {
                console.info(`${caseName} test start`);
                let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
                expect(tcpServer).assertInstanceOf('Object');

                let netAddress: socket.NetAddress = {
                    address: '127.0.0.1',
                    port: 65535,
                    family: 1
                };
                tcpServer.listen(netAddress, (err: BusinessError) => {
                    if (err) {
                        console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                        expectTrue(err.code === 201);
                        console.info(`${caseName}---End`);
                        done();
                    } else {
                        console.info(`${caseName} success`);
                        expectFail();
                        console.info(`${caseName}---End`);
                        done();
                    }
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketServerListen0200
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocketServer_Listen_0200
         * @tc.desc   TCPSocketServer listen error 201 without net (promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketServerListen0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketServerListen0200';
            try {
                console.info(`${caseName} test start`);
                let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
                expect(tcpServer).assertInstanceOf('Object');

                let netAddress: socket.NetAddress = {
                    address: '127.0.0.1',
                    port: 65535,
                    family: 1
                };
                tcpServer.listen(netAddress).then(() => {
                    console.info(`${caseName} success`);
                    expectFail();
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                    expectTrue(err.code === 201);
                    console.info(`${caseName}---End`);
                    done();
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketConnect0100
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_Connect_0100
         * @tc.desc   TCPSocket connect error 201 without net (promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketConnect0100';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                let tcpConnectOptions: socket.TCPConnectOptions = {
                    address: {
                        address: '127.0.0.1',
                        port: 65535,
                        family: 1
                    }
                };
                tcp.connect(tcpConnectOptions).then(() => {
                    console.info(`${caseName} success`);
                    expectFail();
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                    expectTrue(err.code === 201);
                    console.info(`${caseName}---End`);
                    done();
                })
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketConnect0200
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_Connect_0200
         * @tc.desc   TCPSocket connect error 201 without net (callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketConnect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketConnect0200';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                let tcpConnectOptions: socket.TCPConnectOptions = {
                    address: {
                        address: '127.0.0.1',
                        port: 65535,
                        family: 1
                    }
                };
                tcp.connect(tcpConnectOptions, (err: BusinessError) => {
                    if (err) {
                        console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                        expectTrue(err.code === 201);
                        console.info(`${caseName}---End`);
                        done();
                    } else {
                        console.info(`${caseName} success`);
                        expectFail();
                        console.info(`${caseName}---End`);
                        done();
                    }
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketSend0100
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_Send_0100
         * @tc.desc   TCPSocket send error 201 without net (callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketSend0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketSend0100';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                let tcpSendOptions: socket.TCPSendOptions = {
                    data: 'Hello TCPSocket Send'
                };
                tcp.send(tcpSendOptions, (err: BusinessError) => {
                    if (err) {
                        console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                        expectTrue(err.code === 201);
                        console.info(`${caseName}---End`);
                        done();
                    } else {
                        console.info(`${caseName} success`);
                        expectFail();
                        console.info(`${caseName}---End`);
                        done();
                    }
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketSend0200
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_Send_0200
         * @tc.desc   TCPSocket send error 201 without net (promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketSend0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketSend0200';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                let tcpSendOptions: socket.TCPSendOptions = {
                    data: 'Hello TCPSocket Send Promise'
                };
                tcp.send(tcpSendOptions).then(() => {
                    console.info(`${caseName} success`);
                    expectFail();
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                    expectTrue(err.code === 201);
                    console.info(`${caseName}---End`);
                    done();
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketGetState0100
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_GetState_0100
         * @tc.desc   TCPSocket getState error 201 without net (callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketGetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketGetState0100';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                tcp.getState((err: BusinessError, data: socket.SocketStateBase) => {
                    if (err) {
                        console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                        expectTrue(err.code === 201);
                        console.info(`${caseName}---End`);
                        done();
                    } else {
                        console.info(`${caseName} success data:${JSON.stringify(data)}`);
                        expectFail();
                        console.info(`${caseName}---End`);
                        done();
                    }
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketSetExtraOptions0100
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_SetExtraOptions_0100
         * @tc.desc   TCPSocket setExtraOptions error 201 without net (callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketSetExtraOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketSetExtraOptions0100';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                let tcpExtraOptions: socket.TCPExtraOptions = {
                    keepAlive: true,
                    receiveBufferSize: 4096,
                    sendBufferSize: 4096,
                    reuseAddress: true,
                    socketTimeout: 0,
                    OOBInline: true,
                    TCPNoDelay: true
                };
                tcp.setExtraOptions(tcpExtraOptions, (err: BusinessError) => {
                    if (err) {
                        console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                        expectTrue(err.code === 201);
                        console.info(`${caseName}---End`);
                        done();
                    } else {
                        console.info(`${caseName} success`);
                        expectFail();
                        console.info(`${caseName}---End`);
                        done();
                    }
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
        /**
         * @tc.name   testNetworkMgrSocketNopTCPSocketSetExtraOptions0200
         * @tc.number SUB_NetworkMgr_Socket_Nop_TCPSocket_SetExtraOptions_0200
         * @tc.desc   TCPSocket setExtraOptions error 201 without net (promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testNetworkMgrSocketNopTCPSocketSetExtraOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName: string = 'testNetworkMgrSocketNopTCPSocketSetExtraOptions0200';
            try {
                console.info(`${caseName} test start`);
                let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
                expect(tcp).assertInstanceOf('Object');

                let tcpExtraOptions: socket.TCPExtraOptions = {
                    keepAlive: true,
                    receiveBufferSize: 4096,
                    sendBufferSize: 4096,
                    reuseAddress: true,
                    socketTimeout: 0,
                    OOBInline: true,
                    TCPNoDelay: true
                };
                tcp.setExtraOptions(tcpExtraOptions).then(() => {
                    console.info(`${caseName} success`);
                    expectFail();
                    console.info(`${caseName}---End`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} fail err:${JSON.stringify(err)}`);
                    expectTrue(err.code === 201);
                    console.info(`${caseName}---End`);
                    done();
                });
            } catch (err) {
                console.info(`${caseName}_catch fail err:${JSON.stringify(err)}`);
                expectFail();
                console.info(`${caseName} test end`);
                done();
            }
        });
    })
}
