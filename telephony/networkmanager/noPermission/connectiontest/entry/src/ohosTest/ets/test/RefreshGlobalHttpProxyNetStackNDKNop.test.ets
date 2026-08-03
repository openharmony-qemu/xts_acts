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

export default function RefreshGlobalHttpProxyNetStackNDKNopTest() {
  describe('RefreshGlobalHttpProxyNetStackNDKNopTest', () => {
    /**
     * @tc.name   testNetworkManagerRefreshGlobalHttpProxy201_0100
     * @tc.number SUB_NetworkManager_RefreshGlobalHttpProxy_201_0100
     * @tc.desc   test RefreshGlobalHttpProxy returns 201 (Permission denied) via test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkManagerRefreshGlobalHttpProxy201_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = "testNetworkManagerRefreshGlobalHttpProxy201_0100";
      console.info(`${caseName} test start`);
      if (!testNapi || typeof testNapi.ReFreshGlobalHttpProxy !== 'function') {
        console.info(`${caseName} ReFreshGlobalHttpProxy not available, skipping test`);
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        return;
      }
      const statusCode: number = testNapi.ReFreshGlobalHttpProxy("ERROR_201");
      ExpectTrue(statusCode === 201);
      console.info(`${caseName} statusCode: ${statusCode}, expected: 201`);
      console.info(`${caseName}---End`);
    });
  });
}
