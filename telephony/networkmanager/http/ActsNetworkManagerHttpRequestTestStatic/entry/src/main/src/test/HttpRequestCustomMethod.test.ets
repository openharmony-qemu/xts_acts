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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const XTS_TEST_HTTP_URL: string = 'https://webdav.moyufangge.com/';

const headerObj: Record<string, string> = { 'Content-Type': 'text/xml' };

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

const HttpRequest = (customMethod: string, url: string, state: boolean): Promise<Object> => {
  return new Promise<Object>((resolve, reject) => {
    let httpRequestOptions: http.HttpRequestOptions = {
      expectDataType: http.HttpDataType.STRING,
      customMethod: customMethod,
      header: headerObj
    }
    let httpRequest: http.HttpRequest = http.createHttp();
    httpRequest.request(url, httpRequestOptions,
      (err: Error | null, data: http.HttpResponse | undefined) => {
        if (err) {
          ExpectFail();
          httpRequest.destroy();
          reject(new Error(`请求失败：${err!.message}`));
        } else {
          if (customMethod == 'MKCOL') {
            ExpectTrue(data!.responseCode == 201);
          } else if (state) {
            ExpectTrue(data!.responseCode == 200);
          } else {
            ExpectTrue(data!.responseCode == 404);
          }
          httpRequest.destroy();
          resolve(0);
        }
      });
  });
}

function generateTimeRandomStr(): string {
  try {
    const timestamp = Date.now().toString();
    const random = Math.floor(Math.random() * 999).toString().padStart(3, '0');
    return `${timestamp}_${random}`;
  } catch (err) {
    console.error(`random failed: ${(err as BusinessError).message}`);
    return `xts_test_${Date.now()}`;
  }
}

export default function HttpRequestCustomMethodTest(): void {
  describe('HttpRequestCustomMethodTest', () => {
    let lockToken: string = '';
    let random: string = generateTimeRandomStr();
    let textName: string = 'text' + random + '.txt';
    let rename: string = 'renameText' + random + '.txt';
    let fileName: string = 'mkcolTest' + random + '/';
    let copyName: string = 'file' + random + '.txt';
    afterAll(async () => {
      await HttpRequest('DELETE', XTS_TEST_HTTP_URL + rename, true);
      await HttpRequest('DELETE', XTS_TEST_HTTP_URL + textName, true);
    })

    /**
     * @tc.name   testHttpRequestCustomMethodTest_static_1700
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1700
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpRequestCustomMethodTest_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: headerObj,
            expectDataType: http.HttpDataType.STRING,
            customMethod: ''
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.requestInStream(XTS_TEST_HTTP_URL + textName, httpRequestOptions,
            (err: BusinessError<void> | null, data: int | undefined) => {
              if (err) {
                hilog.info(domain, tag, '%{public}s', `${caseName} err:--- ${JSON.stringify(err)}`);
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', `${caseName} data:--- ${JSON.stringify(data)}`);
                ExpectTrue(data == 200);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
                done();
              }
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
          done();
        }
      });

    /**
     * @tc.name   testHttpRequestCustomMethodTest_static_1800
     * @tc.number SUB_NetworkMgr_Http_HttpRequestCustomMethodTest_1800
     * @tc.desc   Test HttpRequestCustomMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpRequestCustomMethodTest_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testHttpRequestCustomMethodTest_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            header: headerObj,
            expectDataType: http.HttpDataType.STRING,
            customMethod: ''
          }
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.requestInStream(XTS_TEST_HTTP_URL + textName, httpRequestOptions).then((res) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} data: --- ${JSON.stringify(res)}`);
            ExpectTrue(res == 200);
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR: ${JSON.stringify(error)}`);
            ExpectFail();
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End `);
          done();
        }
      });
  });
}
