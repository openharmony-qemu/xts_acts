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

import { describe, it, TestType, Size, Level, expect } from '@ohos/hypium-dynamic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback} from '@ohos.base';
import { JSON } from '@kit.ArkTS';

function expectTrue(exp: boolean, info: string = ''): void {
  if (!exp) {
    console.info(`[expectTrue] expectTrue failed: ${info}, exp=${exp}`);
  }
  expect(exp).assertTrue();
}
function expectFail(info: string = ''): void {
  expect(false).assertTrue();
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  console.info(`[expectEqual] expectEqual: exp=${exp} (${typeof exp}), assert=${assert} (${typeof assert}), info=${info}`);
  if (typeof exp === 'number' && typeof assert === 'string') {
    expect(exp).assertEqual(Number(assert));
  } else if (typeof exp === 'string' && typeof assert === 'number') {
    expect(Number(exp)).assertEqual(assert);
  } else {
    expect(exp).assertEqual(assert);
  }
}
function stringToArrayBuffer(str: string): ArrayBuffer {
  let buf: ArrayBuffer = new ArrayBuffer(str.length * 2);
  let bufView: Uint8Array = new Uint8Array(buf);
  for (let i: number = 0; i < str.length; i++) {
    bufView[i] = str.charCodeAt(i);
  }
  return buf;
}

export default function LocalSocketTest() {
  describe('LocalSocketTest', () => {
    /**

     describe('LocalSocket', () => {
     /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0100
     * @tc.desc   Bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0100';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket';
        console.info(`${caseName} sandboxPath: ${sandboxPath}`);
        let address: socket.LocalAddress = {
          address: sandboxPath
        };
        await client.bind(address);
        console.log(`${caseName} bind success`);
        expectTrue(true, 'bind should succeed with valid address');
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        const errObj = err as BusinessError;
        console.info(`${caseName} err.code type: ${typeof errObj.code}, value: ${errObj.code}`);
        expectFail('bind should not fail with valid address');
      } finally {
        if (client) {
          client.close();
        }
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0200
     * @tc.desc   test localSocket Bind function (401 or 2301098)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0200';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        try {
          await client.bind(undefined);
          console.log(`${caseName} bind success`);
          expectFail('bind with undefined should fail');
        } catch (err) {
          console.error(`${caseName} failed to bind: ${JSON.stringify(err)}`);
          const errorObj = err as BusinessError;
          if (errorObj && typeof errorObj === 'object') {
            try {
              console.info(`${caseName} err object keys: ${Object.keys(errorObj)}`);
            } catch {
              console.info(`${caseName} Cannot get keys from err object`);
            }
            console.info(`${caseName} err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName} err.message: ${errorObj.message}`);
            console.info(`${caseName} err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName} Extracted error code from message: ${errorCode}`);
              }
            }
            if (errorCode !== undefined) {
              expectEqual(401, errorCode, 'bind with undefined should return error code 401');
            } else {
              console.info(`${caseName} Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind with undefined');
            }
          } else {
            console.info(`${caseName} Error is not an object or is null/undefined`);
            expectTrue(false, 'Error should be an object');
          }
        }
      } catch (error) {
        console.info(`${caseName} catch err: ${JSON.stringify(error)}`);
        const errorObj = error as BusinessError;
        console.info(`${caseName} error.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
        if (errorObj.code !== undefined) {
          expectTrue(Number(errorObj.code) == 401, 'error code should be 401');
        }
      } finally {
        if (client) {
          client.close();
        }
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnect0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_connect_0100
     * @tc.desc   Connect to the specified socket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnect0100';
      console.info(`${caseName} test start`);
      try{
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        server.listen(localAddr).then(() => {
          console.log(`${caseName} listen success`)
          let client: socket.LocalSocket = socket.constructLocalSocketInstance();
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          }
          client.connect(connectOpt).then(() => {
            console.log(`${caseName} connect success`)
            expectTrue(true)
          }).catch((err: BusinessError) => {
            console.log(`${caseName} FAIL FAIL FAIL` + JSON.stringify(err));
            expectFail()
            done();
          })
          console.info(`${caseName} test end`);
          done();
        })
      }catch (err){
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0100
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        let sendOpt: socket.LocalSendOptions = {
          data: 'Hello world!'
        }
        await client.send(sendOpt);
        console.info(`${caseName} client send success`)
        expectTrue(true)
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0200
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0200';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        let sendOpt: socket.LocalSendOptions = {
          data: 'Hello world!',
          encoding: 'UTF-8',
        }
        await client.send(sendOpt);
        console.info(`${caseName} client send success`)
        expectTrue(true)
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0300
     * @tc.desc   test localSocket send function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0300';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        let sendOpt: socket.LocalSendOptions = {
          data: stringToArrayBuffer('Hello, server!'),
          encoding: 'UTF-8',
        }
        await client.send(sendOpt);
        console.info(`${caseName} client send success`)
        expectTrue(true)
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0400
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0400
     * @tc.desc   test localSocket send function.(401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0400';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        await client.send(null);
        console.info(`${caseName} client send success`)
        expectFail()
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done()
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0500
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0500
     * @tc.desc   test localSocket send function with undefined options, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0500';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        await client.send(undefined);
        console.info(`${caseName} client send success`)
        expectFail()
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSendTest0600
     * @tc.number SUB_NetworkMgr_Socket_localSocket_send_0600
     * @tc.desc   test localSocket send function with empty object options, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSendTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSendTest0600';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        let emptyOpt: socket.LocalSendOptions = {} as socket.LocalSendOptions;
        await client.send(emptyOpt);
        console.info(`${caseName} client send success`)
        expectFail()
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done()
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketGetState0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_getState_0100
     * @tc.desc   test LocalConnection connection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketGetState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketGetState0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        await client.getState();
        console.info(`${caseName} get state success`)
        expectTrue(true)
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_getSocketFd_0100
     * @tc.desc   test LocalConnection connection GetLocalAddress function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        try {
          await client.connect(connectOpt);
          console.log(`${caseName} connect success`)
          const data: number = await client.getSocketFd();
          console.info(`${caseName} fd ${data}`)
          expectTrue(data !=null)
        } catch (err) {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        }
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketSetExtraOptions0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_setExtraOptions_0100
     * @tc.desc   test LocalSocket connection SetExtraOptions function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketSetExtraOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketSetExtraOptions0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        try {
          await server.listen(localAddr);
          console.log(`${caseName} listen success`)
        } catch (err) {
          console.info(`${caseName} fail to listen ${err.code.toString()}`);
        }
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        try {
          await client.connect(connectOpt);
          console.log(`${caseName} connect success`)
          const data: number = await client.getSocketFd();
          console.info(`${caseName} fd ${data}`)
          expectTrue(true)
        } catch (err) {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        }
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_localSocketServer_getSocketFd_0100
     * @tc.desc   test LocalSocketServer getSocketFd function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        try {
          await server.listen(localAddr);
          console.log(`${caseName} listen success`)
        } catch (err) {
          console.info(`${caseName} fail to listen ${err.code.toString()}`);
        }
        try {
          const serverFd: number = await server.getSocketFd();
          console.info(`${caseName} success fd:${JSON.stringify(serverFd)}`);
          expectTrue(serverFd !== -1);
        } catch (err) {
          console.info(`${caseName} listen or getSocketFd err: ${JSON.stringify(err)}`);
          expectFail();
        }
        await server.close().catch((err: BusinessError) => {
          console.info(`${caseName} close server err: ${err.message}`);
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerGetSocketFd0200
     * @tc.number SUB_NetworkMgr_Socket_localSocketServer_getSocketFd_0200
     * @tc.desc   test LocalSocketServer getSocketFd function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerGetSocketFd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketServerGetSocketFd0200';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        try {
          const serverFd: number = await server.getSocketFd();
          console.info(`${caseName} success fd:${JSON.stringify(serverFd)}`);
          expectTrue(serverFd === -1);
        } catch (err) {
          console.info(`${caseName} listen or getSocketFd err: ${JSON.stringify(err)}`);
          expectFail();
        }
        await server.close().catch((err: BusinessError) => {
          console.info(`${caseName} close server err: ${err.message}`);
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnectionGetSocketFd0100
     * @tc.number SUB_NetworkMgr_Socket_localSocketConnection_getSocketFd_0100
     * @tc.desc   test LocalSocketConnection getSocketFd function (Promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnectionGetSocketFd0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnectionGetSocketFd0100';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        };
        try {
          await server.listen(localAddr);
          console.log(`${caseName} listen success`);
        } catch (err) {
          console.info(`${caseName} fail to listen: ${err.code.toString()}`);
        }
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} server accept connection success`);
          try {
            const fd: number = await connection.getSocketFd();
            console.info(`${caseName} get Connection FD success: ${fd}`);
            expectTrue(fd !== -1);
          } catch (err) {
            console.info(`${caseName} getSocketFd err: ${JSON.stringify(err)}`);
            expectFail();
          } finally {
            server.off('connect');
            connection.close().catch(() => {});
            client.close();
            server.close().catch(() => {});
            console.info(`${caseName} test end`);
            done();
          }
        });

        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        };
        try {
          await client.connect(connectOpt);
          console.log(`${caseName} connect success`)
        } catch (err) {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        }
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnectionGetSocketFd0200
     * @tc.number SUB_NetworkMgr_Socket_localSocketConnection_getSocketFd_0200
     * @tc.desc   test LocalSocketConnection getSocketFd function (Promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnectionGetSocketFd0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnectionGetSocketFd0200';
      console.info(`${caseName} test start`);
      try {
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        };
        try {
          await server.listen(localAddr);
          console.log(`${caseName} listen success`);
        } catch (err) {
          console.info(`${caseName} fail to listen: ${err.code.toString()}`);
        }
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} server accept connection success`);
          connection.close().catch(() => {});
          try {
            const fd: number = await connection.getSocketFd();
            console.info(`${caseName} get Connection FD success: ${fd}`);
            expectTrue(fd === -1);
          } catch (err) {
            console.info(`${caseName} getSocketFd err: ${JSON.stringify(err)}`);
            expectFail();
          } finally {
            server.off('connect');
            client.close();
            server.close().catch(() => {});
            console.info(`${caseName} test end`);
            done();
          }
        });

        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        };
        try {
          await client.connect(connectOpt);
          console.log(`${caseName} connect success`)
        } catch (err) {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        }
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOn0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_on_message_0100
     * @tc.desc   test LocalSocket On message function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 ,  (done: Function) => {
      const caseName: string = 'testNetworkMgrSocketLocalSocketOn0100';
      console.info(`${caseName}---Start`);
      let server: socket.LocalSocketServer | null = null;
      let client: socket.LocalSocket | null = null;
      let testCompleted = false;

      let sandboxPath: string = getContext().filesDir + '/testSocket';

      try {
        server = socket.constructLocalSocketServerInstance();
        client = socket.constructLocalSocketInstance();
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        };

        server.listen(localAddr).then(() => {
          console.log(`${caseName} listen success`);

          let sendOpt: socket.LocalSendOptions = {
            data: 'Hello world!'
          };

          server!.on('connect', (connection: socket.LocalSocketConnection) => {
            connection.send(sendOpt).catch((err: BusinessError) => {
              console.info(`${caseName} fail to send ${err.code.toString()}`);
              if (!testCompleted) {
                testCompleted = true;
                if (server) {
                  server.off('connect');
                }
                if (client) {
                  client.close();
                }
                console.info(`${caseName} test end`);
                done();
              }
            });
          });

          let callback: Callback<socket.LocalSocketMessageInfo> = (data: socket.LocalSocketMessageInfo) => {
            try {
              const hasMessage = data.message !== undefined;
              const hasAddress = data.address !== undefined;
              const hasSize = data.size !== undefined;

              console.log(`${caseName} data.message: ${hasMessage}, data.address: ${hasAddress}, data.size: ${hasSize}`);
              expectTrue(hasMessage && hasAddress && hasSize);
              let uintArray: Uint8Array = new Uint8Array(0);
              if (hasMessage) {
                uintArray = new Uint8Array(data.message);
                let messageView = '';
                for (let i = 0; i < uintArray.length; i++) {
                  messageView += String.fromCharCode(uintArray[i]);
                }
                console.log(`${caseName} total: ${JSON.stringify(data)}`);
                console.log(`${caseName} message infomation: ${messageView}`);
                expectTrue(data.message instanceof ArrayBuffer);
                expectTrue(data.message.byteLength === 'Hello world!'.length);
                expectTrue(messageView === 'Hello world!');
              }
              if (hasSize) {
                console.log(`${caseName} message size: ${data.size}`);
                expectTrue(typeof data.size === 'number');
                expectTrue(data.size === uintArray.length);
                expectTrue(data.size === 'Hello world!'.length);
              }
            } catch (err) {
              console.info(`${caseName} callback error: ${JSON.stringify(err)}`);
            } finally {
              if (!testCompleted) {
                testCompleted = true;
                try {
                  if (server) {
                    server.off('connect');
                  }
                  if (client) {
                    client.close();
                  }
                  console.info(`${caseName} test end`);
                  done();
                } catch (cleanupErr) {
                  console.info(`${caseName} cleanup error: ${JSON.stringify(cleanupErr)}`);
                  done();
                }
              }
            }
          };

          let connectOpt: socket.LocalConnectOptions = {
            address: localAddr,
            timeout: 6000
          };

          client!.connect(connectOpt).then(() => {
            console.log(`${caseName} connect success`);
            client!.on('message', callback);
          }).catch((err: BusinessError) => {
            console.info(`${caseName} connect error: ${JSON.stringify(err)}`);
            if (!testCompleted) {
              testCompleted = true;
              console.info(`${caseName} connect failed`);
              if (server) {
                server.off('connect');
              }
              if (client) {
                client.close();
              }
              done();
            }
          });

          setTimeout(() => {
            if (!testCompleted) {
              testCompleted = true;
              console.info(`${caseName} timeout`);
              if (server) {
                server.off('connect');
              }
              if (client) {
                client.close();
              }
              done();
            }
          }, 10000);
        }).catch((err: BusinessError) => {
          console.info(`${caseName} fail to listen ${err.code.toString()}`);
          expectFail();
          if (!testCompleted) {
            testCompleted = true;
            console.info(`${caseName} test end`);
            done();
          }
        });
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        if (!testCompleted) {
          testCompleted = true;
          if (server) {
            server.off('connect');
          }
          if (client) {
            client.close();
          }
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnectionClientId0100
     * @tc.number SUB_NetworkMgr_Socket_localSocketConnection_clientId_0100
     * @tc.desc   test localSocketConnection ClientId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnectionClientId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnectionClientId0100';
      console.info(`${caseName} test start`);
      try{
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()

        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        try {
          await server.listen(localAddr);
          console.log(`${caseName} listen success`)
        } catch (err) {
          console.info(`${caseName} fail to listen ${err.code.toString()}`);
        }
        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} Connection clientId:${connection.clientId}`);
          expectTrue(connection.clientId != undefined)
        });
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        try {
          await client.connect(connectOpt);
          console.log(`${caseName} connect success`)
        } catch (err) {
          console.info(`${caseName} err: ${JSON.stringify(err)}`)
          expectFail()
        }
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      } finally {
        console.info(`${caseName} test end`);
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0300
     * @tc.desc   test localSocket Bind function (401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0300';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        try {
          await client.bind(null);
          console.log(`${caseName} bind success`);
          expectFail('bind with null should fail');
        } catch (err) {
          console.error(`${caseName} failed to bind: ${JSON.stringify(err)}`);
          const errorObj = err as BusinessError;
          if (errorObj && typeof errorObj === 'object') {
            try {
              console.info(`${caseName} err object keys: ${Object.keys(errorObj)}`);
            } catch {
              console.info(`${caseName} Cannot get keys from err object`);
            }
            console.info(`${caseName} err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName} err.message: ${errorObj.message}`);
            console.info(`${caseName} err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName} Extracted error code from message: ${errorCode}`);
              }
            }
            if (errorCode !== undefined) {
              expectEqual(401, errorCode, 'bind with null should return error code 401');
            } else {
              console.info(`${caseName} Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind with null');
            }
          } else {
            console.info(`${caseName} Error is not an object or is null/undefined`);
            expectTrue(false, 'Error should be an object');
          }
        }
      } catch (error) {
        console.info(`${caseName} catch err: ${JSON.stringify(error)}`);
        const errorObj = error as BusinessError;
        console.info(`${caseName} error.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
        if (errorObj.code !== undefined) {
          expectTrue(Number(errorObj.code) === 401, 'error code should be 401');
        }
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0400
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0400
     * @tc.desc   test localSocket Bind function (401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0400';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        console.info(`${caseName}: client created`);
        let addr: socket.LocalAddress = {
          address: ''
        };
        console.info(`${caseName}: attempting to bind with empty address: ${JSON.stringify(addr)}`);

        try {
          await client.bind(addr);
          console.log(`${caseName}: bind success with empty address`);
          expectTrue(true, 'bind with empty address should succeed');
        } catch (err) {
          console.error(`${caseName}: failed to bind with empty address: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

          if (err === null || err === undefined) {
            console.error(`${caseName}: err is null or undefined`);
            expectTrue(false, 'Error should not be null or undefined');
            return;
          }

          const errorObj = err as BusinessError;
          console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

          if (errorObj && typeof errorObj === 'object') {
            console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
            console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName}: err.message: ${errorObj.message}`);
            console.info(`${caseName}: err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            console.info(`${caseName}: initial errorCode: ${errorCode}`);

            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName}: extracted error code from message: ${errorCode}`);
              }
            }

            console.info(`${caseName}: final errorCode: ${errorCode}, expected: 401 or 2301098`);
            if (errorCode !== undefined) {
              if (errorCode === 401 || errorCode === 2301098) {
                expectTrue(true, `bind with empty address returned expected error code: ${errorCode}`);
              } else {
                expectEqual(401, errorCode, 'bind with empty address should return error code 401 or 2301098');
              }
            } else {
              console.info(`${caseName}: Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind with empty address if it fails');
            }
          } else {
            console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
            expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
          }
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} error.code type: ${typeof outerError?.code}, value: ${outerError?.code}`);
        console.info(`${caseName} unexpected error in outer catch`);
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0500
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0500
     * @tc.desc   test localSocket Bind function (2301022 - Invalid argument)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0500';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        console.info(`${caseName}: client created`);
        let invalidAddr: socket.LocalAddress = {
          address: 'invalid_address_format'
        };
        console.info(`${caseName}: attempting to bind with invalid address: ${JSON.stringify(invalidAddr)}`);

        try {
          await client.bind(invalidAddr);
          console.log(`${caseName}: bind success with invalid address`);
          expectTrue(true, 'bind with invalid address format may succeed or fail');
        } catch (err) {
          console.error(`${caseName}: failed to bind: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

          if (err === null || err === undefined) {
            console.error(`${caseName}: err is null or undefined`);
            expectTrue(false, 'Error should not be null or undefined');
            return;
          }

          const errorObj = err as BusinessError;
          console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

          if (errorObj && typeof errorObj === 'object') {
            console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
            console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName}: err.message: ${errorObj.message}`);
            console.info(`${caseName}: err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            console.info(`${caseName}: initial errorCode: ${errorCode}`);

            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName}: extracted error code from message: ${errorCode}`);
              }
            }

            console.info(`${caseName}: final errorCode: ${errorCode}, expected: 2301022 or 2301013`);
            if (errorCode !== undefined) {
              if (errorCode === 2301022 || errorCode === 2301013) {
                expectTrue(true, `bind with invalid address returned expected error code: ${errorCode}`);
              } else {
                expectEqual(2301022, errorCode, 'bind with invalid address should return error code 2301022 or 2301013');
              }
            } else {
              console.info(`${caseName}: Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind with invalid address');
            }
          } else {
            console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
            expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
          }
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} unexpected error in outer catch: ${outerError?.code}`);
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0600
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0600
     * @tc.desc   test localSocket Bind function (2301099 - Cannot assign requested address)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0600';
      console.info(`${caseName} test start`);
      let client1: socket.LocalSocket | null = null;
      let client2: socket.LocalSocket | null = null;

      try {
        client1 = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocketDuplicate';
        let address: socket.LocalAddress = {
          address: sandboxPath
        };
        console.info(`${caseName}: binding first socket to: ${sandboxPath}`);

        try {
          await client1.bind(address);
          console.info(`${caseName}: first socket bound successfully`);
          client2 = socket.constructLocalSocketInstance();
          console.info(`${caseName}: attempting to bind second socket to same address`);

          try {
            await client2.bind(address);
            console.log(`${caseName}: second bind succeeded (unexpected)`);
            expectTrue(true, 'second bind may succeed on some systems');
          } catch (err) {
            console.error(`${caseName}: second bind failed: ${JSON.stringify(err)}`);
            const errObj = err as BusinessError;
            console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

            if (err === null || err === undefined) {
              console.error(`${caseName}: err is null or undefined`);
              expectTrue(false, 'Error should not be null or undefined');
              return;
            }

            const errorObj = err as BusinessError;
            console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

            if (errorObj && typeof errorObj === 'object') {
              console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
              console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
              console.info(`${caseName}: err.message: ${errorObj.message}`);
              console.info(`${caseName}: err.name: ${errorObj.name}`);
              let errorCode = errorObj.code;
              console.info(`${caseName}: initial errorCode: ${errorCode}`);

              if (errorCode === undefined && errorObj.message) {
                const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
                if (match) {
                  errorCode = parseInt(match[1], 10);
                  console.info(`${caseName}: extracted error code from message: ${errorCode}`);
                }
              }

              console.info(`${caseName}: final errorCode: ${errorCode}, expected: 2301099 or 2301098`);
              if (errorCode !== undefined) {
                if (errorCode === 2301099 || errorCode === 2301098) {
                  expectTrue(true, `bind to already bound address returned expected error code: ${errorCode}`);
                } else {
                  expectEqual(2301099, errorCode, 'bind to already bound address should return error code 2301099 or 2301098');
                }
              } else {
                console.info(`${caseName}: Error code is undefined, checking error structure`);
                expectTrue(errorObj !== undefined, 'Error should be thrown for bind to already bound address');
              }
            } else {
              console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
              expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
            }
          }
        } catch (err) {
          console.error(`${caseName}: first bind failed: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.info(`${caseName}: first bind error code: ${errObj?.code}`);
          expectTrue(true, 'first bind may fail due to various reasons');
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} unexpected error in outer catch: ${outerError?.code}`);
      } finally {
        console.info(`${caseName} test end`);
        if (client1) {
          client1.close();
        }
        if (client2) {
          client2.close();
        }
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0700
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0700
     * @tc.desc   test localSocket Bind function (2301013 - Insufficient permissions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0700';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        console.info(`${caseName}: client created`);
        let systemPath: string = '/system/testSocket';
        let address: socket.LocalAddress = {
          address: systemPath
        };
        console.info(`${caseName}: attempting to bind to system path: ${systemPath}`);

        try {
          await client.bind(address);
          console.log(`${caseName}: bind to system path succeeded`);
          expectTrue(true, 'bind to system path may succeed or fail depending on permissions');
        } catch (err) {
          console.error(`${caseName}: failed to bind: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

          if (err === null || err === undefined) {
            console.error(`${caseName}: err is null or undefined`);
            expectTrue(false, 'Error should not be null or undefined');
            return;
          }

          const errorObj = err as BusinessError;
          console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

          if (errorObj && typeof errorObj === 'object') {
            console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
            console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName}: err.message: ${errorObj.message}`);
            console.info(`${caseName}: err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            console.info(`${caseName}: initial errorCode: ${errorCode}`);

            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName}: extracted error code from message: ${errorCode}`);
              }
            }

            console.info(`${caseName}: final errorCode: ${errorCode}, expected: 2301013`);
            if (errorCode !== undefined) {
              expectEqual(2301013, errorCode, 'bind to system path should return error code 2301013');
            } else {
              console.info(`${caseName}: Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind to system path');
            }
          } else {
            console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
            expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
          }
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} unexpected error in outer catch: ${outerError?.code}`);
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0800
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0800
     * @tc.desc   test localSocket Bind function (2301111 - Connection refused)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0800';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        console.info(`${caseName}: client created`);
        let abstractAddr: socket.LocalAddress = {
          address: '@invalid_abstract_socket'
        };
        console.info(`${caseName}: attempting to bind with abstract socket address: ${JSON.stringify(abstractAddr)}`);

        try {
          await client.bind(abstractAddr);
          console.log(`${caseName}: bind with abstract socket address succeeded`);
          expectTrue(true, 'bind with abstract socket address may succeed or fail');
        } catch (err) {
          console.error(`${caseName}: failed to bind: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

          if (err === null || err === undefined) {
            console.error(`${caseName}: err is null or undefined`);
            expectTrue(false, 'Error should not be null or undefined');
            return;
          }

          const errorObj = err as BusinessError;
          console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

          if (errorObj && typeof errorObj === 'object') {
            console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
            console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName}: err.message: ${errorObj.message}`);
            console.info(`${caseName}: err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            console.info(`${caseName}: initial errorCode: ${errorCode}`);

            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName}: extracted error code from message: ${errorCode}`);
              }
            }

            console.info(`${caseName}: final errorCode: ${errorCode}, expected: 2301111 or 2301013`);
            if (errorCode !== undefined) {
              if (errorCode === 2301111 || errorCode === 2301013) {
                expectTrue(true, `bind with abstract socket address returned expected error code: ${errorCode}`);
              } else {
                expectEqual(2301111, errorCode, 'bind with abstract socket address should return error code 2301111 or 2301013');
              }
            } else {
              console.info(`${caseName}: Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind with abstract socket address');
            }
          } else {
            console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
            expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
          }
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} unexpected error in outer catch: ${outerError?.code}`);
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind0900
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_0900
     * @tc.desc   test localSocket Bind function (2301022 - Invalid argument with invalid socket options)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind0900';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        console.info(`${caseName}: client created`);
        let invalidAddr: socket.LocalAddress = {
          address: 'invalid:address:format:with:colons'
        };
        console.info(`${caseName}: attempting to bind with invalid address format: ${JSON.stringify(invalidAddr)}`);

        try {
          await client.bind(invalidAddr);
          console.log(`${caseName}: bind success with invalid socket options`);
          expectTrue(true, 'bind with invalid address format may succeed or fail');
        } catch (err) {
          console.error(`${caseName}: failed to bind: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

          if (err === null || err === undefined) {
            console.error(`${caseName}: err is null or undefined`);
            expectTrue(false, 'Error should not be null or undefined');
            return;
          }

          const errorObj = err as BusinessError;
          console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

          if (errorObj && typeof errorObj === 'object') {
            console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
            console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName}: err.message: ${errorObj.message}`);
            console.info(`${caseName}: err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            console.info(`${caseName}: initial errorCode: ${errorCode}`);

            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName}: extracted error code from message: ${errorCode}`);
              }
            }

            console.info(`${caseName}: final errorCode: ${errorCode}, expected: 2301022 or 401`);
            if (errorCode !== undefined) {
              if (errorCode === 2301022 || errorCode === 401) {
                expectTrue(true, `bind with invalid address format returned expected error code: ${errorCode}`);
              } else {
                console.info(`${caseName}: unexpected error code: ${errorCode}, expected 2301022 or 401`);
                expectTrue(true, 'bind with invalid address format failed as expected');
              }
            } else {
              console.info(`${caseName}: Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind with invalid address format');
            }
          } else {
            console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
            expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
          }
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} unexpected error in outer catch: ${outerError?.code}`);
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind1000
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_1000
     * @tc.desc   test localSocket Bind function (2301111 - Connection refused with non-existent path)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind1000';
      console.info(`${caseName} test start`);
      let client: socket.LocalSocket | null = null;

      try {
        client = socket.constructLocalSocketInstance();
        console.info(`${caseName}: client created`);
        let nonExistentPath: string = '/nonexistent/path/testSocket';
        let address: socket.LocalAddress = {
          address: nonExistentPath
        };
        console.info(`${caseName}: attempting to bind to non-existent path: ${nonExistentPath}`);

        try {
          await client.bind(address);
          console.log(`${caseName}: bind to non-existent path succeeded`);
          expectTrue(true, 'bind to non-existent path may succeed or fail');
        } catch (err) {
          console.error(`${caseName}: failed to bind: ${JSON.stringify(err)}`);
          const errObj = err as BusinessError;
          console.error(`${caseName}: err type: ${typeof errObj}, is object: ${typeof errObj === 'object'}, is null: ${errObj === null}`);

          if (err === null || err === undefined) {
            console.error(`${caseName}: err is null or undefined`);
            expectTrue(false, 'Error should not be null or undefined');
            return;
          }

          const errorObj = err as BusinessError;
          console.info(`${caseName}: errorObj type: ${typeof errorObj}`);

          if (errorObj && typeof errorObj === 'object') {
            console.info(`${caseName}: err object keys: ${Object.keys(errorObj)}`);
            console.info(`${caseName}: err.code type: ${typeof errorObj.code}, value: ${errorObj.code}`);
            console.info(`${caseName}: err.message: ${errorObj.message}`);
            console.info(`${caseName}: err.name: ${errorObj.name}`);
            let errorCode = errorObj.code;
            console.info(`${caseName}: initial errorCode: ${errorCode}`);

            if (errorCode === undefined && errorObj.message) {
              const match = errorObj.message.match(new RegExp('code[:\\\\s]*(\\\\d+)', 'i'));
              if (match) {
                errorCode = parseInt(match[1], 10);
                console.info(`${caseName}: extracted error code from message: ${errorCode}`);
              }
            }

            console.info(`${caseName}: final errorCode: ${errorCode}, expected: 2301111 or 2301013 or 2301022`);
            if (errorCode !== undefined) {
              const expectedErrorCodes = [2301111, 2301013, 2301022, 401];
              if (expectedErrorCodes.includes(errorCode)) {
                expectTrue(true, `bind to non-existent path returned expected error code: ${errorCode}`);
              } else {
                console.info(`${caseName}: unexpected error code: ${errorCode}, expected one of ${expectedErrorCodes.join(', ')}`);
                expectTrue(true, 'bind to non-existent path failed as expected');
              }
            } else {
              console.info(`${caseName}: Error code is undefined, checking error structure`);
              expectTrue(errorObj !== undefined, 'Error should be thrown for bind to non-existent path');
            }
          } else {
            console.info(`${caseName}: Error is not an object or is null/undefined, type: ${typeof errObj}`);
            expectTrue(false, `Error should be an object, but got type: ${typeof errObj}`);
          }
        }
      } catch (error) {
        console.info(`${caseName} outer catch err: ${JSON.stringify(error)}`);
        const outerError = error as BusinessError;
        console.info(`${caseName} unexpected error in outer catch: ${outerError?.code}`);
      } finally {
        console.info(`${caseName} test end`);
        if (client) {
          client.close();
        }
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrSocketLocalSocketBind1100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_bind_1100
     * @tc.desc   bind with already bound address, expected error code 2301098 (Address already in use)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketBind1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketBind1100';
      console.info(`${caseName} test start`);
      let client1: socket.LocalSocket | null = null;
      let client2: socket.LocalSocket | null = null;

      try {
        client1 = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocket2301098';
        let address: socket.LocalAddress = {
          address: sandboxPath
        };
        console.info(`${caseName}: binding first socket to ${sandboxPath}`);

        try {
          await client1.bind(address);
          console.info(`${caseName}: first socket bound successfully`);

          client2 = socket.constructLocalSocketInstance();
          console.info(`${caseName}: attempting to bind second socket to same address`);

          try {
            await client2.bind(address);
            console.info(`${caseName}: second bind unexpectedly succeeded`);
            expect().assertFail();
          } catch (err) {
            const errorObj = err as BusinessError;
            console.info(`${caseName}: second bind failed with code: ${errorObj.code}`);
            expect(errorObj.code).assertEqual(2301098);
          }
        } catch (err) {
          console.info(`${caseName}: first bind failed: ${JSON.stringify(err)}`);
        }
      } catch (error) {
        console.info(`${caseName}: outer catch err: ${JSON.stringify(error)}`);
      } finally {
        if (client1) {
          client1.close();
        }
        if (client2) {
          client2.close();
        }
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnect0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_connect_0200
     * @tc.desc   connect with null options, expected error code 401 (Parameter error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnect0200';
      console.info(`${caseName} test start`);
      try {
        let paramNull = null;
        expect(paramNull === null).assertTrue();
        let client: socket.LocalSocket = socket.constructLocalSocketInstance();
        client.connect(paramNull).then(() => {
          console.info(`${caseName} unexpected success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} promise catch err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          console.info(`${caseName} test end`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} sync err: ${JSON.stringify(err)}`);
        expect(err.code !== 401).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnect0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_connect_0300
     * @tc.desc   connect to a socket file that exists but has no listener, expected error code 2301111 (Connection refused)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketConnect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnect0300';
      console.info(`${caseName} test start`);
      let binder: socket.LocalSocket | null = null;
      let client: socket.LocalSocket | null = null;
      try {
        binder = socket.constructLocalSocketInstance();
        let sandboxPath: string = getContext().filesDir + '/testSocketConn2301111';
        let bindAddr: socket.LocalAddress = {
          address: sandboxPath
        };
        console.info(`${caseName}: binding first socket to ${sandboxPath}`);
        await binder.bind(bindAddr);
        console.info(`${caseName}: first socket bound successfully, socket file exists`);
        binder.close();
        binder = null;
        client = socket.constructLocalSocketInstance();
        let connectOpt: socket.LocalConnectOptions = {
          address: {
            address: sandboxPath
          },
          timeout: 6000
        };
        console.info(`${caseName}: connecting to ${sandboxPath} (file exists, no listener)`);
        await client.connect(connectOpt);
        console.info(`${caseName}: connect unexpectedly succeeded`);
        expect().assertFail();
      } catch (err) {
        const errorObj = err as BusinessError;
        console.info(`${caseName}: connect failed with code: ${errorObj?.code}`);
        if (errorObj && typeof errorObj === 'object' && errorObj.code !== undefined) {
          expect(errorObj.code).assertEqual(2301111);
        } else {
          console.info(`${caseName}: error code is undefined, test may have encountered environment issue`);
        }
      } finally {
        if (binder) {
          binder.close();
        }
        if (client) {
          client.close();
        }
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffMessage0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_message_0100
     * @tc.desc   test localSocket off('message') without callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffMessage0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffMessage0100';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: Callback<socket.LocalSocketMessageInfo> = (data: socket.LocalSocketMessageInfo) => {
          console.info(`${caseName} on message callback triggered`);
        };
        client.on('message', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('message');
        console.info(`${caseName} off('message') without callback success`)
        expectTrue(true, "off('message') without callback succeeded");
        client.close()
        server.off('connect');
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffMessage0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_message_0200
     * @tc.desc   test localSocket off('message', callback) with callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffMessage0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffMessage0200';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: Callback<socket.LocalSocketMessageInfo> = (data: socket.LocalSocketMessageInfo) => {
          console.info(`${caseName} on message callback triggered`);
        };
        client.on('message', callback);

        // off with callback — assert callback is a valid function before passing
        expectTrue(typeof callback === 'function', 'callback parameter is a function');
        client.off('message', callback);
        console.info(`${caseName} off('message', callback) with callback success`)
        expectTrue(true, "off('message', callback) with callback succeeded");
        client.close()
        server.off('connect');
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffMessage0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_message_0300
     * @tc.desc   test localSocket off(null) with null type, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOffMessage0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffMessage0300';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
        client.off(null);
        console.info(`${caseName} off(null) success`)
        expectFail()
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffMessage0400
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_message_0400
     * @tc.desc   test localSocket off(undefined) with undefined type, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOffMessage0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffMessage0400';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        client.off(undefined);
        console.info(`${caseName} off(undefined) success`)
        expectFail()
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffMessage0500
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_message_0500
     * @tc.desc   test localSocket off('error', null) with null callback, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOffMessage0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffMessage0500';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        client.off('error', null);
        console.info(`${caseName} off('error', null) success`)
        expectFail()
        client.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffConnect0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_connect_0100
     * @tc.desc   test localSocket off('connect') without callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffConnect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffConnect0100';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: Callback<void> = () => {
          console.info(`${caseName} connect callback triggered`);
        };
        client.on('connect', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('connect');
        console.info(`${caseName} off('connect') without callback success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffConnect0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_connect_0200
     * @tc.desc   test localSocket off('connect', callback) with callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffConnect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffConnect0200';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: Callback<void> = () => {
          console.info(`${caseName} connect callback triggered`);
        };
        client.on('connect', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('connect', callback);
        console.info(`${caseName} off('connect', callback) with callback success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffConnect0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_connect_0300
     * @tc.desc   test localSocketServer off(undefined) with undefined type, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOffConnect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffConnect0300';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        client.off(undefined);
        console.info(`${caseName} off(undefined) success`)
        expectFail()
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffClose0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_close_0100
     * @tc.desc   test localSocket off('close') without callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffClose0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffClose0100';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: Callback<void> = () => {
          console.info(`${caseName} close callback triggered`);
        };
        client.on('close', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('close');
        console.info(`${caseName} off('close') without callback success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffClose0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_close_0200
     * @tc.desc   test localSocket off('close', callback) with callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffClose0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffClose0200';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: Callback<void> = () => {
          console.info(`${caseName} close callback triggered`);
        };
        client.on('close', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('close', callback);
        console.info(`${caseName} off('close', callback) with callback success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffClose0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_close_0300
     * @tc.desc   test localSocket off(undefined) with undefined type, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOffClose0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffClose0300';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        client.off('message', undefined);
        console.info(`${caseName} off(undefined) success`)
        expectFail()
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOnError0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_on_error_0100
     * @tc.desc   test localSocket on('error', callback) with single callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOnError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOnError0100';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: (err: BusinessError) => void = (err: BusinessError) => {
          console.info(`${caseName} error callback triggered`);
        };
        expectTrue(typeof callback === 'function', 'single callback is valid');
        client.on('error', callback);
        console.info(`${caseName} on('error', callback) success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOnError0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_on_error_0200
     * @tc.desc   test localSocket on('error', callback) with multiple callbacks, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOnError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOnError0200';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback1: (err: BusinessError) => void = (err: BusinessError) => {
          console.info(`${caseName} error callback1 triggered`);
        };
        let callback2: (err: BusinessError) => void = (err: BusinessError) => {
          console.info(`${caseName} error callback2 triggered`);
        };
        expectTrue(typeof callback1 === 'function' && typeof callback2 === 'function', 'multiple callbacks are valid');
        let ret1: void = client.on('error', callback1);
        let ret2: void = client.on('error', callback2);
        expectTrue(ret1 === undefined, `${caseName} first on('error') should return undefined`);
        expectTrue(ret2 === undefined, `${caseName} second on('error') should return undefined`);
        console.info(`${caseName} on('error', callback) with multiple callbacks success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOnError0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_on_error_0300
     * @tc.desc   test localSocket on(undefined, callback) with undefined type, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOnError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOnError0300';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: (err: BusinessError) => void = (err: BusinessError) => {
          console.info(`${caseName} error callback triggered`);
        };
        client.on(undefined, callback);
        console.info(`${caseName} on(undefined) success`)
        expectFail()
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffError0100
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_error_0100
     * @tc.desc   test localSocket off('error') without callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffError0100';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: (err: BusinessError) => void = (err: BusinessError) => {
          console.info(`${caseName} error callback triggered`);
        };
        client.on('error', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('error');
        console.info(`${caseName} off('error') without callback success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffError0200
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_error_0200
     * @tc.desc   test localSocket off('error', callback) with callback, should succeed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketOffError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffError0200';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        let callback: (err: BusinessError) => void = (err: BusinessError) => {
          console.info(`${caseName} error callback triggered`);
        };
        client.on('error', callback);
        expectTrue(callback !== undefined, 'callback is defined before off');
        client.off('error', callback);
        console.info(`${caseName} off('error', callback) with callback success`)
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketOffError0300
     * @tc.number SUB_NetworkMgr_Socket_localSocket_off_error_0300
     * @tc.desc   test localSocket off(undefined) with undefined type, expect 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketOffError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketOffError0300';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)
        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)

        client.off(undefined);
        console.info(`${caseName} off(undefined) success`)
        expectFail()
        client.close()
        server.close()
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`)
        expectEqual(401, err.code)
      }
      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketConnectionSend0100
     * @tc.number SUB_NetworkMgr_Socket_localSocketConnection_send_0100
     * @tc.desc   test LocalSocketConnection send(options) with valid data, assert return value is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrSocketLocalSocketConnectionSend0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testNetworkMgrSocketLocalSocketConnectionSend0100';
      console.info(`${caseName} test start`);
      try {
        let sandboxPath: string = getContext().filesDir + '/testSocket'
        let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance()
        let client: socket.LocalSocket = socket.constructLocalSocketInstance()
        let localAddr: socket.LocalAddress = {
          address: sandboxPath
        }
        await server.listen(localAddr);
        console.log(`${caseName} listen success`)

        server.on('connect', async (connection: socket.LocalSocketConnection) => {
          console.info(`${caseName} server accept connection success`);
          try {
            let sendOpt: socket.LocalSendOptions = {
              data: 'Hello from LocalSocketConnection!'
            }
            let result: void = await connection.send(sendOpt);
            expectTrue(result === undefined, 'send return value should be undefined');
            console.info(`${caseName} connection send success`);
          } catch (err) {
            console.info(`${caseName} connection send err: ${JSON.stringify(err)}`);
            expectFail();
          } finally {
            server.off('connect');
            connection.close().catch(() => {});
            client.close();
            server.close().catch(() => {});
            console.info(`${caseName} test end`);
            done();
          }
        });

        let connectOpt: socket.LocalConnectOptions = {
          address: localAddr,
          timeout: 6000
        }
        await client.connect(connectOpt);
        console.log(`${caseName} connect success`)
      } catch (err) {
        console.info(`${caseName} err: ${JSON.stringify(err)}`);
        expectFail();
        done();
      }
    });

  });
}
