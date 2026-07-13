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
import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';

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

export default function RefreshGlobalHttpProxyTest() {
  describe('RefreshGlobalHttpProxyTest', () => {
    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode0100
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0100
     * @tc.desc    Test refreshGlobalHttpProxy when API not supported, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testRefreshGlobalHttpProxyWithErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode0100';
        console.info(`${caseName}---Start`);
        try {
          const httpProxy = await connection.refreshGlobalHttpProxy();
          console.info(`${caseName} refreshGlobalHttpProxy success, result: ${JSON.stringify(httpProxy)}`);
          ExpectFail();
          done();
        } catch (err) {
          console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2100003);
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode0200
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0200
     * @tc.desc    Test refreshGlobalHttpProxy multiple times, verify result consistency or error code.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRefreshGlobalHttpProxyWithErrorCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode0200';
        console.info(`${caseName}---Start`);
        try {
          let proxyResults: connection.HttpProxy[] = [];
          for (let i = 0; i < 3; i++) {
            try {
              const httpProxy = await connection.refreshGlobalHttpProxy();
              proxyResults.push(httpProxy);
              console.info(`${caseName} iteration ${i} result: ${JSON.stringify(httpProxy)}`);
            } catch (err) {
              console.info(`${caseName} iteration ${i} error: ${JSON.stringify(err)}`);
              ExpectTrue(err.code === 2100003);
            }
          }
          console.info(`${caseName}---End`);
          done();
        } catch (err) {
          console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode0300
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0300
     * @tc.desc    Test refreshGlobalHttpProxy after setting invalid proxy config, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testRefreshGlobalHttpProxyWithErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode0300';
        console.info(`${caseName}---Start`);
        try {
          const invalidProxy: connection.HttpProxy = {
            host: '',
            port: 0,
            exclusionList: []
          };
          await connection.setGlobalHttpProxy(invalidProxy);
          const httpProxy = await connection.refreshGlobalHttpProxy();
          console.info(`${caseName} refreshGlobalHttpProxy result: ${JSON.stringify(httpProxy)}`);
          console.info(`${caseName}---End`);
          done();
        } catch (err) {
          console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 2100003);
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.number SUB_Network_Connection_RefreshGlobalHttpProxy_0400
     * @tc.name testRefreshGlobalHttpProxyWithErrorCode0400
     * @tc.desc Test refreshGlobalHttpProxy using Promise way, verify Promise resolves correctly.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testRefreshGlobalHttpProxyWithErrorCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode0400';
        console.info(`${caseName}---Start`);
        try {
          connection.refreshGlobalHttpProxy()
            .then((result: connection.HttpProxy | null) => {
              console.info(`${caseName} Promise resolved with: ${JSON.stringify(result)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            })
            .catch((err: BusinessError) => {
              console.info(`${caseName} Promise rejected with: ${JSON.stringify(err)}`);
              ExpectTrue(err.code === 2100003);
              done();
            });
          console.info(`${caseName}---End`);
        } catch (err) {
          console.info(`${caseName} test failed err: ${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode0500
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0500
     * @tc.desc    Test refreshGlobalHttpProxy after setting unreachable proxy, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRefreshGlobalHttpProxyWithErrorCode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode0500';
        console.info(`${caseName}---Start`);
        try {
          const unreachableProxy: connection.HttpProxy = {
            host: '1.2.3.4',
            port: 99999,
            exclusionList: ['*']
          };
          await connection.setGlobalHttpProxy(unreachableProxy);
          const httpProxy = await connection.refreshGlobalHttpProxy();
          console.info(`${caseName} refreshGlobalHttpProxy result: ${JSON.stringify(httpProxy)}`);
          ExpectTrue(httpProxy === null);
          console.info(`${caseName}---End`);
          done();
        } catch (err) {
          let businessError = err as BusinessError;
          console.info(`${caseName} test failed err.code: ${businessError.code}`);
          ExpectTrue(businessError.code === 2100003 || businessError.code === 2100002);
          try {
            await connection.setGlobalHttpProxy({
              host: "",
              port: 0,
              exclusionList: [],
              username: "",
              password: ""
            } as connection.HttpProxy);
            console.info('clearGlobalHttpProxy end');
          } catch (error) {
            const businessError = error as BusinessError;
            if (businessError) {
              console.error('clearGlobalHttpProxy faild. '+JSON.stringify(businessError));
            }
          }
          console.info(`${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testRefreshGlobalHttpProxyWithErrorCode0600
     * @tc.number  SUB_Network_RefreshGlobalHttpProxy_WithErrorCode_0600
     * @tc.desc    Test refreshGlobalHttpProxy when system internal error occurs, verify returns error code 2100003.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('testRefreshGlobalHttpProxyWithErrorCode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        const caseName: string = 'testRefreshGlobalHttpProxyWithErrorCode0600';
        console.info(`${caseName}---Start`);
        try {
          const httpProxy = await connection.refreshGlobalHttpProxy();
          console.info(`${caseName} refreshGlobalHttpProxy result: ${JSON.stringify(httpProxy)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        } catch (err) {
          let businessError = err as BusinessError;
          console.info(`${caseName} test failed err.code: ${businessError.code}`);
          ExpectTrue(businessError.code === 2100003);
          console.info(`${caseName}---End`);
          done();
        }
      });
  });
}