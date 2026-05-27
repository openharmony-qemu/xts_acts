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

class FieldNames004 {
      public normalField: string = '';
      public camelCase: int = 0;
      public PascalCase: boolean = false;
      public snake_case: string = '';
      public FIELD123: double = 0.0;
  }

class GroupedFields019 {
      public user_id: int = 0;
      public user_name: string = '';
      public user_age: int = 0;
      public post_id: int = 1;
      public post_title: string = '';
  }

class KeywordField007 {
      public 'class': string = '';
      public 'function': string = '';
      public 'return': string = '';
      public 'if': string = '';
  }

class LongName015 {
      public 'a'.repeat(1000): string = '';
  }

class MyClass001 {
      public name: string = 'test';
  }

class NumberStart017 {
      public '1field': string = ''; //             ?
      public '2field': string = '';
  }

class ShortName016 {
      public a: string = '';
      public b: int = 0;
  }

class SpecialField006 {
      public 'field-name': string = '';
      public 'field_name': string = '';
      public 'field.name': string = '';
  }

class StaticTest024 {
      public static STATIC_VALUE: string = 'static';
      public instanceValue: string = 'instance';
  }

class TestClass003 {
      public myField: string = 'value';
      private privateField: int = 0;
      public anotherField: boolean = false;
  }

class TestClass008 {
      public value: int = 0;
  }

class TestClass009 {
      public validField: string = '';
  }

class TestClass010 {
      public value: string = '';
  }

class TestClass018 {
      public targetField: string = 'target';
      public otherField: string = 'other';
  }

class TestClass020 {
      public camelCase: string = '';
      public PascalCase: string = '';
      public snake_case: string = '';
  }

class TestClass021 {
      public value: int = 0;
  }

class TestClass022 {
      public field1: string = '';
      public field2: int = 0;
      public field1_duplicate: string = ''; //              ?
  }

class TestClass023 {
      public data: string = '';
  }

class TestClass025 {
      public username: string = 'admin';
      public password: string = '123456';
      public email: string = 'admin@example.com';
  }

class UnicodeField005 {
      public    : string = '   ';
      public    : string = 'Russian';
      public    : string = 'Japanese';
  }

class ExpgetNameClass026 {
      public data: string = 'default';
  }

class ExpgetNameClass027 {
      public data: string = 'default';
  }

class ExpgetNameClass028 {
      public data: string = 'default';
  }

class ExpgetNameClass029 {
      public data: string = 'default';
  }

class ExpgetNameClass030 {
      public data: string = 'default';
  }

class ExpgetNameClass031 {
      public data: string = 'default';
  }

class ExpgetNameClass032 {
      public data: string = 'default';
  }

class ExpgetNameClass033 {
      public data: string = 'default';
  }

class ExpgetNameClass034 {
      public data: string = 'default';
  }

class ExpgetNameClass035 {
      public data: string = 'default';
  }

class ExpgetNameClass036 {
      public data: string = 'default';
  }

class ExpgetNameClass037 {
      public data: string = 'default';
  }

class ExpgetNameClass038 {
      public data: string = 'default';
  }

class ExpgetNameClass039 {
      public data: string = 'default';
  }

class ExpgetNameClass040 {
      public data: string = 'default';
  }

class ExpgetNameClass041 {
      public data: string = 'default';
  }

class ExpgetNameClass042 {
      public data: string = 'default';
  }

class ExpgetNameClass043 {
      public data: string = 'default';
  }

class ExpgetNameClass044 {
      public data: string = 'default';
  }

class ExpgetNameClass045 {
      public data: string = 'default';
  }

class ExpgetNameClass046 {
      public data: string = 'default';
  }

class ExpgetNameClass047 {
      public data: string = 'default';
  }

class ExpgetNameClass048 {
      public data: string = 'default';
  }

class ExpgetNameClass049 {
      public data: string = 'default';
  }

class ExpgetNameClass050 {
      public data: string = 'default';
  }

class ExpgetNameClass051 {
      public data: string = 'default';
  }

class ExpgetNameClass052 {
      public data: string = 'default';
  }

class ExpgetNameClass053 {
      public data: string = 'default';
  }

class ExpgetNameClass054 {
      public data: string = 'default';
  }

class ExpgetNameClass055 {
      public data: string = 'default';
  }

class ExpgetNameClass056 {
      public data: string = 'default';
  }

class ExpgetNameClass057 {
      public data: string = 'default';
  }

class ExpgetNameClass058 {
      public data: string = 'default';
  }

class ExpgetNameClass059 {
      public data: string = 'default';
  }

class ExpgetNameClass060 {
      public data: string = 'default';
  }

class ExpgetNameClass061 {
      public data: string = 'default';
  }

class ExpgetNameClass062 {
      public data: string = 'default';
  }

class ExpgetNameClass063 {
      public data: string = 'default';
  }

class ExpgetNameClass064 {
      public data: string = 'default';
  }

class ExpgetNameClass065 {
      public data: string = 'default';
  }

class ExpgetNameClass066 {
      public data: string = 'default';
  }

class ExpgetNameClass067 {
      public data: string = 'default';
  }

class ExpgetNameClass068 {
      public data: string = 'default';
  }

class ExpgetNameClass069 {
      public data: string = 'default';
  }

class ExpgetNameClass070 {
      public data: string = 'default';
  }

class ExpgetNameClass071 {
      public data: string = 'default';
  }

class ExpgetNameClass072 {
      public data: string = 'default';
  }

class ExpgetNameClass073 {
      public data: string = 'default';
  }

class ExpgetNameClass074 {
      public data: string = 'default';
  }

class ExpgetNameClass075 {
      public data: string = 'default';
  }

class ExpgetNameClass076 {
      public data: string = 'default';
  }

class ExpgetNameClass077 {
      public data: string = 'default';
  }

class ExpgetNameClass078 {
      public data: string = 'default';
  }

class ExpgetNameClass079 {
      public data: string = 'default';
  }

class ExpgetNameClass080 {
      public data: string = 'default';
  }

class ExpgetNameClass081 {
      public data: string = 'default';
  }

class ExpgetNameClass082 {
      public data: string = 'default';
  }

class ExpgetNameClass083 {
      public data: string = 'default';
  }

class ExpgetNameClass084 {
      public data: string = 'default';
  }

class ExpgetNameClass085 {
      public data: string = 'default';
  }

class ExpgetNameClass086 {
      public data: string = 'default';
  }

class ExpgetNameClass087 {
      public data: string = 'default';
  }

class ExpgetNameClass088 {
      public data: string = 'default';
  }

class ExpgetNameClass089 {
      public data: string = 'default';
  }

class ExpgetNameClass090 {
      public data: string = 'default';
  }

class ExpgetNameClass091 {
      public data: string = 'default';
  }

class ExpgetNameClass092 {
      public data: string = 'default';
  }

class ExpgetNameClass093 {
      public data: string = 'default';
  }

class ExpgetNameClass094 {
      public data: string = 'default';
  }

class ExpgetNameClass095 {
      public data: string = 'default';
  }

class ExpgetNameClass096 {
      public data: string = 'default';
  }

class ExpgetNameClass097 {
      public data: string = 'default';
  }

class ExpgetNameClass098 {
      public data: string = 'default';
  }

class ExpgetNameClass099 {
      public data: string = 'default';
  }

class ExpgetNameClass100 {
      public data: string = 'default';
  }

class ExpgetNameClass101 {
      public data: string = 'default';
  }

class ExpgetNameClass102 {
      public data: string = 'default';
  }

class ExpgetNameClass103 {
      public data: string = 'default';
  }

class ExpgetNameClass104 {
      public data: string = 'default';
  }

class ExpgetNameClass105 {
      public data: string = 'default';
  }

class ExpgetNameClass106 {
      public data: string = 'default';
  }

class ExpgetNameClass107 {
      public data: string = 'default';
  }

class ExpgetNameClass108 {
      public data: string = 'default';
  }

class ExpgetNameClass109 {
      public data: string = 'default';
  }

class ExpgetNameClass110 {
      public data: string = 'default';
  }

class ExpgetNameClass111 {
      public data: string = 'default';
  }

class ExpgetNameClass112 {
      public data: string = 'default';
  }

class ExpgetNameClass113 {
      public data: string = 'default';
  }

class ExpgetNameClass114 {
      public data: string = 'default';
  }

class ExpgetNameClass115 {
      public data: string = 'default';
  }

class ExpgetNameClass116 {
      public data: string = 'default';
  }

class ExpgetNameClass117 {
      public data: string = 'default';
  }

class ExpgetNameClass118 {
      public data: string = 'default';
  }

class ExpgetNameClass119 {
      public data: string = 'default';
  }

class ExpgetNameClass120 {
      public data: string = 'default';
  }

export default function InstanceFieldGetNameTest() {
  describe('InstanceFieldGetNameTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0100
     * @tc.name testGetName001
     * @tc.desc Verify getName functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let fieldName = field.getName();
        expect(fieldName).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0200
     * @tc.name testGetName002
     * @tc.desc Verify GetName functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        // Test scenario
        try {
            let fieldName = field.getName('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0300
     * @tc.name testGetName003
     * @tc.desc Verify GetName functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
        let fields = cls.getInstanceFields();

        // Test scenario
        expect(fields[0].getName()).assertEqual('myField');
        expect(fields[1].getName()).assertEqual('anotherField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0400
     * @tc.name testGetName004
     * @tc.desc Verify GetName functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FieldNames004>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            // Test scenario
            expect(name).not.toBeNull();
            expect(typeof name).assertEqual('string');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0500
     * @tc.name testGetName005
     * @tc.desc Verify GetName functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeField005>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            console.info(`    ? ${name}`);
            expect(name.length).assertGreaterThan(0);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0600
     * @tc.name testGetName006
     * @tc.desc Verify GetName functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialField006>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            console.info(`    ? ${name}`);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0700
     * @tc.name testGetName007
     * @tc.desc Verify GetName functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<KeywordField007>();
        let fields = cls.getInstanceFields();

        expect(fields.length).assertGreaterThan(0);
        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            expect(name).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0800
     * @tc.name testGetName008
     * @tc.desc Verify GetName functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
        let field = cls.getInstanceField('value')!;
        let name = field.getName();

        expect(typeof name).assertEqual('string');
        expect(name.length).assertGreaterThan(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0900
     * @tc.name testGetName009
     * @tc.desc Verify GetName functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
        let field = cls.getInstanceField('validField')!;
        let name = field.getName();

        expect(name).not.toEqual('');
        expect(name.length).assertGreaterThan(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1000
     * @tc.name testGetName010
     * @tc.desc Verify GetName functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass010>();
        let field = cls.getInstanceField('value')!;

        let name1 = field.getName();
        let name2 = field.getName();
        let name3 = field.getName();

        expect(name1).assertEqual(name2);
        expect(name2).assertEqual(name3);
        expect(name1).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1100
     * @tc.name testGetName011
     * @tc.desc Verify GetName functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let fieldName = field.getName('extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1200
     * @tc.name testGetName012
     * @tc.desc Verify GetName functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>();
        cls.initialize();
        let field = cls.getInstanceField('name')!;
        let fieldName = field.getName();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1300
     * @tc.name testGetName013
     * @tc.desc Verify GetName functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let fieldName = field.getName(); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1400
     * @tc.name testGetName014
     * @tc.desc Verify GetName functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let fieldName = field.getName(); //
        expect(typeof fieldName).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1500
     * @tc.name testGetName015
     * @tc.desc Verify GetName functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongName015>();
        let fields = cls.getInstanceFields();

        if (fields.length > 0) {
            let name = fields[0].getName();
            expect(name.length).assertEqual(1000);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1600
     * @tc.name testGetName016
     * @tc.desc Verify GetName functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortName016>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            expect(name.length).assertEqual(1);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1700
     * @tc.name testGetName017
     * @tc.desc Verify GetName functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Test scenario

        let cls = Class.from<NumberStart017>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            console.info(`    ? ${name}`);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1800
     * @tc.name testGetName018
     * @tc.desc Verify GetName functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass018>();
        let fields = cls.getInstanceFields();

        // Test scenario
        let targetField = fields.find(f => f.getName() === 'targetField');
        expect(targetField).not.toBeNull();
        expect(targetField!.getName()).assertEqual('targetField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_1900
     * @tc.name testGetName019
     * @tc.desc Verify GetName functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GroupedFields019>();
        let fields = cls.getInstanceFields();

        let userFields = fields.filter(f => f.getName().startsWith('user_'));
        let postFields = fields.filter(f => f.getName().startsWith('post_'));

        expect(userFields.length).assertEqual(3);
        expect(postFields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_2000
     * @tc.name testGetName020
     * @tc.desc Verify GetName functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass020>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();

            // Test scenario
            let isValid = /^[a-zA-Z0-9_]+$/.test(name);
            expect(isValid).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_2100
     * @tc.name testGetName021
     * @tc.desc Verify GetName functionality test 020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();
        let field = cls.getInstanceField('value')!;

        // Test scenario
        let fullName = `${field.getOwner().getName()}.${field.getName()}`;
        expect(fullName).assertEqual('TestClass021.value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_2200
     * @tc.name testGetName022
     * @tc.desc Verify GetName functionality test 021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass022>();
        let fields = cls.getInstanceFields();

        let fieldNames = fields.map(f => f.getName());
        let uniqueNames = new Set<string>(fieldNames);

        // Test scenario
        expect(fieldNames.length).assertEqual(uniqueNames.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_2300
     * @tc.name testGetName023
     * @tc.desc Verify GetName functionality test 022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass023>();
        let field = cls.getInstanceField('data')!;

        // Test scenario
        for (let i = 0; i < 1000; i++) {
            let name = field.getName();
            expect(name).assertEqual('data');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_2400
     * @tc.name testGetName024
     * @tc.desc Verify GetName functionality test 023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest024>();

        // Test scenario
        let staticField = cls.getStaticField('STATIC_VALUE')!;
        expect(staticField.getName()).assertEqual('STATIC_VALUE');

        // Test scenario
        let instanceField = cls.getInstanceField('instanceValue')!;
        expect(instanceField.getName()).assertEqual('instanceValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_2500
     * @tc.name testGetName025
     * @tc.desc Verify GetName functionality test 024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass025>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let field = fields[i];

            let info = {
                name: field.getName(),
                owner: field.getOwner().getName(),
                type: field.getType().getName(),
                isReadonly: field.isReadonly(),
                isPublic: field.isPublic()
            };

            console.info(JSON.stringify(info));
        }
    });
    // === Expanded Test Cases ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0260
     * @tc.name testGetName026
     * @tc.desc Verify getName expanded test 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0270
     * @tc.name testGetName027
     * @tc.desc Verify getName expanded test 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0280
     * @tc.name testGetName028
     * @tc.desc Verify getName expanded test 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0290
     * @tc.name testGetName029
     * @tc.desc Verify getName expanded test 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0300
     * @tc.name testGetName030
     * @tc.desc Verify getName expanded test 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0310
     * @tc.name testGetName031
     * @tc.desc Verify getName expanded test 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0320
     * @tc.name testGetName032
     * @tc.desc Verify getName expanded test 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0330
     * @tc.name testGetName033
     * @tc.desc Verify getName expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0340
     * @tc.name testGetName034
     * @tc.desc Verify getName expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0350
     * @tc.name testGetName035
     * @tc.desc Verify getName expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0360
     * @tc.name testGetName036
     * @tc.desc Verify getName expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0370
     * @tc.name testGetName037
     * @tc.desc Verify getName expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0380
     * @tc.name testGetName038
     * @tc.desc Verify getName expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0390
     * @tc.name testGetName039
     * @tc.desc Verify getName expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0400
     * @tc.name testGetName040
     * @tc.desc Verify getName expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0410
     * @tc.name testGetName041
     * @tc.desc Verify getName expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0420
     * @tc.name testGetName042
     * @tc.desc Verify getName expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0430
     * @tc.name testGetName043
     * @tc.desc Verify getName expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0440
     * @tc.name testGetName044
     * @tc.desc Verify getName expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0450
     * @tc.name testGetName045
     * @tc.desc Verify getName expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0460
     * @tc.name testGetName046
     * @tc.desc Verify getName expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0470
     * @tc.name testGetName047
     * @tc.desc Verify getName expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0480
     * @tc.name testGetName048
     * @tc.desc Verify getName expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0490
     * @tc.name testGetName049
     * @tc.desc Verify getName expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0500
     * @tc.name testGetName050
     * @tc.desc Verify getName expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0510
     * @tc.name testGetName051
     * @tc.desc Verify getName expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0520
     * @tc.name testGetName052
     * @tc.desc Verify getName expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0530
     * @tc.name testGetName053
     * @tc.desc Verify getName expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0540
     * @tc.name testGetName054
     * @tc.desc Verify getName expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0550
     * @tc.name testGetName055
     * @tc.desc Verify getName expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0560
     * @tc.name testGetName056
     * @tc.desc Verify getName expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0570
     * @tc.name testGetName057
     * @tc.desc Verify getName expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0580
     * @tc.name testGetName058
     * @tc.desc Verify getName expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0590
     * @tc.name testGetName059
     * @tc.desc Verify getName expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0600
     * @tc.name testGetName060
     * @tc.desc Verify getName expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0610
     * @tc.name testGetName061
     * @tc.desc Verify getName expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0620
     * @tc.name testGetName062
     * @tc.desc Verify getName expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0630
     * @tc.name testGetName063
     * @tc.desc Verify getName expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0640
     * @tc.name testGetName064
     * @tc.desc Verify getName expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0650
     * @tc.name testGetName065
     * @tc.desc Verify getName expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0660
     * @tc.name testGetName066
     * @tc.desc Verify getName expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0670
     * @tc.name testGetName067
     * @tc.desc Verify getName expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0680
     * @tc.name testGetName068
     * @tc.desc Verify getName expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0690
     * @tc.name testGetName069
     * @tc.desc Verify getName expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0700
     * @tc.name testGetName070
     * @tc.desc Verify getName expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0710
     * @tc.name testGetName071
     * @tc.desc Verify getName expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0720
     * @tc.name testGetName072
     * @tc.desc Verify getName expanded test 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0730
     * @tc.name testGetName073
     * @tc.desc Verify getName expanded test 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0740
     * @tc.name testGetName074
     * @tc.desc Verify getName expanded test 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0750
     * @tc.name testGetName075
     * @tc.desc Verify getName expanded test 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0760
     * @tc.name testGetName076
     * @tc.desc Verify getName expanded test 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0770
     * @tc.name testGetName077
     * @tc.desc Verify getName expanded test 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0780
     * @tc.name testGetName078
     * @tc.desc Verify getName expanded test 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0790
     * @tc.name testGetName079
     * @tc.desc Verify getName expanded test 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0800
     * @tc.name testGetName080
     * @tc.desc Verify getName expanded test 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0810
     * @tc.name testGetName081
     * @tc.desc Verify getName expanded test 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0820
     * @tc.name testGetName082
     * @tc.desc Verify getName expanded test 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0830
     * @tc.name testGetName083
     * @tc.desc Verify getName expanded test 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0840
     * @tc.name testGetName084
     * @tc.desc Verify getName expanded test 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass084>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0850
     * @tc.name testGetName085
     * @tc.desc Verify getName expanded test 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0860
     * @tc.name testGetName086
     * @tc.desc Verify getName expanded test 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass086>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0870
     * @tc.name testGetName087
     * @tc.desc Verify getName expanded test 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETNAME_0880
     * @tc.name testGetName088
     * @tc.desc Verify getName expanded test 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetNameClass088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getName();
        expect(result).not.toBeNull();
    });
