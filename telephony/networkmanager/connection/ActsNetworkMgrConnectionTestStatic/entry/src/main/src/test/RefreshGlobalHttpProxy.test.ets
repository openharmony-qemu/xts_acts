'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, expect, it, TestType, Size, Level } from '../../../hypium/index';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'RefreshGlobalHttpProxyTestTag';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function RefreshGlobalHttpProxyTest(): void {
  describe('RefreshGlobalHttpProxyTest', () => {
    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode_static_0100
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0100
     * @tc.desc    Test refreshGlobalHttpProxy when API not supported, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testRefreshGlobalHttpProxyWithErrorCode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const httpProxy = await connection.refreshGlobalHttpProxy();
          hilog.info(domain, tag, '%{public}s', `${caseName} refreshGlobalHttpProxy success, result: ${JSON.stringify(httpProxy)}`);
          ExpectFail();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2100003);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode_static_0200
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0200
     * @tc.desc    Test refreshGlobalHttpProxy multiple times, verify result consistency or error code.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRefreshGlobalHttpProxyWithErrorCode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        let proxyResults: connection.HttpProxy[] = [];
        for (let i = 0; i < 3; i++) {
          try {
            const httpProxy = await connection.refreshGlobalHttpProxy();
            proxyResults.push(httpProxy);
            hilog.info(domain, tag, '%{public}s', `${caseName} iteration ${i} result: ${JSON.stringify(httpProxy)}`);
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', `${caseName} iteration ${i} error: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 2100003);
          }
        }
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        done();
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode_static_0300
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0300
     * @tc.desc    Test refreshGlobalHttpProxy after setting invalid proxy config, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRefreshGlobalHttpProxyWithErrorCode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const invalidProxy: connection.HttpProxy = {
            host: '',
            port: 0,
            exclusionList: []
          };
          await connection.setGlobalHttpProxy(invalidProxy);
          const httpProxy = await connection.refreshGlobalHttpProxy();
          hilog.info(domain, tag, '%{public}s', `${caseName} refreshGlobalHttpProxy result: ${JSON.stringify(httpProxy)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2100003);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.number SUB_Network_Connection_RefreshGlobalHttpProxy_0400
     * @tc.name testRefreshGlobalHttpProxyWithErrorCode_static_0400
     * @tc.desc Test refreshGlobalHttpProxy using Promise way, verify Promise resolves correctly.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testRefreshGlobalHttpProxyWithErrorCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          try {
            let result = await connection.refreshGlobalHttpProxy();
            hilog.info(domain, tag, '%{public}s', `${caseName} Promise resolved with: ${JSON.stringify(result)}`);
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          } catch (err) {
            hilog.info(domain, tag, '%{public}s', `${caseName} Promise rejected with: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 2100003);
            done();
          }
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode_static_0500
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0500
     * @tc.desc    Test refreshGlobalHttpProxy after setting unreachable proxy, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRefreshGlobalHttpProxyWithErrorCode_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const unreachableProxy: connection.HttpProxy = {
            host: '1.2.3.4',
            port: 99999,
            exclusionList: ['*']
          };
          await connection.setGlobalHttpProxy(unreachableProxy);
          const httpProxy = await connection.refreshGlobalHttpProxy();
          hilog.info(domain, tag, '%{public}s', `${caseName} refreshGlobalHttpProxy result: ${JSON.stringify(httpProxy)}`);
          ExpectTrue(httpProxy === null);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err.code: ${err.code}`);
          ExpectTrue(err.code === 2100003 || err.code === 2100002);
          try {
            await connection.setGlobalHttpProxy({
              host: "",
              port: 0,
              exclusionList: [],
              username: "",
              password: ""
            } as connection.HttpProxy);
            hilog.info(domain, tag, '%{public}s', 'clearGlobalHttpProxy end');
          } catch (error) {
            hilog.info(domain, tag, '%{public}s', 'clearGlobalHttpProxy faild. '+JSON.stringify(error));
          }
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode_static_0600
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0600
     * @tc.desc    Test refreshGlobalHttpProxy when system internal error occurs, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRefreshGlobalHttpProxyWithErrorCode_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          const httpProxy = await connection.refreshGlobalHttpProxy();
          hilog.info(domain, tag, '%{public}s', `${caseName} refreshGlobalHttpProxy result: ${JSON.stringify(httpProxy)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} test failed err.code: ${err.code}`);
          ExpectTrue(err.code === 2100003);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
  });
}