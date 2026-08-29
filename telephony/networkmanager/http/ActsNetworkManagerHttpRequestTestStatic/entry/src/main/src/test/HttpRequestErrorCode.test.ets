'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.moyufangge.com/anything";

let tlsOptions_system : http.TlsOptions = 'system'
let tlsConfigPram01 :http.TlsConfig = {
  tlsVersionMin: http.TlsVersion.TLS_V_1_0,
  tlsVersionMax: http.TlsVersion.TLS_V_1_1,
  cipherSuites:[ 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
    'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV11CipherSuite
  ]
}
let tlsConfigPram02 :http.TlsConfig = {
  tlsVersionMin: http.TlsVersion.TLS_V_1_2,
  tlsVersionMax: http.TlsVersion.TLS_V_1_3,
  cipherSuites:[
    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
    'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite,
  ]
}
let tlsOptions_config_01 : http.TlsOptions = tlsConfigPram01
let tlsOptions_config_02 : http.TlsOptions = tlsConfigPram02
let serverAuthentication: http.ServerAuthentication ={
  credential: {
    username: "proxy-username",
    password: "proxy-password"
  },
  authenticationType: "basic"
}


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
    console.info("expectInfo", `test sucess`);
  }
}


export default function httpRequestErrorCodeTest() {

  describe("HttpRequestErrorCodeTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0100
     * @tc.desc   test http request(url, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
              if(err?.code != 0){
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300003);
                httpRequest.destroy();
                done();
              }else{
                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0200
     * @tc.desc   test http request(url, options, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');

            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
              if(err?.code != 0){
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300003);
                httpRequest.destroy();
                done();
              }else{
                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0300
     * @tc.desc   test http request(url, options, Promise) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'test03testHttpRequestMethodErrorCode_static_030000';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request('', {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
              ExpectFail();
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0700
     * @tc.desc   test http request(url, callback) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0700';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('ws://baidu.com', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
              if(err?.code != 0){
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300001);
                httpRequest.destroy();
                done();
              }else{
                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0800
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0800
     * @tc.desc   test http request(url, options, callback) with request error code 2300001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0800';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('ws://baidu.com', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
              if(err?.code != 0){
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300001);
                httpRequest.destroy();
                done();
              }else{
                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0900
     * @tc.desc   test http request(url, callback) with request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_0900';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request('http://baidu.com',
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectTrue(typeof data?.result == 'string');
                    ExpectTrue(typeof data?.resultType == 'int');
                    ExpectTrue(typeof data?.responseCode == 'int');
                    ExpectTrue(typeof data?.header == 'object');
                    ExpectTrue(typeof data?.cookies == 'string');
                    ExpectTrue(typeof data?.performanceTiming == 'object');
                    ExpectTrue(typeof data?.performanceTiming.dnsTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.tcpTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.tlsTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.totalTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.redirectTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.firstSendTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.totalFinishTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.firstReceiveTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.responseBodyTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.responseHeaderTiming == 'number');
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1000
     * @tc.desc   test http request(url, callback) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1000';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request('127.0.0.1',
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    ExpectTrue(err?.code == 2300007);
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1100
     * @tc.desc   test http request(url, callback) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request('https://self-signed.badssl.com',
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    ExpectTrue(err?.code == 2300060);
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1200
     * @tc.desc   test http request(url, options, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');

              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request('http://baidu.com', {
                method: http.RequestMethod.POST, usingCache: false
              }, (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                if (err?.code != 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                  httpRequest.destroy();
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                  ExpectTrue(typeof data?.result == 'string');
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1300
     * @tc.desc   test http request(url, options, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1300';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');

              let httpRequest: http.HttpRequest = http.createHttp();
              const certPath_legitimate: string = "xtsTest";
              const keyPath_legitimate: string = "xtsTest";
              const pwd: string = "";
              let httpRequestOptions: http.HttpRequestOptions = {
                method: http.RequestMethod.POST,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                }
              }
              httpRequest.request('http://baidu.com', httpRequestOptions,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectTrue(typeof data?.result == 'string');
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1500
     * @tc.desc   test http request(url, options, callback) with request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1500';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET
              };
              httpRequest.request('http://baidu.com', httpRequestOptions_noParm,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectTrue(typeof data?.result == 'string');
                    ExpectTrue(typeof data?.resultType == 'int');
                    ExpectTrue(typeof data?.responseCode == 'int');
                    ExpectTrue(typeof data?.header == 'object');
                    ExpectTrue(typeof data?.cookies == 'string');
                    ExpectTrue(typeof data?.performanceTiming == 'object');
                    ExpectTrue(typeof data?.performanceTiming.dnsTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.tcpTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.tlsTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.totalTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.redirectTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.firstSendTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.totalFinishTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.firstReceiveTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.responseBodyTiming == 'number');
                    ExpectTrue(typeof data?.performanceTiming.responseHeaderTiming == 'number');
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1600
     * @tc.desc   test http request(url, options, callback) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1600';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET
              };
              httpRequest.request('127.0.0.1', httpRequestOptions_noParm,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    ExpectTrue(err?.code == 2300007);
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1700
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1700
     * @tc.desc   test http request(url, options, callback) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1700';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET
              };
              httpRequest.request('https://self-signed.badssl.com', httpRequestOptions_noParm,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                    ExpectTrue(err?.code == 2300060);
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_1900
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1900
     * @tc.desc   test http request(url, options, Promise) with request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_1900';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let promise = httpRequest.request('http://baidu.com', {
                method: http.RequestMethod.POST, usingCache: false
              });
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectTrue(data != null);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_2000
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2000
     * @tc.desc   test http request(url, options, Promise) with request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_2000';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              const certPath_legitimate: string = "xtsTest";
              const keyPath_legitimate: string = "xtsTest";
              const pwd: string = "";
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions: http.HttpRequestOptions = {
                method: http.RequestMethod.POST,
                clientCert: {
                  certPath: certPath_legitimate,
                  keyPath: keyPath_legitimate,
                  keyPassword: pwd,
                  certType: http.CertType.P12,
                }
              }
              let promise = httpRequest.request('http://baidu.com', httpRequestOptions);
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectTrue(data != null);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_2100
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2100
     * @tc.desc   test http request(url, callback) with request error code 2300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_2100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET
              };
              let promise = httpRequest.request('http://baidu.com', httpRequestOptions_noParm);
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectTrue(typeof data?.result == 'string');
                ExpectTrue(typeof data?.resultType == 'int');
                ExpectTrue(typeof data?.responseCode == 'int');
                ExpectTrue(typeof data?.header == 'object');
                ExpectTrue(typeof data?.cookies == 'string');
                ExpectTrue(typeof data?.performanceTiming == 'object');
                ExpectTrue(typeof data?.performanceTiming.dnsTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.tcpTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.tlsTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.totalTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.redirectTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.firstSendTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.totalFinishTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.firstReceiveTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.responseBodyTiming == 'number');
                ExpectTrue(typeof data?.performanceTiming.responseHeaderTiming == 'number');
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_2200
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2200
     * @tc.desc   test http request(url, options, Promise) with request error code 2300007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_2200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET
              };
              let promise = httpRequest.request('127.0.0.1', httpRequestOptions_noParm);
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(error));
                ExpectTrue(error?.code == 2300007);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_2300
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2300
     * @tc.desc   test http request(url, options, Promise) with request error code 2300060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_2300';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET
              };
              let promise = httpRequest.request('https://self-signed.badssl.com', httpRequestOptions_noParm);
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(error));
                ExpectTrue(error?.code == 2300060);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_2400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_2400
     * @tc.desc   test http request(url, options, Promise) with request error code 2300005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpRequestMethodErrorCode_static_2400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let ExclusionList = "";
              let array = ExclusionList.split(',');
              let httpProxy: http.HttpProxy = {
                host: "host",
                port: 1,
                exclusionList: array
              };
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.GET,
                usingProxy: httpProxy
              };
              let promise = httpRequest.request('https://www.baidu.com', httpRequestOptions_noParm);
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                hilog.info(domain, tag, '%{public}s', caseName + '  get error code is ' + error.code);
                ExpectTrue(error?.code === 2300005);
                httpRequest.destroy();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      })

    /**
     * @tc.name   testHttpX509CertInterfaceCoverage0100
     * @tc.number SUB_NetworkMgr_Http_X509Cert_Interface_Coverage_0100
     * @tc.desc   test http X509Cert type interface coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testHttpX509CertInterfaceCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpX509CertInterfaceCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let remoteValidationCallback: http.ValidationCallback = (context: http.ValidationContext): boolean => {
              hilog.info(domain, tag, '%{public}s', caseName + ' remoteValidation callback invoked');
              ExpectTrue(context !== undefined);
              ExpectTrue(context !== null);
              ExpectTrue(typeof context === 'object');
              if (context.x509Certs && context.x509Certs.length > 0) {
                let x509Cert: http.X509Cert = context.x509Certs[0];
                ExpectTrue(x509Cert !== undefined);
                hilog.info(domain, tag, '%{public}s', caseName + ' x509Cert is valid');
              }
              return true;
            };
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testValidationContextInterfaceCoverage0100
     * @tc.number SUB_NetworkMgr_Http_ValidationContext_Interface_Coverage_0100
     * @tc.desc   test http ValidationContext interface with pemCerts, x509Certs, host, ip fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testValidationContextInterfaceCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testValidationContextInterfaceCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let validationCallback: http.ValidationCallback = (context: http.ValidationContext): boolean => {
              hilog.info(domain, tag, '%{public}s', caseName + ' validation callback invoked');
              ExpectTrue(context !== undefined);
              ExpectTrue(context !== null);
              ExpectTrue(typeof context === 'object');
              ExpectTrue(context.pemCerts !== undefined);
              ExpectTrue(context.pemCerts !== null);
              ExpectTrue(Array.isArray(context.pemCerts));
              ExpectTrue(context.x509Certs !== undefined);
              ExpectTrue(context.x509Certs !== null);
              ExpectTrue(Array.isArray(context.x509Certs));
              ExpectTrue(context.host !== undefined);
              ExpectTrue(context.host !== null);
              ExpectTrue(typeof context.host === 'string');
              ExpectTrue(context.ip !== undefined);
              ExpectTrue(context.ip !== null);
              ExpectTrue(typeof context.ip === 'string');
              hilog.info(domain, tag, '%{public}s', caseName + ' all ValidationContext fields validated');
              return true;
            };
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testValidationCallbackSignature0100
     * @tc.number SUB_NetworkMgr_Http_ValidationCallback_Signature_0100
     * @tc.desc   test http ValidationCallback signature and behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testValidationCallbackSignature0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testValidationCallbackSignature0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let syncCallbackTrue: http.ValidationCallback = (context: http.ValidationContext): boolean => {
              ExpectTrue(context !== undefined);
              ExpectTrue(context !== null);
              ExpectTrue(typeof context === 'object');
              ExpectTrue(context.pemCerts !== undefined);
              ExpectTrue(context.x509Certs !== undefined);
              ExpectTrue(context.ip !== undefined);
              ExpectTrue(context.host !== undefined);
              return true;
            };
            let asyncCallbackPromise: http.ValidationCallback = (context: http.ValidationContext): Promise<boolean> => {
              return new Promise<boolean>((resolve) => {
                ExpectTrue(asyncCallbackPromise !== undefined);
                ExpectTrue(asyncCallbackPromise !== null);
                ExpectTrue(typeof context === 'object');
                resolve(true);
              });
            };
            let httpRequestSync: http.HttpRequest = http.createHttp();
            let httpRequestOptionsSync: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequestSync.request('https://www.baidu.com', httpRequestOptionsSync).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': syncCallbackTrue HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequestSync.destroy();
              hilog.info(domain, tag, '%{public}s', caseName+ ' syncCallbackTrue test end');
              let httpRequestAsync: http.HttpRequest = http.createHttp();
              let httpRequestOptionsAsync: http.HttpRequestOptions = {
                method: http.RequestMethod.GET,
                connectTimeout: 5000,
                readTimeout: 5000,
              };
              httpRequestAsync.request('https://www.baidu.com', httpRequestOptionsAsync).then((dataAsync: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': asyncCallbackPromise HttpResponse ->' + JSON.stringify(dataAsync));
                ExpectTrue(dataAsync.responseCode == 200);
                httpRequestAsync.destroy();
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +' asyncCallbackPromise get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300003);
                httpRequestAsync.destroy();
                done();
              });
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +' syncCallbackTrue get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequestSync.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testServerAuthenticationInterfaceCoverage0100
     * @tc.number SUB_NetworkMgr_Http_ServerAuthentication_Interface_Coverage_0100
     * @tc.desc   test http ServerAuthentication interface coverage with credential and authenticationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testServerAuthenticationInterfaceCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testServerAuthenticationInterfaceCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let serverAuth: http.ServerAuthentication = {
              credential: {
                username: "proxy-username",
                password: "proxy-password"
              },
              authenticationType: "basic"
            };
            ExpectTrue(serverAuth !== undefined);
            ExpectTrue(serverAuth !== null);
            ExpectTrue(typeof serverAuth === 'object');
            ExpectTrue(serverAuth.credential !== undefined);
            ExpectTrue(serverAuth.credential !== null);
            ExpectTrue(typeof serverAuth.credential === 'object');
            ExpectTrue(serverAuth.credential.username === "proxy-username");
            ExpectTrue(serverAuth.credential.password === "proxy-password");
            ExpectTrue(serverAuth.authenticationType === "basic");
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testServerAuthenticationCredentialCoverage0100
     * @tc.number SUB_NetworkMgr_Http_ServerAuthentication_Credential_Coverage_0100
     * @tc.desc   test http ServerAuthentication credential property coverage with Credential type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testServerAuthenticationCredentialCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testServerAuthenticationCredentialCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let credential: http.Credential = {
              username: "test-user",
              password: "test-pass"
            };
            ExpectTrue(credential !== undefined);
            ExpectTrue(credential !== null);
            ExpectTrue(typeof credential === 'object');
            ExpectTrue(typeof credential.username === 'string');
            ExpectTrue(typeof credential.password === 'string');
            ExpectTrue(credential.username === "test-user");
            ExpectTrue(credential.password === "test-pass");
            let serverAuth: http.ServerAuthentication = {
              credential: credential,
              authenticationType: "basic"
            };
            ExpectTrue(serverAuth.credential === credential);
            ExpectTrue(serverAuth.credential.username === "test-user");
            ExpectTrue(serverAuth.credential.password === "test-pass");
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsOptionsTypeCoverage0100
     * @tc.number SUB_NetworkMgr_Http_TlsOptions_Type_Coverage_0100
     * @tc.desc   test http TlsOptions type coverage with 'system' and TlsConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsOptionsTypeCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsOptionsTypeCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let tlsOptionsSystem: http.TlsOptions = 'system';
            ExpectTrue(tlsOptionsSystem === 'system');
            ExpectTrue(typeof tlsOptionsSystem === 'string');
            let tlsOptionsConfig: http.TlsOptions = tlsConfigPram01;
            ExpectTrue(tlsOptionsConfig !== undefined);
            ExpectTrue(tlsOptionsConfig !== null);
            ExpectTrue(typeof tlsOptionsConfig === 'object');
            ExpectTrue((tlsOptionsConfig as http.TlsConfig).tlsVersionMin === http.TlsVersion.TLS_V_1_0);
            ExpectTrue((tlsOptionsConfig as http.TlsConfig).tlsVersionMax === http.TlsVersion.TLS_V_1_1);
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testRemoteValidationTypeCoverage0100
     * @tc.number SUB_NetworkMgr_Http_RemoteValidation_Type_Coverage_0100
     * @tc.desc   test http RemoteValidation type coverage with 'system', 'skip' and ValidationCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testRemoteValidationTypeCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testRemoteValidationTypeCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let remoteValidationSystem: http.RemoteValidation = 'system';
            ExpectTrue(remoteValidationSystem === 'system');
            ExpectTrue(typeof remoteValidationSystem === 'string');
            let remoteValidationSkip: http.RemoteValidation = 'skip';
            ExpectTrue(remoteValidationSkip === 'skip');
            ExpectTrue(typeof remoteValidationSkip === 'string');
            let remoteValidationCallback: http.RemoteValidation = (context: http.ValidationContext): boolean => {
              hilog.info(domain, tag, '%{public}s', caseName + ' remoteValidation callback invoked');
              return true;
            };
            ExpectTrue(typeof remoteValidationCallback === 'function');
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testAuthenticationTypeCoverage0100
     * @tc.number SUB_NetworkMgr_Http_AuthenticationType_Type_Coverage_0100
     * @tc.desc   test http AuthenticationType type coverage with 'basic', 'ntlm' and 'digest'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testAuthenticationTypeCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testAuthenticationTypeCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let authTypeBasic: http.AuthenticationType = 'basic';
            ExpectTrue(authTypeBasic === 'basic');
            ExpectTrue(typeof authTypeBasic === 'string');
            let authTypeNtlm: http.AuthenticationType = 'ntlm';
            ExpectTrue(authTypeNtlm === 'ntlm');
            ExpectTrue(typeof authTypeNtlm === 'string');
            let authTypeDigest: http.AuthenticationType = 'digest';
            ExpectTrue(authTypeDigest === 'digest');
            ExpectTrue(typeof authTypeDigest === 'string');
            let serverAuth: http.ServerAuthentication = {
              credential: {
                username: "proxy-username",
                password: "proxy-password"
              },
              authenticationType: authTypeBasic
            };
            ExpectTrue(serverAuth.authenticationType === 'basic');
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              done();
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
              ExpectTrue(err?.code == 2300003);
              httpRequest.destroy();
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsConfigInterfaceCoverage0100
     * @tc.number SUB_NetworkMgr_Http_TlsConfig_Interface_Coverage_0100
     * @tc.desc   test http TlsConfig interface coverage with complete TlsConfig object structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsConfigInterfaceCoverage0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsConfigInterfaceCoverage0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let tlsConfig: http.TlsConfig = {
              tlsVersionMin: http.TlsVersion.TLS_V_1_0,
              tlsVersionMax: http.TlsVersion.TLS_V_1_2,
              cipherSuites: [
                'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite
              ]
            };
            ExpectTrue(tlsConfig !== undefined);
            ExpectTrue(tlsConfig.tlsVersionMin !== undefined);
            ExpectTrue(tlsConfig.tlsVersionMax !== undefined);
            ExpectTrue(tlsConfig.cipherSuites !== undefined);
            ExpectTrue(tlsConfig.cipherSuites!.length > 0);
            ExpectTrue(typeof tlsConfig.tlsVersionMin === 'number');
            ExpectTrue(typeof tlsConfig.tlsVersionMax === 'number');
            let httpRequest: http.HttpRequest = http.createHttp();
            let httpRequestOptions: http.HttpRequestOptions = {
              method: http.RequestMethod.GET,
              connectTimeout: 5000,
              readTimeout: 5000,
            };
            httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
              ExpectTrue(data.responseCode == 200);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }).catch((err: Error) => {
              hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
              ExpectFail();
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsV13SpecificCipherSuite0100
     * @tc.number SUB_NetworkMgr_Http_TlsV13SpecificCipherSuite_0100
     * @tc.desc   test http TlsV13SpecificCipherSuite type coverage with all valid values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsV13SpecificCipherSuite0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsV13SpecificCipherSuite0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let cipherSuite_AES_128: http.TlsV13SpecificCipherSuite = 'TLS_AES_128_GCM_SHA256';
        ExpectTrue(cipherSuite_AES_128 === 'TLS_AES_128_GCM_SHA256');
        ExpectTrue(typeof cipherSuite_AES_128 === 'string');

        let cipherSuite_AES_256: http.TlsV13SpecificCipherSuite = 'TLS_AES_256_GCM_SHA384';
        ExpectTrue(cipherSuite_AES_256 === 'TLS_AES_256_GCM_SHA384');
        ExpectTrue(typeof cipherSuite_AES_256 === 'string');

        let cipherSuite_CHACHA20: http.TlsV13SpecificCipherSuite = 'TLS_CHACHA20_POLY1305_SHA256';
        ExpectTrue(cipherSuite_CHACHA20 === 'TLS_CHACHA20_POLY1305_SHA256');
        ExpectTrue(typeof cipherSuite_CHACHA20 === 'string');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_3,
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          cipherSuites: [cipherSuite_AES_128 as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite]
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsV12SpecificCipherSuite0100
     * @tc.number SUB_NetworkMgr_Http_TlsV12SpecificCipherSuite_0100
     * @tc.desc   test http TlsV12SpecificCipherSuite type coverage with all valid values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsV12SpecificCipherSuite0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsV12SpecificCipherSuite0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let cipherSuite_ECDSA_128: http.TlsV12SpecificCipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256';
        ExpectTrue(cipherSuite_ECDSA_128 === 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256');
        ExpectTrue(typeof cipherSuite_ECDSA_128 === 'string');

        let cipherSuite_RSA_128: http.TlsV12SpecificCipherSuite = 'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256';
        ExpectTrue(cipherSuite_RSA_128 === 'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256');
        ExpectTrue(typeof cipherSuite_RSA_128 === 'string');

        let cipherSuite_ECDSA_256: http.TlsV12SpecificCipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384';
        ExpectTrue(cipherSuite_ECDSA_256 === 'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384');
        ExpectTrue(typeof cipherSuite_ECDSA_256 === 'string');

        let cipherSuite_RSA_256: http.TlsV12SpecificCipherSuite = 'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384';
        ExpectTrue(cipherSuite_RSA_256 === 'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384');
        ExpectTrue(typeof cipherSuite_RSA_256 === 'string');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_2,
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          cipherSuites: [cipherSuite_ECDSA_128 as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite]
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsV10SpecificCipherSuite0100
     * @tc.number SUB_NetworkMgr_Http_TlsV10SpecificCipherSuite_0100
     * @tc.desc   test http TlsV10SpecificCipherSuite type coverage with all valid values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsV10SpecificCipherSuite0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsV10SpecificCipherSuite0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let cipherSuite_ECDSA_128_CBC: http.TlsV10SpecificCipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA';
        ExpectTrue(cipherSuite_ECDSA_128_CBC === 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA');
        ExpectTrue(typeof cipherSuite_ECDSA_128_CBC === 'string');

        let cipherSuite_RSA_128_CBC: http.TlsV10SpecificCipherSuite = 'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA';
        ExpectTrue(cipherSuite_RSA_128_CBC === 'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA');
        ExpectTrue(typeof cipherSuite_RSA_128_CBC === 'string');

        let cipherSuite_ECDSA_256_CBC: http.TlsV10SpecificCipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA';
        ExpectTrue(cipherSuite_ECDSA_256_CBC === 'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA');
        ExpectTrue(typeof cipherSuite_ECDSA_256_CBC === 'string');

        let cipherSuite_RSA_256_CBC: http.TlsV10SpecificCipherSuite = 'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA';
        ExpectTrue(cipherSuite_RSA_256_CBC === 'TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA');
        ExpectTrue(typeof cipherSuite_RSA_256_CBC === 'string');

        let cipherSuite_RSA_128: http.TlsV10SpecificCipherSuite = 'TLS_RSA_WITH_AES_128_CBC_SHA';
        ExpectTrue(cipherSuite_RSA_128 === 'TLS_RSA_WITH_AES_128_CBC_SHA');
        ExpectTrue(typeof cipherSuite_RSA_128 === 'string');

        let cipherSuite_RSA_256: http.TlsV10SpecificCipherSuite = 'TLS_RSA_WITH_AES_256_CBC_SHA';
        ExpectTrue(cipherSuite_RSA_256 === 'TLS_RSA_WITH_AES_256_CBC_SHA');
        ExpectTrue(typeof cipherSuite_RSA_256 === 'string');

        let cipherSuite_3DES: http.TlsV10SpecificCipherSuite = 'TLS_RSA_WITH_3DES_EDE_CBC_SHA';
        ExpectTrue(cipherSuite_3DES === 'TLS_RSA_WITH_3DES_EDE_CBC_SHA');
        ExpectTrue(typeof cipherSuite_3DES === 'string');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_0,
          tlsVersionMax: http.TlsVersion.TLS_V_1_1,
          cipherSuites: [cipherSuite_ECDSA_128_CBC as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite]
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testCipherSuiteHierarchy0100
     * @tc.number SUB_NetworkMgr_Http_CipherSuite_Hierarchy_0100
     * @tc.desc   test http CipherSuite type hierarchy coverage (CipherSuite > TlsV13CipherSuite > TlsV12CipherSuite > TlsV11CipherSuite > TlsV10CipherSuite > TlsV10SpecificCipherSuite)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testCipherSuiteHierarchy0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testCipherSuiteHierarchy0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let v10: http.TlsV10CipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite;
        ExpectTrue(v10 === 'TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA');
        ExpectTrue(typeof v10 === 'string');
        let v11: http.TlsV11CipherSuite = 'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV11CipherSuite;
        ExpectTrue(v11 === 'TLS_RSA_WITH_3DES_EDE_CBC_SHA');
        ExpectTrue(typeof v11 === 'string');
        let v12_1: http.TlsV12CipherSuite = 'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV12CipherSuite;
        ExpectTrue(v12_1 === 'TLS_RSA_WITH_3DES_EDE_CBC_SHA');
        ExpectTrue(typeof v12_1 === 'string');
        let v12_2: http.TlsV12CipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite;
        ExpectTrue(v12_2 === 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256');
        ExpectTrue(typeof v12_2 === 'string');
        let v13_1: http.TlsV13CipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV13CipherSuite;
        ExpectTrue(v13_1 === 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256');
        ExpectTrue(typeof v13_1 === 'string');
        let v13_2: http.TlsV13CipherSuite = 'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite;
        ExpectTrue(v13_2 === 'TLS_AES_128_GCM_SHA256');
        ExpectTrue(typeof v13_2 === 'string');
        let cipherSuite_1: http.CipherSuite = 'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.CipherSuite;
        ExpectTrue(cipherSuite_1 === 'TLS_AES_128_GCM_SHA256');
        ExpectTrue(typeof cipherSuite_1 === 'string');
        let cipherSuite_2: http.CipherSuite = 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.CipherSuite;
        ExpectTrue(cipherSuite_2 === 'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256');
        ExpectTrue(typeof cipherSuite_2 === 'string');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_2,
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
          cipherSuites: [cipherSuite_2]
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsVersion0100
     * @tc.number SUB_NetworkMgr_Http_TlsVersion_0100
     * @tc.desc   test http TlsVersion.TLS_V_1_0 enum value equals 4 with actual HTTP request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsVersion0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsVersion0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        ExpectTrue(http.TlsVersion.TLS_V_1_0 == 4);
        ExpectTrue(typeof http.TlsVersion.TLS_V_1_0 === 'number');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_0,
          tlsVersionMax: http.TlsVersion.TLS_V_1_0,
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsVersion0101
     * @tc.number SUB_NetworkMgr_Http_TlsVersion_0101
     * @tc.desc   test http TlsVersion.TLS_V_1_1 enum value equals 5 with actual HTTP request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsVersion0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsVersion0101';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        ExpectTrue(http.TlsVersion.TLS_V_1_1 == 5);
        ExpectTrue(typeof http.TlsVersion.TLS_V_1_1 === 'number');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_1,
          tlsVersionMax: http.TlsVersion.TLS_V_1_1,
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsVersion0102
     * @tc.number SUB_NetworkMgr_Http_TlsVersion_0102
     * @tc.desc   test http TlsVersion.TLS_V_1_2 enum value equals 6 with actual HTTP request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsVersion0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsVersion0102';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        ExpectTrue(http.TlsVersion.TLS_V_1_2 == 6);
        ExpectTrue(typeof http.TlsVersion.TLS_V_1_2 === 'number');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_2,
          tlsVersionMax: http.TlsVersion.TLS_V_1_2,
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testTlsVersion0103
     * @tc.number SUB_NetworkMgr_Http_TlsVersion_0103
     * @tc.desc   test http TlsVersion.TLS_V_1_3 enum value equals 7 with actual HTTP request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */

    it("testTlsVersion0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTlsVersion0103';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        ExpectTrue(http.TlsVersion.TLS_V_1_3 == 7);
        ExpectTrue(typeof http.TlsVersion.TLS_V_1_3 === 'number');

        let httpRequest: http.HttpRequest = http.createHttp();
        let tlsConfig: http.TlsConfig = {
          tlsVersionMin: http.TlsVersion.TLS_V_1_3,
          tlsVersionMax: http.TlsVersion.TLS_V_1_3,
        };
        let httpRequestOptions: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          connectTimeout: 5000,
          readTimeout: 5000,
        };
        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions).then((data: http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
          ExpectTrue(data.responseCode == 200);
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, '%{public}s', caseName + ': catch error in request: ' + JSON.stringify(err));
          ExpectFail();
          httpRequest.destroy();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0400
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0400
     * @tc.desc   test http request(url, callback) with request error code 2300996
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
              if(err?.code != 0){
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300996);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', caseName +'  get response is '+JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
              }
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0500
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0500
     * @tc.desc   test http request(url, options, callback) with request error code 2300996
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');

            let httpRequest: http.HttpRequest = http.createHttp();
            httpRequest.request('', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
              if(err?.code != 0){
                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                ExpectTrue(err?.code == 2300996);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
              } else {
                hilog.info(domain, tag, '%{public}s', caseName +'  get response is '+JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
              }
            });
          }
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

    /**
     * @tc.name   testHttpRequestMethodErrorCode_static_0600
     * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0600
     * @tc.desc   test http request(url, options, Promise) with request error code 2300996
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */

    it("testHttpRequestMethodErrorCode_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testHttpRequestMethodErrorCode_static_0600';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          if (data.netId == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
            ExpectFail();
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
            let httpRequest: http.HttpRequest = http.createHttp();
            let promise = httpRequest.request('', {
              method: http.RequestMethod.GET,
            });
            promise.then((data:http.HttpResponse) => {
              hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
              ExpectFail();
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }).catch((err:Error) => {
              hilog.info(domain, tag, '%{public}s', caseName +': catch error in request: '+JSON.stringify(err));
              ExpectTrue((err as BusinessError)?.code == 2300996);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            });
          }
        }).catch((error: BusinessError) => {
          hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
          ExpectFail();
          done();
        });
      }catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    })

  })

}
