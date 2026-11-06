'use static';
/*
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', "expectInfo", `test failed`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', "expectInfo", `test failed`);
  }
}

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

export default function HttpRequestOffTest(): void {
  describe('HttpRequestOffTest', () => {
    let XTS_TEST_HTTP_URL: string = 'https://www.baidu.com/';
    let XTS_TEST_STREAM_HTTPS_URL: string = "https://cn.bing.com/rp/Q5BJPjebyYN5QiqznkcMQmLrF9U.svg";
    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0100
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId === 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} callback header: ${JSON.stringify(header)}`);
                hilog.info(domain, tag, '%{public}s', `${caseName} callback count: ${count}`);
              };
              try {
                httpRequest.onHeadersReceive((header: Object) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} headersReceive header success: ${JSON.stringify(header)}`);
                  ExpectTrue(header != null);
                });

                httpRequest.offHeadersReceive(callback);
                httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                  if (err!.code !== 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    sleep(100).then(() => {
                      hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                      ExpectTrue(count === 1);
                      httpRequest.destroy();
                      done();
                    })
                  }
                });
              } catch (requestErr) {
                console.error(`${caseName} request failed: ${JSON.stringify(requestErr)}`);
                ExpectFail();
                httpRequest.destroy();
                done();
              }
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }

        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0200
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.offHeadersReceive();
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0300
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataReceive((data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              });
              httpRequest.offDataReceive();
              httpRequest.request(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0400
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.onDataReceive(callback);
              httpRequest.offDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0500
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataEnd(() => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} Receive dataEnd`);
              });
              httpRequest.offDataEnd();
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0600
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: () => void = () => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} Receive dataEnd`);
              }
              httpRequest.onDataEnd(callback);
              httpRequest.offDataEnd(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0700
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataReceiveProgress((data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
              });
              httpRequest.offDataReceiveProgress();
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0800
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataReceiveProgressInfo) => void = (data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
              }
              httpRequest.onDataReceiveProgress(callback);
              httpRequest.offDataReceiveProgress(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_0900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_0900
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_0900';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataSendProgress((data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataSendProgress: ${JSON.stringify(data)}`);
              });
              httpRequest.offDataSendProgress();
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1000
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1000
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1000';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataSendProgressInfo) => void = (data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataSendProgress: ${JSON.stringify(data)}`);
              }
              httpRequest.onDataSendProgress(callback);
              httpRequest.offDataSendProgress(callback);
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1400
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.offHeadersReceive(callback);
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1500
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1500';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.offDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1600
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: () => void = () => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} Receive dataEnd`);
              }
              httpRequest.offDataEnd(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1700
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} error：${error}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} data:${data}`);
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataReceiveProgressInfo) => void = (data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
              }
              httpRequest.offDataReceiveProgress(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1800
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataSendProgressInfo) => void = (data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataSendProgress: ${JSON.stringify(data)}`);
              }
              httpRequest.offDataSendProgress(callback);
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 1);
                    httpRequest.destroy();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_1900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_1900
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_1900';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.offHeadersReceive(callback);
              httpRequest.onHeadersReceive(callback);
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 2);
                    httpRequest.destroy();
                    httpRequest.offHeadersReceive();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_2000
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_2000
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_2000';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.offHeadersReceive();
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.request(XTS_TEST_HTTP_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 2);
                    httpRequest.destroy();
                    httpRequest.offHeadersReceive();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_2100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_2100
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_2100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.offDataReceive();
              httpRequest.onDataReceive((data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              });
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 2);
                    httpRequest.destroy();
                    httpRequest.offDataReceive();
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_2200
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_2200
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_2200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.offDataReceive(callback);
              httpRequest.onDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL, (err) => {
                if (err!.code !== 0) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} request err: ${JSON.stringify(err)}`);
                  ExpectFail();
                  httpRequest.destroy();
                  done();
                } else {
                  sleep(100).then(() => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} count: ${count}`);
                    ExpectTrue(count == 2);
                    httpRequest.destroy();
                    httpRequest.offDataReceive();
                    done();
                  }).catch((error) => {
                    hilog.info(domain, tag, '%{public}s', `${caseName} sleep error, error code: ${error!.code}, msg: ${error!.message}`);
                    done();
                  })
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch failed ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3300
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.offHeadersReceive();
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3400
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.onHeadersReceive(callback);
              httpRequest.offHeadersReceive(callback);
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3500
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3500';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataEnd(() => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} Receive dataEnd`);
              });
              httpRequest.offDataEnd();
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3600
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: () => void = () => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} Receive dataEnd`);
              }
              httpRequest.onDataEnd(callback);
              httpRequest.offDataEnd(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3700
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3700';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataReceiveProgress((data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataReceiveProgress: ${JSON.stringify(data)}`);
              });
              httpRequest.offDataReceiveProgress();
              httpRequest.request(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3800
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataReceiveProgressInfo) => void = (data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
              }
              httpRequest.onDataReceiveProgress(callback);
              httpRequest.offDataReceiveProgress(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_3900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_3900
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_3900';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataSendProgress((data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataSendProgress: ${JSON.stringify(data)}`);
              });
              httpRequest.offDataSendProgress();
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4000
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4000
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4000';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataSendProgressInfo) => void = (data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataSendProgress: ${JSON.stringify(data)}`);
              }
              httpRequest.onDataSendProgress(callback);
              httpRequest.offDataSendProgress(callback);
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4400
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4400';
        ;
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.offHeadersReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4500
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4500
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4500';
        ;
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.offDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4600
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4600
     * @tc.desc   Unsubscribe from the HTTP streaming response data reception completion event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: () => void = () => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} Receive dataEnd`);
              }
              httpRequest.offDataEnd(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4700
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4700
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving progress events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4700';
        ;
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataReceiveProgressInfo) => void = (data: http.DataReceiveProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataReceiveProgress:${JSON.stringify(data)}`);
              }
              httpRequest.offDataReceiveProgress(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4800
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4800
     * @tc.desc   Unsubscribe from HTTP network request data sending progress event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4800';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: http.DataSendProgressInfo) => void = (data: http.DataSendProgressInfo) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} dataSendProgress: ${JSON.stringify(data)}`);
              }
              httpRequest.offDataSendProgress(callback);
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_4900
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_4900
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_4900';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (header: Object) => void = (header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              }
              httpRequest.offHeadersReceive(callback);
              httpRequest.onHeadersReceive(callback);
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.offHeadersReceive(callback);
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_5000
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_5000
     * @tc.desc   Unsubscribe from HTTP Response Header event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_5000';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`, error);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.offHeadersReceive();
              httpRequest.onHeadersReceive((header: Object) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s', `${caseName} header: ${JSON.stringify(header)}`);
              });
              httpRequest.request(XTS_TEST_HTTP_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                httpRequest.offHeadersReceive();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_5100
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_5100
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_5100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`, error);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.offDataReceive();
              httpRequest.onDataReceive((data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              });
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_5200
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_5200
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_5200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data!.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`, error?.code);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.offDataReceive(callback);
              httpRequest.onDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 2);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_6300
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_6300
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_6300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} error：${error}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} data:${data}`);
            if (data!.netId === 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              httpRequest.onDataReceive((data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              });
              httpRequest.offDataReceive();
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                await sleep(100);
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err： ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpHttpRequestOff_static_6400
     * @tc.number SUB_NetworkMgr_Http_HttpRequest_Off_6400
     * @tc.desc   Unsubscribe from HTTP streaming response data receiving events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrHttpHttpRequestOff_static_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrHttpHttpRequestOff_static_6400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} error：${error}`);
            hilog.info(domain, tag, '%{public}s', `${caseName} data:${data}`);
            if (data!.netId === 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let count: int = 1;
              const callback: (data: ArrayBuffer) => void = (data: ArrayBuffer) => {
                count = count + 1;
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} dataReceive length: ${JSON.stringify(data.byteLength)}`);
              }
              httpRequest.onDataReceive(callback);
              httpRequest.offDataReceive(callback);
              httpRequest.requestInStream(XTS_TEST_STREAM_HTTPS_URL).then(async () => {
                try {
                  await sleep(100);
                } catch (error) {
                  hilog.info(domain, tag, '%{public}s', `${caseName} sleep error, error code: ${error!.code}, msg: ${error!.message}`);
                }
                hilog.info(domain, tag, '%{public}s', `${caseName} count---${count}`);
                ExpectTrue(count == 1);
                httpRequest.destroy();
                done();
              }).catch((err: Error) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} request fail err : ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} trycatch err： ${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
      });
  });
}