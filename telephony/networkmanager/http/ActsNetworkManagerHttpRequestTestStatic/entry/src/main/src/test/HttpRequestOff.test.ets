/*
 *  Copyright (c) 2024 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium';
import { BusinessError, AsyncCallback } from '@ohos.base';
import hilog from '@ohos.hilog';
import http from '@ohos.net.http';
import connection from '@ohos.net.connection';

class RequestData {
  receiveSize: number = 2000;
  totalSize: number = 2000;
}

class SendData {
  sendSize: number = 2000;
  totalSize: number = 2000;
}

function sleep(time: number): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('ok')
    }, Math.floor(time) as Int)
  });
}

/**
 * @description assert whether the input argument is true
 * @param data
 */
function ExpectTrue(data: Boolean): void {
  try {
    expect(data).assertTrue();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    hilog.info(domain, tag, `expect true catch error, code: ${error.code}, message: ${error.message}`);
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
    hilog.info(domain, tag, `expect fail catch error, code: ${error.code}, message: ${error.message}`);
  }
}

type emptyFunc = () => void;

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function HttpRequestOffTest() {
  describe("HttpRequestOffTest", () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';
    let XTS_TEST_STREAM_HTTPS_URL: string = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0100
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0100
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.offHeadersReceive();
              httpRequest.request(XTS_TEST_HTTP_URL,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  expect(true).assertEqual(count === 1);
                  httpRequest.destroy();
                  done();
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0200
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0200
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0200";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.onDataReceive((data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              });
              httpRequest.offDataReceive();
              httpRequest.request(XTS_TEST_STREAM_HTTPS_URL,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  expect(true).assertEqual(count === 1);
                  httpRequest.destroy();
                  done();
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0300
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0300
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0300";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.onDataReceive(callback);
              httpRequest.offDataReceive(callback);
              const requestInStreamCallback: AsyncCallback<int> =
                (err: BusinessError<void> | null, data: int | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, requestInStreamCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0400
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0400
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0400";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.onDataEnd(() => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} Receive dataEnd`);
              });
              httpRequest.offDataEnd();
              const requestInStreamCallback: AsyncCallback<int> =
                (err: BusinessError<void> | null, data: int | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, requestInStreamCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0500
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0500
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0500";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: () => void = () => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} Receive dataEnd`);
              }
              httpRequest.onDataEnd(callback);
              httpRequest.offDataEnd(callback);
              const requestInStreamCallback: AsyncCallback<int> =
                (err: BusinessError<void> | null, data: int | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, requestInStreamCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0600
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0600
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0600";
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.onDataReceiveProgress((data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceiveProgress:${data}`);
              });
              httpRequest.offDataReceiveProgress();
              const requestInStreamCallback: AsyncCallback<int> =
                (err: BusinessError<void> | null, data: int | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  expect(true).assertEqual(count === 1);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, requestInStreamCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_0700
     * @tc.name   : testNetworkMgrHttpHttpRequestOff_static_0700
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0700";
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: http.DataReceiveProgressInfo) => void = (data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceiveProgress:${data}`);
              }
              httpRequest.onDataReceiveProgress(callback);
              httpRequest.offDataReceiveProgress(callback);
              const requestInStreamCallback: AsyncCallback<int> =
                (err: BusinessError<void> | null, data: int | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  expect(true).assertEqual(count === 1);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, requestInStreamCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0800
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0800
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0800";
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.onDataSendProgress((data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataSendProgress: ${data}`);
              });
              httpRequest.offDataSendProgress();
              const requestCallback: AsyncCallback<http.HttpResponse> =
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  expect(true).assertEqual(count === 1);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.request(XTS_TEST_HTTP_URL, requestCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0900
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0900
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrHttpHttpRequestOff_static_0900";
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          connection.getDefaultNet((err: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: http.DataSendProgressInfo) => void = (data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataSendProgress: ${data}`);
              }
              httpRequest.onDataSendProgress(callback);
              httpRequest.offDataSendProgress(callback);
              const requestCallback: AsyncCallback<http.HttpResponse> =
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  hilog.info(domain, tag, `${caseName} data: ${data}, err: ${err}`);
                  expect(true).assertEqual(count === 1);
                  httpRequest.destroy();
                  done();
                }
              httpRequest.request(XTS_TEST_HTTP_URL, requestCallback);
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1000
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1000
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1000';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.offHeadersReceive(callback);
              httpRequest.request(XTS_TEST_HTTP_URL,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 1);
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1100
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1100
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.offDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL,
                (err: BusinessError<void> | null, data: int | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 1);
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1200
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1200
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: () => void = () => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} Receive dataEnd`);
              }
              httpRequest.offDataEnd(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL,
                (err: BusinessError<void> | null, data: int | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 1);
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number : SUB_NetworkMgr_Http_HttpRequest_Off_1300
     * @tc.name   : testNetworkMgrHttpHttpRequestOff_static_1300
     * @tc.desc   : Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1300';
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, `${caseName} error：${error}`);
            hilog.info(domain, tag, `${caseName} data:${data}`);
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: http.DataReceiveProgressInfo) => void = (data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceiveProgress.receiveSize: ${data.receiveSize}, dataReceiveProgress.totalSize: ${data.totalSize}`);
              };
              httpRequest.offDataReceiveProgress(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL,
                (err: BusinessError<void> | null, data: int | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 1);
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1400
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1400
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1400';
        hilog.info(domain, tag, `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: http.DataSendProgressInfo) => void = (data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataSendProgress.sendSize: ${data.sendSize}, dataSendProgress.totalSize: ${data.totalSize}`);
              };
              httpRequest.offDataSendProgress(callback);
              httpRequest.request(XTS_TEST_HTTP_URL,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 1);
                    httpRequest.destroy();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1500
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1500
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1500';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.offHeadersReceive(callback);
              httpRequest.onHeadersReceive(callback);
              httpRequest.request(XTS_TEST_HTTP_URL,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 2);
                    httpRequest.destroy();
                    httpRequest.offHeadersReceive();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1600
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1600
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.offHeadersReceive();
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.request(XTS_TEST_HTTP_URL,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} request data: ${JSON.stringify(data)}`);
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 2);
                    httpRequest.destroy();
                    httpRequest.offHeadersReceive();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1700
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1700
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_2100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.offDataReceive();
              httpRequest.onDataReceive((data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceive : ${JSON.stringify(data)}`);
                hilog.info(domain, tag, `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              });
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL,
                (err: BusinessError<void> | null, data: int | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 2);
                    httpRequest.destroy();
                    httpRequest.offDataReceive();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1800
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1800
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.offDataReceive(callback);
              httpRequest.onDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL,
                (err: BusinessError<void> | null, data: int | undefined) => {
                  if (err?.code !== 0) {
                    hilog.error(domain, tag, `${caseName} request err: ${JSON.stringify(err)}`);
                    expect().assertFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, `${caseName} count: ${count}`);
                    expect(true).assertEqual(count === 2);
                    httpRequest.destroy();
                    httpRequest.offDataReceive();
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch failed ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });

    /**
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1900
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1900
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it("testNetworkMgrHttpHttpRequestOff_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId === 0) {
              hilog.info(domain, tag, `${caseName} Please connect to the network`);
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: number = 1;
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.offHeadersReceive();
              httpRequest.request(XTS_TEST_HTTP_URL).then(() => {
                hilog.info(domain, tag, `${caseName} count---${count}`);
                expect(true).assertEqual(count === 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.error(domain, tag, `${caseName} request fail err : ${JSON.stringify(err)}`);
                expect().assertFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.error(domain, tag, `${caseName} trycatch err: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName}---End`);
      });



  });
}