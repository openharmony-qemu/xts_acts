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
      public field: string = 'class1';
  }

class Class1015 {
      public field: string = 'value';
  }

class Class2008 {
      public field: string = 'class2';
  }

class Class2015 {
      public field: string = 'value2';
  }

class MyClass001 {
      public name: string = 'test';
  }

class NullClass012 {
      public nullableField: string | null = null;
      public normalField: string = 'value';
  }

class TestClass004 {
      public value: int = 42;
  }

class TestClass005 {
      public data: string = 'hello';
  }

class TestClass010 {
      public stringValue: string = 'test';
      public numberValue: int = 100;
      public boolValue: boolean = true;
  }

class TestClass014 {
      public intField: int = 0;
      public stringField: string = '';
      public boolField: boolean = false;
  }

class TestClass021 {
      public counter: int = 0;
  }

class TestClass023 {
      public data: string = 'test';
  }

class TypesClass011 {
      public strField: string = '';
      public numField: number = 0.0;
      public boolField: boolean = false;
      public arrField: Array<int> = [];
      public objField: Object = {};
      public nullField: string | null = null;
  }

class ZeroClass013 {
      public zeroInt: int = 0;
      public zeroDouble: double = 0.0;
      public emptyString: string = '';
      public zeroBool: boolean = false;
  }

class LargeObject019 {
      public data: Array<int> = [];
  }

class Node020 {
      public value: int = 0;
      public next: Node | null = null;
  }

class Person022 {
      public name: string = '';
      public age: int = 0;
      public email: string = '';
  }

class ReadonlyClass016 {
      public readonly readonlyField: string = 'readonly';
  }

class Serializable024 {
      public id: int = 0;
      public name: string = '';
      public active: boolean = true;
  }

class StaticTest025 {
      public static STATIC_VALUE: string = 'static';
      public instanceValue: string = 'instance';
  }

class PrimitiveInt026 {
    public intField: int = 42;
}

class PrimitiveDouble027 {
    public doubleField: double = 3.14;
}

class PrimitiveString028 {
    public stringField: string = 'hello_world';
}

class PrimitiveBoolean029 {
    public boolField: boolean = true;
}

class PrimitiveLong030 {
    public longField: long = 2147483648;
}

class PrimitiveShort031 {
    public shortField: short = 32767;
}

class PrimitiveByte032 {
    public byteField: byte = 127;
}

class PrimitiveFloat033 {
    public floatField: float = 1.5;
}

class PrimitiveNumber034 {
    public numberField: number = 99.99;
}

class PrimitiveMulti035 {
    public intF: int = 10;
    public doubleF: double = 20.5;
    public stringF: string = 'multi';
    public boolF: boolean = false;
    public longF: long = 1000;
    public sb: short = 100;
    public bt: byte = 64;
    public fl: float = 3.14;
    public num: number = 7.77;
}

class CollectionIntArray036 {
    public intArr: Array<int> = [1, 2, 3, 4, 5];
}

class CollectionStrArray037 {
    public strArr: Array<string> = ['alpha', 'beta', 'gamma'];
}

class CollectionBoolArray038 {
    public boolArr: Array<boolean> = [true, false, true];
}

class CollectionDoubleArray039 {
    public doubleArr: Array<double> = [1.1, 2.2, 3.3];
}

class Collection2DArray040 {
    public arr2d: Array<Array<int>> = [[1, 2], [3, 4], [5, 6]];
}

class CollectionEmptyArray041 {
    public emptyArr: Array<int> = [];
}

class CollectionLargeArray042 {
    public largeArr: Array<int> = [];
}

class CollectionMixedArray043 {
    public intArr: Array<int> = [1, 2, 3];
    public strArr: Array<string> = ['x', 'y'];
    public boolArr: Array<boolean> = [true];
}

class SpecialObject044 {
    public objField: Object = {};
}

class SpecialNullable045 {
    public nullStr: string | null = null;
    public nullInt: int | null = null;
}

class SpecialLargeNumber046 {
    public largeNum: number = 9999999999;
}

class BoundaryIntMax047 {
    public maxInt: int = 2147483647;
}

class BoundaryIntMin048 {
    public minInt: int = -2147483648;
}

class BoundaryIntZero049 {
    public zeroInt: int = 0;
}

class BoundaryIntNeg050 {
    public negInt: int = -1;
}

class BoundaryDoubleMax051 {
    public maxDouble: double = 1.7976931348623157e308;
}

class BoundaryDoubleMin052 {
    public minDouble: double = 5e-324;
}

class BoundaryDoubleZero053 {
    public zeroDouble: double = 0.0;
}

class BoundaryDoubleNeg054 {
    public negDouble: double = -1.0;
}

class BoundaryStringEmpty055 {
    public emptyStr: string = '';
}

class BoundaryStringLong056 {
    public longStr: string = 'aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffff';
}

class BoundaryStringSpecial057 {
    public specialStr: string = '!@#$%^&*()_+-=[]{}|;:' + '"' + ',.<>?/~`';
}

class BoundaryStringUnicode058 {
    public unicodeStr: string = '\u4f60\u597d\u4e16\u754c\ud83c\udf0d';
}

class BoundaryBooleanTrue059 {
    public trueBool: boolean = true;
}

class BoundaryBooleanFalse060 {
    public falseBool: boolean = false;
}

class BoundaryFloatMax061 {
    public maxFloat: float = 3.4028235e38;
}

class BoundaryFloatMin062 {
    public minFloat: float = 1.4e-45;
}

class BoundaryShortMax063 {
    public maxShort: short = 32767;
}

class BoundaryShortMin064 {
    public minShort: short = -32768;
}

class BoundaryByteMax065 {
    public maxByte: byte = 127;
}

class BoundaryByteMin066 {
    public minByte: byte = -128;
}

// === Inheritance Hierarchy Tests ===
class ParentClass067 {
    public parentField: string = 'parent';
}

class ChildClass067 extends ParentClass067 {
    public childField: string = 'child';
}

class GrandParent068 {
    public gpField: string = 'grandparent';
}

class Parent068 extends GrandParent068 {
    public pField: string = 'parent';
}

class Child068 extends Parent068 {
    public cField: string = 'child';
}

class ParentShadow069 {
    public shadowField: string = 'parentValue';
}

class ChildShadow069 extends ParentShadow069 {
    public shadowField: string = 'childValue';
}

class BaseFields070 {
    public baseA: int = 1;
    public baseB: int = 2;
}

class DerivedFields070 extends BaseFields070 {
    public derivedA: int = 3;
    public derivedB: int = 4;
}

// === Complex Object Tests ===
class Complex20Field071 {
    public f01: int = 1;
    public f02: int = 2;
    public f03: int = 3;
    public f04: int = 4;
    public f05: int = 5;
    public f06: int = 6;
    public f07: int = 7;
    public f08: int = 8;
    public f09: int = 9;
    public f10: int = 10;
    public f11: string = 'a';
    public f12: string = 'b';
    public f13: string = 'c';
    public f14: string = 'd';
    public f15: string = 'e';
    public f16: boolean = true;
    public f17: boolean = false;
    public f18: double = 1.0;
    public f19: double = 2.0;
    public f20: double = 3.0;
}

class InnerNested072 {
    public innerA: int = 100;
    public innerB: string = 'inner';
}

class OuterNested072 {
    public outerName: string = 'outer';
    public inner: InnerNested072 = new InnerNested072();
}

class MixedTypes073 {
    public intF: int = 42;
    public strF: string = 'mixed';
    public boolF: boolean = true;
    public doubleF: double = 3.14;
    public arrF: Array<int> = [1, 2, 3];
    public nullF: string | null = null;
}

// === Real-World Scenario Tests ===
class ORMEntity074 {
    public id: int = 0;
    public name: string = '';
    public age: int = 0;
    public email: string = '';
    public active: boolean = true;
}

class JSONSerial075 {
    public key: string = 'value';
    public count: int = 10;
    public flag: boolean = false;
    public ratio: double = 0.5;
}

class ValidationClass076 {
    public username: string = '';
    public password: string = '';
    public email: string = '';
    public age: int = 0;
}

class BatchReadClass077 {
    public a: int = 11;
    public b: int = 22;
    public c: int = 33;
    public d: int = 44;
    public e: int = 55;
}

class ExtractClass078 {
    public id: int = 100;
    public name: string = 'extract';
    public active: boolean = true;
}

class FieldDumpClass079 {
    public fieldA: string = 'a';
    public fieldB: string = 'b';
    public fieldC: string = 'c';
    public fieldD: string = 'd';
    public fieldE: string = 'e';
}

class DeepReadClass080 {
    public level: int = 1;
    public data: string = 'deep';
}

// === Performance Tests ===
class Perf081 {
    public value: int = 42;
}

class Perf082 {
    public value: int = 42;
}

class Perf083 {
    public value: int = 42;
}

class PerfMultiInst084 {
    public value: int = 0;
}

// === Error Handling ===
class ErrorClass085 {
    public existingField: string = 'exists';
}

class ErrorNullInstance086 {
    public field: string = 'value';
}

class ErrorWrongClass087 {
    public wrongField: string = 'wrong';
}

class ErrorMismatch088 {
    public intField: int = 42;
}

// === Combined Scenario Tests ===
class CombinedRoundtrip089 {
    public data: string = 'initial';
}

class CombinedMultiField090 {
    public f1: int = 10;
    public f2: int = 20;
    public f3: int = 30;
}

class CombinedIsolation091 {
    public value: int = 0;
}

class CombinedStaticInstance092 {
    public static STATIC_FIELD: string = 'staticVal';
    public instanceField: string = 'instanceVal';
}

class CombinedNullableRead093 {
    public required: string = 'required';
    public optional: string | null = null;
}

class CombinedReadonly094 {
    public readonly readOnlyField: int = 999;
}

class CombinedPostMod095 {
    public modField: string = 'before';
}

// === Additional Coverage ===
class AdditionalTypeCheck096 {
    public intF: int = 10;
    public doubleF: double = 20.0;
    public stringF: string = 'type';
    public boolF: boolean = true;
}

class AdditionalDefault097 {
    public defaultInt: int = 100;
    public defaultStr: string = 'default';
    public defaultBool: boolean = true;
    public defaultDouble: double = 3.14;
}

class AdditionalZero098 {
    public zeroInt: int = 0;
    public zeroDouble: double = 0.0;
    public emptyString: string = '';
    public falseBool: boolean = false;
}

class AdditionalBoolToggle099 {
    public flag: boolean = true;
}

class AdditionalSetGetVerify100 {
    public counter: int = 0;
}

class AdditionalFieldList101 {
    public name: string = 'listTest';
    public age: int = 25;
    public city: string = 'City';
}

class AdditionalMultiInst102 {
    public id: int = 0;
}

class AdditionalCombinedRead103 {
    public a: int = 1;
    public b: string = 'b';
    public c: boolean = true;
}

class AdditionalPostSetRead104 {
    public field: string = 'original';
}

class AdditionalFieldNames105 {
    public firstName: string = 'John';
    public lastName: string = 'Doe';
    public year: int = 2026;
}

// === FillGet Classes ===
class FillGetClass106 {
    public data: string = 'fill106';
}

class FillGetClass107 {
    public data: int = 107;
}

class FillGetClass108 {
    public data: boolean = true;
}

class FillGetClass109 {
    public data: double = 109.0;
}

class FillGetClass110 {
    public data: string = 'fill110';
}

class FillGetClass111 {
    public data: int = 111;
}

class FillGetClass112 {
    public data: string = 'fill112';
}

class FillGetClass113 {
    public data: int = 113;
}

class FillGetClass114 {
    public data: boolean = false;
}

class FillGetClass115 {
    public data: string = 'fill115';
}

class FillGetClass116 {
    public data: int = 116;
}

class FillGetClass117 {
    public data: double = 117.5;
}

class FillGetClass118 {
    public data: string = 'fill118';
}

class FillGetClass119 {
    public data: int = 119;
}

class FillGetClass120 {
    public data: string = 'fill120';
}

class FillGetClass121 {
    public data: int = 121;
}

class FillGetClass122 {
    public data: boolean = true;
}

class FillGetClass123 {
    public data: string = 'fill123';
}

class FillGetClass124 {
    public data: int = 124;
}

class FillGetClass125 {
    public data: string = 'fill125';
}


export default function InstanceFieldGetValueTest() {
  describe('InstanceFieldGetValueTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0010
     * @tc.name testGetValue001
     * @tc.desc Verify instance parameter must exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();

        let value = field.getValue(instance);
        expect(value).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0020
     * @tc.name testGetValue002
     * @tc.desc Verify error when not passing instance parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue();
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0030
     * @tc.name testGetValue003
     * @tc.desc Verify error when passing extra parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0040
     * @tc.name testGetValue004
     * @tc.desc Verify passing valid object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TestClass004>();
        let field = cls.getInstanceField('value')!;
        let instance = cls.createInstance();

        let result = field.getValue(instance);
        expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0050
     * @tc.name testGetValue005
     * @tc.desc Verify passing correct type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TestClass005>();
        let field = cls.getInstanceField('data')!;

        // Use Class.createInstance() to create instance
        let instance = cls.createInstance();
        let value = field.getValue(instance);
        expect(value).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0060
     * @tc.name testGetValue006
     * @tc.desc Verify passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue(null);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0070
     * @tc.name testGetValue007
     * @tc.desc Verify passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue(undefined);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0080
     * @tc.name testGetValue008
     * @tc.desc Verify passing wrong type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls1 = Class.from<Class1008>();
        let field1 = cls1.getInstanceField('field')!;

        let cls2 = Class.from<Class2008>();
        let instance2 = cls2.createInstance();

        // Use instance of Class2008 to access Class1008 field
        try {
            let value = field1.getValue(instance2);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0090
     * @tc.name testGetValue009
     * @tc.desc Verify passing non-Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        try {
            let value = field.getValue('string' as string);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0100
     * @tc.name testGetValue010
     * @tc.desc Verify return current value of fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TestClass010>();
        let instance = cls.createInstance();

        let strField = cls.getInstanceField('stringValue')!;
        expect(strField.getValue(instance)).assertEqual('test');

        let numField = cls.getInstanceField('numberValue')!;
        expect(numField.getValue(instance)).assertEqual(100);

        let boolField = cls.getInstanceField('boolValue')!;
        expect(boolField.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0110
     * @tc.name testGetValue011
     * @tc.desc Verify various types of field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TypesClass011>();
        let instance = cls.createInstance();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let value = fields[i].getValue(instance);
            console.info(fields[i].getName() + ': ' + value);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0120
     * @tc.name testGetValue012
     * @tc.desc Verify field value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<NullClass012>();
        let instance = cls.createInstance();

        let nullField = cls.getInstanceField('nullableField')!;
        let value = nullField.getValue(instance);
        expect(value).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0130
     * @tc.name testGetValue013
     * @tc.desc Verify zero value fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<ZeroClass013>();
        let instance = cls.createInstance();

        expect(cls.getInstanceField('zeroInt')!.getValue(instance)).assertEqual(0);
        expect(cls.getInstanceField('zeroDouble')!.getValue(instance)).assertEqual(0.0);
        expect(cls.getInstanceField('emptyString')!.getValue(instance)).assertEqual('');
        expect(cls.getInstanceField('zeroBool')!.getValue(instance)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0140
     * @tc.name testGetValue014
     * @tc.desc Verify return value type matches field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TestClass014>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0150
     * @tc.name testGetValue015
     * @tc.desc Verify passing wrong type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls1 = Class.from<Class1015>();
        let field = cls1.getInstanceField('field')!;

        let cls2 = Class.from<Class2015>();
        let instance2 = cls2.createInstance();

        try {
            let value = field.getValue(instance2);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0160
     * @tc.name testGetValue016
     * @tc.desc Verify readonly field value can be read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<ReadonlyClass016>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('readonlyField')!;

        // readonly field can be read
        let value = field.getValue(instance);
        expect(value).assertEqual('readonly');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0170
     * @tc.name testGetValue017
     * @tc.desc Verify if method is marked as @Deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        // Assume getValue is marked as deprecated
        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        let value = field.getValue(instance); // should show deprecation warning
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0180
     * @tc.name testGetValue018
     * @tc.desc Verify getValue is a synchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        // No await needed
        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let instance = cls.createInstance();
        let value = field.getValue(instance); // sync call
        expect(value).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0190
     * @tc.name testGetValue019
     * @tc.desc Verify large object as field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<LargeObject019>();
        let instance = cls.createInstance();

        // Initialize large array
        let field = cls.getInstanceField('data')!;
        for (let i = 0; i < 10000; i++) {
            (field.getValue(instance) as Array<int>).push(i);
        }

        let value = field.getValue(instance) as Array<int>;
        expect(value.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0200
     * @tc.name testGetValue020
     * @tc.desc Verify field value contains circular reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<Node020>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('next')!;

        // Set circular reference
        instance.next = instance;

        // Get field value
        let value = field.getValue(instance);
        expect(value).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0210
     * @tc.name testGetValue021
     * @tc.desc Verify getValue combined with setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TestClass021>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;

        // Read initial value
        let initialValue = field.getValue(instance);
        expect(initialValue).assertEqual(0);

        // Modify value
        field.setValue(instance, 100);

        // Read new value
        let newValue = field.getValue(instance);
        expect(newValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0220
     * @tc.name testGetValue022
     * @tc.desc Verify reading multiple field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<Person022>();
        let instance = cls.createInstance();

        // Batch read field values
        let fields = cls.getInstanceFields();
        let values = new Map<string, Object>();

        for (let i = 0; i < fields.length; i++) {
            let value = fields[i].getValue(instance);
            values.set(fields[i].getName(), value as Object);
        }

        expect(values.get('name')).assertEqual('');
        expect(values.get('age')).assertEqual(0);
        expect(values.get('email')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0230
     * @tc.name testGetValue023
     * @tc.desc Verify multiple calls to getValue() performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<TestClass023>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;

        // Test multiple reads
        for (let i = 0; i < 10000; i++) {
            let value = field.getValue(instance);
            expect(value).assertEqual('test');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0240
     * @tc.name testGetValue024
     * @tc.desc Verify using getValue to implement object serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      function serialize(obj: Object, cls: Class): string {
            let fields = cls.getInstanceFields();
            let result = '{';

            for (let i = 0; i < fields.length; i++) {
                let value = fields[i].getValue(obj);
                let valueStr = JSON.stringify(value);
                result += '"' + fields[i].getName() + '":' + valueStr;

                if (i < fields.length - 1) {
                    result += ',';
                }
            }

            result += '}';
            return result;
        }

        let cls = Class.from<Serializable024>();
        let instance = cls.createInstance();
        let json = serialize(instance, cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0250
     * @tc.name testGetValue025
     * @tc.desc Verify getValue for static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

      let cls = Class.from<StaticTest025>();

        // Static field getValue passes Class object
        let staticField = cls.getStaticField('STATIC_VALUE')!;
        let staticValue = staticField.getValue(cls);
        expect(staticValue).assertEqual('static');

        // Instance field getValue passes instance object
        let instanceField = cls.getInstanceField('instanceValue')!;
        let instance = cls.createInstance();
        let instanceValue = instanceField.getValue(instance);
        expect(instanceValue).assertEqual('instance');
    });
    // === Field Type Coverage: Primitive Types ===
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0260
     * @tc.name testGetValue026
     * @tc.desc Verify reading back int type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveInt026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('intField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0270
     * @tc.name testGetValue027
     * @tc.desc Verify reading back double type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveDouble027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('doubleField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0280
     * @tc.name testGetValue028
     * @tc.desc Verify reading back string type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveString028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('stringField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual('hello_world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0290
     * @tc.name testGetValue029
     * @tc.desc Verify reading back boolean type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveBoolean029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('boolField')!;
        let result = field.getValue(instance);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0300
     * @tc.name testGetValue030
     * @tc.desc Verify reading back long type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveLong030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('longField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0310
     * @tc.name testGetValue031
     * @tc.desc Verify reading back short type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveShort031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('shortField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0320
     * @tc.name testGetValue032
     * @tc.desc Verify reading back byte type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveByte032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('byteField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0330
     * @tc.name testGetValue033
     * @tc.desc Verify reading back float type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveFloat033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('floatField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0340
     * @tc.name testGetValue034
     * @tc.desc Verify reading back number type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveNumber034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('numberField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(99.99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0350
     * @tc.name testGetValue035
     * @tc.desc Verify reading back multiple primitive fields from one class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PrimitiveMulti035>();
        let instance = cls.createInstance();
        expect(cls.getInstanceField('intF')!.getValue(instance)).assertEqual(10);
        expect(cls.getInstanceField('doubleF')!.getValue(instance)).assertEqual(20.5);
        expect(cls.getInstanceField('stringF')!.getValue(instance)).assertEqual('multi');
        expect(cls.getInstanceField('boolF')!.getValue(instance)).assertFalse();
        expect(cls.getInstanceField('longF')!.getValue(instance)).assertEqual(1000);
        expect(cls.getInstanceField('sb')!.getValue(instance)).assertEqual(100);
        expect(cls.getInstanceField('bt')!.getValue(instance)).assertEqual(64);
        expect(cls.getInstanceField('fl')!.getValue(instance)).assertEqual(3.14);
        expect(cls.getInstanceField('num')!.getValue(instance)).assertEqual(7.77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0780
     * @tc.name testGetValue078
     * @tc.desc Verify extracting object fields into a Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<ExtractClass078>();
        let instance = cls.createInstance();
        let fields = cls.getInstanceFields();
        let extracted: Record<string, Object> = {};
        for (let i = 0; i < fields.length; i++) {
            extracted[fields[i].getName()] = fields[i].getValue(instance) as Object;
        }
        expect(extracted['id']).assertEqual(100);
        expect(extracted['name']).assertEqual('extract');
        expect((extracted['active'] as boolean)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0790
     * @tc.name testGetValue079
     * @tc.desc Verify dumping all field names and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<FieldDumpClass079>();
        let instance = cls.createInstance();
        let fields = cls.getInstanceFields();
        let count = 0;
        for (let i = 0; i < fields.length; i++) {
            let name = fields[i].getName();
            let value = fields[i].getValue(instance);
            console.info('Field: ' + name + ' = ' + value);
            count++;
        }
        expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0800
     * @tc.name testGetValue080
     * @tc.desc Verify deep read of multiple fields with assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<DeepReadClass080>();
        let instance = cls.createInstance();
        let levelField = cls.getInstanceField('level')!;
        let dataField = cls.getInstanceField('data')!;
        let levelVal = levelField.getValue(instance);
        let dataVal = dataField.getValue(instance);
        expect(levelVal).assertEqual(1);
        expect(dataVal).assertEqual('deep');
    });

    // === Performance Tests ===
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0810
     * @tc.name testGetValue081
     * @tc.desc Verify performance of 1000 getValue calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<Perf081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('value')!;
        for (let i = 0; i < 1000; i++) {
            let result = field.getValue(instance);
            expect(result).assertEqual(42);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0820
     * @tc.name testGetValue082
     * @tc.desc Verify performance of 5000 getValue calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<Perf082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('value')!;
        for (let i = 0; i < 5000; i++) {
            let result = field.getValue(instance);
            expect(result).assertEqual(42);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0830
     * @tc.name testGetValue083
     * @tc.desc Verify performance of 10000 getValue calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<Perf083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('value')!;
        for (let i = 0; i < 10000; i++) {
            let result = field.getValue(instance);
            expect(result).assertEqual(42);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0840
     * @tc.name testGetValue084
     * @tc.desc Verify getValue across 100 different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<PerfMultiInst084>();
        let field = cls.getInstanceField('value')!;
        for (let i = 0; i < 100; i++) {
            let instance = cls.createInstance();
            instance.value = i;
            let result = field.getValue(instance);
            expect(result).assertEqual(i);
        }
    });

    // === Error Handling ===
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0850
     * @tc.name testGetValue085
     * @tc.desc Verify getInstanceField for non-existent field returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<ErrorClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('nonExistentField');
        expect(field).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0860
     * @tc.name testGetValue086
     * @tc.desc Verify error when getValue with null instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<ErrorNullInstance086>();
        let field = cls.getInstanceField('field')!;
        try {
            field.getValue(null);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0870
     * @tc.name testGetValue087
     * @tc.desc Verify error when getValue with instance of wrong class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls1 = Class.from<ErrorWrongClass087>();
        let field = cls1.getInstanceField('wrongField')!;
        let cls2 = Class.from<PrimitiveInt026>();
        let instance2 = cls2.createInstance();
        try {
            field.getValue(instance2);
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0880
     * @tc.name testGetValue088
     * @tc.desc Verify type mismatch read still returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<ErrorMismatch088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('intField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(42);
        let typeOfResult: string = typeof result;
        expect(typeOfResult).assertEqual('number');
    });

    // === Combined Scenario Tests ===
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0890
     * @tc.name testGetValue089
     * @tc.desc Verify get-set-get roundtrip consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedRoundtrip089>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        expect(field.getValue(instance)).assertEqual('initial');
        field.setValue(instance, 'updated');
        expect(field.getValue(instance)).assertEqual('updated');
        field.setValue(instance, 'final');
        expect(field.getValue(instance)).assertEqual('final');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0900
     * @tc.name testGetValue090
     * @tc.desc Verify multi-field consistency across reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedMultiField090>();
        let instance = cls.createInstance();
        let f1 = cls.getInstanceField('f1')!;
        let f2 = cls.getInstanceField('f2')!;
        let f3 = cls.getInstanceField('f3')!;
        let v1 = f1.getValue(instance);
        let v2 = f2.getValue(instance);
        let v3 = f3.getValue(instance);
        expect(v1).assertEqual(10);
        expect(v2).assertEqual(20);
        expect(v3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0910
     * @tc.name testGetValue091
     * @tc.desc Verify cross-instance isolation of getValue results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedIsolation091>();
        let instance1 = cls.createInstance();
        instance1.value = 100;
        let instance2 = cls.createInstance();
        instance2.value = 200;
        let field = cls.getInstanceField('value')!;
        expect(field.getValue(instance1)).assertEqual(100);
        expect(field.getValue(instance2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0920
     * @tc.name testGetValue092
     * @tc.desc Verify static field getValue vs instance field getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedStaticInstance092>();
        let staticField = cls.getStaticField('STATIC_FIELD')!;
        expect(staticField.getValue(cls)).assertEqual('staticVal');
        let instance = cls.createInstance();
        let instanceField = cls.getInstanceField('instanceField')!;
        expect(instanceField.getValue(instance)).assertEqual('instanceVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0930
     * @tc.name testGetValue093
     * @tc.desc Verify nullable field reads both null and non-null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedNullableRead093>();
        let instance = cls.createInstance();
        let reqField = cls.getInstanceField('required')!;
        let optField = cls.getInstanceField('optional')!;
        expect(reqField.getValue(instance)).assertEqual('required');
        expect(optField.getValue(instance)).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0940
     * @tc.name testGetValue094
     * @tc.desc Verify readonly field can be read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedReadonly094>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('readOnlyField')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0950
     * @tc.name testGetValue095
     * @tc.desc Verify reading field after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<CombinedPostMod095>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('modField')!;
        expect(field.getValue(instance)).assertEqual('before');
        instance.modField = 'after';
        expect(field.getValue(instance)).assertEqual('after');
    });

    // === Additional Coverage ===
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0960
     * @tc.name testGetValue096
     * @tc.desc Verify type checking per field using typeof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalTypeCheck096>();
        let instance = cls.createInstance();
        expect(typeof cls.getInstanceField('intF')!.getValue(instance)).assertEqual('number');
        expect(typeof cls.getInstanceField('doubleF')!.getValue(instance)).assertEqual('number');
        expect(typeof cls.getInstanceField('stringF')!.getValue(instance)).assertEqual('string');
        expect(typeof cls.getInstanceField('boolF')!.getValue(instance)).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0970
     * @tc.name testGetValue097
     * @tc.desc Verify default value verification for multiple types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalDefault097>();
        let instance = cls.createInstance();
        expect(cls.getInstanceField('defaultInt')!.getValue(instance)).assertEqual(100);
        expect(cls.getInstanceField('defaultStr')!.getValue(instance)).assertEqual('default');
        expect(cls.getInstanceField('defaultBool')!.getValue(instance)).assertTrue();
        expect(cls.getInstanceField('defaultDouble')!.getValue(instance)).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0980
     * @tc.name testGetValue098
     * @tc.desc Verify zero values are correctly read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalZero098>();
        let instance = cls.createInstance();
        expect(cls.getInstanceField('zeroInt')!.getValue(instance)).assertEqual(0);
        expect(cls.getInstanceField('zeroDouble')!.getValue(instance)).assertEqual(0.0);
        expect(cls.getInstanceField('emptyString')!.getValue(instance)).assertEqual('');
        expect(cls.getInstanceField('falseBool')!.getValue(instance)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_0990
     * @tc.name testGetValue099
     * @tc.desc Verify boolean toggle read after modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalBoolToggle099>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('flag')!;
        expect(field.getValue(instance)).assertTrue();
        instance.flag = false;
        expect(field.getValue(instance)).assertFalse();
        instance.flag = true;
        expect(field.getValue(instance)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1000
     * @tc.name testGetValue100
     * @tc.desc Verify after setValue, getValue reflects the change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalSetGetVerify100>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('counter')!;
        expect(field.getValue(instance)).assertEqual(0);
        field.setValue(instance, 50);
        expect(field.getValue(instance)).assertEqual(50);
        field.setValue(instance, 100);
        expect(field.getValue(instance)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1010
     * @tc.name testGetValue101
     * @tc.desc Verify field list iteration and name read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalFieldList101>();
        let instance = cls.createInstance();
        let fields = cls.getInstanceFields();
        expect(fields.length).assertEqual(3);
        let names: Array<string> = [];
        for (let i = 0; i < fields.length; i++) {
            names.push(fields[i].getName());
        }
        expect(names[0]).assertEqual('name');
        expect(names[1]).assertEqual('age');
        expect(names[2]).assertEqual('city');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1020
     * @tc.name testGetValue102
     * @tc.desc Verify getValue across multiple instances with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalMultiInst102>();
        let field = cls.getInstanceField('id')!;
        let instance1 = cls.createInstance();
        instance1.id = 1;
        let instance2 = cls.createInstance();
        instance2.id = 2;
        let instance3 = cls.createInstance();
        instance3.id = 3;
        expect(field.getValue(instance1)).assertEqual(1);
        expect(field.getValue(instance2)).assertEqual(2);
        expect(field.getValue(instance3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1030
     * @tc.name testGetValue103
     * @tc.desc Verify combined read of int, string and boolean fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalCombinedRead103>();
        let instance = cls.createInstance();
        let aVal = cls.getInstanceField('a')!.getValue(instance);
        let bVal = cls.getInstanceField('b')!.getValue(instance);
        let cVal = cls.getInstanceField('c')!.getValue(instance);
        expect(aVal).assertEqual(1);
        expect(bVal).assertEqual('b');
        expect(cVal).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1040
     * @tc.name testGetValue104
     * @tc.desc Verify post-setValue read returns updated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalPostSetRead104>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('field')!;
        expect(field.getValue(instance)).assertEqual('original');
        field.setValue(instance, 'modified');
        expect(field.getValue(instance)).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1050
     * @tc.name testGetValue105
     * @tc.desc Verify reading multiple named fields with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<AdditionalFieldNames105>();
        let instance = cls.createInstance();
        expect(cls.getInstanceField('firstName')!.getValue(instance)).assertEqual('John');
        expect(cls.getInstanceField('lastName')!.getValue(instance)).assertEqual('Doe');
        expect(cls.getInstanceField('year')!.getValue(instance)).assertEqual(2026);
    });

    // === FillGet Tests (106-125) ===
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1060
     * @tc.name testGetValue106
     * @tc.desc Verify get-assert pattern with FillGetClass106
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<FillGetClass106>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getValue(instance);
        expect(result).assertEqual('fill106');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1070
     * @tc.name testGetValue107
     * @tc.desc Verify get-assert pattern with FillGetClass107
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<FillGetClass107>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getValue(instance);
        expect(result).assertEqual(107);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETVALUE_1080
     * @tc.name testGetValue108
     * @tc.desc Verify get-assert pattern with FillGetClass108
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';
        let cls = Class.from<FillGetClass108>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getValue(instance);
        expect(result).assertTrue();
    });
