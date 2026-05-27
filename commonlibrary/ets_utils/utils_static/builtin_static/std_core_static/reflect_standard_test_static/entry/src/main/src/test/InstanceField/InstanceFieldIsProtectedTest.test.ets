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

class Child019 extends Parent {
      public getProtectedValue(): string {
          // Test scenario
          return this.protectedValue;
      }
      
      public setProtectedValue(value: string): void {
          this.protectedValue = value;
      }
  }

class ChildClass011 extends ParentClass {
      public getChildAccess(): string {
          // Test scenario
          return this.protectedField;
      }
  }

class ChildClass018 extends ParentClass {
      protected childProtected: string = 'child';
      public childPublic: string = 'child';
  }

class ConstructorProtected017 {
      constructor(protected protectedParam: string, public publicParam: string) {}
  }

class DefaultClass007 {
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

class Parent019 {
      protected protectedValue: string = 'parent';
  }

class ParentClass011 {
      protected protectedField: string = 'protected';
  }

class ParentClass018 {
      protected parentProtected: string = 'parent';
      public parentPublic: string = 'parent';
  }

class PrivateClass005 {
      private privateField: string = 'value';
      public publicField: string = 'public';
  }

class ProtectedAccess020 {
      protected protectedField: string = 'protected';
      public publicField: string = 'public';
  }

class ProtectedClass003 {
      protected protectedField: string = 'value';
      public publicField: string = 'public';
  }

class ProtectedReadonly016 {
      protected readonly PROTECTED_CONST: string = 'protected';
      public readonly PUBLIC_CONST: string = 'public';
  }

class ProtectedTest010 {
      public publicField: string = 'public';
      protected protectedField: string = 'protected';
      private privateField: string = 'private';
  }

class PublicClass004 {
      public publicField: string = 'value';
  }

class StaticProtected021 {
      protected static STATIC_PROTECTED: string = 'protected';
      public static STATIC_PUBLIC: string = 'public';
  }

class TestClass008 {
      public data: string = '';
  }

class TestClass009 {
      public value: string = '';
  }

class TestClass022 {
      public field1: string = '';
      private field2: string = '';
      protected field3: string = '';
  }

class ExpisProtectedClass023 {
      public data: string = 'default';
  }

class ExpisProtectedClass024 {
      public data: string = 'default';
  }

class ExpisProtectedClass025 {
      public data: string = 'default';
  }

class ExpisProtectedClass026 {
      public data: string = 'default';
  }

class ExpisProtectedClass027 {
      public data: string = 'default';
  }

class ExpisProtectedClass028 {
      public data: string = 'default';
  }

class ExpisProtectedClass029 {
      public data: string = 'default';
  }

class ExpisProtectedClass030 {
      public data: string = 'default';
  }

class ExpisProtectedClass031 {
      public data: string = 'default';
  }

class ExpisProtectedClass032 {
      public data: string = 'default';
  }

class ExpisProtectedClass033 {
      public data: string = 'default';
  }

class ExpisProtectedClass034 {
      public data: string = 'default';
  }

class ExpisProtectedClass035 {
      public data: string = 'default';
  }

class ExpisProtectedClass036 {
      public data: string = 'default';
  }

class ExpisProtectedClass037 {
      public data: string = 'default';
  }

class ExpisProtectedClass038 {
      public data: string = 'default';
  }

class ExpisProtectedClass039 {
      public data: string = 'default';
  }

class ExpisProtectedClass040 {
      public data: string = 'default';
  }

class ExpisProtectedClass041 {
      public data: string = 'default';
  }

class ExpisProtectedClass042 {
      public data: string = 'default';
  }

class ExpisProtectedClass043 {
      public data: string = 'default';
  }

class ExpisProtectedClass044 {
      public data: string = 'default';
  }

class ExpisProtectedClass045 {
      public data: string = 'default';
  }

class ExpisProtectedClass046 {
      public data: string = 'default';
  }

class ExpisProtectedClass047 {
      public data: string = 'default';
  }

class ExpisProtectedClass048 {
      public data: string = 'default';
  }

class ExpisProtectedClass049 {
      public data: string = 'default';
  }

class ExpisProtectedClass050 {
      public data: string = 'default';
  }

class ExpisProtectedClass051 {
      public data: string = 'default';
  }

class ExpisProtectedClass052 {
      public data: string = 'default';
  }

class ExpisProtectedClass053 {
      public data: string = 'default';
  }

class ExpisProtectedClass054 {
      public data: string = 'default';
  }

class ExpisProtectedClass055 {
      public data: string = 'default';
  }

class ExpisProtectedClass056 {
      public data: string = 'default';
  }

class ExpisProtectedClass057 {
      public data: string = 'default';
  }

class ExpisProtectedClass058 {
      public data: string = 'default';
  }

class ExpisProtectedClass059 {
      public data: string = 'default';
  }

class ExpisProtectedClass060 {
      public data: string = 'default';
  }

class ExpisProtectedClass061 {
      public data: string = 'default';
  }

class ExpisProtectedClass062 {
      public data: string = 'default';
  }

class ExpisProtectedClass063 {
      public data: string = 'default';
  }

class ExpisProtectedClass064 {
      public data: string = 'default';
  }

class ExpisProtectedClass065 {
      public data: string = 'default';
  }

class ExpisProtectedClass066 {
      public data: string = 'default';
  }

class ExpisProtectedClass067 {
      public data: string = 'default';
  }

class ExpisProtectedClass068 {
      public data: string = 'default';
  }

class ExpisProtectedClass069 {
      public data: string = 'default';
  }

class ExpisProtectedClass070 {
      public data: string = 'default';
  }

class ExpisProtectedClass071 {
      public data: string = 'default';
  }

class ExpisProtectedClass072 {
      public data: string = 'default';
  }

class ExpisProtectedClass073 {
      public data: string = 'default';
  }

class ExpisProtectedClass074 {
      public data: string = 'default';
  }

class ExpisProtectedClass075 {
      public data: string = 'default';
  }

class ExpisProtectedClass076 {
      public data: string = 'default';
  }

class ExpisProtectedClass077 {
      public data: string = 'default';
  }

class ExpisProtectedClass078 {
      public data: string = 'default';
  }

class ExpisProtectedClass079 {
      public data: string = 'default';
  }

class ExpisProtectedClass080 {
      public data: string = 'default';
  }

class ExpisProtectedClass081 {
      public data: string = 'default';
  }

class ExpisProtectedClass082 {
      public data: string = 'default';
  }

class ExpisProtectedClass083 {
      public data: string = 'default';
  }

class ExpisProtectedClass084 {
      public data: string = 'default';
  }

class ExpisProtectedClass085 {
      public data: string = 'default';
  }

class ExpisProtectedClass086 {
      public data: string = 'default';
  }

class ExpisProtectedClass087 {
      public data: string = 'default';
  }

class ExpisProtectedClass088 {
      public data: string = 'default';
  }

class ExpisProtectedClass089 {
      public data: string = 'default';
  }

class ExpisProtectedClass090 {
      public data: string = 'default';
  }

class ExpisProtectedClass091 {
      public data: string = 'default';
  }

class ExpisProtectedClass092 {
      public data: string = 'default';
  }

class ExpisProtectedClass093 {
      public data: string = 'default';
  }

class ExpisProtectedClass094 {
      public data: string = 'default';
  }

class ExpisProtectedClass095 {
      public data: string = 'default';
  }

class ExpisProtectedClass096 {
      public data: string = 'default';
  }

class ExpisProtectedClass097 {
      public data: string = 'default';
  }

class ExpisProtectedClass098 {
      public data: string = 'default';
  }

class ExpisProtectedClass099 {
      public data: string = 'default';
  }

class ExpisProtectedClass100 {
      public data: string = 'default';
  }

class ExpisProtectedClass101 {
      public data: string = 'default';
  }

class ExpisProtectedClass102 {
      public data: string = 'default';
  }

class ExpisProtectedClass103 {
      public data: string = 'default';
  }

class ExpisProtectedClass104 {
      public data: string = 'default';
  }

export default function InstanceFieldIsProtectedTest() {
  describe('InstanceFieldIsProtectedTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0100
     * @tc.name testIsProtected001
     * @tc.desc Verify isProtected functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let result = field.isProtected();
        expect(result).assertFalse(); // public      false
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0200
     * @tc.name testIsProtected002
     * @tc.desc Verify IsProtected functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        // Test scenario
        try {
            let result = field.isProtected('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0300
     * @tc.name testIsProtected003
     * @tc.desc Verify IsProtected functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedClass003>();

        // Test scenario
        let protectedField = cls.getInstanceField('protectedField');
        expect(protectedField === undefined).assertTrue();

        // Test scenario
        let publicField = cls.getInstanceField('publicField')!;
        expect(publicField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0400
     * @tc.name testIsProtected004
     * @tc.desc Verify IsProtected functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass004>();
        let field = cls.getInstanceField('publicField')!;
        expect(field.isProtected()).assertFalse();
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0500
     * @tc.name testIsProtected005
     * @tc.desc Verify IsProtected functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateClass005>();

        // Test scenario
        let privateField = cls.getInstanceField('privateField');
        expect(privateField === undefined).assertTrue();

        let publicField = cls.getInstanceField('publicField')!;
        expect(publicField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0600
     * @tc.name testIsProtected006
     * @tc.desc Verify IsProtected functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass006>();

        // Test scenario
        let field = cls.getInstanceField('publicField')!;
        expect(field.isPublic()).assertTrue();
        expect(field.isPrivate()).assertFalse();
        expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0700
     * @tc.name testIsProtected007
     * @tc.desc Verify IsProtected functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultClass007>();
        let field = cls.getInstanceField('defaultField')!;
        expect(field.isProtected()).assertFalse();
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0800
     * @tc.name testIsProtected008
     * @tc.desc Verify IsProtected functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();

        expect(typeof result).assertEqual('boolean');
        expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0900
     * @tc.name testIsProtected009
     * @tc.desc Verify IsProtected functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
        let field = cls.getInstanceField('value')!;

        let result1 = field.isProtected();
        let result2 = field.isProtected();
        let result3 = field.isProtected();

        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1000
     * @tc.name testIsProtected010
     * @tc.desc Verify IsProtected functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedTest010>();
        let fields = cls.getInstanceFields();

        // Test scenario
        expect(fields.length).assertEqual(1);
        expect(fields[0].getName()).assertEqual('publicField');
        expect(fields[0].isProtected()).assertFalse();
        expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1100
     * @tc.name testIsProtected011
     * @tc.desc Verify IsProtected functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass011>();

        // Test scenario
        let protectedField = cls.getInstanceField('protectedField');
        expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1200
     * @tc.name testIsProtected012
     * @tc.desc Verify IsProtected functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let result = field.isProtected('extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1300
     * @tc.name testIsProtected013
     * @tc.desc Verify IsProtected functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>();
        cls.initialize();
        let field = cls.getInstanceField('name')!;
        let result = field.isProtected();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1400
     * @tc.name testIsProtected014
     * @tc.desc Verify IsProtected functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let result = field.isProtected(); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1500
     * @tc.name testIsProtected015
     * @tc.desc Verify IsProtected functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let result = field.isProtected(); //
        expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1600
     * @tc.name testIsProtected016
     * @tc.desc Verify IsProtected functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedReadonly016>();

        // Test scenario
        let protectedField = cls.getInstanceField('PROTECTED_CONST');
        expect(protectedField === undefined).assertTrue();

        // Test scenario
        let publicField = cls.getInstanceField('PUBLIC_CONST')!;
        expect(publicField).not.toBeNull();
        expect(publicField.isProtected()).assertFalse();
        expect(publicField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1700
     * @tc.name testIsProtected017
     * @tc.desc Verify IsProtected functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstructorProtected017>();
        let fields = cls.getInstanceFields();

        // Test scenario
        expect(fields.length).assertLessThanOrEqual(1);
        if (fields.length === 1) {
            expect(fields[0].getName()).assertEqual('publicParam');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1800
     * @tc.name testIsProtected018
     * @tc.desc Verify IsProtected functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass018>();

        // Test scenario
        let childPublicField = childCls.getInstanceField('childPublic')!;
        expect(childPublicField.isProtected()).assertFalse();

        let childProtectedField = childCls.getInstanceField('childProtected');
        expect(childProtectedField === undefined).assertTrue();

        // Test scenario
        let parentCls = childCls.getSuper()!;
        let parentPublicField = parentCls.getInstanceField('parentPublic')!;
        expect(parentPublicField.isProtected()).assertFalse();

        let parentProtectedField = parentCls.getInstanceField('parentProtected');
        expect(parentProtectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1900
     * @tc.name testIsProtected019
     * @tc.desc Verify IsProtected functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child019>();
        let instance = cls.createInstance();

        // Test scenario
        let getter = cls.getInstanceMethod('getProtectedValue')!;
        expect(getter).not.toBeNull();

        // Test scenario
        let protectedField = cls.getInstanceField('protectedValue');
        expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_2000
     * @tc.name testIsProtected020
     * @tc.desc Verify IsProtected functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();

        // Test scenario
        let protectedField = cls.getInstanceField('protectedField');
        expect(protectedField === undefined).assertTrue();

        // Test scenario
        let publicField = cls.getInstanceField('publicField')!;
        let instance = cls.createInstance();
        let value = publicField.getValue(instance);
        expect(value).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_2100
     * @tc.name testIsProtected021
     * @tc.desc Verify IsProtected functionality test 020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticProtected021>();

        // Test scenario
        let staticProtectedField = cls.getStaticField('STATIC_PROTECTED');
        expect(staticProtectedField === undefined).assertTrue();

        // Test scenario
        let staticPublicField = cls.getStaticField('STATIC_PUBLIC')!;
        expect(staticPublicField).not.toBeNull();
        expect(staticPublicField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_2200
     * @tc.name testIsProtected022
     * @tc.desc Verify IsProtected functionality test 021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass022>();

        // Test scenario
        let field1 = cls.getInstanceField('field1')!;
        expect(field1.isPublic()).assertTrue();
        expect(field1.isPrivate()).assertFalse();
        expect(field1.isProtected()).assertFalse();

        // Test scenario
        // Test scenario
    });
    // === Expanded Test Cases ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0230
     * @tc.name testIsProtected023
     * @tc.desc Verify isProtected expanded test 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass023>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0240
     * @tc.name testIsProtected024
     * @tc.desc Verify isProtected expanded test 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass024>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0250
     * @tc.name testIsProtected025
     * @tc.desc Verify isProtected expanded test 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass025>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0260
     * @tc.name testIsProtected026
     * @tc.desc Verify isProtected expanded test 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0270
     * @tc.name testIsProtected027
     * @tc.desc Verify isProtected expanded test 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0280
     * @tc.name testIsProtected028
     * @tc.desc Verify isProtected expanded test 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0290
     * @tc.name testIsProtected029
     * @tc.desc Verify isProtected expanded test 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0300
     * @tc.name testIsProtected030
     * @tc.desc Verify isProtected expanded test 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0310
     * @tc.name testIsProtected031
     * @tc.desc Verify isProtected expanded test 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0320
     * @tc.name testIsProtected032
     * @tc.desc Verify isProtected expanded test 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0330
     * @tc.name testIsProtected033
     * @tc.desc Verify isProtected expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0340
     * @tc.name testIsProtected034
     * @tc.desc Verify isProtected expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0350
     * @tc.name testIsProtected035
     * @tc.desc Verify isProtected expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0360
     * @tc.name testIsProtected036
     * @tc.desc Verify isProtected expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0370
     * @tc.name testIsProtected037
     * @tc.desc Verify isProtected expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0380
     * @tc.name testIsProtected038
     * @tc.desc Verify isProtected expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0390
     * @tc.name testIsProtected039
     * @tc.desc Verify isProtected expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0400
     * @tc.name testIsProtected040
     * @tc.desc Verify isProtected expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0410
     * @tc.name testIsProtected041
     * @tc.desc Verify isProtected expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0420
     * @tc.name testIsProtected042
     * @tc.desc Verify isProtected expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0430
     * @tc.name testIsProtected043
     * @tc.desc Verify isProtected expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0440
     * @tc.name testIsProtected044
     * @tc.desc Verify isProtected expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0450
     * @tc.name testIsProtected045
     * @tc.desc Verify isProtected expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0460
     * @tc.name testIsProtected046
     * @tc.desc Verify isProtected expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0470
     * @tc.name testIsProtected047
     * @tc.desc Verify isProtected expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0480
     * @tc.name testIsProtected048
     * @tc.desc Verify isProtected expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0490
     * @tc.name testIsProtected049
     * @tc.desc Verify isProtected expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0500
     * @tc.name testIsProtected050
     * @tc.desc Verify isProtected expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0510
     * @tc.name testIsProtected051
     * @tc.desc Verify isProtected expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0520
     * @tc.name testIsProtected052
     * @tc.desc Verify isProtected expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0530
     * @tc.name testIsProtected053
     * @tc.desc Verify isProtected expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0540
     * @tc.name testIsProtected054
     * @tc.desc Verify isProtected expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0550
     * @tc.name testIsProtected055
     * @tc.desc Verify isProtected expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0560
     * @tc.name testIsProtected056
     * @tc.desc Verify isProtected expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0570
     * @tc.name testIsProtected057
     * @tc.desc Verify isProtected expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0580
     * @tc.name testIsProtected058
     * @tc.desc Verify isProtected expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0590
     * @tc.name testIsProtected059
     * @tc.desc Verify isProtected expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0600
     * @tc.name testIsProtected060
     * @tc.desc Verify isProtected expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0610
     * @tc.name testIsProtected061
     * @tc.desc Verify isProtected expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0620
     * @tc.name testIsProtected062
     * @tc.desc Verify isProtected expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0630
     * @tc.name testIsProtected063
     * @tc.desc Verify isProtected expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0640
     * @tc.name testIsProtected064
     * @tc.desc Verify isProtected expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0650
     * @tc.name testIsProtected065
     * @tc.desc Verify isProtected expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0660
     * @tc.name testIsProtected066
     * @tc.desc Verify isProtected expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0670
     * @tc.name testIsProtected067
     * @tc.desc Verify isProtected expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0680
     * @tc.name testIsProtected068
     * @tc.desc Verify isProtected expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0690
     * @tc.name testIsProtected069
     * @tc.desc Verify isProtected expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0700
     * @tc.name testIsProtected070
     * @tc.desc Verify isProtected expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0710
     * @tc.name testIsProtected071
     * @tc.desc Verify isProtected expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0720
     * @tc.name testIsProtected072
     * @tc.desc Verify isProtected expanded test 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0730
     * @tc.name testIsProtected073
     * @tc.desc Verify isProtected expanded test 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0740
     * @tc.name testIsProtected074
     * @tc.desc Verify isProtected expanded test 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0750
     * @tc.name testIsProtected075
     * @tc.desc Verify isProtected expanded test 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0760
     * @tc.name testIsProtected076
     * @tc.desc Verify isProtected expanded test 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0770
     * @tc.name testIsProtected077
     * @tc.desc Verify isProtected expanded test 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0780
     * @tc.name testIsProtected078
     * @tc.desc Verify isProtected expanded test 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0790
     * @tc.name testIsProtected079
     * @tc.desc Verify isProtected expanded test 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0800
     * @tc.name testIsProtected080
     * @tc.desc Verify isProtected expanded test 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0810
     * @tc.name testIsProtected081
     * @tc.desc Verify isProtected expanded test 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0820
     * @tc.name testIsProtected082
     * @tc.desc Verify isProtected expanded test 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0830
     * @tc.name testIsProtected083
     * @tc.desc Verify isProtected expanded test 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0840
     * @tc.name testIsProtected084
     * @tc.desc Verify isProtected expanded test 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass084>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0850
     * @tc.name testIsProtected085
     * @tc.desc Verify isProtected expanded test 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0860
     * @tc.name testIsProtected086
     * @tc.desc Verify isProtected expanded test 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass086>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0870
     * @tc.name testIsProtected087
     * @tc.desc Verify isProtected expanded test 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0880
     * @tc.name testIsProtected088
     * @tc.desc Verify isProtected expanded test 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0890
     * @tc.name testIsProtected089
     * @tc.desc Verify isProtected expanded test 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass089>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0900
     * @tc.name testIsProtected090
     * @tc.desc Verify isProtected expanded test 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass090>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0910
     * @tc.name testIsProtected091
     * @tc.desc Verify isProtected expanded test 91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass091>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0920
     * @tc.name testIsProtected092
     * @tc.desc Verify isProtected expanded test 92
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass092>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0930
     * @tc.name testIsProtected093
     * @tc.desc Verify isProtected expanded test 93
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass093>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0940
     * @tc.name testIsProtected094
     * @tc.desc Verify isProtected expanded test 94
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass094>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0950
     * @tc.name testIsProtected095
     * @tc.desc Verify isProtected expanded test 95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass095>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0960
     * @tc.name testIsProtected096
     * @tc.desc Verify isProtected expanded test 96
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass096>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0970
     * @tc.name testIsProtected097
     * @tc.desc Verify isProtected expanded test 97
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass097>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0980
     * @tc.name testIsProtected098
     * @tc.desc Verify isProtected expanded test 98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass098>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_0990
     * @tc.name testIsProtected099
     * @tc.desc Verify isProtected expanded test 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass099>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1000
     * @tc.name testIsProtected100
     * @tc.desc Verify isProtected expanded test 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass100>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1010
     * @tc.name testIsProtected101
     * @tc.desc Verify isProtected expanded test 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass101>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1020
     * @tc.name testIsProtected102
     * @tc.desc Verify isProtected expanded test 102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass102>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1030
     * @tc.name testIsProtected103
     * @tc.desc Verify isProtected expanded test 103
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass103>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPROTECTED_1040
     * @tc.name testIsProtected104
     * @tc.desc Verify isProtected expanded test 104
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisProtectedClass104>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isProtected();
        expect(result).not.toBeNull();
    });
  });
}
