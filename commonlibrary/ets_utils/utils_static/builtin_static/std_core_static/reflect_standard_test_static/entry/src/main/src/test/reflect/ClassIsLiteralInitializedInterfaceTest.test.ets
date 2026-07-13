'use static';
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

interface EmptyLiteralInterface001 {}

interface SinglePropInterface002 {
  name: string;
}

interface MultiPropsInterface003 {
  name: string;
  age: int;
  city: string;
}

interface Address004 {
  city: string;
  street: string;
}

interface Person004 {
  name: string;
  address: Address004;
}

interface EmptyOptionalInterface004 {
  name?: string;
  age?: int;
  city?: string;
}

interface OptionalProps005 {
  name: string;
  age?: int;
  city?: string;
}

class LiteralClass006 {
  public name: string = 'Bob';
  public age: int = 25;
}

interface ImplementedInterface007 {
  name: string;
  age: int;
}

class ImplementedClass007 implements ImplementedInterface007 {
  public name: string = 'Bob';
  public age: int = 25;
}

class ConstructorClass008 {
  public name: string;
  public age: int;

  public constructor(name: string, age: int) {
    this.name = name;
    this.age = age;
  }
}

interface BaseInterface009 {
  id: int;
}

interface DerivedInterface009 extends BaseInterface009 {
  name: string;
}

class DerivedClass009 implements DerivedInterface009 {
  public id: int = 1;
  public name: string = 'Alice';
}

interface InterfaceA010 {
  type: string;
  valueA: string;
}

interface InterfaceB010 {
  type: string;
  valueB: int;
}

type UnionInterface010 = InterfaceA010 | InterfaceB010;

function asReflectObject(value: Any): Object {
  return value as Object;
}

interface User037 {
  name: string;
  age: int;
}

class UserService037 {
  private user: User037;

  public constructor() {
    this.user = { name: 'Alice', age: 30 };
  }

  public isLiteralUser(): boolean {
    return reflect.isLiteralInitializedInterface(this.user);
  }
}

interface Config038 {
  host: string;
  port: int;
}

class ConfigManager038 {
  private config: Config038;

  public constructor(config: Config038) {
    this.config = config;
  }

  public isLiteralConfig(): boolean {
    return reflect.isLiteralInitializedInterface(this.config);
  }
}

interface Item039 {
  id: int;
  name: string;
}

export default function ClassIsLiteralInitializedInterfaceTest(): void {
  describe('ClassIsLiteralInitializedInterfaceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0100
     * @tc.name testClassIsLiteralInitializedInterface001
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 001: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EmptyLiteralInterface001 = {};
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0200
     * @tc.name testClassIsLiteralInitializedInterface002
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 002: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EmptyOptionalInterface004 = { name: 'Alice' };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0300
     * @tc.name testClassIsLiteralInitializedInterface003
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 003: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: SinglePropInterface002 = { name: 'Alice' };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0400
     * @tc.name testClassIsLiteralInitializedInterface004
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 004: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MultiPropsInterface003 = { name: 'Alice', age: 30, city: 'Beijing' };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0500
     * @tc.name testClassIsLiteralInitializedInterface005
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 005: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Person004 = { name: 'Alice', address: { city: 'Beijing', street: 'Main' } };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0600
     * @tc.name testClassIsLiteralInitializedInterface006
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 006: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: OptionalProps005 = { name: 'Alice' };
      let obj2: OptionalProps005 = { name: 'Alice', age: 30 };
      expect(reflect.isLiteralInitializedInterface(obj1)).assertEqual(true);
      expect(reflect.isLiteralInitializedInterface(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0700
     * @tc.name testClassIsLiteralInitializedInterface007
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 007: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: LiteralClass006 = { name: 'Alice', age: 30 };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0800
     * @tc.name testClassIsLiteralInitializedInterface008
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 008: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ImplementedClass007 = { name: 'Alice', age: 30 };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_0900
     * @tc.name testClassIsLiteralInitializedInterface009
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 009: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ImplementedInterface007 = new ImplementedClass007();
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1000
     * @tc.name testClassIsLiteralInitializedInterface010
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 010: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new LiteralClass006();
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1100
     * @tc.name testClassIsLiteralInitializedInterface011
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 011: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ConstructorClass008('Alice', 30);
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1200
     * @tc.name testClassIsLiteralInitializedInterface012
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 012: invalid input throws ClassCastError, isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.isLiteralInitializedInterface(null as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1300
     * @tc.name testClassIsLiteralInitializedInterface013
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 013: invalid input throws ClassCastError, isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.isLiteralInitializedInterface(undefined as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1400
     * @tc.name testClassIsLiteralInitializedInterface014
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 014: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      expect(reflect.isLiteralInitializedInterface(asReflectObject(arr))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1500
     * @tc.name testClassIsLiteralInitializedInterface015
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 015: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let func: Function = (): void => {
      };
      expect(reflect.isLiteralInitializedInterface(asReflectObject(func))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1600
     * @tc.name testClassIsLiteralInitializedInterface016
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 016: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, int>();
      expect(reflect.isLiteralInitializedInterface(asReflectObject(map))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1700
     * @tc.name testClassIsLiteralInitializedInterface017
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 017: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      expect(reflect.isLiteralInitializedInterface(asReflectObject(set))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1800
     * @tc.name testClassIsLiteralInitializedInterface018
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 018: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isLiteralInitializedInterface(asReflectObject(123))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_1900
     * @tc.name testClassIsLiteralInitializedInterface019
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 019: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isLiteralInitializedInterface(asReflectObject('test'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2000
     * @tc.name testClassIsLiteralInitializedInterface020
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 020: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isLiteralInitializedInterface(asReflectObject(true))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2100
     * @tc.name testClassIsLiteralInitializedInterface021
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 021: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: SinglePropInterface002 = { name: 'Alice' };
      expect(typeof reflect.isLiteralInitializedInterface(obj)).assertEqual("boolean");
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2200
     * @tc.name testClassIsLiteralInitializedInterface022
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 022: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new LiteralClass006();
      expect(typeof reflect.isLiteralInitializedInterface(obj)).assertEqual("boolean");
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2300
     * @tc.name testClassIsLiteralInitializedInterface023
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 023: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EmptyLiteralInterface001 = {};
      expect(typeof reflect.isLiteralInitializedInterface(obj)).assertEqual("boolean");
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2400
     * @tc.name testClassIsLiteralInitializedInterface024
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 024: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literalObj: EmptyLiteralInterface001 = {};
      let classObj = new LiteralClass006();
      let literalResult = reflect.isLiteralInitializedInterface(literalObj);
      let classResult = reflect.isLiteralInitializedInterface(classObj);
      expect(literalResult).assertEqual(true);
      expect(classResult).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2500
     * @tc.name testClassIsLiteralInitializedInterface025
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 025: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EmptyLiteralInterface001 = {};
      let result1 = reflect.isLiteralInitializedInterface(obj);
      let result2 = reflect.isLiteralInitializedInterface(obj);
      expect(result1).assertEqual(true);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2600
     * @tc.name testClassIsLiteralInitializedInterface026
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 026: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: DerivedInterface009 = { id: 1, name: 'Alice' };
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2700
     * @tc.name testClassIsLiteralInitializedInterface027
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 027: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: DerivedInterface009 = new DerivedClass009();
      expect(reflect.isLiteralInitializedInterface(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2800
     * @tc.name testClassIsLiteralInitializedInterface028
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 028: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: UnionInterface010 = { type: 'A', valueA: 'test' };
      expect(reflect.isLiteralInitializedInterface(obj as Object)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_2900
     * @tc.name testClassIsLiteralInitializedInterface029
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 029: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let service = new UserService037();
      expect(service.isLiteralUser()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_3000
     * @tc.name testClassIsLiteralInitializedInterface030
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 030: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literalConfig: Config038 = { host: 'localhost', port: 8080 };
      let manager = new ConfigManager038(literalConfig);
      expect(manager.isLiteralConfig()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_LITERAL_INITIALIZED_INTERFACE_3100
     * @tc.name testClassIsLiteralInitializedInterface031
     * @tc.desc Verify ClassIsLiteralInitializedInterface case 031: isLiteralInitializedInterface result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsLiteralInitializedInterface031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: Array<Item039> = [];
      for (let i = 0; i < 1000; i++) {
        items.push({ id: i, name: 'Item' + i });
      }
      for (let item of items) {
        expect(reflect.isLiteralInitializedInterface(item as Object)).assertEqual(true);
      }
    });
  });
}
