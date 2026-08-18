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
import { BusinessError } from '@kit.BasicServicesKit';

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


const HTTP_URL_BAIDU: string = "http://www.baidu.com";
const HTTP_URL: string = "http://localhost:9999";
const HTTP_URL_ERROR: string = "https://smtest.moyufangge.com";

// Http error code definitions
class Http_ErrCode {
  static readonly OH_HTTP_REQUEST_INTERCEPTED: number = 2300996;
}

// 通用request的head
const HEADER = { "aaaaa": "" } as Record<string, string>;
// 修改的body
const BODY_MODIFY = { "context": "REQUEST_BODY_MODIFY" } as Record<string, string>;
// 修改url的标识body
const BODY_URL_MODIFY = { "context": "BODY_URL_MODIFY" } as Record<string, string>;

const REQUEST_GROUP0_MODIFY_URL: string = 'g_request_group0_modify_url_interceptor';
const REQUEST_GROUP1_MODIFY_METHOD: string = 'g_request_group1_modify_method_interceptor';
const REQUEST_GROUP2_MODIFY_BODY: string = 'g_request_group2_modify_body_interceptor';
const REQUEST_GROUP3_MODIFY_HEADERS: string = 'g_request_group3_modify_headers_interceptor';
const REQUEST_GROUP4_MODIFY_ABORT: string = 'g_request_group4_modify_abort_interceptor';
const REQUEST_GROUP10_READONLY_URL: string = 'g_request_group10_readonly_url_interceptor';
const REQUEST_GROUP11_READONLY_METHOD: string = 'g_request_group11_readonly_method_interceptor';
const REQUEST_GROUP12_READONLY_HEADERS: string = 'g_request_group12_readonly_headers_interceptor';
const REQUEST_GROUP13_READONLY_BODY: string = 'g_request_group13_readonly_body_interceptor';
const REQUEST_GROUP14_READONLY_ABORT: string = 'g_request_group14_readonly_abort_interceptor';


const RESPONSE_GROUP0_MODIFY_BODY: string = 'g_response_group0_modify_body_interceptor';
const RESPONSE_GROUP1_MODIFY_RESPONSE_CODE: string = 'g_response_group1_modify_responseCode_interceptor';
const RESPONSE_GROUP2_MODIFY_HEADERS: string = 'g_response_group2_modify_headers_interceptor';
const RESPONSE_GROUP3_MODIFY_ABORT: string = 'g_response_group3_modify_abort_interceptor';
const RESPONSE_GROUP10_READONLY_BODY: string = 'g_response_group10_readonly_body_interceptor';
const RESPONSE_GROUP11_READONLY_RESPONSE_CODE: string = 'g_response_group11_readonly_responseCode_interceptor';
const RESPONSE_GROUP12_READONLY_HEADERS: string = 'g_response_group12_readonly_headers_interceptor';
const RESPONSE_GROUP13_READONLY_ABORT: string = 'g_response_group13_readonly_abort_interceptor';

// 常量定义
const DOMAIN: number = 0x0000; // 日志域值
const TAG: string = 'netstack'; // 日志标签

const createServer = async (caseName: string, done: Function) => {
  console.info(`${TAG} ${caseName}---Start`);
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

export default function HttpInterceptorForSafeCheck2300996Test() {
  describe('HttpInterceptorForSafeCheck2300996Test', () => {
    beforeAll(async (done: Function) => {
      await createServer(TAG, done);
      console.info(`test1 ${TAG} test Start`);
      done()
    })
    /**
     * @tc.name   testHttpRequestInterceptorAbortPromise23009960100
     * @tc.number SUB_NetworkMgr_HttpRequest_Abort_Promise2300996_0100
     * @tc.desc   test request(url, options) Promise with request abort interceptor (group 4), verify error code 2300996
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestInterceptorAbortPromise23009960100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testHttpRequestInterceptorAbortPromise23009960100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(4, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          try {
            let response: http.HttpResponse = await httpRequest.request(HTTP_URL, options);
            console.info(`${TAG} ${caseName} request unexpected success:${JSON.stringify(response)}`);
            testNetManager.RemoveAllInterceptor(4);
            httpRequest.destroy();
            ExpectFail();
            done();
          } catch (error) {
            const err: BusinessError = error as BusinessError;
            console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
            testNetManager.RemoveAllInterceptor(4);
            httpRequest.destroy();
            ExpectTrue(Number(err.code) === 2300996);
            ExpectTrue(Number(err.code) === Http_ErrCode.OH_HTTP_REQUEST_INTERCEPTED);
            done();
          }
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(4);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestInStreamInterceptorAbortCallback23009960100
     * @tc.number SUB_NetworkMgr_HttpRequestInStream_Abort_Callback2300996_0100
     * @tc.desc   test requestInStream(url, callback) with request abort interceptor (group 4), verify error code 2300996
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestInStreamInterceptorAbortCallback23009960100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testHttpRequestInStreamInterceptorAbortCallback23009960100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(4, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.requestInStream(HTTP_URL, (err: BusinessError, responseCode: number) => {
            if (err) {
              console.info(`${TAG} ${caseName} requestInStream fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(4);
              httpRequest.destroy();
              ExpectTrue(Number(err.code) === 2300996);
              ExpectTrue(Number(err.code) === Http_ErrCode.OH_HTTP_REQUEST_INTERCEPTED);
              done();
            } else {
              console.info(`${TAG} ${caseName} requestInStream unexpected success, response code: ${responseCode}`);
              testNetManager.RemoveAllInterceptor(4);
              httpRequest.destroy();
              ExpectFail();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(4);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testHttpRequestInStreamInterceptorAbortCallback23009960200
     * @tc.number SUB_NetworkMgr_HttpRequestInStream_Abort_Callback2300996_0200
     * @tc.desc   test requestInStream(url, options, callback) with request abort interceptor (group 4), verify error code 2300996
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpRequestInStreamInterceptorAbortCallback23009960200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testHttpRequestInStreamInterceptorAbortCallback23009960200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(4, 1);
          ExpectTrue(result === 0);
          console.info(`${TAG} ${caseName} AddWritableRequestInterceptor success, result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST
          };
          httpRequest.requestInStream(HTTP_URL, options, (err: BusinessError, responseCode: number) => {
            if (err) {
              console.info(`${TAG} ${caseName} requestInStream fail, error code: ${err.code}, msg: ${err.message}`);
              testNetManager.RemoveAllInterceptor(4);
              httpRequest.destroy();
              ExpectTrue(Number(err.code) === 2300996);
              ExpectTrue(Number(err.code) === Http_ErrCode.OH_HTTP_REQUEST_INTERCEPTED);
              done();
            } else {
              console.info(`${TAG} ${caseName} requestInStream unexpected success, response code: ${responseCode}`);
              testNetManager.RemoveAllInterceptor(4);
              httpRequest.destroy();
              ExpectFail();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          testNetManager.RemoveAllInterceptor(4);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });
  });
}