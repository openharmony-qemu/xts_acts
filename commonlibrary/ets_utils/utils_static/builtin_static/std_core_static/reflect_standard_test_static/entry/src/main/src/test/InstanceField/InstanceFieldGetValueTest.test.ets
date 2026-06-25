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

class TestClass019 {
  public data: string = 'test';
}

class Node026 {
  public value: int = 0;
  public next: Node026 | null = null;
}

class TestClass027 {
  public counter: int = 0;
}

class Person028 {
  public name: string = '';
  public age: int = 0;
  public email: string = '';
}

class Serializable030 {
  public id: int = 0;
  public name: string = '';
  public active: boolean = true;
}

class TestClass031 {
  public value: int = 0;
}

class ArrayField025 {
  public data: Array<int> = [];
}

export default function InstanceFieldGetValueTest(): void {
  describe('InstanceFieldGetValueTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0100
     * @tc.name testGetValue0100
     * @tc.desc Verify reading array field after multiple appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayField025>();
      let instance = cls.createInstance();

      let field = cls.getInstanceField('data')!;
      let arr: Array<int> = field.getValue(instance) as Array<int>;
      for (let i = 0; i < 100; i++) {
        arr.push(i);
      }
      field.setValue(instance, arr);

      let value: Array<int> = field.getValue(instance) as Array<int>;
      expect(value.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0200
     * @tc.name testGetValue0200
     * @tc.desc Verify field value with circular reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Node026>();
      let instance: Node026 = cls.createInstance() as Node026;
      let field = cls.getInstanceField('next')!;

      instance.next = instance;

      let value = field.getValue(instance);
      expect(value !== null).assertTrue();
      expect(value === instance).assertTrue();
      expect((value as Node026).next === instance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0300
     * @tc.name testGetValue0300
     * @tc.desc Verify getValue used in combination with setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass027>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('counter')!;

      let initialValue: int = field.getValue(instance) as int;
      expect(initialValue).assertEqual(0);

      field.setValue(instance, 100);

      let newValue: int = field.getValue(instance) as int;
      expect(newValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0400
     * @tc.name testGetValue0400
     * @tc.desc Verify reading multiple field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Person028>();
      let instance = cls.createInstance();

      let nameField = cls.getInstanceField('name')!;
      expect(nameField.getValue(instance) as string).assertEqual('');

      let ageField = cls.getInstanceField('age')!;
      expect(ageField.getValue(instance) as int).assertEqual(0);

      let emailField = cls.getInstanceField('email')!;
      expect(emailField.getValue(instance) as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0500
     * @tc.name testGetValue0500
     * @tc.desc Verify performance of repeated getValue() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass019>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;

      for (let i = 0; i < 100; i++) {
        let value: string = field.getValue(instance) as string;
        expect(value).assertEqual('test');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0600
     * @tc.name testGetValue0600
     * @tc.desc Verify reading default values from multiple fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Serializable030>();
      let instance = cls.createInstance();

      let idField = cls.getInstanceField('id')!;
      let nameField = cls.getInstanceField('name')!;
      let activeField = cls.getInstanceField('active')!;
      expect(idField.getValue(instance) as int).assertEqual(0);
      expect(nameField.getValue(instance) as string).assertEqual('');
      expect(activeField.getValue(instance) as boolean).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0700
     * @tc.name testGetValue0700
     * @tc.desc Verify comparing field values of two instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass031>();
      let instance1 = cls.createInstance();
      let instance2 = cls.createInstance();
      let field = cls.getInstanceField('value')!;

      let value1: int = field.getValue(instance1) as int;
      let value2: int = field.getValue(instance2) as int;

      expect(value1).assertEqual(value2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0800
     * @tc.name testGetValue0800
     * @tc.desc Verify StaticField.getValue compared with InstanceField.getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest032>();

      let staticField = cls.getStaticField('STATIC_VALUE')!;
      let staticValue: string = staticField.getValue() as string;
      expect(staticValue).assertEqual('static');

      let instanceField = cls.getInstanceField('instanceValue')!;
      let instance = cls.createInstance();
      let instanceValue: string = instanceField.getValue(instance) as string;
      expect(instanceValue).assertEqual('instance');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_0900
     * @tc.name testGetValue0900
     * @tc.desc Verify getValue consistency across multiple InstanceField instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let instance = cls.createInstance();
      let field1 = cls.getInstanceField('name')!;
      let field2 = cls.getInstanceField('name')!;
      expect(field1.getValue(instance) as string).assertEqual(field2.getValue(instance) as string);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_1000
     * @tc.name testGetValue1000
     * @tc.desc Verify getValue returns correct default for unmodified field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass004>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('value')!;
      expect(field.getValue(instance) as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_1100
     * @tc.name testGetValue1100
     * @tc.desc Verify getValue on string field returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass005>();
      let instance = cls.createInstance();
      let field = cls.getInstanceField('data')!;
      expect(field.getValue(instance) as string).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_VALUE_1200
     * @tc.name testGetValue1200
     * @tc.desc Verify setValue with circular reference via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetValue1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Node026>();
      let instance1: Node026 = cls.createInstance() as Node026;
      let instance2: Node026 = cls.createInstance() as Node026;
      let field = cls.getInstanceField('next')!;
      field.setValue(instance1, instance2);
      field.setValue(instance2, instance1);
      let v1 = field.getValue(instance1) as Node026;
      let v2 = field.getValue(instance2) as Node026;
      expect(v1 !== null).assertTrue();
      expect(v2 !== null).assertTrue();
      expect(v1 === instance2).assertTrue();
      expect(v2 === instance1).assertTrue();
    });

  });
}
