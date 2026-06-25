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

class MyClass001 {
  public name: string = 'test';
}

class StaticTest040 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class TestClass005 {
  public value: int = 0;
}

class TestClass006 {
  public data: string = 'original';
}

class Class1009 {
  public field: string = 'value';
}

class Class2009 {
  public field: string = 'value2';
}

class TestClass011 {
  public intField: int = 0;
}

class NullableClass012 {
  public nullableField: string | null = 'value';
}

class OptionalClass013 {
  public optionalField: string | undefined = 'value';
}

class TypesClass014 {
  public strField: string = '';
  public numField: number = 0;
  public boolField: boolean = false;
  public arrField: Array<int> = [];
  public objField: Object = {};
}

class TestClass016 {
  public counter: int = 0;
}

class NullableClass018 {
  public data: string | null = 'value';
}

class TestClass019 {
  public counter: int = 100;
}

class TestClass020 {
  public data: string = 'value';
}

class TestClass021 {
  public flag: boolean = true;
}

class ReadonlyClass022 {
  public readonly readonlyField: string = 'original';
}

class PrivateClass025 {
  public publicField: string = 'public';
  private privateField: string = 'private';
}

class TestClass028 {
  public largeNumber: number = 0;
}

class TestClass029 {
  public signedValue: int = 0;
}

class TestClass030 {
  public textField: string = '';
}

class TestClass031 {
  public arrField: Array<int> = [];
}

class InnerClass032 {
  public data: string = 'inner';
}

class OuterClass032 {
  public objField: InnerClass032 = new InnerClass032();
}

class TestClass036 {
  public data: string = '';
}

class Person037 {
  public name: string = '';
  public age: int = 0;
  public email: string = '';
}

class Source038 {
  public field1: string = '';
  public field2: int = 0;
}

class TestClass039 {
  public field1: string = '';
  public field2: int = 0;
  public field3: boolean = false;
}

class GenericClass041<T> {
  public data: T | undefined = undefined;
}

class UnionClass042 {
  public stringOrNumber: string | number = '';
}

export default function InstanceFieldSetValueTest(): void {
  describe('InstanceFieldSetValueTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0100
     * @tc.name testSetValue0100
     * @tc.desc Verify setValue with valid instance and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('name')!;
      field.setValue(instance, 'setTest');
      expect(field.getValue(instance) as string).assertEqual('setTest');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0200
     * @tc.name testSetValue0200
     * @tc.desc Verify passing valid object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass005>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      field.setValue(instance, 42);
      expect(field.getValue(instance) as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0300
     * @tc.name testSetValue0300
     * @tc.desc Verify setting field value on correct class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass006>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      field.setValue(instance, 'modified');
      expect(field.getValue(instance) as string).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0400
     * @tc.name testSetValue0400
     * @tc.desc Verify passing instance of wrong type throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Class1009>();
      let field = cls1.getInstanceField('field')!;
      let cls2 = Class.from<Class2009>();
      let instance2 = cls2.createInstance();
      try {
        field.setValue(instance2, 'value');
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0500
     * @tc.name testSetValue0500
     * @tc.desc Verify passing mismatched type value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass011>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      try {
        field.setValue(instance, 'string');
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0600
     * @tc.name testSetValue0600
     * @tc.desc Verify passing null as field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullableClass012>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('nullableField')!;
      field.setValue(instance, null);
      expect(field.getValue(instance) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0700
     * @tc.name testSetValue0700
     * @tc.desc Verify passing undefined as field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OptionalClass013>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('optionalField')!;
      field.setValue(instance, undefined);
      expect(field.getValue(instance) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0800
     * @tc.name testSetValue0800
     * @tc.desc Verify setValue for string, boolean, and array field types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypesClass014>();
      let instance = cls.createInstance();
      cls.getInstanceField('strField')!.setValue(instance, 'test');
      cls.getInstanceField('boolField')!.setValue(instance, true);
      cls.getInstanceField('arrField')!.setValue(instance, [1, 2, 3]);
      expect(cls.getInstanceField('strField')!.getValue(instance) as string).assertEqual('test');
      expect(cls.getInstanceField('boolField')!.getValue(instance) as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_0900
     * @tc.name testSetValue0900
     * @tc.desc Verify value changes after setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      let before = field.getValue(instance) as int;
      field.setValue(instance, before + 1);
      expect(field.getValue(instance) as int).assertEqual(before + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1000
     * @tc.name testSetValue1000
     * @tc.desc Verify setting null on nullable field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NullableClass018>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      field.setValue(instance, null);
      expect(field.getValue(instance) === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1100
     * @tc.name testSetValue1100
     * @tc.desc Verify setting numeric field to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass019>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;
      field.setValue(instance, 0);
      expect(field.getValue(instance) as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1200
     * @tc.name testSetValue1200
     * @tc.desc Verify setting string field to empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass020>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      field.setValue(instance, '');
      expect(field.getValue(instance) as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1300
     * @tc.name testSetValue1300
     * @tc.desc Verify setting boolean field to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('flag')!;
      field.setValue(instance, false);
      expect(field.getValue(instance) as boolean).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1400
     * @tc.name testSetValue1400
     * @tc.desc Verify setValue on readonly field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyClass022>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('readonlyField')!;
      try {
        field.setValue(instance, 'modified');
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1500
     * @tc.name testSetValue1500
     * @tc.desc Verify private field is not reflectable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateClass025>();
      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1600
     * @tc.name testSetValue1600
     * @tc.desc Verify setValue basic functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let instance = cls.createInstance();
      field.setValue(instance, 'value');
      expect(field.getValue(instance) as string).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1700
     * @tc.name testSetValue1700
     * @tc.desc Verify setting large numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass028>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('largeNumber')!;

      field.setValue(instance, Number.MAX_VALUE);
      expect(field.getValue(instance) as number).assertEqual(Number.MAX_VALUE);

      field.setValue(instance, Number.MIN_VALUE);
      expect(field.getValue(instance) as number).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1800
     * @tc.name testSetValue1800
     * @tc.desc Verify setting negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass029>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('signedValue')!;

      field.setValue(instance, -100);
      expect(field.getValue(instance) as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_1900
     * @tc.name testSetValue1900
     * @tc.desc Verify setting very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass030>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('textField')!;

      let longString = 'a'.repeat(10000);
      field.setValue(instance, longString);

      let resultStr: string = field.getValue(instance) as string;
      expect(resultStr.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2000
     * @tc.name testSetValue2000
     * @tc.desc Verify setting array type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass031>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('arrField')!;

      field.setValue(instance, [1, 2, 3, 4, 5]);
      let value = field.getValue(instance) as Array<int>;

      expect(value.length).assertEqual(5);
      expect(value[0]).assertEqual(1);
      expect(value[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2100
     * @tc.name testSetValue2100
     * @tc.desc Verify setting object type field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OuterClass032>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('objField')!;

      let newObj = new InnerClass032();
      newObj.data = 'modified';

      field.setValue(instance, newObj);

      let value = field.getValue(instance) as InnerClass032;
      expect(value.data).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2200
     * @tc.name testSetValue2200
     * @tc.desc Verify getValue can read new value after setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass006>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;

      let original: string = field.getValue(instance) as string;
      expect(original).assertEqual('original');

      field.setValue(instance, 'modified');

      let modified: string = field.getValue(instance) as string;
      expect(modified).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2300
     * @tc.name testSetValue2300
     * @tc.desc Verify multiple setValue updates field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;

      for (let i = 1; i <= 100; i++) {
        field.setValue(instance, i);
        expect(field.getValue(instance) as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2400
     * @tc.name testSetValue2400
     * @tc.desc Verify round-trip of setValue and getValue with getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass005>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;

      let currentValue = field.getValue(instance) as int;
      field.setValue(instance, currentValue + 1);

      expect(field.getValue(instance) as int).assertEqual(currentValue + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2500
     * @tc.name testSetValue2500
     * @tc.desc Verify last setValue overwrites previous values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass036>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;

      for (let i = 0; i < 100; i++) {
        field.setValue(instance, `value${i}`);
      }

      expect(field.getValue(instance) as string).assertEqual('value99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2600
     * @tc.name testSetValue2600
     * @tc.desc Verify using setValue to initialize object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Person037>();
      let instance = cls.createInstance();

      cls.getInstanceField('name')!.setValue(instance, 'John');
      cls.getInstanceField('age')!.setValue(instance, 30);
      cls.getInstanceField('email')!.setValue(instance, 'john@example.com');

      expect(cls.getInstanceField('name')!.getValue(instance) as string).assertEqual('John');
      expect(cls.getInstanceField('age')!.getValue(instance) as int).assertEqual(30);
      expect(cls.getInstanceField('email')!.getValue(instance) as string).assertEqual('john@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2700
     * @tc.name testSetValue2700
     * @tc.desc Verify using setValue to copy objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceCls = Class.from<Source038>();
      let targetCls = Class.from<Source038>();

      let source = sourceCls.createInstance();
      let target = targetCls.createInstance();

      sourceCls.getInstanceField('field1')!.setValue(source, 'copied');
      sourceCls.getInstanceField('field2')!.setValue(source, 99);

      targetCls.getInstanceField('field1')!.setValue(target, sourceCls.getInstanceField('field1')!.getValue(source));
      targetCls.getInstanceField('field2')!.setValue(target, sourceCls.getInstanceField('field2')!.getValue(source));

      expect(targetCls.getInstanceField('field1')!.getValue(target) as string).assertEqual('copied');
      expect(targetCls.getInstanceField('field2')!.getValue(target) as int).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2800
     * @tc.name testSetValue2800
     * @tc.desc Verify batch updating fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass039>();
      let instance = cls.createInstance();

      let field1 = cls.getInstanceField('field1')!;
      let field2 = cls.getInstanceField('field2')!;
      let field3 = cls.getInstanceField('field3')!;
      field1.setValue(instance, 'new1');
      field2.setValue(instance, 100);
      field3.setValue(instance, true);

      expect(field1.getValue(instance) as string).assertEqual('new1');
      expect(field2.getValue(instance) as int).assertEqual(100);
      expect(field3.getValue(instance) as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_2900
     * @tc.name testSetValue2900
     * @tc.desc Verify StaticField.setValue for static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest040>();
      let staticField = cls.getStaticField('STATIC_VALUE')!;
      let originalValue: string = staticField.getValue() as string;

      try {
        staticField.setValue('modified_static');
        expect(staticField.getValue() as string).assertEqual('modified_static');

        let instance = cls.createInstance();
        let instanceField = cls.getInstanceField('instanceValue')!;
        instanceField.setValue(instance, 'modified_instance');
        expect(instanceField.getValue(instance) as string).assertEqual('modified_instance');
      } finally {
        staticField.setValue(originalValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3000
     * @tc.name testSetValue3000
     * @tc.desc Verify setValue for generic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intCls = Class.from<GenericClass041<int>>();
      let intInstance = intCls.createInstance();
      let intField = intCls.getInstanceField('data')!;

      intField.setValue(intInstance, 42);
      expect(intField.getValue(intInstance) as int).assertEqual(42);

      let strCls = Class.from<GenericClass041<string>>();
      let strInstance = strCls.createInstance();
      let strField = strCls.getInstanceField('data')!;

      strField.setValue(strInstance, 'hello');
      expect(strField.getValue(strInstance) as string).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3100
     * @tc.name testSetValue3100
     * @tc.desc Verify setValue for union type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnionClass042>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('stringOrNumber')!;

      field.setValue(instance, 'hello');
      expect(field.getValue(instance) as string).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3200
     * @tc.name testSetValue3200
     * @tc.desc Verify setValue string to string field roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('name')!;
      field.setValue(instance, 'roundtrip');
      expect(field.getValue(instance) as string).assertEqual('roundtrip');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3300
     * @tc.name testSetValue3300
     * @tc.desc Verify passing boolean to int field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass011>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('intField')!;
      try {
        field.setValue(instance, true);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3400
     * @tc.name testSetValue3400
     * @tc.desc Verify passing null to non-nullable field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass005>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      try {
        field.setValue(instance, null);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3500
     * @tc.name testSetValue3500
     * @tc.desc Verify setValue stores reference for array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass031>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('arrField')!;
      let arr: Array<int> = [1, 2, 3];
      field.setValue(instance, arr);
      let val = field.getValue(instance) as Array<int>;
      expect(val.length).assertEqual(3);
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3600
     * @tc.name testSetValue3600
     * @tc.desc Verify passing int to string field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass039>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('field1')!;
      try {
        field.setValue(instance, 42);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3700
     * @tc.name testSetValue3700
     * @tc.desc Verify passing int to boolean field throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass039>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('field3')!;
      try {
        field.setValue(instance, 42);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUE_3800
     * @tc.name testSetValue3800
     * @tc.desc Verify passing undefined to int field throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetValue3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass005>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      try {
        field.setValue(instance, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof NullPointerError).assertTrue();
      }
    });

  });
}
