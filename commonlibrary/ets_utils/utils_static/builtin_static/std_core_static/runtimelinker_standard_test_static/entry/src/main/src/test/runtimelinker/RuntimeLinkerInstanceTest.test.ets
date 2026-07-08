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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
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
     * @tc.desc Verify static field access via BootRuntimeLinker.instance returns
     *            a non-null valid BootRuntimeLinker instance
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
     * @tc.desc Verify the compile-time type of instance field is BootRuntimeLinker,
     *            assignable to a BootRuntimeLinker-typed variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = BootRuntimeLinker.instance;
      let typedLinker: BootRuntimeLinker = linker;
      expect(typedLinker instanceof BootRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0300
     * @tc.name testInstance003
     * @tc.desc Verify BootRuntimeLinker.instance and getBootRuntimeLinker()
     *            return the same singleton instance (identity check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fieldInstance: BootRuntimeLinker = BootRuntimeLinker.instance;
      let funcInstance: BootRuntimeLinker = getBootRuntimeLinker();
      expect(fieldInstance instanceof BootRuntimeLinker).assertTrue();
      expect(funcInstance instanceof BootRuntimeLinker).assertTrue();
      expect(fieldInstance === funcInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0400
     * @tc.name testInstance004
     * @tc.desc Verify multiple accesses to instance field return the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ref1: BootRuntimeLinker = BootRuntimeLinker.instance;
      let ref2: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(ref1 === ref2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0500
     * @tc.name testInstance005
     * @tc.desc Verify instance field value can be passed as a function parameter
     *            of type BootRuntimeLinker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let useLinker = (linker: BootRuntimeLinker): void => {
        expect(linker instanceof BootRuntimeLinker).assertTrue();
      }
      useLinker(BootRuntimeLinker.instance);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0600
     * @tc.name testInstance006
     * @tc.desc Verify inherited method findLoadedClass("std.core.String") returns valid Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let found: Class | undefined = linker.findLoadedClass("std.core.String");
      expect(found !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0700
     * @tc.name testInstance007
     * @tc.desc Verify inherited method loadClass("std.core.String") returns valid Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let cls: Class | undefined = linker.loadClass("std.core.String");
      expect(cls !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0800
     * @tc.name testInstance008
     * @tc.desc Verify typeof on BootRuntimeLinker instance returns 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let typeResult: string = typeof linker;
      expect(typeResult === 'object').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_0900
     * @tc.name testInstance009
     * @tc.desc Verify BootRuntimeLinker instance passes instanceof check against itself
     *            after casting to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let obj: Object = linker;
      let isBootLinker: boolean = obj instanceof BootRuntimeLinker;
      expect(isBootLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_1000
     * @tc.name testInstance010
     * @tc.desc Verify BootRuntimeLinker instance passes instanceof check against parent RuntimeLinker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let obj: Object = linker;
      let isRuntimeLinker: boolean = obj instanceof RuntimeLinker;
      expect(isRuntimeLinker).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_1100
     * @tc.name testInstance011
     * @tc.desc Verify BootRuntimeLinker|undefined union type can hold undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maybeLinker: BootRuntimeLinker | undefined = undefined;
      expect(maybeLinker === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_1200
     * @tc.name testInstance012
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for non-existent class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      try {
        linker.loadClass("com.nonexistent.FakeClass");
        expect().assertFail();
      } catch (error) {
        expect(error instanceof LinkerClassNotFoundError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCE_1300
     * @tc.name testInstance013
     * @tc.desc Verify getType returns Type instance for valid type descriptor "std.core.String"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      let typeResult: Type | undefined = linker.getType("std.core.String");
      expect(typeResult !== undefined).assertTrue();
    });

  });
}
