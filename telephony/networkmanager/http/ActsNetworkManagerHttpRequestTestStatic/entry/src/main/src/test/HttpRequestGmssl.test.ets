'use static'
import { describe, expect, it, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import http from "@ohos.net.http";
import { BusinessError } from "@ohos.base";
import fs from "@ohos.file.fs";
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

const TLS_TARGET_URL: string = 'https://www.baidu.com';

export default function HttpRequestGmssl(): void {
    describe('HttpRequestGmssl', () => {
        /**
         * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions_static_0800
         * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0800
         * @tc.desc   test performanceTiming
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testNetworkMgrHttpRequestGmsslHttpRequestOptions_static_0800',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions_static_0800";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

                let clientCert: http.ClientCert = {
                    certPath: '',
                    keyPath: '',
                    certType: http.CertType.PEM,
                    keyPassword: ''
                };
                let clientEncCert: http.ClientCert = {
                    certPath: '',
                    keyPath: '',
                    certType: http.CertType.PEM,
                    keyPassword: ''
                };
                // let sslType: http.SslType = 'TLS';
                let options: http.HttpRequestOptions = {
                    // sslType,
                    // caPath: '',
                    clientCert,
                    // clientEncCert,
                };
                try {
                    let httpRequest: http.HttpRequest = http.createHttp();
                    httpRequest.requestInStream(TLS_TARGET_URL, options,
                        (err: BusinessError | null, responseCode: int | undefined) => {
                            if (err) {
                                hilog.info(domain, tag, '%{public}s',
                                    `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                                httpRequest.destroy();
                                ExpectFail();
                                done();
                            } else {
                                hilog.info(domain, tag, '%{public}s', `${caseName} responseCode: ${responseCode}`);
                                ExpectTrue(responseCode === 200);
                                httpRequest.destroy();
                                done();
                            }
                        });
                } catch (error) {
                    const err: BusinessError = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }

                hilog.info(domain, tag, '%{public}s', `${caseName} test End`);
            });
        /**
         * @tc.name   testNetworkMgrHttpRequestGmsslHttpRequestOptions_static_0900
         * @tc.number SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0900
         * @tc.desc   test performanceTiming
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testNetworkMgrHttpRequestGmsslHttpRequestOptions_static_0900',
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
                const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions_static_0900";
                hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
                let clientCert: http.ClientCert = {
                    certPath: '',
                    keyPath: '',
                    certType: http.CertType.PEM,
                    keyPassword: ''
                };
                let clientEncCert: http.ClientCert = {
                    certPath: '',
                    keyPath: '',
                    certType: http.CertType.PEM,
                    keyPassword: ''
                };
                // let sslType: http.SslType = 'TLS';
                let options: http.HttpRequestOptions = {
                    // sslType,
                    // caPath: '',
                    clientCert,
                    // clientEncCert,
                };
                try {
                    let httpRequest: http.HttpRequest = http.createHttp();
                    httpRequest.requestInStream(TLS_TARGET_URL, options)
                        .then((responseCode: int | undefined) => {
                            hilog.info(domain, tag, '%{public}s', `${caseName} responseCode: ${responseCode}`);
                            ExpectTrue(responseCode === 200);
                            httpRequest.destroy();
                            done();
                        })
                        .catch((err) => {
                            const error = err as BusinessError;
                            hilog.info(domain, tag, '%{public}s', `${caseName} catch ERROR: ${JSON.stringify(error)}`);
                            ExpectFail();
                            httpRequest.destroy();
                            done();
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
