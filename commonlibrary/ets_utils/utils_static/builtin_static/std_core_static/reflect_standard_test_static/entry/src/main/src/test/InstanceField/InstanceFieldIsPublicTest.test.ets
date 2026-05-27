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

class AccessClass004 {
      private privateField: string = '';
      protected protectedField: string = '';
      internal internalField: string = '';
  }

class AccessibleClass020 {
      public accessible: string = 'original';
  }

class ChildClass007 extends ParentClass {
      public ownPublic: string = 'child';
  }

class DefaultClass005 {
      // Test scenario
      defaultField: string = 'value';
  }

class ModifierClass006 {
      public publicField: string = 'public';
      private privateField: string = 'private';
      protected protectedField: string = 'protected';
  }

class MyClass001 {
      public name: string = 'test';
  }

class ParentClass007 {
      public inheritedPublic: string = 'parent';
  }

class PublicClass003 {
      public publicField: string = 'value';
  }

class PublicReadonly016 {
      public readonly value: string = 'public readonly';
  }

class PublicStatic017 {
      public static STATIC_VALUE: string = 'static';
  }

class TestClass008 {
      public data: string = '';
  }

class TestClass009 {
      public value: string = '';
  }

class TestClass019 {
      public data: string = '';
  }

class TestClass021 {
      public field1: string = '';
      private field2: string = '';
      protected field3: string = '';
  }

class VariousTypes014 {
      public str: string = '';
      public num: number = 0;
      public bool: boolean = false;
      public arr: Array<int> = [];
      public obj: Object = {};
      public nullable: string | null = null;
  }

class VisibilityClass018 {
      public visible: string = 'visible';
      private invisible: string = 'invisible';
      protected alsoInvisible: string = 'protected';
      internal maybeVisible: string = 'internal';
  }

class ExpisPublicClass022 {
      public data: string = 'default';
  }

class ExpisPublicClass023 {
      public data: string = 'default';
  }

class ExpisPublicClass024 {
      public data: string = 'default';
  }

class ExpisPublicClass025 {
      public data: string = 'default';
  }

class ExpisPublicClass026 {
      public data: string = 'default';
  }

class ExpisPublicClass027 {
      public data: string = 'default';
  }

class ExpisPublicClass028 {
      public data: string = 'default';
  }

class ExpisPublicClass029 {
      public data: string = 'default';
  }

class ExpisPublicClass030 {
      public data: string = 'default';
  }

class ExpisPublicClass031 {
      public data: string = 'default';
  }

class ExpisPublicClass032 {
      public data: string = 'default';
  }

class ExpisPublicClass033 {
      public data: string = 'default';
  }

class ExpisPublicClass034 {
      public data: string = 'default';
  }

class ExpisPublicClass035 {
      public data: string = 'default';
  }

class ExpisPublicClass036 {
      public data: string = 'default';
  }

class ExpisPublicClass037 {
      public data: string = 'default';
  }

class ExpisPublicClass038 {
      public data: string = 'default';
  }

class ExpisPublicClass039 {
      public data: string = 'default';
  }

class ExpisPublicClass040 {
      public data: string = 'default';
  }

class ExpisPublicClass041 {
      public data: string = 'default';
  }

class ExpisPublicClass042 {
      public data: string = 'default';
  }

class ExpisPublicClass043 {
      public data: string = 'default';
  }

class ExpisPublicClass044 {
      public data: string = 'default';
  }

class ExpisPublicClass045 {
      public data: string = 'default';
  }

class ExpisPublicClass046 {
      public data: string = 'default';
  }

class ExpisPublicClass047 {
      public data: string = 'default';
  }

class ExpisPublicClass048 {
      public data: string = 'default';
  }

class ExpisPublicClass049 {
      public data: string = 'default';
  }

class ExpisPublicClass050 {
      public data: string = 'default';
  }

class ExpisPublicClass051 {
      public data: string = 'default';
  }

class ExpisPublicClass052 {
      public data: string = 'default';
  }

class ExpisPublicClass053 {
      public data: string = 'default';
  }

class ExpisPublicClass054 {
      public data: string = 'default';
  }

class ExpisPublicClass055 {
      public data: string = 'default';
  }

class ExpisPublicClass056 {
      public data: string = 'default';
  }

class ExpisPublicClass057 {
      public data: string = 'default';
  }

class ExpisPublicClass058 {
      public data: string = 'default';
  }

class ExpisPublicClass059 {
      public data: string = 'default';
  }

class ExpisPublicClass060 {
      public data: string = 'default';
  }

class ExpisPublicClass061 {
      public data: string = 'default';
  }

class ExpisPublicClass062 {
      public data: string = 'default';
  }

class ExpisPublicClass063 {
      public data: string = 'default';
  }

class ExpisPublicClass064 {
      public data: string = 'default';
  }

class ExpisPublicClass065 {
      public data: string = 'default';
  }

class ExpisPublicClass066 {
      public data: string = 'default';
  }

class ExpisPublicClass067 {
      public data: string = 'default';
  }

class ExpisPublicClass068 {
      public data: string = 'default';
  }

class ExpisPublicClass069 {
      public data: string = 'default';
  }

class ExpisPublicClass070 {
      public data: string = 'default';
  }

class ExpisPublicClass071 {
      public data: string = 'default';
  }

class ExpisPublicClass072 {
      public data: string = 'default';
  }

class ExpisPublicClass073 {
      public data: string = 'default';
  }

class ExpisPublicClass074 {
      public data: string = 'default';
  }

class ExpisPublicClass075 {
      public data: string = 'default';
  }

class ExpisPublicClass076 {
      public data: string = 'default';
  }

class ExpisPublicClass077 {
      public data: string = 'default';
  }

class ExpisPublicClass078 {
      public data: string = 'default';
  }

class ExpisPublicClass079 {
      public data: string = 'default';
  }

class ExpisPublicClass080 {
      public data: string = 'default';
  }

class ExpisPublicClass081 {
      public data: string = 'default';
  }

class ExpisPublicClass082 {
      public data: string = 'default';
  }

class ExpisPublicClass083 {
      public data: string = 'default';
  }

class ExpisPublicClass084 {
      public data: string = 'default';
  }

class ExpisPublicClass085 {
      public data: string = 'default';
  }

class ExpisPublicClass086 {
      public data: string = 'default';
  }

class ExpisPublicClass087 {
      public data: string = 'default';
  }

class ExpisPublicClass088 {
      public data: string = 'default';
  }

class ExpisPublicClass089 {
      public data: string = 'default';
  }

class ExpisPublicClass090 {
      public data: string = 'default';
  }

class ExpisPublicClass091 {
      public data: string = 'default';
  }

class ExpisPublicClass092 {
      public data: string = 'default';
  }

class ExpisPublicClass093 {
      public data: string = 'default';
  }

class ExpisPublicClass094 {
      public data: string = 'default';
  }

class ExpisPublicClass095 {
      public data: string = 'default';
  }

class ExpisPublicClass096 {
      public data: string = 'default';
  }

class ExpisPublicClass097 {
      public data: string = 'default';
  }

class ExpisPublicClass098 {
      public data: string = 'default';
  }

class ExpisPublicClass099 {
      public data: string = 'default';
  }

class ExpisPublicClass100 {
      public data: string = 'default';
  }

class ExpisPublicClass101 {
      public data: string = 'default';
  }


interface MyInterface {
    field: string;
}

class ImplClass implements MyInterface {
    public field: string = '';
}


export default function InstanceFieldIsPublicTest() {
  describe('InstanceFieldIsPublicTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0100
     * @tc.name testIsPublic001
     * @tc.desc Verify isPublic functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let result = field.isPublic();
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0200
     * @tc.name testIsPublic002
     * @tc.desc Verify IsPublic functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        // Test scenario
        try {
            let result = field.isPublic('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0300
     * @tc.name testIsPublic003
     * @tc.desc Verify IsPublic functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass003>();
        let field = cls.getInstanceField('publicField')!;
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0400
     * @tc.name testIsPublic004
     * @tc.desc Verify IsPublic functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AccessClass004>();

        // Test scenario
        let privateField = cls.getInstanceField('privateField');
        expect(privateField === undefined).assertTrue();

        let protectedField = cls.getInstanceField('protectedField');
        expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0500
     * @tc.name testIsPublic005
     * @tc.desc Verify IsPublic functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultClass005>();
        let field = cls.getInstanceField('defaultField')!;
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0600
     * @tc.name testIsPublic006
     * @tc.desc Verify IsPublic functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass006>();

        let field = cls.getInstanceField('publicField')!;
        expect(field.isPublic()).assertTrue();
        expect(field.isPrivate()).assertFalse();
        expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0700
     * @tc.name testIsPublic007
     * @tc.desc Verify IsPublic functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass007>();

        // Test scenario
        let ownField = childCls.getInstanceField('ownPublic')!;
        expect(ownField.isPublic()).assertTrue();

        // Test scenario
        let parentCls = childCls.getSuper()!;
        let inheritedField = parentCls.getInstanceField('inheritedPublic')!;
        expect(inheritedField.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0800
     * @tc.name testIsPublic008
     * @tc.desc Verify IsPublic functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();

        expect(typeof result).assertEqual('boolean');
        expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0900
     * @tc.name testIsPublic009
     * @tc.desc Verify IsPublic functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
        let field = cls.getInstanceField('value')!;

        let result1 = field.isPublic();
        let result2 = field.isPublic();
        let result3 = field.isPublic();

        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1000
     * @tc.name testIsPublic010
     * @tc.desc Verify IsPublic functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let result = field.isPublic('extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1100
     * @tc.name testIsPublic011
     * @tc.desc Verify IsPublic functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>();
        cls.initialize();
        let field = cls.getInstanceField('name')!;
        let result = field.isPublic();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1200
     * @tc.name testIsPublic012
     * @tc.desc Verify IsPublic functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let result = field.isPublic(); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1300
     * @tc.name testIsPublic013
     * @tc.desc Verify IsPublic functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let result = field.isPublic(); //
        expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1400
     * @tc.name testIsPublic014
     * @tc.desc Verify IsPublic functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<VariousTypes014>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            expect(fields[i].isPublic()).assertTrue();
            expect(fields[i].isPrivate()).assertFalse();
            expect(fields[i].isProtected()).assertFalse();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1500
     * @tc.name testIsPublic015
     * @tc.desc Verify IsPublic functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        let cls = Class.from<ImplClass>();
        let field = cls.getInstanceField('field')!;
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1600
     * @tc.name testIsPublic016
     * @tc.desc Verify IsPublic functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicReadonly016>();
        let field = cls.getInstanceField('value')!;

        expect(field.isPublic()).assertTrue();
        expect(field.isReadonly()).assertTrue();
        expect(field.isPrivate()).assertFalse();
        expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1700
     * @tc.name testIsPublic017
     * @tc.desc Verify IsPublic functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicStatic017>();
        let field = cls.getStaticField('STATIC_VALUE')!;

        expect(field.isPublic()).assertTrue();
        expect(field.isPrivate()).assertFalse();
        expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1800
     * @tc.name testIsPublic018
     * @tc.desc Verify IsPublic functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<VisibilityClass018>();
        let fields = cls.getInstanceFields();

        // Test scenario
        expect(fields.length).assertEqual(1);
        expect(fields[0].getName()).assertEqual('visible');
        expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_1900
     * @tc.name testIsPublic019
     * @tc.desc Verify IsPublic functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass019>();
        let field = cls.getInstanceField('data')!;

        // Test scenario
        for (let i = 0; i < 1000; i++) {
            let result = field.isPublic();
            expect(result).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_2000
     * @tc.name testIsPublic020
     * @tc.desc Verify IsPublic functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AccessibleClass020>();
        let field = cls.getInstanceField('accessible')!;
        let instance = cls.createInstance();

        // Test scenario
        let value = field.getValue(instance);
        expect(value).assertEqual('original');

        // Test scenario
        field.setValue(instance, 'modified');
        expect(field.getValue(instance)).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_2100
     * @tc.name testIsPublic021
     * @tc.desc Verify IsPublic functionality test 020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();

        // Test scenario
        let field1 = cls.getInstanceField('field1')!;
        expect(field1.isPublic()).assertTrue();
        expect(field1.isPrivate()).assertFalse();
        expect(field1.isProtected()).assertFalse();

        // Test scenario
        let field2 = cls.getInstanceField('field2');
        expect(field2 === undefined).assertTrue();

        // Test scenario
        let field3 = cls.getInstanceField('field3');
        expect(field3 === undefined).assertTrue();
    });
    // === Expanded Test Cases ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0220
     * @tc.name testIsPublic022
     * @tc.desc Verify isPublic expanded test 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass022>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0230
     * @tc.name testIsPublic023
     * @tc.desc Verify isPublic expanded test 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass023>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0240
     * @tc.name testIsPublic024
     * @tc.desc Verify isPublic expanded test 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass024>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0250
     * @tc.name testIsPublic025
     * @tc.desc Verify isPublic expanded test 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass025>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0260
     * @tc.name testIsPublic026
     * @tc.desc Verify isPublic expanded test 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0270
     * @tc.name testIsPublic027
     * @tc.desc Verify isPublic expanded test 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0280
     * @tc.name testIsPublic028
     * @tc.desc Verify isPublic expanded test 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0290
     * @tc.name testIsPublic029
     * @tc.desc Verify isPublic expanded test 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0300
     * @tc.name testIsPublic030
     * @tc.desc Verify isPublic expanded test 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0310
     * @tc.name testIsPublic031
     * @tc.desc Verify isPublic expanded test 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0320
     * @tc.name testIsPublic032
     * @tc.desc Verify isPublic expanded test 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0330
     * @tc.name testIsPublic033
     * @tc.desc Verify isPublic expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0340
     * @tc.name testIsPublic034
     * @tc.desc Verify isPublic expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0350
     * @tc.name testIsPublic035
     * @tc.desc Verify isPublic expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0360
     * @tc.name testIsPublic036
     * @tc.desc Verify isPublic expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0370
     * @tc.name testIsPublic037
     * @tc.desc Verify isPublic expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0380
     * @tc.name testIsPublic038
     * @tc.desc Verify isPublic expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0390
     * @tc.name testIsPublic039
     * @tc.desc Verify isPublic expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0400
     * @tc.name testIsPublic040
     * @tc.desc Verify isPublic expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0410
     * @tc.name testIsPublic041
     * @tc.desc Verify isPublic expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0420
     * @tc.name testIsPublic042
     * @tc.desc Verify isPublic expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0430
     * @tc.name testIsPublic043
     * @tc.desc Verify isPublic expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0440
     * @tc.name testIsPublic044
     * @tc.desc Verify isPublic expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0450
     * @tc.name testIsPublic045
     * @tc.desc Verify isPublic expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0460
     * @tc.name testIsPublic046
     * @tc.desc Verify isPublic expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0470
     * @tc.name testIsPublic047
     * @tc.desc Verify isPublic expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0480
     * @tc.name testIsPublic048
     * @tc.desc Verify isPublic expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0490
     * @tc.name testIsPublic049
     * @tc.desc Verify isPublic expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0500
     * @tc.name testIsPublic050
     * @tc.desc Verify isPublic expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0510
     * @tc.name testIsPublic051
     * @tc.desc Verify isPublic expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0520
     * @tc.name testIsPublic052
     * @tc.desc Verify isPublic expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0530
     * @tc.name testIsPublic053
     * @tc.desc Verify isPublic expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0540
     * @tc.name testIsPublic054
     * @tc.desc Verify isPublic expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0550
     * @tc.name testIsPublic055
     * @tc.desc Verify isPublic expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0560
     * @tc.name testIsPublic056
     * @tc.desc Verify isPublic expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0570
     * @tc.name testIsPublic057
     * @tc.desc Verify isPublic expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0580
     * @tc.name testIsPublic058
     * @tc.desc Verify isPublic expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0590
     * @tc.name testIsPublic059
     * @tc.desc Verify isPublic expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0600
     * @tc.name testIsPublic060
     * @tc.desc Verify isPublic expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0610
     * @tc.name testIsPublic061
     * @tc.desc Verify isPublic expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0620
     * @tc.name testIsPublic062
     * @tc.desc Verify isPublic expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0630
     * @tc.name testIsPublic063
     * @tc.desc Verify isPublic expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0640
     * @tc.name testIsPublic064
     * @tc.desc Verify isPublic expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0650
     * @tc.name testIsPublic065
     * @tc.desc Verify isPublic expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0660
     * @tc.name testIsPublic066
     * @tc.desc Verify isPublic expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0670
     * @tc.name testIsPublic067
     * @tc.desc Verify isPublic expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0680
     * @tc.name testIsPublic068
     * @tc.desc Verify isPublic expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0690
     * @tc.name testIsPublic069
     * @tc.desc Verify isPublic expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0700
     * @tc.name testIsPublic070
     * @tc.desc Verify isPublic expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0710
     * @tc.name testIsPublic071
     * @tc.desc Verify isPublic expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0720
     * @tc.name testIsPublic072
     * @tc.desc Verify isPublic expanded test 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0730
     * @tc.name testIsPublic073
     * @tc.desc Verify isPublic expanded test 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0740
     * @tc.name testIsPublic074
     * @tc.desc Verify isPublic expanded test 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0750
     * @tc.name testIsPublic075
     * @tc.desc Verify isPublic expanded test 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0760
     * @tc.name testIsPublic076
     * @tc.desc Verify isPublic expanded test 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0770
     * @tc.name testIsPublic077
     * @tc.desc Verify isPublic expanded test 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0780
     * @tc.name testIsPublic078
     * @tc.desc Verify isPublic expanded test 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0790
     * @tc.name testIsPublic079
     * @tc.desc Verify isPublic expanded test 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0800
     * @tc.name testIsPublic080
     * @tc.desc Verify isPublic expanded test 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0810
     * @tc.name testIsPublic081
     * @tc.desc Verify isPublic expanded test 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0820
     * @tc.name testIsPublic082
     * @tc.desc Verify isPublic expanded test 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0830
     * @tc.name testIsPublic083
     * @tc.desc Verify isPublic expanded test 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0840
     * @tc.name testIsPublic084
     * @tc.desc Verify isPublic expanded test 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass084>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0850
     * @tc.name testIsPublic085
     * @tc.desc Verify isPublic expanded test 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0860
     * @tc.name testIsPublic086
     * @tc.desc Verify isPublic expanded test 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass086>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0870
     * @tc.name testIsPublic087
     * @tc.desc Verify isPublic expanded test 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0880
     * @tc.name testIsPublic088
     * @tc.desc Verify isPublic expanded test 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0890
     * @tc.name testIsPublic089
     * @tc.desc Verify isPublic expanded test 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass089>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0900
     * @tc.name testIsPublic090
     * @tc.desc Verify isPublic expanded test 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass090>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0910
     * @tc.name testIsPublic091
     * @tc.desc Verify isPublic expanded test 91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass091>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0920
     * @tc.name testIsPublic092
     * @tc.desc Verify isPublic expanded test 92
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass092>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0930
     * @tc.name testIsPublic093
     * @tc.desc Verify isPublic expanded test 93
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass093>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPUBLIC_0940
     * @tc.name testIsPublic094
     * @tc.desc Verify isPublic expanded test 94
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPublicClass094>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPublic();
        expect(result).not.toBeNull();
    });
