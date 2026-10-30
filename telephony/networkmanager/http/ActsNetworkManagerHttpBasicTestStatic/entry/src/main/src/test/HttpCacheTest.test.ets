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
import connection from '@ohos.net.connection';
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

export default function HttpCacheTest(): void {
  describe('HttpCacheTest', () => {

    /**
     * @tc.name   testTelephonyNetStackHttpTestCacheFlush_static_0100
     * @tc.number SUB_Telephony_NetStack_HttpTestCacheFlush_0100
     * @tc.desc   cache flush test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestCacheFlush_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetStackHttpTestCacheFlush_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          connection.hasDefaultNet((error, data) => {
            hilog.info(domain, tag,
              `${caseName} get error is ` + JSON.stringify(error) + " data is " + JSON.stringify(data));
            if (data && error!.code === 0) {
              // if (data && !error) {
              let httpRequest = http.createHttp();
              let cache = http.createHttpResponseCache(10 * 1024 * 1024);
              httpRequest.request('https://www.baidu.com', {
                usingCache: true
              }).then((data) => {
                cache.flush().then(() => {
                  ExpectTrue(true);
                  httpRequest.destroy();
                  hilog.info(domain, tag, '%{public}s', `${caseName}-flush success --end`);
                  done();
                }).catch((err: Error) => {
                  hilog.error(domain, tag, '%{public}s', `${caseName} flush fail err is: ` + JSON.stringify(err));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                  done();
                });
              });
            } else {
              hilog.info(domain, tag, `${caseName} hasDefaultNet is: ` + data);
              ExpectFail();
              done();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            }
          })
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `${caseName} catch fail, err: ${JSON.stringify(error)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttpTestCacheFlush_static_0200
     * @tc.number SUB_Telephony_NetStack_HttpTestCacheFlush_0200
     * @tc.desc   cache flush test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyNetStackHttpTestCacheFlush_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetStackHttpTestCacheFlush_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          connection.hasDefaultNet((error, data) => {
            hilog.info(domain, tag,
              `${caseName} get error is ` + JSON.stringify(error) + " data is " + JSON.stringify(data));
            if (data && error!.code === 0) {
              // if (data && !error) {
              let httpRequest = http.createHttp();
              let cache = http.createHttpResponseCache(10 * 1024 * 1024);
              httpRequest.request('https://www.baidu.com', {
                usingCache: true
              }).then((data) => {
                cache.flush((error) => {
                  httpRequest.destroy()
                  hilog.info(domain, tag, '%{public}s', `${caseName} cache flush data is: ` + JSON.stringify(data));
                  ExpectTrue(error!.code === 0);
                  hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                  done();
                });
              }).catch((error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} flush error, error code: ${error!.code}, msg: ${error!.message}`);
                done();
              });
            } else {
              hilog.info(domain, tag, `${caseName} hasDefaultNet is: ` + data);
              ExpectFail();
              done();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            }
          })
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', `${caseName} catch fail, err: ${JSON.stringify(error)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });
  });
};
