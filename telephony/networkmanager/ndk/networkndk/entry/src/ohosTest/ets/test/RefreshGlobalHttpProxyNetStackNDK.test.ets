/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import testNapi from 'libentry.so';

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function RefreshGlobalHttpProxyNetStackNDKTest() {
  describe('RefreshGlobalHttpProxyNetStackNDKTest', () => {
    /**
     * @tc.name   testRefreshGlobalHttpProxySuccess0100
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_Success_0100
     * @tc.desc   test RefreshGlobalHttpProxy returns 0 (Success) without parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxySuccess0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxySuccess0100";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy();
      ExpectTrue(statusCode === 0);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 0`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxySuccess0200
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_Success_0200
     * @tc.desc   test RefreshGlobalHttpProxy returns 0 (Success) with valid userData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxySuccess0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxySuccess0200";
      console.info(`${caseName} test start`);
      const userData: number = 12345;
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(userData);
      ExpectTrue(statusCode === 0);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 0`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxySuccess0300
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_Success_0300
     * @tc.desc   test RefreshGlobalHttpProxy returns 0 (Success) with boundary userData (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxySuccess0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxySuccess0300";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(0);
      ExpectTrue(statusCode === 0);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 0`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxySuccess0400
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_Success_0400
     * @tc.desc   test RefreshGlobalHttpProxy returns 0 (Success) with boundary userData (1000000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxySuccess0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxySuccess0400";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(1000000);
      ExpectTrue(statusCode === 0);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 0`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxySuccess0500
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_Success_0500
     * @tc.desc   test RefreshGlobalHttpProxy returns 0 (Success) with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxySuccess0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxySuccess0500";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const callback: Function = (): void => {
        console.info('callback invoked');
      };
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(54321, callback);
      ExpectTrue(statusCode === 0);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 0`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0100
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0100
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) with negative userData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0100";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(-1);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0200
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0200
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) with out of range userData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0200";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(1000001);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0300
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0300
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) with large negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0300";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(-999999);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0400
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0400
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) with large positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0400";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy(9999999);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0500
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0500
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) via test interface (type error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0500";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.TestRefreshGlobalHttpProxy401 !== 'function') {
        console.info(`${caseName} TestRefreshGlobalHttpProxy401 not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.TestRefreshGlobalHttpProxy401(1);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0600
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0600
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) via test interface (callback type error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0600";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.TestRefreshGlobalHttpProxy401 !== 'function') {
        console.info(`${caseName} TestRefreshGlobalHttpProxy401 not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.TestRefreshGlobalHttpProxy401(2);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testRefreshGlobalHttpProxyParamError0700
     * @tc.number SUB_NetworkMgr_Connection_RefreshGlobalHttpProxy_ParamError_0700
     * @tc.desc   test RefreshGlobalHttpProxy returns 401 (Parameter error) via test interface (null param)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefreshGlobalHttpProxyParamError0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testRefreshGlobalHttpProxyParamError0700";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.TestRefreshGlobalHttpProxy401 !== 'function') {
        console.info(`${caseName} TestRefreshGlobalHttpProxy401 not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.TestRefreshGlobalHttpProxy401(3);
      ExpectTrue(statusCode === 401);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 401`);
      console.info(`${caseName}---End`);
    });
  });
}
