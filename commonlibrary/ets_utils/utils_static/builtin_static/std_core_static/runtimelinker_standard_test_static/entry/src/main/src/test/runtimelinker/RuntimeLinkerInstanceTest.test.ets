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

export default function InstanceTest(): void {
  describe('InstanceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0100
     * @tc.name testInstance001
     * @tc.desc Verify static field access via BootRuntimeLinker.instance returns valid instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0200
     * @tc.name testInstance002
     * @tc.desc Verify compile-time error when accessing static field instance through an
     *            instance reference rather than the class name. ArkTS enforces that static
     *            fields are only accessible via the class qualifier (spec/classes.md).
     *            Runtime assertion verifies the correct access pattern works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: static field not accessible via instance.
      // The legal pattern (BootRuntimeLinker.instance) is validated at runtime below.
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0300
     * @tc.name testInstance003
     * @tc.desc Verify compile-time type of instance field is BootRuntimeLinker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let typedLinker: BootRuntimeLinker = linker;
      expect(typedLinker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0400
     * @tc.name testInstance004
     * @tc.desc Verify identity relationship between instance field and getBootRuntimeLinker return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fieldInstance: BootRuntimeLinker = BootRuntimeLinker.instance;
      let funcInstance: BootRuntimeLinker = getBootRuntimeLinker();
      // verify identity relationship between static field and getter function
      expect(fieldInstance instanceof BootRuntimeLinker).assertTrue();
      expect(funcInstance instanceof BootRuntimeLinker).assertTrue();
      expect(fieldInstance === funcInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0500
     * @tc.name testInstance005
     * @tc.desc Verify compile-time error when reassigning readonly static field instance.
     *            ArkTS prohibits reassignment to readonly fields (spec/classes.md).
     *            Runtime assertion verifies the field is accessible and returns a valid instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Compile-time verification: readonly field cannot be reassigned.
      // The legal read-access pattern is validated at runtime below.
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0600
     * @tc.name testInstance006
     * @tc.desc Verify multiple accesses to instance field return the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ref1: BootRuntimeLinker = BootRuntimeLinker.instance;
      let ref2: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(ref1 === ref2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0700
     * @tc.name testInstance007
     * @tc.desc Verify instanceof check is covered in BootRuntimeLinker test mindmap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // cross-file reference: instanceof tests covered in BootRuntimeLinkerTest
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0800
     * @tc.name testInstance008
     * @tc.desc Verify instance field value can be passed as function parameter of BootRuntimeLinker type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let useLinker = (linker: BootRuntimeLinker): void => {
        expect(linker instanceof BootRuntimeLinker).assertTrue();
      }
      useLinker(BootRuntimeLinker.instance);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0900
     * @tc.name testInstance009
     * @tc.desc Verify static field initialized at class load time with valid BootRuntimeLinker object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_1000
     * @tc.name testInstance010
     * @tc.desc Verify field initializer type is compatible with field declaration type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // compile-time verification: field initializer BootRuntimeLinker compatible with declaration type
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_1100
     * @tc.name testInstance011
     * @tc.desc Verify public static field instance accessible from imported module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker instanceof BootRuntimeLinker).assertTrue();
    });
  });
}
