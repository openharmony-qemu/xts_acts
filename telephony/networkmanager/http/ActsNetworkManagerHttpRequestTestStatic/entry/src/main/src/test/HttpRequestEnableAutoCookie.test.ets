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
import http from '@ohos.net.http';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const Url1: string = "http://httpbin.moyufangge.com/cookies/set/test_cookie/test_value";
const Url2: string = "http://httpbin.moyufangge.com/cookies";
const Url3: string = "http://httpbin.org/cookies";

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
interface Cookies {
  test_cookie?: string;
}
interface CookiesResponse {
  cookies?: Cookies;
}

export default function HttpRequestEnableAutoCookieTest(): void {
  describe('HttpRequestEnableAutoCookieTest', () => {

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0100
     * @tc.desc   test Same instance, same domain, AutoCookie enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0100';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(true);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest.request(Url2);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result === 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0200
     * @tc.desc   test Same instance, same domain, AutoCookie disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0200';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(false);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest.request(Url2);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0300
     * @tc.desc   test Same Instance, Different Domain Cookies, AutoCookie Enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0300';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(true);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest.request(Url3);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Domain-Related`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });


    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0400
     * @tc.desc   test Same Instance, Different Domain Cookies, AutoCookie Disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0400';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(false);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest.request(Url3);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Domain-Related`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0500
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0500
     * @tc.desc   Different instances, same domain, AutoCookie enabled on all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0500';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(true);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Each instance is independent`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0600
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0600
     * @tc.desc   Different instances, same domain, AutoCookie: enabled on 1, disabled on 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0600';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(false);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} The disabled instance did not send cookies`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0700
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0700
     * @tc.desc   Different instances, same domain, AutoCookie: disabled on 1, enabled on 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0700';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(true);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} The disabled instance did not send cookies`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0800
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0800
     * @tc.desc   Different instances, same domain, AutoCookie: disabled on 1, disabled on 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0800';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(false);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} The disabled instance did not send cookies`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_0900
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0900
     * @tc.desc   test Different Instances, Different Domains for Cookies, AutoCookie Enabled of all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_0900';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(true);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Domain-Related`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_1000
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1000
     * @tc.desc   test Different Instances, Different Domains for Cookies, Instance 1: AutoCookie Enabled, Instance 2: AutoCookie Disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_1000';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(false);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Domain-Related`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_1100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1100
     * @tc.desc   test Different Instances, Different Domains for Cookies, Instance 1: AutoCookie Disabled, Instance 2: AutoCookie Enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_1100';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(true);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Domain-Related`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest_static_1200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1200
     * @tc.desc   test Different Instances, Different Domains for Cookies, Instance 1: AutoCookie Disabled, Instance 2: AutoCookie Disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest_static_1200';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(false);
        hilog.info(domain, tag, '%{public}s', `${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        hilog.info(domain, tag, '%{public}s', `${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        hilog.info(domain, tag, '%{public}s', `${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: string = '';
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header as Record<string, string>)['content-type'] as string || '';
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} content-type: ${contentType}`);
        try {
          result = data2.result as string;
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          hilog.info(domain, tag, '%{public}s', `${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          hilog.info(domain, tag, '%{public}s', `${caseName} content-type is not application/json`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          hilog.info(domain, tag, '%{public}s', `${caseName} Cookies: ${JSON.stringify(result)}`);
          if (!result) {
            ExpectTrue(result !== 'test_value');
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are missing and Domain-Related`);
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName} Cookies are included`);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} All requests completed.`);
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
    });

  });
}

