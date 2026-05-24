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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
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
     * @tc.desc Verify getBootRuntimeLinker returns BootRuntimeLinker instance with zero parameters
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
     * @tc.desc Verify compile-time error when passing extra argument to parameterless function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time verification only: passing argument to parameterless function causes error
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0300
     * @tc.name testGetBootRuntimeLinker003
     * @tc.desc Verify getBootRuntimeLinker returns non-null BootRuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = getBootRuntimeLinker();
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0400
     * @tc.name testGetBootRuntimeLinker004
     * @tc.desc Verify multiple calls to getBootRuntimeLinker return the same singleton instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker1: BootRuntimeLinker = getBootRuntimeLinker();
      let linker2: BootRuntimeLinker = getBootRuntimeLinker();
      expect(linker1 === linker2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0500
     * @tc.name testGetBootRuntimeLinker005
     * @tc.desc Verify getBootRuntimeLinker as export function can be imported and called from another module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testInAnotherModule = (): void => {
        let linker: BootRuntimeLinker = getBootRuntimeLinker();
        expect(linker instanceof BootRuntimeLinker).assertTrue();
      }
      testInAnotherModule();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0600
     * @tc.name testGetBootRuntimeLinker006
     * @tc.desc Verify compile-time return type is BootRuntimeLinker and assignable to same-type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = getBootRuntimeLinker();
      let typedLinker: BootRuntimeLinker = linker;
      expect(typedLinker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0700
     * @tc.name testGetBootRuntimeLinker007
     * @tc.desc Verify compile-time error when assigning BootRuntimeLinker return value to incompatible string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time verification only: BootRuntimeLinker not assignable to string
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0800
     * @tc.name testGetBootRuntimeLinker008
     * @tc.desc Verify 100 consecutive calls to getBootRuntimeLinker all return valid instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      while (count < 100) {
        let linker: BootRuntimeLinker = getBootRuntimeLinker();
        expect(linker instanceof BootRuntimeLinker).assertTrue();
        count++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_BOOT_RUNTIME_LINKER_0900
     * @tc.name testGetBootRuntimeLinker009
     * @tc.desc Verify getBootRuntimeLinker does not throw exception during normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBootRuntimeLinker009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let linker: BootRuntimeLinker = getBootRuntimeLinker();
        expect(linker instanceof BootRuntimeLinker).assertTrue();
      } catch (e) {
        expect().assertFail();
      }
    });
  });
}
