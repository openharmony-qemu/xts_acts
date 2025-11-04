import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ADDR_TEST_DOMAIN_HTTPS: string = "https://www.baidu.com/";
let httpRequestOptions_string: http.HttpRequestOptions = {
    method: http.RequestMethod.POST,
    header: { "Content-type": "multipart/form-data" } as Record<string,string>,
    multiFormDataList: [
        {
            name: "Part1",
            remoteFileName: "xtsRemoteTest",
            contentType: "string",
            data: "textyyyy",
        },
    ],
};
let httpRequestOptions_image: http.HttpRequestOptions = {
    method: http.RequestMethod.POST,
    header: { "Content-type": "multipart/form-data" } as Record<string,string>,
    multiFormDataList: [
        {
            name: "Part1",
            remoteFileName: "xtsRemoteTest",
            contentType: "image/png",
            data: "pic.png",
        },
    ],
};

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


export default function httpMultiFormDataListTest() {

    describe("HttpMultiFormDataListTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0100
         * @tc.name  : testHttpMultiFormDataList_static_0100
         * @tc.desc  : test multiFormDataList with contentType(text/plain) hasData
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0100';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            httpRequestOptions_string,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail, get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success  : data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0200
         * @tc.name  : testHttpMultiFormDataList_static_0200
         * @tc.desc  : test multiFormDataList with contentType(text/plain) hasData
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0200';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            httpRequestOptions_string
                        ).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest success : data ->'+JSON.stringify(res));
                            ExpectTrue(res.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest fail, get error is '+JSON.stringify(err));
                            ExpectFail();
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

        /**
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0300
         * @tc.name  : testHttpMultiFormDataList_static_0300
         * @tc.desc  : test multiFormDataList with contentType(image/png) hasData
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0300';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            httpRequestOptions_image,
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail:  '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success  : data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0400
         * @tc.name  : testHttpMultiFormDataList_static_0400
         * @tc.desc  : test multiFormDataList with contentType(text/plain) no data
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0400';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            multiFormDataList: [
                                {
                                    name: "multiTest",
                                    remoteFileName: "xtsRemoteTest",
                                    contentType: "text/plain",
                                },
                            ],
                        }).then((res: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(res));
                            ExpectTrue(res.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail err  '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        })
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0500
         * @tc.name  : testHttpMultiFormDataList_static_0500
         * @tc.desc  : test multiFormDataList with no data
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0500';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.POST,
                                header: {
                                    "Content-type": "multipart/form-data",
                                } as Record<string,string>,
                                multiFormDataList: [
                                    {
                                        name: "multiTest",
                                        remoteFileName: "xtsRemoteTest",
                                        contentType: "text/plain",
                                    },
                                ],
                            }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectFail();
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(data));
                                ExpectTrue(data?.responseCode == 200);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            }
                        })
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0600
         * @tc.name  : testHttpMultiFormDataList_static_0600
         * @tc.desc  : test multiFormDataList with no data
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0600';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            header: {
                                "Content-type": "multipart/form-data",
                            } as Record<string,string>,
                            multiFormDataList: [
                                {
                                    name: "multiTest",
                                    remoteFileName: "xtsRemoteTest",
                                    contentType: "text/plain",
                                },
                            ],
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(data));
                            ExpectTrue(data.responseCode == 200);
                            httpRequest.destroy();
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  httpRequest fail err '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        })
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0700
         * @tc.name  : testHttpMultiFormDataList_static_0700
         * @tc.desc  : test multiFormDataList with  filePath and data
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0700';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.POST,
                                header: {
                                    "Content-type": "multipart/form-data",
                                }as Record<string,string>,
                                multiFormDataList: [
                                    {
                                        name: "multiTest",
                                        contentType: "text/plain",
                                        remoteFileName: "xtsRemoteTest",
                                        data: "xtsTest",
                                        filePath: "../../resources//base//media/icon.png",
                                    },
                                ],
                            },
                            (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                                if (err?.code != 0) {
                                    hilog.info(domain, tag, '%{public}s', caseName +' httpRequest fail, get error is '+JSON.stringify(err));
                                    ExpectFail();
                                    httpRequest.destroy();
                                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                    done();
                                } else {
                                    hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success : data ->'+JSON.stringify(data));
                                    ExpectTrue(data?.responseCode == 200);
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0800
         * @tc.name  : testHttpMultiFormDataList_static_0800
         * @tc.desc  : test multiFormDataList with  filePath and data
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0800';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            header: {
                                "Content-type": "multipart/form-data",
                            } as Record<string,string>,
                            multiFormDataList: [
                                {
                                    name: "multiTest",
                                    remoteFileName: "xtsRemoteTest",
                                    contentType: "text/plain",
                                    data: "xtsTest",
                                    filePath: "../../resources//base//media/icon.png",
                                },
                            ],
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success : data ->'+JSON.stringify(data));
                            ExpectTrue(data.responseCode == 200);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done();
                        })
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_0900
         * @tc.name  : testHttpMultiFormDataList_static_0900
         * @tc.desc  : test multiFormDataList with  filePath
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_0900';
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
                        httpRequest.request(
                            ADDR_TEST_DOMAIN_HTTPS,
                            {
                                method: http.RequestMethod.POST,
                                header: {
                                    "Content-type": "multipart/form-data",
                                } as Record<string,string>,
                                multiFormDataList: [
                                    {
                                        name: "multiTest",
                                        remoteFileName: "xtsRemoteTest",
                                        contentType: "image/png",
                                        filePath: "../../resources/base/media/icon.png",
                                    },
                                ],
                            }, (err: BusinessError<void>|null, data: http.HttpResponse| undefined) => {
                            if (err?.code != 0) {
                                hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                                ExpectTrue(err?.code==2300026);
                                httpRequest.destroy();
                                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(data));
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
         * @tc.number: SUB_NetworkMgr_Http_MultiFormDataList_1000
         * @tc.name  : testHttpMultiFormDataList_static_1000
         * @tc.desc  : test multiFormDataList with  filePath
         * @tc.size  : smallTest
         * @tc.type  : Function
         * @tc.level : level 2
         */
        it("testHttpMultiFormDataList_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testHttpMultiFormDataList_static_1000';
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
                        httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                            method: http.RequestMethod.POST,
                            header: {
                                "Content-type": "multipart/form-data",
                            } as Record<string,string>,
                            multiFormDataList: [
                                {
                                    name: "multiTest",
                                    remoteFileName: "xtsRemoteTest",
                                    contentType: "image/png",
                                    filePath: "../../resources/base/media/icon.png",
                                },
                            ],
                        }).then((data: http.HttpResponse) => {
                            hilog.info(domain, tag, '%{public}s', caseName +'httpRequest success: data ->'+JSON.stringify(data));
                            ExpectFail();
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done()
                        }).catch((error: Error) => {
                            let err = error as BusinessError;
                            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                            ExpectTrue(err.code==2300026);
                            httpRequest.destroy();
                            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                            done()
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

    })

}