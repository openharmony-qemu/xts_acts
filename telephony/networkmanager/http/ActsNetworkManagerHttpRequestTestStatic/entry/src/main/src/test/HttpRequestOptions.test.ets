import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
let XTS_TEST_HTTPS_URL: string = 'https://www.baidu.com/';

type keys = 'letter' | 'characters';

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err) {
        err = err as BusinessError;
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err) {
        err = err as BusinessError;
        console.info("expectInfo", `test sucess`);
    }
}


export default function httpRequestOptionsTest() {

    describe("HttpRequestOptionsTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0100
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0100
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: {
                                "letter": "test",
                                "characters": "测试文字",
                            }as Record<keys,string>,
                            header: {"content-type": "application/json"}as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0200
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0200
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: {"content-type": "application/x-www-form-urlencoded"} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0300
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0300
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: {"content-type" : "text/xml"}as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0400
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0400
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: {
                                "letter": "test",
                                "characters": "测试文字",
                            }as Record<keys,string>,
                            header: {"content-type": "application/json"} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0500
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0500
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: {"content-type": "application/x-www-form-urlencoded"} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0600
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0600
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: 'testInformation测试',
                            header: {"content-type": "text/xml"} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0700
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0700
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            extraData: ''
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_0800
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_0800
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingCache: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                console.info(`${caseName} firstResponse err ---${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                                httpResponseCache.flush((err: BusinessError<void>|null) => {
                                    if (err?.code != 0) {
                                        console.info(`${caseName} flush err ---${JSON.stringify(err)}`);
                                        ExpectFail();
                                        httpRequest.destroy();
                                        done();
                                    } else {
                                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                            if (err?.code != 0) {
                                                console.info(`${caseName} secondResponse err ---${JSON.stringify(err)}`);
                                                ExpectFail();
                                                httpRequest.destroy();
                                                done();
                                            } else {
                                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                                ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                                                httpRequest.destroy();
                                                done();
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1000
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1000
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingCache: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
                        httpRequest.request('http://httpbin.org/anything', httpRequestOptions).then((data: http.HttpResponse) => {
                            console.info(`${caseName} firstResponse performanceTiming ${JSON.stringify(data?.performanceTiming)}`);
                            httpResponseCache.flush((err: BusinessError<void>|null) => {
                                if (err?.code != 0) {
                                    console.info(`${caseName} flush err ---${JSON.stringify(err)}`);
                                    ExpectFail();
                                    done();
                                } else {
                                    httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                        if (err?.code != 0) {
                                            console.info(`${caseName} secondResponse err ---${JSON.stringify(err)}`);
                                            ExpectFail();
                                            done();
                                        } else {
                                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                            ExpectTrue(data?.performanceTiming.tcpTiming == 0);
                                            httpRequest.destroy();
                                            done();
                                        }
                                    });
                                }
                            });
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1200
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1200
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1300
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1300
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1000
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1400
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1400
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1001
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });



        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1600
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1600
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1700
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1700
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1000
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_1800
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_1800
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 1001
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2300
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_2300
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: false
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2400
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_2400
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2500
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_2500
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: false
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_2600
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_2600
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            usingProxy: true
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  request fail error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3500
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_3500
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: {"":""} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3600
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_3600
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: {"xts-test": "xts/test"} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3700
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_3700
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3700';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3800
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_3800
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: {"":""} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_3900
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_3900
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3900';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: {"xts-test": "xts/test"} as Record<string,string>
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4000
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4000
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4000';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            header: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4100
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4100
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                    ExpectTrue(err?.code == 2300028);
                                    httpRequest.destroy();
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    done();
                                }
                            });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4200
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4200
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            connectTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code == 2300028);
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4300
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4300
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4300';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectFail();
                            done();
                        }).catch((error: Error) => { let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300028);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4400
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4400
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            connectTimeout: 1
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectFail();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err?.code == 2300028);
                            httpRequest.destroy();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4500
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4500
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4500';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 0,
                            connectTimeout: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number : SUB_NetworkMgr_Http_HttpRequestOptionsTest_4600
         * @tc.name   : testNetworkMgrHttpHttpRequestOptionsTest_static_4600
         * @tc.desc   : Test HttpRequestOptions property.
         * @tc.level  : Level 3
         * @tc.type   : Function
         * @tc.size   : MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4600';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  Please connect to the network ');
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +' Network connected ');
                        let httpRequestOptions: http.HttpRequestOptions = {
                            readTimeout: 0,
                            connectTimeout: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName +'  trycatch err is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });


        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4700
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4700
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4700';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            caPath: '/xts/test/cacert.pem'
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4900
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4900
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4900';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            caPath: '/xts/test/cacert.pem'
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_5200
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_5200
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_5200';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 4294967299 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_5600
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_5600
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_5600';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 4294967299 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_6000
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_6000
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_6000';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeTo: 4294967299 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_6400
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_6400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_6400';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeTo: 4294967299 as int,
                            addressFamily: http.AddressFamily.ONLY_V6
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        })
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2700
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2700
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2700';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            dnsOverHttps: 'https://dns.xtstest.com/dns-query'
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2800
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2800
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2800';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            dnsOverHttps: 'https://dns.xtstest.com/dns-query'
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3300
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3300';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            dnsServers: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3400
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3400
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3400';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            dnsServers: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2000
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2000
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2000';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            maxLimit: 999999999999 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2200
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2200
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2200';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            maxLimit: 999999999999 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_6800
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_6800
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_6800';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 9999,
                            resumeTo: 333,
                            addressFamily: http.AddressFamily.DEFAULT
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

 

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsPromiseTestTest_3300
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsPromiseTest_static_3300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsPromiseTest_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsPromiseTest_static_3300';
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
                        let tlsOptions_config_02 : http.TlsOptions = tlsConfigPram02
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 9999,
                            resumeTo: 333,
                            remoteValidation: remoteValidation_system,
                            tlsOptions: tlsOptions_config_02
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3200
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3200
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3200';
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
                        let serverAuthentication: http.ServerAuthentication ={
                            credential: {
                                username: "proxy-username",
                                password: "proxy-password"
                            },
                            authenticationType: "basic"
                        }
                        let tlsOptions_system : http.TlsOptions = 'system'
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 9999,
                            resumeTo: 333,
                            remoteValidation: remoteValidation_system,
                            tlsOptions: tlsOptions_system,
                            serverAuthentication:serverAuthentication
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request('https://www.baidu.com', httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectTrue(false);
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1100
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1100
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1100';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 0.5 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_1500
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_1500
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_1500';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            priority: 0.5 as int
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((err: Error) => {
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_2900
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_2900
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_2900';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            dnsOverHttps: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_3000
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_3000
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_3000';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            dnsOverHttps: undefined
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_4800
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_4800
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_4800';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            caPath: ' '
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_5000
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_5000
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_5000';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            caPath: ' '
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTPS_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_5300
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_5300
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_5300';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_5700
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_5700
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_5700';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeFrom: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_6100
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_6100
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_6100';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeTo: 0
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, `${caseName} err:--- ${JSON.stringify(err)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            } else {
                                hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });

        /**
         * @tc.number SUB_NetworkMgr_Http_HttpRequestOptionsTest_6500
         * @tc.name   testNetworkMgrHttpHttpRequestOptionsTest_static_6500
         * @tc.desc   Test HttpRequestOptions property.
         * @tc.level  Level 3
         * @tc.type   Function
         * @tc.size   MediumTest
         */
        it('testNetworkMgrHttpHttpRequestOptionsTest_static_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const caseName: string = 'testNetworkMgrHttpHttpRequestOptionsTest_static_6500';
            hilog.info(domain, tag, `${caseName}---Start`);
            try {
                connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
                    if (data?.netId == 0) {
                        hilog.info(domain, tag, `${caseName} Please connect to the network`);
                        ExpectFail();
                        done();
                    } else {
                        hilog.info(domain, tag, `${caseName} Network connected`);
                        let httpRequestOptions: http.HttpRequestOptions = {
                            method: http.RequestMethod.GET,
                            resumeTo: 0,
                            addressFamily: http.AddressFamily.ONLY_V4
                        }
                        let httpRequest: http.HttpRequest = http.createHttp();
                        httpRequest.request(XTS_TEST_HTTP_URL, httpRequestOptions).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, `${caseName} data:--- ${JSON.stringify(data)}`);
                            ExpectTrue(data?.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)} code:---${JSON.stringify(err?.code)}`);
                            ExpectFail();
                            done();
                        });
                    }
                });
            } catch (error) {
                let err = error as  BusinessError;
                hilog.info(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName}---End `);
        });


    })

}