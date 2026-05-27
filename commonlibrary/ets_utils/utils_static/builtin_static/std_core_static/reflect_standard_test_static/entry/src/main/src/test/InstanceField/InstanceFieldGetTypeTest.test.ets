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

class AnyTypes011 {
      public anyField: Object = null;
  }

class ArrayTypes006 {
      public intArray: Array<int> = [];
      public stringArray: Array<string> = [];
  }

class ComplexTypes018 {
      public arrayOfArrays: Array<Array<int>> = [[]];
      public mapOfArrays: Map<string, Array<int>> = new Map();
      public unionOfArrays: Array<int> | Array<string> = [];
  }

class ConversionClass021 {
      public value: Object = {};
  }

class FieldInfo025 {
      public value: int = 0;
  }

class GenericTypes008 {
      public intContainer: Container<int> = new Container<int>();
      public stringContainer: Container<string> = new Container<string>();
  }

class InnerClass005 {}

class MixedTypes020 {
      public intField: int = 0;
      public stringField: string = '';
  }

class MyClass001 {
      public name: string = 'test';
  }

class Node019 {
      public value: int = 0;
      public next: Node | null = null;
  }

class NullTypes009 {
      public nullableField: string | null = null;
  }

class OuterClass005 {
      public objectField: InnerClass = new InnerClass();
  }

class PrimitiveTypes004 {
      public intField: int = 0;
      public doubleField: double = 0.0;
      public boolField: boolean = false;
      public charField: char = c'A';
      public stringField: string = '';
      public numberField: number = 0;
  }

class StaticTypes024 {
      public static STATIC_VALUE: string = 'static';
      public instanceValue: string = 'instance';
  }

class TestClass003 {
      public name: string = 'test';
  }

class TestClass012 {
      public value: int = 42;
  }

class TestClass022 {
      public data: string = '';
  }

class TestClass023 {
      public value: int = 0;
  }

class TypeNames013 {
      public str: string = '';
      public num: number = 0;
      public bool: boolean = false;
  }

class UndefinedTypes010 {
      public optionalField: string | undefined = undefined;
  }

class UnionTypes007 {
      public stringOrNumber: string | number = '';
      public intOrNull: int | null = 0;
  }

class ExpgetTypeClass026 {
      public data: string = 'default';
  }

class ExpgetTypeClass027 {
      public data: string = 'default';
  }

class ExpgetTypeClass028 {
      public data: string = 'default';
  }

class ExpgetTypeClass029 {
      public data: string = 'default';
  }

class ExpgetTypeClass030 {
      public data: string = 'default';
  }

class ExpgetTypeClass031 {
      public data: string = 'default';
  }

class ExpgetTypeClass032 {
      public data: string = 'default';
  }

class ExpgetTypeClass033 {
      public data: string = 'default';
  }

class ExpgetTypeClass034 {
      public data: string = 'default';
  }

class ExpgetTypeClass035 {
      public data: string = 'default';
  }

class ExpgetTypeClass036 {
      public data: string = 'default';
  }

class ExpgetTypeClass037 {
      public data: string = 'default';
  }

class ExpgetTypeClass038 {
      public data: string = 'default';
  }

class ExpgetTypeClass039 {
      public data: string = 'default';
  }

class ExpgetTypeClass040 {
      public data: string = 'default';
  }

class ExpgetTypeClass041 {
      public data: string = 'default';
  }

class ExpgetTypeClass042 {
      public data: string = 'default';
  }

class ExpgetTypeClass043 {
      public data: string = 'default';
  }

class ExpgetTypeClass044 {
      public data: string = 'default';
  }

class ExpgetTypeClass045 {
      public data: string = 'default';
  }

class ExpgetTypeClass046 {
      public data: string = 'default';
  }

class ExpgetTypeClass047 {
      public data: string = 'default';
  }

class ExpgetTypeClass048 {
      public data: string = 'default';
  }

class ExpgetTypeClass049 {
      public data: string = 'default';
  }

class ExpgetTypeClass050 {
      public data: string = 'default';
  }

class ExpgetTypeClass051 {
      public data: string = 'default';
  }

class ExpgetTypeClass052 {
      public data: string = 'default';
  }

class ExpgetTypeClass053 {
      public data: string = 'default';
  }

class ExpgetTypeClass054 {
      public data: string = 'default';
  }

class ExpgetTypeClass055 {
      public data: string = 'default';
  }

class ExpgetTypeClass056 {
      public data: string = 'default';
  }

class ExpgetTypeClass057 {
      public data: string = 'default';
  }

class ExpgetTypeClass058 {
      public data: string = 'default';
  }

class ExpgetTypeClass059 {
      public data: string = 'default';
  }

class ExpgetTypeClass060 {
      public data: string = 'default';
  }

class ExpgetTypeClass061 {
      public data: string = 'default';
  }

class ExpgetTypeClass062 {
      public data: string = 'default';
  }

class ExpgetTypeClass063 {
      public data: string = 'default';
  }

class ExpgetTypeClass064 {
      public data: string = 'default';
  }

class ExpgetTypeClass065 {
      public data: string = 'default';
  }

class ExpgetTypeClass066 {
      public data: string = 'default';
  }

class ExpgetTypeClass067 {
      public data: string = 'default';
  }

class ExpgetTypeClass068 {
      public data: string = 'default';
  }

class ExpgetTypeClass069 {
      public data: string = 'default';
  }

class ExpgetTypeClass070 {
      public data: string = 'default';
  }

class ExpgetTypeClass071 {
      public data: string = 'default';
  }

class ExpgetTypeClass072 {
      public data: string = 'default';
  }

class ExpgetTypeClass073 {
      public data: string = 'default';
  }

class ExpgetTypeClass074 {
      public data: string = 'default';
  }

class ExpgetTypeClass075 {
      public data: string = 'default';
  }

class ExpgetTypeClass076 {
      public data: string = 'default';
  }

class ExpgetTypeClass077 {
      public data: string = 'default';
  }

class ExpgetTypeClass078 {
      public data: string = 'default';
  }

class ExpgetTypeClass079 {
      public data: string = 'default';
  }

class ExpgetTypeClass080 {
      public data: string = 'default';
  }

class ExpgetTypeClass081 {
      public data: string = 'default';
  }

class ExpgetTypeClass082 {
      public data: string = 'default';
  }

class ExpgetTypeClass083 {
      public data: string = 'default';
  }

class ExpgetTypeClass084 {
      public data: string = 'default';
  }

class ExpgetTypeClass085 {
      public data: string = 'default';
  }

class ExpgetTypeClass086 {
      public data: string = 'default';
  }

class ExpgetTypeClass087 {
      public data: string = 'default';
  }

class ExpgetTypeClass088 {
      public data: string = 'default';
  }

class ExpgetTypeClass089 {
      public data: string = 'default';
  }

class ExpgetTypeClass090 {
      public data: string = 'default';
  }

class ExpgetTypeClass091 {
      public data: string = 'default';
  }

class ExpgetTypeClass092 {
      public data: string = 'default';
  }

class ExpgetTypeClass093 {
      public data: string = 'default';
  }

class ExpgetTypeClass094 {
      public data: string = 'default';
  }

class ExpgetTypeClass095 {
      public data: string = 'default';
  }

class ExpgetTypeClass096 {
      public data: string = 'default';
  }

class ExpgetTypeClass097 {
      public data: string = 'default';
  }

class ExpgetTypeClass098 {
      public data: string = 'default';
  }

class ExpgetTypeClass099 {
      public data: string = 'default';
  }

class ExpgetTypeClass100 {
      public data: string = 'default';
  }

class ExpgetTypeClass101 {
      public data: string = 'default';
  }

class ExpgetTypeClass102 {
      public data: string = 'default';
  }

class ExpgetTypeClass103 {
      public data: string = 'default';
  }

class ExpgetTypeClass104 {
      public data: string = 'default';
  }

class ExpgetTypeClass105 {
      public data: string = 'default';
  }

class ExpgetTypeClass106 {
      public data: string = 'default';
  }

class ExpgetTypeClass107 {
      public data: string = 'default';
  }

class ExpgetTypeClass108 {
      public data: string = 'default';
  }

class ExpgetTypeClass109 {
      public data: string = 'default';
  }

class ExpgetTypeClass110 {
      public data: string = 'default';
  }

class ExpgetTypeClass111 {
      public data: string = 'default';
  }

class ExpgetTypeClass112 {
      public data: string = 'default';
  }

class ExpgetTypeClass113 {
      public data: string = 'default';
  }

class ExpgetTypeClass114 {
      public data: string = 'default';
  }

class ExpgetTypeClass115 {
      public data: string = 'default';
  }

class ExpgetTypeClass116 {
      public data: string = 'default';
  }

class ExpgetTypeClass117 {
      public data: string = 'default';
  }

class ExpgetTypeClass118 {
      public data: string = 'default';
  }

class ExpgetTypeClass119 {
      public data: string = 'default';
  }

class ExpgetTypeClass120 {
      public data: string = 'default';
  }

class Container<T> {
            public value: T = {} as T;
        }

        let cls = Class.from<GenericTypes008>();
        let field = cls.getInstanceField('intContainer')!;
        let fieldType = field.getType();

        expect(fieldType).not.toBeNull();
        expect(fieldType.getName()).toContain('Container');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0900
     * @tc.name testGetType009
     * @tc.desc Verify GetType functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullTypes009>();
        let field = cls.getInstanceField('nullableField')!;
        let fieldType = field.getType();

        expect(fieldType).not.toBeNull();
        // Test scenario
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1000
     * @tc.name testGetType010
     * @tc.desc Verify GetType functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UndefinedTypes010>();
        let field = cls.getInstanceField('optionalField')!;
        let fieldType = field.getType();

        expect(fieldType).not.toBeNull();
        // Test scenario
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1100
     * @tc.name testGetType011
     * @tc.desc Verify GetType functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AnyTypes011>();
        let field = cls.getInstanceField('anyField')!;
        let fieldType = field.getType();

        expect(fieldType).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1200
     * @tc.name testGetType012
     * @tc.desc Verify GetType functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass012>();
        let field = cls.getInstanceField('value')!;
        let fieldType = field.getType();

        // Test scenario
        expect(fieldType.getName()).not.toBeNull();
        expect(fieldType.isPrimitive()).assertTrue();
        expect(fieldType.isInterface()).assertFalse();
        expect(fieldType.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1300
     * @tc.name testGetType013
     * @tc.desc Verify GetType functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypeNames013>();

        let strField = cls.getInstanceField('str')!;
        expect(strField.getType().getName()).assertEqual('std.core.String');

        let numField = cls.getInstanceField('num')!;
        expect(numField.getType().getName()).assertEqual('f64'); // number  64

        let boolField = cls.getInstanceField('bool')!;
        expect(boolField.getType().getName()).assertEqual('bool');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1400
     * @tc.name testGetType014
     * @tc.desc Verify GetType functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let fieldType = field.getType('extra');
            expect().assertFail();
        }

export default function InstanceFieldGetTypeTest() {
  describe('InstanceFieldGetTypeTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0100
     * @tc.name testGetType001
     * @tc.desc Verify getType functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let fieldType = field.getType();
        expect(fieldType).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0200
     * @tc.name testGetType002
     * @tc.desc Verify GetType functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        // Test scenario
        try {
            let fieldType = field.getType('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0300
     * @tc.name testGetType003
     * @tc.desc Verify GetType functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
        let field = cls.getInstanceField('name')!;
        let fieldType = field.getType();

        expect(fieldType instanceof reflect.Class).assertTrue();
        expect(fieldType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0400
     * @tc.name testGetType004
     * @tc.desc Verify GetType functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveTypes004>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let fieldType = fields[i].getType();
            expect(fieldType).not.toBeNull();
            expect(fieldType instanceof reflect.Class).assertTrue();
            console.info(`${fields[i].getName()}: ${fieldType.getName()}`);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0500
     * @tc.name testGetType005
     * @tc.desc Verify GetType functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OuterClass005>();
        let field = cls.getInstanceField('objectField')!;
        let fieldType = field.getType();

        expect(fieldType).not.toBeNull();
        expect(fieldType.getName()).toContain('InnerClass005');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0600
     * @tc.name testGetType006
     * @tc.desc Verify GetType functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayTypes006>();
        let intArrayField = cls.getInstanceField('intArray')!;
        let intArrayType = intArrayField.getType();

        expect(intArrayType).not.toBeNull();
        expect(intArrayType.getName()).assertEqual('std.core.Array');

        // Test scenario
        let elementType = intArrayType.getFixedArrayComponentType();
        expect(elementType).not.toBeNull();
        expect(elementType!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0700
     * @tc.name testGetType007
     * @tc.desc Verify GetType functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnionTypes007>();
        let field1 = cls.getInstanceField('stringOrNumber')!;
        let type1 = field1.getType();

        // Test scenario
        expect(type1).not.toBeNull();
        expect(type1.isUnion()).assertTrue();

        let unionTypes = type1.getUnionConstituentTypes();
        if (unionTypes !== undefined) {
            expect(unionTypes.length).assertGreaterThan(0);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0800
     * @tc.name testGetType008
     * @tc.desc Verify GetType functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1500
     * @tc.name testGetType015
     * @tc.desc Verify GetType functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>();
        cls.initialize();
        let field = cls.getInstanceField('name')!;
        let fieldType = field.getType();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1600
     * @tc.name testGetType016
     * @tc.desc Verify GetType functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let fieldType = field.getType(); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1700
     * @tc.name testGetType017
     * @tc.desc Verify GetType functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let fieldType = field.getType(); //
        expect(fieldType).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1800
     * @tc.name testGetType018
     * @tc.desc Verify GetType functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComplexTypes018>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let fieldType = fields[i].getType();
            expect(fieldType).not.toBeNull();
            console.info(`${fields[i].getName()}: ${fieldType.getName()}`);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1900
     * @tc.name testGetType019
     * @tc.desc Verify GetType functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Node019>();
        let nextField = cls.getInstanceField('next')!;
        let nextType = nextField.getType();

        expect(nextType).not.toBeNull();
        // Test scenario
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_2000
     * @tc.name testGetType020
     * @tc.desc Verify GetType functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let fieldType = fields[i].getType();

            if (fieldType.isPrimitive()) {
                console.info(`${fields[i].getName()} is primitive`);
            }

            if (fieldType.getName() === 'std.core.String') {
                console.info(`${fields[i].getName()} is string`);
            }
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_2100
     * @tc.name testGetType021
     * @tc.desc Verify GetType functionality test 020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConversionClass021>();
        let field = cls.getInstanceField('value')!;
        let fieldType = field.getType();

        let instance = cls.createInstance();
        let objValue = field.getValue(instance);

        // Test scenario
        if (fieldType.getName() === 'std.core.String') {
            let strValue = objValue as string;
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_2200
     * @tc.name testGetType022
     * @tc.desc Verify GetType functionality test 021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass022>();
        let field = cls.getInstanceField('data')!;

        // Test scenario
        for (let i = 0; i < 1000; i++) {
            let fieldType = field.getType();
            expect(fieldType).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_2300
     * @tc.name testGetType023
     * @tc.desc Verify GetType functionality test 022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass023>();
        let field = cls.getInstanceField('value')!;

        let type1 = field.getType();
        let type2 = field.getType();
        let type3 = field.getType();

        // Test scenario
        expect(type1.getName()).assertEqual(type2.getName());
        expect(type2.getName()).assertEqual(type3.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_2400
     * @tc.name testGetType024
     * @tc.desc Verify GetType functionality test 023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTypes024>();

        // Test scenario
        let staticField = cls.getStaticField('STATIC_VALUE')!;
        let staticFieldType = staticField.getType();
        expect(staticFieldType).not.toBeNull();
        expect(staticFieldType.getName()).assertEqual('std.core.String');

        // Test scenario
        let instanceField = cls.getInstanceField('instanceValue')!;
        let instanceFieldType = instanceField.getType();
        expect(instanceFieldType).not.toBeNull();
        expect(instanceFieldType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_2500
     * @tc.name testGetType025
     * @tc.desc Verify GetType functionality test 024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FieldInfo025>();
        let field = cls.getInstanceField('value')!;

        // Test scenario
        let fieldType = field.getType();
        console.info(`Field type: ${fieldType.getName()}`); // i32

        // Test scenario
        let ownerClass = field.getOwner();
        console.info(`Owner class: ${ownerClass.getName()}`); // FieldInfo025
    });
    // === Expanded Test Cases ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0260
     * @tc.name testGetType026
     * @tc.desc Verify getType expanded test 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0270
     * @tc.name testGetType027
     * @tc.desc Verify getType expanded test 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0280
     * @tc.name testGetType028
     * @tc.desc Verify getType expanded test 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0290
     * @tc.name testGetType029
     * @tc.desc Verify getType expanded test 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0300
     * @tc.name testGetType030
     * @tc.desc Verify getType expanded test 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0310
     * @tc.name testGetType031
     * @tc.desc Verify getType expanded test 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0320
     * @tc.name testGetType032
     * @tc.desc Verify getType expanded test 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0330
     * @tc.name testGetType033
     * @tc.desc Verify getType expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0340
     * @tc.name testGetType034
     * @tc.desc Verify getType expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0350
     * @tc.name testGetType035
     * @tc.desc Verify getType expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0360
     * @tc.name testGetType036
     * @tc.desc Verify getType expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0370
     * @tc.name testGetType037
     * @tc.desc Verify getType expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0380
     * @tc.name testGetType038
     * @tc.desc Verify getType expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0390
     * @tc.name testGetType039
     * @tc.desc Verify getType expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0400
     * @tc.name testGetType040
     * @tc.desc Verify getType expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0410
     * @tc.name testGetType041
     * @tc.desc Verify getType expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0420
     * @tc.name testGetType042
     * @tc.desc Verify getType expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0430
     * @tc.name testGetType043
     * @tc.desc Verify getType expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0440
     * @tc.name testGetType044
     * @tc.desc Verify getType expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0450
     * @tc.name testGetType045
     * @tc.desc Verify getType expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0460
     * @tc.name testGetType046
     * @tc.desc Verify getType expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0470
     * @tc.name testGetType047
     * @tc.desc Verify getType expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0480
     * @tc.name testGetType048
     * @tc.desc Verify getType expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0490
     * @tc.name testGetType049
     * @tc.desc Verify getType expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0500
     * @tc.name testGetType050
     * @tc.desc Verify getType expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0510
     * @tc.name testGetType051
     * @tc.desc Verify getType expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0520
     * @tc.name testGetType052
     * @tc.desc Verify getType expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0530
     * @tc.name testGetType053
     * @tc.desc Verify getType expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0540
     * @tc.name testGetType054
     * @tc.desc Verify getType expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0550
     * @tc.name testGetType055
     * @tc.desc Verify getType expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0560
     * @tc.name testGetType056
     * @tc.desc Verify getType expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0570
     * @tc.name testGetType057
     * @tc.desc Verify getType expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0580
     * @tc.name testGetType058
     * @tc.desc Verify getType expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0590
     * @tc.name testGetType059
     * @tc.desc Verify getType expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0600
     * @tc.name testGetType060
     * @tc.desc Verify getType expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0610
     * @tc.name testGetType061
     * @tc.desc Verify getType expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0620
     * @tc.name testGetType062
     * @tc.desc Verify getType expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0630
     * @tc.name testGetType063
     * @tc.desc Verify getType expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0640
     * @tc.name testGetType064
     * @tc.desc Verify getType expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0650
     * @tc.name testGetType065
     * @tc.desc Verify getType expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0660
     * @tc.name testGetType066
     * @tc.desc Verify getType expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0670
     * @tc.name testGetType067
     * @tc.desc Verify getType expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0680
     * @tc.name testGetType068
     * @tc.desc Verify getType expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0690
     * @tc.name testGetType069
     * @tc.desc Verify getType expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0700
     * @tc.name testGetType070
     * @tc.desc Verify getType expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0710
     * @tc.name testGetType071
     * @tc.desc Verify getType expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0720
     * @tc.name testGetType072
     * @tc.desc Verify getType expanded test 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0730
     * @tc.name testGetType073
     * @tc.desc Verify getType expanded test 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0740
     * @tc.name testGetType074
     * @tc.desc Verify getType expanded test 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0750
     * @tc.name testGetType075
     * @tc.desc Verify getType expanded test 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0760
     * @tc.name testGetType076
     * @tc.desc Verify getType expanded test 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0770
     * @tc.name testGetType077
     * @tc.desc Verify getType expanded test 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0780
     * @tc.name testGetType078
     * @tc.desc Verify getType expanded test 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0790
     * @tc.name testGetType079
     * @tc.desc Verify getType expanded test 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0800
     * @tc.name testGetType080
     * @tc.desc Verify getType expanded test 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0810
     * @tc.name testGetType081
     * @tc.desc Verify getType expanded test 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0820
     * @tc.name testGetType082
     * @tc.desc Verify getType expanded test 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0830
     * @tc.name testGetType083
     * @tc.desc Verify getType expanded test 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0840
     * @tc.name testGetType084
     * @tc.desc Verify getType expanded test 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass084>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0850
     * @tc.name testGetType085
     * @tc.desc Verify getType expanded test 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0860
     * @tc.name testGetType086
     * @tc.desc Verify getType expanded test 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass086>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0870
     * @tc.name testGetType087
     * @tc.desc Verify getType expanded test 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0880
     * @tc.name testGetType088
     * @tc.desc Verify getType expanded test 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0890
     * @tc.name testGetType089
     * @tc.desc Verify getType expanded test 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass089>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0900
     * @tc.name testGetType090
     * @tc.desc Verify getType expanded test 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass090>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0910
     * @tc.name testGetType091
     * @tc.desc Verify getType expanded test 91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass091>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0920
     * @tc.name testGetType092
     * @tc.desc Verify getType expanded test 92
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass092>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0930
     * @tc.name testGetType093
     * @tc.desc Verify getType expanded test 93
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass093>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0940
     * @tc.name testGetType094
     * @tc.desc Verify getType expanded test 94
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass094>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0950
     * @tc.name testGetType095
     * @tc.desc Verify getType expanded test 95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass095>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0960
     * @tc.name testGetType096
     * @tc.desc Verify getType expanded test 96
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass096>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0970
     * @tc.name testGetType097
     * @tc.desc Verify getType expanded test 97
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass097>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0980
     * @tc.name testGetType098
     * @tc.desc Verify getType expanded test 98
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass098>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_0990
     * @tc.name testGetType099
     * @tc.desc Verify getType expanded test 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass099>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1000
     * @tc.name testGetType100
     * @tc.desc Verify getType expanded test 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass100>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1010
     * @tc.name testGetType101
     * @tc.desc Verify getType expanded test 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass101>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1020
     * @tc.name testGetType102
     * @tc.desc Verify getType expanded test 102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass102>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1030
     * @tc.name testGetType103
     * @tc.desc Verify getType expanded test 103
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass103>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1040
     * @tc.name testGetType104
     * @tc.desc Verify getType expanded test 104
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass104>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1050
     * @tc.name testGetType105
     * @tc.desc Verify getType expanded test 105
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass105>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1060
     * @tc.name testGetType106
     * @tc.desc Verify getType expanded test 106
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass106>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1070
     * @tc.name testGetType107
     * @tc.desc Verify getType expanded test 107
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass107>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1080
     * @tc.name testGetType108
     * @tc.desc Verify getType expanded test 108
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass108>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1090
     * @tc.name testGetType109
     * @tc.desc Verify getType expanded test 109
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass109>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1100
     * @tc.name testGetType110
     * @tc.desc Verify getType expanded test 110
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass110>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1110
     * @tc.name testGetType111
     * @tc.desc Verify getType expanded test 111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass111>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1120
     * @tc.name testGetType112
     * @tc.desc Verify getType expanded test 112
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass112>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1130
     * @tc.name testGetType113
     * @tc.desc Verify getType expanded test 113
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass113>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1140
     * @tc.name testGetType114
     * @tc.desc Verify getType expanded test 114
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass114>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1150
     * @tc.name testGetType115
     * @tc.desc Verify getType expanded test 115
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass115>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1160
     * @tc.name testGetType116
     * @tc.desc Verify getType expanded test 116
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass116>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1170
     * @tc.name testGetType117
     * @tc.desc Verify getType expanded test 117
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass117>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1180
     * @tc.name testGetType118
     * @tc.desc Verify getType expanded test 118
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass118>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1190
     * @tc.name testGetType119
     * @tc.desc Verify getType expanded test 119
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass119>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETTYPE_1200
     * @tc.name testGetType120
     * @tc.desc Verify getType expanded test 120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetTypeClass120>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getType();
        expect(result).not.toBeNull();
    });
  });
}
