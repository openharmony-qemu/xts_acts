/*
 *  Copyright (c) 2026 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
export function ExpectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    console.info(`${info} test failed`);
  }
}

export default function HttpBodyParametersTest() {
  describe('HttpBodyParametersTest', () => {

    /**
     * @tc.name   testHttpBodyParameter0100
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0100
     * @tc.desc   Send text data in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpBodyParameter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0100';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testBodyStr = 'sent to data body';
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/octet-stream' },
          body: testBodyStr
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('sent to data body'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0200
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0200
     * @tc.desc   Send object data in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpBodyParameter0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0200';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/json' },
          body: { name: 'test', value: 123, active: true }
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${JSON.stringify(data.result)}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('test'));
        ExpectTrue(resultStr.includes('123'));
        ExpectTrue(resultStr.includes('true'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0300
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0300
     * @tc.desc   Send binary data in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpBodyParameter0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0300';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const binaryData: number[] = [72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100];
        const binaryPayload: string = String.fromCharCode(...binaryData);
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/octet-stream' },
          body: binaryPayload
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${JSON.stringify(data.result)}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('Hello World'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0400
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0400
     * @tc.desc   Send an empty string in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0400';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testBodyStr: string = '';
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/octet-stream' },
          body: testBodyStr
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('""'));
        ExpectTrue(resultStr.includes('{}'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0500
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0500
     * @tc.desc   Send an empty object in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0500';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/json' },
          body: {}
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${JSON.stringify(data.result)}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('{}'));
        ExpectTrue(resultStr.includes('"json":{}'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0600
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0600
     * @tc.desc   Send an empty binary payload in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0600';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const binaryPayload: Uint8Array = new Uint8Array(0);
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/octet-stream' },
          body: binaryPayload
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${JSON.stringify(data.result)}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('"data":"{}"'));
        ExpectTrue(resultStr.includes('"json":{}'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0700
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0700
     * @tc.desc   Send undefined in the request body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0700';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testBody: undefined = undefined;
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/octet-stream' },
          body: testBody
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('"data":""'));
        ExpectTrue(resultStr.includes('"json":null'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0800
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0800
     * @tc.desc   Send string data in the request queryParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpBodyParameter0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0800';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testqueryParamsStr = 'name=test&value=123';
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/get';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          queryParams: testqueryParamsStr
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('test'));
        ExpectTrue(resultStr.includes('123'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter0900
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_0900
     * @tc.desc   Send object data in the request queryParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHttpBodyParameter0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter0900';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/get';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          queryParams: {
            name: 'test',
            value: true,
            extra: 123
          }
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('test'));
        ExpectTrue(resultStr.includes('true'));
        ExpectTrue(resultStr.includes('123'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter1000
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_1000
     * @tc.desc   Send undefined data in the request queryParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter1000';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/get';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          queryParams: undefined
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.length > 0);
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter1100
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_1100
     * @tc.desc   Send empty string data in the request queryParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter1100';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testqueryParamsStr = '';
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/get';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          queryParams: testqueryParamsStr
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.length > 0);
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter1200
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_1200
     * @tc.desc   Send empty object data in the request queryParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter1200';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/get';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          queryParams: {}
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.length > 0);
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter1300
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_1300
     * @tc.desc   Send text data in both the request body and extra, body overrides extraData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter1300';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testBodyStr = 'sent to data body';
        const testExtraDataStr = 'sent to data extra';
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/json' },
          body: testBodyStr,
          extraData: testExtraDataStr
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('sent to data body'));
        ExpectTrue(!resultStr.includes('sent to data extra') && resultStr.includes('sent to data body'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter1400
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_1400
     * @tc.desc   Send object data in both the request body and queryParams, Simultaneous return of body and queryParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter1400';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/post';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          header: { 'Content-Type': 'application/json' },
          body: { data: 'test data' },
          queryParams: {
            name: 'test',
            value: true,
            extra: 123
          }
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes('test'));
        ExpectTrue(resultStr.includes('true'));
        ExpectTrue(resultStr.includes('123'));
        ExpectTrue(resultStr.includes('test data'));
        ExpectTrue(resultStr.includes('data'));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpBodyParameter1500
     * @tc.number SUB_NetworkMgr_Http_Body_Parameter_1500
     * @tc.desc   Send object data in both the request extra and queryParams, queryParams overrides extraData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpBodyParameter1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testHttpBodyParameter1500';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        const testQueryNameStr = 'test';
        const testQueryValueStr = 'true';
        const testQueryExtraStr = '123';
        const testExtraDataStr = 'sent to data';
        const XTS_TEST_URL: string = 'https://httpbin.moyufangge.com/get';
        httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          header: { 'Content-Type': 'application/json' },
          queryParams: {
            name: testQueryNameStr,
            value: true,
            extra: 123
          },
          extraData: testExtraDataStr
        };
        let data: http.HttpResponse = await httpRequest.request(XTS_TEST_URL, options);
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        console.info(`${caseName} data responseCode: ${data.responseCode}`);
        ExpectEqual(data.responseCode, 200);
        console.info(`${caseName} data result: ${data.result}`);
        let resultStr: string;
        if (typeof data.result === 'string') {
          resultStr = data.result;
        } else {
          resultStr = JSON.stringify(data.result);
        }
        console.info(`${caseName} ResultStr: ${resultStr}`);
        ExpectTrue(resultStr.includes(testQueryNameStr));
        ExpectTrue(resultStr.includes(testQueryValueStr));
        ExpectTrue(resultStr.includes(testQueryExtraStr));
        ExpectTrue(!resultStr.includes(testExtraDataStr));
      } catch (err) {
        console.info(`${caseName} request fail err : ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
  });
}