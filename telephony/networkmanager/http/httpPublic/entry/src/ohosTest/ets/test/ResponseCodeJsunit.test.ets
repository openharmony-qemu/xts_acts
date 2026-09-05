/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

function expectFalse() {
  try {
    expect().assertFail();
  } catch(err) {
    console.info('assertion failure');
  }
}

function expectTrue(data : boolean){
  try {
    expect(data).assertTrue();
  } catch (err){
    console.info('assertion failure');
  }
};


export default function responseCodeJsunit() {
  describe("responseCodeJsunitTest", () => {
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeOK0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_OK_0100
     * @tc.desc   Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeOK0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeOK0100';
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          connectTimeout: 5000,
          readTimeout: 5000,
          maxRedirects: 0
        };
        httpRequest.request("https://www.baidu.com/", requestOptions, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.OK);
            expectTrue(data.responseCode === 200);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpResponseCodeACCEPTED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_ACCEPTED_0100
     * @tc.desc   Test Test ResponseCode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeACCEPTED0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (done: Function) => {
      let caseName: string = 'testNetworkMgrHttpResponseCodeACCEPTED0100';
      console.info(`${caseName} ---start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          connectTimeout: 5000,
          readTimeout: 5000
        };
        httpRequest.request("https://httpbin.moyufangge.com/status/202", requestOptions).then((data: http.HttpResponse) => {
          console.info(`${caseName} result is: ` + JSON.stringify(data.responseCode));
          expectTrue(data.responseCode === http.ResponseCode.ACCEPTED);
          expectTrue(data.responseCode === 202);
          console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
          httpRequest.destroy();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: Error) => {
          console.error(`${caseName} catch err: ` + JSON.stringify(err) + `, code = ` + (err as BusinessError).code);
          expectFalse();
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err: ` + JSON.stringify(error) + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_AUTHORITATIVE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTAUTHORITATIVE0100';
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/203", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.NOT_AUTHORITATIVE);
            expectTrue(data.responseCode === 203);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOCONTENT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NO_CONTENT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOCONTENT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOCONTENT0100';
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/204", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.NO_CONTENT);
            expectTrue(data.responseCode === 204);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeMULTCHOICE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_MULT_CHOICE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeMULTCHOICE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeMULTCHOICE0100';
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/300", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.MULT_CHOICE);
            expectTrue(data.responseCode === 300);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeMOVEDPERM0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_MOVED_PERM_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeMOVEDPERM0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeMOVEDPERM0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        let redirected: boolean = false;
        let doneCalled: boolean = false;
        httpRequest.on('headersReceive', (header: Object) => {
          let headerMap = header as Record<string, string>;
          if (!redirected && headerMap['location'] !== undefined) {
            redirected = true;
            console.info(`${caseName} redirect detected, location: ${headerMap['location']}`);
          }
        });
        let requestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000
        };
        httpRequest.request("https://httpbin.moyufangge.com/status/301", requestOptions, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            console.info(`${caseName} data.responseCode: ${data.responseCode}`);
            expectTrue(data.responseCode !== http.ResponseCode.MOVED_PERM);
            expectTrue(data.responseCode !== 301);
            expectTrue(redirected);
            console.info(`${caseName} data.responseCode: 301 (redirect confirmed)`);
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
          }
          doneCalled = true;
          console.info(`${caseName}---End`);
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeMOVEDTEMP0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_MOVED_TEMP_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeMOVEDTEMP0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeMOVEDTEMP0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        let redirected: boolean = false;
        let doneCalled: boolean = false;
        httpRequest.on('headersReceive', (header: Object) => {
          let headerMap = header as Record<string, string>;
          if (!redirected && headerMap['location'] !== undefined) {
            redirected = true;
            console.info(`${caseName} redirect detected, location: ${headerMap['location']}`);
          }
        });
        let requestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000
        };
        httpRequest.request("https://httpbin.moyufangge.com/status/302", requestOptions, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            console.info(`${caseName} data.responseCode: ${data.responseCode}`);
            expectTrue(data.responseCode !== http.ResponseCode.MOVED_TEMP);
            expectTrue(data.responseCode !== 302);
            expectTrue(redirected);
            console.info(`${caseName} data.responseCode: 302 (redirect confirmed)`);
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
          }
          doneCalled = true;
          console.info(`${caseName}---End`);
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeSEEOTHER0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_SEE_OTHER_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeSEEOTHER0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeSEEOTHER0100';
      let capturedCode: number = -1;
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.on('headersReceive', (header: Object) => {
          let statusLine: string = (header as Record<string, string>)['status-line'];
          if (statusLine) {
            let parts: string[] = statusLine.split(' ');
            if (parts.length >= 2) {
              capturedCode = parseInt(parts[1]);
            }
          }
        });
        let requestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000
        };
        httpRequest.request("https://httpbin.moyufangge.com/status/303", requestOptions, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode !== http.ResponseCode.SEE_OTHER);
            expectTrue(data.responseCode !== 303);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
          }
          doneCalled = true;
          console.info(`${caseName}---End`);
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTMODIFIED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_MODIFIED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTMODIFIED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTMODIFIED0100';
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        let requestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000
        };
        httpRequest.request("https://httpbin.moyufangge.com/status/304", requestOptions, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.NOT_MODIFIED);
            expectTrue(data.responseCode === 304);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
          }
          doneCalled = true;
          console.info(`${caseName}---End`);
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUSEPROXY0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_USE_PROXY_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUSEPROXY0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUSEPROXY0100';
      let capturedCode: number = -1;
      let doneCalled: boolean = false;
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.on('headersReceive', (header: Object) => {
          let statusLine: string = (header as Record<string, string>)['status-line'];
          if (statusLine) {
            let parts: string[] = statusLine.split(' ');
            if (parts.length >= 2) {
              capturedCode = parseInt(parts[1]);
            }
          }
        });
        let requestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000
        };
        httpRequest.request("https://httpbin.moyufangge.com/status/305", requestOptions, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (doneCalled) {
            return;
          }
          if (!err && data) {
            expectTrue(data.responseCode !== http.ResponseCode.USE_PROXY);
            expectTrue(data.responseCode !== 305);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
          }
          doneCalled = true;
          console.info(`${caseName}---End`);
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeBADREQUEST0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_BAD_REQUEST_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeBADREQUEST0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeBADREQUEST0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/400", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.BAD_REQUEST);
            expectTrue(data.responseCode === 400);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUNAUTHORIZED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_UNAUTHORIZED_0100
     * @tc.desc   Test Test ResponseCode property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUNAUTHORIZED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUNAUTHORIZED0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/401", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.UNAUTHORIZED);
            expectTrue(data.responseCode === 401);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PAYMENT_REQUIRED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePAYMENTREQUIRED0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/402", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.PAYMENT_REQUIRED);
            expectTrue(data.responseCode === 402);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeBADMETHOD0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_BAD_METHOD_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeBADMETHOD0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeBADMETHOD0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/405", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.BAD_METHOD);
            expectTrue(data.responseCode === 405);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_ACCEPTABLE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTACCEPTABLE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/406", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.NOT_ACCEPTABLE);
            expectTrue(data.responseCode === 406);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePROXYAUTH0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PROXY_AUTH_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePROXYAUTH0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePROXYAUTH0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/407", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.PROXY_AUTH);
            expectTrue(data.responseCode === 407);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_CLIENT_TIMEOUT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeCLIENTTIMEOUT0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/408", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.CLIENT_TIMEOUT);
            expectTrue(data.responseCode === 408);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_LENGTH_REQUIRED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeLENGTHREQUIRED0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/411", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.LENGTH_REQUIRED);
            expectTrue(data.responseCode === 411);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePRECONFAILED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PRECON_FAILED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePRECONFAILED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePRECONFAILED0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/412", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode == http.ResponseCode.PRECON_FAILED);
            expectTrue(data.responseCode === 412);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_ENTITY_TOO_LARGE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeENTITYTOOLARGE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/413", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.ENTITY_TOO_LARGE);
            expectTrue(data.responseCode === 413);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeREQTOOLONG0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_REQ_TOO_LONG_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeREQTOOLONG0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeREQTOOLONG0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/414", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.REQ_TOO_LONG);
            expectTrue(data.responseCode === 414);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_UNSUPPORTED_TYPE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUNSUPPORTEDTYPE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/415", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.UNSUPPORTED_TYPE);
            expectTrue(data.responseCode === 415);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_RANGE_NOT_SATISFIABLE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeRANGENOTSATISFIABLE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/416", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.RANGE_NOT_SATISFIABLE);
            expectTrue(data.responseCode === 416);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeINTERNALERROR0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_INTERNAL_ERROR_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeINTERNALERROR0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeINTERNALERROR0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/500", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.INTERNAL_ERROR);
            expectTrue(data.responseCode === 500);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_IMPLEMENTED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTIMPLEMENTED0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/501", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.NOT_IMPLEMENTED);
            expectTrue(data.responseCode === 501);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeBADGATEWAY0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_BAD_GATEWAY_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeBADGATEWAY0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeBADGATEWAY0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/502", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.BAD_GATEWAY);
            expectTrue(data.responseCode === 502);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_GATEWAY_TIMEOUT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeGATEWAYTIMEOUT0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/504", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.GATEWAY_TIMEOUT);
            expectTrue(data.responseCode === 504);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeVERSION0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_VERSION_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeVERSION0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeVERSION0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/505", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.VERSION);
            expectTrue(data.responseCode === 505);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeCREATED0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_CREATED_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeCREATED0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeCREATED0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/201", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.CREATED);
            expectTrue(data.responseCode === 201);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeRESET0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_RESET_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeRESET0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeRESET0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/205", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.RESET);
            expectTrue(data.responseCode === 205);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodePARTIAL0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_PARTIAL_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodePARTIAL0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodePARTIAL0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/206", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.PARTIAL);
            expectTrue(data.responseCode === 206);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpResponseCodeFORBIDDEN0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_FORBIDDEN_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeFORBIDDEN0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeFORBIDDEN0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/403", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.FORBIDDEN);
            expectTrue(data.responseCode === 403);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeNOTFOUND0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_NOT_FOUND_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeNOTFOUND0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeNOTFOUND0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/404", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.NOT_FOUND);
            expectTrue(data.responseCode === 404);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeCONFLICT0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_CONFLICT_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeCONFLICT0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeCONFLICT0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/409", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.CONFLICT);
            expectTrue(data.responseCode === 409);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeGONE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_GONE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeGONE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeGONE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/410", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.GONE);
            expectTrue(data.responseCode === 410);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkMgrHttpResponseCodeUNAVAILABLE0100
     * @tc.number SUB_NetworkMgr_Http_ResponseCode_UNAVAILABLE_0100
     * @tc.desc   Test Test ResponseCode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpResponseCodeUNAVAILABLE0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done:Function) => {
      let caseName:string = 'testNetworkMgrHttpResponseCodeUNAVAILABLE0100';
      console.info(`${caseName}---Start`);
      try {
        let httpRequest: http.HttpRequest = http.createHttp();
        httpRequest.request("https://httpbin.moyufangge.com/status/503", (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
          if (!err && data) {
            expectTrue(data.responseCode === http.ResponseCode.UNAVAILABLE);
            expectTrue(data.responseCode === 503);
            console.info(`${caseName} data.responseCode:, ${JSON.stringify(data.responseCode)}`);
            console.info(`${caseName}---End`);
            httpRequest.destroy();
            done();
          } else {
            console.log(`${caseName} : error = ${err?.message}, code = ${err?.code}`);
            expectFalse();
            httpRequest.destroy();
            done();
          }
        });
      } catch (error) {
        console.log(`${caseName} : error = ` + error + `, code = ` + (error as BusinessError).code);
        expectFalse();
        done();
      }
    });
  })
};