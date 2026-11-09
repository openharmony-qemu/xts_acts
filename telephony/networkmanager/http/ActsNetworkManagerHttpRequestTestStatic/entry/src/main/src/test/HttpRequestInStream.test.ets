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
import { BusinessError } from "@ohos.base";
import http from "@ohos.net.http";
import { describe, expect, it, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import connection from "@ohos.net.connection";
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const ADDR_TEST_ILLEGAL: string = "abc";
export const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.org/anything";

const ExpectFail = () => {
    try {
        expect().assertFail();
    }
    catch (err) {
        console.info(`exportFail failed err: ${JSON.stringify(err)}`);
    }
};
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    }
    catch (err) {
        console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
    }
};
export default function HttpRequestInStreamTest(): void {
    describe("HttpRequestInStreamTest", () => {
        /**
         * @tc.name   testNetworkMgrHttpRequestInStream_static_0100
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0100
         * @tc.desc   test requestInStream
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpRequestInStream_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testNetworkMgrHttpRequestInStream_static_0100";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            let httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS,
                                (err: BusinessError<void> | null, data: int | undefined) => {
                                    if (err?.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} requestInStream fail err: ${JSON.stringify(data)}`);
                                        ExpectFail();
                                        httpRequest.destroy();
                                        done();
                                    } else {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} requestInStream success ${JSON.stringify(data)}`);
                                        ExpectTrue(data == 200);
                                        httpRequest.destroy();
                                        done();
                                    }
                                });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0200
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0200
         * @tc.desc   test requestInStream with destory httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0200";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            let httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS,
                                (err: BusinessError<void> | null, data: int | undefined) => {
                                    if (err?.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} destory httpRequest and requestStream fail err:${err}`);
                                        ExpectFail();
                                        httpRequest.destroy();
                                        done();
                                    } else {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} destory httpRequest and requestStream success ${data}`);
                                        ExpectTrue(data == 200);
                                        httpRequest.destroy();
                                        done();
                                    }
                                });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testNetworkMgrHttpRequestInStream_static_0300
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0300
         * @tc.desc   test requestInStream
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNetworkMgrHttpRequestInStream_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testNetworkMgrHttpRequestInStream_static_0300";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            let httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: int) => {
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                ExpectTrue(data == 200);
                                httpRequest.destroy();
                                done();
                            }).catch((err) => {
                                const error = err as BusinessError;
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(error)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0400
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0400
         * @tc.desc   test requestInStream with destroy httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0400";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                let httpRequest: http.HttpRequest = http.createHttp();
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            httpRequest.destroy();
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: int) => {
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }).catch((err) => {
                                const error = err as BusinessError;
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(error)}`);
                                ExpectTrue(error.code == 2300999);
                                httpRequest.destroy();
                                done();
                            });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0500
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0500
         * @tc.desc   test requestInStream
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0500";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                let httpRequest: http.HttpRequest = http.createHttp();
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            httpRequest.onHeadersReceive(() => {
                                httpRequest.destroy();
                            });
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS).then((data: int) => {
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                ExpectTrue(data == 200);
                                done();
                            }).catch((err) => {
                                const error = err as BusinessError;
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(error)}`);
                                ExpectFail();
                                done();
                            });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0600
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0600
         * @tc.desc   test requestInStream with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0600";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            let httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.requestInStream(ADDR_TEST_ILLEGAL,
                                (err: BusinessError<void> | null, data: int | undefined) => {
                                    if (err?.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName}  requestInStream fail err ${JSON.stringify(err)}`);
                                        ExpectTrue(err?.code === 2300006);
                                        httpRequest.destroy();
                                        done();
                                    } else {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName}  requestInStream success ${JSON.stringify(err)}`);
                                        ExpectFail();
                                        httpRequest.destroy();
                                        done();
                                    }
                                });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0700
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0700
         * @tc.desc   test requestInStream with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0700";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            let httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.requestInStream(ADDR_TEST_ILLEGAL,
                                (err: BusinessError<void> | null, data: int | undefined) => {
                                    if (err?.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName}  requestInStream fail err ${JSON.stringify(err)}`);
                                        ExpectTrue(err?.code === 2300006);
                                        httpRequest.destroy();
                                        done();
                                    } else {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName}  requestInStream success ${JSON.stringify(err)}`);
                                        ExpectFail();
                                        httpRequest.destroy();
                                        done();
                                    }
                                });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0800
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0800
         * @tc.desc   test requestInStream with illegal url
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0800";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId == 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            let httpRequest: http.HttpRequest = http.createHttp();
                            httpRequest.requestInStream(ADDR_TEST_ILLEGAL).then((data: int) => {
                                hilog.info(domain, tag, '%{public}s', 'Result:' + data);
                                ExpectFail();
                                httpRequest.destroy();
                                done();
                            }).catch((err) => {
                                const error = err as BusinessError;
                                hilog.info(domain, tag, '%{public}s', 'error:' + JSON.stringify(error));
                                ExpectTrue(error.code == 2300006);
                                httpRequest.destroy();
                                done();
                            });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectTrue(false);
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_0900
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_0900
         * @tc.desc   test requestInStream with destroy httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_0900";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

                let httpRequest: http.HttpRequest = http.createHttp();

                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId === 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            httpRequest.destroy();
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS,
                                (err: BusinessError<void> | null, data: int | undefined) => {
                                    if (err?.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                                        ExpectTrue(err?.code === 2300999);
                                    } else {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                        ExpectFail();
                                    }
                                    httpRequest.destroy();
                                    done();
                                });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testHttpRequestInStream_static_1000
         * @tc.number SUB_NetworkMgr_Http_RequestInStream_1000
         * @tc.desc   test requestInStream with destroy httpRequest
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testHttpRequestInStream_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                const caseName: string = "testHttpRequestInStream_static_1000";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                let httpRequest: http.HttpRequest = http.createHttp();
                try {
                    connection.getDefaultNet((error: BusinessError<void> | null,
                        data: connection.NetHandle | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} error -> ${JSON.stringify(error)}`);
                        if (data!.netId === 0) {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
                            ExpectFail();
                            done();
                        } else {
                            hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
                            httpRequest.destroy();
                            httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, {},
                                (err: BusinessError<void> | null, data: int | undefined) => {
                                    if (err?.code !== 0) {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} RequestInStream work true all progress fail err ${JSON.stringify(err)}`);
                                        ExpectTrue(err?.code === 2300999);
                                    } else {
                                        hilog.info(domain, tag, '%{public}s',
                                            `${caseName} RequestInStream work true all progress success data ${JSON.stringify(data)}`);
                                        ExpectFail();
                                    }
                                    httpRequest.destroy();
                                    done();
                                });
                        }
                    });
                } catch (err) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }

                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
    });
}
