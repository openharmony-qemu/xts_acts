/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import http from '@ohos.net.http';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import connection from '@ohos.net.connection';

export const ADDR_TEST_DOMAIN_HTTPS: string = "https://www.baidu.com/";

export const ADDR_TEST_DOMAIN_HTTP: string = "http://www.baidu.com/";

/**
 * @description assert whether the input argument is true
 * @param data
 */
function ExpectTrue(data: Boolean): void {
  try {
    expect(data).assertTrue();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect true catch error, code: ${error.code}, message: ${error.message}`);
  }
}

/**
 * @description assert whether the input argument is false
 * @param data
 */
function ExpectFalse(data: Boolean): void {
  try {
    expect(data).assertFalse();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect false catch error, code: ${error.code}, message: ${error.message}`);
  }
}

/**
 * @description failure assertions
 */
function ExpectFail(): void {
  try {
    expect().assertFail();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect fail catch error, code: ${error.code}, message: ${error.message}`);
  }
}

export default function HttpResponseExtraInfoTest() {

  describe('HttpResponseExtraInfoTest', () => {

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0100
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0100
     * @tc.desc   Test the default values of all fields in HTTP requests.Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0100";
        console.info(`HttpTest1 ${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`HttpTest1 ${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`HttpTest1 ${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`HttpTest1 ${caseName} Network connected`);
                const httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP, (err: BusinessError, res: http.HttpResponse) => {
                  if (err) {
                    console.error('HttpTest1', ' failed ' + JSON.stringify(err));
                    ExpectFail();
                    done();
                  } else {
                    console.info('HttpTest1', ' success');
                    console.info('HttpTest1', ` data:${JSON.stringify(res)}`);
                    if (res?.connectionExtraInfo) {
                      // let networkProtocolNameArr = ["HTTP/1.0", "HTTP/1.1", "HTTP/2", "HTTP/2 over TLS", "HTTP/3", "Unknown/Non-HTTP"];
                      let connectionExtraInfo = res?.connectionExtraInfo;
                      let isTrue = connectionExtraInfo.networkProtocolName !== 'Unknown/Non-HTTP' &&
                        typeof connectionExtraInfo.localAddress == 'string' &&
                        typeof connectionExtraInfo.remoteAddress == 'string' &&
                        connectionExtraInfo.localPort !== -1 &&
                        connectionExtraInfo.remotePort !== -1 &&
                        connectionExtraInfo.isReusedConnection == false &&
                        connectionExtraInfo.isProxyConnection == false &&
                        connectionExtraInfo.isCacheHit == false &&
                        connectionExtraInfo.redirectCount == 0;

                      console.info('HttpTest1', `isTrue ${isTrue}}`);
                      console.info('HttpTest1', `connectionExtraInfo:${JSON.stringify(connectionExtraInfo)}`);
                      ExpectTrue(isTrue);
                      httpRequest.destroy();
                      done();
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }
                })
              }
            }
          });
        } catch (err) {
          console.info(`HttpTest1 ${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`HttpTest1 ${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0200
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0200
     * @tc.desc   Test the default values of all fields in HTTP requests.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0200";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                const httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP).then((res: http.HttpResponse) => {
                  console.info('success');
                  console.info(`data:${JSON.stringify(res)}`);
                  if (res?.connectionExtraInfo) {
                    // let networkProtocolNameArr = ["HTTP/1.0", "HTTP/1.1", "HTTP/2", "HTTP/2 over TLS", "HTTP/3", "Unknown/Non-HTTP"];
                    let connectionExtraInfo = res?.connectionExtraInfo;
                    let isTrue = connectionExtraInfo.networkProtocolName !== 'Unknown/Non-HTTP' &&
                      typeof connectionExtraInfo.localAddress == 'string' &&
                      typeof connectionExtraInfo.remoteAddress == 'string' &&
                      connectionExtraInfo.localPort !== -1 &&
                      connectionExtraInfo.remotePort !== -1 &&
                      connectionExtraInfo.isReusedConnection == false &&
                      connectionExtraInfo.isProxyConnection == false &&
                      connectionExtraInfo.isCacheHit == false &&
                      connectionExtraInfo.redirectCount == 0;

                    ExpectTrue(isTrue);
                    httpRequest.destroy();
                    done();
                    console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                  } else {
                    httpRequest.destroy();
                    ExpectFail();
                    done();
                  }
                }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0300
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0300
     * @tc.desc   Test the default values of all fields in HTTPS requests.Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0300";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                const httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, (err: BusinessError, res: http.HttpResponse) => {
                  if (err) {
                    console.error('failed ' + JSON.stringify(err));
                    ExpectFail();
                    done();
                  } else {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    if (res?.connectionExtraInfo) {
                      // let networkProtocolNameArr = ["HTTP/1.0", "HTTP/1.1", "HTTP/2", "HTTP/2 over TLS", "HTTP/3", "Unknown/Non-HTTP"];
                      let connectionExtraInfo = res?.connectionExtraInfo;
                      let isTrue = connectionExtraInfo.networkProtocolName !== 'Unknown/Non-HTTP' &&
                        typeof connectionExtraInfo.localAddress == 'string' &&
                        typeof connectionExtraInfo.remoteAddress == 'string' &&
                        connectionExtraInfo.localPort !== -1 &&
                        connectionExtraInfo.remotePort !== -1 &&
                        typeof connectionExtraInfo.tlsVersion == 'number' && //https
                        // typeof connectionExtraInfo.cipherSuite == 'string' && //https
                        connectionExtraInfo.isReusedConnection == false &&
                        connectionExtraInfo.isProxyConnection == false &&
                        connectionExtraInfo.isCacheHit == false &&
                        connectionExtraInfo.redirectCount == 0;
                      ExpectTrue(isTrue);
                      httpRequest.destroy();
                      done();
                      console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }
                })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0400
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0400
     * @tc.desc   Test the default values of all fields in HTTPS requests.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0400";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                const httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS).then((res: http.HttpResponse) => {
                  console.info(' success');
                  console.info(` data:${JSON.stringify(res)}`);
                  if (res?.connectionExtraInfo) {
                    // let networkProtocolNameArr = ["HTTP/1.0", "HTTP/1.1", "HTTP/2", "HTTP/2 over TLS", "HTTP/3", "Unknown/Non-HTTP"];
                    let connectionExtraInfo = res?.connectionExtraInfo;
                    let isTrue = connectionExtraInfo.networkProtocolName !== 'Unknown/Non-HTTP' &&
                      typeof connectionExtraInfo.localAddress == 'string' &&
                      typeof connectionExtraInfo.remoteAddress == 'string' &&
                      connectionExtraInfo.localPort !== -1 &&
                      connectionExtraInfo.remotePort !== -1 &&
                      typeof connectionExtraInfo.tlsVersion == 'number' && //https
                      // typeof connectionExtraInfo.cipherSuite == 'string' && //https
                      connectionExtraInfo.isReusedConnection == false &&
                      connectionExtraInfo.isProxyConnection == false &&
                      connectionExtraInfo.isCacheHit == false &&
                      connectionExtraInfo.redirectCount == 0;

                    ExpectTrue(isTrue);
                    httpRequest.destroy();
                    done();
                    console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                  } else {
                    httpRequest.destroy();
                    ExpectFail();
                    done();
                  }
                }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0500
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0500
     * @tc.desc   Test HTTPS return tlsVersion. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0500";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let tlsOptions_system: http.TlsOptions = 'system'
                let tlsConfigPram01: http.TlsConfig = {
                  tlsVersionMin: http.TlsVersion.TLS_V_1_0,
                  tlsVersionMax: http.TlsVersion.TLS_V_1_1,
                  cipherSuites: ['TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
                    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
                    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
                    'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV11CipherSuite
                  ]
                }
                let tlsConfigPram02: http.TlsConfig = {
                  tlsVersionMin: http.TlsVersion.TLS_V_1_2,
                  tlsVersionMax: http.TlsVersion.TLS_V_1_3,
                  cipherSuites: [
                    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite,
                  ]
                }
                let tlsOptions_config_01: http.TlsOptions = tlsConfigPram01;
                let tlsOptions_config_02: http.TlsOptions = tlsConfigPram02;
                let serverAuthentication: http.ServerAuthentication = {
                  credential: {
                    username: "proxy-username",
                    password: "proxy-password"
                  },
                  authenticationType: "basic"
                }
                let remoteValidation_system: http.RemoteValidation = 'system';

                let httpRequestOptions: http.HttpRequestOptions = {
                  method: http.RequestMethod.GET,
                  //resumeFrom: 9999,
                  //resumeTo: 333,
                  //remoteValidation: remoteValidation_system,
                  //tlsOptions: tlsOptions_system,
                  //serverAuthentication:serverAuthentication
                  tlsOptions: tlsOptions_config_02
                };
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions,
                  (err: BusinessError, res: http.HttpResponse) => {
                    if (err) {
                      console.error(' failed ' + JSON.stringify(err));
                      ExpectFail();
                      done();
                    } else {
                      console.info(' success');
                      console.info(` data:${JSON.stringify(res)}`);
                      if (res?.connectionExtraInfo) {
                        let connectionExtraInfo = res?.connectionExtraInfo;
                        ExpectTrue(typeof connectionExtraInfo.tlsVersion == 'number');
                        httpRequest.destroy();
                        done();
                        console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                      } else {
                        httpRequest.destroy();
                        ExpectFail();
                        done();
                      }
                    }

                  })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0600
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0600
     * @tc.desc   Test HTTPS return tlsVersion. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0600";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let tlsOptions_system: http.TlsOptions = 'system'
                let tlsConfigPram01: http.TlsConfig = {
                  tlsVersionMin: http.TlsVersion.TLS_V_1_0,
                  tlsVersionMax: http.TlsVersion.TLS_V_1_1,
                  cipherSuites: ['TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
                    'TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
                    'TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV10CipherSuite,
                    'TLS_RSA_WITH_3DES_EDE_CBC_SHA' as http.TlsV10SpecificCipherSuite as http.TlsV11CipherSuite
                  ]
                }
                let tlsConfigPram02: http.TlsConfig = {
                  tlsVersionMin: http.TlsVersion.TLS_V_1_2,
                  tlsVersionMax: http.TlsVersion.TLS_V_1_3,
                  cipherSuites: [
                    'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_RSA_WITH_AES_128_GCM_SHA256' as http.TlsV12SpecificCipherSuite as http.TlsV12CipherSuite,
                    'TLS_AES_128_GCM_SHA256' as http.TlsV13SpecificCipherSuite as http.TlsV13CipherSuite,
                  ]
                }
                let tlsOptions_config_01: http.TlsOptions = tlsConfigPram01;
                let tlsOptions_config_02: http.TlsOptions = tlsConfigPram02;
                let serverAuthentication: http.ServerAuthentication = {
                  credential: {
                    username: "proxy-username",
                    password: "proxy-password"
                  },
                  authenticationType: "basic"
                }
                let remoteValidation_system: http.RemoteValidation = 'system';

                let httpRequestOptions: http.HttpRequestOptions = {
                  method: http.RequestMethod.GET,
                  //resumeFrom: 9999,
                  //resumeTo: 333,
                  //remoteValidation: remoteValidation_system,
                  //tlsOptions: tlsOptions_system,
                  //serverAuthentication:serverAuthentication
                  tlsOptions: tlsOptions_config_02
                };
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions)
                  .then((res: http.HttpResponse) => {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    if (res?.connectionExtraInfo) {
                      let connectionExtraInfo = res?.connectionExtraInfo;
                      ExpectTrue(typeof connectionExtraInfo.tlsVersion == 'number');
                      httpRequest.destroy();
                      done();
                      console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0700
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0700
     * @tc.desc   Test HTTP return isProxyConnection. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0700";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let ExclusionList = "";
                let array = ExclusionList.split(',');
                let httpProxy: http.HttpProxy = {
                  host: "http://8.147.129.63",
                  port: 8999,
                  exclusionList: array
                };
                const httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP,
                  {
                    usingProxy: httpProxy
                  },
                  (err: BusinessError, res: http.HttpResponse) => {
                    if (err) {
                      console.error(' failed ' + JSON.stringify(err));
                      ExpectFail();
                      done();
                    } else {
                      console.info(' success');
                      console.info(` data:${JSON.stringify(res)}`);
                      if (res?.connectionExtraInfo) {
                        let connectionExtraInfo = res?.connectionExtraInfo;

                        ExpectTrue(connectionExtraInfo.isProxyConnection == true);
                        httpRequest.destroy();
                        done();
                        console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                      } else {
                        httpRequest.destroy();
                        ExpectFail();
                        done();
                      }
                    }

                  })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo0800
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_0800
     * @tc.desc   Test HTTP return isProxyConnection. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo0800";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let ExclusionList = "";
                let array = ExclusionList.split(',');
                let httpProxy: http.HttpProxy = {
                  host: "http://8.147.129.63",
                  port: 8999,
                  exclusionList: array
                };
                const httpRequest: http.HttpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP,
                  {
                    usingProxy: httpProxy
                  })
                  .then((res: http.HttpResponse) => {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    if (res?.connectionExtraInfo) {
                      let connectionExtraInfo = res?.connectionExtraInfo;

                      ExpectTrue(connectionExtraInfo.isProxyConnection == true);
                      httpRequest.destroy();
                      done();
                      console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1100
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1100
     * @tc.desc   Test HTTP return isCacheHit. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1100";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpResponseCache = http.createHttpResponseCache();
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP,
                  {
                    usingCache: true,
                  },
                  (err: BusinessError, res: http.HttpResponse) => {
                    if (err) {
                      console.error(' failed ' + JSON.stringify(err));
                      ExpectFail();
                      done();
                    } else {
                      console.info('success');
                      console.info(`HttpTest1 data:${JSON.stringify(res)}`);
                      httpResponseCache.flush((err: BusinessError) => {
                        if (err) {
                          console.error('flush fail');
                        } else {
                          console.info('flush success');
                        }
                      });
                      if (res?.connectionExtraInfo) {
                        let connectionExtraInfo = res?.connectionExtraInfo;
                        if (connectionExtraInfo.isCacheHit) {
                          ExpectTrue(connectionExtraInfo.isCacheHit);
                          httpRequest.destroy();
                          done();
                        } else {
                          ExpectTrue(!connectionExtraInfo.isCacheHit);
                          httpRequest.destroy();
                          done();
                        }
                        console.info(`HttpTest1 connectionExtraInfo:${JSON.stringify(connectionExtraInfo.isCacheHit)}`);
                      } else {
                        httpRequest.destroy();
                        ExpectFail();
                        done();
                      }
                    }

                  })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1200
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1200
     * @tc.desc   Test HTTP return isCacheHit.  Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1200";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpResponseCache = http.createHttpResponseCache();
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP,
                  {
                    usingCache: true,
                  })
                  .then((res: http.HttpResponse) => {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    httpResponseCache.flush((err: BusinessError) => {
                      if (err) {
                        console.error('flush fail');
                      } else {
                        console.info('flush success');
                      }
                    });
                    if (res?.connectionExtraInfo) {
                      let connectionExtraInfo = res?.connectionExtraInfo;
                      if (connectionExtraInfo.isCacheHit) {
                        ExpectTrue(connectionExtraInfo.isCacheHit);
                        httpRequest.destroy();
                        done();
                      } else {
                        ExpectTrue(!connectionExtraInfo.isCacheHit);
                        httpRequest.destroy();
                        done();
                      }
                      console.info(`HttpTest1 connectionExtraInfo:${JSON.stringify(connectionExtraInfo.isCacheHit)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1300
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1300
     * @tc.desc   Test HTTPS return isCacheHit. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1300";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpResponseCache = http.createHttpResponseCache();
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS,
                  {
                    usingCache: true,
                  },
                  (err: BusinessError, res: http.HttpResponse) => {
                    if (err) {
                      console.error(' failed ' + JSON.stringify(err));
                      ExpectFail();
                      done();
                    } else {
                      console.info(' success');
                      console.info(` data:${JSON.stringify(res)}`);
                      httpResponseCache.flush((err: BusinessError) => {
                        if (err) {
                          console.error('flush fail');
                        } else {
                          console.info('flush success');
                        }
                      });
                      if (res?.connectionExtraInfo) {
                        let connectionExtraInfo = res?.connectionExtraInfo;
                        if (connectionExtraInfo.isCacheHit) {
                          ExpectTrue(connectionExtraInfo.isCacheHit);
                          httpRequest.destroy();
                          done();
                        } else {
                          ExpectTrue(!connectionExtraInfo.isCacheHit);
                          httpRequest.destroy();
                          done();
                        }
                        console.info(`HttpTest1 connectionExtraInfo:${JSON.stringify(connectionExtraInfo.isCacheHit)}`);
                      } else {
                        httpRequest.destroy();
                        ExpectFail();
                        done();
                      }
                    }

                  })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1400
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1400
     * @tc.desc   Test HTTPS return isCacheHit.  Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1400";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpResponseCache = http.createHttpResponseCache();
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS,
                  {
                    usingCache: true,
                  })
                  .then((res: http.HttpResponse) => {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    httpResponseCache.flush((err: BusinessError) => {
                      if (err) {
                        console.error('flush fail');
                      } else {
                        console.info('flush success');
                      }
                    });
                    if (res?.connectionExtraInfo) {
                      let connectionExtraInfo = res?.connectionExtraInfo;
                      if (connectionExtraInfo.isCacheHit) {
                        ExpectTrue(connectionExtraInfo.isCacheHit);
                        httpRequest.destroy();
                        done();
                      } else {
                        ExpectTrue(!connectionExtraInfo.isCacheHit);
                        httpRequest.destroy();
                        done();
                      }
                      console.info(`HttpTest1 connectionExtraInfo:${JSON.stringify(connectionExtraInfo.isCacheHit)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1500
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1500
     * @tc.desc   Test HTTP return redirectCount. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1500";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP,
                  (err: BusinessError, res: http.HttpResponse) => {
                    if (err) {
                      console.error(' failed ' + JSON.stringify(err));
                      ExpectFail();
                      done();
                    } else {
                      console.info(' success');
                      console.info(` data:${JSON.stringify(res)}`);
                      if (res?.connectionExtraInfo) {
                        let connectionExtraInfo = res?.connectionExtraInfo;

                        ExpectTrue(connectionExtraInfo.redirectCount == 0);
                        httpRequest.destroy();
                        done();
                        console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                      } else {
                        httpRequest.destroy();
                        ExpectFail();
                        done();
                      }
                    }

                  })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1600
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1600
     * @tc.desc   Test HTTP return redirectCount. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1600";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTP)
                  .then((res: http.HttpResponse) => {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    if (res?.connectionExtraInfo) {
                      let connectionExtraInfo = res?.connectionExtraInfo;

                      ExpectTrue(connectionExtraInfo.redirectCount == 0);
                      httpRequest.destroy();
                      done();
                      console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1700
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1700
     * @tc.desc   Test HTTPS return redirectCount. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1700";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS,
                  (err: BusinessError, res: http.HttpResponse) => {
                    if (err) {
                      console.error(' failed ' + JSON.stringify(err));
                      ExpectFail();
                      done();
                    } else {
                      console.info(' success');
                      console.info(` data:${JSON.stringify(res)}`);
                      if (res?.connectionExtraInfo) {
                        let connectionExtraInfo = res?.connectionExtraInfo;

                        ExpectTrue(connectionExtraInfo.redirectCount == 0);
                        httpRequest.destroy();
                        done();
                        console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                      } else {
                        httpRequest.destroy();
                        ExpectFail();
                        done();
                      }
                    }
                  })
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });

    /**
     * @tc.name   testHttpResponseConnectionExtraInfo1800
     * @tc.number SUB_NetworkMgr_Http_Response_ConnectionExtraInfo_1800
     * @tc.desc   Test HTTPS return redirectCount. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpResponseConnectionExtraInfo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = "testHttpResponseConnectionExtraInfo1800";
        console.info(`${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
            if (error) {
              console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
              ExpectFail();
              done();
            } else {
              if (data.netId == 0) {
                console.info(`${caseName} no Network connected`);
                ExpectFail();
                done();
              } else {
                console.info(`${caseName} Network connected`);
                let httpRequest = http.createHttp();
                httpRequest.request(ADDR_TEST_DOMAIN_HTTPS)
                  .then((res: http.HttpResponse) => {
                    console.info(' success');
                    console.info(` data:${JSON.stringify(res)}`);
                    if (res?.connectionExtraInfo) {
                      let connectionExtraInfo = res?.connectionExtraInfo;

                      ExpectTrue(connectionExtraInfo.redirectCount == 0);
                      httpRequest.destroy();
                      done();
                      console.info(`connectionExtraInfo:${JSON.stringify(res.connectionExtraInfo)}`);
                    } else {
                      httpRequest.destroy();
                      ExpectFail();
                      done();
                    }
                  }).catch((error: BusinessError) => {
                  console.info(`${caseName} request fail, error code: ${error.code}, msg: ${error.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                });
              }
            }
          });
        } catch (err) {
          console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });
  });
}


