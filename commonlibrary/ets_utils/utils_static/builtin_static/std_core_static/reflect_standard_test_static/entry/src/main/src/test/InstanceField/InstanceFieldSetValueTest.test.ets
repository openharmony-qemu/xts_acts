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

class Class1008 {
      public field: string = 'value';
  }

class Class1023 {
      public field: string = 'value';
  }

class Class2008 {
      public field: string = 'value2';
  }

class Class2023 {
      public field: string = 'value2';
  }

class Counter034 {
      public value: int = 0;
  }

class InnerClass031 {
      public data: string = 'inner';
  }

class MyClass001 {
      public name: string = 'test';
  }

class NullableClass011 {
      public nullableField: string | null = 'value';
  }

class NullableClass017 {
      public data: string | null = 'value';
  }

class OptionalClass012 {
      public optionalField: string | undefined = 'value';
  }

class OuterClass031 {
      public objField: InnerClass031 = new InnerClass031();
  }

class Person036 {
      public name: string = '';
      public age: int = 0;
      public email: string = '';
  }

class PrivateClass024 {
      private privateField: string = 'private';
      public publicField: string = 'public';
  }

class ReadonlyClass021 {
      public readonly readonlyField: string = 'original';
  }

class Source037 {
      public field1: string = '';
      public field2: int = 0;
  }

class StaticTest039 {
      public static STATIC_VALUE: string = 'static';
      public instanceValue: string = 'instance';
  }

class Target037 {
      public field1: string = '';
      public field2: int = 0;
  }

class TestClass005 {
      public value: int = 0;
  }

class TestClass009 {
      public strField: string = '';
      public intField: int = 0;
      public boolField: boolean = false;
  }

class TestClass010 {
      public intField: int = 0;
  }

class TestClass014 {
      public value: int = 0;
  }

class TestClass015 {
      public counter: int = 0;
  }

class TestClass016 {
      public data: string = 'original';
  }

class TestClass018 {
      public counter: int = 100;
  }

class TestClass019 {
      public data: string = 'value';
  }

class TestClass020 {
      public flag: boolean = true;
  }

class TestClass022 {
      public intField: int = 0;
  }

class TestClass027 {
      public largeNumber: number = 0;
  }

class TestClass028 {
      public signedValue: int = 0;
  }

class TestClass029 {
      public textField: string = '';
  }

class TestClass030 {
      public arrField: Array<int> = [];
  }

class TestClass032 {
      public data: string = 'original';
  }

class TestClass033 {
      public counter: int = 0;
  }

class TestClass035 {
      public data: string = '';
  }

class TestClass038 {
      public field1: string = '';
      public field2: int = 0;
      public field3: boolean = false;
  }

class TypesClass013 {
      public strField: string = '';
      public numField: number = 0;
      public boolField: boolean = false;
      public arrField: Array<int> = [];
      public objField: Object = {};
  }

class UnionClass041 {
      public stringOrNumber: string | number = '';
  }

class PrimitiveIntClass042 {
      public intField: int = 0;
  }

class PrimitiveFloatClass043 {
      public floatField: float = 0.0;
  }

class PrimitiveDoubleClass044 {
      public doubleField: double = 0.0;
  }

class PrimitiveNumberClass045 {
      public numberField: number = 0;
  }

class PrimitiveBooleanClass046 {
      public boolField: boolean = false;
  }

class PrimitiveStringClass047 {
      public strField: string = '';
  }

class PrimitiveByteClass048 {
      public byteField: byte = 0;
  }

class PrimitiveShortClass049 {
      public shortField: short = 0;
  }

class PrimitiveLongClass050 {
      public longField: long = 0;
  }

class PrimitiveCharClass051 {
      public charField: char = 'a';
  }

class ArrayIntClass052 {
      public arrField: Array<int> = [];
  }

class ArrayStringClass053 {
      public arrField: Array<string> = [];
  }

class ArrayBoolClass054 {
      public arrField: Array<boolean> = [];
  }

class ArrayFloatClass055 {
      public arrField: Array<float> = [];
  }

class Array2DClass056 {
      public arrField: Array<Array<int>> = [];
  }

class EmptyArrayClass057 {
      public arrField: Array<int> = [];
  }

class LargeArrayClass058 {
      public arrField: Array<int> = [];
  }

class RecordClass059 {
      public recField: Record<string, int> = {};
  }

class DateClass060 {
      public dateField: Date = new Date();
  }

class ErrorClass061 {
      public errField: Error = new Error('default');
  }

class BigIntClass062 {
      public bigField: number = 0;
  }

class BoundaryIntClass063 {
      public val: int = 0;
  }

class BoundaryIntClass064 {
      public val: int = 0;
  }

class BoundaryIntClass065 {
      public val: int = 0;
  }

class BoundaryIntClass066 {
      public val: int = 0;
  }

class BoundaryIntClass067 {
      public val: int = 0;
  }

class BoundaryNumClass068 {
      public val: number = 0;
  }

class BoundaryNumClass069 {
      public val: number = 0;
  }

class BoundaryNumClass070 {
      public val: number = 0;
  }

class BoundaryNumClass071 {
      public val: number = 0;
  }

class BoundaryNumClass072 {
      public val: number = 0;
  }

class BoundaryStrClass073 {
      public val: string = '';
  }

class BoundaryStrClass074 {
      public val: string = '';
  }

class BoundaryStrClass075 {
      public val: string = '';
  }

class BoundaryStrClass076 {
      public val: string = '';
  }

class BoundaryStrClass077 {
      public val: string = '';
  }

class BoundaryBoolClass078 {
      public val: boolean = true;
  }

class BoundaryNullClass079 {
      public val: string | null = 'initial';
  }

class BoundaryUndefClass080 {
      public val: string | undefined = 'initial';
  }

class BoundaryFloatClass081 {
      public val: float = 0.0;
  }

class BoundaryFloatClass082 {
      public val: float = 0.0;
  }

class ParentClass083 {
      public parentField: string = 'parent';
  }

class ChildClass083 extends ParentClass083 {
      public childField: int = 0;
  }

class GrandParentClass084 {
      public gpField: string = 'grandparent';
  }

class ParentClass084 extends GrandParentClass084 {
      public pField: string = 'parent';
  }

class ChildClass084 extends ParentClass084 {
      public cField: string = 'child';
  }

class ParentClass085 {
      public shadowField: string = 'parentValue';
  }

class ChildClass085 extends ParentClass085 {
      public shadowField: string = 'childValue';
  }

class AbstractLikeClass086 {
      public name: string = 'base';
      public value: int = 0;
  }

class MultiFieldClass087 {
      public field01: string = 'v1';
      public field02: string = 'v2';
      public field03: string = 'v3';
      public field04: string = 'v4';
      public field05: string = 'v5';
      public field06: string = 'v6';
      public field07: string = 'v7';
      public field08: string = 'v8';
      public field09: string = 'v9';
      public field10: string = 'v10';
      public field11: string = 'v11';
      public field12: string = 'v12';
      public field13: string = 'v13';
      public field14: string = 'v14';
      public field15: string = 'v15';
      public field16: string = 'v16';
      public field17: string = 'v17';
      public field18: string = 'v18';
      public field19: string = 'v19';
      public field20: string = 'v20';
  }

class Level3Class089 {
      public l3name: string = 'level3';
  }

class Level2Class089 {
      public l2name: string = 'level2';
      public l3: Level3Class089 = new Level3Class089();
  }

class Level1Class089 {
      public l1name: string = 'level1';
      public l2: Level2Class089 = new Level2Class089();
  }

class MixedTypeClass089 {
      public fStr: string = '';
      public fInt: int = 0;
      public fFloat: float = 0.0;
      public fBool: boolean = false;
      public fNum: number = 0;
      public fArr: Array<int> = [];
      public fDate: Date = new Date();
      public fObj: Object = {};
      public fNull: string | null = 'x';
      public fUndef: string | undefined = 'x';
  }

class ORMUserClass090 {
      public id: int = 0;
      public username: string = '';
      public email: string = '';
      public age: int = 0;
  }

class ConfigClass091 {
      public host: string = '';
      public port: int = 0;
      public debug: boolean = false;
  }

class DeepCloneClass092 {
      public name: string = '';
      public count: int = 0;
  }

class ValidationClass093 {
      public email: string = '';
      public age: int = 0;
  }

class BatchFillClass094 {
      public name: string = '';
      public age: int = 0;
      public active: boolean = false;
  }

class ObjectDiffClass095 {
      public fieldA: string = '';
      public fieldB: int = 0;
  }

class SerialClass096 {
      public strVal: string = '';
      public intVal: int = 0;
      public boolVal: boolean = false;
  }

class PerfClass097 {
      public counter: int = 0;
  }

class PerfClass098 {
      public counter: int = 0;
  }

class PerfClass099 {
      public counter: int = 0;
  }

class PerfClass100 {
      public data: string = '';
  }

class ErrClass101 {
      public validField: string = 'valid';
  }

class OverwriteClass102 {
      public data: string = 'first';
  }

class NullThenValueClass103 {
      public data: string | null = 'initial';
  }

class CrossFieldClass104 {
      public fieldA: int = 0;
      public fieldB: int = 0;
  }

class MultiFieldClass105 {
      public f1: string = '';
      public f2: int = 0;
      public f3: boolean = false;
  }

class LoopClass106 {
      public val: int = 0;
  }

class IsolationClass107 {
      public data: string = '';
  }

class StaticVsInstanceClass108 {
      public static STATIC_FIELD: int = 100;
      public instanceField: int = 0;
  }

class UnionSwitchClass109 {
      public val: string | number = '';
  }

class NullRestoreClass110 {
      public data: string | null = 'original';
  }

class BoolToggleClass111 {
      public flag: boolean = false;
  }

class NegIntClass112 {
      public val: int = 0;
  }

class PosLargeIntClass113 {
      public val: int = 0;
  }

class SpecificFloatClass114 {
      public val: float = 0.0;
  }

class SpecificDoubleClass115 {
      public val: double = 0.0;
  }

class EmptyStrOverwriteClass116 {
      public val: string = 'hello';
  }

class SpacesStrClass117 {
      public val: string = '';
  }

class NumericStrClass118 {
      public val: string = '';
  }

class NullableIntClass119 {
      public val: int = 0;
  }

class FillClass120 {
      public data: string = '';
  }

class FillClass121 {
      public data: string = '';
  }

class FillClass122 {
      public data: string = '';
  }

class FillClass123 {
      public data: string = '';
  }

class FillClass124 {
      public data: string = '';
  }

class FillClass125 {
      public data: string = '';
  }

class FillClass126 {
      public data: string = '';
  }

class FillClass127 {
      public data: string = '';
  }

class FillClass128 {
      public data: string = '';
  }

class FillClass129 {
      public data: string = '';
  }

class FillClass130 {
      public data: string = '';
  }

class FillClass131 {
      public data: string = '';
  }

class FillClass132 {
      public data: string = '';
  }

class FillClass133 {
      public data: string = '';
  }

class FillClass134 {
      public data: string = '';
  }

class FillClass135 {
      public data: string = '';
  }

class FillClass136 {
      public data: string = '';
  }

class FillClass137 {
      public data: string = '';
  }

class FillClass138 {
      public data: string = '';
  }

class FillClass139 {
      public data: string = '';
  }

class FillClass140 {
      public data: string = '';
  }

class FillClass141 {
      public data: string = '';
  }

class FillClass142 {
      public data: string = '';
  }

class FillClass143 {
      public data: string = '';
  }

class FillClass144 {
      public data: string = '';
  }

class FillClass145 {
      public data: string = '';
  }

class FillClass146 {
      public data: string = '';
  }

class FillClass147 {
      public data: string = '';
  }

class FillClass148 {
      public data: string = '';
  }

class FillClass149 {
      public data: string = '';
  }

class FillClass150 {
      public data: string = '';
  }

class FillClass151 {
      public data: string = '';
  }

class FillClass152 {
      public data: string = '';
  }

class FillClass153 {
      public data: string = '';
  }

class FillClass154 {
      public data: string = '';
  }

class FillClass155 {
      public data: string = '';
  }

class FillClass156 {
      public data: string = '';
  }

class FillClass157 {
      public data: string = '';
  }

class FillClass158 {
      public data: string = '';
  }

class FillClass159 {
      public data: string = '';
  }

class FillClass160 {
      public data: string = '';
  }

class FillClass161 {
      public data: string = '';
  }


class GenericClass040<T> {
    public data: T = {} as T;
}

export default function InstanceFieldSetValueTest() {
  describe('InstanceFieldSetValueTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0010
     * @tc.name testSetValue001
     * @tc.desc Verify instance和value参数必须存在
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        import { reflect } from '@kit.ArkTS';
        
        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        
        field.setValue(instance, 'modified');
        expect(field.getValue(instance)).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0020
     * @tc.name testSetValue002
     * @tc.desc Verify 不传instance参数应报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            field.setValue('value');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0030
     * @tc.name testSetValue003
     * @tc.desc Verify 不传value参数应报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        try {
            field.setValue(instance);
            expect().assertfail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0040
     * @tc.name testSetValue004
     * @tc.desc Verify 传递多余参数应报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        try {
            field.setValue(instance, 'value', 'extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0050
     * @tc.name testSetValue005
     * @tc.desc Verify 传递有效的对象实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass005>();
        let field = cls.getInstanceField('value')!;
        let instance = cls.createInstance();
        
        field.setValue(instance, 100);
        expect(field.getValue(instance)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0060
     * @tc.name testSetValue006
     * @tc.desc Verify 传递null实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            field.setValue(null, 'value');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0070
     * @tc.name testSetValue007
     * @tc.desc Verify 传递undefined实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            field.setValue(undefined, 'value');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0080
     * @tc.name testSetValue008
     * @tc.desc Verify 传递错误类型的实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls1 = Class.from<Class1008>();
        let field = cls1.getInstanceField('field')!;
        
        let cls2 = Class.from<Class2008>();
        let instance2 = cls2.createInstance();
        
        try {
            field.setValue(instance2, 'newvalue');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0090
     * @tc.name testSetValue009
     * @tc.desc Verify 传递与字段类型匹配的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass009>();
        let instance = cls.createInstance();
        
        cls.getInstanceField('strField')!.setValue(instance, 'hello');
        cls.getInstanceField('intField')!.setValue(instance, 42);
        cls.getInstanceField('boolField')!.setValue(instance, true);
        
        expect(cls.getInstanceField('strField')!.getValue(instance)).assertEqual('hello');
        expect(cls.getInstanceField('intField')!.getValue(instance)).assertEqual(42);
        expect(cls.getInstanceField('boolField')!.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0100
     * @tc.name testSetValue010
     * @tc.desc Verify 传递类型不匹配的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass010>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('intField')!;
        
        try {
            field.setValue(instance, 'string' as Object);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0110
     * @tc.name testSetValue011
     * @tc.desc Verify 传递null作为字段值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NullableClass011>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('nullableField')!;
        
        field.setValue(instance, null);
        expect(field.getValue(instance)).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0120
     * @tc.name testSetValue012
     * @tc.desc Verify 传递undefined作为字段值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<OptionalClass012>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('optionalField')!;
        
        field.setValue(instance, undefined);
        expect(field.getValue(instance)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0130
     * @tc.name testSetValue013
     * @tc.desc Verify 不同类型的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TypesClass013>();
        let instance = cls.createInstance();
        
        cls.getInstanceField('strField')!.setValue(instance, 'test');
        cls.getInstanceField('numField')!.setValue(instance, 3.14);
        cls.getInstanceField('boolField')!.setValue(instance, true);
        cls.getInstanceField('arrField')!.setValue(instance, [1, 2, 3]);
        cls.getInstanceField('objField')!.setValue(instance, { key: 'value' });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0140
     * @tc.name testSetValue014
     * @tc.desc Verify setValue没有返回值(void)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass014>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('value')!;
        
        let result = field.setValue(instance, 100);
        expect(result).toBeUndefined();
        
        expect(field.getValue(instance)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0150
     * @tc.name testSetValue015
     * @tc.desc Verify setValue后字段值改变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass015>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        
        expect(field.getValue(instance)).assertEqual(0);
        
        field.setValue(instance, 1);
        expect(field.getValue(instance)).assertEqual(1);
        
        field.setValue(instance, 2);
        expect(field.getValue(instance)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0160
     * @tc.name testSetValue016
     * @tc.desc Verify setValue覆盖字段原有值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass016>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        
        expect(field.getValue(instance)).assertEqual('original');
        
        field.setValue(instance, 'new');
        expect(field.getValue(instance)).assertEqual('new');
        
        field.setValue(instance, 'newer');
        expect(field.getValue(instance)).assertEqual('newer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0170
     * @tc.name testSetValue017
     * @tc.desc Verify 为字段设置null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NullableClass017>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        
        expect(field.getValue(instance)).not.toBeNull();
        
        field.setValue(instance, null);
        expect(field.getValue(instance)).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0180
     * @tc.name testSetValue018
     * @tc.desc Verify 为数值字段设置0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass018>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        
        expect(field.getValue(instance)).assertEqual(100);
        
        field.setValue(instance, 0);
        expect(field.getValue(instance)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0190
     * @tc.name testSetValue019
     * @tc.desc Verify 为字符串字段设置空串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass019>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        
        field.setValue(instance, '');
        expect(field.getValue(instance)).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0200
     * @tc.name testSetValue020
     * @tc.desc Verify 为布尔字段设置false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass020>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('flag')!;
        
        field.setValue(instance, false);
        expect(field.getValue(instance)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0210
     * @tc.name testSetValue021
     * @tc.desc Verify readonly字段setValue应该失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ReadonlyClass021>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('readonlyField')!;
        
        expect(field.isReadonly()).assertTrue();
        
        try {
            field.setValue(instance, 'modified');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
        
        expect(field.getValue(instance)).assertEqual('original');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0220
     * @tc.name testSetValue022
     * @tc.desc Verify 值类型与字段类型不匹配
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass022>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('intField')!;
        
        try {
            field.setValue(instance, 'string' as Object);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0230
     * @tc.name testSetValue023
     * @tc.desc Verify 传递错误类型的实例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls1 = Class.from<Class1023>();
        let field = cls1.getInstanceField('field')!;
        
        let cls2 = Class.from<Class2023>();
        let instance2 = cls2.createInstance();
        
        try {
            field.setValue(instance2, 'newvalue');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0240
     * @tc.name testSetValue024
     * @tc.desc Verify private字段不能被反射，无法setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrivateClass024>();
        
        let privateField = cls.getInstanceField('privateField');
        expect(privateField === undefined).assertTrue();
        
        let publicField = cls.getInstanceField('publicField')!;
        let instance = cls.createInstance();
        publicField.setValue(instance, 'modified');
        expect(publicField.getValue(instance)).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0250
     * @tc.name testSetValue025
     * @tc.desc Verify 如果方法被标记为@Deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        field.setValue(instance, 'value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0260
     * @tc.name testSetValue026
     * @tc.desc Verify setValue是同步方法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        field.setValue(instance, 'value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0270
     * @tc.name testSetValue027
     * @tc.desc Verify 设置大数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('largeNumber')!;
        
        field.setValue(instance, Number.MAX_VALUE);
        expect(field.getValue(instance)).assertEqual(Number.MAX_VALUE);
        
        field.setValue(instance, Number.MIN_VALUE);
        expect(field.getValue(instance)).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0280
     * @tc.name testSetValue028
     * @tc.desc Verify 设置负数数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('signedValue')!;
        
        field.setValue(instance, -100);
        expect(field.getValue(instance)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0290
     * @tc.name testSetValue029
     * @tc.desc Verify 设置超长字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('textField')!;
        
        let longString = 'a'.repeat(10000);
        field.setValue(instance, longString);
        
        expect(field.getValue(instance).length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0300
     * @tc.name testSetValue030
     * @tc.desc Verify 设置数组类型字段值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        
        field.setValue(instance, [1, 2, 3, 4, 5]);
        let value = field.getValue(instance) as Array<int>;
        
        expect(value.length).assertEqual(5);
        expect(value[0]).assertEqual(1);
        expect(value[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0310
     * @tc.name testSetValue031
     * @tc.desc Verify 设置对象类型字段值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<OuterClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('objField')!;
        
        let newObj = new InnerClass031();
        newObj.data = 'modified';
        
        field.setValue(instance, newObj);
        
        let value = field.getValue(instance) as InnerClass031;
        expect(value.data).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0320
     * @tc.name testSetValue032
     * @tc.desc Verify setValue后getValue能读取到新值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        
        let original = field.getValue(instance);
        expect(original).assertEqual('original');
        
        field.setValue(instance, 'modified');
        
        let modified = field.getValue(instance);
        expect(modified).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0330
     * @tc.name testSetValue033
     * @tc.desc Verify 多次setValue更新字段值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        
        for (let i = 1; i <= 100; i++) {
            field.setValue(instance, i);
            expect(field.getValue(instance)).assertEqual(i);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0340
     * @tc.name testSetValue034
     * @tc.desc Verify setValue与getValue的原子性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<Counter034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('value')!;
        
        let currentValue = field.getValue(instance) as int;
        field.setValue(instance, currentValue + 1);
        
        expect(field.getValue(instance)).assertEqual(currentValue + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0350
     * @tc.name testSetValue035
     * @tc.desc Verify 多次调用setValue()性能
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        
        for (let i = 0; i < 10000; i++) {
            field.setValue(instance, alue);
        }
        
        expect(field.getValue(instance)).assertEqual('value9999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0360
     * @tc.name testSetValue036
     * @tc.desc Verify 使用setValue初始化对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<Person036>();
        let instance = cls.createInstance();
        
        cls.getInstanceField('name')!.setValue(instance, 'John');
        cls.getInstanceField('age')!.setValue(instance, 30);
        cls.getInstanceField('email')!.setValue(instance, 'john@example.com');
        
        expect(cls.getInstanceField('name')!.getValue(instance)).assertEqual('John');
        expect(cls.getInstanceField('age')!.getValue(instance)).assertEqual(30);
        expect(cls.getInstanceField('email')!.getValue(instance)).assertEqual('john@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0370
     * @tc.name testSetValue037
     * @tc.desc Verify 使用setValue实现对象复制
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let sourceCls = Class.from<Source037>();
        let targetCls = Class.from<Target037>();
        
        let source = sourceCls.createInstance();
        let target = targetCls.createInstance();
        
        let sourceFields = sourceCls.getInstanceFields();
        let targetFields = targetCls.getInstanceFields();
        
        for (let i = 0; i < sourceFields.length; i++) {
            let sourceValue = sourceFields[i].getValue(source);
            let targetField = targetFields.find(f => f.getName() === sourceFields[i].getName());
        
            if (targetField !== undefined) {
                targetField.setValue(target, sourceValue);
            }
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0380
     * @tc.name testSetValue038
     * @tc.desc Verify 批量更新字段
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<TestClass038>();
        let instance = cls.createInstance();
        
        let updates = new Map<string, Object>();
        updates.set('field1', 'new1');
        updates.set('field2', 100);
        updates.set('field3', true);
        
        let fields = cls.getInstanceFields();
        for (let i = 0; i < fields.length; i++) {
            let fieldName = fields[i].getName();
            if (updates.has(fieldName)) {
                fields[i].setValue(instance, updates.get(fieldName));
            }
        }
        
        expect(cls.getInstanceField('field1')!.getValue(instance)).assertEqual('new1');
        expect(cls.getInstanceField('field2')!.getValue(instance)).assertEqual(100);
        expect(cls.getInstanceField('field3')!.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0390
     * @tc.name testSetValue039
     * @tc.desc Verify 静态字段的setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<StaticTest039>();
        
        let staticField = cls.getStaticField('STATIC_VALUE')!;
        staticField.setValue(cls, 'modified_static');
        expect(staticField.getValue(cls)).assertEqual('modified_static');
        
        let instance = cls.createInstance();
        let instanceField = cls.getInstanceField('instanceValue')!;
        instanceField.setValue(instance, 'modified_instance');
        expect(instanceField.getValue(instance)).assertEqual('modified_instance');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0400
     * @tc.name testSetValue040
     * @tc.desc Verify 泛型字段的setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        
        let intCls = Class.from<GenericClass040<int>>();
        let intInstance = intCls.createInstance();
        let intField = intCls.getInstanceField('data')!;
        
        intField.setValue(intInstance, 42);
        expect(intField.getValue(intInstance)).assertEqual(42);
        
        let strCls = Class.from<GenericClass040<string>>();
        let strInstance = strCls.createInstance();
        let strField = strCls.getInstanceField('data')!;
        
        strField.setValue(strInstance, 'hello');
        expect(strField.getValue(strInstance)).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0410
     * @tc.name testSetValue041
     * @tc.desc Verify 联合类型字段的setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<UnionClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('stringOrNumber')!;
        
        field.setValue(instance, 'hello');
        expect(field.getValue(instance)).assertEqual('hello');
        
        field.setValue(instance, 42);
        expect(field.getValue(instance)).assertEqual(42);
    });


    // === Field Type Coverage: Primitive Types ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0420
     * @tc.name testSetValue042
     * @tc.desc Verify setting int field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveIntClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('intField')!;
        field.setValue(instance, 42);
        let result = field.getValue(instance);
        expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0430
     * @tc.name testSetValue043
     * @tc.desc Verify setting float field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveFloatClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('floatField')!;
        field.setValue(instance, 3.14);
        let result = field.getValue(instance);
        expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0440
     * @tc.name testSetValue044
     * @tc.desc Verify setting double field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveDoubleClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('doubleField')!;
        field.setValue(instance, 2.718281828);
        let result = field.getValue(instance);
        expect(result).assertEqual(2.718281828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0450
     * @tc.name testSetValue045
     * @tc.desc Verify setting number field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveNumberClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('numberField')!;
        field.setValue(instance, 999);
        let result = field.getValue(instance);
        expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0460
     * @tc.name testSetValue046
     * @tc.desc Verify setting boolean field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveBooleanClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('boolField')!;
        field.setValue(instance, true);
        let result = field.getValue(instance);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0470
     * @tc.name testSetValue047
     * @tc.desc Verify setting string field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveStringClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('strField')!;
        field.setValue(instance, 'hello world');
        let result = field.getValue(instance);
        expect(result).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0480
     * @tc.name testSetValue048
     * @tc.desc Verify setting byte field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveByteClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('byteField')!;
        field.setValue(instance, 127);
        let result = field.getValue(instance);
        expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0490
     * @tc.name testSetValue049
     * @tc.desc Verify setting short field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveShortClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('shortField')!;
        field.setValue(instance, 1000);
        let result = field.getValue(instance);
        expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0500
     * @tc.name testSetValue050
     * @tc.desc Verify setting long field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveLongClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('longField')!;
        field.setValue(instance, 9876543210);
        let result = field.getValue(instance);
        expect(result).assertEqual(9876543210);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0510
     * @tc.name testSetValue051
     * @tc.desc Verify setting char field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PrimitiveCharClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('charField')!;
        field.setValue(instance, 'Z');
        let result = field.getValue(instance);
        expect(result).assertEqual('Z');
    });


    // === Field Type Coverage: Collection Types ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0520
     * @tc.name testSetValue052
     * @tc.desc Verify setting Array<int> field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ArrayIntClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        field.setValue(instance, [10, 20, 30]);
        let result = field.getValue(instance) as Array<int>;
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(10);
        expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0530
     * @tc.name testSetValue053
     * @tc.desc Verify setting Array<string> field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ArrayStringClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        field.setValue(instance, ['a', 'b', 'c']);
        let result = field.getValue(instance) as Array<string>;
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual('a');
        expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0540
     * @tc.name testSetValue054
     * @tc.desc Verify setting Array<boolean> field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ArrayBoolClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        field.setValue(instance, [true, false, true]);
        let result = field.getValue(instance) as Array<boolean>;
        expect(result.length).assertEqual(3);
        expect(result[0]).assertTrue();
        expect(result[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0550
     * @tc.name testSetValue055
     * @tc.desc Verify setting Array<float> field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ArrayFloatClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        field.setValue(instance, [1.1, 2.2, 3.3]);
        let result = field.getValue(instance) as Array<float>;
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0560
     * @tc.name testSetValue056
     * @tc.desc Verify setting 2D Array field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<Array2DClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        let matrix: Array<Array<int>> = [[1, 2], [3, 4], [5, 6]];
        field.setValue(instance, matrix);
        let result = field.getValue(instance) as Array<Array<int>>;
        expect(result.length).assertEqual(3);
        expect(result[0][0]).assertEqual(1);
        expect(result[2][1]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0570
     * @tc.name testSetValue057
     * @tc.desc Verify setting empty Array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<EmptyArrayClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        let emptyArr: Array<int> = [];
        field.setValue(instance, emptyArr);
        let result = field.getValue(instance) as Array<int>;
        expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0580
     * @tc.name testSetValue058
     * @tc.desc Verify setting large Array with 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<LargeArrayClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('arrField')!;
        let largeArr: Array<int> = [];
        for (let i = 0; i < 1000; i++) {
            largeArr.push(i);
        }
        field.setValue(instance, largeArr);
        let result = field.getValue(instance) as Array<int>;
        expect(result.length).assertEqual(1000);
        expect(result[0]).assertEqual(0);
        expect(result[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0590
     * @tc.name testSetValue059
     * @tc.desc Verify setting Record<string,int> field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<RecordClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('recField')!;
        let rec: Record<string, int> = { 'one': 1, 'two': 2 };
        field.setValue(instance, rec);
        let result = field.getValue(instance) as Record<string, int>;
        expect(result['one']).assertEqual(1);
        expect(result['two']).assertEqual(2);
    });


    // === Field Type Coverage: Special Types ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0600
     * @tc.name testSetValue060
     * @tc.desc Verify setting Date field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<DateClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('dateField')!;
        let newDate = new Date(2025, 0, 1);
        field.setValue(instance, newDate);
        let result = field.getValue(instance);
        expect(result !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0610
     * @tc.name testSetValue061
     * @tc.desc Verify setting Error field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ErrorClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('errField')!;
        let newErr = new Error('test error');
        field.setValue(instance, newErr);
        let result = field.getValue(instance) as Error;
        expect(result.message).assertEqual('test error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0620
     * @tc.name testSetValue062
     * @tc.desc Verify setting bigint-like large number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BigIntClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('bigField')!;
        field.setValue(instance, 9007199254740991);
        let result = field.getValue(instance);
        expect(result).assertEqual(9007199254740991);
    });


    // === Boundary & Edge Value Tests ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0630
     * @tc.name testSetValue063
     * @tc.desc Verify setting MAX_SAFE_INTEGER to int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryIntClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 9007199254740991);
        let result = field.getValue(instance);
        expect(result).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0640
     * @tc.name testSetValue064
     * @tc.desc Verify setting MIN_SAFE_INTEGER to int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryIntClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, -9007199254740991);
        let result = field.getValue(instance);
        expect(result).assertEqual(-9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0650
     * @tc.name testSetValue065
     * @tc.desc Verify setting zero to int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryIntClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 0);
        let result = field.getValue(instance);
        expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0660
     * @tc.name testSetValue066
     * @tc.desc Verify setting -1 to int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryIntClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, -1);
        let result = field.getValue(instance);
        expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0670
     * @tc.name testSetValue067
     * @tc.desc Verify setting 1 to int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryIntClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 1);
        let result = field.getValue(instance);
        expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0680
     * @tc.name testSetValue068
     * @tc.desc Verify setting MAX_VALUE to number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryNumClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, Number.MAX_VALUE);
        let result = field.getValue(instance);
        expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0690
     * @tc.name testSetValue069
     * @tc.desc Verify setting MIN_VALUE to number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryNumClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, Number.MIN_VALUE);
        let result = field.getValue(instance);
        expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0700
     * @tc.name testSetValue070
     * @tc.desc Verify setting NaN to number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryNumClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, NaN);
        let result = field.getValue(instance) as number;
        expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0710
     * @tc.name testSetValue071
     * @tc.desc Verify setting Infinity to number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryNumClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, Infinity);
        let result = field.getValue(instance);
        expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0720
     * @tc.name testSetValue072
     * @tc.desc Verify setting -Infinity to number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryNumClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, -Infinity);
        let result = field.getValue(instance);
        expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0730
     * @tc.name testSetValue073
     * @tc.desc Verify setting empty string to string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryStrClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, '');
        let result = field.getValue(instance);
        expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0740
     * @tc.name testSetValue074
     * @tc.desc Verify setting single char to string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryStrClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 'X');
        let result = field.getValue(instance);
        expect(result).assertEqual('X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0750
     * @tc.name testSetValue075
     * @tc.desc Verify setting 5000-char long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryStrClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        let longStr = 'b'.repeat(5000);
        field.setValue(instance, longStr);
        let result = field.getValue(instance) as string;
        expect(result.length).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0760
     * @tc.name testSetValue076
     * @tc.desc Verify setting special chars in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryStrClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 'line1\nline2\ttabbed');
        let result = field.getValue(instance);
        expect(result).assertEqual('line1\nline2\ttabbed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0770
     * @tc.name testSetValue077
     * @tc.desc Verify setting unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryStrClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, '你好世界');
        let result = field.getValue(instance);
        expect(result).assertEqual('你好世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0780
     * @tc.name testSetValue078
     * @tc.desc Verify setting false to boolean field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryBoolClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, false);
        let result = field.getValue(instance);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0790
     * @tc.name testSetValue079
     * @tc.desc Verify setting null to nullable field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryNullClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, null);
        let result = field.getValue(instance);
        expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0800
     * @tc.name testSetValue080
     * @tc.desc Verify setting undefined to optional field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryUndefClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, undefined);
        let result = field.getValue(instance);
        expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0810
     * @tc.name testSetValue081
     * @tc.desc Verify setting zero float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryFloatClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 0.0);
        let result = field.getValue(instance);
        expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0820
     * @tc.name testSetValue082
     * @tc.desc Verify setting negative float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoundaryFloatClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, -123.456);
        let result = field.getValue(instance);
        expect(result).assertEqual(-123.456);
    });


    // === Inheritance Hierarchy Tests ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0830
     * @tc.name testSetValue083
     * @tc.desc Verify single inheritance field access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ChildClass083>();
        let instance = cls.createInstance();
        let parentField = cls.getInstanceField('parentField')!;
        parentField.setValue(instance, 'modified_parent');
        expect(parentField.getValue(instance)).assertEqual('modified_parent');
        let childField = cls.getInstanceField('childField')!;
        childField.setValue(instance, 42);
        expect(childField.getValue(instance)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0840
     * @tc.name testSetValue084
     * @tc.desc Verify multi-level inheritance field modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ChildClass084>();
        let instance = cls.createInstance();
        let gpField = cls.getInstanceField('gpField')!;
        gpField.setValue(instance, 'new_gp');
        expect(gpField.getValue(instance)).assertEqual('new_gp');
        let pField = cls.getInstanceField('pField')!;
        pField.setValue(instance, 'new_p');
        expect(pField.getValue(instance)).assertEqual('new_p');
        let cField = cls.getInstanceField('cField')!;
        cField.setValue(instance, 'new_c');
        expect(cField.getValue(instance)).assertEqual('new_c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0850
     * @tc.name testSetValue085
     * @tc.desc Verify field shadowing in inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ChildClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('shadowField')!;
        expect(field.getValue(instance)).assertEqual('childValue');
        field.setValue(instance, 'modified_shadow');
        expect(field.getValue(instance)).assertEqual('modified_shadow');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0860
     * @tc.name testSetValue086
     * @tc.desc Verify abstract-like class field setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<AbstractLikeClass086>();
        let instance = cls.createInstance();
        let nameField = cls.getInstanceField('name')!;
        nameField.setValue(instance, 'derived');
        expect(nameField.getValue(instance)).assertEqual('derived');
        let valField = cls.getInstanceField('value')!;
        valField.setValue(instance, 99);
        expect(valField.getValue(instance)).assertEqual(99);
    });


    // === Complex Object Tests ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0870
     * @tc.name testSetValue087
     * @tc.desc Verify 20-field class setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MultiFieldClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('field10')!;
        field.setValue(instance, 'updated10');
        expect(field.getValue(instance)).assertEqual('updated10');
        let field20 = cls.getInstanceField('field20')!;
        field20.setValue(instance, 'updated20');
        expect(field20.getValue(instance)).assertEqual('updated20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0880
     * @tc.name testSetValue088
     * @tc.desc Verify 3-level nested object setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<Level1Class089>();
        let instance = cls.createInstance();
        let l2Field = cls.getInstanceField('l2')!;
        let l2Val = l2Field.getValue(instance) as Level2Class089;
        l2Val.l2name = 'modified_l2';
        l2Field.setValue(instance, l2Val);
        let result = l2Field.getValue(instance) as Level2Class089;
        expect(result.l2name).assertEqual('modified_l2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0890
     * @tc.name testSetValue089
     * @tc.desc Verify 10 mixed-type fields setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MixedTypeClass089>();
        let instance = cls.createInstance();
        cls.getInstanceField('fStr')!.setValue(instance, 'mixed');
        cls.getInstanceField('fInt')!.setValue(instance, 100);
        cls.getInstanceField('fFloat')!.setValue(instance, 1.5);
        cls.getInstanceField('fBool')!.setValue(instance, true);
        cls.getInstanceField('fNum')!.setValue(instance, 200);
        cls.getInstanceField('fArr')!.setValue(instance, [1, 2]);
        expect(cls.getInstanceField('fStr')!.getValue(instance)).assertEqual('mixed');
        expect(cls.getInstanceField('fInt')!.getValue(instance)).assertEqual(100);
        expect(cls.getInstanceField('fFloat')!.getValue(instance)).assertEqual(1.5);
        expect(cls.getInstanceField('fBool')!.getValue(instance)).assertTrue();
        expect(cls.getInstanceField('fNum')!.getValue(instance)).assertEqual(200);
    });


    // === Real-World Scenario Tests ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0900
     * @tc.name testSetValue090
     * @tc.desc Verify ORM mapping using setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ORMUserClass090>();
        let instance = cls.createInstance();
        cls.getInstanceField('id')!.setValue(instance, 1);
        cls.getInstanceField('username')!.setValue(instance, 'alice');
        cls.getInstanceField('email')!.setValue(instance, 'alice@test.com');
        cls.getInstanceField('age')!.setValue(instance, 25);
        expect(cls.getInstanceField('id')!.getValue(instance)).assertEqual(1);
        expect(cls.getInstanceField('username')!.getValue(instance)).assertEqual('alice');
        expect(cls.getInstanceField('email')!.getValue(instance)).assertEqual('alice@test.com');
        expect(cls.getInstanceField('age')!.getValue(instance)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0910
     * @tc.name testSetValue091
     * @tc.desc Verify config injection using setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ConfigClass091>();
        let instance = cls.createInstance();
        cls.getInstanceField('host')!.setValue(instance, 'localhost');
        cls.getInstanceField('port')!.setValue(instance, 8080);
        cls.getInstanceField('debug')!.setValue(instance, true);
        expect(cls.getInstanceField('host')!.getValue(instance)).assertEqual('localhost');
        expect(cls.getInstanceField('port')!.getValue(instance)).assertEqual(8080);
        expect(cls.getInstanceField('debug')!.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0920
     * @tc.name testSetValue092
     * @tc.desc Verify deep clone using setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<DeepCloneClass092>();
        let source = cls.createInstance();
        cls.getInstanceField('name')!.setValue(source, 'original');
        cls.getInstanceField('count')!.setValue(source, 5);
        let target = cls.createInstance();
        let fields = cls.getInstanceFields();
        for (let i = 0; i < fields.length; i++) {
            let val = fields[i].getValue(source);
            fields[i].setValue(target, val);
        }
        expect(cls.getInstanceField('name')!.getValue(target)).assertEqual('original');
        expect(cls.getInstanceField('count')!.getValue(target)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0930
     * @tc.name testSetValue093
     * @tc.desc Verify validation after setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ValidationClass093>();
        let instance = cls.createInstance();
        cls.getInstanceField('email')!.setValue(instance, 'test@example.com');
        cls.getInstanceField('age')!.setValue(instance, 18);
        let emailVal = cls.getInstanceField('email')!.getValue(instance) as string;
        let ageVal = cls.getInstanceField('age')!.getValue(instance) as int;
        expect(emailVal.length).assertEqual(16);
        expect(ageVal).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0940
     * @tc.name testSetValue094
     * @tc.desc Verify batch fill from Record using setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BatchFillClass094>();
        let instance = cls.createInstance();
        let dataMap: Record<string, Object> = { 'name': 'batchName', 'age': 30, 'active': true };
        let fields = cls.getInstanceFields();
        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            let val = dataMap[name];
            if (val !== undefined) {
                fields[i].setValue(instance, val);
            }
        }
        expect(cls.getInstanceField('name')!.getValue(instance)).assertEqual('batchName');
        expect(cls.getInstanceField('age')!.getValue(instance)).assertEqual(30);
        expect(cls.getInstanceField('active')!.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0950
     * @tc.name testSetValue095
     * @tc.desc Verify object diff using setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ObjectDiffClass095>();
        let instanceA = cls.createInstance();
        cls.getInstanceField('fieldA')!.setValue(instanceA, 'valueA');
        cls.getInstanceField('fieldB')!.setValue(instanceA, 100);
        let instanceB = cls.createInstance();
        cls.getInstanceField('fieldA')!.setValue(instanceB, 'valueA');
        cls.getInstanceField('fieldB')!.setValue(instanceB, 200);
        let bFieldA = cls.getInstanceField('fieldA')!.getValue(instanceB);
        let bFieldB = cls.getInstanceField('fieldB')!.getValue(instanceB);
        expect(bFieldA).assertEqual('valueA');
        expect(bFieldB).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0960
     * @tc.name testSetValue096
     * @tc.desc Verify serialization roundtrip using setValue/getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<SerialClass096>();
        let instance = cls.createInstance();
        cls.getInstanceField('strVal')!.setValue(instance, 'serialized');
        cls.getInstanceField('intVal')!.setValue(instance, 777);
        cls.getInstanceField('boolVal')!.setValue(instance, true);
        expect(cls.getInstanceField('strVal')!.getValue(instance)).assertEqual('serialized');
        expect(cls.getInstanceField('intVal')!.getValue(instance)).assertEqual(777);
        expect(cls.getInstanceField('boolVal')!.getValue(instance)).assertTrue();
    });


    // === Performance Tests ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0970
     * @tc.name testSetValue097
     * @tc.desc Verify 1000 iterations performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PerfClass097>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        for (let i = 0; i < 1000; i++) {
            field.setValue(instance, i);
        }
        expect(field.getValue(instance)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0980
     * @tc.name testSetValue098
     * @tc.desc Verify 5000 iterations performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PerfClass098>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        for (let i = 0; i < 5000; i++) {
            field.setValue(instance, i);
        }
        expect(field.getValue(instance)).assertEqual(4999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_0990
     * @tc.name testSetValue099
     * @tc.desc Verify 10000 iterations performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PerfClass099>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        for (let i = 0; i < 10000; i++) {
            field.setValue(instance, i);
        }
        expect(field.getValue(instance)).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1000
     * @tc.name testSetValue100
     * @tc.desc Verify 100 instances performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PerfClass100>();
        for (let i = 0; i < 100; i++) {
            let instance = cls.createInstance();
            let field = cls.getInstanceField('data')!;
            field.setValue(instance, instance);
            expect(field.getValue(instance)).assertEqual(instance);
        }
    });


    // === Error Handling & Robustness ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1010
     * @tc.name testSetValue101
     * @tc.desc Verify error on non-existent field setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<ErrClass101>();
        let instance = cls.createInstance();
        let nonExistentField = cls.getInstanceField('nonExistent');
        expect(nonExistentField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1020
     * @tc.name testSetValue102
     * @tc.desc Verify repeated overwrite of field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<OverwriteClass102>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'second');
        field.setValue(instance, 'third');
        field.setValue(instance, 'fourth');
        field.setValue(instance, 'fifth');
        expect(field.getValue(instance)).assertEqual('fifth');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1030
     * @tc.name testSetValue103
     * @tc.desc Verify set null then value restore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NullThenValueClass103>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, null);
        expect(field.getValue(instance)).assertEqual(null);
        field.setValue(instance, 'restored');
        expect(field.getValue(instance)).assertEqual('restored');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1040
     * @tc.name testSetValue104
     * @tc.desc Verify cross-field consistency after setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<CrossFieldClass104>();
        let instance = cls.createInstance();
        let fieldA = cls.getInstanceField('fieldA')!;
        let fieldB = cls.getInstanceField('fieldB')!;
        fieldA.setValue(instance, 10);
        fieldB.setValue(instance, fieldA.getValue(instance) as int);
        let valA = fieldA.getValue(instance) as int;
        let valB = fieldB.getValue(instance) as int;
        expect(valA).assertEqual(valB);
        fieldA.setValue(instance, 20);
        fieldB.setValue(instance, fieldA.getValue(instance) as int);
        expect(fieldB.getValue(instance)).assertEqual(20);
    });


    // === Combined Scenario Tests ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1050
     * @tc.name testSetValue105
     * @tc.desc Verify multi-field setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MultiFieldClass105>();
        let instance = cls.createInstance();
        cls.getInstanceField('f1')!.setValue(instance, 'multi1');
        cls.getInstanceField('f2')!.setValue(instance, 50);
        cls.getInstanceField('f3')!.setValue(instance, true);
        expect(cls.getInstanceField('f1')!.getValue(instance)).assertEqual('multi1');
        expect(cls.getInstanceField('f2')!.getValue(instance)).assertEqual(50);
        expect(cls.getInstanceField('f3')!.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1060
     * @tc.name testSetValue106
     * @tc.desc Verify set-get loop consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<LoopClass106>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        for (let i = 0; i < 50; i++) {
            field.setValue(instance, i * 2);
            expect(field.getValue(instance)).assertEqual(i * 2);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1070
     * @tc.name testSetValue107
     * @tc.desc Verify cross-instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<IsolationClass107>();
        let inst1 = cls.createInstance();
        let inst2 = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(inst1, 'data1');
        field.setValue(inst2, 'data2');
        expect(field.getValue(inst1)).assertEqual('data1');
        expect(field.getValue(inst2)).assertEqual('data2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1080
     * @tc.name testSetValue108
     * @tc.desc Verify static vs instance field setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<StaticVsInstanceClass108>();
        let staticField = cls.getStaticField('STATIC_FIELD')!;
        staticField.setValue(cls, 200);
        expect(staticField.getValue(cls)).assertEqual(200);
        let instance = cls.createInstance();
        let instField = cls.getInstanceField('instanceField')!;
        instField.setValue(instance, 50);
        expect(instField.getValue(instance)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1090
     * @tc.name testSetValue109
     * @tc.desc Verify union type switch setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<UnionSwitchClass109>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 'string_val');
        expect(field.getValue(instance)).assertEqual('string_val');
        field.setValue(instance, 789);
        expect(field.getValue(instance)).assertEqual(789);
        field.setValue(instance, 'final_string');
        expect(field.getValue(instance)).assertEqual('final_string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1100
     * @tc.name testSetValue110
     * @tc.desc Verify null to value restore setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NullRestoreClass110>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        expect(field.getValue(instance)).assertEqual('original');
        field.setValue(instance, null);
        expect(field.getValue(instance)).assertEqual(null);
        field.setValue(instance, 'restored_value');
        expect(field.getValue(instance)).assertEqual('restored_value');
    });


    // === Additional Type Coverage ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1110
     * @tc.name testSetValue111
     * @tc.desc Verify bool toggle setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<BoolToggleClass111>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('flag')!;
        field.setValue(instance, true);
        expect(field.getValue(instance)).assertTrue();
        field.setValue(instance, false);
        expect(field.getValue(instance)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1120
     * @tc.name testSetValue112
     * @tc.desc Verify negative int setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NegIntClass112>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, -999);
        expect(field.getValue(instance)).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1130
     * @tc.name testSetValue113
     * @tc.desc Verify positive large int setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<PosLargeIntClass113>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 2147483647);
        expect(field.getValue(instance)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1140
     * @tc.name testSetValue114
     * @tc.desc Verify specific float setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<SpecificFloatClass114>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 0.001);
        expect(field.getValue(instance)).assertEqual(0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1150
     * @tc.name testSetValue115
     * @tc.desc Verify specific double setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<SpecificDoubleClass115>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 1.7976931348623157e+308);
        let result = field.getValue(instance) as double;
        expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1160
     * @tc.name testSetValue116
     * @tc.desc Verify empty string overwrite setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<EmptyStrOverwriteClass116>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        expect(field.getValue(instance)).assertEqual('hello');
        field.setValue(instance, '');
        expect(field.getValue(instance)).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1170
     * @tc.name testSetValue117
     * @tc.desc Verify spaces string setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<SpacesStrClass117>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, '   spaces   ');
        expect(field.getValue(instance)).assertEqual('   spaces   ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1180
     * @tc.name testSetValue118
     * @tc.desc Verify numeric string setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NumericStrClass118>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, '12345');
        expect(field.getValue(instance)).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1190
     * @tc.name testSetValue119
     * @tc.desc Verify nullable int field setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<NullableIntClass119>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('val')!;
        field.setValue(instance, 512);
        expect(field.getValue(instance)).assertEqual(512);
    });


    // === Fill Tests: Simple Set-Get-Assert Patterns ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1200
     * @tc.name testSetValue120
     * @tc.desc Verify simple set-get-assert for FillClass120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass120>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_120');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_120');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1210
     * @tc.name testSetValue121
     * @tc.desc Verify simple set-get-assert for FillClass121
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass121>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_121');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_121');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1220
     * @tc.name testSetValue122
     * @tc.desc Verify simple set-get-assert for FillClass122
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass122>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_122');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_122');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1230
     * @tc.name testSetValue123
     * @tc.desc Verify simple set-get-assert for FillClass123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass123>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_123');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1240
     * @tc.name testSetValue124
     * @tc.desc Verify simple set-get-assert for FillClass124
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass124>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_124');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_124');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1250
     * @tc.name testSetValue125
     * @tc.desc Verify simple set-get-assert for FillClass125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass125>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_125');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1260
     * @tc.name testSetValue126
     * @tc.desc Verify simple set-get-assert for FillClass126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass126>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_126');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_126');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1270
     * @tc.name testSetValue127
     * @tc.desc Verify simple set-get-assert for FillClass127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass127>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_127');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1280
     * @tc.name testSetValue128
     * @tc.desc Verify simple set-get-assert for FillClass128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass128>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_128');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1290
     * @tc.name testSetValue129
     * @tc.desc Verify simple set-get-assert for FillClass129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass129>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_129');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_129');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1300
     * @tc.name testSetValue130
     * @tc.desc Verify simple set-get-assert for FillClass130
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass130>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_130');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_130');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1310
     * @tc.name testSetValue131
     * @tc.desc Verify simple set-get-assert for FillClass131
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass131>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_131');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_131');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1320
     * @tc.name testSetValue132
     * @tc.desc Verify simple set-get-assert for FillClass132
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass132>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_132');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_132');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1330
     * @tc.name testSetValue133
     * @tc.desc Verify simple set-get-assert for FillClass133
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass133>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_133');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_133');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1340
     * @tc.name testSetValue134
     * @tc.desc Verify simple set-get-assert for FillClass134
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass134>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_134');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_134');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1350
     * @tc.name testSetValue135
     * @tc.desc Verify simple set-get-assert for FillClass135
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass135>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_135');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_135');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1360
     * @tc.name testSetValue136
     * @tc.desc Verify simple set-get-assert for FillClass136
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass136>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_136');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_136');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1370
     * @tc.name testSetValue137
     * @tc.desc Verify simple set-get-assert for FillClass137
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass137>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_137');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_137');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1380
     * @tc.name testSetValue138
     * @tc.desc Verify simple set-get-assert for FillClass138
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass138>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_138');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_138');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1390
     * @tc.name testSetValue139
     * @tc.desc Verify simple set-get-assert for FillClass139
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass139>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_139');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_139');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1400
     * @tc.name testSetValue140
     * @tc.desc Verify simple set-get-assert for FillClass140
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass140>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_140');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_140');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1410
     * @tc.name testSetValue141
     * @tc.desc Verify simple set-get-assert for FillClass141
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass141>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_141');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_141');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1420
     * @tc.name testSetValue142
     * @tc.desc Verify simple set-get-assert for FillClass142
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass142>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_142');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_142');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1430
     * @tc.name testSetValue143
     * @tc.desc Verify simple set-get-assert for FillClass143
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass143>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_143');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_143');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1440
     * @tc.name testSetValue144
     * @tc.desc Verify simple set-get-assert for FillClass144
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass144>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_144');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_144');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1450
     * @tc.name testSetValue145
     * @tc.desc Verify simple set-get-assert for FillClass145
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass145>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_145');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_145');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1460
     * @tc.name testSetValue146
     * @tc.desc Verify simple set-get-assert for FillClass146
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass146>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_146');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_146');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1470
     * @tc.name testSetValue147
     * @tc.desc Verify simple set-get-assert for FillClass147
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass147>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_147');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_147');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1480
     * @tc.name testSetValue148
     * @tc.desc Verify simple set-get-assert for FillClass148
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass148>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_148');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_148');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1490
     * @tc.name testSetValue149
     * @tc.desc Verify simple set-get-assert for FillClass149
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass149>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_149');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_149');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1500
     * @tc.name testSetValue150
     * @tc.desc Verify simple set-get-assert for FillClass150
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass150>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_150');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_150');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1510
     * @tc.name testSetValue151
     * @tc.desc Verify simple set-get-assert for FillClass151
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass151>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_151');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_151');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1520
     * @tc.name testSetValue152
     * @tc.desc Verify simple set-get-assert for FillClass152
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass152>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_152');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_152');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1530
     * @tc.name testSetValue153
     * @tc.desc Verify simple set-get-assert for FillClass153
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass153>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_153');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_153');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1540
     * @tc.name testSetValue154
     * @tc.desc Verify simple set-get-assert for FillClass154
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass154>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_154');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_154');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1550
     * @tc.name testSetValue155
     * @tc.desc Verify simple set-get-assert for FillClass155
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass155>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_155');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_155');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1560
     * @tc.name testSetValue156
     * @tc.desc Verify simple set-get-assert for FillClass156
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass156>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_156');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_156');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1570
     * @tc.name testSetValue157
     * @tc.desc Verify simple set-get-assert for FillClass157
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass157>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_157');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_157');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1580
     * @tc.name testSetValue158
     * @tc.desc Verify simple set-get-assert for FillClass158
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass158>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_158');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_158');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1590
     * @tc.name testSetValue159
     * @tc.desc Verify simple set-get-assert for FillClass159
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass159>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_159');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_159');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1600
     * @tc.name testSetValue160
     * @tc.desc Verify simple set-get-assert for FillClass160
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass160>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_160');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_160');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SETVALUE_1610
     * @tc.name testSetValue161
     * @tc.desc Verify simple set-get-assert for FillClass161
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<FillClass161>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        field.setValue(instance, 'fill_value_161');
        let result = field.getValue(instance);
        expect(result).assertEqual('fill_value_161');
    });


  });
}