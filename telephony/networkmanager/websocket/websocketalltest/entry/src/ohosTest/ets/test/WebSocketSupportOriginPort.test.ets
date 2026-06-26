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
const TIMEOUT_MS = 10000;
const SERVER_HOST = '127.0.0.1';
const HTTP_SERVER_HOST = 'http://127.0.0.1';
const HTTPS_SERVER_HOST = 'https://127.0.0.1';
const WEBSOCKET_MAGIC = '258EAFA5-E914-47DA-95CA-C5AB0DC85B11';
let key = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsdp9zb89pZXWA\n" +
  "xchWAR5mjyaC5aqJS+/guBsIgCxpDCfIJG0vKUwqoYHjb9ajaZ+9mbv0Feu1p4B7\n" +
  "JUZ769hsLeCLcmFYT6PTf9qrdkEz/lwq+/AeY22TPHyTxgxEbHll3uoA/pK+931O\n" +
  "x+gkiHzYsu7xqNPciRx+laaYG/XGvVPB/k8LnIkddOzUTyLmorc44XoathlNcUo+\n" +
  "frj2VeS6obkpSIRlgNO/InnSCK+ChinBzVfHqksOV4UVjAfcU5Ru+zoMh66VSvTP\n" +
  "dOr1TTnbCu1fJ3PHaXKlV7AHzIN1e1iu6PxhJazWZ47dG8RU03kTS/c/b599AxZU\n" +
  "rwYsMmQrAgMBAAECggEACIyLdDzIpUrYO5087wvN0VEAnGB8xvgyreBdHAYZLXk4\n" +
  "HPML+S3XjrgZfjK0YGlYonIVH7uucX9vc6tHW9aMZeBoTxaeaLLvRglXx5lsZgK9\n" +
  "LYxLkitk6nWHH17Oi4htBCBmrSHxbZygY4quoTulegB0rm9WATVIFPufbyQuV2ma\n" +
  "Va+hDwJa8moLZp6YH2Ouf4PXMVKODPxDw/+6qah7MdvfIb6gMuCDBQaYYMBbDMEQ\n" +
  "DhfGreiNozpO3BQU/qQW++jb9eymAoBbSYYAew4+nhESf73DSSyR6M3W6t7DDuCn\n" +
  "XqnOn5lXTco075egLPM3E26nFJI5ka3rxx+ZnuXCoQKBgQDVkBsdDGOAPN0llv3q\n" +
  "3dv2yN6eb2U6Z0471fBb49y9mjtlY0JE0pY8im4wYAAjDIarUSaRCPd0ydvmGVIj\n" +
  "7MEZ912QlP6J8iVrP0Af6uYlqZ7Z5PkzpaCDMkf1SJB66yPZ78WERaF5GFfx/Dly\n" +
  "bO5yffUmKGkS7bWC+0TwfBSFgwKBgQDOu8sF+bNJHmZ2jAOeopzJHdIaWysYaGW3\n" +
  "O63VAP6F3yxNwyd0W4qryIOHij8YUzYeUO8bnN/XmR67vl8a71RBNG/PSE/VUykS\n" +
  "5cnHwLE7C0EO8p8Q4dynyhQBt7HfpP/ZKNmcCQbxCitYpvJp69SHIvDOoSQCgcoS\n" +
  "gVZF7YaOOQKBgHdFMO9LMPK4iyVoK00VNLihvDqtqdIxSa7/L2qSWoCFd3CLO8Jl\n" +
  "/cO36AwaQVlRsJBTFP/hCxptdeMO9yHbIokW7mlF3NY7pww7Wdu5e2lDTtUQHODs\n" +
  "OjWrSibBrPcJBY+8agoSPTj9EHizzX2LOqw0jkoOPYh1u254WCsakPdzAoGAKPUb\n" +
  "q/tkgb/8HNBwhyVAWrgFwCL/zr4gKMUyE1k3E967MEzRrEPWnWIEbP3+shsKRcdT\n" +
  "F+1ki5pSdG+q9/MihiiVXkO9TU5EfPH5oBGVC1WXdharXPTienuWqyBxpRVTevqU\n" +
  "4k0HiwmwvMeWj1WhrYRGoSlbsQN1vWTSatg8KEECgYBxjybidxhtfetzOxwA/gHT\n" +
  "Yy28pKu36RU/hkIbCzTIEZvgkr5UBhFIwoLP5GnV36qkfnmsVQCxJPJf1mM+tUsO\n" +
  "O60gv9WasjrV3/I7hkfgYloIL95jtvDMC44QTi7AzltA0YsYW0T/rYY/pz1Occm/\n" +
  "4O3kZdWUbIIpjs2PV6rnMQ==\n" +
  "-----END PRIVATE KEY-----\n"

let certRight = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDCTCCAfGgAwIBAgIUYDfxhcA83RQQNN/B9uldTXer+UQwDQYJKoZIhvcNAQEL\n" +
  "BQAwFDESMBAGA1UEAwwJbG9jYWxob3N0MB4XDTI1MDcyNzA5MTYzMVoXDTMzMTAx\n" +
  "MzA5MTYzMVowFDESMBAGA1UEAwwJbG9jYWxob3N0MIIBIjANBgkqhkiG9w0BAQEF\n" +
  "AAOCAQ8AMIIBCgKCAQEArHafc2/PaWV1gMXIVgEeZo8mguWqiUvv4LgbCIAsaQwn\n" +
  "yCRtLylMKqGB42/Wo2mfvZm79BXrtaeAeyVGe+vYbC3gi3JhWE+j03/aq3ZBM/5c\n" +
  "KvvwHmNtkzx8k8YMRGx5Zd7qAP6Svvd9TsfoJIh82LLu8ajT3IkcfpWmmBv1xr1T\n" +
  "wf5PC5yJHXTs1E8i5qK3OOF6GrYZTXFKPn649lXkuqG5KUiEZYDTvyJ50givgoYp\n" +
  "wc1Xx6pLDleFFYwH3FOUbvs6DIeulUr0z3Tq9U052wrtXydzx2lypVewB8yDdXtY\n" +
  "ruj8YSWs1meO3RvEVNN5E0v3P2+ffQMWVK8GLDJkKwIDAQABo1MwUTAdBgNVHQ4E\n" +
  "FgQUQVIvbnYEMsWDmLP0+xx8Y4/cYHEwHwYDVR0jBBgwFoAUQVIvbnYEMsWDmLP0\n" +
  "+xx8Y4/cYHEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAjI2m\n" +
  "9gUdeGtEZxiXb1WmPdJ9N4b9by2OvVziMDKh1gxy27ytlQCVjGYaw3AN/fdhTeRI\n" +
  "LHXAQHUm+PmazPo8mGdN+9SRrop/j0WXx5jGI0POoeK24Jswi2whg/JI5hmE3IYc\n" +
  "PtXGfSJaP2bHm++MNczt7ZS6p+ZYGVLaTWzIxhSDhpTLyZkj3Yi9fSsZcdlqCpvL\n" +
  "Yrdzx0v/QzkWnZkjtQWXf80/jfdFvMCmTmsArgea/up1cbEauBp+me7yQTCHkVzf\n" +
  "EtC7b10L5egH8JCm7du+5s+QifHYTV0ELxHVzBkIynCA65EGV5eNojPmg8XRPWBf\n" +
  "YB/6QUsI42+FMzTnPQ==\n" +
  "-----END CERTIFICATE-----\n";
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
    console.warn(`safeClose: Failed to close WebSocket, error: ${JSON.stringify(err)}`);
  }
}

async function safeCloseConnection(conn: socket.TCPSocketConnection | undefined): Promise<void> {
  if (!conn) return;
  try {
    await conn.close();
  } catch (err) {
    console.warn(`safeCloseConnection: Failed to close TCPSocketConnection, error: ${JSON.stringify(err)}`);
  }
}

async function safeCloseTLSConnection(conn: socket.TLSSocketConnection | undefined): Promise<void> {
  if (!conn) return;
  try {
    await conn.close();
  } catch (err) {
    console.warn(`safeCloseTLSConnection: Failed to close TLSSocketConnection, error: ${JSON.stringify(err)}`);
  }
}

async function safeCloseServer(server: socket.TCPSocketServer | undefined): Promise<void> {
  if (!server) return;
  try {
    await server.close();
  } catch (err) {
    console.warn(`safeCloseServer: Failed to close TCPSocketServer, error: ${JSON.stringify(err)}`);
  }
}

async function safeCloseTLSServer(server: socket.TLSSocketServer | undefined): Promise<void> {
  if (!server) return;
  try {
    await server.close();
  } catch (err) {
    console.warn(`safeCloseTLSServer: Failed to close TLSSocketServer, error: ${JSON.stringify(err)}`);
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
  let wsConnected = false;
  let tlsServerErrorHandler: ((err: BusinessError) => void) | undefined;
  let tlsServerConnectHandler: ((conn: socket.TLSSocketConnection) => void) | undefined;
  let tlsConnectionErrorHandler: ((err: BusinessError) => void) | undefined;
  let tlsConnectionMessageHandler: ((messageInfo: socket.SocketMessageInfo) => void) | undefined;
  let tcpServerErrorHandler: ((err: BusinessError) => void) | undefined;
  let tcpServerConnectHandler: ((conn: socket.TCPSocketConnection) => void) | undefined;
  let tcpConnectionErrorHandler: ((err: BusinessError) => void) | undefined;
  let tcpConnectionMessageHandler: ((messageInfo: socket.SocketMessageInfo) => void) | undefined;

  try {
    if (secure) {
      tlsServer = socket.constructTLSSocketServerInstance();
      await tlsServer.listen({
        address: { address: SERVER_HOST, port: port },
        secureOptions: { ca: certRight, cert: certRight, key: key }
      });
    } else {
      tcpServer = socket.constructTCPSocketServerInstance();
      await tcpServer.listen({ address: SERVER_HOST, port: port });
    }

    await sleep(100);

    const handshakePromise = new Promise<void>((resolve, reject) => {
      const timeout = setTimeout(() => reject(new Error('Handshake timeout')), TIMEOUT_MS);

      if (secure && tlsServer) {
        tlsServerErrorHandler = (err: BusinessError) => {
          clearTimeout(timeout);
          reject(err);
        };
        tlsServer.on('error', tlsServerErrorHandler);

        tlsServerConnectHandler = (conn: socket.TLSSocketConnection) => {
          tlsConnection = conn;
          tlsConnectionErrorHandler = (err: BusinessError) => {
            clearTimeout(timeout);
            reject(err);
          };
          conn.on('error', tlsConnectionErrorHandler);

          tlsConnectionMessageHandler = (messageInfo) => {
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
          };
          conn.on('message', tlsConnectionMessageHandler);
        };
        tlsServer.on('connect', tlsServerConnectHandler);
      } else if (tcpServer) {
        tcpServerErrorHandler = (err: BusinessError) => {
          clearTimeout(timeout);
          reject(err);
        };
        tcpServer.on('error', tcpServerErrorHandler);

        tcpServerConnectHandler = (conn: socket.TCPSocketConnection) => {
          tcpConnection = conn;
          tcpConnectionErrorHandler = (err: BusinessError) => {
            clearTimeout(timeout);
            reject(err);
          };
          conn.on('error', tcpConnectionErrorHandler);

          tcpConnectionMessageHandler = (messageInfo) => {
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
          };
          conn.on('message', tcpConnectionMessageHandler);
        };
        tcpServer.on('connect', tcpServerConnectHandler);
      }
    });
    const url = secure ? `wss://${SERVER_HOST}:${port}` : `ws://${SERVER_HOST}:${port}`;
    console.info(`${caseName} url is ${url}`);
    const connectOptions: webSocket.WebSocketRequestOptions = {
      header: options.header,
      supportOriginPort: options.supportOriginPort,
      skipServerCertVerification: true
    };
    const connectPromise = ws.connect(url, connectOptions).then(() => {
      wsConnected = true;
    });
    await Promise.all([connectPromise, handshakePromise]);
    expectEqual(originHeader, expectedOrigin, `${caseName} origin header`);
    expectTrue(requestText.includes('GET / HTTP/1.1'), `${caseName} request line`);

  } finally {
    if (secure) {
      if (tlsConnection && tlsConnectionErrorHandler) {
        tlsConnection.off('error', tlsConnectionErrorHandler);
      }
      if (tlsConnection && tlsConnectionMessageHandler) {
        tlsConnection.off('message', tlsConnectionMessageHandler);
      }
      if (tlsServer && tlsServerErrorHandler) {
        tlsServer.off('error', tlsServerErrorHandler);
      }
      if (tlsServer && tlsServerConnectHandler) {
        tlsServer.off('connect', tlsServerConnectHandler);
      }
      await safeCloseTLSConnection(tlsConnection);
      await safeCloseTLSServer(tlsServer);
    } else {
      if (tcpConnection && tcpConnectionErrorHandler) {
        tcpConnection.off('error', tcpConnectionErrorHandler);
      }
      if (tcpConnection && tcpConnectionMessageHandler) {
        tcpConnection.off('message', tcpConnectionMessageHandler);
      }
      if (tcpServer && tcpServerErrorHandler) {
        tcpServer.off('error', tcpServerErrorHandler);
      }
      if (tcpServer && tcpServerConnectHandler) {
        tcpServer.off('connect', tcpServerConnectHandler);
      }
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
          await testOriginHeader(caseName, 8119, { supportOriginPort: supportOriginPort }, HTTPS_SERVER_HOST,true);
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
          await testOriginHeader(caseName, 8121, { supportOriginPort: supportOriginPort }, `${HTTPS_SERVER_HOST}:8121`,true);
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
