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
     * @tc.desc Verify static field access via BootRuntimeLinker.instance returns
     *            a non-null valid BootRuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker: BootRuntimeLinker = BootRuntimeLinker.instance;
      expect(linker !== null).assertTrue();
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
        expect(linker !== null).assertTrue();
        expect(linker instanceof BootRuntimeLinker).assertTrue();
      }
      useLinker(BootRuntimeLinker.instance);
    });
  });
}
