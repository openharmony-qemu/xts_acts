'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import http from '@ohos.net.http';
import { describe, it, expect, beforeAll, afterAll, beforeEach, afterEach, TestType, Size, Level} from '@ohos/hypium-static/src/main/indexStatic';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HttpRequestMaxAutoRedirectsTest(): void {
  describe('HttpRequest_MaxAutoRedirects_Test', () => {
    let httpRequest: http.HttpRequest | undefined;
    // Test server address
    const BASE_URL = 'https://httpbin.moyufangge.com/redirect';

    beforeEach(() => {
      hilog.info(domain, tag, '%{public}s', '[HttpRequest_MaxAutoRedirects] beforeEach: create new HttpRequest');
      httpRequest = http.createHttp();
    });

    // Destroy HttpRequest after each test case
    afterEach(() => {
      hilog.info(domain, tag, '%{public}s', '[HttpRequest_MaxAutoRedirects] afterEach: destroy HttpRequest');
      httpRequest?.destroy();
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects_static_1200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1200
     * @tc.desc requestInStream default behavior test
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[HttpRequest_MaxAutoRedirects_012] 测试开始');
      try {
        let url = `${BASE_URL}/5`;
        let responseCode = await httpRequest!.requestInStream(url);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `[HttpRequest_MaxAutoRedirects_012] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects_static_2400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_2400
     * @tc.desc requestInStream 31 redirects should throw 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '[testHttpRequestMaxAutoRedirects2400] 测试开始 - requestInStream 默认超过30次重定向');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 120000,
          connectTimeout: 60000
        };
        await httpRequest!.requestInStream(url, options);
        hilog.error(domain, tag, '%{public}s', '[HttpRequest_MaxAutoRedirects_024]  预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        hilog.info(domain, tag, '%{public}s', `[HttpRequest_MaxAutoRedirects_024] 捕获预期错误: code=${error.code}`);
        expect(error?.code).assertEqual(2300047);
        hilog.info(domain, tag, '%{public}s', '[HttpRequest_MaxAutoRedirects_024]  测试通过');
        done();
      }
    });
  });
}
