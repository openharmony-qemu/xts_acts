'use static';
/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import http from '@ohos.net.http';
import { describe, expect, it, TestType, Size, Level, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok');
    }, time)
  });
}

let httpRequestOptions: http.HttpRequestOptions = {
  method: http.RequestMethod.GET,
  header: "content-type': 'application/json",
  readTimeout: 60000,
  connectTimeout: 60000
};

let Address_Baidu = "https://www.baidu.com/";
let isONEventDataReceive = 0;
let isONEventDataReceiveProgress = 0;
let isONEventDataEnd = 0;

function dataReceive_on_callback(data: ArrayBuffer) {
  isONEventDataReceive += 1;
  hilog.info(domain, tag, '%{public}s', " dataReceive_on_callback receive len:" + JSON.stringify(data.byteLength));
}

function dataEnd_on_callback() {
  isONEventDataEnd += 1;
  hilog.info(domain, tag, '%{public}s', " dataEnd_on_callback callback function");
}

function dataReceiveProgress_on_callback(data: http.DataReceiveProgressInfo) {
  isONEventDataReceiveProgress += 1;
  hilog.info(domain, tag, '%{public}s', "dataReceiveProgress_on_callback receive data: " + JSON.stringify(data));
  let receiveSize = data.receiveSize;
  let totalSize = data.totalSize;
  hilog.info(domain, tag, '%{public}s', "dataReceiveProgress_on_callback receiveSize: " + JSON.stringify(receiveSize) +
    " , dataReceiveProgress_on_callback totalSize: " + JSON.stringify(totalSize));
}

export default function HttpRequestInStreamTest(): void {
  describe("HttpRequestInStreamTest", () => {
    beforeEach(async (done: () => void): Promise<void> => {
      isONEventDataReceive = 0;
      isONEventDataReceiveProgress = 0;
      isONEventDataEnd = 0;
      done();
    })

    /**
     * @tc.name   testTelephonyhttpHttpRequestrequestInStream_static_0100
     * @tc.number SUB_Telephony_http_HttpRequest_requestInStream_0100
     * @tc.desc   Test requestInStream(url: string, callback: AsyncCallback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyhttpHttpRequestrequestInStream_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyhttpHttpRequestrequestInStream_static_0100";
        let Address_Img =
          "https://img1.baidu.com/it/u=3010094603,1247181326&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";
        let httpRequest = http.createHttp();
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          httpRequest.onDataReceive(dataReceive_on_callback);
          httpRequest.onDataReceiveProgress(dataReceiveProgress_on_callback);
          httpRequest.onDataEnd(dataEnd_on_callback);
          httpRequest.requestInStream(Address_Img, httpRequestOptions,
            (error: BusinessError | null, data: int | undefined) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} get error is ` + JSON.stringify(error) + " data is " + JSON.stringify(data));
              if (error?.code !== 0) {
                hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(error));
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                done();
              } else {
                httpRequest.offDataReceive();
                httpRequest.offDataReceiveProgress();
                httpRequest.offDataEnd();
                httpRequest.destroy();
                sleep(200).then(() => {
                  ExpectTrue(data == 200 && isONEventDataReceive != 0 && isONEventDataReceiveProgress != 0 &&
                    isONEventDataEnd != 0);
                  hilog.info(domain, tag, '%{public}s', `${caseName}---isONEventDataReceive: `, isONEventDataReceive,
                    "isONEventDataReceiveProgress: ", isONEventDataReceiveProgress, "isONEventDataEnd: ",
                    isONEventDataEnd)
                  done();
                  hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                });
              }
            })
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamondataReceive_static_0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataReceive_0100
     * @tc.desc   Test on(type: "dataReceive", callback: Callback<ArrayBuffer>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamondataReceive_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamondataReceive_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataReceive(dataReceive_on_callback);
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataReceive: ` + isONEventDataReceive + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataReceive > 0);
              httpRequest.offDataReceive();
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceive_static_0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0100
     * @tc.desc   Test off(type: "dataReceive", callback: Callback<ArrayBuffer>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceive_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceive_static_0100";
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataReceive(dataReceive_on_callback);
          httpRequest.offDataReceive(dataReceive_on_callback);
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataReceive: ` + isONEventDataReceive + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataReceive == 0);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceive_static_0200
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceive_0200
     * @tc.desc   Test off(type: "dataReceive"): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceive_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceive_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataReceive(dataReceive_on_callback);
          httpRequest.offDataReceive();
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataReceive: ` + isONEventDataReceive + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataReceive == 0);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamondataReceiveProgress_static_0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataReceiveProgress_0100
     * @tc.desc   Test on(type: "dataReceiveProgress", callback: Callback<{ receiveSize: number, totalSize: number }>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamondataReceiveProgress_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamondataReceiveProgress_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          let httpRequest = http.createHttp();
          let Address_Img =
            "https://img1.baidu.com/it/u=3010094603,1247181326&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";
          httpRequest.onDataReceiveProgress(dataReceiveProgress_on_callback);
          // httpRequest.requestInStream(Address_Baidu).then((data) => {
          httpRequest.requestInStream(Address_Img).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataReceiveProgress: ` + isONEventDataReceiveProgress + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataReceiveProgress > 0);
              httpRequest.offDataReceiveProgress();
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress_static_0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0100
     * @tc.desc   Test off(type: "dataReceiveProgress", callback: Callback<{ receiveSize: number, totalSize: number }>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataReceiveProgress(dataReceiveProgress_on_callback);
          httpRequest.offDataReceiveProgress(dataReceiveProgress_on_callback);
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataReceiveProgress: ` + isONEventDataReceiveProgress + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataReceiveProgress == 0);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress_static_0200
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataReceiveProgress_0200
     * @tc.desc   Test off(type: "dataReceiveProgress"): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamoffdataReceiveProgress_static_0200";
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataReceiveProgress(dataReceiveProgress_on_callback);
          httpRequest.offDataReceiveProgress();
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataReceiveProgress: ` + isONEventDataReceiveProgress + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataReceiveProgress == 0);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamondataEnd_static_0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_on_dataEnd_0100
     * @tc.desc   Test on(type: "dataEnd", callback: Callback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamondataEnd_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamondataEnd_static_0100";
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataEnd(dataEnd_on_callback);
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataEnd is ` + isONEventDataEnd + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataEnd > 0);
              httpRequest.offDataEnd(dataEnd_on_callback);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            done();
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataEnd_static_0100
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0100
     * @tc.desc   Test off(type: "dataEnd", callback?: Callback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataEnd_static_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamoffdataEnd_static_0100";
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataEnd(dataEnd_on_callback);
          httpRequest.offDataEnd(dataEnd_on_callback);
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataEnd is ` + isONEventDataEnd + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataEnd == 0);
              httpRequest.offDataEnd(dataEnd_on_callback);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + " : error = " + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetStackHttprequestInStreamoffdataEnd_static_0200
     * @tc.number SUB_Telephony_NetStack_HttprequestInStream_off_dataEnd_0200
     * @tc.desc   Test off(type: "dataEnd"): void;.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyNetStackHttprequestInStreamoffdataEnd_static_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyNetStackHttprequestInStreamoffdataEnd_static_0200";
        try {
          let httpRequest = http.createHttp();
          httpRequest.onDataEnd(dataEnd_on_callback);
          httpRequest.offDataEnd();
          httpRequest.requestInStream(Address_Baidu).then((data) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} isONEventDataEnd is ` + isONEventDataEnd + ' data: ' + data);
            sleep(200).then(() => {
              ExpectTrue(data == 200 && isONEventDataEnd == 0);
              httpRequest.offDataEnd(dataEnd_on_callback);
              httpRequest.destroy();
              hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
              done();
            });
          }).catch((err: Error) => {
            hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(err));
            ExpectFail();
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', caseName + " : error = " + JSON.stringify(error));
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testTelephonyhttpHttpRequestrequestInStream_static_0200
     * @tc.number SUB_Telephony_http_HttpRequest_requestInStream_0200
     * @tc.desc   Test requestInStream(url: string, callback: AsyncCallback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyhttpHttpRequestrequestInStream_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyhttpHttpRequestrequestInStream_static_0200";
        let Address_Img =
          "https://img1.baidu.com/it/u=3010094603,1247181326&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";
        let httpRequest = http.createHttp();
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          httpRequest.onDataReceive(dataReceive_on_callback);
          try {
            httpRequest.onDataReceiveProgress((data: http.DataReceiveProgressInfo) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} dataReceiveProgress DataSendProgressInfo success:" + ${JSON.stringify(data)}`);
              ExpectTrue(data.totalSize != null);
              ExpectTrue(data.receiveSize != null);
            });
            httpRequest.onDataEnd(dataEnd_on_callback);
            httpRequest.requestInStream(Address_Img, httpRequestOptions,
              (error: BusinessError | null, data: int | undefined) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} get error is ` + JSON.stringify(error) + " data is " + JSON.stringify(data));
                if (error?.code !== 0) {
                  hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                  done();
                } else {
                  httpRequest.offDataReceive();
                  httpRequest.offDataReceiveProgress();
                  httpRequest.offDataEnd();
                  httpRequest.destroy();
                  sleep(200).then(() => {
                    done();
                    hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                  });
                }
              });
          } catch (error) {
            hilog.error(domain, tag, `${caseName} catch err is ` + JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          }
        } catch (outerError) {
          hilog.error(domain, tag, `${caseName} outerError: ` + JSON.stringify(outerError));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyhttpHttpRequestrequestInStream_static_0300
     * @tc.number SUB_Telephony_http_HttpRequest_requestInStream_0300
     * @tc.desc   Test requestInStream(url: string, callback: AsyncCallback<void>): void.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyhttpHttpRequestrequestInStream_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "testTelephonyhttpHttpRequestrequestInStream_static_0300";
        let Address_Img =
          "https://img1.baidu.com/it/u=3010094603,1247181326&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";
        let httpRequest = http.createHttp();
        hilog.info(domain, tag, '%{public}s', `${caseName}---start`);
        try {
          try {
            httpRequest.onDataReceive((data: ArrayBuffer) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} dataReceive DataSendProgressInfo success: ${JSON.stringify(data.byteLength)}`);
              ExpectTrue(data.byteLength != null);
            });
            httpRequest.onDataReceiveProgress(dataReceiveProgress_on_callback);
            httpRequest.onDataEnd(dataEnd_on_callback);
            httpRequest.requestInStream(Address_Img, httpRequestOptions,
              (error: BusinessError | null, data: int | undefined) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} get error is ` + JSON.stringify(error) + " data is " + JSON.stringify(data));
                if (error?.code !== 0) {
                  hilog.error(domain, tag, `${caseName} get err is ` + JSON.stringify(error));
                  ExpectFail();
                  hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                  done();
                } else {
                  httpRequest.offDataReceive();
                  httpRequest.offDataReceiveProgress();
                  httpRequest.offDataEnd();
                  httpRequest.destroy();
                  setTimeout(() => {
                    done();
                    hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
                  }, 200)
                  sleep(200).then(() => {
                    done();
                  }).catch((error) => {
                    hilog.error(domain, tag, `${caseName} sleep error, error code: ${error!.code}, msg: ${error!.message}`);
                    done();
                  });
                }
              });
          } catch (error) {
            hilog.error(domain, tag, `${caseName} inner catch err is ` + JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
            done();
          }
        } catch (error) {
          hilog.error(domain, tag, `${caseName} outer catch err is ` + JSON.stringify(error));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---end`);
          done();
        }
      });
  });
}