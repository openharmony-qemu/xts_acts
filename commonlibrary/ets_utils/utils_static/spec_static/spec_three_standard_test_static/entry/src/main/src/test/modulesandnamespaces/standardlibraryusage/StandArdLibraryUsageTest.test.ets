'use static'
/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'

export default function StandArdLibraryUsageTest(): void {
  describe('StandArdLibraryUsageTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_STANDARD_LIBRARY_USAGE_0100
     * @tc.name      testStandardLibraryUsage0001
     * @tc.desc      All entities exported from the core packages of the standard library are accessible
     *               as simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandardLibraryUsage0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("some%20str")).assertEqual("some str");
    });

    /**
     * @tc.number    SUB_STANDARD_LIBRARY_USAGE_0200
     * @tc.name      testStandardLibraryUsage0002
     * @tc.desc      All entities exported from the core packages of the standard library are accessible
     *               as simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandardLibraryUsage0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("https://d gϴ")).assertEqual("https://d%20g%CF%B4");
    });

    /**
     * @tc.number    SUB_STANDARD_LIBRARY_USAGE_0300
     * @tc.name      testStandardLibraryUsage0003
     * @tc.desc      All entities exported from the core packages of the standard library are accessible
     *               as simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandardLibraryUsage0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("https://d gϴ")).assertEqual("https%3A%2F%2Fd%20g%CF%B4");
    });

    /**
     * @tc.number    SUB_STANDARD_LIBRARY_USAGE_0400
     * @tc.name      testStandardLibraryUsage0004
     * @tc.desc      All entities exported from the core packages of the standard library are
     *               accessible as simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandardLibraryUsage0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Atomics.isLockFree(7)).assertFalse();
      expect(Atomics.isLockFree(8)).assertTrue();
    });

    /**
     * @tc.number    SUB_STANDARD_LIBRARY_USAGE_0500
     * @tc.name      testStandardLibraryUsage0005
     * @tc.desc      All entities exported from the core packages of the standard library
     *               are accessible as simple names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandardLibraryUsage0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const promiseFunc = (resolve: (value: Object) => void): void => {};
      const promiseResult = new Promise<Object>(promiseFunc);
      expect(promiseResult !== null).assertTrue();
    });
  })
}