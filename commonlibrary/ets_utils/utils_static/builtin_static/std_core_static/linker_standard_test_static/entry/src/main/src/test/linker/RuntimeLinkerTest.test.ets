'use static'
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

export default function RuntimeLinkerTest(): void {
  describe('RuntimeLinkerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0100
     * @tc.name testRuntimeLinker001
     * @tc.desc Verify getBootRuntimeLinker returns linker that can load String class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker: RuntimeLinker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      expect(cls.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0200
     * @tc.name testRuntimeLinker002
     * @tc.desc Verify repeated getBootRuntimeLinker calls can resolve String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker1 = getBootRuntimeLinker()
      const linker2 = getBootRuntimeLinker()
      expect(linker1.getType("std.core.String")!.toString()).assertEqual("string")
      expect(linker2.getType("std.core.String")!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0300
     * @tc.name testRuntimeLinker003
     * @tc.desc Verify getBootRuntimeLinker can find String after loading String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      linker.loadClass("std.core.String", false)
      const loaded = linker.findLoadedClass("std.core.String")!
      expect(loaded.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0400
     * @tc.name testRuntimeLinker004
     * @tc.desc Verify RuntimeLinker loadClass loads Short and exposes class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Short", false)
      expect(cls.getName()).assertEqual("std.core.Short")
      expect(linker.findLoadedClass("std.core.Short")).assertEqual(cls)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0500
     * @tc.name testRuntimeLinker005
     * @tc.desc Verify RuntimeLinker getType resolves Object and rejects missing descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Object")
      const missingType = linker.getType("runtime.linker.MissingDescriptor")
      expect(type!.toString()).assertEqual("std.core.Object")
      expect(missingType).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0600
     * @tc.name testRuntimeLinker006
     * @tc.desc Verify multiple getBootRuntimeLinker calls return same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker1 = getBootRuntimeLinker()
      const linker2 = getBootRuntimeLinker()
      expect(linker1).assertEqual(linker2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0700
     * @tc.name testRuntimeLinker007
     * @tc.desc Verify 10 successive getBootRuntimeLinker calls return same RuntimeLinker identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l0 = getBootRuntimeLinker()
      const l1 = getBootRuntimeLinker()
      const l2 = getBootRuntimeLinker()
      const l3 = getBootRuntimeLinker()
      const l4 = getBootRuntimeLinker()
      const l5 = getBootRuntimeLinker()
      const l6 = getBootRuntimeLinker()
      const l7 = getBootRuntimeLinker()
      const l8 = getBootRuntimeLinker()
      const l9 = getBootRuntimeLinker()
      expect(l1).assertEqual(l0)
      expect(l2).assertEqual(l0)
      expect(l3).assertEqual(l0)
      expect(l4).assertEqual(l0)
      expect(l5).assertEqual(l0)
      expect(l6).assertEqual(l0)
      expect(l7).assertEqual(l0)
      expect(l8).assertEqual(l0)
      expect(l9).assertEqual(l0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0800
     * @tc.name testRuntimeLinker008
     * @tc.desc Verify typed RuntimeLinker variable can load and resolve String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker: RuntimeLinker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      const type = linker.getType("std.core.String")
      expect(cls.getName()).assertEqual("std.core.String")
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_0900
     * @tc.name testRuntimeLinker009
     * @tc.desc Verify two linkers from getBootRuntimeLinker can both load same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker1 = getBootRuntimeLinker()
      const linker2 = getBootRuntimeLinker()
      const cls1 = linker1.loadClass("std.core.String", false)
      const cls2 = linker2.loadClass("std.core.String", false)
      expect(cls1).assertEqual(cls2)
      expect(cls1.getName()).assertEqual(cls2.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1000
     * @tc.name testRuntimeLinker010
     * @tc.desc Verify findLoadedClass finds a previously loaded class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", false)
      const cls = linker.findLoadedClass("std.core.String")
      expect(cls).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1100
     * @tc.name testRuntimeLinker011
     * @tc.desc Verify all three methods work on same linker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      const found = linker.findLoadedClass("std.core.String")
      const type = linker.getType("std.core.String")
      expect(cls.getName()).assertEqual("std.core.String")
      expect(found).assertEqual(cls)
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1200
     * @tc.name testRuntimeLinker012
     * @tc.desc Verify loadClass with init=true then findLoadedClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", true)
      const found = linker.findLoadedClass("std.core.String")
      expect(cls.getName()).assertEqual("std.core.String")
      expect(cls).assertEqual(found)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1300
     * @tc.name testRuntimeLinker013
     * @tc.desc Verify loadClass then getType returns valid Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      const type = linker.getType("std.core.String")
      expect(cls.getName()).assertEqual("std.core.String")
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1400
     * @tc.name testRuntimeLinker014
     * @tc.desc Verify after loading Object cls.getName returns std.core.Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Object", false)
      expect(cls.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1500
     * @tc.name testRuntimeLinker015
     * @tc.desc Verify loadClass with init=true returns class with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Boolean", true)
      expect(cls.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1600
     * @tc.name testRuntimeLinker016
     * @tc.desc Verify findLoadedClass returns undefined for missing class before loadClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingClass = linker.findLoadedClass("runtime.linker.MissingBeforeLoad")
      expect(missingClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1700
     * @tc.name testRuntimeLinker017
     * @tc.desc Verify typed RuntimeLinker identity remains stable after load find and type workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker: RuntimeLinker = getBootRuntimeLinker()
      const sameLinker: RuntimeLinker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      const found = linker.findLoadedClass("std.core.String")
      const type = linker.getType("std.core.String")
      expect(linker).assertEqual(sameLinker)
      expect(found).assertEqual(cls)
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1800
     * @tc.name testRuntimeLinker018
     * @tc.desc Verify getType before loadClass and findLoadedClass after load use same descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const typeBeforeLoad = linker.getType("std.core.Boolean")
      const cls = linker.loadClass("std.core.Boolean", false)
      const found = linker.findLoadedClass("std.core.Boolean")
      const typeAfterLoad = linker.getType("std.core.Boolean")
      expect(typeBeforeLoad!.toString()).assertEqual("std.core.Boolean")
      expect(found).assertEqual(cls)
      expect(typeAfterLoad).assertEqual(typeBeforeLoad)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_1900
     * @tc.name testRuntimeLinker019
     * @tc.desc Verify invalid getType lookup does not change subsequent RuntimeLinker class loading workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const invalidType = linker.getType("runtime.linker.InvalidStateIsolation")
      const cls = linker.loadClass("std.core.Object", false)
      const found = linker.findLoadedClass("std.core.Object")
      expect(invalidType).assertEqual(undefined)
      expect(found).assertEqual(cls)
      expect(cls.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2000
     * @tc.name testRuntimeLinker020
     * @tc.desc Verify getType returns undefined for missing descriptor after Object load
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Object", false)
      const missingType = linker.getType("runtime.linker.MissingAfterObjectLoad")
      expect(cls.getName()).assertEqual("std.core.Object")
      expect(missingType).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2100
     * @tc.name testRuntimeLinker021
     * @tc.desc Verify missing TypeDescriptor before std.core.Boolean load does not affect RuntimeLinker state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.MissingRuntime3")
      const cls = linker.loadClass("std.core.Boolean", false)
      expect(missingType).assertEqual(undefined)
      expect(cls.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2200
     * @tc.name testRuntimeLinker022
     * @tc.desc Verify init true and false share RuntimeLinker Class identity for std.core.Byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const initClass = linker.loadClass("std.core.Byte", true)
      const noInitClass = linker.loadClass("std.core.Byte", false)
      const found = linker.findLoadedClass("std.core.Byte")
      expect(noInitClass).assertEqual(initClass)
      expect(found).assertEqual(initClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2300
     * @tc.name testRuntimeLinker023
     * @tc.desc Verify failed loadClass is isolated before valid std.core.Short load
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("runtime.linker.MissingLoad5", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const cls = linker.loadClass("std.core.Short", false)
      expect(cls.getName()).assertEqual("std.core.Short")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2400
     * @tc.name testRuntimeLinker024
     * @tc.desc Verify loadClass can load std.core.Array with init true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Array", true)
      expect(cls.getName()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2500
     * @tc.name testRuntimeLinker025
     * @tc.desc Verify missing TypeDescriptor before std.core.Float load does not affect RuntimeLinker state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.MissingRuntime8")
      const cls = linker.loadClass("std.core.Float", false)
      expect(missingType).assertEqual(undefined)
      expect(cls.getName()).assertEqual("std.core.Float")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2600
     * @tc.name testRuntimeLinker026
     * @tc.desc Verify failed loadClass is isolated before valid std.core.Array load
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("runtime.linker.MissingLoad10", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const cls = linker.loadClass("std.core.Array", false)
      expect(cls.getName()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2700
     * @tc.name testRuntimeLinker027
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.String")
      const loadedClass = linker.loadClass("std.core.String", false)
      const afterType = linker.getType("std.core.String")
      expect(beforeType!.toString()).assertEqual("string")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2800
     * @tc.name testRuntimeLinker028
     * @tc.desc Verify boot linker loadClass init true then type and findLoadedClass for std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.String", true)
      const foundClass = linker.findLoadedClass("std.core.String")
      const typeObject = linker.getType("std.core.String")
      expect(foundClass).assertEqual(loadedClass)
      expect(typeObject!.toString()).assertEqual("string")
      expect(loadedClass.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_2900
     * @tc.name testRuntimeLinker029
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.String load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing0")
      const loadedClass = linker.loadClass("std.core.String", false)
      const foundClass = linker.findLoadedClass("std.core.String")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3000
     * @tc.name testRuntimeLinker030
     * @tc.desc Verify repeated boot linker identity around std.core.String class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.String", false)
      const foundClass = secondLinker.findLoadedClass("std.core.String")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3100
     * @tc.name testRuntimeLinker031
     * @tc.desc Verify boot linker direct getType then loadClass keeps std.core.Object type descriptor stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Object")
      const loadedClass = linker.loadClass("std.core.Object", false)
      const afterType = linker.getType("std.core.Object")
      expect(beforeType!.toString()).assertEqual("std.core.Object")
      expect(afterType!.toString()).assertEqual(beforeType!.toString())
      expect(loadedClass.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3200
     * @tc.name testRuntimeLinker032
     * @tc.desc Verify repeated boot linker identity around std.core.Object class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Object", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Object")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3300
     * @tc.name testRuntimeLinker033
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Boolean")
      const loadedClass = linker.loadClass("std.core.Boolean", false)
      const afterType = linker.getType("std.core.Boolean")
      expect(beforeType!.toString()).assertEqual("std.core.Boolean")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3400
     * @tc.name testRuntimeLinker034
     * @tc.desc Verify boot linker loadClass init true then type and findLoadedClass for std.core.Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.Boolean", true)
      const foundClass = linker.findLoadedClass("std.core.Boolean")
      const typeObject = linker.getType("std.core.Boolean")
      expect(foundClass).assertEqual(loadedClass)
      expect(typeObject!.toString()).assertEqual("std.core.Boolean")
      expect(loadedClass.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3500
     * @tc.name testRuntimeLinker035
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Boolean load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing2")
      const loadedClass = linker.loadClass("std.core.Boolean", false)
      const foundClass = linker.findLoadedClass("std.core.Boolean")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3600
     * @tc.name testRuntimeLinker036
     * @tc.desc Verify repeated boot linker identity around std.core.Boolean class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Boolean", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Boolean")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3700
     * @tc.name testRuntimeLinker037
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Byte")
      const loadedClass = linker.loadClass("std.core.Byte", false)
      const afterType = linker.getType("std.core.Byte")
      expect(beforeType!.toString()).assertEqual("std.core.Byte")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Byte")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3800
     * @tc.name testRuntimeLinker038
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Byte load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing3")
      const loadedClass = linker.loadClass("std.core.Byte", false)
      const foundClass = linker.findLoadedClass("std.core.Byte")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Byte")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_3900
     * @tc.name testRuntimeLinker039
     * @tc.desc Verify repeated boot linker identity around std.core.Byte class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Byte", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Byte")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4000
     * @tc.name testRuntimeLinker040
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Short")
      const loadedClass = linker.loadClass("std.core.Short", false)
      const afterType = linker.getType("std.core.Short")
      expect(beforeType!.toString()).assertEqual("std.core.Short")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Short")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4100
     * @tc.name testRuntimeLinker041
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Short load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing4")
      const loadedClass = linker.loadClass("std.core.Short", false)
      const foundClass = linker.findLoadedClass("std.core.Short")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Short")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4200
     * @tc.name testRuntimeLinker042
     * @tc.desc Verify repeated boot linker identity around std.core.Short class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Short", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Short")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4300
     * @tc.name testRuntimeLinker043
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Char")
      const loadedClass = linker.loadClass("std.core.Char", false)
      const afterType = linker.getType("std.core.Char")
      expect(beforeType!.toString()).assertEqual("std.core.Char")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Char")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4400
     * @tc.name testRuntimeLinker044
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Char load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing5")
      const loadedClass = linker.loadClass("std.core.Char", false)
      const foundClass = linker.findLoadedClass("std.core.Char")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Char")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4500
     * @tc.name testRuntimeLinker045
     * @tc.desc Verify repeated boot linker identity around std.core.Char class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Char", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Char")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4600
     * @tc.name testRuntimeLinker046
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Long")
      const loadedClass = linker.loadClass("std.core.Long", false)
      const afterType = linker.getType("std.core.Long")
      expect(beforeType!.toString()).assertEqual("std.core.Long")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4700
     * @tc.name testRuntimeLinker047
     * @tc.desc Verify boot linker loadClass init true then type and findLoadedClass for std.core.Long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.Long", true)
      const foundClass = linker.findLoadedClass("std.core.Long")
      const typeObject = linker.getType("std.core.Long")
      expect(foundClass).assertEqual(loadedClass)
      expect(typeObject!.toString()).assertEqual("std.core.Long")
      expect(loadedClass.getName()).assertEqual("std.core.Long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4800
     * @tc.name testRuntimeLinker048
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Long load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing6")
      const loadedClass = linker.loadClass("std.core.Long", false)
      const foundClass = linker.findLoadedClass("std.core.Long")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_4900
     * @tc.name testRuntimeLinker049
     * @tc.desc Verify failed loadClass before boot linker workflow keeps std.core.Long load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("runtime.linker.RuntimeMissingLoad6", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const loadedClass = linker.loadClass("std.core.Long", false)
      expect(loadedClass.getName()).assertEqual("std.core.Long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5000
     * @tc.name testRuntimeLinker050
     * @tc.desc Verify repeated boot linker identity around std.core.Long class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Long", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Long")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5100
     * @tc.name testRuntimeLinker051
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Float")
      const loadedClass = linker.loadClass("std.core.Float", false)
      const afterType = linker.getType("std.core.Float")
      expect(beforeType!.toString()).assertEqual("std.core.Float")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Float")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5200
     * @tc.name testRuntimeLinker052
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Float load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing7")
      const loadedClass = linker.loadClass("std.core.Float", false)
      const foundClass = linker.findLoadedClass("std.core.Float")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Float")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5300
     * @tc.name testRuntimeLinker053
     * @tc.desc Verify repeated boot linker identity around std.core.Float class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Float", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Float")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5400
     * @tc.name testRuntimeLinker054
     * @tc.desc Verify boot linker direct getType then loadClass for std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Double")
      const loadedClass = linker.loadClass("std.core.Double", false)
      const afterType = linker.getType("std.core.Double")
      expect(beforeType!.toString()).assertEqual("std.core.Double")
      expect(afterType).assertEqual(beforeType)
      expect(loadedClass.getName()).assertEqual("std.core.Double")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5500
     * @tc.name testRuntimeLinker055
     * @tc.desc Verify boot linker loadClass init true then type and findLoadedClass for std.core.Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const loadedClass = linker.loadClass("std.core.Double", true)
      const foundClass = linker.findLoadedClass("std.core.Double")
      const typeObject = linker.getType("std.core.Double")
      expect(foundClass).assertEqual(loadedClass)
      expect(typeObject!.toString()).assertEqual("std.core.Double")
      expect(loadedClass.getName()).assertEqual("std.core.Double")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5600
     * @tc.name testRuntimeLinker056
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Double load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing8")
      const loadedClass = linker.loadClass("std.core.Double", false)
      const foundClass = linker.findLoadedClass("std.core.Double")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Double")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5700
     * @tc.name testRuntimeLinker057
     * @tc.desc Verify failed loadClass before boot linker workflow keeps std.core.Double load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("runtime.linker.RuntimeMissingLoad8", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const loadedClass = linker.loadClass("std.core.Double", false)
      expect(loadedClass.getName()).assertEqual("std.core.Double")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5800
     * @tc.name testRuntimeLinker058
     * @tc.desc Verify repeated boot linker identity around std.core.Double class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Double", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Double")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_5900
     * @tc.name testRuntimeLinker059
     * @tc.desc Verify boot linker direct getType then loadClass keeps std.core.Array type descriptor stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const beforeType = linker.getType("std.core.Array")
      const loadedClass = linker.loadClass("std.core.Array", false)
      const afterType = linker.getType("std.core.Array")
      expect(beforeType!.toString()).assertEqual("std.core.Array")
      expect(afterType!.toString()).assertEqual(beforeType!.toString())
      expect(loadedClass.getName()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6000
     * @tc.name testRuntimeLinker060
     * @tc.desc Verify invalid getType before boot linker workflow keeps std.core.Array load stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeMissing9")
      const loadedClass = linker.loadClass("std.core.Array", false)
      const foundClass = linker.findLoadedClass("std.core.Array")
      expect(missingType).assertEqual(undefined)
      expect(foundClass).assertEqual(loadedClass)
      expect(loadedClass.getName()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6100
     * @tc.name testRuntimeLinker061
     * @tc.desc Verify repeated boot linker identity around std.core.Array class workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const secondLinker = getBootRuntimeLinker()
      const loadedClass = firstLinker.loadClass("std.core.Array", false)
      const foundClass = secondLinker.findLoadedClass("std.core.Array")
      expect(secondLinker).assertEqual(firstLinker)
      expect(foundClass).assertEqual(loadedClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6200
     * @tc.name testRuntimeLinker062
     * @tc.desc Verify getBootRuntimeLinker returns a defined RuntimeLinker instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      expect(linker).assertEqual(getBootRuntimeLinker())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6300
     * @tc.name testRuntimeLinker063
     * @tc.desc Verify getBootRuntimeLinker instance can resolve std.core.Boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const type = linker.getType("std.core.Boolean")
      expect(type!.toString()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6400
     * @tc.name testRuntimeLinker064
     * @tc.desc Verify missing findLoadedClass lookup does not change boot linker identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const missingClass = firstLinker.findLoadedClass("runtime.linker.RuntimeOnlyMissingFind0")
      const secondLinker = getBootRuntimeLinker()
      expect(missingClass).assertEqual(undefined)
      expect(secondLinker).assertEqual(firstLinker)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6500
     * @tc.name testRuntimeLinker065
     * @tc.desc Verify missing getType lookup does not change boot linker identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      const missingType = firstLinker.getType("runtime.linker.RuntimeOnlyMissingType0")
      const secondLinker = getBootRuntimeLinker()
      expect(missingType).assertEqual(undefined)
      expect(secondLinker).assertEqual(firstLinker)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6600
     * @tc.name testRuntimeLinker066
     * @tc.desc Verify failed loadClass does not change boot linker identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstLinker = getBootRuntimeLinker()
      try {
        firstLinker.loadClass("runtime.linker.RuntimeOnlyMissingLoad0", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const secondLinker = getBootRuntimeLinker()
      expect(secondLinker).assertEqual(firstLinker)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6700
     * @tc.name testRuntimeLinker067
     * @tc.desc Verify typed RuntimeLinker can return undefined for missing findLoadedClass lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker: RuntimeLinker = getBootRuntimeLinker()
      const missingClass = linker.findLoadedClass("runtime.linker.RuntimeOnlyMissingFind1")
      expect(missingClass).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_6800
     * @tc.name testRuntimeLinker068
     * @tc.desc Verify typed RuntimeLinker can return undefined for missing getType descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinker068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker: RuntimeLinker = getBootRuntimeLinker()
      const missingType = linker.getType("runtime.linker.RuntimeOnlyMissingType1")
      expect(missingType).assertEqual(undefined)
    });

  });
}
