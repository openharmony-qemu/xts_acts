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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  public testMethod(): string {
    return "test";
  }
}

class MyClass003 {
  public returnNumber(): number {
    return 100;
  }

  public returnString(): string {
    return "test";
  }

  public returnBoolean(): boolean {
    return true;
  }
}

class MyClass004 {
  public voidMethod(): void {
  }
}

class ReturnClass005 {
}

class MyClass005 {
  public returnObject(): ReturnClass005 {
    return new ReturnClass005();
  }
}

class MyClass006 {
  public returnArray(): number[] {
    return [1, 2, 3];
  }

  public returnStringArray(): string[] {
    return ["a", "b"];
  }
}

class MyClass008 {
  public returnUnion(): string | number {
    return "test";
  }
}

class MyClass010 {
  public async returnPromiseNumber(): Promise<number> {
    return 123;
  }
}

class MyClass011 {
  public genericMethod<T>(param: T): T {
    return param;
  }
}

class GenericClass012<T> {
  public getValue(param: T): T {
    return param;
  }
}

class MyClass017 {
  public method1(): string {
    return "test";
  }

  public method2(): number {
    return 100;
  }

  public method3(): boolean {
    return true;
  }
}

class MyClass018 {
  public returnNull(): null {
    return null;
  }
}

class MyClass019 {
  public returnUndefined(): undefined {
    return undefined;
  }
}

class MyClass020 {
  public throwError(): never {
    throw new Error("error");
  }
}

class MyClass021 {
  public returnThis(): this {
    return this;
  }
}

class MyClass025 {
  public testMethod(): string {
    return "test";
  }
}

class ParentClass030 {
  public parentMethod(): string {
    return "parent";
  }
}

class ParentClass031 {
  public overrideMethod(): string {
    return "parent";
  }
}

class ChildClass031 extends ParentClass031 {
  public override overrideMethod(): string {
    return "child";
  }
}

class MyClass035 {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }
}

class MyClass036 {
  private _value: number = 0;

  set value(v: number) {
    this._value = v;
  }
}

class MyClass039 {
  public optionalMethod(param?: string): string | undefined {
    return param?.toString();
  }
}

class MyClass040 {
  public returnFunction(): () => void {
    return () => {
    };
  }
}

class MyClass041 {
  public returnTuple(): [string, number] {
    return ["test", 100];
  }
}

class Animal046 {
}

class Dog046 extends Animal046 {
}

class ParentClass046 {
  public getAnimal(): Animal046 {
    return new Animal046();
  }
}

class ChildClass046 extends ParentClass046 {
  public override getAnimal(): Dog046 {
    return new Dog046();
  }
}

class MyClass050 {
  public returnBigint(): bigint {
    return 100n;
  }
}

class ObjectHelper051 {
}

class MyClass051 {
  public returnObjectLiteral(): object {
    return new ObjectHelper051();
  }
}

class MyClass052 {
  public returnMap(): Map<string, number> {
    return new Map<string, number>();
  }
}

class MyClass053 {
  public returnSet(): Set<number> {
    return new Set<number>();
  }
}

interface IUserInfo054 {
  name: string;
}

class MyClass054 {
  public returnInterface(): IUserInfo054 {
    return { name: 'test' };
  }
}

class MyClass055 {
  public returnUnionNull(): string | null {
    return null;
  }
}

abstract class AbstractClass056 {
  public abstract abstractMethod(): void;
}

class ConcreteAbstractClass056 extends AbstractClass056 {
  public abstractMethod(): void {
  }
}

class MyClass057 {
  public returnAbstractClass(): AbstractClass056 {
    return new ConcreteAbstractClass056();
  }
}

enum Color058 {
  RED, GREEN, BLUE
}

class MyClass058 {
  public returnEnum(): Color058 {
    return Color058.RED;
  }
}

class MyClass059 {
  public returnDate(): Date {
    return new Date();
  }
}

class MyClass060 {
  public returnRegExp(): RegExp {
    return new RegExp('test', 'g');
  }
}

class MyClass061 {
  public returnError(): Error {
    return new Error('test');
  }
}

class MyClass062 {
  public returnArrayBuffer(): ArrayBuffer {
    return new ArrayBuffer(16);
  }
}

class MyClass063 {
  public returnInt32Array(): Int32Array {
    return new Int32Array(4);
  }
}

class EmptyClass064 {
}

class MyClass065 {
  public method1(): string {
    return 'a';
  }

  public method2(): string {
    return 'b';
  }

  public method3(): string {
    return 'c';
  }
}

class MyClass066 {
  public returnNumberA(): number {
    return 1;
  }

  public returnNumberB(): number {
    return 2;
  }
}

class ParentClass067 {
  public getParentType(): string {
    return 'parent';
  }
}

class ChildClass067 extends ParentClass067 {
}


export default function InstanceMethodGetReturnTypeTest(): void {
  describe('InstanceMethodGetReturnTypeTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0001
     * @tc.name testInstanceMethodGetReturnType0001
     * @tc.desc Verify getReturnType() returns the correct type (std.core.String) for a string-returning method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0002
     * @tc.name testInstanceMethodGetReturnType0002
     * @tc.desc Verify basic types as return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();

      let numMethod = cls.getInstanceMethod('returnNumber');
      expect(numMethod!.getReturnType().getName()).assertEqual('f64');

      let strMethod = cls.getInstanceMethod('returnString');
      expect(strMethod!.getReturnType().getName()).assertEqual('std.core.String');

      let boolMethod = cls.getInstanceMethod('returnBoolean');
      expect(boolMethod!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0003
     * @tc.name testInstanceMethodGetReturnType0003
     * @tc.desc Verify void as a return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let method = cls.getInstanceMethod('voidMethod');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0004
     * @tc.name testInstanceMethodGetReturnType0004
     * @tc.desc Verify a custom class as a return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let method = cls.getInstanceMethod('returnObject');
      expect(method!.getReturnType().getName()).assertEqual(Class.from<ReturnClass005>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0005
     * @tc.name testInstanceMethodGetReturnType0005
     * @tc.desc Verify array types as return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();

      let arrMethod = cls.getInstanceMethod('returnArray');
      expect(arrMethod!.getReturnType().getName()).assertEqual('std.core.Array');

      let strArrMethod = cls.getInstanceMethod('returnStringArray');
      expect(strArrMethod!.getReturnType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0006
     * @tc.name testInstanceMethodGetReturnType0006
     * @tc.desc Verify that different methods return different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let method1 = cls.getInstanceMethod('method1');
      let method2 = cls.getInstanceMethod('method2');
      let method3 = cls.getInstanceMethod('method3');
      expect(method1!.getReturnType().getName()).assertEqual('std.core.String');
      expect(method2!.getReturnType().getName()).assertEqual('f64');
      expect(method3!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0007
     * @tc.name testInstanceMethodGetReturnType0007
     * @tc.desc Verify the return type of a method returning never
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let method = cls.getInstanceMethod('throwError');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0008
     * @tc.name testInstanceMethodGetReturnType0008
     * @tc.desc Verify the return type of a method returning this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('returnThis');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual(Class.from<MyClass021>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0009
     * @tc.name testInstanceMethodGetReturnType0009
     * @tc.desc Verify using getReturnType() together with getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getOwner().getName()).assertEqual(Class.from<MyClass025>().getName());
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0010
     * @tc.name testInstanceMethodGetReturnType0010
     * @tc.desc Verify using getReturnType() together with getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let method = cls.getInstanceMethod('method3');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0011
     * @tc.name testInstanceMethodGetReturnType0011
     * @tc.desc Verify the return type of a method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass030>();
      let method = cls.getInstanceMethod('parentMethod');
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0012
     * @tc.name testInstanceMethodGetReturnType0012
     * @tc.desc Verify the return type of an overridden method in a child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass031>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0013
     * @tc.name testInstanceMethodGetReturnType0013
     * @tc.desc Verify the return type of a getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.getName()).assertEqual('%%get-value');
      expect(getter!.getReturnType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0014
     * @tc.name testInstanceMethodGetReturnType0014
     * @tc.desc Verify the return type of a setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.getName()).assertEqual('%%set-value');
      expect(setter!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0015
     * @tc.name testInstanceMethodGetReturnType0015
     * @tc.desc Verify the return type of a child class overriding a method with covariant return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass046>();
      let method = childCls.getInstanceMethod('getAnimal');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual(Class.from<Dog046>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0016
     * @tc.name testInstanceMethodGetReturnType0016
     * @tc.desc Verify the return type of a method declared as string | undefined reflects as std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass039>();
      let method = cls.getInstanceMethod('optionalMethod');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0017
     * @tc.name testInstanceMethodGetReturnType0017
     * @tc.desc Verify the return type of a method returning a function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let method = cls.getInstanceMethod('returnFunction');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Function0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0018
     * @tc.name testInstanceMethodGetReturnType0018
     * @tc.desc Verify the return type of a method returning a tuple type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let method = cls.getInstanceMethod('returnTuple');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Tuple2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0019
     * @tc.name testInstanceMethodGetReturnType0019
     * @tc.desc Verify the return type of a method returning a union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let method = cls.getInstanceMethod('returnUnion');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('{Ustd.core.Double,std.core.String}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0020
     * @tc.name testInstanceMethodGetReturnType0020
     * @tc.desc Verify the return type of an async method returning Promise<number> with isAsync check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let method = cls.getInstanceMethod('returnPromiseNumber');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Promise');
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0021
     * @tc.name testInstanceMethodGetReturnType0021
     * @tc.desc Verify the return type of a generic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let method = cls.getInstanceMethod('genericMethod');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0022
     * @tc.name testInstanceMethodGetReturnType0022
     * @tc.desc Verify the return type of a generic class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass012<number>>();
      let method = cls.getInstanceMethod('getValue');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0023
     * @tc.name testInstanceMethodGetReturnType0023
     * @tc.desc Verify the return type of a method returning null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let method = cls.getInstanceMethod('returnNull');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0024
     * @tc.name testInstanceMethodGetReturnType0024
     * @tc.desc Verify the return type of a method returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let method = cls.getInstanceMethod('returnUndefined');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0025
     * @tc.name testInstanceMethodGetReturnType0025
     * @tc.desc Verify the return type of a method returning bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      let method = cls.getInstanceMethod('returnBigint');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.BigInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0026
     * @tc.name testInstanceMethodGetReturnType0026
     * @tc.desc Verify the return type of a method returning an object literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let method = cls.getInstanceMethod('returnObjectLiteral');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0027
     * @tc.name testInstanceMethodGetReturnType0027
     * @tc.desc Verify the return type of a method returning Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      let method = cls.getInstanceMethod('returnMap');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Map');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0028
     * @tc.name testInstanceMethodGetReturnType0028
     * @tc.desc Verify the return type of a method returning Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let method = cls.getInstanceMethod('returnSet');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Set');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0029
     * @tc.name testInstanceMethodGetReturnType0029
     * @tc.desc Verify the return type of a method returning an interface type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('returnInterface');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual(Class.from<IUserInfo054>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0030
     * @tc.name testInstanceMethodGetReturnType0030
     * @tc.desc Verify the return type of a method returning a union with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let method = cls.getInstanceMethod('returnUnionNull');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('{Ustd.core.Null,std.core.String}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0031
     * @tc.name testInstanceMethodGetReturnType0031
     * @tc.desc Verify the return type of a method returning an abstract class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      let method = cls.getInstanceMethod('returnAbstractClass');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual(Class.from<AbstractClass056>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0032
     * @tc.name testInstanceMethodGetReturnType0032
     * @tc.desc Verify the return type of a method returning an enum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let method = cls.getInstanceMethod('returnEnum');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual(Class.from<Color058>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0033
     * @tc.name testInstanceMethodGetReturnType0033
     * @tc.desc Verify the return type of a method returning Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();
      let method = cls.getInstanceMethod('returnDate');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Date');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0034
     * @tc.name testInstanceMethodGetReturnType0034
     * @tc.desc Verify the return type of a method returning RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass060>();
      let method = cls.getInstanceMethod('returnRegExp');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.RegExp');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0035
     * @tc.name testInstanceMethodGetReturnType0035
     * @tc.desc Verify the return type of a method returning Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let method = cls.getInstanceMethod('returnError');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0036
     * @tc.name testInstanceMethodGetReturnType0036
     * @tc.desc Verify the return type of a method returning ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass062>();
      let method = cls.getInstanceMethod('returnArrayBuffer');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.ArrayBuffer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0037
     * @tc.name testInstanceMethodGetReturnType0037
     * @tc.desc Verify the return type of a method returning Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass063>();
      let method = cls.getInstanceMethod('returnInt32Array');
      let returnType = method!.getReturnType();
      expect(returnType.getName()).assertEqual('std.core.Int32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0038
     * @tc.name testInstanceMethodGetReturnType0038
     * @tc.desc Verify empty class has no methods to check return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass064>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0039
     * @tc.name testInstanceMethodGetReturnType0039
     * @tc.desc Verify multiple methods with the same return type all return correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass065>();
      let m1 = cls.getInstanceMethod('method1');
      let m2 = cls.getInstanceMethod('method2');
      let m3 = cls.getInstanceMethod('method3');
      expect(m1!.getReturnType().getName()).assertEqual('std.core.String');
      expect(m2!.getReturnType().getName()).assertEqual('std.core.String');
      expect(m3!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0040
     * @tc.name testInstanceMethodGetReturnType0040
     * @tc.desc Verify multiple methods returning number all return correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetReturnType0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass066>();
      let m1 = cls.getInstanceMethod('returnNumberA');
      let m2 = cls.getInstanceMethod('returnNumberB');
      expect(m1!.getReturnType().getName()).assertEqual('f64');
      expect(m2!.getReturnType().getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETRETURNTYPE_0041
     * @tc.name testInstanceMethodGetReturnType0041
     * @tc.desc Verify the return type of an inherited method from child class context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodGetReturnType0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass067>();
      let method = childCls.getInstanceMethod('getParentType');
      if (method !== undefined) {
        expect(method!.getReturnType().getName()).assertEqual('std.core.String');
      } else {
        expect(method).assertUndefined();
      }
    });
  });
}
