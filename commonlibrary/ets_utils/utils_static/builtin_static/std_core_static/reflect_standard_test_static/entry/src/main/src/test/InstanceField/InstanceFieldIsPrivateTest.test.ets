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

class ChildClass018 extends ParentClass {
      private childPrivate: string = 'child';
      public childPublic: string = 'child';
  }

class ConstructorPrivate017 {
      constructor(private privateParam: string, public publicParam: string) {}
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

class ParentClass018 {
      private parentPrivate: string = 'parent';
      public parentPublic: string = 'parent';
  }

class PrivateAccess019 {
      private privateField: string = 'secret';
      public publicField: string = 'public';
  }

class PrivateClass003 {
      private privateField: string = 'value';
      public publicField: string = 'public';
  }

class PrivateReadonly016 {
      private readonly PRIVATE_CONST: string = 'private';
      public readonly PUBLIC_CONST: string = 'public';
  }

class PrivateTest010 {
      public publicField: string = 'public';
      private privateField: string = 'private';
  }

class ProtectedClass005 {
      protected protectedField: string = 'value';
      public publicField: string = 'public';
  }

class PublicClass004 {
      public publicField: string = 'value';
  }

class StaticPrivate020 {
      private static STATIC_PRIVATE: string = 'private';
      public static STATIC_PUBLIC: string = 'public';
  }

class TestClass008 {
      public data: string = '';
  }

class TestClass009 {
      public value: string = '';
  }

class TestClass011 {
      public field: string = '';
  }

class TestClass021 {
      public field1: string = '';
      private field2: string = '';
      protected field3: string = '';
  }

class ExpisPrivateClass022 {
      public data: string = 'default';
  }

class ExpisPrivateClass023 {
      public data: string = 'default';
  }

class ExpisPrivateClass024 {
      public data: string = 'default';
  }

class ExpisPrivateClass025 {
      public data: string = 'default';
  }

class ExpisPrivateClass026 {
      public data: string = 'default';
  }

class ExpisPrivateClass027 {
      public data: string = 'default';
  }

class ExpisPrivateClass028 {
      public data: string = 'default';
  }

class ExpisPrivateClass029 {
      public data: string = 'default';
  }

class ExpisPrivateClass030 {
      public data: string = 'default';
  }

class ExpisPrivateClass031 {
      public data: string = 'default';
  }

class ExpisPrivateClass032 {
      public data: string = 'default';
  }

class ExpisPrivateClass033 {
      public data: string = 'default';
  }

class ExpisPrivateClass034 {
      public data: string = 'default';
  }

class ExpisPrivateClass035 {
      public data: string = 'default';
  }

class ExpisPrivateClass036 {
      public data: string = 'default';
  }

class ExpisPrivateClass037 {
      public data: string = 'default';
  }

class ExpisPrivateClass038 {
      public data: string = 'default';
  }

class ExpisPrivateClass039 {
      public data: string = 'default';
  }

class ExpisPrivateClass040 {
      public data: string = 'default';
  }

class ExpisPrivateClass041 {
      public data: string = 'default';
  }

class ExpisPrivateClass042 {
      public data: string = 'default';
  }

class ExpisPrivateClass043 {
      public data: string = 'default';
  }

class ExpisPrivateClass044 {
      public data: string = 'default';
  }

class ExpisPrivateClass045 {
      public data: string = 'default';
  }

class ExpisPrivateClass046 {
      public data: string = 'default';
  }

class ExpisPrivateClass047 {
      public data: string = 'default';
  }

class ExpisPrivateClass048 {
      public data: string = 'default';
  }

class ExpisPrivateClass049 {
      public data: string = 'default';
  }

class ExpisPrivateClass050 {
      public data: string = 'default';
  }

class ExpisPrivateClass051 {
      public data: string = 'default';
  }

class ExpisPrivateClass052 {
      public data: string = 'default';
  }

class ExpisPrivateClass053 {
      public data: string = 'default';
  }

class ExpisPrivateClass054 {
      public data: string = 'default';
  }

class ExpisPrivateClass055 {
      public data: string = 'default';
  }

class ExpisPrivateClass056 {
      public data: string = 'default';
  }

class ExpisPrivateClass057 {
      public data: string = 'default';
  }

class ExpisPrivateClass058 {
      public data: string = 'default';
  }

class ExpisPrivateClass059 {
      public data: string = 'default';
  }

class ExpisPrivateClass060 {
      public data: string = 'default';
  }

class ExpisPrivateClass061 {
      public data: string = 'default';
  }

class ExpisPrivateClass062 {
      public data: string = 'default';
  }

class ExpisPrivateClass063 {
      public data: string = 'default';
  }

class ExpisPrivateClass064 {
      public data: string = 'default';
  }

class ExpisPrivateClass065 {
      public data: string = 'default';
  }

class ExpisPrivateClass066 {
      public data: string = 'default';
  }

class ExpisPrivateClass067 {
      public data: string = 'default';
  }

class ExpisPrivateClass068 {
      public data: string = 'default';
  }

class ExpisPrivateClass069 {
      public data: string = 'default';
  }

class ExpisPrivateClass070 {
      public data: string = 'default';
  }

class ExpisPrivateClass071 {
      public data: string = 'default';
  }

class ExpisPrivateClass072 {
      public data: string = 'default';
  }

class ExpisPrivateClass073 {
      public data: string = 'default';
  }

class ExpisPrivateClass074 {
      public data: string = 'default';
  }

class ExpisPrivateClass075 {
      public data: string = 'default';
  }

class ExpisPrivateClass076 {
      public data: string = 'default';
  }

class ExpisPrivateClass077 {
      public data: string = 'default';
  }

class ExpisPrivateClass078 {
      public data: string = 'default';
  }

class ExpisPrivateClass079 {
      public data: string = 'default';
  }

class ExpisPrivateClass080 {
      public data: string = 'default';
  }

class ExpisPrivateClass081 {
      public data: string = 'default';
  }

class ExpisPrivateClass082 {
      public data: string = 'default';
  }

class ExpisPrivateClass083 {
      public data: string = 'default';
  }

class ExpisPrivateClass084 {
      public data: string = 'default';
  }

class ExpisPrivateClass085 {
      public data: string = 'default';
  }

class ExpisPrivateClass086 {
      public data: string = 'default';
  }

class ExpisPrivateClass087 {
      public data: string = 'default';
  }

class ExpisPrivateClass088 {
      public data: string = 'default';
  }

class ExpisPrivateClass089 {
      public data: string = 'default';
  }

class ExpisPrivateClass090 {
      public data: string = 'default';
  }

class ExpisPrivateClass091 {
      public data: string = 'default';
  }

class ExpisPrivateClass092 {
      public data: string = 'default';
  }

class ExpisPrivateClass093 {
      public data: string = 'default';
  }

class ExpisPrivateClass094 {
      public data: string = 'default';
  }

class ExpisPrivateClass095 {
      public data: string = 'default';
  }

class ExpisPrivateClass096 {
      public data: string = 'default';
  }

class ExpisPrivateClass097 {
      public data: string = 'default';
  }

class ExpisPrivateClass098 {
      public data: string = 'default';
  }

class ExpisPrivateClass099 {
      public data: string = 'default';
  }

class ExpisPrivateClass100 {
      public data: string = 'default';
  }

class ExpisPrivateClass101 {
      public data: string = 'default';
  }

export default function InstanceFieldIsPrivateTest() {
  describe('InstanceFieldIsPrivateTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0100
     * @tc.name testIsPrivate001
     * @tc.desc Verify isPrivate functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let result = field.isPrivate();
        expect(result).assertFalse(); // public      false
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0200
     * @tc.name testIsPrivate002
     * @tc.desc Verify IsPrivate functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        // Test scenario
        try {
            let result = field.isPrivate('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0300
     * @tc.name testIsPrivate003
     * @tc.desc Verify IsPrivate functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateClass003>();

        // Test scenario
        let privateField = cls.getInstanceField('privateField');
        expect(privateField === undefined).assertTrue();

        // Test scenario
        let publicField = cls.getInstanceField('publicField')!;
        expect(publicField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0400
     * @tc.name testIsPrivate004
     * @tc.desc Verify IsPrivate functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass004>();
        let field = cls.getInstanceField('publicField')!;
        expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0500
     * @tc.name testIsPrivate005
     * @tc.desc Verify IsPrivate functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedClass005>();

        // Test scenario
        let protectedField = cls.getInstanceField('protectedField');
        expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0600
     * @tc.name testIsPrivate006
     * @tc.desc Verify IsPrivate functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass006>();

        // Test scenario
        let field = cls.getInstanceField('publicField')!;
        expect(field.isPublic()).assertTrue();
        expect(field.isPrivate()).assertFalse();
        expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0700
     * @tc.name testIsPrivate007
     * @tc.desc Verify IsPrivate functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultClass007>();
        let field = cls.getInstanceField('defaultField')!;
        expect(field.isPrivate()).assertFalse();
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0800
     * @tc.name testIsPrivate008
     * @tc.desc Verify IsPrivate functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();

        expect(typeof result).assertEqual('boolean');
        expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0900
     * @tc.name testIsPrivate009
     * @tc.desc Verify IsPrivate functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
        let field = cls.getInstanceField('value')!;

        let result1 = field.isPrivate();
        let result2 = field.isPrivate();
        let result3 = field.isPrivate();

        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        expect(result1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1000
     * @tc.name testIsPrivate010
     * @tc.desc Verify IsPrivate functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateTest010>();
        let fields = cls.getInstanceFields();

        // Test scenario
        expect(fields.length).assertEqual(1);
        expect(fields[0].getName()).assertEqual('publicField');
        expect(fields[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1100
     * @tc.name testIsPrivate011
     * @tc.desc Verify IsPrivate functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass011>();
        let field = cls.getInstanceField('field')!;

        // Test scenario
        expect(field.isPrivate()).assertFalse();
        expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1200
     * @tc.name testIsPrivate012
     * @tc.desc Verify IsPrivate functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let result = field.isPrivate('extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1300
     * @tc.name testIsPrivate013
     * @tc.desc Verify IsPrivate functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>();
        cls.initialize();
        let field = cls.getInstanceField('name')!;
        let result = field.isPrivate();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1400
     * @tc.name testIsPrivate014
     * @tc.desc Verify IsPrivate functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let result = field.isPrivate(); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1500
     * @tc.name testIsPrivate015
     * @tc.desc Verify IsPrivate functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let result = field.isPrivate(); //
        expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1600
     * @tc.name testIsPrivate016
     * @tc.desc Verify IsPrivate functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateReadonly016>();

        // Test scenario
        let privateField = cls.getInstanceField('PRIVATE_CONST');
        expect(privateField === undefined).assertTrue();

        // Test scenario
        let publicField = cls.getInstanceField('PUBLIC_CONST')!;
        expect(publicField).not.toBeNull();
        expect(publicField.isPrivate()).assertFalse();
        expect(publicField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1700
     * @tc.name testIsPrivate017
     * @tc.desc Verify IsPrivate functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstructorPrivate017>();
        let fields = cls.getInstanceFields();

        // Test scenario
        expect(fields.length).assertLessThanOrEqual(1);
        if (fields.length === 1) {
            expect(fields[0].getName()).assertEqual('publicParam');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1800
     * @tc.name testIsPrivate018
     * @tc.desc Verify IsPrivate functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass018>();

        // Test scenario
        let childPublicField = childCls.getInstanceField('childPublic')!;
        expect(childPublicField.isPrivate()).assertFalse();

        let childPrivateField = childCls.getInstanceField('childPrivate');
        expect(childPrivateField === undefined).assertTrue();

        // Test scenario
        let parentCls = childCls.getSuper()!;
        let parentPublicField = parentCls.getInstanceField('parentPublic')!;
        expect(parentPublicField.isPrivate()).assertFalse();

        let parentPrivateField = parentCls.getInstanceField('parentPrivate');
        expect(parentPrivateField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1900
     * @tc.name testIsPrivate019
     * @tc.desc Verify IsPrivate functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();

        // Test scenario
        let privateField = cls.getInstanceField('privateField');
        expect(privateField === undefined).assertTrue();

        // Test scenario
        let publicField = cls.getInstanceField('publicField')!;
        let instance = cls.createInstance();
        let value = publicField.getValue(instance);
        expect(value).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_2000
     * @tc.name testIsPrivate020
     * @tc.desc Verify IsPrivate functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPrivate020>();

        // Test scenario
        let staticPrivateField = cls.getStaticField('STATIC_PRIVATE');
        expect(staticPrivateField === undefined).assertTrue();

        // Test scenario
        let staticPublicField = cls.getStaticField('STATIC_PUBLIC')!;
        expect(staticPublicField).not.toBeNull();
        expect(staticPublicField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_2100
     * @tc.name testIsPrivate021
     * @tc.desc Verify IsPrivate functionality test 020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0220
     * @tc.name testIsPrivate022
     * @tc.desc Verify isPrivate expanded test 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass022>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0230
     * @tc.name testIsPrivate023
     * @tc.desc Verify isPrivate expanded test 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass023>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0240
     * @tc.name testIsPrivate024
     * @tc.desc Verify isPrivate expanded test 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass024>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0250
     * @tc.name testIsPrivate025
     * @tc.desc Verify isPrivate expanded test 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass025>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0260
     * @tc.name testIsPrivate026
     * @tc.desc Verify isPrivate expanded test 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0270
     * @tc.name testIsPrivate027
     * @tc.desc Verify isPrivate expanded test 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0280
     * @tc.name testIsPrivate028
     * @tc.desc Verify isPrivate expanded test 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0290
     * @tc.name testIsPrivate029
     * @tc.desc Verify isPrivate expanded test 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0300
     * @tc.name testIsPrivate030
     * @tc.desc Verify isPrivate expanded test 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0310
     * @tc.name testIsPrivate031
     * @tc.desc Verify isPrivate expanded test 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0320
     * @tc.name testIsPrivate032
     * @tc.desc Verify isPrivate expanded test 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0330
     * @tc.name testIsPrivate033
     * @tc.desc Verify isPrivate expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0340
     * @tc.name testIsPrivate034
     * @tc.desc Verify isPrivate expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0350
     * @tc.name testIsPrivate035
     * @tc.desc Verify isPrivate expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0360
     * @tc.name testIsPrivate036
     * @tc.desc Verify isPrivate expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0370
     * @tc.name testIsPrivate037
     * @tc.desc Verify isPrivate expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0380
     * @tc.name testIsPrivate038
     * @tc.desc Verify isPrivate expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0390
     * @tc.name testIsPrivate039
     * @tc.desc Verify isPrivate expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0400
     * @tc.name testIsPrivate040
     * @tc.desc Verify isPrivate expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0410
     * @tc.name testIsPrivate041
     * @tc.desc Verify isPrivate expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0420
     * @tc.name testIsPrivate042
     * @tc.desc Verify isPrivate expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0430
     * @tc.name testIsPrivate043
     * @tc.desc Verify isPrivate expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0440
     * @tc.name testIsPrivate044
     * @tc.desc Verify isPrivate expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0450
     * @tc.name testIsPrivate045
     * @tc.desc Verify isPrivate expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0460
     * @tc.name testIsPrivate046
     * @tc.desc Verify isPrivate expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0470
     * @tc.name testIsPrivate047
     * @tc.desc Verify isPrivate expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0480
     * @tc.name testIsPrivate048
     * @tc.desc Verify isPrivate expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0490
     * @tc.name testIsPrivate049
     * @tc.desc Verify isPrivate expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0500
     * @tc.name testIsPrivate050
     * @tc.desc Verify isPrivate expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0510
     * @tc.name testIsPrivate051
     * @tc.desc Verify isPrivate expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0520
     * @tc.name testIsPrivate052
     * @tc.desc Verify isPrivate expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0530
     * @tc.name testIsPrivate053
     * @tc.desc Verify isPrivate expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0540
     * @tc.name testIsPrivate054
     * @tc.desc Verify isPrivate expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0550
     * @tc.name testIsPrivate055
     * @tc.desc Verify isPrivate expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0560
     * @tc.name testIsPrivate056
     * @tc.desc Verify isPrivate expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0570
     * @tc.name testIsPrivate057
     * @tc.desc Verify isPrivate expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0580
     * @tc.name testIsPrivate058
     * @tc.desc Verify isPrivate expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0590
     * @tc.name testIsPrivate059
     * @tc.desc Verify isPrivate expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0600
     * @tc.name testIsPrivate060
     * @tc.desc Verify isPrivate expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0610
     * @tc.name testIsPrivate061
     * @tc.desc Verify isPrivate expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0620
     * @tc.name testIsPrivate062
     * @tc.desc Verify isPrivate expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0630
     * @tc.name testIsPrivate063
     * @tc.desc Verify isPrivate expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0640
     * @tc.name testIsPrivate064
     * @tc.desc Verify isPrivate expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0650
     * @tc.name testIsPrivate065
     * @tc.desc Verify isPrivate expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0660
     * @tc.name testIsPrivate066
     * @tc.desc Verify isPrivate expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0670
     * @tc.name testIsPrivate067
     * @tc.desc Verify isPrivate expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0680
     * @tc.name testIsPrivate068
     * @tc.desc Verify isPrivate expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0690
     * @tc.name testIsPrivate069
     * @tc.desc Verify isPrivate expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0700
     * @tc.name testIsPrivate070
     * @tc.desc Verify isPrivate expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0710
     * @tc.name testIsPrivate071
     * @tc.desc Verify isPrivate expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0720
     * @tc.name testIsPrivate072
     * @tc.desc Verify isPrivate expanded test 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0730
     * @tc.name testIsPrivate073
     * @tc.desc Verify isPrivate expanded test 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0740
     * @tc.name testIsPrivate074
     * @tc.desc Verify isPrivate expanded test 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0750
     * @tc.name testIsPrivate075
     * @tc.desc Verify isPrivate expanded test 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0760
     * @tc.name testIsPrivate076
     * @tc.desc Verify isPrivate expanded test 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0770
     * @tc.name testIsPrivate077
     * @tc.desc Verify isPrivate expanded test 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0780
     * @tc.name testIsPrivate078
     * @tc.desc Verify isPrivate expanded test 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0790
     * @tc.name testIsPrivate079
     * @tc.desc Verify isPrivate expanded test 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0800
     * @tc.name testIsPrivate080
     * @tc.desc Verify isPrivate expanded test 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0810
     * @tc.name testIsPrivate081
     * @tc.desc Verify isPrivate expanded test 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0820
     * @tc.name testIsPrivate082
     * @tc.desc Verify isPrivate expanded test 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0830
     * @tc.name testIsPrivate083
     * @tc.desc Verify isPrivate expanded test 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0840
     * @tc.name testIsPrivate084
     * @tc.desc Verify isPrivate expanded test 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass084>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0850
     * @tc.name testIsPrivate085
     * @tc.desc Verify isPrivate expanded test 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0860
     * @tc.name testIsPrivate086
     * @tc.desc Verify isPrivate expanded test 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass086>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0870
     * @tc.name testIsPrivate087
     * @tc.desc Verify isPrivate expanded test 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0880
     * @tc.name testIsPrivate088
     * @tc.desc Verify isPrivate expanded test 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0890
     * @tc.name testIsPrivate089
     * @tc.desc Verify isPrivate expanded test 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass089>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0900
     * @tc.name testIsPrivate090
     * @tc.desc Verify isPrivate expanded test 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass090>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0910
     * @tc.name testIsPrivate091
     * @tc.desc Verify isPrivate expanded test 91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass091>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0920
     * @tc.name testIsPrivate092
     * @tc.desc Verify isPrivate expanded test 92
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass092>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0930
     * @tc.name testIsPrivate093
     * @tc.desc Verify isPrivate expanded test 93
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass093>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0940
     * @tc.name testIsPrivate094
     * @tc.desc Verify isPrivate expanded test 94
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass094>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0950
     * @tc.name testIsPrivate095
     * @tc.desc Verify isPrivate expanded test 95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass095>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0960
     * @tc.name testIsPrivate096
     * @tc.desc Verify isPrivate expanded test 96
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass096>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0970
     * @tc.name testIsPrivate097
     * @tc.desc Verify isPrivate expanded test 97
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass097>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0980
     * @tc.name testIsPrivate098
     * @tc.desc Verify isPrivate expanded test 98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass098>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_0990
     * @tc.name testIsPrivate099
     * @tc.desc Verify isPrivate expanded test 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass099>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1000
     * @tc.name testIsPrivate100
     * @tc.desc Verify isPrivate expanded test 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass100>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISPRIVATE_1010
     * @tc.name testIsPrivate101
     * @tc.desc Verify isPrivate expanded test 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpisPrivateClass101>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.isPrivate();
        expect(result).not.toBeNull();
    });
  });
}
