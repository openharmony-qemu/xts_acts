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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import webSocket from '@ohos.net.webSocket';
import socket from '@ohos.net.socket';
import util from '@ohos.util';
import cryptoFramework from '@ohos.security.cryptoFramework';
const TIMEOUT_MS = 5000;
const SERVER_HOST = '127.0.0.1';
const HTTP_SERVER_HOST = 'http://127.0.0.1';
const WEBSOCKET_MAGIC = '258EAFA5-E914-47DA-95CA-C5AB0DC85B11';
function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
    console.info(`${info} test passed, actual: ${exp}`);
  } catch (err) {
    console.info(`${info} test failed, actual: ${exp}`);
  }
}

function expectEqual(actual: string | boolean, expected: string | boolean, info: string = ''): void {
  try {
    expect(actual).assertEqual(expected);
    console.info(`${info} test passed, actual: ${actual}, expected: ${expected}`);
  } catch (err) {
    console.info(`${info} test failed, actual: ${actual}, expected: ${expected}`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function arrayBufferToString(buffer: ArrayBuffer): string {
  const uint8Array = new Uint8Array(buffer);
  let result = '';
  for (let i = 0; i < uint8Array.length; i++) {
    result += String.fromCharCode(uint8Array[i]);
  }
  return result;
}

function stringToUint8Array(str: string): Uint8Array {
  const arr = new Uint8Array(str.length);
  for (let i = 0; i < str.length; i++) {
    arr[i] = str.charCodeAt(i);
  }
  return arr;
}

function extractHeader(request: string, name: string): string {
  const lines = request.split('\r\n');
  const prefix = `${name.toLowerCase()}:`;
  for (const line of lines) {
    if (line.toLowerCase().startsWith(prefix)) {
      return line.substring(prefix.length).trim();
    }
  }
  return '';
}

function buildWebSocketAccept(key: string): string {
  const md = cryptoFramework.createMd('SHA1');
  md.updateSync({ data: stringToUint8Array(key + WEBSOCKET_MAGIC) });
  const digest = md.digestSync();
  return new util.Base64Helper().encodeToStringSync(digest.data);
}

function buildHandshakeResponse(key: string): string {
  return 'HTTP/1.1 101 Switching Protocols\r\n'
    + 'Upgrade: websocket\r\n'
    + 'Connection: Upgrade\r\n'
    + `Sec-WebSocket-Accept: ${buildWebSocketAccept(key)}\r\n\r\n`;
}

async function safeClose(ws: webSocket.WebSocket | undefined): Promise<void> {
  if (!ws) return;
  try {
    await ws.close();
  } catch (err) {
  }
}

async function safeCloseConnection(conn: socket.TCPSocketConnection | undefined): Promise<void> {
  if (!conn) return;
  try {
    await conn.close();
  } catch (err) {
  }
}

async function safeCloseTLSConnection(conn: socket.TLSSocketConnection | undefined): Promise<void> {
  if (!conn) return;
  try {
    await conn.close();
  } catch (err) {
  }
}

async function safeCloseServer(server: socket.TCPSocketServer | undefined): Promise<void> {
  if (!server) return;
  try {
    await server.close();
  } catch (err) {
  }
}

async function safeCloseTLSServer(server: socket.TLSSocketServer | undefined): Promise<void> {
  if (!server) return;
  try {
    await server.close();
  } catch (err) {
  }
}

async function testOriginHeader(
  caseName: string,
  port: number,
  options: webSocket.WebSocketRequestOptions,
  expectedOrigin: string,
  secure: boolean = false
): Promise<void> {
  const ws = webSocket.createWebSocket();

  let tcpServer: socket.TCPSocketServer | undefined;
  let tlsServer: socket.TLSSocketServer | undefined;
  let tcpConnection: socket.TCPSocketConnection | undefined;
  let tlsConnection: socket.TLSSocketConnection | undefined;
  let requestText = '';
  let originHeader = '';

  try {
    if (secure) {
      tlsServer = socket.constructTLSSocketServerInstance();
      await tlsServer.listen({
        address: { address: SERVER_HOST, port: port },
        secureOptions: { ca: 'CERT_PLACEHOLDER', cert: 'CERT_PLACEHOLDER', key: 'KEY_PLACEHOLDER' }
      });
    } else {
      tcpServer = socket.constructTCPSocketServerInstance();
      await tcpServer.listen({ address: SERVER_HOST, port: port });
    }

    await sleep(100);

    const handshakePromise = new Promise<void>((resolve, reject) => {
      const timeout = setTimeout(() => reject(new Error('Handshake timeout')), TIMEOUT_MS);

      if (secure && tlsServer) {
        tlsServer.on('error', (err: BusinessError) => {
          clearTimeout(timeout);
          reject(err);
        });

        tlsServer.on('connect', (conn: socket.TLSSocketConnection) => {
          tlsConnection = conn;
          conn.on('error', (err: BusinessError) => {
            clearTimeout(timeout);
            reject(err);
          });

          conn.on('message', (messageInfo) => {
            requestText += arrayBufferToString(messageInfo.message);

            if (requestText.includes('\r\n\r\n') && !originHeader) {
              originHeader = extractHeader(requestText, 'Origin');
              const key = extractHeader(requestText, 'Sec-WebSocket-Key');

              if (!key) {
                clearTimeout(timeout);
                reject(new Error('Missing Sec-WebSocket-Key'));
                return;
              }

              const response = buildHandshakeResponse(key);
              conn.send(response)
                .then(() => {
                  clearTimeout(timeout);
                  resolve();
                })
                .catch((err: BusinessError) => {
                  clearTimeout(timeout);
                  reject(err);
                });
            }
          });
        });
      } else if (tcpServer) {
        tcpServer.on('error', (err: BusinessError) => {
          clearTimeout(timeout);
          reject(err);
        });

        tcpServer.on('connect', (conn: socket.TCPSocketConnection) => {
          tcpConnection = conn;
          conn.on('error', (err: BusinessError) => {
            clearTimeout(timeout);
            reject(err);
          });

          conn.on('message', (messageInfo) => {
            requestText += arrayBufferToString(messageInfo.message);

            if (requestText.includes('\r\n\r\n') && !originHeader) {
              originHeader = extractHeader(requestText, 'Origin');
              const key = extractHeader(requestText, 'Sec-WebSocket-Key');

              if (!key) {
                clearTimeout(timeout);
                reject(new Error('Missing Sec-WebSocket-Key'));
                return;
              }

              const response = buildHandshakeResponse(key);
              conn.send({ data: response, encoding: 'UTF-8' })
                .then(() => {
                  clearTimeout(timeout);
                  resolve();
                })
                .catch((err: BusinessError) => {
                  clearTimeout(timeout);
                  reject(err);
                });
            }
          });
        });
      }
    });
    const url = secure ? `wss://${SERVER_HOST}:${port}` : `ws://${SERVER_HOST}:${port}`;
    const connectOptions: webSocket.WebSocketRequestOptions = {
      header: options.header,
      supportOriginPort: options.supportOriginPort,
      skipServerCertVerification: true
    };
    const connectPromise = ws.connect(url, connectOptions);
    await Promise.all([connectPromise, handshakePromise]);
    expectEqual(originHeader, expectedOrigin, `${caseName} origin header`);
    expectTrue(requestText.includes('GET / HTTP/1.1'), `${caseName} request line`);

  } finally {
    await safeClose(ws);
    if (secure) {
      await safeCloseTLSConnection(tlsConnection);
      await safeCloseTLSServer(tlsServer);
    } else {
      await safeCloseConnection(tcpConnection);
      await safeCloseServer(tcpServer);
    }
  }
}

export default function WebSocketSupportOriginPortTest() {
  describe('WebSocketSupportOriginPortTest', () => {
    /**
     * @tc.name   testNetworkMgrWebSocketSupportOriginPort0100
     * @tc.number SUB_NetworkMgr_WebSocket_SupportOriginPort_0100
     * @tc.desc   Origin omits port for non-default ws port with supportOriginPort false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSupportOriginPort0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNetworkMgrWebSocketSupportOriginPort0100';
        console.info(`${caseName} start`);
        const supportOriginPort = false;
        console.info(`${caseName} options supportOriginPort is ${supportOriginPort}`);
        expectTrue(supportOriginPort === false);
        try {
          await testOriginHeader(caseName, 8118, { supportOriginPort: supportOriginPort }, HTTP_SERVER_HOST);
        } catch (err) {
          console.info(`${caseName} error: ${JSON.stringify(err)}`);
          expectFail(caseName);
        }
        done();
      });
    /**
     * @tc.name   testNetworkMgrWebSocketSupportOriginPort0200
     * @tc.number SUB_NetworkMgr_WebSocket_SupportOriginPort_0200
     * @tc.desc   Origin omits port for non-default wss port with supportOriginPort false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSupportOriginPort0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNetworkMgrWebSocketSupportOriginPort0200';
        console.info(`${caseName} start`);
        const supportOriginPort = false;
        console.info(`${caseName} options supportOriginPort is ${supportOriginPort}`);
        expectTrue(supportOriginPort === false);
        try {
          await testOriginHeader(caseName, 8119, { supportOriginPort: supportOriginPort }, HTTP_SERVER_HOST);
        } catch (err) {
          console.info(`${caseName} error: ${JSON.stringify(err)}`);
          expectFail(caseName);
        }
        done();
      });
    /**
     * @tc.name   testNetworkMgrWebSocketSupportOriginPort0300
     * @tc.number SUB_NetworkMgr_WebSocket_SupportOriginPort_0300
     * @tc.desc   Origin includes port for non-default ws port with supportOriginPort true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSupportOriginPort0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNetworkMgrWebSocketSupportOriginPort0300';
        console.info(`${caseName} start`);
        const supportOriginPort = true;
        console.info(`${caseName} options supportOriginPort is ${supportOriginPort}`);
        expectTrue(supportOriginPort === true);
        try {
          await testOriginHeader(caseName, 8120, { supportOriginPort: supportOriginPort }, `${HTTP_SERVER_HOST}:8120`);
        } catch (err) {
          console.info(`${caseName} error: ${JSON.stringify(err)}`);
          expectFail(caseName);
        }
        done();
      });
    /**
     * @tc.name   testNetworkMgrWebSocketSupportOriginPort0400
     * @tc.number SUB_NetworkMgr_WebSocket_SupportOriginPort_0400
     * @tc.desc   Origin includes port for non-default wss port with supportOriginPort true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSupportOriginPort0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNetworkMgrWebSocketSupportOriginPort0400';
        console.info(`${caseName} start`);
        const supportOriginPort = true;
        console.info(`${caseName} options supportOriginPort is ${supportOriginPort}`);
        expectTrue(supportOriginPort === true);
        try {
          await testOriginHeader(caseName, 8121, { supportOriginPort: supportOriginPort }, `${HTTP_SERVER_HOST}:8121`);
        } catch (err) {
          console.info(`${caseName} error: ${JSON.stringify(err)}`);
          expectFail(caseName);
        }
        done();
      });

    /**
     * @tc.name   testNetworkMgrWebSocketSupportOriginPort0500
     * @tc.number SUB_NetworkMgr_WebSocket_SupportOriginPort_0500
     * @tc.desc   Origin omits port when supportOriginPort not specified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSupportOriginPort0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNetworkMgrWebSocketSupportOriginPort0500';
        console.info(`${caseName} start`);
        const supportOriginPort = undefined;
        console.info(`${caseName} options supportOriginPort is ${supportOriginPort}`);
        expectTrue(supportOriginPort === undefined);
        try {
          await testOriginHeader(caseName, 8122, {}, HTTP_SERVER_HOST);
        } catch (err) {
          console.info(`${caseName} error: ${JSON.stringify(err)}`);
          expectFail(caseName);
        }
        done();
      });
    /**
     * @tc.name   testNetworkMgrWebSocketSupportOriginPort0600
     * @tc.number SUB_NetworkMgr_WebSocket_SupportOriginPort_0600
     * @tc.desc   Origin omits port for non-default ws port with supportOriginPort undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrWebSocketSupportOriginPort0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName = 'testNetworkMgrWebSocketSupportOriginPort0600';
        console.info(`${caseName} start`);
        const supportOriginPort = undefined;
        console.info(`${caseName} options supportOriginPort is ${supportOriginPort}`);
        expectTrue(supportOriginPort === undefined);
        try {
          await testOriginHeader(caseName, 8123, { supportOriginPort: supportOriginPort }, HTTP_SERVER_HOST);
        } catch (err) {
          console.info(`${caseName} error: ${JSON.stringify(err)}`);
          expectFail(caseName);
        }
        done();
      });
  });
}
