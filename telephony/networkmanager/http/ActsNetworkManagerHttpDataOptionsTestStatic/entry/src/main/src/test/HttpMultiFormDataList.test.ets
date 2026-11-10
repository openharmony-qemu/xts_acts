'use static'
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';
import http from '@ohos.net.http';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ADDR_TEST_DOMAIN_HTTPS: string = "https://httpbin.moyufangge.com/anything";
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

let httpRequestOptions_string1: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" } as Record<string, string>,
  multiFormDataList: [],
};
let httpRequestOptions_string2: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" } as Record<string, string>,
  multiFormDataList: [
    {
      name: "",
      remoteFileName: "xtsRemoteTest",
      contentType: "image/png",
      data: "pic.png",
    },
  ],
};
let httpRequestOptions_string3: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" } as Record<string, string>,
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "xtsRemoteTest",
      contentType: "",
      data: "pic.png",
    },
  ],
};
let httpRequestOptions_string4: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" } as Record<string, string>,
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "",
      contentType: "image/png",
      data: "pic.png",
    },
  ],
};
let httpRequestOptions_string5: http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" } as Record<string, string>,
  multiFormDataList: [
    {
      name: "Part1",
      remoteFileName: "xtsRemoteTest",
      contentType: "image/png",
      data: "",
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


export default function httpMultiFormDataListTest(): void {

  describe("HttpMultiFormDataListTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testHttpMultiFormDataList_static_0100
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0100
     * @tc.desc   test multiFormDataList with contentType(text/plain) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + ' httpRequest fail, get error is ' + JSON.stringify(err));
                    ExpectFail();
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + 'httpRequest success  : data ->' + JSON.stringify(data));
                    ExpectTrue(data?.responseCode == 200);
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0200
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0200
     * @tc.desc   test multiFormDataList with contentType(text/plain) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string
              ).then((res: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s',
                  caseName + ' httpRequest success : data ->' + JSON.stringify(res));
                ExpectTrue(res.responseCode == 200);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s',
                  caseName + 'httpRequest fail, get error is ' + JSON.stringify(err));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0300
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0300
     * @tc.desc   test multiFormDataList with contentType(image/png) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0300';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_image,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', caseName + '  httpRequest fail:  ' + JSON.stringify(err));
                    ExpectFail();
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + 'httpRequest success  : data ->' + JSON.stringify(data));
                    ExpectTrue(data?.responseCode == 200);
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0400
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0400
     * @tc.desc   test multiFormDataList with contentType(text/plain) no data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
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
                hilog.info(domain, tag, '%{public}s', caseName + 'httpRequest success: data ->' + JSON.stringify(res));
                ExpectTrue(res.responseCode == 200);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + ' httpRequest fail err  ' + JSON.stringify(err));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0500
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0500
     * @tc.desc   test multiFormDataList with no data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0500';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                {
                  method: http.RequestMethod.POST,
                  header: {
                    "Content-type": "multipart/form-data",
                  } as Record<string, string>,
                  multiFormDataList: [
                    {
                      name: "multiTest",
                      remoteFileName: "xtsRemoteTest",
                      contentType: "text/plain",
                    },
                  ],
                }, (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                if (err?.code != 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                  ExpectFail();
                  httpRequest.destroy();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + 'httpRequest success: data ->' + JSON.stringify(data));
                  ExpectTrue(data?.responseCode == 200);
                  httpRequest.destroy();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0600
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0600
     * @tc.desc   test multiFormDataList with no data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0600';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                } as Record<string, string>,
                multiFormDataList: [
                  {
                    name: "multiTest",
                    remoteFileName: "xtsRemoteTest",
                    contentType: "text/plain",
                  },
                ],
              }).then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + 'httpRequest success: data ->' + JSON.stringify(data));
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  httpRequest fail err ' + JSON.stringify(err));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0700
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0700
     * @tc.desc   test multiFormDataList with  filePath and data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0700';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                {
                  method: http.RequestMethod.POST,
                  header: {
                    "Content-type": "multipart/form-data",
                  } as Record<string, string>,
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
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + ' httpRequest fail, get error is ' + JSON.stringify(err));
                    ExpectFail();
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + 'httpRequest success : data ->' + JSON.stringify(data));
                    ExpectTrue(data?.responseCode == 200);
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0800
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0800
     * @tc.desc   test multiFormDataList with  filePath and data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0800';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                } as Record<string, string>,
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
                hilog.info(domain, tag, '%{public}s',
                  caseName + 'httpRequest success : data ->' + JSON.stringify(data));
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              })
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_0900
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_0900
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_0900';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                {
                  method: http.RequestMethod.POST,
                  header: {
                    "Content-type": "multipart/form-data",
                  } as Record<string, string>,
                  multiFormDataList: [
                    {
                      name: "multiTest",
                      remoteFileName: "xtsRemoteTest",
                      contentType: "image/png",
                      filePath: "../../resources/base/media/icon.png",
                    },
                  ],
                }, (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                if (err?.code != 0) {
                  hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                  ExpectTrue(err?.code == 2300026);
                  httpRequest.destroy();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                } else {
                  hilog.info(domain, tag, '%{public}s',
                    caseName + 'httpRequest success: data ->' + JSON.stringify(data));
                  ExpectFail();
                  httpRequest.destroy();
                  hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                  done();
                }
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_1000
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1000
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_1000';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(ADDR_TEST_DOMAIN_HTTPS, {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                } as Record<string, string>,
                multiFormDataList: [
                  {
                    name: "multiTest",
                    remoteFileName: "xtsRemoteTest",
                    contentType: "image/png",
                    filePath: "../../resources/base/media/icon.png",
                  },
                ],
              }).then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + 'httpRequest success: data ->' + JSON.stringify(data));
                ExpectFail();
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done()
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                ExpectTrue(err.code == 2300026);
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done()
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_1100
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1100
     * @tc.desc   test multiFormDataList with contentType(text/plain) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_1100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.POST,
                header: { "Content-type": "multipart/form-data" } as Record<string, string>,
                multiFormDataList: [],
              };
              httpRequest.request(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_noParm,
                (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + ' httpRequest fail, get error is ' + JSON.stringify(err));
                    ExpectFail();
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      caseName + 'httpRequest success  : data ->' + JSON.stringify(data));
                    ExpectTrue(data?.responseCode == 200);
                    httpRequest.destroy();
                    hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                    done();
                  }
                });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_1500
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1500
     * @tc.desc   test multiFormDataList with contentType(text/plain) hasData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testHttpMultiFormDataList_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_1500';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', caseName + ' Please connect to the network');
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ' Network connected ');
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions_noParm: http.HttpRequestOptions = {
                method: http.RequestMethod.POST,
                header: { "Content-type": "multipart/form-data" } as Record<string, string>,
                multiFormDataList: [],
              };
              let promise = httpRequest.request('http://baidu.com', httpRequestOptions_noParm);
              promise.then((data: http.HttpResponse) => {
                hilog.info(domain, tag, '%{public}s', caseName + ': HttpResponse ->' + JSON.stringify(data));
                ExpectTrue(data != null);
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                httpRequest.destroy();
                done();
              }).catch((error: Error) => {
                let err = error as BusinessError;
                hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' + JSON.stringify(err));
                httpRequest.destroy();
                hilog.info(domain, tag, '%{public}s', caseName + '---test end');
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' + JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      })

    /**
     * @tc.name   testHttpMultiFormDataList_static_1300
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1300
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_1300";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string1,
                (err: BusinessError<void> | null, data: int | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest success ${data}`);
                    ExpectTrue(data == 200);
                    httpRequest.destroy();
                    done();
                  }
                }
              );
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
     * @tc.name   testHttpMultiFormDataList_static_1400
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1400
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpMultiFormDataList_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testHttpMultiFormDataList_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string1)
                .then((responseCode: int) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} httpRequest success responseCode: ${responseCode}`);
                  ExpectTrue(responseCode == 200);
                  httpRequest.destroy();
                  done();
                })
                .catch((err) => {
                  hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList_static_1600
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1600
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_1600";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string)
                .then((responseCode: int) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                  ExpectTrue(responseCode === 200);
                  httpRequest.destroy();
                  done();
                }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail:${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList_static_1700
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1700
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_1700";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string2,
                (err: BusinessError<void> | null, streamId: int | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest success, streamId: ${streamId}`);
                    ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList_static_1800
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1800
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_1800";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string2)
                .then((responseCode: int) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                  ExpectTrue(responseCode === 200);
                  httpRequest.destroy();
                  done();
                }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail:${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList_static_1900
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_1900
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_1900";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string3,
                (err: BusinessError<void> | null, streamId: int | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest success, streamId: ${streamId}`);
                    ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList_static_2000
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2000
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2000";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string3)
                .then((responseCode: int) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                  ExpectTrue(responseCode === 200);
                  httpRequest.destroy();
                  done();
                }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail:${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList_static_2100
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2100
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2100";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string4,
                (err: BusinessError<void> | null, streamId: int | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest success, streamId: ${streamId}`);
                    ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList_static_2200
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2200
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2200";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string4)
                .then((responseCode: int) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                  ExpectTrue(responseCode === 200);
                  httpRequest.destroy();
                  done();
                }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail:${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList_static_2300
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2300
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2300";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions_string5,
                (err: BusinessError<void> | null, streamId: int | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest success, streamId: ${streamId}`);
                    ExpectTrue(true);
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
     * @tc.name   testHttpMultiFormDataList_static_2400
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2400
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2400";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);

        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS, httpRequestOptions_string5)
                .then((responseCode: int) => {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} httpRequest requestInStream success, responseCode: ${responseCode}`);
                  ExpectTrue(responseCode === 200);
                  httpRequest.destroy();
                  done();
                }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail:${JSON.stringify(err)}`);
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
     * @tc.name   testHttpMultiFormDataList_static_2700
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2700
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2700";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              let httpRequestOptions: http.HttpRequestOptions = {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                } as Record<string, string>,
                multiFormDataList: [
                  {
                    name: "multiTest",
                    remoteFileName: "xtsRemoteTest",
                    contentType: "text/plain",
                    data: "xtsTest",
                    filePath: "",
                  },
                ]
              }
              httpRequest.requestInStream(
                ADDR_TEST_DOMAIN_HTTPS,
                httpRequestOptions,
                (err: BusinessError | null, responseCode: int | undefined) => {
                  if (err?.code != 0) {
                    hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail ${JSON.stringify(err)}`);
                    ExpectFail();
                    httpRequest.destroy();
                    done();
                  } else {
                    hilog.info(domain, tag, '%{public}s',
                      `${caseName} httpRequest success, responseCode: ${responseCode}`);
                    ExpectTrue((responseCode as int) == 200);
                    httpRequest.destroy();
                    done();
                  }
                }
              );
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
     * @tc.name   testHttpMultiFormDataList_static_2800
     * @tc.number SUB_NetworkMgr_Http_MultiFormDataList_2800
     * @tc.desc   test multiFormDataList with  filePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpMultiFormDataList_static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testHttpMultiFormDataList_static_2800";
        hilog.info(domain, tag, '%{public}s', `${caseName} test Start`);
        let httpRequest: http.HttpRequest = http.createHttp();
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
            if (data?.netId == 0) {
              hilog.info(domain, tag, '%{public}s', `${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} Network connected`);
              let httpRequestOptions: http.HttpRequestOptions = {
                method: http.RequestMethod.POST,
                header: {
                  "Content-type": "multipart/form-data",
                } as Record<string, string>,
                multiFormDataList: [
                  {
                    name: "multiTest",
                    remoteFileName: "xtsRemoteTest",
                    contentType: "text/plain",
                    data: "xtsTest",
                    filePath: "",
                  },
                ]
              };
              httpRequest.requestInStream(ADDR_TEST_DOMAIN_HTTPS,).then((responseCode: int) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest success, responseCode: ${responseCode}`);
                ExpectTrue(responseCode == 200);
                httpRequest.destroy();
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s', `${caseName} httpRequest fail err ${JSON.stringify(err)}`);
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
  })
}
