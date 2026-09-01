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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import { cacheDownload, BusinessError } from '@kit.BasicServicesKit';

export default function requestSupplementalCacheDownloadTest() {
  describe('requestSupplementalCacheDownloadJSTest', () => {
    console.info('====>################################request cacheDownload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: Function) => {
      console.info('====>beforeAll: requestSupplementalCacheDownloadJSTest start');
      done();
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0100
     * @tc.number SUB_Request_cacheDownload_Supplemental_0100
     * @tc.desc   SslType TLCP enum value coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0100', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0100 is starting-----------------------");
      try {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0100 SslType.TLCP: ${cacheDownload.SslType.TLCP}`);
        expect(cacheDownload.SslType.TLCP !== undefined).assertTrue();
        expect(cacheDownload.SslType.TLCP !== null).assertTrue();
        expect(cacheDownload.SslType.TLCP === 'TLCP').assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0100 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0200
     * @tc.number SUB_Request_cacheDownload_Supplemental_0200
     * @tc.desc   SslType TLS enum value coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0200', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0200 is starting-----------------------");
      try {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0200 SslType.TLS: ${cacheDownload.SslType.TLS}`);
        expect(cacheDownload.SslType.TLS !== undefined).assertTrue();
        expect(cacheDownload.SslType.TLS !== null).assertTrue();
        expect(cacheDownload.SslType.TLS === 'TLS').assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0200 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0300
     * @tc.number SUB_Request_cacheDownload_Supplemental_0300
     * @tc.desc   cacheDownload download with sslType TLCP coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0300', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0300 is starting-----------------------");
      let testUrl = 'https://127.0.0.1:9999/testResource';
      let options: cacheDownload.CacheDownloadOptions = {
        sslType: cacheDownload.SslType.TLCP,
      };
      try {
        cacheDownload.download(testUrl, options);
        console.info("====>SUB_Request_cacheDownload_Supplemental_0300 download with TLCP success");
        expect(options.sslType === 'TLCP').assertTrue();
        try {
          cacheDownload.cancel(testUrl);
          console.info("====>SUB_Request_cacheDownload_Supplemental_0300 cancel success");
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_Supplemental_0300 cancel err: ${JSON.stringify(err)}`);
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0300 catch err: code=${e.code}, message=${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0400
     * @tc.number SUB_Request_cacheDownload_Supplemental_0400
     * @tc.desc   cacheDownload download with sslType TLS coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0400', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0400 is starting-----------------------");
      let testUrl = 'https://127.0.0.1:9998/testResource';
      let options: cacheDownload.CacheDownloadOptions = {
        sslType: cacheDownload.SslType.TLS,
      };
      try {
        cacheDownload.download(testUrl, options);
        console.info("====>SUB_Request_cacheDownload_Supplemental_0400 download with TLS success");
        expect(options.sslType === 'TLS').assertTrue();
        try {
          cacheDownload.cancel(testUrl);
          console.info("====>SUB_Request_cacheDownload_Supplemental_0400 cancel success");
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_Supplemental_0400 cancel err: ${JSON.stringify(err)}`);
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0400 catch err: code=${e.code}, message=${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0500
     * @tc.number SUB_Request_cacheDownload_Supplemental_0500
     * @tc.desc   cacheDownload download with sslType TLCP and full options coverage.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0500', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0500 is starting-----------------------");
      let testUrl = 'https://127.0.0.1:9997/testResource';
      let options: cacheDownload.CacheDownloadOptions = {
        headers: { 'Accept': 'application/json' },
        sslType: cacheDownload.SslType.TLCP,
      };
      try {
        cacheDownload.download(testUrl, options);
        console.info("====>SUB_Request_cacheDownload_Supplemental_0500 download with TLCP and headers success");
        expect(options.sslType === 'TLCP').assertTrue();
        try {
          cacheDownload.cancel(testUrl);
          console.info("====>SUB_Request_cacheDownload_Supplemental_0500 cancel success");
        } catch (err) {
          console.info(`====>SUB_Request_cacheDownload_Supplemental_0500 cancel err: ${JSON.stringify(err)}`);
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0500 catch err: code=${e.code}, message=${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0600
     * @tc.number SUB_Request_cacheDownload_Supplemental_0600
     * @tc.desc   offDownloadSuccess url is empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0600', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0600 is starting-----------------------");
      try {
        cacheDownload.offDownloadSuccess('');
        console.info("====>SUB_Request_cacheDownload_Supplemental_0600 offDownloadSuccess empty url success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0600 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0700
     * @tc.number SUB_Request_cacheDownload_Supplemental_0700
     * @tc.desc   offDownloadSuccess url length exceeds 8192 bytes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0700', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0700 is starting-----------------------");
      try {
        let longUrl = 'https://example.com/' + ''.padEnd(8200, 'a');
        cacheDownload.offDownloadSuccess(longUrl);
        console.info("====>SUB_Request_cacheDownload_Supplemental_0700 offDownloadSuccess long url success");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0700 catch err: ${JSON.stringify(err)}`);
        expect(err.code === 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0800
     * @tc.number SUB_Request_cacheDownload_Supplemental_0800
     * @tc.desc   offDownloadSuccess url with invalid protocol (ftp).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0800', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0800 is starting-----------------------");
      let isOffSuccess: boolean = false;
      try {
        cacheDownload.offDownloadSuccess('ftp://example.com/resource');
        isOffSuccess = true;
        console.info("====>SUB_Request_cacheDownload_Supplemental_0800 offDownloadSuccess invalid protocol url success");
        expect(isOffSuccess).assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0800 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_0900
     * @tc.number SUB_Request_cacheDownload_Supplemental_0900
     * @tc.desc   offDownloadSuccess with valid url and callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_0900', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_0900 is starting-----------------------");
      let isOffSuccess: boolean = false;
      try {
        let testUrl = 'https://127.0.0.1:9996/testResource';
        let successCallback = () => {
          console.info("====>SUB_Request_cacheDownload_Supplemental_0900 onDownloadSuccess callback");
        };
        cacheDownload.onDownloadSuccess(testUrl, successCallback);
        cacheDownload.offDownloadSuccess(testUrl, successCallback);
        isOffSuccess = true;
        console.info("====>SUB_Request_cacheDownload_Supplemental_0900 offDownloadSuccess with callback success");
        expect(isOffSuccess).assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_0900 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Request_cacheDownload_Supplemental_1000
     * @tc.number SUB_Request_cacheDownload_Supplemental_1000
     * @tc.desc   offDownloadSuccess with valid url and no callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_cacheDownload_Supplemental_1000', Level.LEVEL3, async (done: Function) => {
      console.info("-----------------------SUB_Request_cacheDownload_Supplemental_1000 is starting-----------------------");
      let isOffSuccess: boolean = false;
      try {
        let testUrl = 'https://127.0.0.1:9995/testResource';
        let successCallback = () => {
          console.info("====>SUB_Request_cacheDownload_Supplemental_1000 onDownloadSuccess callback");
        };
        cacheDownload.onDownloadSuccess(testUrl, successCallback);
        cacheDownload.offDownloadSuccess(testUrl);
        isOffSuccess = true;
        console.info("====>SUB_Request_cacheDownload_Supplemental_1000 offDownloadSuccess without callback success");
        expect(isOffSuccess).assertTrue();
        done();
      } catch (err) {
        console.info(`====>SUB_Request_cacheDownload_Supplemental_1000 catch err: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

  })
}
