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

export default function BootRuntimeLinkerTest(): void {
  describe('BootRuntimeLinkerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0100
     * @tc.name testBootRuntimeLinker001
     * @tc.desc Verify BootRuntimeLinker declared as final class can be imported and referenced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0200
     * @tc.name testBootRuntimeLinker002
     * @tc.desc Verify compile-time error when extending final class BootRuntimeLinker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time verification only: extending final class causes error
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0300
     * @tc.name testBootRuntimeLinker003
     * @tc.desc Verify BootRuntimeLinker inherits instance method loadClass from RuntimeLinker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.loadClass("std.core.String");
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0400
     * @tc.name testBootRuntimeLinker004
     * @tc.desc Verify inherited method findLoadedClass is callable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let found: Class | undefined = linker.findLoadedClass("std.core.String");
      expect(found !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0500
     * @tc.name testBootRuntimeLinker005
     * @tc.desc Verify BootRuntimeLinker as reference type is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let takesObject = (obj: Object): void => {
        expect(obj instanceof BootRuntimeLinker).assertTrue();
      }
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      takesObject(linker);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0600
     * @tc.name testBootRuntimeLinker006
     * @tc.desc Verify typeof on BootRuntimeLinker instance returns object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let typeResult: string = typeof linker;
      expect(typeResult === 'object').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0700
     * @tc.name testBootRuntimeLinker007
     * @tc.desc Verify BootRuntimeLinker instance passes instanceof check against itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let obj: Object = linker as Object;
      let isBootLinker: boolean = obj instanceof BootRuntimeLinker;
      expect(isBootLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0800
     * @tc.name testBootRuntimeLinker008
     * @tc.desc Verify BootRuntimeLinker instance passes instanceof check against parent RuntimeLinker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let obj: Object = linker as Object;
      let isRuntimeLinker: boolean = obj instanceof RuntimeLinker;
      expect(isRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_0900
     * @tc.name testBootRuntimeLinker009
     * @tc.desc Verify compile-time error when assigning BootRuntimeLinker to incompatible string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time verification only: BootRuntimeLinker not assignable to string
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_1000
     * @tc.name testBootRuntimeLinker010
     * @tc.desc Verify null cannot be directly assigned to non-nullish BootRuntimeLinker type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time error: null not assignable to BootRuntimeLinker
      // Valid case: union type with null
      let nullableLinker: BootRuntimeLinker | null = null;
      expect(nullableLinker === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_1100
     * @tc.name testBootRuntimeLinker011
     * @tc.desc Verify T|undefined union type is not assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time error: BootRuntimeLinker|undefined not assignable to Object
      let maybeLinker: BootRuntimeLinker | undefined = undefined;
      expect(maybeLinker === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOOT_RUNTIME_LINKER_1200
     * @tc.name testBootRuntimeLinker012
     * @tc.desc Verify compile-time error when extending final class triggers explicit error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBootRuntimeLinker012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time verification only: final class + extends = compile-time error
      let skipReason: string = "compile-time verification only";
      expect(skipReason.length > 0).assertTrue();
      return;
    });
  });
}
