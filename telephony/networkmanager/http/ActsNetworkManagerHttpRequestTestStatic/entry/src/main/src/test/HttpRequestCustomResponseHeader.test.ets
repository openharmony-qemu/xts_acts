'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', "expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', "expectInfo", `test failed`);
  }
}

export default function HttpRequestCustomResponseHeaderTest(): void {
  describe('HttpRequestCustomResponseHeaderTest', () => {

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0100
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest_static_0100';
        let serverPort = (9000+Math.round(Math.random()*5000)).toInt();
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            hilog.info(domain, tag, '%{public}s', `${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err) => {
            const error = err as BusinessError;
            console.error(`${caseName} get err is `+JSON.stringify(error));
            ExpectFail();
            done();
          })
          tcpSocketServer.offTcpServerConnect();
          tcpSocketServer.onTcpServerConnect((clientSocket: socket.TCPSocketConnection)=>{
            hilog.info(domain, tag, '%{public}s', `${caseName}-----tcpSocketServer on connect`);
            clientSocket.getRemoteAddress((error: BusinessError | null, clientAddr: socket.NetAddress | undefined) => {
              hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(clientAddr));
            });
            clientSocket.onTcpConnMessage((msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null):\r\n" +   // With key and colon, Without value.
                  ":old cgi ld_library_path = (null)\r\n" +   // Without key, with colon and value.
                  ":\r\n" +                                   // Only one colon.
                  "::\r\n" +                                  // Only two colons.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/5\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort, (err: BusinessError<void> | null, res: http.HttpResponse | undefined) => {
            if (!err!.code) {
              hilog.info(domain, tag, '%{public}s', `${caseName} request success data is `+JSON.stringify(res));
              ExpectTrue(res!.responseCode == 200);
              done();
            } else {
              console.error(`${caseName} request err is `+JSON.stringify(err));
              ExpectFail();
              done();
            }
          });
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest_static_0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0200
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest_static_0200';
        let serverPort = (9000+Math.round(Math.random()*5000)).toInt();
        hilog.info(domain, tag, '%{public}s', `${caseName}---port: ` + serverPort);
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            hilog.info(domain, tag, '%{public}s', `${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err) => {
            const error = err as BusinessError;
            console.error(`${caseName} get err is `+JSON.stringify(error));
            ExpectFail();
            done();
          })
          tcpSocketServer.offTcpServerConnect();
          tcpSocketServer.onTcpServerConnect((clientSocket: socket.TCPSocketConnection)=>{
            hilog.info(domain, tag, '%{public}s', `${caseName}-----tcpSocketServer on connect`);
            clientSocket.getRemoteAddress((error: BusinessError | null, clientAddr: socket.NetAddress | undefined) => {
              hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(clientAddr));
            });
            clientSocket.onTcpConnMessage((msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null):\r\n" +   // With key and colon, Without value.
                  ":old cgi ld_library_path = (null)\r\n" +   // Without key, with colon and value.
                  ":\r\n" +                                   // Only one colon.
                  "::\r\n" +                                  // Only two colons.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/5\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort).then((data: http.HttpResponse) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode == 200);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            console.error(`${caseName} request err is `+JSON.stringify(error));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0300
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest_static_0300';
        let serverPort = (9000+Math.round(Math.random()*5000)).toInt();
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            hilog.info(domain, tag, '%{public}s', `${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err) => {
            const error = err as BusinessError;
            console.error(`${caseName} get err is `+JSON.stringify(error));
            ExpectFail();
            done();
          })
          tcpSocketServer.offTcpServerConnect();
          tcpSocketServer.onTcpServerConnect((clientSocket: socket.TCPSocketConnection)=>{
            hilog.info(domain, tag, '%{public}s', `${caseName}-----tcpSocketServer on connect`);
            clientSocket.getRemoteAddress((error: BusinessError | null, clientAddr: socket.NetAddress | undefined) => {
              hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(clientAddr));
            });
            clientSocket.onTcpConnMessage((msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null)\r\n" +    // Only key, no colon, no value.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/5\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort, (err: BusinessError<void> | null, res: http.HttpResponse | undefined) => {
            if (!err!.code) {
              hilog.info(domain, tag, '%{public}s', `${caseName} request success data is `+JSON.stringify(res));
              ExpectTrue(res!.responseCode == 200);
              done();
            } else {
              console.error(`${caseName} request err is `+JSON.stringify(err));
              ExpectFail();
              done();
            }
          });
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomResponseHeaderTest_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomResponseHeaderTest_0400
     * @tc.desc   Test HttpRequestCustomResponseHeader property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomResponseHeaderTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpRequestCustomResponseHeaderTest_static_0400';
        let serverPort = (9000+Math.round(Math.random()*5000)).toInt();
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
        try {
          let listenAddr: socket.NetAddress = {
            address: "0.0.0.0",
            port: serverPort,
            family: 1
          }
          await tcpSocketServer.listen(listenAddr).then(async ()=> {
            let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
            hilog.info(domain, tag, '%{public}s', `${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err) => {
            const error = err as BusinessError;
            console.error(`${caseName} get err is `+JSON.stringify(error));
            ExpectFail();
            done();
          })
          tcpSocketServer.offTcpServerConnect();
          tcpSocketServer.onTcpServerConnect((clientSocket: socket.TCPSocketConnection)=>{
            hilog.info(domain, tag, '%{public}s', `${caseName}-----tcpSocketServer on connect`);
            clientSocket.getRemoteAddress((error: BusinessError | null, clientAddr: socket.NetAddress | undefined) => {
              hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(clientAddr));
            }).catch((error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, '%{public}s', `${caseName} get err is `+JSON.stringify(err));
          });
            clientSocket.onTcpConnMessage((msgInfo: socket.SocketMessageInfo) => {
              let tcpSendOption: socket.TCPSendOptions = {
                data: "HTTP/1.1 200 OK\r\n" +
                  "Content-Type: text/plain\r\n" +
                  "Cache-Control: no-cache\r\n" +
                  "Connection: keep-alive\r\n" +
                  "Date: Thu Sep 25 18:02:30 2025\r\n" +
                  "Pragma: no-cache\r\n" +
                  "Transfer-Encoding: chunked\r\n" +
                  "X-Frame-Options: SAMEORIGIN\r\n" +
                  "old cgi ld_library_path = (null)\r\n" +    // Only key, no colon, no value.
                  "new cgi ld_library_path = (null): /customer/UI/lib\r\n" +
                  "\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "29\r\n" +
                  "sage ./CGI_PROCESS.sh (no this parameter)\r\n" +
                  "2\r\n" +
                  "OK\r\n" +
                  "1a\r\n" +
                  "Camera.Preview.RTSP.av=4/7\r\n" +
                  "0\r\n" +
                  "\r\n"
              }
              clientSocket.send(tcpSendOption);
            });
          });
          let httpRequest = http.createHttp();
          httpRequest.request("http://localhost:"+ serverPort).then((data: http.HttpResponse) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode == 200);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            console.error(`${caseName} request err is `+JSON.stringify(error));
            ExpectFail();
            done();
          });
        } catch (err) {
          console.error(`${caseName} catch err is `+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
  });
}
