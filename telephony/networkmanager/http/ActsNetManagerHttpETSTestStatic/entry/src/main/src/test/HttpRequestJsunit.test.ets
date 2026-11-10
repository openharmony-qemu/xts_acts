'use static';
/*
 * Copyright (C) 2026Huawei Device Co., Ltd.
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

import { describe, expect, it, beforeEach, afterEach, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

function expectTrue(n: boolean) {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

export default function httpRequestJsunit(): void {
  describe("HttpRequestJsunitTest", () => {
    afterEach(async () => {
      hilog.info(domain, tag, '%{public}s', 'Test afterEach start');
      let httpRequest = http.createHttp();
      httpRequest.offHeadersReceive();
      httpRequest.destroy();
    });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOnHeaderReceive_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_On_HeaderReceive_0100
     * @tc.desc   Test Test httpRequest property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOnHeaderReceive_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOnHeaderReceive_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onHeadersReceive((data) => {
            hilog.info(domain, tag, '%{public}s', caseName + " data: " + JSON.stringify(data));
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
          httpRequest.request("https://www.baidu.com/", (err, data) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + " data: " + JSON.stringify(data!.responseCode) + " err: " + JSON.stringify(err));
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            "testNetworkMgrHttpHttpRequestOnHeaderReceive_static_0100 : error = " + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOffHeaderReceive_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_HeaderReceive_0100
     * @tc.desc   Test Test httpRequest property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOffHeaderReceive_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOffHeaderReceive_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          let callbackdata1 = (data: object) => {
            hilog.info(domain, tag, '%{public}s', caseName + " data: " + JSON.stringify(data));
            expectFalse();
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          };
          httpRequest.onHeadersReceive(callbackdata1);
          httpRequest.offHeadersReceive(callbackdata1);
          httpRequest.request("https://www.baidu.com/", (err, data) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + " data: " + JSON.stringify(data!.responseCode) + " err: " + JSON.stringify(err));
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            "testNetworkMgrHttpHttpRequestOffHeaderReceive_static_0100 : error = " + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOnHeadersReceive_static_0100
     * @tc.number SUB_Telephony_Http_HttpRequest_On_HeadersReceive_0100
     * @tc.desc   Test Test httpRequest property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOnHeadersReceive_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOnHeadersReceive_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onHeadersReceive((data) => {
            hilog.info(domain, tag, '%{public}s', caseName + " data: " + JSON.stringify(data));
            expectTrue(true);
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
          httpRequest.request("https://www.baidu.com/", (err, data) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + " data: " + JSON.stringify(data!.responseCode) + " err: " + JSON.stringify(err));
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            "testNetworkMgrHttpHttpRequestOnHeadersReceive_static_0100 : error = " + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_HeadersReceive_0100
     * @tc.desc   Test Test httpRequest property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.offHeadersReceive((data) => {
            hilog.info(domain, tag, '%{public}s', caseName + " data: " + JSON.stringify(data));
            expectFalse();
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
          httpRequest.request("https://www.baidu.com/", (err, data) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + " data: " + JSON.stringify(data!.responseCode) + " err: " + JSON.stringify(err));
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            "testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0100 : error = " + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_HeadersReceive_0200
     * @tc.desc   Test Test httpRequest property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.offHeadersReceive();
          expectTrue(true);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            "testNetworkMgrHttpHttpRequestOffHeadersReceive_static_0200 : error = " + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOnceHeadersReceive_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Once_HeadersReceive_0100
     * @tc.desc   Test Test httpRequest property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrHttpHttpRequestOnceHeadersReceive_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = "testNetworkMgrHttpHttpRequestOnceHeadersReceive_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onceHeadersReceive((data) => {
            hilog.info(domain, tag, '%{public}s', caseName + " data: " + JSON.stringify(data));
            expectTrue(data != null);
            sleep(250);
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
          httpRequest.request("https://www.baidu.com/", (err, data) => {
            hilog.info(domain, tag, '%{public}s',
              caseName + " data: " + JSON.stringify(data?.responseCode) + " err: " + JSON.stringify(err));
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            "testNetworkMgrHttpHttpRequestOnceHeadersReceive_static_0100 : error = " + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
  })
};