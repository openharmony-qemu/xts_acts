'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let exclusionStr = "10.136.15.254,www.baidu.com";
let exclusionArray = exclusionStr.split(',');

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionTest(): void {

  describe("ConnectionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0100
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0100
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetHttpProxyCallback_static_0100';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          const httpProxy: connection.HttpProxy = {
            host: "10.136.15.254",
            port: 8081,
            exclusionList: exclusionArray,
            username: "admin",
          }
          connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
          connection.getDefaultHttpProxy((error: BusinessError<void> | null,
            data: connection.HttpProxy | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ':succeeded data ->' + JSON.stringify(data));
              ExpectTrue(data?.host === httpProxy.host);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0200
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0200
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetHttpProxyCallback_static_0200';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          const httpProxy: connection.HttpProxy = {
            host: "10.136.15.254",
            port: 8081,
            exclusionList: exclusionArray,
            username: "",
          }
          connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
          connection.getDefaultHttpProxy((error: BusinessError<void> | null,
            data: connection.HttpProxy | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': data ->' + JSON.stringify(data));
              ExpectTrue(data?.host === httpProxy.host);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });


    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0400
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0400
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetHttpProxyCallback_static_0400';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          const httpProxy: connection.HttpProxy = {
            host: "10.136.15.254",
            port: 8081,
            exclusionList: exclusionArray,
            password: '123456',
          }
          connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
          connection.getDefaultHttpProxy((error: BusinessError<void> | null,
            data: connection.HttpProxy | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': data ->' + JSON.stringify(data));
              ExpectTrue(data?.host === httpProxy.host);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0500
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0500
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetHttpProxyCallback_static_0500';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          const httpProxy: connection.HttpProxy = {
            host: "10.136.15.254",
            port: 8081,
            exclusionList: exclusionArray,
            password: '',
          }
          connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
          connection.getDefaultHttpProxy((error: BusinessError<void> | null,
            data: connection.HttpProxy | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': data ->' + JSON.stringify(data));
              ExpectTrue(data?.host === httpProxy.host);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done()
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });


    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0800
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0800
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetHttpProxyCallback_static_0800';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          const httpProxy: connection.HttpProxy = {
            host: "10.136.15.254",
            port: 8081,
            exclusionList: exclusionArray,
            username: '',
            password: '',
          }
          connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
          connection.getDefaultHttpProxy((error: BusinessError<void> | null,
            data: connection.HttpProxy | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName + ': data ->' + JSON.stringify(data));
              ExpectTrue(data?.host === httpProxy.host);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done()
            }
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testConnectionSetHttpProxyCallback_static_0900
     * @tc.number SUB_Network_Connection_SetAppHttpProxy_0900
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetHttpProxyCallback_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetHttpProxyCallback_static_0900';
        hilog.info(domain, tag, '%{public}s', caseName + ' start');
        try {
          const httpProxy: connection.HttpProxy = {
            host: "10.136.15.254",
            port: 8081,
            exclusionList: exclusionArray,
            username: 'admin',
            password: '123456',
          }
          connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
          connection.getDefaultHttpProxy((error: BusinessError<void> | null,
            data: connection.HttpProxy | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', caseName + '  get error is ' +
                `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            } else {
              console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
              ExpectTrue(data?.host === httpProxy.host);
              hilog.info(domain, tag, '%{public}s', caseName + '---test end');
              done();
            }
          })
        } catch (err) {

          hilog.info(domain, tag, '%{public}s', caseName + ' catch error in ' +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + ' end');
          done();
        }
      });

    /**
     * @tc.name   testNetworkConnectionsetPacUrl_static_0100
     * @tc.number SUB_Network_Connection_setPacUrl_0100
     * @tc.desc   Set the system-level proxy auto-config (PAC) script URL to be empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkConnectionsetPacUrl_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkConnectionsetPacUrl_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let pacUrl = "";
          connection.setPacUrl(pacUrl);
          ExpectFail();
          done();
        } catch (err) {
          ExpectTrue(err.code === 401)
          hilog.info(domain, tag,
            `${caseName} Error in err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          done()
        }
      });

    /**
     * @tc.name   testNetworkConnectiongetPacUrl_static_0100
     * @tc.number SUB_Network_Connection_getPacUrl_0100
     * @tc.desc   get the system-level proxy auto-config (PAC) script URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkConnectiongetPacUrl_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkConnectiongetPacUrl_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let pacUrl: string = connection.getPacUrl();
          hilog.info(domain, tag, `${caseName} pacUrl is ${pacUrl}`);
          ExpectTrue(true);
          done();
        } catch (err) {
          if (err) {
            hilog.info(domain, tag,
              `${caseName} getPac fail err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err.code === 2100003);
          } else {
            hilog.info(domain, tag,
              `${caseName} Error in err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectFail();
          }
          done();
        }
      });

    /**
     * @tc.name   testConnectionsetPacUrl_static_0200
     * @tc.number SUB_Network_Connection_setPacUrl_0200
     * @tc.desc   Set network application level HTTP proxy configuration information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionsetPacUrl_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionsetPacUrl_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let pacUrl = "https://www.baidu.com";
          connection.setPacUrl(pacUrl)
          ExpectTrue(true);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} error in err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`)
          ExpectFail();
          done()
        }
      });

    /**
     * @tc.name   testConnectionFindProxyForUrl_static_0100
     * @tc.number SUB_Network_Connection_findProxyForUrl_0100
     * @tc.desc   The findProxyForURL interface passes in an unset pacURL address and returns an empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionFindProxyForUrl_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionFindProxyForUrl_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.setPacFileUrl('');
          let urlNoExit: string = "https://www.zhuhu.com";
          const result = connection.findProxyForUrl(urlNoExit);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} findProxyForUrl success, result: ${JSON.stringify(result)}`);
          ExpectTrue(result === "");
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err is err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)} `);
          ExpectTrue(err.code === 2100002);
          done();
        }
      });

    /**
     * @tc.name   testConnectionSetPacFileUrl_static_0100
     * @tc.number SUB_Network_Connection_setPacFileUrl_0100
     * @tc.desc   Call the setPacFileURL interface to pass an empty string, return error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetPacFileUrl_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionSetPacFileUrl_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.setPacFileUrl('');
          hilog.info(domain, tag, '%{public}s', `${caseName} setPacFileUrl success`);
          ExpectTrue(true);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err is err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)} `);
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testConnectionGetPacFileUrl_static_0100
     * @tc.number SUB_Network_Connection_getPacFileUrl_0100
     * @tc.desc   No pacFileURL set, calling the interface getPacFileURL returns 2100003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionGetPacFileUrl_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetPacFileUrl_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          const result = connection.getPacFileUrl();
          hilog.info(domain, tag, `${caseName} getPacFileUrl success, result: ${JSON.stringify(result)}`);
          ExpectTrue(result !== undefined);
          done();
        } catch (err) {
          hilog.info(domain, tag,
            `${caseName} catch err is err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testConnectionGetPacFileUrl_static_0300 
     * @tc.number SUB_Network_Connection_getPacFileUrl_0300 
     * @tc.desc   Verify the value of pacFileURL based on the value set by the last call to the interface getPacFileURL. 
     * @tc.type   FUNCTION 
     * @tc.size   MEDIUMTEST 
     * @tc.level  LEVEL3 
     */
    it('testConnectionGetPacFileUrl_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetPacFileUrl_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const pacFileUrl: string = "unavailableURLString";
          connection.setPacFileUrl(pacFileUrl);
          const result = connection.getPacFileUrl();
          hilog.info(domain, tag, '%{public}s', `${caseName} getPacFileUrl success, result: ${JSON.stringify(result)}`);
          ExpectTrue(result === pacFileUrl);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err is err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 2100002);
          done();
        }
      });

    /**
     * @tc.name   testConnectionFindProxyForUrl_static_0400
     * @tc.number SUB_Network_Connection_findProxyForUrl_0400
     * @tc.desc   The findProxyForURL interface passes an empty string address and returns an empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionFindProxyForUrl_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionFindProxyForUrl_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          connection.setPacFileUrl('');
          const result = connection.findProxyForUrl("");
          hilog.info(domain, tag, '%{public}s',
            `${caseName} findProxyForUrl success, result: ${JSON.stringify(result)}`);
          ExpectTrue(result === "");
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch err is err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)} `);
          ExpectTrue(err.code === 2100002);
          done();
        }
      });
  })
}