'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

type keys = 'q' | 'from' | 'to' | 'appid' | 'salt' | 'sign';

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
}

function expectTrue(data: boolean) {
  try {
    expect(data).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'assertion failure');
  }
};

export default function requestMethodJsunit(): void {
  describe('requestMethodJsunit', () => {

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodPOST_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_POST_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodPOST_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodPOST_static_0300'
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            extraData: {
              "q": "Hello World",
              "from": "en",
              "to": "zh",
              "appid": "YOUR_APP_ID",
              "salt": "1435660288",
              "sign": "YOUR_SIGNATURE"
            } as Record<keys, string>,
            header: 'content-type: application/x-www-form-urlencoded',
            readTimeout: 60000,
            connectTimeout: 60000
          }
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://fanyi-api.baidu.com/api/trans/vip/translate', httpRequestOptions)
            .then(data => {
              hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
              if (data) {
                expectTrue(data == 200);
              }
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
              expectFalse();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodPOST_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodOptions_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_Options_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodOptions_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.OPTIONS,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions,
            (err: BusinessError | null, data: int | undefined) => {
              hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
              if (data) {
                expectTrue(data == 200);
              }
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodOptions_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodOptions_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_Options_0400
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodOptions_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.OPTIONS,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions).then(data => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodOptions_static_0400 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodHead_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_Head_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodHead_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodHead_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.HEAD,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions,
            (err: BusinessError | null, data: int | undefined) => {
              if (data) {
                expectTrue(data == 200);
              }
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`, JSON.stringify(err));
              done();
            });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodHead_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodHEAD_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_HEAD_0400
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodHEAD_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodHEAD_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.HEAD,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions).then(data => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodHEAD_static_0400 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodPUT_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_PUT_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodPUT_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodPUT_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.PUT,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://httpbin.moyufangge.com/anything', httpRequestOptions, (err, data) => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodPUT_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodPUT_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_PUT_0400
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodPUT_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodPUT_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.PUT,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://httpbin.moyufangge.com/anything', httpRequestOptions).then(data => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodPUT_static_0400 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodDELETE_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_DELETE_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodDELETE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodDELETE_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.DELETE,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.openharmony.cn/', httpRequestOptions, (err, data) => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
            if (data) {
              expectTrue(data == 405);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodDELETE_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodDELETE_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_DELETE_0400
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodDELETE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodDELETE_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.DELETE,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.openharmony.cn/', httpRequestOptions).then(data => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            if (data) {
              expectTrue(data == 405);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodDELETE_static_0400 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodTRACE_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_TRACE_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodTRACE_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodTRACE_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.TRACE,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions, (err, data) => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodTRACE_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodTRACE_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_TRACE_0400
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodTRACE_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodTRACE_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.TRACE,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();

          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions).then(data => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodTRACE_static_0400 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodCONNECT_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_CONNECT_0300
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodCONNECT_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodCONNECT_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.CONNECT,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };

          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions, (err, data) => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(err) + ' data: ' + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodCONNECT_static_0300 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestMethodCONNECT_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestMethod_CONNECT_0400
     * @tc.desc   Test Test HttpRequestMethod property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkMgrHttpHttpRequestMethodCONNECT_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrHttpHttpRequestMethodCONNECT_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let httpRequestOptions: http.HttpRequestOptions = {
            method: http.RequestMethod.CONNECT,
            header: 'content-type: application/json',
            readTimeout: 60000,
            connectTimeout: 60000
          };
          let httpRequest = http.createHttp();
          httpRequest.requestInStream('https://www.baidu.com/', httpRequestOptions).then(data => {
            hilog.info(domain, tag, '%{public}s', caseName + JSON.stringify(data));
            if (data) {
              expectTrue(data == 200);
            }
            httpRequest.destroy();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', caseName + 'errocode' + JSON.stringify(error));
            expectFalse();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s',
            'testNetworkMgrHttpHttpRequestMethodCONNECT_static_0400 : error = ' + error);
          expectFalse();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
  })
};