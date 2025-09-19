/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import connection from '@ohos.net.connection';

let domain: Int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testHttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HttpResponseCacheTest() {
  describe('HttpResponseCacheTest', () => {

    /*
     * @tc.number : SUB_NetworkMgr_Http_CreateHttpResponseCache_0100
     * @tc.name   : testNetworkMgrHttpCreateHttpResponseCache_static_0100
     * @tc.desc   : Create a default object to store the response of HTTP access requests.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrHttpCreateHttpResponseCache_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
        expect(true).assertEqual(typeof httpResponseCache == 'object');
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName}---End `);
    });

    /*
     * @tc.number : SUB_NetworkMgr_Http_CreateHttpResponseCache_0200
     * @tc.name   : testNetworkMgrHttpCreateHttpResponseCache_Static_0200
     * @tc.desc   : Create a default object to store the response of HTTP access requests.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrHttpCreateHttpResponseCache_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache_Static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let cacheSize: Int | undefined = 10;
        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(Math.floor(cacheSize) as Int);
        expect(true).assertEqual(typeof httpResponseCache == 'object');
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName}---End `);
    });

    /*
     * @tc.number : SUB_NetworkMgr_Http_CreateHttpResponseCache_0300
     * @tc.name   : testNetworkMgrHttpCreateHttpResponseCache_static_0300
     * @tc.desc   : Create a default object to store the response of HTTP access requests.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrHttpCreateHttpResponseCache_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrHttpCreateHttpResponseCache_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let cacheSize: Int | undefined = 11;
        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache(cacheSize);
        expect(true).assertEqual(typeof httpResponseCache == 'object');
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName}---End `);
    });

   /**
    * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0100
    * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush_static_0100
    * @tc.desc   Write cached data to the file system.Use callback as an asynchronous method.
    * @tc.level  Level 3
    * @tc.type   Function
    * @tc.size   MediumTest
    */
    it("testNetworkMgrHttpHttpResponseCacheFlush_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush((err: BusinessError<void>|null, data: undefined) => {
              if (err?.code != 0) {
                hilog.error(domain, tag, `${caseName} flush failed ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              } else {
                hilog.info(domain, tag, `${caseName} failed err: ${JSON.stringify(data)}`);
                expect(data == undefined).assertTrue();
                done();
              }
            });
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName}---End`);
    });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpResponseCache_Flush_0200
     * @tc.name   testNetworkMgrHttpHttpResponseCacheFlush_static_0200
     * @tc.desc   Write cached data to the file system.Use Promise as an asynchronous method.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpResponseCacheFlush_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrHttpHttpResponseCacheFlush_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle | undefined) => {
          if (data?.netId === 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            expect().assertFail();
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush().then(() => {
              expect(data !== undefined).assertTrue();
              done();
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} flush fail err:${JSON.stringify(error)}`);
              expect().assertFail();
              done();
            });
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} try...catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, `${caseName}---End`);
    });



  });
}