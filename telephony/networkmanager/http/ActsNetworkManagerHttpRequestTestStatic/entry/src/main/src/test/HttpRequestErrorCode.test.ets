import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";

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


        /* *
         * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0100
         * @tc.name  :  testHttpRequestMethodErrorCode_static_0100
         * @tc.desc  :  test http request(url, callback) with request error code 2300003
         * @tc.size  :  MEDIUMTEST
         * @tc.type  :  Function
         * @tc.level :  level 3
         */
        it("testHttpRequestMethodErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if(err?.code != 0){
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300003);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }else{
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
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
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0200
         * @tc.name  :  testHttpRequestMethodErrorCode_static_0200
         * @tc.desc  :  test http request(url, options, callback) with request error code 2300003
         * @tc.size  :  MEDIUMTEST
         * @tc.type  :  Function
         * @tc.level :  level 3
         */
        it("testHttpRequestMethodErrorCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');

                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if(err?.code != 0){
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300003);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }else{
                                hilog.info(domain, tag, '%{public}s', caseName +': HttpResponse ->'+JSON.stringify(data));
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
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0300
         * @tc.name  :  testHttpRequestMethodErrorCode_static_0300
         * @tc.desc  :  test http request(url, options, Promise) with request error code 2300003
         * @tc.size  :  MEDIUMTEST
         * @tc.type  :  Function
         * @tc.level :  level 3
         */
        it("testHttpRequestMethodErrorCode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'test03testHttpRequestMethodErrorCode_static_030000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
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
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300003);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        });
                    }
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })




         /* *
         * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0700
         * @tc.name  :  testHttpRequestMethodErrorCode_static_0700
         * @tc.desc  :  test http request(url, callback) with request error code 2300001
         * @tc.size  :  smallTest
         * @tc.type  :  Function
         * @tc.level :  level 3
         */
        it("testHttpRequestMethodErrorCode_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('ws://baidu.com', (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if(err?.code != 0){
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300001);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }else{
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
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
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
           * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0800
           * @tc.name  :  testHttpRequestMethodErrorCode_static_0800
           * @tc.desc  :  test http request(url, options, callback) with request error code 2300001
           * @tc.size  :  MEDIUMTEST
           * @tc.type  :  Function
           * @tc.level :  level 3
           */
        it("testHttpRequestMethodErrorCode_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpRequestMethodErrorCode_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +' Please connect to the network');
                        ExpectFail();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('ws://baidu.com', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                           if(err?.code != 0){
                               hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                               ExpectTrue(err?.code == 2300001);
                               httpRequest.destroy();
                               hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                               done();
                           }else{
                               hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
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
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /**
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_0900
         * @tc.name   testHttpRequestMethodErrorCode_static_0900
         * @tc.desc   test http request(url, options, Promise) with request error code 2300001
         * @tc.size   MEDIUMTEST
         * @tc.type   Function
         * @tc.level  level 3
         */
        it("testHttpRequestMethodErrorCode_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodErrorCode_static_0900";
            hilog.info(domain, tag, `${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectTrue(false);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let promise = httpRequest.request('ws://baidu.com', {
                            method: http.RequestMethod.GET,
                        });
                        promise.then((data:http.HttpResponse) => {
                            hilog.info(domain, tag, 'Result:' + data.result);
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, 'error:' + JSON.stringify(err));
                            ExpectTrue(err?.code == 2300001);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName} test End`);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1700
         * @tc.name   testHttpRequestMethodErrorCode_static_1700
         * @tc.desc   test http request(url, options, callback) with request error code 2300007
         * @tc.size   smallTest
         * @tc.type   Function
         * @tc.level  level 3
         */
        it("testHttpRequestMethodErrorCode_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodErrorCode_static_1700";
            hilog.info(domain, tag, `${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectTrue(false);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequest = http.createHttp();
                        httpRequest.request('127.0.0.1', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
                            hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                            ExpectTrue(err?.code == 2300007);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName} test End`);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1800
         * @tc.name   testHttpRequestMethodErrorCode_static_1800
         * @tc.desc   test http request(url, options, Promise) with request error code 2300007
         * @tc.size   smallTest
         * @tc.type   Function
         * @tc.level  level 3
         */
        it("testHttpRequestMethodErrorCode_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodErrorCode_static_1800";
            hilog.info(domain, tag, `${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectTrue(false);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let promise = httpRequest.request('127.0.0.1', {
                            method: http.RequestMethod.GET,
                        });
                        promise.then((data:http.HttpResponse) => {
                            hilog.info(domain, tag, 'Result:' + data.result);
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, 'error:' + JSON.stringify(err));
                            ExpectTrue(err?.code == 2300007);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName} test End`);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3400
         * @tc.name   testHttpRequestMethod_ErrorCode_3400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it("testHttpRequestMethod_ErrorCode_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = 'testHttpRequestMethod_ErrorCode_3400';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectTrue(false);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let remoteValidation_system :http.RemoteValidation = 'system'

                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 9999,
                            resumeTo: 333,
                            remoteValidation: remoteValidation_system,
                            tlsOptions: tlsOptions_config_01
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectTrue(false);
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3500
         * @tc.name   testHttpRequestMethodErrorCode_static_3500
         * @tc.desc   test http request(url, options, callback) with request error code 2300060
         * @tc.size   smallTest
         * @tc.type   Function
         * @tc.level  level 3
         */
        it("testHttpRequestMethodErrorCode_static_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodErrorCode_static_3500";
            hilog.info(domain, tag, `${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectTrue(false);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('https://hao123.com', {method: http.RequestMethod.POST}, (err: BusinessError<void>|null, data: http.HttpResponse|undefined) => {
                            hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                            ExpectTrue(err?.code == 2300060);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName} test End`);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_RequestMethod_ErrorCode_3600
         * @tc.name   testHttpRequestMethodErrorCode_static_3600
         * @tc.desc   test http request(url, options, Promise) with request error code 2300060
         * @tc.size   smallTest
         * @tc.type   Function
         * @tc.level  level 3
         */
        it("testHttpRequestMethodErrorCode_static_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName: string = "testHttpRequestMethodErrorCode_static_3600";
            hilog.info(domain, tag, `${caseName} test Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectTrue(false);
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let promise = httpRequest.request('https://hao123.com', {
                            method: http.RequestMethod.GET,
                        });
                        promise.then((data:http.HttpResponse) => {
                            hilog.info(domain, tag, 'Result:' + data.result);
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, 'error:' + JSON.stringify(err));
                            ExpectTrue(err?.code == 2300060);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName} test End`);
        });

   /**
     * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1300
     * @tc.name  :  testHttpRequestMethodErrorCode_static_1300
     * @tc.desc  :  test http request(url, options, Promise) with request error code 2300005
     * @tc.size  :  MEDIUMTEST
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it("testHttpRequestMethodErrorCode_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestMethodErrorCode_static_1300";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            hilog.info(domain, tag, `${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let ExclusionList = "";
            let array = ExclusionList.split(',');
            let httpProxy: http.HttpProxy = {
              host: "host",
              port: 1,
              exclusionList: array
            };
            let promise = httpRequest.request('https://www.baidu.com', {
              usingProxy: httpProxy,
            });
            promise.then((data:http.HttpResponse) => {
              hilog.info(domain, tag, 'Result:' + data.result);
            }).catch((error: Error) => {
              let err = error as BusinessError;
              hilog.info(domain, tag, 'error:' + JSON.stringify(err));
              ExpectTrue(err?.code == 2300005);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      hilog.info(domain, tag, `${caseName} test End`);
    });

    /**
     * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1400
     * @tc.name  :  testHttpRequestMethodErrorCode1400
     * @tc.desc  :  test http requestInStream(url, options, callback) with request error code 2300005
     * @tc.size  :  MEDIUMTEST
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testHttpRequestMethodErrorCode1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestMethodErrorCode1400";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let ExclusionList = "";
            let array = ExclusionList.split(',');
            let httpProxy: http.HttpProxy = {
              host: "host",
              port: 1,
              exclusionList: array
            };
            httpRequest.requestInStream('https://www.baidu.com',  {usingProxy: httpProxy,}, (err: BusinessError<void> | null, data: Int | undefined) => {
              console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
              ExpectTrue(err?.code == 2300005);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number:  SUB_NetworkMgr_Http_RequestMethod_ErrorCode_1500
     * @tc.name  :  testHttpRequestMethodErrorCode1500
     * @tc.desc  :  test http requestInStream(url, options, Promise) with request error code 2300005
     * @tc.size  :  MEDIUMTEST
     * @tc.type  :  Function
     * @tc.level :  level 3
     */
    it('testHttpRequestMethodErrorCode1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testHttpRequestMethodErrorCode1500";
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (data?.netId == 0) {
            console.info(`${caseName} Please connect to the network`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} Network connected`);
            let httpRequest: http.HttpRequest = http.createHttp();
            let ExclusionList = "";
            let array = ExclusionList.split(',');
            let httpProxy: http.HttpProxy = {
              host: "host",
              port: 1,
              exclusionList: array
            };
            let promise = httpRequest.requestInStream('https://www.baidu.com', {usingProxy: httpProxy});
            promise.then((data) => {
              console.info('Result:' + data);
            }).catch((error: Error) => {
              let err = error as BusinessError;
              console.info('error:' + JSON.stringify(err));
              ExpectTrue(err?.code == 2300005);
              httpRequest.destroy();
              done();
            });
          }
        });
      } catch (err) {
        console.info(`${caseName} trycatch err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test End`);
    });


    })

}