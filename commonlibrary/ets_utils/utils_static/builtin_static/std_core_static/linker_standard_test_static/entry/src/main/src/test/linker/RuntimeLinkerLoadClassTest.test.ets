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

export default function RuntimeLinkerLoadClassTest(): void {
  describe('RuntimeLinkerLoadClassTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0010
     * @tc.name testRuntimeLinkerLoadClass001
     * @tc.desc Verify loadClass with required clsName parameter and default init false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String")
      expect(cls.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0020
     * @tc.name testRuntimeLinkerLoadClass002
     * @tc.desc Verify loadClass with clsName and init parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      expect(cls.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0030
     * @tc.name testRuntimeLinkerLoadClass003
     * @tc.desc Verify loadClass with init=true returns String class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", true)
      expect(cls.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0040
     * @tc.name testRuntimeLinkerLoadClass004
     * @tc.desc Verify runtime linker with standard class name including package path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Object")
      expect(cls.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0050
     * @tc.name testRuntimeLinkerLoadClass005
     * @tc.desc Verify loadClass throws error when passing nonexistent class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("non.existent.Class")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0060
     * @tc.name testRuntimeLinkerLoadClass006
     * @tc.desc Verify loading the same class multiple times returns same Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls1 = linker.loadClass("std.core.String", false)
      const cls2 = linker.loadClass("std.core.String", false)
      expect(cls1).assertEqual(cls2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0070
     * @tc.name testRuntimeLinkerLoadClass007
     * @tc.desc Verify loadClass can load std.core.Object with explicit init false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const objectClass = linker.loadClass("std.core.Object", false)
      expect(objectClass.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0080
     * @tc.name testRuntimeLinkerLoadClass008
     * @tc.desc Verify loadClass with init=true throws LinkerClassNotFoundError for missing class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("some.class.with.init.error", true)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0090
     * @tc.name testRuntimeLinkerLoadClass009
     * @tc.desc Verify loadClass with default init and explicit false return same Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const defaultClass = linker.loadClass("std.core.Object")
      const explicitFalseClass = linker.loadClass("std.core.Object", false)
      expect(defaultClass).assertEqual(explicitFalseClass)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0100
     * @tc.name testRuntimeLinkerLoadClass010
     * @tc.desc Verify loadClass can load std.core.Boolean class with getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Boolean", false)
      expect(cls.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0110
     * @tc.name testRuntimeLinkerLoadClass011
     * @tc.desc Verify loadClass can load std.core.Long class as Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Long", false)
      expect(cls.getName()).assertEqual("std.core.Long")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0120
     * @tc.name testRuntimeLinkerLoadClass012
     * @tc.desc Verify loadClass can load std.core.Float class as Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Float", false)
      expect(cls.getName()).assertEqual("std.core.Float")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0130
     * @tc.name testRuntimeLinkerLoadClass013
     * @tc.desc Verify loadClass can load std.core.Double class as Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Double", false)
      expect(cls.getName()).assertEqual("std.core.Double")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0140
     * @tc.name testRuntimeLinkerLoadClass014
     * @tc.desc Verify loadClass can load std.core.Byte class as Class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Byte", false)
      expect(cls.getName()).assertEqual("std.core.Byte")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0150
     * @tc.name testRuntimeLinkerLoadClass015
     * @tc.desc Verify loadClass throws error when passing valid name with embedded control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core\t\nString")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0160
     * @tc.name testRuntimeLinkerLoadClass016
     * @tc.desc Verify loadClass String then getType returns consistent type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", false)
      expect(cls.getName()).assertEqual("std.core.String")
      const type = linker.getType("std.core.String")
      expect(type!.toString()).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0170
     * @tc.name testRuntimeLinkerLoadClass017
     * @tc.desc Verify loadClass Object then getType returns consistent type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Object", false)
      expect(cls.getName()).assertEqual("std.core.Object")
      const type = linker.getType("std.core.Object")
      expect(type!.toString()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0180
     * @tc.name testRuntimeLinkerLoadClass018
     * @tc.desc Verify loadClass with init true then findLoadedClass returns same identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.String", true)
      const loaded = linker.findLoadedClass("std.core.String")
      expect(loaded).assertEqual(cls)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0190
     * @tc.name testRuntimeLinkerLoadClass019
     * @tc.desc Verify loadClass Boolean with init true then findLoadedClass returns same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Boolean", true)
      const loaded = linker.findLoadedClass("std.core.Boolean")!
      expect(loaded).assertEqual(cls)
      expect(loaded.getName()).assertEqual("std.core.Boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0200
     * @tc.name testRuntimeLinkerLoadClass020
     * @tc.desc Verify loadClass Object with init true then findLoadedClass getName matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Object", true)
      const loaded = linker.findLoadedClass("std.core.Object")!
      expect(loaded).assertEqual(cls)
      expect(loaded.getName()).assertEqual("std.core.Object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0210
     * @tc.name testRuntimeLinkerLoadClass021
     * @tc.desc Verify loadClass Array then getType returns valid type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Array", false)
      expect(cls.getName()).assertEqual("std.core.Array")
      const type = linker.getType("std.core.Array")
      expect(type!.toString()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0220
     * @tc.name testRuntimeLinkerLoadClass022
     * @tc.desc Verify repeated loadClass five times returns same Class identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const first = linker.loadClass("std.core.String", false)
      const second = linker.loadClass("std.core.String", false)
      const third = linker.loadClass("std.core.String", false)
      const fourth = linker.loadClass("std.core.String", false)
      const fifth = linker.loadClass("std.core.String", false)
      expect(first).assertEqual(second)
      expect(first).assertEqual(third)
      expect(first).assertEqual(fourth)
      expect(first).assertEqual(fifth)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0230
     * @tc.name testRuntimeLinkerLoadClass023
     * @tc.desc Verify loadClass with init true twice returns same Class identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls1 = linker.loadClass("std.core.String", true)
      const cls2 = linker.loadClass("std.core.String", true)
      expect(cls1).assertEqual(cls2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0240
     * @tc.name testRuntimeLinkerLoadClass024
     * @tc.desc Verify loadClass findLoadedClass and reload return same Class identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const first = linker.loadClass("std.core.String", false)
      const found = linker.findLoadedClass("std.core.String")
      const reloaded = linker.loadClass("std.core.String", false)
      expect(found).assertEqual(first)
      expect(reloaded).assertEqual(first)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0250
     * @tc.name testRuntimeLinkerLoadClass025
     * @tc.desc Verify loadClass Array returns valid Class with correct getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Array", false)
      expect(cls.getName()).assertEqual("std.core.Array")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0260
     * @tc.name testRuntimeLinkerLoadClass026
     * @tc.desc Verify loadClass Short returns correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Short", false)
      expect(cls.getName()).assertEqual("std.core.Short")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0270
     * @tc.name testRuntimeLinkerLoadClass027
     * @tc.desc Verify loadClass Char returns correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Char", false)
      expect(cls.getName()).assertEqual("std.core.Char")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0280
     * @tc.name testRuntimeLinkerLoadClass028
     * @tc.desc Verify loadClass Double returns valid class with correct getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Double", false)
      expect(cls.getName()).assertEqual("std.core.Double")
      expect(linker.findLoadedClass("std.core.Double")).assertEqual(cls)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0290
     * @tc.name testRuntimeLinkerLoadClass029
     * @tc.desc Verify loadClass Float returns valid class with correct getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Float", false)
      expect(cls.getName()).assertEqual("std.core.Float")
      expect(linker.findLoadedClass("std.core.Float")).assertEqual(cls)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0300
     * @tc.name testRuntimeLinkerLoadClass030
     * @tc.desc Verify loadClass can load escompat.Error with init true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("escompat.Error", true)
      expect(cls.getName()).assertEqual("escompat.Error")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0310
     * @tc.name testRuntimeLinkerLoadClass031
     * @tc.desc Verify loadClass init false makes std.core.Short visible to findLoadedClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Short", false)
      const found = linker.findLoadedClass("std.core.Short")
      expect(found).assertEqual(cls)
      expect(found!.getName()).assertEqual("std.core.Short")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0320
     * @tc.name testRuntimeLinkerLoadClass032
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for empty class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0330
     * @tc.name testRuntimeLinkerLoadClass033
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for spaces only class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("   ")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0340
     * @tc.name testRuntimeLinkerLoadClass034
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for zero width space class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\u200B")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0350
     * @tc.name testRuntimeLinkerLoadClass035
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for special symbol class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("!@#$%^&*()")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0360
     * @tc.name testRuntimeLinkerLoadClass036
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for script-like class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("<script>alert(1)</script>")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0370
     * @tc.name testRuntimeLinkerLoadClass037
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for very long missing class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      let longName = "runtime.linker."
      for (let index: int = 0; index < 128; index++) {
        longName += "Missing"
      }
      try {
        linker.loadClass(longName)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0380
     * @tc.name testRuntimeLinkerLoadClass038
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for Chinese class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("测试")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0390
     * @tc.name testRuntimeLinkerLoadClass039
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for Japanese class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("テスト")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0400
     * @tc.name testRuntimeLinkerLoadClass040
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for isolated surrogate class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\udc04")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0410
     * @tc.name testRuntimeLinkerLoadClass041
     * @tc.desc Verify invalid loadClass before valid std.core.String load is isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("runtime.linker.LoadInvalid0", false)
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
      const loadedClass = linker.loadClass("std.core.String", false)
      expect(loadedClass.getName()).assertEqual("std.core.String")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0420
     * @tc.name testRuntimeLinkerLoadClass042
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for class name containing newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core\nString")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0430
     * @tc.name testRuntimeLinkerLoadClass043
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for class name containing carriage return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core\rString")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0440
     * @tc.name testRuntimeLinkerLoadClass044
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for class name containing CRLF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core\r\nString")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0450
     * @tc.name testRuntimeLinkerLoadClass045
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for vertical tab class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\u000B")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0460
     * @tc.name testRuntimeLinkerLoadClass046
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for form feed class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\f")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0470
     * @tc.name testRuntimeLinkerLoadClass047
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for backspace class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\b")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0480
     * @tc.name testRuntimeLinkerLoadClass048
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for null character class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\u0000")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0490
     * @tc.name testRuntimeLinkerLoadClass049
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for replacement character class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("\uFFFD")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0500
     * @tc.name testRuntimeLinkerLoadClass050
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for Korean class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("테스트")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0510
     * @tc.name testRuntimeLinkerLoadClass051
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for Arabic class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("الاختبار")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0520
     * @tc.name testRuntimeLinkerLoadClass052
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for emoji class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("😀")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0530
     * @tc.name testRuntimeLinkerLoadClass053
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for numeric class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("12345")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0540
     * @tc.name testRuntimeLinkerLoadClass054
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for hex-style class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("0x123")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0550
     * @tc.name testRuntimeLinkerLoadClass055
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for date-style class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("2026-02-30")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0560
     * @tc.name testRuntimeLinkerLoadClass056
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for email-style class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("test@example.com")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0570
     * @tc.name testRuntimeLinkerLoadClass057
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for phone-style class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("13800138000")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0580
     * @tc.name testRuntimeLinkerLoadClass058
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for single dot class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass(".")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0590
     * @tc.name testRuntimeLinkerLoadClass059
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for leading dot class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass(".std.core.String")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0600
     * @tc.name testRuntimeLinkerLoadClass060
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for trailing dot class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core.String.")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0610
     * @tc.name testRuntimeLinkerLoadClass061
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for repeated dot class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std..core..String")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0620
     * @tc.name testRuntimeLinkerLoadClass062
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for hyphen-separated class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std-core-String")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0630
     * @tc.name testRuntimeLinkerLoadClass063
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for underscore-separated class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std_core_String")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0640
     * @tc.name testRuntimeLinkerLoadClass064
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for lowercase standard class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core.string")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0650
     * @tc.name testRuntimeLinkerLoadClass065
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for class name without package path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("String")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0660
     * @tc.name testRuntimeLinkerLoadClass066
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for wrong package path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.String")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0670
     * @tc.name testRuntimeLinkerLoadClass067
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for String class name with extra suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core.String.extra")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0680
     * @tc.name testRuntimeLinkerLoadClass068
     * @tc.desc Verify loadClass throws LinkerClassNotFoundError for Object class name with extra suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      try {
        linker.loadClass("std.core.Object.extra")
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0690
     * @tc.name testRuntimeLinkerLoadClass069
     * @tc.desc Verify loadClass can load std.core.Date with init true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Date", true)
      expect(cls.getName()).assertEqual("std.core.Date")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0700
     * @tc.name testRuntimeLinkerLoadClass070
     * @tc.desc Verify loadClass can load escompat.Error class with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("escompat.Error", false)
      expect(cls.getName()).assertEqual("escompat.Error")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0710
     * @tc.name testRuntimeLinkerLoadClass071
     * @tc.desc Verify loadClass can load std.core.Map class with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Map", false)
      expect(cls.getName()).assertEqual("std.core.Map")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0720
     * @tc.name testRuntimeLinkerLoadClass072
     * @tc.desc Verify loadClass can load std.core.Promise class with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Promise", false)
      expect(cls.getName()).assertEqual("std.core.Promise")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0730
     * @tc.name testRuntimeLinkerLoadClass073
     * @tc.desc Verify loadClass can load std.core.Date class with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const cls = linker.loadClass("std.core.Date", false)
      expect(cls.getName()).assertEqual("std.core.Date")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RUNTIME_LINKER_LOAD_CLASS_0740
     * @tc.name testRuntimeLinkerLoadClass074
     * @tc.desc Verify loadClass returns same std.core.String Class for init false and init true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRuntimeLinkerLoadClass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const linker = getBootRuntimeLinker()
      const falseClass = linker.loadClass("std.core.String", false)
      const trueClass = linker.loadClass("std.core.String", true)
      expect(trueClass).assertEqual(falseClass)
      expect(trueClass.getName()).assertEqual("std.core.String")
    });

  });
}
