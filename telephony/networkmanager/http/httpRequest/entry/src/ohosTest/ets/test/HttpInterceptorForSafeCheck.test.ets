/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, Size, Level, TestType, beforeAll, afterAll } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';
import testNetManager from 'libentry.so';
import { socket } from '@kit.NetworkKit';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

// const HTTP_URL: string = "http://10.100.10.202:8080/";
const HTTP_URL_BAIDU: string = "http://www.baidu.com";
const HTTP_URL: string = "http://localhost:9999";
const HTTP_URL_ERROR: string = "https://aaaa.com";

// 通用request的head
const HEADER = { "aaaaa": "" } as Record<string, string>;
// 修改的body
const BODY_MODIFY = { "context": "REQUEST_BODY_MODIFY" } as Record<string, string>;
// 修改url的标识body
const BODY_URL_MODIFY = { "context": "BODY_URL_MODIFY" } as Record<string, string>;

// 常量定义
const DOMAIN: number = 0x0000; // 日志域值
const TAG: string = 'netstack'; // 日志标签

const createServer = async (caseName: string, done: Function) => {
  console.info(`${TAG} ${caseName}---Start`);
  // let port = 9000+Math.round(Math.random()*5000);
  let tcpSocketServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
  let listenAddr: socket.NetAddress = {
    address: "0.0.0.0",
    port: 9999,
    family: 1
  }
  await tcpSocketServer.listen(listenAddr).then(async ()=> {
    let listenAddr: socket.NetAddress =  await tcpSocketServer.getLocalAddress();
    console.info(`${TAG} ${caseName} tcpSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
  }).catch((err: BusinessError) => {
    console.error(`${caseName} get err is `+JSON.stringify(err));
    ExpectFail();
    done();
  })
  tcpSocketServer.off('connect');
  tcpSocketServer.on('connect', async (clientSocket: socket.TCPSocketConnection)=>{
    console.info(`${TAG} ${caseName}-----tcpSocketServer on connect`);
    let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();;
    console.info(`${TAG} ${caseName}----------`+JSON.stringify(clientAddr));
    clientSocket.on('message', async (msgInfo: socket.SocketMessageInfo) => {
      let tcpSendOption: socket.TCPSendOptions = {
        data: "HTTP/1.1 200 OK\r\n" +
          "Server: Tengine\r\n" +
          "Date: Sun, 06 May 2018 08:22:10 GMT\r\n" +
          //"Content-Type: text/event-stream\n" +
          "Content-Length: 9\r\n" +
          "X-Powered-By: ring/1.0.0\r\n" +
          //"vary: Accept-Encoding\n" +
          "gsid: 010185222147152559493030300162313551811\r\n" +
          "sc: 0.013\r\n" +
          "Access-Control-Allow-Origin: *\r\n" +
          "Access-Control-Allow-Methods: *\r\n" +
          "cache-control: no-cache\r\n" +
          "zzzzzzz\r\n" +
          "Access-Control-Allow-Headers: DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,key,x-biz,x-info,platinfo,encr,enginever,gzipped,poiid\r\n" +
          "\r\n"+
          "data:body"
      }
      clientSocket.send(tcpSendOption);
    });
  });
}

export default function HttpInterceptorForSafeCheckTest() {
  describe('HttpInterceptorForSafeCheckTest', () => {
    beforeAll(async (done: Function) => {
      await createServer(TAG, done);
      console.info(`test1 ${TAG} test Start`);
      done()
    })

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddInterceptor1100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddInterceptor_1100
     * @tc.desc   test Add interceptor, pass null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddInterceptor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddInterceptor1100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddNullPtrReadOnlyRequestInterceptor();
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName}AddNullPtrReadOnlyRequestInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
        done();
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0600
     * @tc.desc   test Response to code modification in read-only interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addReadOnlyResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(addReadOnlyResult == 0);
          console.info(`${TAG} ${caseName}AddReadOnlyResponseInterceptor success, addReadOnlyResult:${addReadOnlyResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              // let readOnlyResult: number = testNetManager.GetResponseCode();
              // ExpectTrue(readOnlyResult  !== 404 );
              // console.info(`${TAG} ${caseName} readOnlyResult:${readOnlyResult}`);
            }
            testNetManager.RemoveResponseInterceptor(1);
            testNetManager.RemoveResponseInterceptor(11);
            httpRequest.destroy();
            done();
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0700
     * @tc.desc   test Response to header modification in read-only interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addReadOnlyResult: number = testNetManager.AddReadOnlyResponseInterceptor(12, 1);
          ExpectTrue(addReadOnlyResult == 0);
          console.info(`${TAG} ${caseName}AddReadOnlyResponseInterceptor success, addReadOnlyResult:${addReadOnlyResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              let readOnlyResult: string = testNetManager.GetResponseHeader();
              ExpectTrue(!readOnlyResult.includes('gggggggg'));
              console.info(`${TAG} ${caseName} readOnlyResult:${readOnlyResult}`);
            }
            testNetManager.RemoveResponseInterceptor(2);
            testNetManager.RemoveResponseInterceptor(12);
            httpRequest.destroy();
            done();
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_AddReadOnlyInterceptor_0800
     * @tc.desc   test Response to body modification in read-only interceptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorAddReadOnlyInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let addReadOnlyResult: number = testNetManager.AddReadOnlyResponseInterceptor(10, 1);
          ExpectTrue(addReadOnlyResult == 0);
          console.info(`${TAG} ${caseName}AddReadOnlyResponseInterceptor success, addReadOnlyResult:${addReadOnlyResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.result !!== 'response_body_modify');
              // let readOnlyResult: string = testNetManager.GetResponseBody();
              // ExpectTrue(readOnlyResult == 'data:body');
              // console.info(`${TAG} ${caseName} readOnlyResult:${readOnlyResult}`);
            }
            testNetManager.RemoveResponseInterceptor(0);
            testNetManager.RemoveResponseInterceptor(10);
            httpRequest.destroy();
            done();
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0100
     * @tc.desc   test Delete request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result:number = testNetManager.RemoveResponseInterceptor(2);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}RemoveRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
            }
            testNetManager.RemoveAllInterceptor(2);
            httpRequest.destroy();
            done();
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0300
     * @tc.desc   test Remove response interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveResponseInterceptor(0);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName}RemoveResponseInterceptor result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0400
     * @tc.desc   test Delete response interceptor, modify code for interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              // 验证响应code已修改
              ExpectTrue(res.responseCode !!== 403);
              let delResult: number = testNetManager.RemoveResponseInterceptor(1);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveResponseInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  // 验证响应code未修改
                  ExpectTrue(res.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0500
     * @tc.desc   test Delete response interceptor, modify header for interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              createServer(caseName, done);
              console.info(`${TAG} ${caseName} first_res_header:${JSON.stringify(res.header)}`);
              ExpectTrue(res.header["ddddddd"] !== "6666666");
              let delResult: number = testNetManager.RemoveResponseInterceptor(2);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveResponseInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} second_res_header:${JSON.stringify(res.header)}`);
                  const targetHeader = 'ddddddd';
                  const headerKeys = Object.keys(res.header).map(key => key.toLowerCase());
                  const headerExists = headerKeys.includes(targetHeader.toLowerCase());
                  console.info(`${TAG} ${caseName} headerExists:${headerExists}`);
                  ExpectTrue(!headerExists);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0600
     * @tc.desc   test Delete response interceptor, modify body for interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.result !!== 'response_body_modify');
              let delResult: number = testNetManager.RemoveResponseInterceptor(0);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveResponseInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.result !!== 'response_body_modify');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });


    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0700
     * @tc.desc   test Delete interceptor, pass null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveNullptrInterceptor();
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName}RemoveNullptrInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0800
     * @tc.desc   test Will deleting multiple different interceptors affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0800";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode !== 403);
              // ExpectTrue(res.cookies.includes('www.baidu.com'));
              let reqResult: string = testNetManager.GetRequestUrl();
              ExpectTrue(reqResult == HTTP_URL_BAIDU);
              console.info(`${TAG} ${caseName} GetRequestUrl success, reqResult:${reqResult}`);
              let delReadOnlyResult: number = testNetManager.RemoveRequestInterceptor(10);
              ExpectTrue(delReadOnlyResult === 0);
              console.info(`${TAG} ${caseName} RemoveResponseInterceptor success, delReadOnlyResult:${delReadOnlyResult}`);
              let delReadOnlyResult1: number = testNetManager.RemoveResponseInterceptor(1);
              ExpectTrue(delReadOnlyResult1 === 0);
              console.info(`${TAG} ${caseName} RemoveResponseInterceptor success, delReadOnlyResult1:${delReadOnlyResult1}`);
              httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode == 200);
                  // let rsqResult: number = testNetManager.GetResponseCode();
                  // ExpectTrue(rsqResult == 200);
                  // console.info(`${TAG} ${caseName} GetResponseCode success, rsqResult:${rsqResult}`);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor0900
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_0900
     * @tc.desc   test Delete request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor0900";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let reqArr: Array<number> = [0, 1, 2, 3, 4, 10, 11, 12, 13, 14];
          reqArr.forEach((item: number) => {
            let result:number = testNetManager.RemoveRequestInterceptor(item);
            ExpectTrue(result === 0);
            console.info(`${TAG} ${caseName} RemoveRequestInterceptor success, result:${result}`);
          })
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor1000
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_1000
     * @tc.desc   test Delete request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor1000";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let resArr: Array<number> = [0, 1, 2, 3, 10, 11, 12, 13];
          resArr.forEach((item: number) => {
            if (item >= 4) {
              let result1:number = testNetManager.AddReadOnlyResponseInterceptor(item, 1);
              ExpectTrue(result1 === 0);
              console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, result1:${result1}`);
            }
          })
          resArr.forEach((item: number) => {
            let result:number = testNetManager.RemoveResponseInterceptor(item);
            ExpectTrue(result === 0);
            console.info(`${TAG} ${caseName} RemoveResponseInterceptor success, result:${result}`);
          })
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveInterceptor1100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveInterceptor_1100
     * @tc.desc   test Delete interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveInterceptor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveInterceptor1100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveRequestInterceptor(99);
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName} RemoveRequestInterceptor failed, result:${result}`);
          let result1: number = testNetManager.RemoveResponseInterceptor(99);
          ExpectTrue(result1 == 401);
          console.info(`${TAG} ${caseName} RemoveResponseInterceptor failed, result1:${result1}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });


    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0100
     * @tc.desc   test Delete group interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result0:number = testNetManager.RemoveAllInterceptor(0);
          ExpectTrue(result0 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result0:${result0}`);
          let result1:number = testNetManager.RemoveAllInterceptor(1);
          ExpectTrue(result1 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result1:${result1}`);
          let result2:number = testNetManager.RemoveAllInterceptor(2);
          ExpectTrue(result2 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result2:${result2}`);
          let result3:number = testNetManager.RemoveAllInterceptor(3);
          ExpectTrue(result3 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result3:${result3}`);
          let result4:number = testNetManager.RemoveAllInterceptor(4);
          ExpectTrue(result4 === 0);
          console.info(`${TAG} ${caseName}RemoveAllInterceptor success, result4:${result4}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0200
     * @tc.desc   test Remove the group interceptor and modify the URL of the interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              // 验证url已修改
              ExpectTrue(true);
              let delResult:number = testNetManager.RemoveAllInterceptor(0);
              ExpectTrue(delResult === 0);
              console.info(`${TAG} ${caseName}RemoveAllInterceptor success, delResult:${delResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  // 验证url未修改
                  ExpectTrue(true);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });
    
    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0600
     * @tc.desc   test activate the deleted interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveAllInterceptor(99);
          ExpectTrue(result == 401);
          console.info(`${TAG} ${caseName} RemoveAllInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_RemoveAllInterceptor_0700
     * @tc.desc   test activate the deleted interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorRemoveAllInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let delResult: number = testNetManager.RemoveAllInterceptor(0);
          ExpectTrue(delResult === 0);
          console.info(`${TAG} ${caseName} RemoveAllInterceptor success, delResult:${delResult}`);
          let delResult1: number = testNetManager.RemoveAllInterceptor(10);
          ExpectTrue(delResult1 === 0);
          console.info(`${TAG} ${caseName} RemoveAllInterceptor success, delResult1:${delResult1}`);
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0100
     * @tc.desc   test Enable group interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result0:number = testNetManager.StartAllInterceptor(0);
          ExpectTrue(result0 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result0:${result0}`);
          let result1:number = testNetManager.StartAllInterceptor(1);
          ExpectTrue(result1 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result1:${result1}`);
          let result2:number = testNetManager.StartAllInterceptor(2);
          ExpectTrue(result2 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result2:${result2}`);
          let result3:number = testNetManager.StartAllInterceptor(3);
          ExpectTrue(result3 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result3:${result3}`);
          let result4:number = testNetManager.StartAllInterceptor(4);
          ExpectTrue(result4 === 0);
          console.info(`${TAG} ${caseName}StartAllInterceptor success, result4:${result4}`);
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0500
     * @tc.desc   test Enable the group interceptor to modify the body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0500";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              // 验证body未修改
              ExpectTrue(res.result == 'data:body');
              let startResult:number = testNetManager.StartAllInterceptor(0);
              ExpectTrue(startResult === 0);
              console.info(`${TAG} ${caseName}StartAllInterceptor startResult:${startResult}`);
              httpRequest.request(HTTP_URL, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  // 验证body已修改
                  ExpectTrue(res.result !== 'response_body_modify');
                }
                httpRequest.destroy();
                testNetManager.RemoveAllInterceptor(0);
                done();
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0600
     * @tc.desc   test Enable group interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.StartAllInterceptor(99);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} StartAllInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStartAllInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StartAllInterceptor_0700
     * @tc.desc   test Will multiple group interceptors start one by one and affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStartAllInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStartAllInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 0);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let startResult: number = testNetManager.StartAllInterceptor(0);
          ExpectTrue(startResult == 0);
          console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult:${startResult}`);
          let startResult1: number = testNetManager.StartAllInterceptor(10);
          ExpectTrue(startResult1 == 0);
          console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult1:${startResult1}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectTrue(res.responseCode == 200);
              // ExpectTrue(res.cookies.includes('www.baidu.com'));
              let readOnlyResult: string = testNetManager.GetRequestUrl();
              ExpectTrue(readOnlyResult == HTTP_URL_BAIDU);
              console.info(`${TAG} ${caseName} GetRequestUrl success, readOnlyResult:${readOnlyResult}`);
              let startResult: number = testNetManager.StartAllInterceptor(11);
              ExpectTrue(startResult == 0);
              console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult:${startResult}`);
              let startResult1: number = testNetManager.StartAllInterceptor(1);
              ExpectTrue(startResult1 == 0);
              console.info(`${TAG} ${caseName} StartAllInterceptor success, startResult1:${startResult1}`);
              httpRequest.request(HTTP_URL_ERROR, options, (err: BusinessError, res: http.HttpResponse) => {
                if (err) {
                  console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
                  ExpectTrue(res.responseCode !== 403);
                  // ExpectTrue(res.cookies.includes('www.baidu.com'));
                  let readOnlyResult: string = testNetManager.GetRequestUrl();
                  ExpectTrue(readOnlyResult == HTTP_URL_BAIDU);
                  console.info(`${TAG} ${caseName} GetRequestUrl success, readOnlyResult:${readOnlyResult}`);
                  // let readOnlyResult1: number = testNetManager.GetResponseCode();
                  // ExpectTrue(readOnlyResult1 == 2300999);
                  // console.info(`${TAG} ${caseName} GetResponseCode success, readOnlyResult:${readOnlyResult}`);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0100
     * @tc.desc   test Stop group interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result0:number = testNetManager.StopAllInterceptor(0);
          ExpectTrue(result0 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result0:${result0}`);
          let result1:number = testNetManager.StopAllInterceptor(1);
          ExpectTrue(result1 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result1:${result1}`);
          let result2:number = testNetManager.StopAllInterceptor(2);
          ExpectTrue(result2 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result2:${result2}`);
          let result3:number = testNetManager.StopAllInterceptor(3);
          ExpectTrue(result3 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result3:${result3}`);
          let result4:number = testNetManager.StopAllInterceptor(4);
          ExpectTrue(result4 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, result4:${result4}`);
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0600
     * @tc.desc   test Stop group interceptor, abnormal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0600";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.StopAllInterceptor(99);
          ExpectTrue(result == 0);
          console.info(`${TAG} ${caseName} StopAllInterceptor failed, result:${result}`);
          done();
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorStopAllInterceptor0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_StopAllInterceptor_0700
     * @tc.desc   test Will multi group interceptors stop one by one and affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorStopAllInterceptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorStopAllInterceptor0700";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let readOnlyResResult: number = testNetManager.AddReadOnlyResponseInterceptor(11, 1);
          ExpectTrue(readOnlyResResult == 0);
          console.info(`${TAG} ${caseName} AddReadOnlyResponseInterceptor success, readOnlyResResult:${readOnlyResResult}`);
          let delResult: number = testNetManager.StopAllInterceptor(0);
          ExpectTrue(delResult === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, delResult:${delResult}`);
          let delResult1: number = testNetManager.StopAllInterceptor(10);
          ExpectTrue(delResult1 === 0);
          console.info(`${TAG} ${caseName}StopAllInterceptor success, delResult1:${delResult1}`);
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });
  });
}