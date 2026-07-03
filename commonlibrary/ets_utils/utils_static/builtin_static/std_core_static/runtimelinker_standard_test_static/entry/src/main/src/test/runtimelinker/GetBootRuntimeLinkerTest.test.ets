'use static';
/*
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function GetBootRuntimeLinkerTest(): void {
  describe('GetBootRuntimeLinkerTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0100
     * @tc.name testGetBootRuntimeLinker001
     * @tc.desc Verify getBootRuntimeLinker() called with zero parameters returns
     *            a non-null BootRuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = getBootRuntimeLinker();
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0200
     * @tc.name testGetBootRuntimeLinker002
     * @tc.desc Verify multiple calls to getBootRuntimeLinker() return the same singleton instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker1: BootRuntimeLinker = getBootRuntimeLinker();
      let linker2: BootRuntimeLinker = getBootRuntimeLinker();
      expect(linker1 === linker2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0300
     * @tc.name testGetBootRuntimeLinker003
     * @tc.desc Verify getBootRuntimeLinker() can be called from within a local function scope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callInLocalScope = (): void => {
        let linker: BootRuntimeLinker = getBootRuntimeLinker();
        expect(linker instanceof BootRuntimeLinker).assertTrue();
      }
      callInLocalScope();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0400
     * @tc.name testGetBootRuntimeLinker004
     * @tc.desc Verify return type of getBootRuntimeLinker() is inferred as BootRuntimeLinker
     *            and is assignable to a BootRuntimeLinker-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let typedLinker: BootRuntimeLinker = linker;
      expect(typedLinker instanceof BootRuntimeLinker).assertTrue();
    });

  });
}
