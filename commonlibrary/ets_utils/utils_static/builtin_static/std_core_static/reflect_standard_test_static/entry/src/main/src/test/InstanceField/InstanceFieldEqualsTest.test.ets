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

class ArrayClass014 {
      public arrField: Array<int> = [1, 2, 3];
      public emptyArr: Array<string> = [];
  }

class Class1008 {
      public field: string = 'class1';
  }

class Class1020 {
      public field: string = 'value';
  }

class Class2008 {
      public field: string = 'class2';
  }

class Class2020 {
      public field: string = 'value2';
  }

class InnerClass013 {
      public data: string = 'inner';
  }

class LargeObject025 {
      public data: Array<int> = [];
  }

class MyClass001 {
      public name: string = 'test';
  }

class Node026 {
      public value: int = 0;
      public next: Node | null = null;
  }

class NullClass015 {
      public nullableField: string | null = null;
      public normalField: string = 'value';
  }

class OuterClass013 {
      public inner: InnerClass = new InnerClass();
  }

class Person028 {
      public name: string = '';
      public age: int = 0;
      public email: string = '';
  }

class PrivateClass022 {
      private privateField: string = 'private';
      public publicField: string = 'public';
  }

class ReadonlyClass021 {
      public readonly readonlyField: string = 'readonly';
  }

class Serializable030 {
      public id: int = 0;
      public name: string = '';
      public active: boolean = true;
  }

class StaticTest032 {
      public static STATIC_VALUE: string = 'static';
      public instanceValue: string = 'instance';
  }

class TestClass004 {
      public value: int = 42;
  }

class TestClass005 {
      public data: string = 'hello';
  }

class TestClass011 {
      public stringValue: string = 'test';
      public numberValue: int = 100;
      public boolValue: boolean = true;
  }

class TestClass018 {
      public intField: int = 0;
      public stringField: string = '';
      public boolField: boolean = false;
  }

class TestClass019 {
      public data: string = 'test';
  }

class TestClass027 {
      public counter: int = 0;
  }

class TestClass029 {
      public data: string = 'test';
  }

class TestClass031 {
      public value: int = 0;
  }

class TypesClass012 {
      public strField: string = '';
      public numField: number = 0.0;
      public boolField: boolean = false;
      public arrField: Array<int> = [];
      public objField: Object = {};
      public nullField: string | null = null;
  }

class UndefinedClass016 {
      public optionalField: string | undefined = undefined;
  }

class ZeroClass017 {
      public zeroInt: int = 0;
      public zeroDouble: double = 0.0;
      public emptyString: string = '';
      public zeroBool: boolean = false;
  }

class ExpequalsClass033 {
      public data: string = 'default';
  }

class ExpequalsClass034 {
      public data: string = 'default';
  }

class ExpequalsClass035 {
      public data: string = 'default';
  }

class ExpequalsClass036 {
      public data: string = 'default';
  }

class ExpequalsClass037 {
      public data: string = 'default';
  }

class ExpequalsClass038 {
      public data: string = 'default';
  }

class ExpequalsClass039 {
      public data: string = 'default';
  }

class ExpequalsClass040 {
      public data: string = 'default';
  }

class ExpequalsClass041 {
      public data: string = 'default';
  }

class ExpequalsClass042 {
      public data: string = 'default';
  }

class ExpequalsClass043 {
      public data: string = 'default';
  }

class ExpequalsClass044 {
      public data: string = 'default';
  }

class ExpequalsClass045 {
      public data: string = 'default';
  }

class ExpequalsClass046 {
      public data: string = 'default';
  }

class ExpequalsClass047 {
      public data: string = 'default';
  }

class ExpequalsClass048 {
      public data: string = 'default';
  }

class ExpequalsClass049 {
      public data: string = 'default';
  }

class ExpequalsClass050 {
      public data: string = 'default';
  }

class ExpequalsClass051 {
      public data: string = 'default';
  }

class ExpequalsClass052 {
      public data: string = 'default';
  }

class ExpequalsClass053 {
      public data: string = 'default';
  }

class ExpequalsClass054 {
      public data: string = 'default';
  }

class ExpequalsClass055 {
      public data: string = 'default';
  }

class ExpequalsClass056 {
      public data: string = 'default';
  }

class ExpequalsClass057 {
      public data: string = 'default';
  }

class ExpequalsClass058 {
      public data: string = 'default';
  }

class ExpequalsClass059 {
      public data: string = 'default';
  }

class ExpequalsClass060 {
      public data: string = 'default';
  }

class ExpequalsClass061 {
      public data: string = 'default';
  }

class ExpequalsClass062 {
      public data: string = 'default';
  }

class ExpequalsClass063 {
      public data: string = 'default';
  }

class ExpequalsClass064 {
      public data: string = 'default';
  }

class ExpequalsClass065 {
      public data: string = 'default';
  }

class ExpequalsClass066 {
      public data: string = 'default';
  }

class ExpequalsClass067 {
      public data: string = 'default';
  }

class ExpequalsClass068 {
      public data: string = 'default';
  }

class ExpequalsClass069 {
      public data: string = 'default';
  }

class ExpequalsClass070 {
      public data: string = 'default';
  }

class ExpequalsClass071 {
      public data: string = 'default';
  }

class ExpequalsClass072 {
      public data: string = 'default';
  }

class ExpequalsClass073 {
      public data: string = 'default';
  }

class ExpequalsClass074 {
      public data: string = 'default';
  }

class ExpequalsClass075 {
      public data: string = 'default';
  }

class ExpequalsClass076 {
      public data: string = 'default';
  }

class ExpequalsClass077 {
      public data: string = 'default';
  }

class ExpequalsClass078 {
      public data: string = 'default';
  }

class ExpequalsClass079 {
      public data: string = 'default';
  }

class ExpequalsClass080 {
      public data: string = 'default';
  }

class ExpequalsClass081 {
      public data: string = 'default';
  }

class ExpequalsClass082 {
      public data: string = 'default';
  }

class ExpequalsClass083 {
      public data: string = 'default';
  }

class ExpequalsClass084 {
      public data: string = 'default';
  }

class ExpequalsClass085 {
      public data: string = 'default';
  }

class ExpequalsClass086 {
      public data: string = 'default';
  }

class ExpequalsClass087 {
      public data: string = 'default';
  }

class ExpequalsClass088 {
      public data: string = 'default';
  }

class ExpequalsClass089 {
      public data: string = 'default';
  }

class ExpequalsClass090 {
      public data: string = 'default';
  }

class ExpequalsClass091 {
      public data: string = 'default';
  }

class ExpequalsClass092 {
      public data: string = 'default';
  }

class ExpequalsClass093 {
      public data: string = 'default';
  }

class ExpequalsClass094 {
      public data: string = 'default';
  }

class ExpequalsClass095 {
      public data: string = 'default';
  }

class ExpequalsClass096 {
      public data: string = 'default';
  }

class ExpequalsClass097 {
      public data: string = 'default';
  }

class ExpequalsClass098 {
      public data: string = 'default';
  }

class ExpequalsClass099 {
      public data: string = 'default';
  }

class ExpequalsClass100 {
      public data: string = 'default';
  }

class ExpequalsClass101 {
      public data: string = 'default';
  }

class ExpequalsClass102 {
      public data: string = 'default';
  }

class ExpequalsClass103 {
      public data: string = 'default';
  }

class ExpequalsClass104 {
      public data: string = 'default';
  }

class ExpequalsClass105 {
      public data: string = 'default';
  }

class ExpequalsClass106 {
      public data: string = 'default';
  }

class ExpequalsClass107 {
      public data: string = 'default';
  }

class ExpequalsClass108 {
      public data: string = 'default';
  }

class ExpequalsClass109 {
      public data: string = 'default';
  }

class ExpequalsClass110 {
      public data: string = 'default';
  }

class ExpequalsClass111 {
      public data: string = 'default';
  }

class ExpequalsClass112 {
      public data: string = 'default';
  }

class ExpequalsClass113 {
      public data: string = 'default';
  }

class ExpequalsClass114 {
      public data: string = 'default';
  }

class ExpequalsClass115 {
      public data: string = 'default';
  }

class ExpequalsClass116 {
      public data: string = 'default';
  }

class ExpequalsClass117 {
      public data: string = 'default';
  }

class ExpequalsClass118 {
      public data: string = 'default';
  }

class ExpequalsClass119 {
      public data: string = 'default';
  }

class ExpequalsClass120 {
      public data: string = 'default';
  }

class ExpequalsClass121 {
      public data: string = 'default';
  }

class ExpequalsClass122 {
      public data: string = 'default';
  }

class ExpequalsClass123 {
      public data: string = 'default';
  }

class ExpequalsClass124 {
      public data: string = 'default';
  }

class ExpequalsClass125 {
      public data: string = 'default';
  }

class ExpequalsClass126 {
      public data: string = 'default';
  }

class ExpequalsClass127 {
      public data: string = 'default';
  }

class ExpequalsClass128 {
      public data: string = 'default';
  }

class ExpequalsClass129 {
      public data: string = 'default';
  }

class ExpequalsClass130 {
      public data: string = 'default';
  }

class ExpequalsClass131 {
      public data: string = 'default';
  }

class ExpequalsClass132 {
      public data: string = 'default';
  }

class ExpequalsClass133 {
      public data: string = 'default';
  }

class ExpequalsClass134 {
      public data: string = 'default';
  }

class ExpequalsClass135 {
      public data: string = 'default';
  }

class ExpequalsClass136 {
      public data: string = 'default';
  }

class ExpequalsClass137 {
      public data: string = 'default';
  }

class ExpequalsClass138 {
      public data: string = 'default';
  }

class ExpequalsClass139 {
      public data: string = 'default';
  }

class ExpequalsClass140 {
      public data: string = 'default';
  }

class ExpequalsClass141 {
      public data: string = 'default';
  }

class ExpequalsClass142 {
      public data: string = 'default';
  }

export default function InstanceFieldEqualsTest() {
  describe('InstanceFieldEqualsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0100
     * @tc.name testEquals001
     * @tc.desc Verify equals functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();

        let value = field.getValue(instance);
        expect(value).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0200
     * @tc.name testEquals002
     * @tc.desc Verify Equals functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue();
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0300
     * @tc.name testEquals003
     * @tc.desc Verify Equals functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        try {
            let value = field.getValue(instance, 'extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0400
     * @tc.name testEquals004
     * @tc.desc Verify Equals functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass004>();
        let field = cls.getInstanceField('value')!;
        let instance = cls.createInstance();

        let result = field.getValue(instance);
        expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0500
     * @tc.name testEquals005
     * @tc.desc Verify Equals functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass005>();
        let field = cls.getInstanceField('data')!;

        // Test scenario
        let instance = cls.createInstance();
        let value = field.getValue(instance);
        expect(value).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0600
     * @tc.name testEquals006
     * @tc.desc Verify Equals functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue(null);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0700
     * @tc.name testEquals007
     * @tc.desc Verify Equals functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue(undefined);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0800
     * @tc.name testEquals008
     * @tc.desc Verify Equals functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Class1008>();
        let field1 = cls1.getInstanceField('field')!;

        let cls2 = Class.from<Class2008>();
        let instance2 = cls2.createInstance();

        // Test scenario
        try {
            let value = field1.getValue(instance2);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0900
     * @tc.name testEquals009
     * @tc.desc Verify Equals functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue('string' as Object);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1000
     * @tc.name testEquals010
     * @tc.desc Verify Equals functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('value')!;
        try {
            let value = field.getValue(123 as Object);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1100
     * @tc.name testEquals011
     * @tc.desc Verify Equals functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass011>();
        let instance = cls.createInstance();

        let strField = cls.getInstanceField('stringValue')!;
        expect(strField.getValue(instance)).assertEqual('test');

        let numField = cls.getInstanceField('numberValue')!;
        expect(numField.getValue(instance)).assertEqual(100);

        let boolField = cls.getInstanceField('boolValue')!;
        expect(boolField.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1200
     * @tc.name testEquals012
     * @tc.desc Verify Equals functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypesClass012>();
        let instance = cls.createInstance();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let value = fields[i].getValue(instance);
            console.info(`${fields[i].getName()}: ${value}`);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1300
     * @tc.name testEquals013
     * @tc.desc Verify Equals functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OuterClass013>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('inner')!;
        let value = field.getValue(instance);

        expect(value instanceof InnerClass013).assertTrue();
        expect((value as InnerClass013).data).assertEqual('inner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1400
     * @tc.name testEquals014
     * @tc.desc Verify Equals functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayClass014>();
        let instance = cls.createInstance();

        let arrField = cls.getInstanceField('arrField')!;
        let arrValue = arrField.getValue(instance) as Array<int>;
        expect(arrValue.length).assertEqual(3);
        expect(arrValue[0]).assertEqual(1);

        let emptyField = cls.getInstanceField('emptyArr')!;
        let emptyValue = emptyField.getValue(instance) as Array<string>;
        expect(emptyValue.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1500
     * @tc.name testEquals015
     * @tc.desc Verify Equals functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullClass015>();
        let instance = cls.createInstance();

        let nullField = cls.getInstanceField('nullableField')!;
        let value = nullField.getValue(instance);
        expect(value).assertEqual(null);

        let normalField = cls.getInstanceField('normalField')!;
        expect(normalField.getValue(instance)).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1600
     * @tc.name testEquals016
     * @tc.desc Verify Equals functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UndefinedClass016>();
        let instance = cls.createInstance();

        let field = cls.getInstanceField('optionalField')!;
        let value = field.getValue(instance);
        // Test scenario
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1700
     * @tc.name testEquals017
     * @tc.desc Verify Equals functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroClass017>();
        let instance = cls.createInstance();

        expect(cls.getInstanceField('zeroInt')!.getValue(instance)).assertEqual(0);
        expect(cls.getInstanceField('zeroDouble')!.getValue(instance)).assertEqual(0.0);
        expect(cls.getInstanceField('emptyString')!.getValue(instance)).assertEqual('');
        expect(cls.getInstanceField('zeroBool')!.getValue(instance)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1800
     * @tc.name testEquals018
     * @tc.desc Verify Equals functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass018>();
        let instance = cls.createInstance();

        let intField = cls.getInstanceField('intField')!;
        let intValue = intField.getValue(instance);
        expect(typeof intValue).assertEqual('number');

        let stringField = cls.getInstanceField('stringField')!;
        let stringValue = stringField.getValue(instance);
        expect(typeof stringValue).assertEqual('string');

        let boolField = cls.getInstanceField('boolField')!;
        let boolValue = boolField.getValue(instance);
        expect(typeof boolValue).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1900
     * @tc.name testEquals019
     * @tc.desc Verify Equals functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass019>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;

        let value = field.getValue(instance);
        let fieldType = field.getType();

        // Test scenario
        if (fieldType.getName() === 'std.core.String') {
            expect(typeof value).assertEqual('string');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2000
     * @tc.name testEquals020
     * @tc.desc Verify Equals functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Class1020>();
        let field = cls1.getInstanceField('field')!;

        let cls2 = Class.from<Class2020>();
        let instance2 = cls2.createInstance();

        try {
            let value = field.getValue(instance2);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2100
     * @tc.name testEquals021
     * @tc.desc Verify Equals functionality test 020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyClass021>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('readonlyField')!;

        // Test scenario
        let value = field.getValue(instance);
        expect(value).assertEqual('readonly');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2200
     * @tc.name testEquals022
     * @tc.desc Verify Equals functionality test 021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateClass022>();

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2300
     * @tc.name testEquals023
     * @tc.desc Verify Equals functionality test 022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        let value = field.getValue(instance); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2400
     * @tc.name testEquals024
     * @tc.desc Verify Equals functionality test 023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        let value = field.getValue(instance); //
        expect(value).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2500
     * @tc.name testEquals025
     * @tc.desc Verify Equals functionality test 024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeObject025>();
        let instance = cls.createInstance();

        // Test scenario
        let field = cls.getInstanceField('data')!;
        for (let i = 0; i < 10000; i++) {
            (field.getValue(instance) as Array<int>).push(i);
        }

        let value = field.getValue(instance) as Array<int>;
        expect(value.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2600
     * @tc.name testEquals026
     * @tc.desc Verify Equals functionality test 025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Node026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('next')!;

        // Test scenario
        instance.next = instance;

        // Test scenario
        let value = field.getValue(instance);
        expect(value).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2700
     * @tc.name testEquals027
     * @tc.desc Verify Equals functionality test 026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;

        // Test scenario
        let initialValue = field.getValue(instance);
        expect(initialValue).assertEqual(0);

        // Test scenario
        field.setValue(instance, 100);

        // Test scenario
        let newValue = field.getValue(instance);
        expect(newValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2800
     * @tc.name testEquals028
     * @tc.desc Verify Equals functionality test 027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Person028>();
        let instance = cls.createInstance();

        // Test scenario
        let fields = cls.getInstanceFields();
        let values = new Map<string, Object>();

        for (let i = 0; i < fields.length; i++) {
            let value = fields[i].getValue(instance);
            values.set(fields[i].getName(), value);
        }

        expect(values.get('name')).assertEqual('');
        expect(values.get('age')).assertEqual(0);
        expect(values.get('email')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_2900
     * @tc.name testEquals029
     * @tc.desc Verify Equals functionality test 028
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;

        // Test scenario
        for (let i = 0; i < 10000; i++) {
            let value = field.getValue(instance);
            expect(value).assertEqual('test');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_3000
     * @tc.name testEquals030
     * @tc.desc Verify Equals functionality test 029
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      function serialize(obj: Object, cls: Class): string {
            let fields = cls.getInstanceFields();
            let result = '{';

            for (let i = 0; i < fields.length; i++) {
                let value = fields[i].getValue(obj);
                let valueStr = JSON.stringify(value);
                result += `"${fields[i].getName()}":${valueStr}`;

                if (i < fields.length - 1) {
                    result += ',';
                }
            }

            result += '}';
            return result;
        }

        let cls = Class.from<Serializable030>();
        let instance = cls.createInstance();
        let json = serialize(instance, cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_3100
     * @tc.name testEquals031
     * @tc.desc Verify Equals functionality test 030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass031>();
        let instance1 = cls.createInstance();
        let instance2 = cls.createInstance();
        let field = cls.getInstanceField('value')!;

        // Test scenario
        let value1 = field.getValue(instance1);
        let value2 = field.getValue(instance2);

        expect(value1).assertEqual(value2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_3200
     * @tc.name testEquals032
     * @tc.desc Verify Equals functionality test 031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest032>();

        // Test scenario
        let staticField = cls.getStaticField('STATIC_VALUE')!;
        let staticValue = staticField.getValue(cls);
        expect(staticValue).assertEqual('static');

        // Test scenario
        let instanceField = cls.getInstanceField('instanceValue')!;
        let instance = cls.createInstance();
        let instanceValue = instanceField.getValue(instance);
        expect(instanceValue).assertEqual('instance');
    });
    // === Expanded Test Cases ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0330
     * @tc.name testEquals033
     * @tc.desc Verify equals expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_33');
        field.setValue(instance2, 'val_33');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0340
     * @tc.name testEquals034
     * @tc.desc Verify equals expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_34');
        field.setValue(instance2, 'val_34');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0350
     * @tc.name testEquals035
     * @tc.desc Verify equals expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_35');
        field.setValue(instance2, 'val_35');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0360
     * @tc.name testEquals036
     * @tc.desc Verify equals expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_36');
        field.setValue(instance2, 'val_36');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0370
     * @tc.name testEquals037
     * @tc.desc Verify equals expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_37');
        field.setValue(instance2, 'val_37');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0380
     * @tc.name testEquals038
     * @tc.desc Verify equals expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_38');
        field.setValue(instance2, 'val_38');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0390
     * @tc.name testEquals039
     * @tc.desc Verify equals expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_39');
        field.setValue(instance2, 'val_39');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0400
     * @tc.name testEquals040
     * @tc.desc Verify equals expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_40');
        field.setValue(instance2, 'val_40');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0410
     * @tc.name testEquals041
     * @tc.desc Verify equals expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_41');
        field.setValue(instance2, 'val_41');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0420
     * @tc.name testEquals042
     * @tc.desc Verify equals expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_42');
        field.setValue(instance2, 'val_42');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0430
     * @tc.name testEquals043
     * @tc.desc Verify equals expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_43');
        field.setValue(instance2, 'val_43');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0440
     * @tc.name testEquals044
     * @tc.desc Verify equals expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_44');
        field.setValue(instance2, 'val_44');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0450
     * @tc.name testEquals045
     * @tc.desc Verify equals expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_45');
        field.setValue(instance2, 'val_45');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0460
     * @tc.name testEquals046
     * @tc.desc Verify equals expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_46');
        field.setValue(instance2, 'val_46');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0470
     * @tc.name testEquals047
     * @tc.desc Verify equals expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_47');
        field.setValue(instance2, 'val_47');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0480
     * @tc.name testEquals048
     * @tc.desc Verify equals expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_48');
        field.setValue(instance2, 'val_48');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0490
     * @tc.name testEquals049
     * @tc.desc Verify equals expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_49');
        field.setValue(instance2, 'val_49');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0500
     * @tc.name testEquals050
     * @tc.desc Verify equals expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_50');
        field.setValue(instance2, 'val_50');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0510
     * @tc.name testEquals051
     * @tc.desc Verify equals expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_51');
        field.setValue(instance2, 'val_51');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0520
     * @tc.name testEquals052
     * @tc.desc Verify equals expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_52');
        field.setValue(instance2, 'val_52');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0530
     * @tc.name testEquals053
     * @tc.desc Verify equals expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_53');
        field.setValue(instance2, 'val_53');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0540
     * @tc.name testEquals054
     * @tc.desc Verify equals expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_54');
        field.setValue(instance2, 'val_54');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0550
     * @tc.name testEquals055
     * @tc.desc Verify equals expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_55');
        field.setValue(instance2, 'val_55');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0560
     * @tc.name testEquals056
     * @tc.desc Verify equals expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_56');
        field.setValue(instance2, 'val_56');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0570
     * @tc.name testEquals057
     * @tc.desc Verify equals expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_57');
        field.setValue(instance2, 'val_57');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0580
     * @tc.name testEquals058
     * @tc.desc Verify equals expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_58');
        field.setValue(instance2, 'val_58');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0590
     * @tc.name testEquals059
     * @tc.desc Verify equals expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_59');
        field.setValue(instance2, 'val_59');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0600
     * @tc.name testEquals060
     * @tc.desc Verify equals expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_60');
        field.setValue(instance2, 'val_60');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0610
     * @tc.name testEquals061
     * @tc.desc Verify equals expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_61');
        field.setValue(instance2, 'val_61');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0620
     * @tc.name testEquals062
     * @tc.desc Verify equals expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_62');
        field.setValue(instance2, 'val_62');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0630
     * @tc.name testEquals063
     * @tc.desc Verify equals expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_63');
        field.setValue(instance2, 'val_63');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0640
     * @tc.name testEquals064
     * @tc.desc Verify equals expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_64');
        field.setValue(instance2, 'val_64');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0650
     * @tc.name testEquals065
     * @tc.desc Verify equals expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_65');
        field.setValue(instance2, 'val_65');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0660
     * @tc.name testEquals066
     * @tc.desc Verify equals expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_66');
        field.setValue(instance2, 'val_66');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0670
     * @tc.name testEquals067
     * @tc.desc Verify equals expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_67');
        field.setValue(instance2, 'val_67');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0680
     * @tc.name testEquals068
     * @tc.desc Verify equals expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_68');
        field.setValue(instance2, 'val_68');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0690
     * @tc.name testEquals069
     * @tc.desc Verify equals expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_69');
        field.setValue(instance2, 'val_69');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0700
     * @tc.name testEquals070
     * @tc.desc Verify equals expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_70');
        field.setValue(instance2, 'val_70');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0710
     * @tc.name testEquals071
     * @tc.desc Verify equals expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpequalsClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let instance2 = cls.createInstance();
        field.setValue(instance, 'val_71');
        field.setValue(instance2, 'val_71');
        let result = field.equals(instance, instance2);
        expect(result).assertTrue();
    });
